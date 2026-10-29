Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793293714;
	b=s5NMs1xxH8r8wzFKhPJXLR4lp7BIb/+PaznZt/Zw1gQr/iSoaJYTySrn2xHr6CM1vrDM
	 zaP4lSsR2nMKQaoMGwJyXn+mUqD+XbxrF+ptd16dcTDnBFMCRylfwNhc4Otu2s6kYWvQC
	 VqWJfGbLbwxBNwOP3RbKnBoVmXA9SOQI2nPJy90HA1WR9mpQCBOx3N3Td8lcTFDfTpTY+
	 uBdS77hyna9ZN/etefFa5cJoWWX0r42lHJIrw2gTWVUe8BYzxOdAJFO3oKaBTUxQfrcUr
	 A4PouuvFFMLQxdk7eB8DysXTXSUc70u04gnqR7xbr/z0gH0f7VKmuFW+n3bnlDLYHuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2penUq1it6r83a80cbOdtkqLeYJ8CYDR8X6q9mSqcio=;
	b=EdBDJZM0pFCA03GRHaNCQOLjXmmXuIp+HgcbM0XHQagrpLtBkQM7qn521DxXNC2Ehwbe
	 xpdckxuzOrZV7Kg36PbJafetsNZxt8ucFDlc4VOlMNx4BJlI5LEFTmbd8JCsN4B3xoSXO
	 6W6z/2hQCNsecWp67wVHKs4FaJa4LE+5tQ5Wybl7RAhuY3ZzFhcBlmCfVVz+ooW92ASHO
	 GjBSI7xz3W8jaZ+uIlqE83A0cIIGAKYCMQ9k07lCmYSsWUoyfz6bZ3Pw9SkHTL+KsLWeb
	 P7Ei2iE+xqAglM9kcKSHXI0xT1rCjLg01U6ZSPYObyr/LYUZO04p6Gzgx2DIepjqMlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxADFK2q;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313CA606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 313CA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxADFK2q
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956869750eso17650155e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793293713; x=1793898513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2penUq1it6r83a80cbOdtkqLeYJ8CYDR8X6q9mSqcio=;
        b=lxADFK2qDTa/RegIfnAQ9tLHMvXwzl8jyeWSwcSOjLzizXN+S+h7jPiLCA4mo6mukS
         L5YPKLjg0rkAk6kAA2aoCKfc+FSYCfAqZfBiGCtkgXNQ4W5CKIclX/Nc0jG9IkHErZTg
         fMi7bQtL4pAvRlS7I1UlMQCWmolig8qq5g5yRotxSi/NwbVsa1FvPYyuZ63j0aHr87cM
         7svpJ9YdofV5dyMNOXUcx/bnoW/t+DD/WY5Xq6izmLpc3P3/RRGf6t9JyIGiDIldy57F
         wOdqMce5OhtTaXheBlrX6zBwMN5ewdvTczaIdvEfUJklNs4dwQgWi3bd+v83JCnMIhyc
         8EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293713; x=1793898513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2penUq1it6r83a80cbOdtkqLeYJ8CYDR8X6q9mSqcio=;
        b=m8B7ZlQvSGwkGMImOJvQmrZruoB+tXLcRYmNNG3eXZrZo94Ya1MqcX4IGQHaOvc5BS
         XpR5LH/B/KzY8hZQf0ZSHjRQLBt9sGRghi4f1Eyzti2EsSd49/aCX8Vjve4FEURaZD7V
         E9qXjq62oRjtYhBYe0ki27+VFSi4kM9VmR9tCk4RaEN1pN5f08vV78wBbEPJuGtXRGCr
         ndaqYK7hd+rB8AJ3GsJzkDH2jO5qdNxtQlfjSIyWfqruYYuwx5opVysMxZBbm8PrG9E1
         bZWxNzwXJjB3/KPMpyBrvwSpuRnjMwnN2hAY7xen3mFMUELsjIVJeyJDEbLtCoOlAvPQ
         mj4A==
X-Forwarded-Encrypted: i=1; AKwUvBx/Kl9YYN1lKtYKSkQDPSZT8QrPKZ+MWVCwgvM/5m8kooBUT5SnQsA1C+DZvglrv687qt0IlMiYPYujTWo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4/GRAqCfVT/uQvc9xn+EbK8copmJz5WXw/4H5FlqrMhGVBlrn
	DARGdlq4w9G+5F8pu9PsxfqUd5RndnYwpO+U4ppQosdOfkCZv6bDMo4=
X-Gm-Gg: AYBFou0CLjYZPCC7+gt0gIhvNiNSD2cLdp93JUhnGJ/J10Qo6PyjhjqSRJGwyJxbOwt
	ekgsJ73p9Tac/2vozSBxhKU+F7MiCUcsE6qItAQbkIE3kKlF+DsZLTkjqkYBH+YYUKrX6Ofqoo+
	b1XhdoSS4YrVNPdCxML1V3NB8vO3tWkSz8q2SGOFeGrzi0IkBzDjLlEa2n+mkW+fkW5kCPZN/Q7
	tCQ8DINgDyY8FYh4UtogK9hT+eU+nHzY2+kGyZR9UMebQuDBisA3QAPfMBAjR7nTzC9R0ouvx9b
	zM3YosPCFKm3gwpZjVnCknpC0p6lNT/E7ZQyrtvr8pmUV8qq1gszvy0/C4qRjXwoftBKLc/aN0V
	zonl1ZmMLJMgN5J6K9u6ujnH9xzcQ2Aw/dZEt/iOFUMnP1gNW0bIMpRgrdlLi+zWnXVoimihNhQ
	XmMBqE/e+oTQm/IleEWpSTrwHU8PP/6Tz/iPECDNFMjbi7tDisi+sFqxQkPBSLnJuFoVDik8n0F
	fEtBCZ+MbMYf6dOnWLU3ZL1qbMfUKN/EzcEFEbmg7N+TTOe89L9MFEadrgd50tHj+9yjDCt/Jc=
X-Received: by 2002:a05:600c:4f55:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4a9661ab508mr141416555e9.16.1793293712558;
        Thu, 29 Oct 2026 10:08:32 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm82284925e9.9.2026.10.29.10.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:08:32 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] drm/radeon: validate ATRM return buffer type and length
Date: Thu, 29 Oct 2026 17:08:31 +0000
Message-ID: <20261029170831.915318-1-tristmd@gmail.com>
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

radeon_atrm_call() copies the ACPI ATRM method return data without
checking that the returned object is actually a buffer or that its
length fits within the caller-provided size.  If the ATRM method
returns a non-buffer object type or an oversized buffer, the memcpy
writes past the destination bounds.

Add a NULL pointer check and ACPI_TYPE_BUFFER type validation before
accessing the buffer fields, and clamp the copy length to the
requested size.  This matches the validation already present in the
amdgpu counterpart amdgpu_atrm_call().

Fixes: c61e2775873f ("drm/radeon: split ATRM support out from the ATPX handler (v3)")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/gpu/drm/radeon/radeon_bios.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
index 1da6bf1c17ff3..579ba1c1f23a4 100644
--- a/drivers/gpu/drm/radeon/radeon_bios.c
+++ b/drivers/gpu/drm/radeon/radeon_bios.c
@@ -183,8 +183,13 @@ static int radeon_atrm_call(acpi_handle atrm_handle, uint8_t *bios,
 	}
 
 	obj = (union acpi_object *)buffer.pointer;
-	memcpy(bios+offset, obj->buffer.pointer, obj->buffer.length);
-	len = obj->buffer.length;
+	if (!obj || obj->type != ACPI_TYPE_BUFFER) {
+		kfree(buffer.pointer);
+		return -EINVAL;
+	}
+
+	len = min_t(size_t, obj->buffer.length, len);
+	memcpy(bios + offset, obj->buffer.pointer, len);
 	kfree(buffer.pointer);
 	return len;
 }
-- 
2.47.3

