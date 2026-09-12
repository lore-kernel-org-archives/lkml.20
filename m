Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D379537B030
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789200639; cv=none; b=XFNwwVXqAiv7879fHJIefoq41Sl9x4Brvlj2lJGiKoKdTzqS1hbXElQkuFslbtWJwuZq+MC9bISx6ilirDGTaEOjQYfDMC0wqgTBA4YNZui2GdK+ACaZLWwcyPdzs/4OWrkvazgxli3ab5FVmRHSjCYZFpK09VsGLdTwLFssoRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789200639; c=relaxed/simple;
	bh=wexs10U6dAtc0VpanErPLRw3l5WrtA3xwH5oCWCKM4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rabvBdEZqVEiHfuulqV0U5tytb/lLVm9ypfCBqEgvZf1myu6SRk778mAeItG822OAIpxRLyPj8t1+C6bnj24Px2CX926rLo0oG6QyzuO/ggZJDcZsnkA67at/XOM0LDhk7GCKe3W5XUs4/zA9WXhndomOy01vTSnLu84RkUSroE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIfWeCO7; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIfWeCO7"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f9bso6674925ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789200637; x=1789805437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ukdiol5JyLif0T2tj02gnGl5hqC6N0TQpHgMhHI8Wqk=;
        b=XIfWeCO71bTbHhiCm/m2dzQjjBU3jWwISPdoSYVU0ULHMnMijeAKP4SuoNT6kzOYI1
         jg9rlnqrFQv7iYK9CVfiQ/zeMRpdD7Ehy71tOCFzjyEJfeTQ+JrVyBoLIlaG5SkK1YlN
         eUZeeiaYcW/Lfr0hH6/waDdLeXfusdS286hF4CEgGDUGu2Oj9Gw7etPcCCz1by/GszMN
         siMqQo5gkKJL0PhlXMBHtUwUkYkLP1KVfwaNJDE6JyqF089Yx+en6RmDlwSiC/J3yaxv
         lg7LaT+X5z2EtZDKQ9dG+kle4xgT0BQdxf214JbgOQf5UVks9/iASCrfByfIGUTBeedU
         l93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789200637; x=1789805437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ukdiol5JyLif0T2tj02gnGl5hqC6N0TQpHgMhHI8Wqk=;
        b=esLN8eSY/AqgGNfRgiOH10swRF5VaYij2fzVMfeca/SH3gL50EbUsxo8Mn80hh/3KW
         CxbXIz5MFKadmTWdUUzaynB1X9Agw2kgMub1PW3os++f3f9ibASoxayaKvUwNIvQXMfA
         j84prI+QN23n7LIl4Vj7E28waW0GvIyatpSj1QzKruVtE1A+y3W+LayWiw/m0i8NbW6m
         /uth14xcmyzuRdb1RPYW5gyekEfe7dOLRp2CbItUOqvJs05ofHxAAoJXDggQgyu40E9m
         Di0X70ayn2BBkYcRQeYfwN0VjqGc1o0rOs+5+qT2Nnv6M3//QQWmg+SweYsEYigdWUnW
         FNeA==
X-Forwarded-Encrypted: i=1; AKwUvBxRhnJvCFwJqtNRrAAVfzJOt3ZXYilwxgKh1Mi+std3G8X8PxVA6NW3+x+rpxgA1wYT+W/MSTM/JTw9ji4=@vger.kernel.org
X-Gm-Message-State: AFuF++mGrRE8dDg/ZzK6POk7ssvqXkbzcZMEeFAiLcBFCU5WX3zNSzGQ
	VuqGcqHSGtBAy7f9nXCnRS8eYZ0+S3Q+crsEWgksXLBLXUaHjKrD/oqW
X-Gm-Gg: AYBFou0wvtpk2TWT9NJ7Icai2IFskVmPdNGj/xHdBIEtpYJRks6CE9FhYqmToi691dq
	NYghnrLcv14VLsyCZ9NX6oMQ1JD2HuCvZP9xjyf1D0AhJ5+huJ1vBjQTLJAPLQ1sdMTSzbJ1kBD
	Yrg5bakLxKM5R5T+q2zlDa8gAAKY5EsgIvOGLrbjQC5yCJUj5tf7jAmYFPS8kBrllcYEGenMUuX
	BQdMPRXL4WOoBUmcgTjaShSX/har+pldtjQ+ZRr81zWthMS7YmUDzoVq/JTUolfms3d8JyJ5RkS
	VTnmFcYKkVVXdWLXfvAkiRqsbMKMHwP5TZt8dKYLY8e+MAl15TWKg7zbyj9u7fxZ+t9Ybo/+eBI
	lu1O5hBTzyOIOqnJ2ZQg1NRTDWDXEYPYcnJw1TQ96qSP28RxXU3oBLef4YLRnskGzSQ1NYEmpyi
	53cWndrO8qKxaYEPnbo1EJyUSKKwUUwzPtq0/ZE6nIXx/mddKQl1Tb+nkAFY7gAOQmlst3DrvrP
	N3rRGl3FzBZIso3BhZQK7q7pGH1BHNFdOLYH5xsUrYuVQcdCTMriXIHTdTtiBE0ZT2hfARzSt/c
	New4iKTu5709h1BzzE5kOfL+vXLXDCC+LUJy7DibLl8T
X-Received: by 2002:a17:90b:3c03:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39d9c1db154mr14531954a91.15.1789200637023;
        Sat, 12 Sep 2026 01:10:37 -0700 (PDT)
Received: from 0xiviel.ip (122-63-135-80.mobile.spark.co.nz. [122.63.135.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db7ae6d25sm982474a91.1.2026.09.12.01.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 01:10:36 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Eva Crystal <0xiviel@gmail.com>
Subject: [PATCH 1/4] accel/amdxdna: validate the command payload regardless of the size argument
Date: Sat, 12 Sep 2026 20:10:09 +1200
Message-ID: <20260912081012.2274075-2-0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912081012.2274075-1-0xiviel@gmail.com>
References: <20260912081012.2274075-1-0xiviel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amdxdna_cmd_get_payload() performs its bounds check - that the command
header's count field does not describe a payload larger than the command
BO - only when the caller asks for a size:

	if (size) {
		count = FIELD_GET(AMDXDNA_CMD_COUNT, cmd->header);
		if (unlikely(count <= num_masks || ...  > abo->mem.size)) {
			*size = 0;
			return NULL;
		}
		*size = (count - num_masks) * sizeof(u32);
	}
	return &cmd->data[num_masks];

A caller passing NULL therefore receives a pointer into the command BO
that has never been checked against the BO's size, and no way to learn
that the header was malformed. The count field is written by user space:
the command BO is mapped into the submitting process and can be rewritten
after submission.

The one such caller today is amdxdna_cmd_set_error(), which reads
cc->command_count, writes cc->error_index and reads cc->data[0] - offsets
4, 12 and 28 into the payload. That is safe as things stand, because a
command BO is created through drm_gem_shmem_create() and its size is
always PAGE_ALIGN()ed, so any BO that can be vmap()ed is at least
PAGE_SIZE; a zero-sized BO fails vmap() and is rejected by the !cmd test
one line earlier. This is not a fix for a reachable bug.

It is, however, a validation step that a caller can silently opt out of,
guarding a structure whose contents user space controls, and the safety
of the only NULL caller rests on a page-alignment invariant established
three call levels away. Make the check unconditional and report the
failure to every caller, so that the guarantee does not depend on which
arguments the caller happened to pass.

amdxdna_cmd_set_error() is updated to handle the NULL it can now receive.

Signed-off-by: Eva Crystal <0xiviel@gmail.com>
---
 drivers/accel/amdxdna/amdxdna_ctx.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 5315466..163b5fc 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -106,17 +106,19 @@ void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size)
 	else
 		num_masks = 1 + FIELD_GET(AMDXDNA_CMD_EXTRA_CU_MASK, cmd->header);
 
-	if (size) {
-		count = FIELD_GET(AMDXDNA_CMD_COUNT, cmd->header);
-		if (unlikely(count <= num_masks ||
-			     count * sizeof(u32) +
-			     offsetof(struct amdxdna_cmd, data[0]) >
-			     abo->mem.size)) {
+	count = FIELD_GET(AMDXDNA_CMD_COUNT, cmd->header);
+	if (unlikely(count <= num_masks ||
+		     count * sizeof(u32) +
+		     offsetof(struct amdxdna_cmd, data[0]) >
+		     abo->mem.size)) {
+		if (size)
 			*size = 0;
-			return NULL;
-		}
-		*size = (count - num_masks) * sizeof(u32);
+		return NULL;
 	}
+
+	if (size)
+		*size = (count - num_masks) * sizeof(u32);
+
 	return &cmd->data[num_masks];
 }
 
@@ -159,6 +161,9 @@ int amdxdna_cmd_set_error(struct amdxdna_gem_obj *abo,
 
 	if (amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN) {
 		cc = amdxdna_cmd_get_payload(abo, NULL);
+		if (!cc)
+			return -EINVAL;
+
 		cc->error_index = (cmd_idx < cc->command_count) ? cmd_idx : 0;
 		abo = amdxdna_gem_get_obj(client, cc->data[0], AMDXDNA_BO_SHARE);
 		if (!abo)
-- 
2.53.0

