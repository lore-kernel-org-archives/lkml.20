Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334561;
	b=k8VPZKhK55VWPlE3cT06JPSJI99P4LlqKUpIcyshgfoy2gTgqSmfum/lqH/40XztgX+K
	 XosVasUXvoy+2P2S+2x3ftOOJ6GRUL0ntytwB8foAZ+GLpehr12oKLKuR5W4GvC72lWcN
	 MMgjCKgOF3UaaGjzWikme2lllPkD2LhALhH3PyrtvxTR+10lz6Mr0Lr7QYEVbc17MCi2Q
	 8h66Vbmb6vI2sXoK0CaORuTFP78NkrdvvHkZuUA032PhrtIpn1hoWs2zz+1wWdoVWLm7e
	 D/BpZe5adbiZKy72y/csY8REPKLJzUqIVvAf2Q9paxDgZbVcw0H+Ompwzal/kJnf7JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WAgjRnjnnTYEYGCit5YnSshprwmU8petoCTh8/Dj9t8=;
	b=3nniUCQviap8Xgb2rCGSzyGHbm4cxg6OiopfuE45bC7ggqI4toEJoCvqA5okGiUe30O1
	 woIQVujQ5wLRupJoratt5jGkPF+orKmq/iHTMttgSvBpHMhbP2iRv6kVSm/7idPM+gsIY
	 WUyXIgTzWTdavysYiap5szD87BibDr4AAQWqWMyAImHnkunxbXInKK2ZlHHQTjkyrFEf4
	 fLv6Mk8oX1monA2TAWGaJkyxZa9g1I/leWj9kgSqS2Joli7ZEuWjWyNxZ1dsV9Wgr60hy
	 V1Yzkoe+oLPPgPE7eI2WgSJtKxNgwW/xX0Tj2HRMq3veaycBRp3TVTn3eEF3550FGbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=V1kHecWQ;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FF2606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3FF2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=V1kHecWQ
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91c791d5460so4134406d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1793334560; x=1793939360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAgjRnjnnTYEYGCit5YnSshprwmU8petoCTh8/Dj9t8=;
        b=V1kHecWQpbCK2IinlXdXNiWGNXKdn9T2qVdSNVWh67zBaPILWWK7YmAPnGBWrMDfQQ
         neN3fkE1j85jaHkfDolxgieFQn6tzj1AE8B8N7JueLTE8IVyw4iuc9VbQJGl/1IEkt2D
         TG2TFCL6ozUtc8ZZTJGMqdjZPggzfEgRVT5SbHWjPiQqqnkmuN/V6yZRwd5wwBSL2cJQ
         eFmqVyYWQ86znE6OoFzpP75Uo3rKoYancp+CgJFBRk7DpGDthr69FzCRgnZMC+TZnyWC
         CNcR62CXss8xvpe1r2zSApXhoO0S1tPWrNPj9SMlpNS2iPNHyKxfNOGiz/7ZNH6GF0QO
         nmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334560; x=1793939360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAgjRnjnnTYEYGCit5YnSshprwmU8petoCTh8/Dj9t8=;
        b=RvuZCUvHwPGJa/xA0kS2z29+DwY12tjajCcLCUtcJcdVyZQqkFv4yH1KwLCXhKXf43
         rAk37pRSICndIRabG/hPpRhUQUR61Dzj33Og4kWJhhYX1pFbMuTv0/lyDY/d1XL2AHa3
         XTaT/HBShOllzo0T7GX4C8QKGJRJIDDTc90s4q/uQ7L7CbAgZ2glCy677hGIsQ4hasox
         A46HjByiK+d6/CU9nf2hUQJ/Tu2W6/DUX1PMbHAHQZxvm3ojay3o+ibh8Q+h48ubdRcY
         kEizRtquxHvKsccm40rQvbGkXXq7KDZFcV3MkQlG6tPQv5/NnMCQBuQY8N9wl2xFWNxS
         lq8A==
X-Forwarded-Encrypted: i=1; AKwUvBz282EBKyk/DZTVVoNk/4UL1ZxeVyjHSgJeQOOov4rPCaeMX/34BybcCg3Z0tYUqqcxdtBeZkUYSmWU/j8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDDUYL1bdGd4nHfmULfev1gnyFkwL6MsX4t3Xghjv0rci9+wHT
	ydDiOzWO29pYBk0HqpNWIsM3m9wkXIkUhqsGXZnykSoHkYvG1U806p7CTGMsKhkMcA==
X-Gm-Gg: AYBFou1pvjyXJ10Odxifjd0+4vujCqwzGhOphWuGJNMzEqf0rdrvNSGgPqHXURM3uGV
	18zeqZlu9Sl7m0E1Kxl5ZoJxn3PbmOJgv0Y9dwHJxdEfzbJpGm07wQUkhlq9b4BoS+96v66uUTd
	Wc9HlyrPOcUWuF0S9shF0NiGkgvsMPt66O5yeV4C6LDBmqksCglttGy4MlOlMA4JUHZNiaMeyge
	WcFLIamsRTpMTrLku87m/G7ZvqEX7dr1jiRRV9Mj9bs5Tf57OfXuP7rZdvA4gXwKetk++4doq66
	//f8Vyis2LFCKZzrdBCf2mweta3r13QamEv9xYtC/YeTvDB+gNZxzIXjENCQLcLP6NpIdRxl6cX
	Pz0gLlZ2/b+UOa+8QE1BW22YtDxSuRqfiPbJCLwmA19wzRm9olcq61HtjSWWBLOWJydHrm+bqHr
	CdchJxP96RPtWcuYrlIAm547QY/PLfkboLZPqaQ0+d2Wge4fN1nebzp7AIyY5Sou8PYI8lH0SRG
	8aRVWu28kN4XQxDThkRBEKrLEYtZoYxArhlOYHZuFc/jcJPXMZhbZGHXqC4t7DaP8+JOd0KmdkW
	PHM2MO/VV2IBrpItkUcUlVQQbKq3ahNFf27v21dTXORv0krIF3m0mRIqiWb5T0aeA/98RkCXDQ=
	=
X-Received: by 2002:a05:6214:4801:b0:917:a253:4f8f with SMTP id 6a1803df08f44-91ca4b6f554mr14970576d6.40.1793334559740;
        Thu, 29 Oct 2026 21:29:19 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f254a1sm5058166d6.7.2026.10.29.21.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:29:19 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: slava@dubeyko.com
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hfs: fall back to buffered I/O for direct writes past phys_size
Date: Fri, 30 Oct 2026 00:29:02 -0400
Message-ID: <20261030042903.4160506-2-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030042903.4160506-1-hengyul@cs.unc.edu>
References: <20261030042903.4160506-1-hengyul@cs.unc.edu>
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

hfs_direct_IO() passes direct writes to blockdev_direct_IO(), which
does not go through hfs_write_begin(). When such a write needs a new
block, hfs_get_block() only adds the block size to phys_size. phys_size
starts at i_size when the inode is read, which does not have to be
block aligned, so after the write phys_size is smaller than i_size.

However, at the last close, hfs_file_truncate() sees i_size larger than
phys_size and calls hfs_write_begin() at i_size, which zeroes the file
from phys_size up to i_size. As of now, part of the data that a direct
write has just written past the old end of the file is lost, and fsck
reports no error.

The issue can be reproduced with:

    truncate -s 32M hfs.img
    mkfs.hfsplus -h hfs.img
    mount -t hfs -o loop hfs.img /mnt
    printf 'A%.0s' $(seq 100) > /mnt/f
    umount /mnt
    mount -t hfs -o loop hfs.img /mnt
    xfs_io -d -c 'pwrite -S 0x42 512 512' /mnt/f
    umount /mnt
    mount -t hfs -o loop hfs.img /mnt
    od -An -tx1 -j 512 -N 512 /mnt/f

The last 412 bytes read back as zeros instead of 0x42.

This patch will make a direct write that ends past phys_size fall back
to a buffered write, as fat_direct_IO() and affs_direct_IO() do.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 fs/hfs/inode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
index d9abab2a1e61..d476a16f4ef9 100644
--- a/fs/hfs/inode.c
+++ b/fs/hfs/inode.c
@@ -139,6 +139,16 @@ static ssize_t hfs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 	size_t count = iov_iter_count(iter);
 	ssize_t ret;
 
+	/*
+	 * blockdev_direct_IO() does not go through ->write_begin(), so it
+	 * neither zeroes the file from phys_size up to the write nor keeps
+	 * phys_size in step with i_size. Return 0 for a write that ends
+	 * past phys_size, so that it falls back to a buffered write.
+	 */
+	if (iov_iter_rw(iter) == WRITE &&
+	    iocb->ki_pos + count > HFS_I(inode)->phys_size)
+		return 0;
+
 	ret = blockdev_direct_IO(iocb, inode, iter, hfs_get_block);
 
 	/*
-- 
2.53.0

