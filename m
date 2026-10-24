Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792875473;
	b=BuhCtyMi4x6HwBPNAxtGtcfnWwqSye61u4imzox30g2ASTlKsU7b5jZlIC9M+M9uE8tE
	 zmyMxu+2JDNoUwmr1tHnipwEyelW6b3MHL7Dmfi6psaI9BlwgwcfOHGuMCrut3Ce8OgkK
	 qzK2/JVLMpBvBrQ2xHfISTYs0FvocEWLWivwXZT8h6Wd90iZ43B13E4liANUdOJR0+uu5
	 6CrtQste/GDxiRSHtCB6xbcdbRdgwYa0RElgxSTz5D37QTvk5CsyYUlXg+BrGL9CGkb9r
	 wvdIPO+WMVtY+M/Gtk1NTf1f4SSjdtE82/nc2RF0AYWm3cF5xXzzOd7J6e/Cx+5e8WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792875473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mphibqgTFFMm6n9Ocw8j+xegMNjz+2yKf+Knt+msTKc=;
	b=r9Mp+px7xEXMYmGahhkyyZNtOLcapTfceSQSG5BIJx8RszoXKAUsrATsXpPl7Vhmew7j
	 OtZqG9+R6178hx6aYIC/aK0mv6P71az83i0/ho0FunNG4Z/TWp+5PaIfoaRttpOtHrU6m
	 8W4iaTp0u6+BwboYX1BpFOtfSBXoPFWr7q6UHo80Sjk3mnibbqlwjuUNc36vT29T2+SKE
	 EhqrxAFdp6Wh9seRrpVIFvth9gTPJFtEi99TLmhJFNqQfcrg89GXYI7fua+G27MXGAuDa
	 YPlXUqy66/f5kVcdpbbUEd7AY9epyRuwThc6H++bh6ISCXxhmB/7PBh9aPQv6o+h98A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ml5I52eU;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FD1606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57FD1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ml5I52eU
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so14536945e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792875472; x=1793480272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mphibqgTFFMm6n9Ocw8j+xegMNjz+2yKf+Knt+msTKc=;
        b=Ml5I52eUj9Lp1qOjehoe4jBW2dSypONx61llfP50+O6ouqmE/AuagJ9MrU8nxR17oX
         7bUyyJ6JTpiJ6ODs/xZQ6eFO7GVjHkXdUk6q5iTSvZFhLIew3ZoUDxZQI5JPRChPkYF1
         1hNWh0cFq9x2j6bHhr7+9AgF4lCN5henyMaEYr32W0EcGCnyuS5FXFFa1Kw8gxrSj4PY
         tq8YNX9QdG27DVF+D6EsYR7AYRHNTFvwLA/XUQKgOqYVMHkn//uObwuqa6A/iV1DHJ5l
         8J3UzZ4IAmZ9ik7MUDn3gMGi3z4PwjIp7XApLjfUWxNqVMvvQMRoHOFGnLilmbseDGnu
         5JVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792875472; x=1793480272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mphibqgTFFMm6n9Ocw8j+xegMNjz+2yKf+Knt+msTKc=;
        b=GsMXEd9wfh24W7CluoPujQWxKpCqlVjaGX+1TozAv8IkTx/BaXCOiGqAOUey7FDIEu
         usxZoFWW2EQgQP2+mRQAylJ7oiCSbko1Ayt0mDNeKQXHdiGAB5qex3yZ26il6ZWaC6ae
         2QyuTzibzT1o+9sB8G009t9FIqCR7BqwKKbaoZUWWivO77gNhPoveH0bo0ELsMKSXvq+
         qpJ0tY7JOEtOA7GQ4bDRDEhn1ZMkYVaRgyqsLhYfVNar+q27ZjOJiP1OKW1Oe337dGet
         rEh/CF45KzBuofFBTz8Dz44uxWNoUNdg1ozFi1iNvV2DESX0KFsHHpKLMfPcBvfBILQz
         uWKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtqWHlT/VujAue1xP+iewod6NSzhPGm/apPi0EFbp1cWRCuA21bkb23FBeJXdHajS5/n9KOOao/w9Z6P8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKROTq8JKmQPoRTjDNqwni/lxKDSiOOuhAXSwkTjsVH1qRH1K1t
	lu85/VoLloogR5ApBEq2AMZsnLZgPCZuGAowP8pNMNMP+nRETvit9Es=
X-Gm-Gg: AYBFou1Fg2414iL+yfj3iffD0jXXQ3+WhPGziI52jNBTGWVxX3WXTtdRNrvBg1Hjf8p
	bcHT1HDySSeMwmrlOrCaDjZJFgNu2aWXXuZ5V0dJFXw5L9CVKfzE7FHHg9D0/K6C0XB5EWwvf6U
	8iHb741LytKt6AG6V6ok6crUKYANybWdBT18TKyFhzxn7p2Ww8rUEHkaSCGnsC7dN5hHkHcGUGY
	npgIjoYElNTVG/nZPAK8Wi412GvgT7kj4poFGy0oOQ7QJr+mpziXvLEeAZ4K/7CZDSwZazgk63+
	LHpLcbbY0CKIb8rbrCdIfeyh58rEqWXy3pTWgmNoIyls0jG0f0T/m2ZZ1FxdeUPpQN+/onSmo41
	mGYuPh1KOTPgwfPCWcyq+xJLSd1I9YhaLranq2binjoVJFgVoEyLzf5YvG2Hw81RiS0xPyrBBaY
	BqCJM6l1UuoMp6Uq+hRwrLVxkoyBrmuqZ0Yexc0EM47JOWagFOzzI48gUVBHCuRt/MbTRMMXIxD
	33xIhA2e8oPRe91/ALZ4vPEKTdO1Tc8h9VbYmtcshB7Ow==
X-Received: by 2002:a05:600c:34d5:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a35aca2b53mr39027755e9.25.1792875471790;
        Sat, 24 Oct 2026 13:57:51 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a56992dsm71004965e9.6.2026.10.24.13.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:57:49 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] drm/nouveau/disp/r535: validate ACPI backlight DSM return type
Date: Sat, 24 Oct 2026 20:57:49 +0000
Message-ID: <20261024205749.4045480-1-tristmd@gmail.com>
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

r535_disp_oneinit() evaluates ACPI _DSM method 0x14 for backlight data
and directly accesses obj->package.count and obj->package.elements
without first verifying that the returned ACPI object is actually a
package. If firmware returns an unexpected type (integer, string,
buffer), the union access reads unrelated fields, causing undefined
behavior.

Additionally, the loop accesses each element as integer.value without
checking that the element is actually ACPI_TYPE_INTEGER, and copies
into the fixed-size backLightData array without bounds checking, which
can overflow when firmware returns more elements than expected.

Add type validation:

1. Check obj->type == ACPI_TYPE_PACKAGE before accessing package fields.
2. Free the ACPI object when the type is unexpected.
3. Validate each element is ACPI_TYPE_INTEGER before accessing its value.
4. Check that the cumulative copy size does not exceed the destination
   array.

When a non-integer child or oversized element is encountered, the loop
breaks and the valid prefix is forwarded. This preserves the existing
behavior of reporting success for the _DSM call while preventing
out-of-bounds access.

Fixes: 9e99444490238d ("drm/nouveau/disp/r535: initial support")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index f5f22173fc2c1..267cc098ff769 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1556,15 +1556,21 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 								0x00000102, 0x14, &argv4);
 					if (!obj) {
 						acpi_handle_info(handle, "failed to evaluate _DSM\n");
-					} else {
+					} else if (obj->type == ACPI_TYPE_PACKAGE) {
 						for (int i = 0; i < obj->package.count; i++) {
 							union acpi_object *elt = &obj->package.elements[i];
 							u32 size;
 
+							if (elt->type != ACPI_TYPE_INTEGER)
+								break;
+
 							if (elt->integer.value & ~0xffffffffULL)
 								size = 8;
 							else
 								size = 4;
+							if (ctrl->backLightDataSize + size >
+							    sizeof(ctrl->backLightData))
+								break;
 
 							memcpy(&ctrl->backLightData[ctrl->backLightDataSize], &elt->integer.value, size);
 							ctrl->backLightDataSize += size;
@@ -1572,6 +1578,8 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 
 						ctrl->status = 0;
 						ACPI_FREE(obj);
+					} else {
+						ACPI_FREE(obj);
 					}
 
 					kfree(argv4.buffer.pointer);
-- 
2.47.3

