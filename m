Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237929;
	b=Ca3RmLcc6W01zL0vfcS+XVfeZRHEU1fZ8RP5OlMyKysCEzxklMFLEM0tl63akqV2LWxE
	 9vUMfadMJ22ylV8CaGsixbtdqoflin9/wjZ2aYORZL/BVp09VfoBCXaK4StBTk+FxvMlI
	 QYcbeiS6u/qCiWe2RCwBWoO4B0OwGZSqgK6QgYTcP4uaS/L3AFCHF4oPj6g4YgJuK5Ymi
	 Qq9iuGCiQNsYi/jaGfjS57DxXqwIpB/c/F8c0hRpT5NzqO+bGhM8KHLwsq1FYY/425Y1M
	 eH2XADfHf6Iol8Ep7+MGgzl5aT+Azvtn3hnCNSvdwjvJzqTxxSg98qjmF1iacAVWZEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EOs04QSJXkpqukLkDiiMN3/l/AZfTjlV7qiVUsZE4wE=;
	b=tCbeJYjlIbE6MTIKkEbvqCaMhSnbYrRdybXneypSAi7lEhlL9qYg+FDbaZdO/8z60stp
	 pyhBSzRF5L9kRRA4sMfSUU/Yo29wmI70tnwO2gSv3tyz0HLm/ynGudmikFw8voR69i7hR
	 U6bjMt44hEevovla4fkdmVkvTZWTT2H7SooWSCPoqXKXQrPeROVFUMYJZIVpeXUu5Ir/w
	 Kpk5AO4g2hz8hyguQFEXbJt7v8dQ6SL3t4AAqp+b3yVoKXYNpFTqwh4MEg22lExZd7oIE
	 l/1IWfcL4PdP4r+dwgPRIRQXd//W2ZFEd0i9c0BmW6zFPjzina3aqSX2b4QbgcpTY/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grk3GLND;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9CE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grk3GLND
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df54150dfso925655f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793237927; x=1793842727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOs04QSJXkpqukLkDiiMN3/l/AZfTjlV7qiVUsZE4wE=;
        b=grk3GLNDCCoeOl1TvUGmpR8xJPm8Z4YDkmEpvSd+S6BYMJm859V9LcT+pBH+rGfgrQ
         JrBGAFMGbyq11Dh+Vr/VLtSqAYnnrNS3gUoxraHyEs0gSlIipr9qTCYN5jQVspwzIQWV
         osth8sbzSEgaG6hFpuPlxfV1KveQTe45a2N44VdAuHfTQuIaZpIgYnYVS3z3hK+tuPy+
         TGmB65KBOd3dXZl+UT3epg9Nv+Z1M1DG0oap9YiVnvzzzyuLvmbJEW917s/5iZ9dr/7f
         CoWS6ObSIGhsHhgUVHPoaMh9trWc0pC2auq4IOGHx+JUD88TAzSuZMls53fyOUQcSEJM
         GD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793237927; x=1793842727;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EOs04QSJXkpqukLkDiiMN3/l/AZfTjlV7qiVUsZE4wE=;
        b=a3eHA1cYhmUf9ohVIg45sdWdNBr0ZPV0mq9p056j9TF7ATYd8fusN9T2cz1zhdNimj
         CEOgj62KCI7w8qTZJn1HrMh4DWaMz9C05A9Xi3cnEVmJdpC61+RNFy3223ZgF1mBaLnh
         yiQAYxg9H3YGWRCXFb/jFWnKp6N/AZTGf8Kcd9tLHRaqRBSgkueraJcLDLOJPJOfTZjs
         +nUpPQsIQUmof1QPUcsaRD7MslFT3vdVG8Tj2Be9mZrl/HTeuKfMHQ0OFdnHAI8doOgA
         NZLdz/fKaqTxUZ8qxIZAo6x/g2r68asqUxM2gbhUmJSIrrdQYeDpQoYooYpXzikbWnzC
         +Yhw==
X-Forwarded-Encrypted: i=1; AKwUvBxcguE6JkgzcV3xR47TZYb9+KiIGj+EQ1CIxl1QGJk9OOGshRsbibIo0RnebswsYsIhPj3Cm786ThOCyT8=@vger.kernel.org
X-Gm-Message-State: AFq9FYItUZ0EOE9PxWvp6UNnJeJ7CPylqujegMqVF+Yd2W3swMNcSHRl
	kqkc9MWFMoBO8Z5v98lEme69LTTglQQqNG9ED3ZCWWJ+Vukv//AoYXvN
X-Gm-Gg: AYBFou38F1pdxjhknP6aMdUWIJHetAgH/TbnwpYwMKuFFIVtfqQ13mxe3YZ2q0zeEAn
	qiLHx4DQ48/C+iLtFRY8/dQd5OL3xTRhuE/PZ9Gb3Jkjux4OP6GcXnZK0WNumw6QHSJibveJ68W
	+RJQU4RRQyZdYoirHQ+KvtRcVUNwVxe6zC0qaPQa/iqSK5a3DZ8BrJmxPz7EuaboqfuaVb8o/u4
	HaNGK0k0AXwn58kaoE3efCv0yFn7BRrVzhDCsQffsTqMZQ5sbcIItwGmzw3/oq3gua+zWffFukq
	Gsx/rDRq8aTq/t9m1Fgp0rswBq8ziMxlwOxW+++jFgQdBPBI/fOVFrS5yfu59QATAwEiuabKZXR
	IrLenucbAKDlOZju8p6Z7WfQthDvm0K6bsId9zhz1qxzQCudnLNEhdpU38W7H67z0daPZjxahOS
	hGn3Ku68Ho0JyBnexdwLKHFujJ8yV3jDcLPvXqmlnQaoMq4KKbT3oZpAtdbFwonMBCf1SBG7zZT
	EOw9n99Y2iVw8YJclpsTp4HWiUYuutmIfoED7rgcv3Bl8NBRpWCV1ooD70SznA/+OlSqy2Ipjh6
	03UZlbDr4pJ5RDWqVIJMaDoZ/JsCFSrBnkrnhMxVLjM8kqIg4Mi2r8T7F03masqvgDc5CGHF1PT
	fmGCmAY7F/0zrX65sxlbolYE46N0XvKV3ltV7nNrhvbqzm4ivxwMkY87GmncORj8mOqebQQGg/I
	PRQQ==
X-Received: by 2002:a05:6000:719:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-48e5d5b53f4mr9121122f8f.14.1793237926737;
        Wed, 28 Oct 2026 18:38:46 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-226-156.77.7.pool.telefonica.de. [77.7.226.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm34154098f8f.48.2026.10.28.18.38.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 18:38:46 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 0/2] Documentation: Restore device-ID documentation
Date: Thu, 29 Oct 2026 02:37:15 +0100
Message-Id: <cover.1793221199.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This v4 addresses the duplicate PCI declaration warnings Jonathan
reported on v3.

Patch 1 retains Uwe's device-ID documentation restoration. Patch 2
corrects the Chinese PCI header path and preserves its existing plain
references. The kernel-doc blocks added in v3 are dropped, with generated
API documentation deferred to a separate change.

A focused Sphinx 8.2.3 build with -W includes the complete English and
Chinese PCI pages together. It reproduces both warnings with v3 and
passes without warnings after each v4 patch.

Changes since v3:
  https://lore.kernel.org/r/20260908070031.32833-1-kmehltretter@gmail.com/
- Move the Chinese PCI changes to patch 2. The five files in patch 1 are
  unchanged from v3.
- Clarify the ACPI exclusion in patch 1's commit message using Uwe's
  explanation to Andy. Only ACPI_DEVICE_CLASS() has kernel-doc in that
  header.
- Retain Randy's review and test tags from v2 on patch 1.

Changes since v2:
  https://lore.kernel.org/r/ede7ce64f20e10660ebf6bc1b41836dad750ae3b.1783349758.git.ukleinek@kernel.org/
- Use the :file: role in pcmcia/driver.rst (Randy) and explain why acpi.h
  is excluded.

Documenting struct mei_cl_driver in include/linux/mei_cl_bus.h remains
a separate follow-up.

Report: https://lore.kernel.org/r/87h5jq8gia.fsf@trenco.lwn.net/

Karl Mehltretter (1):
  docs/zh_CN: PCI: Update the pci_device_id header reference

Uwe Kleine-König (The Capable Hub) (1):
  Documentation: Update after split of <linux/mod_devicetable.h>

 Documentation/PCI/pci.rst                     |  2 +-
 Documentation/driver-api/basics.rst           | 31 +++++++++++++++++--
 .../driver-api/mei/mei-client-bus.rst         | 12 ++-----
 Documentation/pcmcia/driver.rst               |  2 +-
 Documentation/staging/rpmsg.rst               |  2 +-
 Documentation/translations/zh_CN/PCI/pci.rst  |  2 +-
 6 files changed, 36 insertions(+), 15 deletions(-)

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
