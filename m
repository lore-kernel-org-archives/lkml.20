Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791420;
	b=0g/T2aErs6EhE7eEBFOReANUOF1NkpMyVYhfnBF8bfMfwzXhttHRDW73d8A6+zw5bvJ9
	 +r0Dnfc/Nazx+pZI2Xy6dFsOZXGbmq6Tj3mbkdRnwT11iufSWpKnpEH4oXpeUcQ0ZnApu
	 w78YaYh84kdLbl507h/Jeo+T+hXx3Iee6+41isNDl/yF2no6v5UIJ/L6JEb7K8f7sjrZ6
	 cYI61zqm4kqgrCDhO2RD5+yDgN3834toDOxWtakPvrUc9tPj5yb5BnEorRWhxuZ6y7n+k
	 58QxoyBbA9evKd5zRvCKkZf1N5stC/n8LEKv/o9BaVWISyrSfnAyuPy8bJzTkKFbAJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lk9/6hT+VNSIJmASQM87OvbXZ/RteGN+GK78gZKzHZE=;
	b=Wnc7pZi9i37nRx/u/k7s3KpI7+95dI9+32/OQ4cUI5mzoWbc69+FWH0gEdcievh3iVhf
	 ap9LTo/M0gNmXtzySMtVCwWBA+AZzbaKcDUEtdlVS8pNdCAc4TGUGBEQRP66dndcGRd6f
	 gHueNDD2CGgaaFp/EP82k2qkizutVQKUpFNwtPdejWoFnUQ0Djh9e9/c0fPVXxIuPNglV
	 X4MlJDIsXw+TbGjbr/b0vDHxqhb+BZouCqL7M/EnEtXeCWy3/RdkkdQJ+7BU5SJMgjDBC
	 P35pMwEccSLW9cGsRYHXg7DIsbNa3Qzeezn5nzZ79kHM4XZ3TeCVRhUYUBoA5DJGr1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfGwjTFd;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A51C606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A51C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfGwjTFd
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36d94af5b9eso940eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793791418; x=1794396218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lk9/6hT+VNSIJmASQM87OvbXZ/RteGN+GK78gZKzHZE=;
        b=UfGwjTFdJc2f/tcsb4Xgjtx0MV4UR/nA4OIZHI2G3C7kk7WlTFFZhYr0DCwmCwQQOc
         706kQH149rwZCeRGAVCHn55ORHE1Q6CtmH8Ub7X8OPGaHouQWSo7lmgLLrVg/kta3E69
         CLf4YQSjmZXrXWCRKQuISr2JAit5Vuc6QH8RZejYUtcvPUuyNKOYjEYu6lk6IlORlnzx
         6uRjCa8OOV8yJWpXX7Lcl5Y2Rs44pl34byuPTJCZhw2wyuRoquqjud3iFYc0vbXu41ZZ
         eTSNMGDiwthZ/0TRpH8uZeBS18LekhySohteGd9guS4hlj7o5bBfgDLjsYWmg/PpW12o
         Exxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791418; x=1794396218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lk9/6hT+VNSIJmASQM87OvbXZ/RteGN+GK78gZKzHZE=;
        b=N3smQtSYJHFOOW05PCDkmvaWq2iK3ni02IhCg0wPbYe18FbC95fDOG472YG0fjvPl/
         i472tqeJjMD4mq6z14kG9K+W6hJjHZDhSWCgb3OMSj0mrM2BbZ+pli+koGvQiNn00cgx
         N85NYE61DI7RIoqKWdbtLlvkEgjyKIA6W8YNuhKBO8SfNtKO+dDXLOK+8738F84mPkyU
         wP11aWeZVEsYsbYMlt8byzKmNiZzIp3R0jxXow6KFkSbELWN6Honz1lXFqMq5apvnrTl
         F/x4JAKHyWpcyrKo9Wx1X4/FVn/F6eTSekd8qRJtlot8+epTyUFRJ7LIqkZKbKlECECx
         Fp+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwcuqL0fdZfcadqGxRu1gvCrhbNWialfZQKiJeeDB8GbGgr3G7013Yswxy5X6U4knHaeTWVgOOwz2jk+Pg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C3/hR9y5Y6chRQytLAldS3r2SlBdUf2Xxp1TSgG2TEjkzFgI4
	LQaxwSw/6C+kSk0LZJrWCqk22kUoxjksok5dLRdsz7PMSqAVT9kU0lai
X-Gm-Gg: AYBFou0wz4MIRa6bbwBdI0ErLAwCrxAEDskVVm0ZvvRlqV/sYgVyIJJBSNr5L1rcyGy
	cbpXAXB6BHt+s9TbMU5+1APSrfFcT1g6GUKwbKhzab9JhROeuuUlcgyvgrzx8g8vVMnMI6rVXE7
	nk1lqcozNQqcZWVYYtZFC07D2wbzbhQMXHkVjOytUGnOcGWWF5v21VCtOkbP12ZTcuhZsJiNmVs
	fYH1cs/NvoKzFLW67FI++bI2lyWk0eKgxjsBCRdsQoX9Oj5veQ3PcOy/s8CRSuRVsib8KgzIXdG
	13rNBKk9FK1MWF3RxbuBz5inE5XybfKFI37rMaNr7BHeeQCDToKrDjEfarJRa1qLAbZGN96CZFF
	bOBZZFF3m0LW9F4htwPxrlJuOVnufLjhwIlXGH1rBMnQ2ki14dDs1EMxjJLdwj4vP4j4L2MM9Hu
	vmsP94Q+DpIo+A+GSFcaaWjyaUnMgpzkxZGvgczl8aoD8vT993JSqGE8ZXqSUG7AUZ5S0KPl637
	d0tYRaEK9kzUfRsyxShErOzXQCXDv7agVahFDyIxRQpyhrIgwyLKePYKJYm3kqhfNukVQIIw73E
	qUt0sKsvfJ+erOqDyLfgaGmsIV6gbmwul4oY9ZDATr+Eu4SPFZAurzSs/ClMUDfloJ6n/sQ7AaQ
	q95e4WmBcuSRKk1Rz2T5GV50s1iQ0Duqg2Us3EA==
X-Received: by 2002:a05:693c:88c9:20b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-36a42444bf2mr25229379eec.19.1793791418192;
        Wed, 04 Nov 2026 03:23:38 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39c5f0csm6285277eec.29.2026.11.04.03.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:23:37 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: me@bobcopeland.com
Cc: akpm@linux-foundation.org,
	linux-karma-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] omfs: reject writes starting beyond EOF
Date: Wed,  4 Nov 2026 11:20:52 +0000
Message-ID: <20261104112052.5604-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

OMFS does not initialize gaps between EOF and a buffered write. When the
requested block lies beyond the allocated extents, omfs_get_block() grows
the last extent and maps the write to the newly allocated block without
accounting for the skipped logical blocks.

A one-byte pwrite() at offset 8192 into an empty file returns success, as
does fsync(), but after remounting the byte is at offset 0 and offset 8192
reads as zero.

Reject writes starting beyond i_size before block_write_begin() can
allocate or map buffers. Overwrites, appends and writes crossing EOF
remain allowed. Gap initialization can be implemented separately.

Fixes: 8f09e98768c1 ("omfs: add file routines")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/omfs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/omfs/file.c b/fs/omfs/file.c
index 79a413f1dc0..82c15756671 100644
--- a/fs/omfs/file.c
+++ b/fs/omfs/file.c
@@ -317,6 +317,10 @@ static int omfs_write_begin(const struct kiocb *iocb,
 {
 	int ret;
 
+	/* Initializing a gap between EOF and the write is not supported. */
+	if (pos > i_size_read(mapping->host))
+		return -EOPNOTSUPP;
+
 	ret = block_write_begin(mapping, pos, len, foliop, omfs_get_block);
 	if (unlikely(ret))
 		omfs_write_failed(mapping, pos + len);

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.50.1 (Apple Git-155)

