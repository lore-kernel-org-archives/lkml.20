Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272119;
	b=CB0jReFGQpTZDeAMzNhX7OCdsXJcH+Co2xhZElrTXmmYnZ2JiR+fSCLapbq1nUIZtmOD
	 EsexZAO447SwHxZyk7OSOp+A3T6xd9V7wlIX761hpyhceqvbXQJZ8spS/NQQGycOiPoeN
	 WXa2XJsQpmmgvrz13bLiF9VzKeRNHZu/gyGH4aXgqVjF8PVoZcDFu9NZLCc78de3XqZ7M
	 +apvCqj1Vb1LTlRnYugejJXJyk+qEBEGOikdtye30RfcGPV2PIKPwulMa/GUjrO/3qXRT
	 FT5wEX84IrA3atf4CU3T/MiFeOvBX+H/TxARGSyn83FGYlPR+emhKCpZ8TiK8t8yCyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Dr8fUPXt5hNgYrHFxebqt4WTv+cM5sI+Rzy2ba6XE8=;
	b=fjKAMu5Du1YMzZqgezK/XRJoHuVb+hpmE/iQ8m3ijN1pSmeXCKyfwG7TJ32AcLNyP3cZ
	 aelcnT6RUjf1BNt24ox+VfvKx0l/BVD/BbUS90RfVNta1xr+apK1dL1yVPSYvG4d5jzyT
	 RJviXzeQhiXAiCS+P6vWjlgve1QuH1UZIoT3HAhWUWW5IhqgwFKThMiTI8UfQg0h6n67H
	 XQvysUY9+FoFq3aczo0VA1Jt4trutFOAMaCp7SF2sDDVbID9suSljtjiSEWad/blCxpMM
	 KiOgepqivZXOqbgbHAaT6rPslnK3c8VJQb/xzTVnbU3xP3hlQANXDYgEl/oNDyVejOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Izty4oPI;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D96606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D96606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Izty4oPI
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso323416766b.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793272117; x=1793876917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Dr8fUPXt5hNgYrHFxebqt4WTv+cM5sI+Rzy2ba6XE8=;
        b=Izty4oPIDBwFCFplCs3kxMz5ctmbJ5Omimnq0qSz1LWjjyYa7ta6n54JeSqECbDYiz
         /qhr8igYzuWVOqyP/pSpC76a9hk3J0f93I4FpH80UJy50fL4zrBQYIldblSji4q91XJ8
         VsdsgEU8Rx1OXwLJCnuPf76Gje68k3ueuGM6d5LD1OOqIsnH8tmNI8ldWkSp47dQErBk
         dTEKdGDOBlk0aBgvwwL+vYAlSJuQ86I+38Yfw1I8a5TYOLTkkpAdEVktKaKiTmY0/bxv
         Mcgb0UPEVYhVQkeRNHb74OYddpPUd4aMqXJzXJHDqLHEYpyomyLW/v3tZJjDVXI+esuM
         dp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272117; x=1793876917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Dr8fUPXt5hNgYrHFxebqt4WTv+cM5sI+Rzy2ba6XE8=;
        b=oURg2DlHI8el7rz0hInAGxTyYrhxn29SbsKqS9CgEFCqv40OAI/ZDxbwRMypbAu/Zj
         SoJJm9n3nvU9uiqXBdA1ILLiFc6hQqSw/kq61ZFOhDPnA8U4bGqx5tHXMlOlc2z/++06
         6BYOOa4llOu3FcLfSRkYm7rDEAYYT7gNX9J4p13SmGSLeqPi63QRxIgnAz0adN+kM4WG
         KYTPVeDYsailceDMH4J9T9HVFax9M6+oC/6FYZapJBKLjF+JVeyASOToTLE1mZ+tsvyr
         V3pt5HSbVKRtYljrzJFHkcN/xXpB/UsPAfoWqbMgVQPFphjDlzhVhHpc3Fnbxwnziblv
         n9/g==
X-Forwarded-Encrypted: i=1; AKwUvBzWvXqx8yo1+dvfu5MA92WjZwlTm+2DWCOEfi8b7ojpXpKIpnftC4MTcG8A/LyQbrJrEJilWmD2lL2Q758=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyyhdP+szQCa338VjHjUPcV807L8V4nIyjm0ooQ65zgUoBSdp3
	Cqq+N87Gmsf+KjtHVBHdYiXlnHkfQ/XSfEZ2mNK/QrFGMZ8tHshE7W4=
X-Gm-Gg: AYBFou2jLVzIXPT7kyayXqf8DlA5XiYBA4479M9FVtq0oXlwop3zUiGsqS4I1Ufr+gW
	YbpbLF6hEDTLWUXCsilUKET2LN3gVU8mELD/e4ul1KA6JlnYYkxI4T0Bmbiuc2Ku0KjwyN6G1Ka
	hn/T53V86ijFP/nf1Enbw60c2MHi34oG7kSlgo8t2uElQE92wUSrEM4ww4W+O/bsYsaQphElQCq
	lo990JoRwujxwQcUAx9datavJiaIK01znvSt26jlks1ojFY13bUe4L0pAMyXM7G2L3sDaRPHjXC
	e0wMocB+cMb2D65Q4u7JXr0SnT+1nihigU0j6ifML55iAiUWVG3OoRUDtvox11yHeL0wu1W3VYa
	5RQTSoYSDjCnceUPu/tUv/jaZtN+HikHyB7kPTvVHqDPhTwln362mqRO0gIrzSr2CItj8hQTun+
	Nzwv75MCx+GOUOWqfSlMLPR+cJ3gzn3+fKtN3w5XNFi0g3m84vo8Vws54wGYhjDl19n3z364HNi
	MxYDMvrQyUuRveJA0qAz7Jp2G3zMYYu+xcaEoJGV7nd3w4PRDjFz3jF0pcPIh/MQH67vPkPaBE=
X-Received: by 2002:a17:907:d516:b0:c25:2688:8212 with SMTP id a640c23a62f3a-c49bd9ce44dmr502861166b.0.1793272116807;
        Thu, 29 Oct 2026 04:08:36 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm33716448f8f.54.2026.10.29.04.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:08:34 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Kevin Tsai <ktsai@capellamicro.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v3 2/2] iio: imu: inv_mpu6050: validate ACPI object types in asus_acpi_get_sensor_info()
Date: Thu, 29 Oct 2026 11:08:29 +0000
Message-ID: <20261029110829.1086835-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026142040.62383-1-tristmd@gmail.com>
References: <20261029110829.1086835-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

asus_acpi_get_sensor_info() iterates through a nested ACPI package
structure without checking types at either level.  The outer object
returned by acpi_evaluate_object() and each inner element must be
validated as ACPI_TYPE_PACKAGE before accessing their package.count
and package.elements members.

Use acpi_evaluate_object_typed() to validate the outer object type
at evaluation time.  Add a type check for each inner element before
accessing its package contents.  Also replace kfree() with
ACPI_FREE() for the ACPI-allocated buffer.

Fixes: a35c5d1aa96a ("iio: imu: inv_mpu6050: Create mux clients for ACPI")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
index f7bce428d9eb4..e6a4de4fbffd2 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
@@ -50,7 +50,8 @@ static int asus_acpi_get_sensor_info(struct acpi_device *adev,
 	union acpi_object *cpm;
 	int ret;
 
-	status = acpi_evaluate_object(adev->handle, "CNF0", NULL, &buffer);
+	status = acpi_evaluate_object_typed(adev->handle, "CNF0", NULL,
+					    &buffer, ACPI_TYPE_PACKAGE);
 	if (ACPI_FAILURE(status))
 		return -ENODEV;
 
@@ -60,6 +61,8 @@ static int asus_acpi_get_sensor_info(struct acpi_device *adev,
 		int j;
 
 		elem = &cpm->package.elements[i];
+		if (elem->type != ACPI_TYPE_PACKAGE)
+			continue;
 		for (j = 0; j < elem->package.count; ++j) {
 			union acpi_object *sub_elem;
 
@@ -76,7 +79,7 @@ static int asus_acpi_get_sensor_info(struct acpi_device *adev,
 		}
 	}
 	ret = cpm->package.count;
-	kfree(buffer.pointer);
+	ACPI_FREE(buffer.pointer);
 
 	return ret;
 }
-- 
2.47.3

