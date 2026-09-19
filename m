Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C64137F32E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789841404; cv=none; b=Ny7O2onRcQ9kp9bW0eWGJ0Trz0Rd4q3FHnlFwbIV9WqYItMUVjr7LJXAo17nLkKPLsOlZ/q7TTuJE/amoZfnj+GemwTsqxXWiBN2AuyMgzLV8lbU2LAPTt7yqMIKZe/ZjuKByKGxnAP1PF32aoLncxe0F24FpXBERTUFSprX/cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789841404; c=relaxed/simple;
	bh=9fga065swnGZFhkxLqcDw2eL9TSjYMuP6kGkdbXxN1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYDWZQX8kfdq+5Q7CxzjYL+E/gblgVQIhkzqZWKSWtzXUh+Fe8WIbHBUnDTkQ2oaOOYWvGIc31cWtG0Ef/Q3cKOnCF3QGI3PnsOpTB5iz8FVFKSAJ2djorh5Q2SQCYl7X7a99H71P1SEjJgmoJ+UFWtpzAoeOSsGSyjgprXIdkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVJUp/G2; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVJUp/G2"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a3490bso1934832b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789841402; x=1790446202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEqihKQUEKRrqjsohNMETPXFyalbXU71edcLsvmgqxw=;
        b=FVJUp/G2g3dEpsJDInplThwjBYeDIuVHEWkIG5HG6SkvxQRGsZSrG+u6rvU9x51uBp
         ljp9o+RePArVBYqymg4vpldo8YvCRoE8mykk6N+wt1dspSowD6ONLIIG5IaxlO6tW+++
         Uwd543kHq1pWgTx4K9hwRX8mz58B5WhIdTd8ju8TV04/nQLDrC3lYynrXg8C9aQ5QhA4
         90opTG8EBZtxAygnqGGPJglYlk0MFWPG774/LHGBUjLik/kMKBcg0afNJQIVZfB0N/S7
         /UVcDyW2ql+j1JvpIV+kuck1iUpnTp/1dKM2qqtQx3qfHmrVPwYxGLvH+F2V5FFowTaY
         sjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789841402; x=1790446202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEqihKQUEKRrqjsohNMETPXFyalbXU71edcLsvmgqxw=;
        b=NES58FW+LaF5fjubLXSFFYyMcz/pt7bVK78FmlWYOKFVTtMlif7uSZpkAOJYOJOKKR
         lBBeNZbUqAolaM+mPmo6W/34RLD44WGEUJDfKlk5vI2LdqCQk70NwWsYOcjXI8vyHQ+Y
         lx7nLwliGIZLUalw+ml65Ke1O/Sc/0RZEZWgCehlaP4Fp2hiHrFPl4ZTmN424H20O0mU
         tC4enlNi8a22Cjwe0Ml9lYxDj1r5UNuSMwIUrKO0/hf8Ohwl9SN3D0QnswrCfbaQCrsL
         Igif/9zNyKxYbwl9d/6qwR85Ulm403Kwu3YpeXUGF0AixL26psreS676amrWpWxZLZpv
         qx2A==
X-Forwarded-Encrypted: i=1; AKwUvBy4k1INKWbW2sWnUsjMgAYWT9bzlCZV+N7wmLSiUqK+P2F//fQwbAKWGOJbnYrLizyUdmApTDBb8w17doI=@vger.kernel.org
X-Gm-Message-State: AFuF++nXW0Bx6IBQ3zC6GgaCYLzuXrxuxI5Jus7PqaFn9YthwvwKCIWn
	/lgcz5Z7j6oWsodxFym5tpZgACZhJPa63x5EOoGjD/8BSTpiYYHWfV6T
X-Gm-Gg: AYBFou2RiRXQCAo1CrgbjyDxzT2AmGZ951uvV4bD/nGOEXCbyvyWu8yXH2HbY1fouPK
	1EprAEaZSNibsQSTuUIXNtsCgrTaDfJZllvn2QChovIkRe4d3MwYSy77K0qAl2DmzUWs5LMXpmM
	wuPEsBG87M5uUrs4ukLoMYlRpDzX79kAZF81pHRowhgXmh3TvMZO6L62Z/DvcMJYkr15er2+LP0
	TEuDJWgIlGLdn6XpLDj8Z8lSorHPxwxPsqyFSmNwA8Ax3SKO/cpoJF4FayjOjKdO6QklsczlLqZ
	v/88n5iJxitmukzMlL/EF9XsiH3uwFxog9o+0Ye0dbQgmK5icjGEWk+K6WxmIpYQBYtWh31Iqvv
	7DneR0yBj8Q8EcSqFWns3tm18drgaD3OIr49GYMb8wTIGnp21iJ9mrBoLcQhgLYc7lvTE8QlEcH
	aZQ9GnU+SGyIUlH+q9DN/elzGdJAemP6eHAXNIsmmEe4dZylXxRXZYko2jsn2g8lXEZWo+86q6r
	JdSTOu9g2Ge6KgIQKmhLlIDmUfFy6bVuMLUhc2U792XkF5V8n7OQVnhzDh6k4RU1lJqt7xkK9+P
	4UmGGdQATYQdT/FzuYjE
X-Received: by 2002:a05:6a00:2e20:b0:857:7337:5db8 with SMTP id d2e1a72fcca58-874dd9f1d6cmr9505601b3a.22.1789841401814;
        Sat, 19 Sep 2026 11:10:01 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f8c39sm1190168b3a.28.2026.09.19.11.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 11:10:01 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] affs: check affs_bread() return value in affs_truncate()
Date: Sat, 19 Sep 2026 18:09:56 +0000
Message-ID: <20260919180958.1362943-3-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260919180958.1362943-1-benquike@gmail.com>
References: <20260919180958.1362943-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The extension block walk at the end of affs_truncate() does not check
the result of affs_bread():

	while (ext_key) {
		ext_bh = affs_bread(sb, ext_key);
		size = AFFS_SB(sb)->s_hashsize;
		...
			affs_free_block(sb, be32_to_cpu(AFFS_BLOCK(sb, ext_bh, i)));
		affs_free_block(sb, ext_key);
		ext_key = be32_to_cpu(AFFS_TAIL(sb, ext_bh)->extension);

ext_key comes from the on-disk extension chain, and affs_bread() returns
NULL for any block outside [s_reserved, s_partition_size) as well as on
a read error. AFFS_BLOCK() and AFFS_TAIL() then dereference it, so a
crafted image with an out-of-range extension pointer gives a NULL
pointer dereference while truncating.

Every other affs_bread() caller in fs/affs/amigaffs.c already checks for
NULL; this loop is the outlier. Bail out of the walk on failure.

Breaking out rather than returning keeps the affs_free_prealloc() call
at the end of the function. The remaining extension blocks are leaked in
the on-disk bitmap, which is the correct trade-off against dereferencing
NULL - the image is already corrupt at that point, and the error is
reported.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
affs_validblock() was factored out of affs_bread() by commit d5de9fd594eb
("fs/affs: add validation block function") in v4.11, but the predicate it
replaced was inline in affs_bread() since the start of git history, so
the NULL return has always been possible here.

diff --git a/fs/affs/file.c b/fs/affs/file.c
--- a/fs/affs/file.c
+++ b/fs/affs/file.c
@@ -971,6 +971,11 @@
 
 	while (ext_key) {
 		ext_bh = affs_bread(sb, ext_key);
+		if (!ext_bh) {
+			affs_error(sb, "truncate",
+				   "Cannot read extension block %u", ext_key);
+			break;
+		}
 		size = AFFS_SB(sb)->s_hashsize;
 		if (size > blkcnt - blk)
 			size = blkcnt - blk;
-- 
2.43.0
