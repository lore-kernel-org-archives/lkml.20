Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769819;
	b=gqp28kyfCH4ojEHSktOPbxuhvvP1A6hlEmd5PzpY774klTCSBMbdRgpPGm9FV6+r9B8a
	 RaALjNAkprXh9YUjOnlaneRnENqL5Id6rUxQfiDYBhEiEAylgzZy/NXE37eVefZTD8eGg
	 xjdu3zCk/NgC8nylwb1AyWeILIIKB1UJ/wYescXcXB/H4E16echOjuRQVByiKSCw3X85i
	 oyHgvdxZLpxR0FpMgi3SxoeTnMdPp6RcxDZnf2nE84XQJLbH1Lo6tBbg866sJ626wgLpP
	 2/v/RJnCf42fN30f4pqtnYqAdE5k9J8AKjSZj3EggTqzanLIY1qd53J7hOaIUYFFuNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4A2LFgNU3Vz3Cd1QkL+GF0Kwq7uWsh+K0kLA3UVTqQQ=;
	b=KhxQWs/hZIIwK7gk2Z+t3Tj+ed/kfMthMknRNlbVG131z9LAJ2bhv9yqLTTs51mTQ/9d
	 dOClME6nS62NRkcuiYhXsOzacPkS5t5t35ob4B7xBuXlqlDMKUF/hEGRfxoQmleE6jVAk
	 1Fb6rnoe7De1vMuXc5zsZtAxr54JgDI4y+GiwDEkPcKM3cOZk9OnxLRL+UNN04N7iUcW8
	 8kDlFzS2fvgPi0Ex0bbVQzRnA/InKxgoIEuphilFHZtRLDMToVkaeZyfbxcOOMBGFYo3O
	 QRH1T0ttE4or5hElUcOdsscL/2Nk3MD4M/M3FSSMHoInR4YOf9raw+xNm+omK4MlB6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dKlS8bo9;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7815606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7815606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dKlS8bo9
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so499443eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792769818; x=1793374618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4A2LFgNU3Vz3Cd1QkL+GF0Kwq7uWsh+K0kLA3UVTqQQ=;
        b=dKlS8bo9/2SQaE++bG0l1jBEF+5W6CiLhS8Ya0X6QcdG0+OSjkFSQ7ZTnJQXuOmJmF
         tjcgfjLM6gLXRBj5n4OprkwBA0JBeUCVf+bC4rd4mtVKRE5nIYBd8QvASikib7ifIimc
         ptp9ilY8xK2i0VUg/lkTIj4KD6iQT/NQsNfz9Bpf68eNgrc3VjOeTjrTQAMf1Uu358XP
         dhWArzP4dcdOJHKBixaxNr6NMhO2px9+IaGxtdZhQdZIbAoYmTz46hzbwGczviTk1pNI
         RDn0g206v4cwxuEKfEVs/HGTWXgA+vn2/7reiKIiV7ZffEB0bLda/7QcmfXRcAcNZXYQ
         x/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769818; x=1793374618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A2LFgNU3Vz3Cd1QkL+GF0Kwq7uWsh+K0kLA3UVTqQQ=;
        b=JvS0YK98sfqxwAqcRlP65xvUmu/NPcGho05TD5HBmRP8CsHRR6fPqBro0qif1p4VUj
         Zfq8OYTeNN5WSIZitZJYPuxWS2TYrC+8CQtYRGMqKZHjmCW/UtoET32eW0NK8dIcibsP
         SxvSkmmJeXFuQxzclg8cn4aBFzGIuqpub75S55HBIi57XvOBYVKzeK74BPuP3x/KuN1M
         r1dSIPMTcoR44IKKXLILqmKJCLaU3CvCuLFggoREuo5kip4ArzahI/emKcTg3AnipwIg
         QlB26ZQWXsyYWg+kWOh8kzHMqWmtzDsWRZFi64OtXU8/rAn57OXO/3h98gUP7QaBL02m
         p/Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzpC8I9twWPMHKCNBVv//0cg4t9mKdb0Fm0oFTkfuw6BYq2leJcICv8bgWkPUB9yJkkKFY9zjPrpX8gybg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQBYFSMzbi/kYiF5e5hXWs+69neApygk3duIweY6GGhiAczyFn
	04WqLM+T1vVfjP3JkySB36PjdfWbhEePtox/ilE5QRMqDe/lTua/4jDL
X-Gm-Gg: AYBFou2qaEE0BU1FQAjMqQLtKiSaaDe/otHqTjs1YQ/8W3otr0uaLflagmLlXzora+m
	lKarBPeqSE2pUvh1vypnFVevwVuqRRgDVthSN5xVYPVFL8yRWlpF+L5z1boCVyg5iulXFt/6HwR
	f0uzwUf0Uc6oiebsmbLIyktSKghSV0evIYAEDBQ8J1xzsZnsVjHQDZDDeWwqeIT/by1f51eg9VM
	9k4c+fzzOzsqGk5HMuokuyBKKPUrUsp0bJZZB3WyxuHgYyChz+nLL5m2Z1gE8Vg78Sxf+yO+wOx
	W8rXjBDBYVO7hWNSuwBmJiOS5niGW8Mcfxix64QWgQjYocBG3XR0pLKISbOU33hqHJou2GyYqNA
	PToBWSSjxDZpNVFe21ZblCjnc/eli+ibea5Xe1zDKwVZ8JUg+Jeoys5gzrZ1gJSxNOKoPagfTVA
	mkVoxK7bgid964dRYDG+JVTfummYU5aIbnZlNIgAFxTeS2NC8h/x/XEKlKuqvbmrbb9ii04NCZS
	yVV2Jel3+Iu7ehZHwbzOIUK7af5Z4hwYz/bI4A9n0cRxcghA8jU6oGSAh0zMmWulxYwczv/lc/c
	meCR9dbb4H+C+RzqmtuOnmb0udNk
X-Received: by 2002:a05:693c:88cd:20b0:35c:cd26:3066 with SMTP id 5a478bee46e88-369d985fbc3mr3119669eec.41.1792769817438;
        Fri, 23 Oct 2026 08:36:57 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e6e4e81asm432485eec.17.2026.10.23.08.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:36:56 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: axboe@kernel.dk
Cc: arnd@arndb.de,
	ben.hutchings@codethink.co.uk,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] block: Return the soft block size for compat BLKBSZGET
Date: Fri, 23 Oct 2026 15:36:45 +0000
Message-ID: <20261023153645.37546-1-dennylin0707@gmail.com>
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

BLKBSZGET returns the block device's soft block size, while BLKSSZGET
returns its logical sector size. The compat BLKBSZGET_32 handler uses
bdev_logical_block_size(), so it returns the wrong value when these
sizes differ.

For example, on an x86_64 kernel a native query of a RAM or loop device
with 512-byte logical sectors returns the initial soft block size of
4096 bytes, but an i386 process gets 512 bytes. This makes 32-bit
blockdev --getbsz and the BSZ column of --report disagree with native
queries, even without a preceding BLKBSZSET.

Use block_size() as the native handler and the pre-regression compat
handler do, and correct the case comment to describe the soft size.

Fixes: 9b81648cb5e3 ("compat_ioctl: simplify up block/ioctl.c")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 block/ioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/ioctl.c b/block/ioctl.c
index 64b4e6c0f696..fb2f4b4d2505 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -835,8 +835,8 @@ long compat_blkdev_ioctl(struct file *file, unsigned cmd, unsigned long arg)
 		return compat_put_ulong(argp, bdev_nr_sectors(bdev));
 
 	/* The data is compatible, but the command number is different */
-	case BLKBSZGET_32: /* get the logical block size (cf. BLKSSZGET) */
-		return put_int(argp, bdev_logical_block_size(bdev));
+	case BLKBSZGET_32: /* get the soft block size (cf. BLKSSZGET) */
+		return put_int(argp, block_size(bdev));
 	case BLKBSZSET_32:
 		return blkdev_bszset(file, mode, argp);
 	case BLKGETSIZE64_32:

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.43.0

