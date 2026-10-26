Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024454;
	b=5k6G4tRcMQDtSdZgbTu4CsBOwaGC5yeYIyVesUN3eVpLDV3ykkbl+lip0D/QWTBowFmm
	 Qk194xM60XUWKqlYr2+8jWWUuSqicQDgyaS2ZCPeBULm7ZzlIvPza+hddXUegt2e1swcF
	 Q2eSreHEJm80UD9ugPA9OhFZYul+l4xzvj0FeUTRY+njcGUqT4mp5gW/17m9kSAQvRaXd
	 jcUVJnrDg7i046O6LFUYJ15F6jZ0+SG2CJ/k0ZGw0eDVGu+0MAkmJ4ftRBx2hsBcAATSp
	 3tIWPEZ3kcaUocMFJc8MtSJc7df9AKkTPxRV4HY15rtD9XWBv73mgl7ei5omvbcL2wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LgPmm/ErrwehZ+XLxJlpoTIoC++Xdryf/n5RHQZpOtw=;
	b=nqebdMu0RTK+MlwVfDvxVamsEqErKyKqcgjua6pc1dBMjjzYPQ/vpGNycuBnbibDHo5X
	 QVxGPwhmAQOAn8GfXRS2bZLLRfJpa+m5u2R/XhIi+B+l7PYj8QI+OXOCbFUAs687DX6DI
	 lVdNLcu44SSqLXWV4OofEl6uKG+1PxQcJ66+VnSgRdG9MDAYbBWdIowv7fqd/vLB2Wsci
	 6r6vYbtrpMaSH3DPOO/wVFur10jqyCZiFH/MGVkle/cUWHbRQbDXEZm4c8dYemwc7/Uy3
	 rgq3qh9QE6Hc9yEUBwqh3HyqefVj1OUnjbawxAJUcO0ZXgmNt01U8cnrm5Xeh8pw7cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I5GO8QeG;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA4460A2615
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA4460A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I5GO8QeG
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so2955193f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793024452; x=1793629252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgPmm/ErrwehZ+XLxJlpoTIoC++Xdryf/n5RHQZpOtw=;
        b=I5GO8QeGXNlCXahnsOgpe1kLFB/P+Gajs3d2ivcElZp0nGsxs/o6SfavY7cXPO8qvv
         K+QXcoc3M4fpLcByidkS/r0GpQveUhNex8boBCdmPiytb0i1UCDVm1w0rk+ygkS+hxKu
         g4NiefZSDhIoEYqmn/CbZB4ebnuhRh3bhR8HNGXZRU8bEHrpsXnW2k2sbW+sDlys5ifG
         HQNNyhN8uQtoWr/jXcy9cqgvw+fHwL1nhhLiVVbBEvf+gssXMoyY4Z5dOLWTXvOy+/bu
         1buqLolZ+Nom0tYxf47BgLF1qqvhVB9JoddlCsXxrVCqbdgaVv81kDiBdl2nv7Eesy+S
         uSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024452; x=1793629252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LgPmm/ErrwehZ+XLxJlpoTIoC++Xdryf/n5RHQZpOtw=;
        b=YpElyj4deGHkqfWMyV9j7bL4Cr7uKhWpYRUxvXnG72kmJzx6BIHsqoSWJmu6XMapph
         5dF41XLwy2c6/FzA/YrWZSPhRB4NHy3CDwUpQX3oudK6632zbnLhibx54aFHLN76voTJ
         Vh727xn+iiVCIyKA+VMTDG9275n5FMMlAgv61o6qzm2XYuFFPFX9Dol8t2tzvCjrKXF+
         uNAm8z01mwHXOjDXwSmsKBRD3HfTJfBnhw23iA7vVrIUhunJh7S7VnZybEvuUE4huHQG
         Rv7eyxIp8Weifeft8oorbXnVk3adfTZgR98MHPBzOiH8MBTvXEfOR3NLWs63F6klkVSf
         mEVw==
X-Forwarded-Encrypted: i=1; AKwUvBxR6Lf1KOdsBOPXNPJXmW9oA57DwiOYmJxid5CqQzwjhm/T4oFT7MSjMkfiEGAxAF6wiMBh0a/p+m9eTmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3lN+wGOATgO/b7X/zBuGdl/fdmy/6Hq5DArPu9A7RKF5iK5n9
	0FTFD6LDJL4bi7Sx94KhDLKfxYa7UChSAMtL3wUT/lygYQPBQDwcrhg=
X-Gm-Gg: AYBFou1BT98MV3s3ypugYunzuDRV+P03TfAN7HEGNR5D4tJwxcCuympIPrDyvXBHh77
	Sk46co4m3+6KRRLrO8l26wYlOeH9cYzAocyGGOL5jnjbA1x0BAl6gi2GueEPG/MsefIgxuRWBu6
	ETVa/AfXdRo01fkX84241JYJ9hWUp7rf3jILUm5mrj3JQUujSfCojSmdcibs9xlrXCMisAXxD9/
	pYKAmJFsdShj52R4M0HqYSwlohVyRr0fZ2PTHg7gC285uO8IpzO9dA+FaYG0YNXLgVa6JFRJAx/
	gQlMWTeUZe2pQg1Yugh3vSq7R3dza84TtVgnnu/sXf3IPHU1W6tgX9oeBJ5bC0qn3MBB/4W5B1+
	CYEtpy/3qnDLLNUiIZXABAUlJ+Aj30S1rfPn6lasMWheNC1sKUKtH2guPIPHzufUmDwHpS2nmwO
	1j29hqaSvlNKDcjTMz9rEoFzpzI+nPNFucLLSIJ+4J27cnADn2fBVPtB3+g2B196bCefeuhCHW1
	QDoBdsQRV8el2lQl1VJD8GrR4G2ZTX3V8QnGEeF4GOxLw==
X-Received: by 2002:a05:6000:470a:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-48e3ed1ef39mr13569277f8f.13.1793024452132;
        Mon, 26 Oct 2026 07:20:52 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm17484186f8f.28.2026.10.26.07.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:20:51 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Kevin Tsai <ktsai@capellamicro.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 2/2] iio: imu: inv_mpu6050: validate ACPI object types in asus_acpi_get_sensor_info()
Date: Mon, 26 Oct 2026 14:20:39 +0000
Message-ID: <20261026142040.62383-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026142040.62383-1-tristmd@gmail.com>
References: <20261026142040.62383-1-tristmd@gmail.com>
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
index 460792ed27e031..e5ffa0d5f6b1a2 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
@@ -52,7 +52,8 @@ static int asus_acpi_get_sensor_info(struct acpi_device *adev,
 	union acpi_object *cpm;
 	int ret;
 
-	status = acpi_evaluate_object(adev->handle, "CNF0", NULL, &buffer);
+	status = acpi_evaluate_object_typed(adev->handle, "CNF0", NULL,
+						&buffer, ACPI_TYPE_PACKAGE);
 	if (ACPI_FAILURE(status))
 		return -ENODEV;
 
@@ -62,6 +63,8 @@ static int asus_acpi_get_sensor_info(struct acpi_device *adev,
 		int j;
 
 		elem = &cpm->package.elements[i];
+		if (elem->type != ACPI_TYPE_PACKAGE)
+			continue;
 		for (j = 0; j < elem->package.count; ++j) {
 			union acpi_object *sub_elem;
 
@@ -78,7 +81,7 @@ static int asus_acpi_get_sensor_info(struct acpi_device *adev,
 		}
 	}
 	ret = cpm->package.count;
-	kfree(buffer.pointer);
+	ACPI_FREE(buffer.pointer);
 
 	return ret;
 }
-- 
2.47.3

