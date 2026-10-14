Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C72B2459CF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977215; cv=none; b=F6NGTPUd1B5Gimj4WwjGans77KJ6Fmx7PupWPG+QuhieE50IQVESE+Wc3XN3/IFKoMbwonzevYqb56HzV2ZAhnkPKgVLpQYx6jKsxa+/uzAIPq+gyBUphv1lrdhxk7MocCCAeQmw9j1D6dM5dbrrFNfyjTRMbDFOQAZ555+eSjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977215; c=relaxed/simple;
	bh=i6zB31ECCBXxZNkEbgZKuX9jQosNHygMU3cudfxDrVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dyp6diLkAdT8h5jW/z2nGnBLOl5R0A5CKvnfXOr50R9YK45J9BCn648KfPa73CjlAUipPjynwgOMk9IduVBEf0j8eo4zjVb2LUpOrE/RDuSKkayGVRLrUampc3OUiuPaP/ddJbioWTLN2t7n0AmUEcTCjw71Z4C7DL8X2vSafmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cv72eDqT; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cv72eDqT"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2142210a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977213; x=1792582013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1TKQk69KHcjaDb24fEb/peTLu9FmofWYrxae6HA3jA=;
        b=cv72eDqTksmxYyCThXtT0ilxniLI0nc7k+mJ7odZc0IBJkf1kL6DLWet42A0BC3TDW
         1Bi+c454TSxZPGmPYl7wp3KNvCcYi/wJEZ770LS6p/dPf/BsLdCOk8KZ9poWhVNQohGS
         JXWSCH0TA2Y8xB6/SiMYswgI9n9Xwvj+28XYC8TXf96yESVggZCQc7K5bYqnH1pH8743
         GJzMunKB6JsrQIQ9QZ1VwLyPax9gl+2V4hEUzvfR0q5Ey3p/UxktnD/RtbgvXT9KT89R
         /w37eFRpiwkoxSqYJwfC61lfPplaPbNw7xbKq6OigL/xNzDZ7DJGxfisj9N8/IJ/FvBX
         6GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977213; x=1792582013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1TKQk69KHcjaDb24fEb/peTLu9FmofWYrxae6HA3jA=;
        b=Y62AaAOlRwOkxxHecUocL9RT6m3VuBwX5OG466cgL7EBCYNUjYJxcTd9qziRg5yp2f
         gB9UGZ2h+E7vqEF68giUrzxIrrdGb35i0q7Hx4TU/gmF6HaRhTAh/DOJeSVtP1M1lFMW
         xvqNIiC94uKIq5+e78OBH1OmkZ0053qa6JpMuOObYLhBtq0cyGpJ7paIO8dnvhNjBHVg
         MR0jgBuVWdrowMQVu89MD2mlFzRWuNS6EiqxVAc3H1gUbcHAgThhvvWIpK/IMsE4IbVV
         6OFSuai8hnD82IuCHDPFeXcNKzCkgHAdTf3DeKvmm1p8GO68grFai9NP0ys6Ais5qAzZ
         9tGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI6VwfdTVNnByvkpjam5qvAeII2UMCzd6RRJOG609qtyof7i08oEmGTTDaUYhGffTvtiUOhdL+U7g0PoI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNT/oGoygZYJjG0+QpUVDeF8t7AQZPAGAzAyfLjSGVOV3jDl8N
	VqHiACngQ3Oi0vUPgdgUfvUZjT+t9YsmU9MAl83jSfx+UrZDWIjYD8ev
X-Gm-Gg: AYBFou3vKu5wDqsvws35LFcHj3C3KJ7jKqEKsZJCbOg5Tq40/nj8qWXVI0Vk7C0DxHx
	xQMe7+BlqTJg/ZZ5BkJcNpa8ZHo1Sx76mVmBofHXVSJK0b95NuCqzei0ODBQbJfC5dJrxCLaHXO
	/rdFeSAha+zRNhhfRk940H4lEzFWBLp9rQ21oCSdrIr8ip4Kl9nlp1HDVFXd17OvWGk9h4inBiq
	0JJnFaRRO9Ye1/45avdA4YWv4ng3ZHiaSM/HNvqUlbOluHczrSjBrNKfwEb5x5/9Ehf6J0DuZx5
	8OQMVrjW7NtGhH2xPsjV35S3wJ4RDa8KGIuGH9N+9Qt/HLterom9qG04xvOrWNorHjTHlnYBWH2
	8C6zkHlANXX5WPbZ+/TClTewXpwEx9LgHPU6S5YFuyhCXCoEEKtTbEmRhXkf0kOb4a8L+hEU9BL
	fmQX6ZU1rFWY2afxwy8xKMlVxFNIOcBek1YjmDOUCRONsKPooYc3EKgEOypHKvgCvx7bPhEwLBE
	KgF94V9IYRInWQ6xcMS5ol/gFb01b9U6z6s3y1KRRYxk+VtGQkCPtgXwEq/y7VLpPWFS4HI
X-Received: by 2002:a17:90a:118f:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3ab8288c567mr4759379a91.24.1791977213408;
        Wed, 14 Oct 2026 04:26:53 -0700 (PDT)
Received: from codespaces-2362ac.m2fxbej512jepnsor2itp05j3d.ix.internal.cloudapp.net ([23.97.62.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f05083fsm4508247a91.1.2026.10.14.04.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:26:52 -0700 (PDT)
From: Seongjae Jeong <jsjlee1020@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Seongjae Jeong <jsjlee1020@gmail.com>
Subject: [PATCH] f2fs: fix submit accounting for IPU writeback
Date: Wed, 14 Oct 2026 11:26:29 +0000
Message-ID: <20261014112629.59861-1-jsjlee1020@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f2fs_write_cache_pages() uses the submitted count, which is set to
fio.submitted in f2fs_write_single_data_page(), to update nwritten
and decrement wbc->nr_to_write.

In the OPU path, f2fs_submit_page_write() sets fio->submitted to 1.
However, in the IPU path, fio->submitted is never set and remains zero.
As a result, successful IPU writes are not accounted for.
This can cause asynchronous writeback to continue beyond its budget.

Set fio->submitted in f2fs_inplace_write_data() after a page is
successfully merged into a bio or submitted, so that successful
IPU writes are included in the writeback accounting.

Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
---
 fs/f2fs/segment.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 453f9284ec86..2e19124f1463 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4298,6 +4298,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 	else
 		err = f2fs_submit_page_bio(fio);
 	if (!err) {
+		fio->submitted = 1;
 		f2fs_update_device_state(fio->sbi, fio->ino,
 						fio->new_blkaddr, 1);
 		f2fs_update_iostat(fio->sbi, fio_inode(fio),
-- 
2.53.0

