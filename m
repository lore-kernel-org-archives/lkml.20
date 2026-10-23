Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785569;
	b=w3/nmOeCmAmQsm/J/Zzo8UhzPabtOZY1EB+vd176XiFdh/4SW6E0fJe2NXYoc4+Xw6uR
	 PLsBtrSImVoI0h0UY1lHDSsLT6CipsOTFpXPe8iyZV2/+Pbr8A0//of4+UlNJ9n+JDm0P
	 9WJbnBx2sB0tiH2uLC/u1ivLuaUq8uiediiOAIiGNDueQm1xpT4XXjmKvgGi2Dh7GqOGH
	 KwYqOP+fXaz3cKkzaUBmUx7BoPkz+ZocVB2ZoTKj5oYnToYPyknrzAk/3oV+hZriEka2W
	 Tq52Mr5mFufFifq3VvKkqT8fEglr3xnqQPNBN7T2dMCgWgrbgnD80Vv0mmZ56mKIeEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dubg1gFlwLFjUntHBfFzK7AT4OWC46obGwplwmSB/ss=;
	b=YMesSE8RPSf7JVb7E5ITa6atUv3jnI5qcfGIw6/dpN7GAYzZdqiZiR7yy1QjH8zxiB9P
	 KyhOlayzwiSYMl2FlYLSWFyzkP5rWFloi3/HRv6i2kC6HRS+eioo3qtlm0Cx5mT6NXbXC
	 KLC6VPA2mm+TWOxPPOiZisQcXaZxjzK0tfiSwJ2nLSFv1CMlAwxNGl2GMjcPpglFuZgAE
	 i+OMFOwr0RLAcPZxfeYn+K/eHBGI+ixpjfMXACyaA8Tt5a7/NrWCYVcH4bKBS9ssUKUvu
	 qq3O/vVfJ0VzL1bxF9SQEXxXZ0UBsk+h/r9BGBRdI3yDcycgFY+1oFeogL6j8whrnWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="E2/f3yHA";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B305606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B305606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E2/f3yHA
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso12647145e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792785567; x=1793390367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dubg1gFlwLFjUntHBfFzK7AT4OWC46obGwplwmSB/ss=;
        b=E2/f3yHAM6m0IbyoviLEbfad9IrNmtVeBbDh6YA1AxtThOvKYLp8ovQ5q8wwtGi60O
         BgXsxLo1t+gu8XptqE8IfuyLV6chhKRqTa5D+suRtQS3lUHnRZArbgkuHy4rAktdR0au
         KbCYy8GlDgZUpojaCEZl484mrGDwZcibJ0L2XiUihgTW599oDMBmdWZ7yTHcpFnAlRAE
         BTwHS3OM3xolyVEfLZ/49Efzxnb75j6pRcm2q/BA2bRsTviSYElRky4f4xBs3EwRHZyG
         LSk9+lUwt8WZF0RawHk9i1RMEgkkj03W7UTzUPndV3o9Qnxupsj2h340WS1OMYwtBkU+
         ve4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785567; x=1793390367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dubg1gFlwLFjUntHBfFzK7AT4OWC46obGwplwmSB/ss=;
        b=arJexhL35qMF3T296JXCnseY/mMl9aISXk0/A5Jr4L/k9lkNeV/6sZLO4keatYL8rb
         XgmnTYBZbku8TuMDfrikaimVtEef3jTyXiKLchhRsUwO3X3FlbNQPMyApoidgP94wHGG
         R92iIYpKPGCnJ9zftFnn+KcRKxeVfryOC+kEzio+hqu3QjV0N9WUNV9kPKLa7DhH8F8u
         jaxJlOwgJjjf7KIRpCkueZvIMUH0QEwxt9B6rlDtx20liT2PplWoBMtep7hYqfmF4Mt8
         12DJIsHxTVTw1Dzwa3+wwvwgWlHs4Mcz415AF/R654q8sgzGD9ABz6qXtA9D/WXmwPVH
         O7xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXDmMO4SIZNnCX26uqFkRZ52ucqG6nJwFKuCiYaG9F6rwrWxKggEPcxb56gOUMZYflqUR9ivOBt4ioXg0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJi6J2P+qR7CuzF33U5VYzrDVSJGYSSBeS5btjAHBkkYZx0nri
	DODGLzOIWbYO62eZ413cVsrwtHtc5DdOV+kgdT6ZJy8YfWaAW1ipBT4=
X-Gm-Gg: AYBFou0aCha3btZ4WfIaildAik4Fsj/vLhLWgycCkHTJf+kG26HxRLmY0ordoOymQOT
	EaI0j5yr8SoK/N01ADntLI4omp74s4P5iMH3YC16MJHEV79h5KYxNLBRt5EvXLWUXfNOhi8xGMc
	uk2/gWKAzNlBI2oJuFsFYDrF4f0t3TzW9FYcgwWLZUYXOdBbiVmNTGZ1iFbJBZKsjs5Q3a2wUJ3
	zzNnnzqMLvfU3K6lQ35xYNODKa4faLhx0ZUgYqg2l5zacYtg+CLvOh9CqHLKlqfPgdlD2uPCr9b
	sLPDS7iPptF8ScawiYx2+Yr5SsSWn/wA3qmmVsKyxI3+qjR7zOLWriZyX1m6C2Bma1TqfUD8dCS
	MqMzuSvU8u6GDo1y51lFxSLhBFnahvBU79T/FRW3xpSQwrVWkOLZIuiaKBX9adGFiDjmy47H8Pb
	VI994UzORlRXgCkDyAhiS1+x33TUIdrpzrY0+vc3/FCEDohF8bi5Ptbcm5Vk1Uvwp28UiYnveX+
	E9mRNSTShthPbCof+uCyfjjOBJkFE0VtYPYdAkXK1jzxA==
X-Received: by 2002:a05:600c:a00b:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a211c9c5cdmr49065325e9.7.1792785567419;
        Fri, 23 Oct 2026 12:59:27 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bac37sm5688475e9.6.2026.10.23.12.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:59:25 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: "Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Matthew Garrett <mjg@redhat.com>,
	Marek Vasut <marex@denx.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] platform/x86: acer-wmi: validate ACPI object type in acer_gsensor_event()
Date: Fri, 23 Oct 2026 19:59:25 +0000
Message-ID: <20261023195925.3559887-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

acer_gsensor_event() accesses the ACPI evaluation result as a package
without first verifying the object type.  If the firmware returns a
non-package type, the code reads package.count and package.elements
from the wrong union member, which can cause a NULL pointer
dereference or read from an invalid address.

Add a type check for ACPI_TYPE_PACKAGE before accessing the package
fields, and validate that each element is ACPI_TYPE_INTEGER before
reading integer.value.

Fixes: 1eb3fe1d3b6b ("ACER: Add support for accelerometer sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/platform/x86/acer-wmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 61ae622c93d94..72b44f02a992f 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2043,7 +2043,12 @@ static int acer_gsensor_event(void)
 	if (ACPI_FAILURE(status))
 		return -1;
 
-	if (out_obj->package.count != 4)
+	if (out_obj->type != ACPI_TYPE_PACKAGE || out_obj->package.count != 4)
+		return -1;
+
+	if (out_obj->package.elements[0].type != ACPI_TYPE_INTEGER ||
+	    out_obj->package.elements[1].type != ACPI_TYPE_INTEGER ||
+	    out_obj->package.elements[2].type != ACPI_TYPE_INTEGER)
 		return -1;
 
 	input_report_abs(acer_wmi_accel_dev, ABS_X,
-- 
2.47.3

