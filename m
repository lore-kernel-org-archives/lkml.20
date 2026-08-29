Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C1F39A7E5;
	Sat, 29 Aug 2026 00:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787964621; cv=pass; b=q33VwrsM3/Jot549MqtDnve2ucqDn96MevfqvRh/1KNPvrKXrX5vA02r/rjEWs5MGVA8SJSf5aFl3jm1Bty+BD1vNVQ5WhJ6DN5+0eac8Wu3WuAq7BR/BsgsCG3st26XWLO09ZKrE1QfN+XzGqJNAIWTaQNgeZSm8OcOHrYkZXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787964621; c=relaxed/simple;
	bh=nsk/g26GGnk1xBzs6GWsKjk6GzaiFGL1pRptgeDGRig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WxF4Fo/XecVz+LEje0cNrfPnjjaTFVfYn7bVpISAAtoriiuKHEOTuK/sInlElyvMwrfA8VMtcjsQZiOj3kZ6eX3A7Newt7Uu0n4Bij+qtmQc0eOAQ9Wl7snQpySJ0zXgeXwvbqHfV51niB6UCrY/IRmGgfUicZwEXfSXPBV8DHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soh.re; spf=pass smtp.mailfrom=soh.re; dkim=pass (1024-bit key) header.d=soh.re header.i=jon@soh.re header.b=LCh+ECg0; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soh.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soh.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=soh.re header.i=jon@soh.re header.b="LCh+ECg0"
ARC-Seal: i=1; a=rsa-sha256; t=1787964608; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gXRWqR3/EYahDm0IKbBRovTHSAorWZFAsy/tegD05kfvZ++ENJIAGiU1Pwb2RjQ5G4zfqZ4cHT3slWou0qt3rZNgZhaujnZYTY0TUA3b8uBG9CK8ElhnaXlmqtRWHChidRbjNGcBFGZUkGFu/luib9EZow3s5xBdzqD9WTZNu2s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787964608; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=chdB9gJgGbDh2Rxt+4DOO0FjOpsLvcibBFy35OinpYk=; 
	b=Sto0VXEaHKmQ61w+Bq2Fx1B/HLfKzRR5HMUZsXpYdESMXF/TEzOwBKW685UwIVNVMKi3ZgR5Y4XO/j+Wpvv2SgLZfohZgmryb1EnEDqjobKQ3h/ftL5QkUYYOoI3q1iHMGf5wrAGIiQ6r4ev4vXt/kU6dfJL+KrsGc5//jeT5n0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=soh.re;
	spf=pass  smtp.mailfrom=jon@soh.re;
	dmarc=pass header.from=<jon@soh.re>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787964608;
	s=zmail; d=soh.re; i=jon@soh.re;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=chdB9gJgGbDh2Rxt+4DOO0FjOpsLvcibBFy35OinpYk=;
	b=LCh+ECg0s2S2Y3sMmooqhonG6DbIfvzcUJ+ncGUlupzuZSe0Cv9500+2iXarWhjm
	hNvDF+eEzDSSJRnn++yjMK6uFcaGHnCm+o3ZUU/aFWVUX3JMKSWCzmZUrNl/8cnCBGz
	mRWTRmJHXGdwpdfOpAkfqbpQ5PvDC2uDHvRnKdVM=
Received: by mx.zohomail.com with SMTPS id 1787964605303948.6260087826266;
	Fri, 28 Aug 2026 17:50:05 -0700 (PDT)
From: Jonathan Seth Mainguy <jon@soh.re>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	niklas@aldervall.se,
	linux-kernel@vger.kernel.org,
	Jonathan Seth Mainguy <jon@soh.re>
Subject: [PATCH 0/4] ALSA: usb-audio: support Roland Capture sample rates
Date: Fri, 28 Aug 2026 20:49:57 -0400
Message-ID: <20260829005001.534571-1-jon@soh.re>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The fixed quirks for these devices currently describe 44.1 kHz:

  0582:0120  Roland OCTA-CAPTURE
  0582:012f  Roland QUAD-CAPTURE

Add their 48, 96 and 192 kHz alternate settings. The OCTA-CAPTURE's existing
S32_LE format description causes the white-noise playback reported by Niklas
Aldervall and other users. Change it to the packed S24_3LE format used by the
device.

Expose the OCTA-CAPTURE control MIDI cables and synchronize the hardware clock
with the selected endpoint rate during stream preparation.

Tested on physical OCTA-CAPTURE and QUAD-CAPTURE units. Rate changes followed
by full-duplex streaming succeeded at 44.1, 48, 96 and 192 kHz on both models.
External digital clocking on the OCTA-CAPTURE was tested at all supported
rates: 44.1, 48 and 96 kHz. The OCTA-CAPTURE disables its digital input and
output at 192 kHz, so external clocking is unavailable at that rate.

Reported-by: Niklas Aldervall <niklas@aldervall.se>
Closes: https://lore.kernel.org/alsa-devel/6b623cb6-3a9b-4fe4-a57c-9a165d261692@aldervall.se/
Signed-off-by: Jonathan Seth Mainguy <jon@soh.re>

Jonathan Seth Mainguy (4):
  ALSA: usb-audio: add Roland OCTA-CAPTURE multirate support
  ALSA: usb-audio: expose OCTA-CAPTURE control MIDI cables
  ALSA: usb-audio: add Roland QUAD-CAPTURE multirate support
  ALSA: usb-audio: set Roland Capture rate during stream preparation

 sound/usb/quirks-table.h | 206 +++++++++++++++++++++++++++++++++++++--
 sound/usb/quirks.c       |  74 ++++++++++++++
 2 files changed, 273 insertions(+), 7 deletions(-)


base-commit: 548e7bcd0c5460ddcbca9600cea603ebeebf4da7
-- 
2.55.0
