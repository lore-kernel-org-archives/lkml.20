Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025884;
	b=oIdNDGrLdE1UyNQGJjQzh/Ee3pV0MymkdYa+OEQ964tXlEV6EAy97Q8hoKGEkcV/F73W
	 Hgm9gazEegzqolT1FBLqOob+2P5FeqwfusYJZ8InByPIXwnMrjc9Ecl4+lKFmkAa/4He2
	 UH3tq1YyC9LBcaETyDnP7IEHWWbM8Hf0maVQ2NxaxcxJe/CxZO5Tg9hsIn5zUmyKV1Du6
	 TNABa3HixsSt6KJDAGuDSYGHF/q1M3GfWuPToujjeGWWg3zzCZZ/QI9mJ5q6B8qzRuu4X
	 Z/9LQ05tWOZ9jtc7vKVD8vq2uobbRsxT7lQ0veiQ3oLuqniXxoHHKIHJbqJo21bS33A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=0h921tV9Ds9KKioXJ9IFecI2/WeMjRPzZktFXa2aBNY=;
	b=wU6ioxAM9xZlMggxAGF8WoZVyj6xRSOFM6HcRyFoFR6Lch2nIQ34tVNaIujHxqu7MS4H
	 WvE1ymEkpg1HmAD8ykBIU3o/YxHNNO2R1JCsvBcVzN9bVhuVNwJ4rLviJX78CSCLBIenn
	 OafoKG4VxaMe3XM8ZZNZHFned8ynmHmXmXwP12or+5XKDHG3DqJX4u0mbnZLf5Hq06J8L
	 F2aCAQsUKbBpWriHiAEIcUANBouuVS/+c9SUkO2Fe6/r/LFF5eBiDO7NJiSs0CDPf3eeY
	 faIHQ69nkGOzjLKNHLYF06WzXECbX2mVQx8ZHWZ7rsUg7Ih4/WMAK9wwYcoPALUNBtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afgtQFQ8;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E1B606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E1B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=afgtQFQ8
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6df7f544919so755628eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794025883; x=1794630683; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0h921tV9Ds9KKioXJ9IFecI2/WeMjRPzZktFXa2aBNY=;
        b=afgtQFQ8CqFm8A9ZkN2qARev23JoQK54oZ97jcMr1Uo78QBBJkeN0xAnkJ92JagxK5
         RtnuGRdwzBqzElwbLaWQcq/vj6rIICR9SjgCclhKHjZyckSODQLOCt09A6lfyeaNzqlE
         zY0lkk3fls7krEPREDmIlO9yAqzBOCgmdLZiGy6BKoc3EM+TdOTA1KkCvxbVUNMEWgFa
         r8LRl/CcXVR+ZpCuPU8qnJwdktkx2ksZQ72kgpalWIjgKKrQ6lqVqaKK33WToUAc4fYc
         9Wc6u2F8P3k/q4aP5dWKh6wFONKSINVX0Vdr6pwFuft0M6twwoN9NSCjUSCYcgG7qpfy
         mptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025883; x=1794630683;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0h921tV9Ds9KKioXJ9IFecI2/WeMjRPzZktFXa2aBNY=;
        b=0+XUO7Wkq7TfSgJC11kELgxvkY193EuU7Q1QUdVRhpg/kaa+xGTqkXzN0euf14bF6y
         GkVeFc4GcM9qrRtaoSzB3Caoy+0d6vg6MDZkRFOpnOs7UG2NjOruKwF3jLKTe/s4BabS
         6KfcrwN5e1XVNX3MFeZuhqydhfJkv1i7wyw1Xe1rL//as9JcR/IRN1VWYXPnukkXAdY4
         iZ6TJMkRXWo9f4bBVpK5Nhwhss35C3yFaDM8g+K8YMYmTVFX70wLrg9hzjGEML09V8uO
         Get/R5PFFWpLvolc7FxruTUPPtmt2yJDYR9FIKOZZnc4RZLeZ3WYpGyMy8OAaavQGTYr
         Yk7A==
X-Forwarded-Encrypted: i=1; AKwUvByMceK73fylmCW2G1QdU8xCHTQv2FZlcy2pkzTdU6+t1Dh04JLbs31w/QBxA/05AsitDnzd25vO+AkFV7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MRi3HW2lPMzGX3mEjgwh7k4eGsh1MWnKM+iGn7kZbWG004I2k
	i0NbxsWQbJjffpfvJS7dMA1TuJyrlUSvMMthGrkmVeiquOOojx8U9ovBo/n+Kg==
X-Gm-Gg: AYBFou3a+aEeJZF7i7ZAS0ptcThy8XKcd6FYISpv2k6k2jQKwYrmMHpN2ep2/CxZwWU
	pkgK81HoCwF/7PV+6a5aMICCzEzhlUFPq380RoGpeBLDEUL7SODMl3VTJkVt0ZRT45V9ahUZzFx
	yQ99jSt0JXy+yxXIN7VWGyADf1uc3MxXQaS9kj49Isvq3OE+I28mfI/zbjYt2WwiDALnyD+8KWl
	77XDNKXhTs2tl+3GcQjEAeXEc/Nuiyy7IlnW6x/emqlp3oqu8hnw2N7xps+MU5jhSITEN9Vu3a6
	RPikal2qL4yYk7DLOfqBZCtsTeryIkLONh6KigWc5mKI6jDWkhE6T0vYlj8GVE2Mzmp6xjq8+fN
	AWXfD8BwirJZ1qpXstjZ+CRHrUyIkAZ/NiwwyCfnBjLsmGNDZFAQfo8UWFfqZuE2Ep+EH6GxMmS
	43Bl65Yz2SHpg//bFnTbHoER61BnM1QMsTkE9zR6ym/6Na4aMMn59VJb4mRV51jTB88EemOR3AY
	h5REc3Gl8/bemnrdmN1omuehn323Uhwgu8l066VjE/4mq4WPSbeJcHtwnduTGqpmBXwqkMz1iiG
	XXh6oDQyc8vjH9VXV8BVF5b3HAbQ9Y3GJWaxi50Die2K5T9MI/33semXepMDWeOQya25lLasPg2
	fyi4kdOvyW1IqguWBnskVivtIDHpFBwdB/efPB8saFUGfMD71iGvJqCTL9FBBBgot6S9+SZvZcp
	UfVyPawFjVFBUvWwJNdXL6LnuchaupM9rPzrn3dpOwgJeun4AS3l8=
X-Received: by 2002:a05:6820:3417:10b0:713:da3b:9127 with SMTP id 006d021491bc7-716e7912499mr1864653eaf.46.1794025883255;
        Fri, 06 Nov 2026 20:31:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad979ebbd1sm3579607fac.9.2026.11.06.20.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 20:31:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 06 Nov 2026 21:31:18 -0700
Subject: [PATCH] mtdchar: initialize MEMREAD statistics before each read
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-submit-mtdchar-read-stats-v1-v1-1-173ac5c3ceb0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCMAxFf2X02eBaoWz+iviQtpmrsCpJHcLYv
 5u6h/twbnLPZoQ4k5hrtxmmNUt+FQV76kycsTwIclI2rnfe2t6DfMKSKyw16Z2BCRNIxSqwWsD
 pQujG0bthMKp4M035+9ff7gfr/kmxNmf7CCgEgbHEuVWqPbccq33/AejgRP2gAAAA
X-Change-ID: 20261106-submit-mtdchar-read-stats-v1-af3ea2996288
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

mtd_read_oob() can reject an invalid OOB range before initializing
ops->stats. mtdchar_read_ioctl() nevertheless accumulates the per-read
statistics before checking the return code and copies the accumulated
values back to userspace, even when the ioctl returns an error.

Initialize the local statistics on every loop iteration so a rejected
read contributes zero counters and preserves statistics from any earlier
completed reads.

Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdchar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index bf01e6ac7293..cbc7114686b9 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -750,7 +750,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 	}
 
 	while (req.len > 0 || (!usr_data && req.ooblen > 0)) {
-		struct mtd_req_stats stats;
+		struct mtd_req_stats stats = {};
 		struct mtd_oob_ops ops = {
 			.mode = req.mode,
 			.len = min_t(size_t, req.len, datbuf_len),

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261106-submit-mtdchar-read-stats-v1-af3ea2996288

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

