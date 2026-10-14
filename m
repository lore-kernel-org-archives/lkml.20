Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807693C3F7B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973604; cv=none; b=JQAHHviimGmvIcrpk6FA7JpU2WkFuSWMNgkW6Wvc3m1v0S23OVANwjMHgWP+W6n9j0o9hl0EPPo1nrOrusNN3870R9DwYefyovwtlrx90Gc85aXAklOOf5qkAMMf4H5rJ3nugoO1ysJojR2FrnV0ZWnZLcbHSnQJ3YeLwvZVl8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973604; c=relaxed/simple;
	bh=gDHWDcYK2QanyrU6NUlrYkRMYYGX2rjQ5QCZVztfKm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l0du2Ya4nI8IQ7Zfh8nwmZY1JqmtZxMNUlQcb7uln5B8D2JYFFwapxjuE80byv688Xy103ZysflPbf2oIQOteJcRfZIcIsQ2Sjj2n29mJgQ3KCMiLEq5yw6fWRDqqBT8onuc5EzJD7B2Hl2ODuGyKaWhwvZMYxu2fGwCzOd2mSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=HZmzA9FK; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="HZmzA9FK"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15354aa70e8so1935177c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791973602; x=1792578402; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VtYMXNbVtRfmsxMVZSkEhD6PvdF6VjEcdjKsoIPRggg=;
        b=HZmzA9FK3zrHTkW4DfCUm2VzdcaBZVk76vEuwF4i7CSulKYQFWFRA/Qivji5PXtiJG
         2h9VLIOntuF01TwOHsVor4d7TWh64XCFoI2zx5EpIp9IDA2CPbCDtaMkuBvROaOXmlMK
         7ulaKgJYPGR84YTPyizO4rfrxCupcMgRW9AUsREqIBZ0IJGhQl9zYrBkmAvK3Kbc4FO/
         GqcxL8w6ceMfTVAje7iuc+WWSAcvDxNlfmHIBXzEp+jqs1InuInetKpwr27cG3+Tf+Eb
         NKtim+l2TQk+PlSlfFpmskkOB/63jDHqx+nfcXodbvPvepo5U2+FK+WmjxLlNAtx28LQ
         /s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973602; x=1792578402;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VtYMXNbVtRfmsxMVZSkEhD6PvdF6VjEcdjKsoIPRggg=;
        b=SdJUAVG5DKwVrUdT0d2NjWJSPJC0+tehvMldGZGeg276Go4PYyL/eoB0NTMUK/uHMR
         YKI8YRgYi/DxanXRi1+cgwKusV0k/OAVwWtcQ0X1KuCybTvIOWJBfjMxk20PVZHmva4G
         zgv9i7ux/fmwbteuJXRyMmqTtogiVOHRMQIM/ZZUuCI3zuV9alRr+eon69vxHN3QFjzk
         ruzuX7osKCdu8DPXXpLFLbEQmxRD7l7qCakZ6lWejKx6+ZtEfS9Ds+HoCdqcePcyEE9/
         pn1AH2b0f7+5C9/8+HW3t6hZknCnUv1GcgZwwwL59jn4S1dRTOPT+RKv02kU9qtY/RLF
         UVlw==
X-Forwarded-Encrypted: i=1; AKwUvBxdTIFAgH0Vguw5vadYLBvLchuPIez3I4YdEKGZ7/CNLLA2/jZ7ygwMjq8ivg885WLfsJLIwAgxEdwQbdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdUCAM33Jmtsx3UYiOhmtKGcGi2UAFrSGb2I4vgVeD4qfB1RWO
	m5s67Oup5OyrAj9k8Fl550cHzpTTqFdIIqdBRadYTqVaAUxaydz7Chm+uQJZxkFC/SmUQfd07hS
	UrFZK2MXDsA==
X-Gm-Gg: AYBFou2i71hASOgmltc/rLXACu0dUGUWPV6X7OPPdSj+4qFnuAYA9NqRcg+P7WBDZRm
	b0aJxJhVWvwqIA34YuVhhiTd2msZsGgtWo7o2T2qd4bWUWqIoLU/rgpj6ihtwZ3qZDYhNymplLz
	A+RUNX3NiVnfPu05UHfv+/0vONSZH2D0jn9Pp7RqQwTeuPwD0CcDhSlpENCm4vs02zYAL0rALCo
	Fi48COtWOlfLufIE3DKW0pB4ImmOQuBp2raOLhDzaqEAEG8s+bsROZAqQ6n9IpA/ZnGahbaxuNl
	2dB711JLYT2S9JCK/2Z7j9qbac3zb8lTf0PvnNavzGP38A4JHXC+Xm/ORu4gk2IlOTUMYTrerEH
	I5+I0e4OrmxBt6/JhEmjn/Vbt/7Lg1cRoPIYsNMdilFKoJAtrPWiieoAT7oIoD4AUlX76E4k2iu
	EL/wE4f7lxztcdEvIi2oGdsvnb6vKClOLa5ec7ZhDAzxqyub7/FGbfiPeyTaz9AhXqPWRTVY6Aq
	tjPFDC5/fCuvg==
X-Received: by 2002:a05:701b:450a:10b0:151:bbe4:b6ab with SMTP id a92af1059eb24-16a5ed3d9bcmr20307029c88.17.1791973602335;
        Wed, 14 Oct 2026 03:26:42 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:bf23:2386:c0c:815])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm70318219c88.18.2026.10.14.03.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:26:41 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 14 Oct 2026 11:26:33 +0100
Subject: [PATCH] iommu/riscv: Use named initializers for acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-acpi-iommu-v1-1-1744523fa658@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDUxIiSuIhbTdjASrbSIRNxds
 XyL/y+IHIQjtNkFgQ+J4l0C5hmYidzISmwylEVZY4GVIrOKEr8su2JEy1bbhkhDCtbAg5zfrOt
 /x13PbLb3APf9AIDyXE5uAAAA
X-Change-ID: 20261014-acpi-iommu-e11dedbd7aab
To: Tomasz Jeznach <tomasz.jeznach@linux.dev>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973598; l=2641;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=gDHWDcYK2QanyrU6NUlrYkRMYYGX2rjQ5QCZVztfKm8=;
 b=AwtnJHIiJrTb4iNCDXIUiIfMWQQpeSjBoeHg0K9C/FGGtJ2S2EBE/Vbsc2hjBGRj6UWaaVaOG
 0c5IzhdxGZQDYbImcQizT8FBGigNg/gaCupWKWysURa6+HbfFZBsZtA
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member (does not apply to this tree)

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
 drivers/iommu/riscv/iommu-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index 399ba8fe1b3e..5680424e36c4 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -164,8 +164,8 @@ static const struct of_device_id riscv_iommu_of_match[] = {
 };
 
 static const struct acpi_device_id riscv_iommu_acpi_match[] = {
-	{ "RSCV0004", 0 },
-	{}
+	{ .id = "RSCV0004" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, riscv_iommu_acpi_match);
 

---
base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
change-id: 20261014-acpi-iommu-e11dedbd7aab

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

