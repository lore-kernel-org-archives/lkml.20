Received: from smtp1.iinet.com (smtp1.iinet.com [52.129.46.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E13AEF51;
	Thu, 24 Sep 2026 23:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.129.46.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790291809; cv=none; b=aMbXIN9Kgcm9nCxmseE83mHun9YWmGrhG5jGVSYsoVQ84ZverH5ZQB3M3hCHgSNNHlKiE1ReMi/0PVtcQ5ax34FJgi7NJtJB13ha7k7bD1DEqKJCApTP511MlSiJTexDxGN/ROWiR1riP06Yu630Zm9s3fw1iUT6tg9JBFiUtsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790291809; c=relaxed/simple;
	bh=PSLhlbYW2qK2RwomUjA/BeVgbXRaS3hNStMRN2N3MFU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ATMuSQvtc0UkuPd7zzqZW5j9gYni0GIvrVVOPcKP/RUZxdfgcwVoMOCTVrwMs+TRtLenP2IUnzs+D7hL3vNG3plBt3hSqchKYpzW28Uj6IgA542veQ62Hjwcm6dOhCaOPT0RlKGSj4YbQxbs1XTPxCvRyjtNPTpwBafj5gZKGVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com; spf=pass smtp.mailfrom=nwlink.com; dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b=nUfrtlXs; arc=none smtp.client-ip=52.129.46.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nwlink.com header.i=@nwlink.com header.b="nUfrtlXs"
Received: from porter.hsd1.wa.comcast.net (c-98-203-133-45.hsd1.wa.comcast.net [98.203.133.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kaf@nwlink.com)
	by smtp1.iinet.com (Postfix) with ESMTPSA id BBFBDC00813;
	Thu, 24 Sep 2026 15:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1790290258; bh=2BZ98HwYSo1UgBK3WrlTvHiZ09UnPmRe9Dvr5OYSn9c=;
	h=From:To:Cc:Subject:Date:From;
	b=nUfrtlXs7HzeIOZtzsGuBYbBVTvQLSsyDFRdkIbMxdXg8Ya9JJ+lnjRtngVmbisp9
	 tYitkSm6CHHo+KBZ0XJO2XoxNpVu448Gi29tnJsyjiWiV2fpQiUBP719d1qvSHev3u
	 pC8e+MsnnBEnDgXegIYKEba/KWrIm0cSj25OJEbY2mMJX7RFDbW1wVJLPUncSpnvmQ
	 4BMi0GUacHr1CeX9X9UOGNE3040u1tKsR4FnozKexzvDA8FGE7bGnPxGxNdvHTBCUd
	 xnVzwRzCQgAlKlO5370B1nREvFyPpTzPVTTui3sYoqA+raOAYtJq1MfMndNsW1YwjX
	 jsc99A6EcBhkg==
From: Kyle Farrell <kaf@nwlink.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kyle Farrell <kaf@nwlink.com>
Subject: [PATCH v2 0/2] usb: gadget: uac2: support explicit channel counts
Date: Thu, 24 Sep 2026 15:50:48 -0700
Message-Id: <20260924225050.2837727-1-kaf@nwlink.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB Audio Class 2.0 permits up to 255 channels in an audio channel cluster
via bNrChannels. Independently, a channel-location bitmap is specified via
bmChannelConfig for up to 27 predefined spatial locations. Setting
bmChannelConfig to zero indicates that the channels have no predefined
spatial positions.

The current UAC2 gadget driver derives bNrChannels from the number of set
bits in bmChannelConfig. Since bmChannelConfig provides 27 predefined
spatial locations this limits playback and capture streams to 27 channels.

This series allows channel counts up to the UAC2 limit of 255 without
requiring predefined spatial channel locations in bmChannelConfig.
Existing ConfigFS channel-mask configuration continues to work unchanged.
New optional playback and capture count attributes allow the number of
channels to be specified separately from the channel-location bitmap.

The series is split so that the shared u_audio infrastructure is updated
first without changing behavior, followed by the UAC2 functional change.

Patch 1:
  Pass resolved playback and capture channel counts explicitly into
  the UAC1/UAC2 shared u_audio implementation instead of deriving them
  from channel masks.

Patch 2:
  Add ConfigFS playback/capture channel-count attributes to the UAC2
  function driver and use them when generating descriptors and stream
  configuration, allowing counts beyond the 27 predefined channel
  locations.

Testing

Testing was performed using a Raspberry Pi Zero 2 W configured as a USB
UAC2 gadget. Streaming and descriptor validation were performed against
both Linux and macOS hosts.  Windows hosts were not tested.

UAC1
  - Verified playback/capture operation via alsaloop.
  - No descriptor or behavioral changes observed.

UAC2
  - Verified legacy channel-mask configuration (1-27 channels).
  - Verified explicit channel-count mode with 2, 28, 61, 62, 96 channels.
  - Verified invalid channel-count/channel-mask combinations are rejected.
  - Verified Feature Unit descriptor size limits at 61/62 channel boundary.
  - Verified descriptors including:
      * bNrChannels
      * bmChannelConfig
      * Feature Unit presence and bLength
      * AudioControl wTotalLength
      * endpoint wMaxPacketSize
  - Verified ALSA-reported playback and capture channel counts.
  - Verified streaming using alsaloop.

Changes in v2:
  - Edit commit messages for clarity and brevity.
  - Add Assisted-by: LLM attribution.
  - No code changes.

v1: https://lore.kernel.org/linux-usb/20260729054115.889174-1-kaf@nwlink.com/

Kyle Farrell (2):
  usb: gadget: u_audio: pass channel counts explicitly
  usb: gadget: f_uac2: allow explicit channel count independent of
    channel mask

 .../ABI/testing/configfs-usb-gadget-uac2      | 18 ++++-
 Documentation/usb/gadget-testing.rst          | 18 ++++-
 drivers/usb/gadget/function/f_uac1.c          |  2 +
 drivers/usb/gadget/function/f_uac2.c          | 69 ++++++++++++++-----
 drivers/usb/gadget/function/u_audio.c         | 32 ++++-----
 drivers/usb/gadget/function/u_audio.h         |  2 +
 drivers/usb/gadget/function/u_uac2.h          |  4 ++
 7 files changed, 105 insertions(+), 40 deletions(-)


base-commit: d58dffe9ee2c8883193959ff4ef995ec07932874
-- 
2.34.1

