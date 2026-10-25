Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792931206;
	b=p7Jq/zK1tZBf5yiU7SPVhMoOekrHqvFSrl7GBdKQmQsZ0kjWDUuBH/c7nnp8WMZy2uLz
	 a1Wmk8TKQhy0qIY4kuk03/cLdc23a1+Eh+iX9GxBRffEZEGBjYF+vb0GwNuvyfMNIlmSc
	 mDbHRIPJ+t1z1QOppk4pFeGkVtf0gDUfJUO8wTA6/SUyZACN2BWnTmSh2+/KeaFnFEQHc
	 S4P4exEn1xToGz0wTOl2jY/MoGiwp+wrNt87utthFfL9sJnid2mJ/nceQ2YlqpFCnsLge
	 KUvQ6aQLT0rVZgSjvLvX2+6joZur2Rsv7Ks56p109pVbVzDhKo35OZQ0Pp+mTIufPJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bJHM7BaL1qbpdXNxhWlZ4r8HgQW68d95SLx6NWeVvUc=;
	b=SKuxm0VRd05f0eK7Ot0ZZsXyzin1usf8Ey9MRGdmndvlvatKDTRSwbJuK5gi9iPhn4Rr
	 4tldUYFKWZHQmcd3t5saiLNruixxTfyy//NX11N/FQGJ+9rpgbtVg7oLZ6qA0QJDZqQS/
	 iugh22dmZAplH8oSsf0taQj4+CfeMDxyoKQZHDoQNOf+P8NFBOBRkiOXirRB6ynCELUwi
	 Lme/eq418GH336n4Bmo1h2eaXY66cwSU7V0y1zDe92NDKIF40nsGsjbqvCTEaLRPVgxj2
	 h3/Exk/1y6ch7GqEiYCkJ/7HD1uM2/NUh7qJPeYcSTAtHeb5KLdwHHz43hTRSZydbEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DRU1BRlJ;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D0E606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0D0E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DRU1BRlJ
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97cca20142aso50156241.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792931205; x=1793536005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJHM7BaL1qbpdXNxhWlZ4r8HgQW68d95SLx6NWeVvUc=;
        b=DRU1BRlJD7yIjrLohRUi541MlsFW5Lri6kvwcCMgGONGnrf+LHAkLrgZ+BxXdTrcGZ
         oDzY44gcxqw/lJY3zP1uob+CeudjQgrbbpFpgrOdr1KDctU2ShloQr3/FsQr/2eR7MVh
         Td5D8xqcqKNvad9zfgIX4KLLeY1pSc57Kbe7pWILm2JsZfV0zVcH7WrWri1a5jwlyAKX
         ta8RxRdFxilJlHzUCOqBrcfSm+dyet5yTfCB2a1EzIZ4Fy+D+H7JGq1O7tz21L9z/qn0
         OTyPjJLIG/CtrSFV13yr7YcfyUwqMdm8KnhMP2JK0+K8FoLGiFMnWw7jhzwsdP86wauz
         ulow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792931205; x=1793536005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJHM7BaL1qbpdXNxhWlZ4r8HgQW68d95SLx6NWeVvUc=;
        b=0HOX8OauJpHtA1eyK3eHX2cFVVFav6X7HaEKj8oHf5s8+qmf2N20QLyVHImUKgUdkr
         daJE8eaCeHeaTQqPdQfHMtX0iYEB6Khf+tKp6xYq+kW2sj+jHinQMDLJvvQPqFbqs+pB
         CSc/ZVWuDR7veaVz19lO6WHxiMJOOCaO07rSqj0ThIcn8Z0P+0etP/Bcbs/N+wdG8HnY
         JEeeUaWXA4/fI3wkzM7u0QUPvvTOGdCcza8wLted8pK7o+nTdLnQO9ENnsTAkAWcjp/U
         w6ENOyCsWqZcwLfYmt5Ad5mMJhdVbUsrt13JV4raQShWb3FqD9HujIolJj2X8e3DEtvq
         6GCA==
X-Forwarded-Encrypted: i=1; AKwUvByxA2a1gj1Tfz35JQuaH+TdeK3wpCa0lDNPGl5jNtbVvOQ6EEvpS7waxHnc9n4awQou+PAueU56sR+JwH4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXUIYaszu7tCjG4YGSqk25F4Dqh0HpmyxzT/ilT2UcmsyBC05j
	hktb2rPa8dwfjd139OCYqQ9cPAW8wcgEICHlVL349VGHxV2S1iPGlxus
X-Gm-Gg: AYBFou0dHBZgWWhVm/q5jiwjfX/6ArS7JPx/VnNNSw6M9vfuqUck3I0+CWJXstSGzLt
	jH7St+8XSa6vduu10MImt5KyAecZSyGe1bMEWGSK9Tq4WmjQHHmF/JI85iDVmQ0ebFl/2voJLgK
	FkqqysRF4LSpTQef7m/rDl5cXUE2szFkhP5X21LMv7lL2Xbi+F6eEIEr1SrNaQ2U0J7cDtlc8aS
	C9ZJPjUh9qDTpnvdZQNCzb1Z98ZVub8iztlDYPjH0Lq9RY5mZmWKm6kvzKAt0c+fv+Bt5kUmSCo
	C/paIi1SudH7zQpU56nTk1N92pzUB7O6mjh5CEHbxPvNi2UfZOIlEWTXANOD2s3WRnvQA2wIcNT
	eD9pVjGuUVeDjhbECHjkqI6aIde0FQeZZkOryDw3A73U/trUSkDiL7KgDopquj6mOZlHBr8+vEv
	qHVXi6js1YzxLhmQRC9oVM5nG8d+hab80ovXi7dDz0Mb9m/xla2wC2IAIFY24YNJLEtOBrzgi5J
	w0/SHZucbOaepMcHhWac+qQixaDq7nnLPtjGm4mlqJTQ7nrZv3cATReXOjPNjrm2/hsg6yqozS8
	jA0ZKB4sI/UDwg==
X-Received: by 2002:a05:6102:1458:b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7ce5ccddcb1mr755537137.3.1792931204840;
        Sun, 25 Oct 2026 05:26:44 -0700 (PDT)
Received: from tacolabs ([2a02:6ea0:cc02:5480::14])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5df708e3sm4694536137.2.2026.10.25.05.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:26:44 -0700 (PDT)
From: Reid Downing <skibletz@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reid Downing <skibletz@gmail.com>
Subject: [PATCH] exfat: fix upcase table validation to require all entries consumed
Date: Sun, 25 Oct 2026 08:26:39 -0400
Message-ID: <20261025122639.1173247-1-skibletz@gmail.com>
X-Mailer: git-send-email 2.53.0
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

exfat_load_upcase_table() and exfat_load_default_upcase_table()
accept the table when index >= 0xFFFF, but a correct table must
process all 0x10000 entries, leaving index at 0x10000.

a crafted filesystem image can use the compressed skip encoding
to advance index to exactly 0xFFFF without filling the remaining
entries. the checksum covers only the on-disk bytes so it can be
made to match. the kernel accepts the table while the unfilled
entries silently remain zero, causing incorrect uppercase mappings
for the affected codepoints and breaking case-insensitive filename
comparison for non-ascii characters.

fix both checks to require index >= UTBL_COUNT.

Fixes: 370e812b3ec1 ("exfat: add nls operations")
Signed-off-by: Reid Downing <skibletz@gmail.com>
---
 fs/exfat/nls.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/exfat/nls.c b/fs/exfat/nls.c
index 055447edc..7afc86ea2 100644
--- a/fs/exfat/nls.c
+++ b/fs/exfat/nls.c
@@ -691,7 +691,7 @@ static int exfat_load_upcase_table(struct super_block *sb,
 		brelse(bh);
 	}
 
-	if (index >= 0xFFFF && utbl_checksum == chksum)
+	if (index >= UTBL_COUNT && utbl_checksum == chksum)
 		return 0;
 
 	exfat_err(sb, "failed to load upcase table (idx : 0x%08x, chksum : 0x%08x, utbl_chksum : 0x%08x)",
@@ -728,7 +728,7 @@ static int exfat_load_default_upcase_table(struct super_block *sb)
 		}
 	}
 
-	if (index >= 0xFFFF)
+	if (index >= UTBL_COUNT)
 		return 0;
 
 	/* FATAL error: default upcase table has error */
-- 
2.53.0

