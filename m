Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E581823EAAD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238971; cv=none; b=F0FjTuOPDem7x0tm48KYj8PZb8AhrQ06r1cbIUsoEWi4P0ndKdf8vcHFuTdMRxjyyUhpsaqEI0KfJMt5dzMadqpet/4mCrikOuOCzIBcvd/WAqcTLBb/rfNwFOXzFXstAPFil0vUqFCv5F83Zti02jLoWOIQmrEL/p4fQ81SnB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238971; c=relaxed/simple;
	bh=CH3yCxvpXz6USolaBQ+rnqjoRmzVg/mE63HC4iPyDEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H06xNvprLG0nqfrHC73BVZ8WhsTxVqQpF2PqwYIfWweNe6Py96PWzFnO3x5p4imAutEv6WSt5asWELfr57Ut61PfRm2qU9RxRw3RX1PRZ24yj7RGUNniGDJisWlhJWxMvbcqGukDaMf14UYSXTKlk5h/zmMJVlTjSkJW9GlNgLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hntGbcuh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hntGbcuh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d58efc7356so51598345ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788238969; x=1788843769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9yUuR/WSkjmDZYldjCLyDwNxnmnt2IjU3AxaHKK9h1A=;
        b=hntGbcuhGpfbv7kRWi2/osfnWIcHk3Iu1aLLuvDGj5GaGD8oq7A/QnF/TAO6Wc/FHI
         fTVv6fkVbMv6NKdzvliP+IkyPFx2mjCcVDZ5ua2WQsYbOJFvBfgfwcKcInPnHNMt6wf/
         c/b5buv7qTp4ipT+QRMNMecNj7sxe1uH7zwcJn0L50H7ChB54sOA353v7Mc3a30WP3KB
         rahIclFlBACix8/WHUUZKGo8AyI7tgQFXnTjlxKdZqTblSC24Xo0m8URvY5GO3O/q7OY
         Z9q2aXT/gm+SmZRbnDJii7Q7EcSLs4WNrfR/ndCu98tE1HgeLpVK82lomtYHtltEEvWa
         vj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788238969; x=1788843769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yUuR/WSkjmDZYldjCLyDwNxnmnt2IjU3AxaHKK9h1A=;
        b=eg9GKNgozxKeFJA/CUr6NbCqTq0xmdL5UuC3sdBWjEFomAIofEA7UPjlSGgibt73aU
         fwc5t0fQfk5X8M7L29YsQN1EFemMUwLqoVHyw8GGq07d0hoavLl3R1cX+SHoF259VYfv
         g/gTfEKCiTvry7Akp6jGUMxqMw8q5SaGOODk+SFrXKqHIN6PO1csTDyusWrxjJC3Tm6Q
         7vLoN6ws1RBI6l0/Jie138wzGQCpYybGBIMiMrfkgykoVjOlSVnjXRQiH8nzvrVSgF8E
         RrbHpw1N2qUmjKv+R4NWgv72maueFSCTmtCQb/HEHK36VSVwQwdc0B0+khVqOSrJuN1q
         ZE9w==
X-Forwarded-Encrypted: i=1; AKwUvBxfOk6h3VV9cC+tTc3Xvy74GL8nr12/XnODMTTsjsT/qXbGYzrF1cjPFOYzI4o7WdWg2dqAvAxM/8WV8QE=@vger.kernel.org
X-Gm-Message-State: AFuF++m6U4J7sCMPxWeOKVYaQIGMsk72fWh1oTuJjWO67SIB8Lewksv/
	/f9UGAmUq/5kZAEfLAI+YJUUeMaed0CIm7uudHBDLUm4NpLYiVSWBUUJ
X-Gm-Gg: AYBFou2uZPGRGCKBIkmzTPBFLKDHeo7IAMa+L7d/a1n4625qjfUh3+BY6kRG1yKA7JX
	GrugaAbaxfgwCmVqGuSoAIhkn0lDDouBzsmRDKnSkwSNn7cyJkzH647kS12j+sy5P3BTBVMMv99
	rYgTf5U3Dph97hEQkX2Xsc1N7hnkPhKeB1pn+VrojN3KW2FvlMw+mu0hLFj+RIDa8x6vSd4/0Q5
	4HC6x2SQ80E9eMmJjtKBRh+HvwwQfOGUvNVnxwchgaOWE2gpmp/o4IqEsjvsyVc2xsFwny/I2oB
	K7+/cYPa2kAJPIKoCcdu+8VYlZwkbXo9sDE2kLKqzRm7Tf0bgAf4T4IBrOZYP2nnYbvBDFHrTwr
	R8cdiDH5NE/DbQUCIWJ3kUW0pqrqJy6RotPVDkAO7xhpIZtwrlALQANaDwlm+gx5TFHOt6Ref/W
	AQeTl+uRnfZFgyZBzPN652IkKkr9b216ZRR7DzT24Tt6gvAkTkyyPBa0veNr6QnLgHl3L0
X-Received: by 2002:a17:90b:3c83:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-3989bd54c84mr34387219a91.18.1788238969089;
        Mon, 31 Aug 2026 22:02:49 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm49404128c88.0.2026.08.31.22.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 22:02:48 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH] drm/i915/gvt: use strscpy() instead of strcpy() in virt_vbt_generation()
Date: Tue,  1 Sep 2026 10:32:41 +0530
Message-ID: <20260901050241.359490-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() has no bound on the destination buffer, so convert this to
the bounded, always-NUL-terminating strscpy() instead. The literal
"BIOS_DATA_BLOCK" (15 chars + NUL) fits the 16-byte signature field
exactly, so this is a no-op change in behaviour.

No functional change.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 drivers/gpu/drm/i915/gvt/opregion.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
index d6e76ba31d60..f2527e26cd1e 100644
--- a/drivers/gpu/drm/i915/gvt/opregion.c
+++ b/drivers/gpu/drm/i915/gvt/opregion.c
@@ -151,7 +151,8 @@ static void virt_vbt_generation(struct vbt *v)
 	v->header.vbt_size = sizeof(struct vbt);
 	v->header.bdb_offset = offsetof(struct vbt, bdb_header);
 
-	strcpy(&v->bdb_header.signature[0], "BIOS_DATA_BLOCK");
+	strscpy(v->bdb_header.signature, "BIOS_DATA_BLOCK",
+		sizeof(v->bdb_header.signature));
 	v->bdb_header.version = 186; /* child_dev_size = 33 */
 	v->bdb_header.header_size = sizeof(v->bdb_header);
 
