Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426277;
	b=N+K9t71inI+ekxArpHi5wjEz3SCpTgN8i6LjQfkiRq7TgrmyRQBTvViQIVfgirCd8IZp
	 UWcfk7ORdUZESt3EJ7RUBh1tNlgjUtN9vJOgLJzv25iqv8TfzFm0ypJl7QgQom6ywGu0x
	 BKR9OPE9pcF2IxfcLW/PwkSew6uVzalwEwkUyuVj+i9/Tn1KavLsMY58Q7mJC1v91A9Ei
	 5dqPbIpVP+kFNB3zQdA8NSgX2hTleablAeflsCY2WTbMGhKJ4Oc8bOKtS3s1zy44tRSZk
	 499V9ezttPk2Q0o1Ir6N/B7vOOIShk3UnOyG280RNrXCEm7tgxkjChf601JE7baptMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426277;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=xyDSRZr2KlKUM6APRuIaI7oeA3fNNRMSJmTHG+3kfzQ=;
	b=YRtJ7pRf+oYKG3dfsaZX3qILmjSTSjRSRb00MeE2ZDwdpjvJGG1lB31+7/fub0AjTc1z
	 niUcRnhflFmvMzUjHf/JJtp0YCnoQ8f0VqYMz/mq3shXaJvFlKWXmUGEOxqEJ0ClPBxqV
	 A8urn5D81eZDvMrGxFSV0jmfCPWJMOF6/81YunU3J+JEl0++9wQspqfrYx9xxd0+N0D3a
	 FBGuJHQ9gl2+7XRjXyaIH7/YaIhQAVR00UI87big0wlLTClDmIoQmZYLtOXhpdjOMtHdF
	 pHr2TA9mIBE874mKFw8YFwQsZugTAaS/S5NnpuL6AqZ/bFRYmppyorXfXQKogI/ir0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EbFI4J5+;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0C1606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B0C1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EbFI4J5+
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1760017a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426277; x=1795031077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xyDSRZr2KlKUM6APRuIaI7oeA3fNNRMSJmTHG+3kfzQ=;
        b=TmuB0vBpmutyn3xchRO9aXO7lcbF7DnTPzrwbPFGoVCzwr0Xl5MP+szFzkaWEWVCRz
         Vt3myhnKbA6Tw0gEQQXmQCe8ALH56Fbsj6YpwQqjQ6bdC/TnDD1WrbZvLvThZ94HW6dM
         X3W0lF7KA69rFAH7yGJD65x6MMBscTWGTdFBTF0Sddu0so3xqs60jWgM2S2izZXQvq0I
         rdaWwD3ocbuL+fJvUWa7CgFJOqpLOIbop8VYMbygXeq4oHNQcESFnMZwIjXFSCxEw8fW
         yiesMBIGUSpYaWbQaYzJ8B/gnX00fmyWcXRpLo/7Y9eHRZ63EuCc1GE41RJBw88UxWwc
         0tLw==
X-Forwarded-Encrypted: i=1; AL+hErEKtQKI9y44NrJXnHpmlRqF5pOd77stg1T2tt+IO7PaGa2+Y9SUOhQo2t5VExxAF4q7d3kgSwnT6/OrQhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b2YgeVhpiCBGRyYOy6W7UeSJbQS0R0xGXdhL+Y5w61ea0J116
	GvAgmDpcFxuCQd73lvMg7aTBWL3XQsU1GARFouWG3j3xbgMIXCtHmVNPD0lPJigIJcO/U9ARim6
	KamUUyvo8kzsDEZCalEg9B3/XUgQ8z7LqERFMjZhEUwJMkveE2iGYnpD0aHMqJKc1SVliQK88ex
	dHxR0cVW92JA9P3/vzwfhwHmHXNy/7Winnhiz+bB1IzLwuzWdEpc99Pog2YRm+WTbBUNwA8c0ly
	eUFhaLzX9ZKp8wF
X-Gm-Gg: AYBFou0LYR04gMXJB5BL6CNXg1Luv6qLuBEaFjH6AyFEra13OQC+bExgeqqWs5kWHMh
	jWhbenvWjjRWHO5ZmZ8pgdQwL790oIGqTXY3Lo0jKL6l4KPmb4+d5BpYr+9WDeQjY0M4W0Pa26Q
	zaQaUdFTARzryOghemGDARlsY7o14BkQ7aqk4nQ3DHGa87NxwN+OftufdnbXi+4uFPBvpsny3TF
	cHTBy7kFf4CFU1JYwgLFcElZjQu/yyWwtPjQudoL+VIAM9/Ei2gup26EOxWK9lBrIONvdzsfZkb
	F0xQuirueox926uwSuvVa6/ef4+UvPLnSmvu+nVHIXVgBxVppG7QoYKXnxp3B13od+F8ixC8ofI
	UgwN6F9Uh7vJ307DPX2L9A/RALkBCbzdhgKCCW3aupHbl/HK5BdZAXuT1BxIcAIt1rwW+cUQsIi
	uavJJWQrUtNHF7XxqHI2G2YwqubEKlzw2e
X-Received: by 2002:a17:90b:4d05:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3b182e13d8amr3530774a91.2.1794426276621;
        Wed, 11 Nov 2026 11:44:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197ca0af1sm262118a91.3.2026.11.11.11.44.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so7133605eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426275; x=1795031075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyDSRZr2KlKUM6APRuIaI7oeA3fNNRMSJmTHG+3kfzQ=;
        b=EbFI4J5+mQB00rb8/c7a5KiKo22EjCWRSwFJ6OnPnJj976fixBoPIHHd7210gEsRF8
         sVpedTOFZQuNc1uTGSBE8fQKwVVh5kInsaDD1HADhi2uP0P/M0LpRmNxAVYLvEn9qM7Q
         sF88Hq0v2xGqgauwKW3AVAAMKYuxyrsRq12KY=
X-Forwarded-Encrypted: i=1; AL+hErGwUTvPOu4lGs8fNYwgcCORFWJEAb2Tz6bKiQcgIYTdWdVdL9juE3rKfX5ISRL1DHePUE+ldomZ5Z1r8rM=@vger.kernel.org
X-Received: by 2002:a05:7301:4908:b0:36e:3a0a:2953 with SMTP id 5a478bee46e88-37687512f63mr3469174eec.41.1794426274846;
        Wed, 11 Nov 2026 11:44:34 -0800 (PST)
X-Received: by 2002:a05:7301:4908:b0:36e:3a0a:2953 with SMTP id 5a478bee46e88-37687512f63mr3469133eec.41.1794426273979;
        Wed, 11 Nov 2026 11:44:33 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:33 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v12 0/6] mmc: core: Keep the card powered across suspend when firmware needs it live
Date: Wed, 11 Nov 2026 14:44:20 -0500
Message-Id: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware accesses the
card directly during resume from Suspend-to-DRAM, before the kernel's own
resume path runs, in order to load boot code using hard wired logic that is not
field updatable. The card needs to stay powered and responsive for that access
to succeed, and since it is never power-cycled, it also needs to be reset
before the kernel reuses it after resume.

v11: https://lore.kernel.org/linux-mmc/20261030181034.3811225-1-kamal.dasu@broadcom.com/

Changes in v12:
	- Patch 4: Added Shawn Lin's Reviewed-by.
	- Patch 6: Moved the check for reset-card-at-resume without
	keep-power-in-suspend from mmc_of_parse() to mmc_validate_host_caps(),
	so that the host probe fails on such a misconfiguration instead of only
	warning (Ulf).
	- Patch 6: Propagate the error from _mmc_hw_reset() in mmc_resume(),
	instead of always returning 0 (reported by Sashiko).

Kamal Dasu (2):
  dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
  dt-bindings: mmc: Add reset-card-at-resume property

Ulf Hansson (4):
  mmc: core: Add option to keep an eMMC powered on at system suspend
  mmc: core: Split sdio_set_host_pm_flags()
  mmc: core: Move and split reset functions for eMMC
  mmc: core: Add support for resetting an eMMC at system resume

 .../bindings/mmc/mmc-controller-common.yaml   |  10 +-
 drivers/mmc/core/core.c                       |  10 ++
 drivers/mmc/core/core.h                       |   1 +
 drivers/mmc/core/host.c                       |  17 +++
 drivers/mmc/core/mmc.c                        | 109 ++++++++++++------
 drivers/mmc/core/sdio_io.c                    |   7 +-
 include/linux/mmc/host.h                      |   1 +
 7 files changed, 112 insertions(+), 43 deletions(-)

