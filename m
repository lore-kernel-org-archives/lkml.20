Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600225;
	b=2CTnRFJcF8sxsX4Egx3RpI6jP8GMx7uDYpPISgO1XYPNGYaaOUKF+/CAAf7FCsgU0MVW
	 Q2Gy7zVNf6xfkxPgavPi0O8S+VHp0IQFq42jTLwewNuIXsDIP/RxX+wNzH+JxLrmi9c6D
	 I037VQqmZkzFE5QFLOeuLmHxejg5mfNTbp3ZT1LbEJswXgBTv5+1cP2NUhWDMo97CC5Y7
	 tiiS5XCHo7aFmjE02oAZRI3CkeaM/HxMPyDNU1eNRD+UwZx1SJtTZIh0th9EMveJ4L2Xl
	 IwMwt4iVDN6ETJV9L5E6HUikrT2+kgwqERxs3jxiaQsreMNiYM2A2VKrSp9Evs+lNxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JIuVYhzDr7tBsDpbhyh1CCeaiWBRpMDlHv7fDLl13QY=;
	b=Xi22t7Fb3Sw995xkoMTlxRhsvYLgmn3dbon4mgDcHYnoVnfE8n7PMHMuCxrCFuBrXOUW
	 YWhFfgbOgyI3JLX+KIaw6HYl1IMy8mR5ToMw9wTl+I4p7FfKyzLMSMHjIrzd6ed9bMSs6
	 LW+PDVG4LQpzLf7gWgcHw5oT2agg8rXaPshjU2KGHTvn+sjmceANlq4ylnwam0pgN1akG
	 1Ktq1jcBnwhHI2r0etqAjdKI6n7ROXIDoKKE8o/JGoEqPGd3haZf9SkmW+7J3BreQvzJ2
	 fuBpZAE9uhubOCjPC26t6oRhOKMiMA/8mxRw3wt7M+pvXuLBGiLPdcqrPWSLYxnExUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mAr9hJBE;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04C8606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A04C8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mAr9hJBE
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-369fd8abd71so2907799eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793600224; x=1794205024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIuVYhzDr7tBsDpbhyh1CCeaiWBRpMDlHv7fDLl13QY=;
        b=mAr9hJBEtrch/cLsG+l8iSEMx4rie4Rq4wlLYZk8IblWD+idnG+d8AlYE8h1J/sL3d
         /LjNBZa6flPW/Y6ma7ooi8LTW7ZzlIICfQYKXRnuVi7zPSQwFYRkFdwvRZIjKI9BzuGn
         Wt/shzDTFefyt/XpNgduVodd2GE4fL86Jmbsz+eOod0tKtp0YIqLY77loE/asc9gimx2
         bIqcYL3qmBQM8E+30KuNspN3diiprMKamCjuXBneBj5zDNedznko9Cbv60tQNuFAYRKH
         rXsW2ZPccAGZp6LU0u6lr7T+YMmtWyyYUsLBHF/BUUtDL2cdqONMsY9rw2F9KLfK9hr6
         SQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600224; x=1794205024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIuVYhzDr7tBsDpbhyh1CCeaiWBRpMDlHv7fDLl13QY=;
        b=rSJ7P6TrCJfAWC+Ti1teI/JNoPoFqhRX3F+IRHy1xEYb36LHkG+3xkR5a+5s/9gO28
         hXj9NR8vV1oQmBGA7CU8RYh5+Be2B2G5r1Ec91bHD4YSdeJbRnlU9VZCcJrqlxc5/iP5
         kkgEsIA09HUPveo8fERNoNVRIWrtqumkr70jAaNWEC6QibqwngxEOH/eiTylGMpl/1Vf
         c0XH76/mX+dLyiHzqYbm0ZEY3Sxv56Xngl3BZ1XdlBlAn2gP8TVv4wwLVT8C6rcTaCnN
         qPLatnEZ96VpaECpLaSIEqp6o2zqjAyjWQpkceRCXiAdYv6ICwYVqFT0o7ly74G7EiU0
         8ZSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaM91ImSD1CGkVseTQhLKpyZokP5UhbE9iq72qcO4Ft1ctEkRMFCtBnu+J/CL+wDXRmttC9rPwvUh7Eng=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZKjvrLYVi6gCr6VQBpN4D5l6HJRqJG/yQlVRYk+CmmZT9uoNx
	nx0rdszbx2NBBadkTtI2r+60h18rhunCf9hyaR1z5AO5YQmJxKT5e4k8
X-Gm-Gg: AYBFou2DxyxeqHiAAxw2PUsXyiASvh2NLyGbV1FwpExc5+zTtCKOzygVJfLS1JcoUL+
	DF0ad6wB3/KfRmHShYUeUjvNFcGRcYK0wp+6jkO4Wfvtp7I568L8RG0lvuYDJ7KRd/qg5TAsMv8
	M3zkVMBXnA5mB4Y6LudDrxcATrtaUb68X79VOWbyKxnXAbpAh55a+ZWfPcjWxKhwdx3siR3vMAa
	FPrcmj9jQvkd6IoARPFAERfU599Ps6WDci7boYW0Es7sx1mirkd7b5cF5mEFQJrtVWQb/eQIqms
	txsdG/7LBOn0HPC1pStXp0uOYK7+gQDsVCv1Co2JdjigkqBjZMSQOyRzKdGJSSX+eOm7jazAs+v
	XC89Dt8nC9OeVe/aCJHzCngMTmq2DTLTwhItj7cuu4FhDkpHbYZWrZLKe2wF3QWgqch3LKEazga
	m35wkBW8dYLotbl6XBY+EYXcqHMpceR+S/ZPCxw4cgwBZCKwdwvAxgK8rFuh3SSxZ6ErH41aXBA
	tf0Tai6O2L3YZWKIlb1i9mM61DC8bE+Y0vrV6lGaIgnYIiwjcg/6e8b/T1M3QaHoapAv753Q6R4
	dEdJHOU7o4dRPENHHe71icZVEgtKMMBUElCWDNQuh1yE3HiOPwSAYB4C
X-Received: by 2002:a05:7300:4353:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-36a42434630mr21125404eec.39.1793600222582;
        Sun, 01 Nov 2026 22:17:02 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm39820872eec.25.2026.11.01.22.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:17:02 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Jan Kara <jack@suse.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] ext2: preserve completed DIO bytes when buffered fallback fails
Date: Mon,  2 Nov 2026 06:15:55 +0000
Message-ID: <20261102061555.55183-1-dennylin0707@gmail.com>
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

ext2_dio_write_iter() can complete part of a direct write before
falling back to buffered I/O for a hole inside i_size. If
generic_perform_write() then fails, its error overwrites the completed
direct-I/O byte count.

For example, on a full filesystem, an 8 KiB write to a file with an
allocated 4 KiB prefix and a 4 KiB hole overwrites the prefix but returns
ENOSPC and leaves the file position unchanged. GNU dd with oflag=direct
consequently reports zero bytes written.

Preserve a positive direct-I/O result and return the buffered error
when no bytes were direct-written. This restores the fallback policy of
generic_file_write_iter(), which ext2 used before its iomap conversion.

Fixes: fb5de4358e1a ("ext2: Move direct-io to use iomap")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ext2/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ext2/file.c b/fs/ext2/file.c
index 67fe423c3828..8ddc149d4884 100644
--- a/fs/ext2/file.c
+++ b/fs/ext2/file.c
@@ -145,7 +145,8 @@ static ssize_t ext2_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		pos = iocb->ki_pos;
 		status = generic_perform_write(iocb, from);
 		if (unlikely(status < 0)) {
-			ret = status;
+			if (!ret)
+				ret = status;
 			goto out_unlock;
 		}
 
-- 
2.43.0

