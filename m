Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660760;
	b=bt2vDjfKU14MDM3htKOgyiU3hsmS9o2QHeTQSVQfER0Np2ozJCrW/esMw7iMldSmDE9R
	 YEFTqV8MHrUpEjZj1u01tz1wf3GiqpJGItcUFVMhkqm066JgktXnQ7vDuaFVuFuOw8LxI
	 zJU13yjHt9SY3ii/TpdmGTNQS1XVkXvdujsPZWKtBzUFNWTpeuxOwSW71F8u5XYic0o7C
	 Ny7qhNZiH2a9BpLDFhXSmv6cLmKra6ALjNU2QWpxfD6ubfGtOFWEWPba6xhETCipfnDKz
	 NhVz7a+FisNQEXJrDuUXIRhrI3fLIzK2kG33syluoRhkiKL/LYE3A40skNS9Ch7McRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=x8jM4tAINOfg6rs5A/OqB01VfXYqFURFLCrahQ+gFPg=;
	b=Ca5HWF9aEFTj/cWdHa0ReDikdZS4osY/ysIk0pn7U/u2MPgFdKz2m1aUWQIfL9PpkvVd
	 mbdCvxrX1ivxlOLeesa12bwMZhcS9SdbmUMzKAW0aq1VE6BcIpiRC2Nw7FhYv/rTHu0am
	 OjcqQR1d7vEw7j7RANhZ/v1ojMHSR7IVUONw6mdDaSZPtR+XLAlKAHXHy/hHQxPeB6dpF
	 PNoqLDxpYbGsNvK9DJK8QiU242/tsBKa51GdVDeQAK+aMZe8fwGKkX+pRgQa/oRuche01
	 iMYZzBfX/8Ogi9CnD6rexcMt0nNUxSvGYgHEzr7zLswWUrnZVIF64qen9wHlj5Lsglw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=XdFZXixA;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA1606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95CA1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=XdFZXixA
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c45551fa84eso238908466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792660758; x=1793265558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x8jM4tAINOfg6rs5A/OqB01VfXYqFURFLCrahQ+gFPg=;
        b=XdFZXixAP3+1xIqY19/pqmBDJ0RWMabLR5crxFylDucQM0LfrtTJ3IvNWyXLNulwAW
         LWjaTt/NwVpCvEV/Cld+WAICdUHyvhfhunyyn6CSy6hhnyrPR9cY2Lpoj7HMFzJbjUJH
         pItVH3nhGL6vFiJRC1ESOPfvzgIepgzPk5zS/SPOC4H8xov/KpBmnt7WgoHe5nwbRp7d
         oQSRfk240nnZbeSIIeRNz3gQzgqk98dudyxpvENRsSVkwJyYi2DIgKCRrZAqPBN5s1VE
         amgTaHVi6B1dBaPFMUmsXTJKshCrGbHc9hWOC+GQqEAMllqXJ3/dI5qYPcANx0Q8qUOD
         YN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660758; x=1793265558;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x8jM4tAINOfg6rs5A/OqB01VfXYqFURFLCrahQ+gFPg=;
        b=0p7dJxH9h3UpKfCZm6ZS3c9CkG5Ue57Tr9KpOmfrrWSAgnkKC05cIviYqeyTw61TcT
         T19hJaopG/FiiMBdHrHsmlaQ6ot+Nj80Gl6M81uykTAZGZVzjd14LRVa4GtaTi06rypQ
         gppeq+GJ2M0IoFfg8Me5nXlsxG0Fk/DcTLOA7WDUnhoY1/yU5+24nDc7GweK7nEYEbuy
         4dtT7JWHnBT3hkh76ZZKg8REMOHMZNqOoTuOfqXYlGCmrYtHagD+87XXm485PehYz1S3
         za1s8/hfQ8VU4b3yImGf/Au6Y2aFI25M7dhWOT3dpurMpAeHdIDIJPbELFCuBjcxcLte
         JV4w==
X-Forwarded-Encrypted: i=1; AKwUvByBrBKiSrPlL03X1YrKB9pkmcF7hhSzHJHkKPpK1Z6v6CBhgChF5imVd5ooLhnPBS2hBT3QsNNnfEsALKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh+63LzEZT4KgnIrUAQ64g1spHmkekdc9zqQXbUAe1wpeDmaUu
	JG2jYTUCmIVleFKHc0w5OhYFOyjWzbHAU8zrauVC+Ov6HIBlyd9+Guzkcv8jMbzuVdQ=
X-Gm-Gg: AYBFou1TwLuV9o+2T+2HWVDL0seiiNaB1P5FUyR9yQ8ug+rw9HbqiAVrU5CQH1s37RR
	nl/PD28dcCZ2xvtwub06JxHt8X7jVIDJiQWoSgAKHEDTNXdnJGwQ1jV48kA/Pp1MixgUxRqI7K2
	DhivDvaiGGnbsVL25sBLMxsM+7nye4lR/E4TLODkmrf/OJL7YB1H+aeMGxEQpnW3JESXnyFP+oA
	A1nNVcXE5HTNEdL1f/3Af7LSqMC55BQ2Dhx+ct6GYP0khqoUfTok80CUDn+xk+e/hMXpc5UHvUH
	KfL6Lh1JrR5CrxtETDMB5bg8McWl1nSb5B/FWUum4Wa0aiBjmSJNVzMBe4rwf46+nohsedMff2+
	Lm/sVE+XzanUU6Vq5kPhnktCxCpvMVa+iG2DgCOzfkgqgnyLvAvyt/aTm+Xyk2MLig4Uu19hWky
	UWFAQ4Cfc4+P7/2FLvBFSfHI1sNRHGCDiWiZfukP/1pkTWdQ2dVv/E9RX9R8gtsyC68NXWicrAb
	6nC9v36XOhG0ua+9DdT8veZYYv3BGOR1Ree8za6Ff4repRP5J4EgyzKALhZsLs1XCnOLJfOJmrs
	nzvcbyUSanWnLiawGX9P5Krop1k6tjRxD7T6bPKr2QA5QwzoYhSy8e2nopft6c5p1mwLB9iFxiI
	BmmJ/wkftaES4t4/KNNNsmG5KBaNzcmdrIpH6DRgKkXg8mjIZJlq7Q7ZGgxe2oIJsmhYjgVBQs0
	EWZ10yVXe37+SFDQ==
X-Received: by 2002:a17:907:1b0e:b0:c3e:f39b:2296 with SMTP id a640c23a62f3a-c4679620f94mr494323166b.31.1792660757898;
        Thu, 22 Oct 2026 02:19:17 -0700 (PDT)
Received: from 2001-1c08-080f-fd00-57f9-c36c-aa93-fd36.cable.dynamic.v6.ziggo.nl (2001-1c08-080f-fd00-6fe5-b143-671a-f202.cable.dynamic.v6.ziggo.nl. [2001:1c08:80f:fd00:6fe5:b143:671a:f202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50aa01sm85790866b.22.2026.10.22.02.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:19:17 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v3 0/4] AW8695 haptic driver.
Date: Thu, 22 Oct 2026 11:19:14 +0200
Message-Id: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABLV2WoC/32OQW6DMBBFr4K8riMPNjbOqveoKmRgKLMIkDF1W
 0XcvY4jdVGpXb7Rn/f/TURkwijO1U0wJoq0Lhn0UyWGOSxvKGnMLGpVW+XAyvDRWt90c9h2Grp
 pM93IlJCl9s5oQO+sbkV+3xgn+izql9cHM17fc8P+OIo+RJTDernQfq6SO2nJgxP37ExxX/mrr
 EpQwmWAB/P3gARSSWjs5BqTgz48T4F4m9cFT7mliFP9IwOl4B9ZfZf1o2578EaP+Ft2HMc3/bR
 PzD0BAAA=
X-Change-ID: 20260716-aw8695_haptic_fp4_driver-397431e97638
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660757; l=1833;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=CeRNtKXwj6aaH+FnAhN1LCI5wbPc6KwuhA86xbBDykc=;
 b=eNrI3Wlge9SCKhzCcm+PxA35epMAcHqYm/Df48RSkdmGmgrSpp0fkkl+DYQ5Rl98R7KcvsnWB
 kPzCfRn6rVqBYF8l+Vq4D/stBObWcSYlb5RtMptUR7WNU0qh1YZODAr
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Clean-up of the aw8695 haptic driver patchset that was sent in 2022.
Variables dependant on devicetree have been hardcoded, and unnecessary
functions have been removed.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Removed potential race condition in power management.
- Fixed dt-bindings.
- Added MAINTAINERS entry for the aw869* family of haptic drivers.
- Link to v2: https://lore.kernel.org/r/20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com

Changes in v2:
- Added power management.
- Reformatted DTB schema.
- Removed unnecessary IRQ dev_dbg messages.
- Changed reset pin bias to pull-up.
- Changed error handling to reflect subsystem style guidelines.
- Link to v1: https://lore.kernel.org/r/20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com

---
Griffin Kroah-Hartman (2):
      dt-bindings: input: Add compatibility for Awinic AW8695
      MAINTAINERS: add entry for AWINIC haptic driver family

Luca Weiss (2):
      Input - aw8695: Add driver for AW8695 haptics
      arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695 haptics

 .../devicetree/bindings/input/awinic,aw86927.yaml  |   4 +-
 MAINTAINERS                                        |   6 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  26 +-
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/aw8695.c                        | 805 +++++++++++++++++++++
 6 files changed, 851 insertions(+), 2 deletions(-)
---
base-commit: ec8bf8280261294a9b9b4520414b42704c7f9f6b
change-id: 20260716-aw8695_haptic_fp4_driver-397431e97638

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

