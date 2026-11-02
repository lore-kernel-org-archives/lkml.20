Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648424;
	b=kZcTKirSQeQuP83E34l57MfTXNXWYLja/Z2lQ4wavyIptAbz1Ax+uJ/M1yaey9YequtV
	 RhwQZSN+NFwg+q+ZYyy6Lx+7ZOrhhKoi3ze6Iym2F6cIJ0ULTbpsM+0C1+Lb7XMBdahIi
	 Fy3VlA16ceOUHowPsu6rNFT+6tQQS//nJMoTQh/B+t1QrHQVENF7I7bqHzXHgwsHGtnra
	 LDw8datQR2TzedLSzQGDNNogkTywrWp3Hjw8wjjIoPiajkKuUaBsdYVm6hmXAQy87ZaM6
	 nmpTZ9yiSFrs/TEm4RrktOAygVQ+5dvyXMywyLQJLT0LXyW4y0p8mBnOYkcAbNxQ6fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F0LkGc0IY+tztiqbz+e9wDBwhgON6uLBkjFz0/qxkac=;
	b=QGhYZ+zd2Spxk8uaSzbscxw/PCzg/J805XKOfcemeR3R6oicguU91MUKGK80xcsxysHm
	 Pk4ttCHnrtpCPe6KXreqkDQ5u7DY3dMqbKtVWTXZURpezVGVkfho9ozCxejzR8lI6q8AE
	 2022sNcd+Se+18vrLIBQRdqV2AgTZ2MJIMLWhW3Y3Q7abu5UoUDSG1OAwI/WRFl6fUNIz
	 bdr7LD6nhDNMWwhOnWAf1285jBk8ujmimnz3nCmGX1blSp+gfwKR9n+HuAH/fQS/tiVYN
	 Ap5D6gSlJzrx6E0TZQIisJfQdP3zmnfiJD8gOshinwdwWJsoss86BKAby+UhbTmP8nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HA3zW+IE;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0114606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0114606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HA3zW+IE
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so1560131a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648423; x=1794253223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0LkGc0IY+tztiqbz+e9wDBwhgON6uLBkjFz0/qxkac=;
        b=HA3zW+IEOBSNSkuOIWg/xmU97JqwpKLtlVuUcg1z17vCeFYnFM2my72HfXkRILw6jp
         wld4NopgGBaxndd0/YiLrIa94lN7PL1i5bXwI/AsiiFTY0taxMuZrMKioe7eTManNwjf
         ePCSNc28TOC0Zaw4OHK6z8yE/ax7TX93Q7x3kYVJ+FQVS4NZ1LvEaw6LQPqAI3jRxjgZ
         Lx6ikqNz0dT9pGGDYDQgp/Qc6bjMw3zr6SwA9Rzjob3hWBCI+3DZ82c42WWjV8x0Fqyx
         IauuZttHQvLUBP7vH2HuQrNGtRNVWw7AWcNJfKyTKaUg2KJCeYYzPxaTKnngfOWVAj++
         my+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648423; x=1794253223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0LkGc0IY+tztiqbz+e9wDBwhgON6uLBkjFz0/qxkac=;
        b=wUFvlwTJ3H/lJL/JtIANbxtS1ZUa75B+u+FpLqXffdCjncu+VVlT9DifCgHDwurztK
         +8Q9ptirrYSOBXXabo1AnI+ocdFk/YNML7TXqBrrCk4HjgZkQ3e/iHJNpMIVXQ4wh6a3
         Z7JMl8Kr7tJV8BVcnvUvzvbyqaHYvIRFiLj/pZLRLpRLe2/Wz5T9CwhSBky+Vb8p+RBa
         AZsn8uKM7uzsA7BzSFXDaW3MpVs8dhn43oPCx+mulSa0DFm7mIB5NjR+Uz825t4x3WeS
         tq8bzmVUatOKOuqeUMndaKeAHdmzbcBDhGYwAbz07BW+zlNv/6KgUDaBjDmyeL4SB/Er
         qizw==
X-Gm-Message-State: APuU4Z822a9V9SQYkgtsXQcVcn+1Pq4GK1h7yAr47h4KKXJxdJqEF7xU
	Mlgk1W4fYxkY5Uf93hmqzqhJPT5XQQqW34V0qupvLmw/C0BQq7uFIGY6LCXGTFwO
X-Gm-Gg: AYBFou0OkqO1bCdmU075GoEGEVea3+OfwBbACsnICOeIBGEa9FbPMiCOqXGT8DAgu+M
	gXcZ/lfzjv0l3FROUQE9JXQ/knuqCFIUhuqeVeRol4ODBhSHtpplvxpMWMWr4S0lla1JahOb9PF
	U7LDzBQKkJ24nZz2QtjomMET+1a9+BEH+GOwOi0Fz4u9rdDskwoattPzfJ+WW5Z5Fr3YfSr7a9s
	TgrPsH33m/4JyPZ1QluxvPFcxiS6VOBuS7nFClALW0RvGG2vdTQUfuINdl4CkNoKMTdpEYY+0J8
	nRLA3CK0Zz1z67zpdoae11z0YpBENb4ITGPWrk8p5uXJ3Ni22UJBer1Jh1Vop+rxLIP+ts4aIP1
	Phc2W5SI9LV4amf6AqQP4N3RiO6E1ycOhbnDpJAUK/V4uGK2gYXRgB+hRTNXh2wEmAl7cVpLLyQ
	l1xquOSOdZ+zDjuFALrCLFPB5a6eO4V9nSDhSTNl2NoKO541DEXRm2RtzT9TeeIIhicojLTQv0e
	zSXHE2z1Xv/CzjhB40qy1nMWOo1htx5ReupIzzyBkaryxT4FZgDIdtTKjilNO3Ji/pUffoYvozu
	/WjlhsoSjwIS91eIC9+6rn+47E3eASlsacyLeeTWmip994/q+CrNlD6WfUIQS8mtBheIuZh433O
	nTOC+1hcDD9ih6mLRWWI3JngeFFPsqWyR24lrSTAS7mSflQ==
X-Received: by 2002:a17:90a:ec8d:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3ae897ae130mr8244693a91.45.1793648422986;
        Mon, 02 Nov 2026 11:40:22 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:22 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 09/20] f2fs: support subpage blocks in pinned files
Date: Mon,  2 Nov 2026 11:39:41 -0800
Message-ID: <20261102193952.3002018-10-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261102193952.3002018-1-daeho43@gmail.com>
References: <20261102193952.3002018-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

Pinned files must not allocate blocks outside fallocate(). As write()
does, return -EIO from page_mkwrite when the folio range up to EOF is
not fully allocated, and remove the -EOPNOTSUPP checks.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e68553cef777..36da0d558ef0 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -240,6 +240,13 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	nr = DIV_ROUND_UP(dirty_len, PAGE_SIZE);
 
 	if (f2fs_has_subpage_blocks(sbi)) {
+		if (f2fs_is_pinned_file(inode) &&
+		    !f2fs_overwrite_io(inode, folio_pos(folio), dirty_len)) {
+			folio_unlock(folio);
+			err = -EIO;
+			goto out_sem;
+		}
+
 		/*
 		 * A writable PTE covers the whole base folio.  Like ext4's
 		 * block_page_mkwrite(), prepare every filesystem block through EOF
@@ -2280,8 +2287,7 @@ static long f2fs_fallocate(struct file *file, int mode,
 
 	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
 		if ((mode & (FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_INSERT_RANGE)) ||
-		    f2fs_is_pinned_file(inode) || f2fs_is_atomic_file(inode) ||
-		    f2fs_compressed_file(inode)) {
+		    f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
 			ret = -EOPNOTSUPP;
 			goto out;
 		}
@@ -3823,9 +3829,6 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	__u32 pin;
 	int ret = 0;
 
-	if (f2fs_has_subpage_blocks(sbi))
-		return -EOPNOTSUPP;
-
 	if (get_user(pin, (__u32 __user *)arg))
 		return -EFAULT;
 
-- 
2.56.0.317.g454f8302e1-goog

