Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C283390990
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858337; cv=none; b=cFlRlXsJ5sxMZUO7QHPgUisc1/O39oe1mSUwytRVCDMH/ItvSVNzIl5vm4j+MDyxfsEoWtUWKDGT9TxZ53DzyQFsHSF5mmE12hrnn0dFZLUOcraqdaPIOCFiV91Yn8GyDq1EVVHVJMv7vo8BELjDFtUs2Ne3Yx1Mrw8pN0Ik+/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858337; c=relaxed/simple;
	bh=LH7NORxv66FEX3jWbIOrRO/sqHn5Y0T6wUJ1L0gRjAc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e4Lz3ApDccg2GKIqlK9qaIrgK/osCzqWJLFbjab3HVlEjooRcELWxWT0SxqIqysBJJRq/Ivb+0m9pBb7D+p30djNl6MwcPWpN+VPm76Ywn8i/yzxypuUKlP01q12d36wHNPHqCttyxvGBLeYYojqF26wMlUdU7mUpg7TSenY0FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=20SdLa7/; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="20SdLa7/"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e2050feb1so312769566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790858332; x=1791463132; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OUyuclWQzI//VqLPH9CkNGa/oPcpJlozfgVYmGJRkxg=;
        b=20SdLa7/20FjJtCT9zY2doakqfF+431cVDD/as7w5VVDZGsKq03i3V+N+XDlz8vj38
         mwSQMe+ZerQqLcIK9Obr//n8k2ynXnWcjQMfr4EaAsLsb/pL3EMGIrdCKPNtinDMCr8h
         j7eEQhYSwwIOWu7w9U/+DXBEd5Xow7afwcke0GiuALjEm2vLOUu8gJ5eI4EOdEUKwwNX
         w2t2MnriuuT2c8wFU79rmYAh9Y4CrPBya9eNW4X3HoK9nq7ZuZA6JWaM8kSCJ+xGB+i9
         qcevUqnSwyAKhTCb2ZTD3HUxHmm8VeBoeCnkZAdmSKRXjMfxOJXQQCIvSn1oFDDR+su6
         qFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858332; x=1791463132;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OUyuclWQzI//VqLPH9CkNGa/oPcpJlozfgVYmGJRkxg=;
        b=lqyYwUyvESZetJ8kLrMsj4T6zG8SDe6fykjZyRPen9zDchI6Z1lg7MfXMp7UQy9jXd
         EkL4tlkBJQmZ0Fl/jLT+dVk8BqjbAK9V+OfwqZOF+DKDQ44e4nJ7rNfMkWlSTRLBb/ol
         Kv0iTB0cuim2zPTi01kL7mbGswZSc743JfHYdJr2R3DPVo44oXjQ7L/cScnIVDQ8iSCQ
         r9KVK2E778H1yKT3hVIH018Vcy2muGSZOZeApReEncbyMk6eAzsYtDk7K9lkn3hP1WJ/
         WMFBmNUGiBzH3K+tAY5SYRb1IHO8Oo3uWLFbKlcy0HX6DcUayx7OYl0AtoQkhgwIGSFX
         AmuA==
X-Forwarded-Encrypted: i=1; AKwUvBzQbw7bRIwYrXO34pw6Hndr6cXgMX6qPfg2BGIZpXUc+R8JbUCgcVwyUXddcZdfsQb1u21a0R1QdMlldCI=@vger.kernel.org
X-Gm-Message-State: AFuF++nA8UDuO2jAxg+WHz8clDMh2RIPUQYqGAuCrpbcxDb5UBKmRRIz
	NqDKh1vJaYq2S6heGixpbV+XnU6sf2j6QVMpSa35s0QDlacIpgJmIDEIz6/aEhDr5mz+ot0QwD2
	dx95Z
X-Gm-Gg: AYBFou0OqpScY5Jex0L3W3fkjeiWt3VGJheYJX7fYx+8nbx2Q3xxllVove8Rx+8T+Kp
	IdPBLo9+N1l9+Re99ZzoL0pzZ33jYXGE1gGH6UaGV0aOk4yZLCKaBv9UhlIZjTGSftuyX4RKxn9
	M3JPErU1EEkRMAElixqPRS6ivblsa3mvfWCEN2BaSAJMtMIQXKP6L1yEHQxpRvAfAOCw6ols89l
	E7jHOAA8bYHv9dQShPLl6j8HlOEnTIVkOHMlvuvxsRW/UkJRTd+5Q5hmD1xUIMvla42PYyvOKvv
	0AVlQMhZs7HmbpFM++TuIXAIXIqm7FRLmM+x7c5KZtJqV3z5iQH43b5hIlGWb7wBw1eLD/hcoiY
	Mppe83Ujy3n4qoi996peXy0Q44gEV02NXYvRabXUCYxF/p9ifal5Ot7IhRHNz8TMePlzeY671ky
	J9efQ0m3iPADHAdqMJb2W8d/xYg1azANYyb0JD0H1TEHyf9UmOrBqZf2pfk1y0wSZDvNQaZ9cMd
	+77cen86/nK5P4b6xizUBIxbzS/K9GU6DUMBYXodaQnVCRzYitgsRXj
X-Received: by 2002:a17:907:720a:b0:c29:6136:9f66 with SMTP id a640c23a62f3a-c2e23ca277dmr381283966b.14.1790858332210;
        Thu, 01 Oct 2026 05:38:52 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c8ee1fsm150346766b.24.2026.10.01.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:38:51 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v2 0/3] AW8695 haptic driver.
Date: Thu, 01 Oct 2026 14:38:49 +0200
Message-Id: <20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFpUvmoC/3WOyw6CMBBFf4XM2hLKo6Ws/A9DSIVBZiHgFKuG8
 O9WWLs8k3vnnhUcMqGDKlqB0ZOjaQyQniJoBzveUFAXGNIkVYmWSthXqUzRDHZeqG36OW86Jo8
 sMqPzTKLRKish1GfGnt7760t9MOPjGRaW4whX61C00/1OSxV5HWeC2wJ+2YHcMvFnt/JyD+8CR
 ub/BbwUiZCF6nWRh6Cx594Sz8M0YhxWoN627Qv3dkoT8AAAAA==
X-Change-ID: 20260716-aw8695_haptic_fp4_driver-397431e97638
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858331; l=1438;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=LH7NORxv66FEX3jWbIOrRO/sqHn5Y0T6wUJ1L0gRjAc=;
 b=EnZLRLKhoakjdmWYHztx8sNsElJOrI+eqDJC8ddS0p31KWyRFj0dzH7nU9U511OQ/Yr0lhH+X
 BCjRVrfoRnTD1pbn+C3jVQcqzyZBrBQBGkf+qNklvlPKNODC09i5+V/
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Clean-up of the aw8695 haptic driver patchset that was sent in 2022.
Variables dependant on devicetree have been hardcoded, and unnecessary
functions have been removed.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Added power management.
- Reformatted DTB schema.
- Removed unnecessary IRQ dev_dbg messages.
- Changed reset pin bias to pull-up.
- Changed error handling to reflect subsystem style guidelines.
- Link to v1: https://lore.kernel.org/r/20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com

---
Griffin Kroah-Hartman (1):
      dt-bindings: input: Add compatibility for Awinic AW8695

Luca Weiss (2):
      Input - aw8695: Add driver for AW8695 haptics
      arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695 haptics

 .../devicetree/bindings/input/awinic,aw86927.yaml  |   5 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  26 +-
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/aw8695.c                        | 803 +++++++++++++++++++++
 5 files changed, 844 insertions(+), 2 deletions(-)
---
base-commit: 5a956dde5526a634dca7ccad27c051ebcc306089
change-id: 20260716-aw8695_haptic_fp4_driver-397431e97638

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

