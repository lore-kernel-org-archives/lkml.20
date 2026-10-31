Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793485716;
	b=kNh6SZji//D9moeDFtN+CJQkNWWguMkjjZThUmYFuv4WKWjalU8BHwxHTtz0avcg71hp
	 BTAU2dsQ0PWb2KCFVHvp2/CYjFNA07NhzV3B4FdDTmusQo98N03LvvZPoqfGafKueKHVr
	 npYZ9/SZqJCcMPMMieKCUJaGEe5l+QqdoiNLjkiTGkZRtTlANeMVRNzYj34OKENHuyMzD
	 hJReNFtkNeXe+R8PP9i93wwzoV320m8QwavvQ5fElgbVCc6pARP0bxFo1zsFgALzCcAWU
	 WODDeqL8AYJBLr57Ag/dgBX9L2szJ1Mc99snUPhVS6YEEsx274TwGH4SSEglmRX2AcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793485716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m0JnkbHJkuPfCHVuDrGb2+stBd0JEX0qG9o4dkUA+8w=;
	b=465tlsYOcNrkqKYOg4rmCo9kScLGrjFRIiRYrYs6WqfGdhxnuR0x3WrxyLmbd45skuAp
	 yHJaPNK8L1Cs8fb6/Ky6F/0hJC1U4Ngwz9xtI+1Rz5l+N1/VfOF9+uLOftqPDS+T9Bgwz
	 AMg941meqylzx1O4X15Ycxtkg8bGPZ/WdJz5WfOPkHqv4wqXm6Q/v/pi/d5Qy2Al4Anaf
	 M4+4qoUI4KgYQCkfNlnT7v7cnGYn10SW5nF+LhyI3rDynVWExfx6dBotMm5HKoMfROReC
	 YLE7EClok9s851cE2+BBffRuq0KIGuoFDVk9EcIHiEODJ+ZQhXPHG62TO71XV3sT0Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dgBwhI3y;
	arc=none smtp.remote-ip=74.125.229.136
Received: from mail-dl2-f8.google.com (mail-dl2-f8.google.com [74.125.229.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71EC606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C71EC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dgBwhI3y
Received: by mail-dl2-f8.google.com with SMTP id a92af1059eb24-15901d262aeso19889c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793485715; x=1794090515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m0JnkbHJkuPfCHVuDrGb2+stBd0JEX0qG9o4dkUA+8w=;
        b=dgBwhI3yf26UwLuKeQmvpbcyMU2C7cg/wIucp8d0W3AG3ij8p908y0P0SnXHzdgBAf
         eDjsBGtjxZexsV9LTvsQNcgAApRVYuJSBOt70dJFXrbXMFZqIOPfv43Zf1X3q8RhkuLQ
         JzwPEExMLvjlDU8NlwAuUPLPFlxacleKM8j0ORixD+u+elvJsoaFqYr+nqiH+OroB8Qr
         WYl9YK4Iuf7nJthX3782Bm2aZi0Q34XRBMMXkJOVF00AdhVYzSEW52+Y8qEIIsLEXRz6
         yoRMLZ15xJZ/m7NHWQHvrVg0XZs4Fu8csJ4PvhxrOPRcwW9uLdb/mkJYAFo84BVK8omp
         Rtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793485715; x=1794090515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m0JnkbHJkuPfCHVuDrGb2+stBd0JEX0qG9o4dkUA+8w=;
        b=hripce0BLgJVUgayA74qBpeTDgronckN+oPzfpPaJ7UZVyT/TlAHrD0edoBhD1O/XQ
         ECB0eSvknQ4Y6IsEQ5jimiegLurYUVrwiLsSIAJceWAkqfi8OoRYory2UQli2eUM4gd1
         mCxMxKZ3CIbf+ac+RmG46pSbvyJFrdn0DFK2xkHkJ5IbTQTy9nxSy5h7iuebUAY/F/IL
         hMzXQgrt9HydMuqSCHnrdzAYPoNYf8WmEOD55n9O08QXaoMTRvk0b+QQE3C1tNCf1hUS
         i5aYSJBWTowxTZQrZX1bh5TFN4eAz8EEIzqfV1yCEdsaVxO4Lf4wb5WsIH6Y3UBKsEeA
         KTkw==
X-Forwarded-Encrypted: i=1; AKwUvByN2VDjOrzq6g/pvf4bBaq1z93dX7AeQaNCUchlYlJknn4Qa7OCnvhADyEJor5sSQM6Orvcu2WYbKEwKgQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+SWi1iEoAxIIS0r1GNhPvGJZiRoTMdCr1xXyzGEYe2O+RaQVL
	KWX6hiYAQnqxfGKqc+7AICZD2H0scqIkGlxTw2K7PZbbk9tM0tv/BZwV
X-Gm-Gg: AYBFou0ZqGqfoiSlPL6L08ZAK3DkHvh5orjK4sl5NPIdjlqCu+z3K5QBFgICp/2B/QF
	L5o6cUV7Tre4iTDAcGqWLK9czhI10V7lu7xelwO60CqQ4izP1J2aCF037H4DaatzammtEGYlq9m
	ytTQRVEdadzoWWl7xQlxn2+a//GBxy/LPQBcuqHo0/8x8e7cxAAqUCDCx1aakbBCy+kzkiwkdW8
	0PCcbk9TSrDG1BEvIACl7sNnTUni3SoTa1zQ0imw4hc8Wq/1zEmgDzTUFnG4Q2kvVleN6LCmLNL
	P0BZfynLejP5VJzGdDKDW4vCHPUWvXmQZpI/dzuHH3aVnZRT19Ui0h+L1Ek+W2wtS6S9IqIMVs1
	GMzc0ZY3XdLLsOOCCAm1hSQhr1n3m3MAo5Bhch0v8q5x8iYjyMkgtDuLaPbWuSFZNS11agP87Tg
	aNnbzSccBtmfe2MgApqmBa4qtX2QhCn+QHuncOGJLh1ulWkfq6y9YMdHdK981Nco7JmjsNK/Vhv
	OUkHLk8grIVWsj4wFEMROZQrPEJWrEa+x8J49pPG6Pugfy+8Fk4DQB2BcK4mQwQXhi4leKPbPy6
	mupuk4iAFulPnO2BWQIWur3iPM0VR/okhWSkL6CYt4h3WYyETp5YSfl3
X-Received: by 2002:a05:7022:5f0a:b0:14a:a6dc:9cbf with SMTP id a92af1059eb24-1ac599f5078mr7780009c88.4.1793485714706;
        Sat, 31 Oct 2026 15:28:34 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm33876066c88.7.2026.10.31.15.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 15:28:34 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	exfat@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] exfat: preserve the 64-bit FITRIM minimum length
Date: Sat, 31 Oct 2026 22:28:23 +0000
Message-ID: <20261031222823.223-1-dennylin0707@gmail.com>
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

The FITRIM minimum length is a 64-bit value, but exfat_ioctl_fitrim()
uses max_t(unsigned int, ...) to compare it with the discard granularity.
This truncates the requested minimum on both 32-bit and 64-bit kernels.

For example, fstrim --minimum 4GiB can trim smaller free extents because
the minimum wraps to zero before being raised to the device granularity.

Use a u64 comparison to preserve the userspace value. exfat_trim_fs()
already stores the minimum cluster count in a u64.

Fixes: 654762df2ec7 ("exfat: add support ioctl and FITRIM function")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/exfat/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 1386149916bb..4e7a2fb30279 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -586,8 +586,8 @@ static int exfat_ioctl_fitrim(struct inode *inode, unsigned long arg)
 	if (copy_from_user(&range, (struct fstrim_range __user *)arg, sizeof(range)))
 		return -EFAULT;
 
-	range.minlen = max_t(unsigned int, range.minlen,
-				bdev_discard_granularity(inode->i_sb->s_bdev));
+	range.minlen = max_t(u64, range.minlen,
+			     bdev_discard_granularity(inode->i_sb->s_bdev));
 
 	ret = exfat_trim_fs(inode, &range);
 	if (ret < 0)
-- 
2.43.0

