Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1E936998C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789797758; cv=none; b=KRH/GKbvOIqCxxRShbHhoxkcDmfKyEnDx2rxYT5PNfhiU2Y9DKl0lj+39ginv1LMmzV/ihfzVYvtK65mNCpxIBX7WGHcjr6wTi3ESLmCL0AO+DzzSSIk5jNv6tooW9CgLVcZvyCAyuMAg3UPujDjB8W2sj+BysD8JN2mLDgyDuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789797758; c=relaxed/simple;
	bh=PdVRLb7GRzBVxCJFmMCDmmlX6OQvcOJy1oofp4XQXSg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EoANN847ZMgFAkb4G+H86ySPakkOg3tNOUhH0magM+OkISWAKRYBnjh8UueaWFV79stqBNyXjyuAFfTqjss83XLQBqGydn6+unmnjRJQ2zsyBiMlQXCCp+GtYjSb6pqz1uHiahXAFF1oA+VXqBnLE2imNjbtECvnZgQDump0fy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQUelV8b; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQUelV8b"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so1209934a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789797756; x=1790402556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lzk8mK/iT/BPyFt9MlH11eEoXuVD23efCIvfZoVKpnQ=;
        b=jQUelV8bzbZjwBqVqsA6Ln+c8m7yvB+TNIfLJoP6UUqEOAQ7Tiv7+CgPFx9trdQRV2
         z4/i2/1uZZ1Xz0lHvdOkKE/pXa5Nuc/YloFaej8Pbzf7QnAg8p+7Ngu4mRoQDNmn2vV3
         NEX1wpL4ixgauKzrlbC+j6cUQV5hINgdlbu2tBRbpVB78c8p6Ds69tTSUXI8pTzqZYYP
         2p4ASIvVxDR7RwPwJ5UyUgJAutLH/zNSYum6cQej3ClAvy580bJfbPFvJ08UME47SyWp
         n7KQjXcWd3zUxBjYDoK6Hq3XlvTqVH5aNmK5UtOu/ucsrRqGkup1scTOCoB3NcZoQ1Qq
         LpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789797756; x=1790402556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lzk8mK/iT/BPyFt9MlH11eEoXuVD23efCIvfZoVKpnQ=;
        b=oMMDrZwu+eTiMDMprMnaHnVOx3pkJKNdynT0yxo2xpRtrRp3TxPYxXzrTFYJSOPqOo
         NEF7NvRkaPRAza6plxBz5IJbyLLB8IgIit/LLTlT8MYaMQgzIa4YtvGVb23ohz7/ODqt
         xy3Yqx2t4OIw8x3iT6q/LcCKRmNtwauZLHwV7fUvdfMcDDkR7EKLCeJKqZWEiFub74AD
         Wfutl7Vq2DjeeUxHu+9F7DW7mx8FJNSYFqFNvuH66I2fuWMRs1faLEmGG7yuLtyb5RYu
         OvCeZUiFhDglmjAdFDKt31EDflF3ygwKpFFzwxbwbsHkxcs4n6u9WkwXXjQ5HGcjxwtE
         10PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRVgzHiHXcAC+sOSoimhV1B282dbJDyM1pi0Sc65hcpNzaphcUmMHYeRkXvj0huZOppHtt4HvHoXhiBOw=@vger.kernel.org
X-Gm-Message-State: AFuF++lJTssMbRmGK01jO6b6+Yp3dchMnro1NbCqtR82O0Lut0RQnCBW
	kARMXpTufkqJPgkUfO+k6+WUx2ApKU0E4cX/KpLhAcnswsW6KjKheyjA
X-Gm-Gg: AYBFou0CC64Ojq78fvMaQywiT3pk9uRxWq3grn2tgsBP5BvgauHMeLaCluMg0h1Besf
	jYuchpTveHl6eZSlinNrT+fv4JGZHiEMADf2Ki7JYIVUMccyE8drI2462ULF4jgKTyg1gB1uZ5B
	2dAy7Q1zFbpII60FHeana6FGUhCmhsuo/6UShZK+M9AtbLVw2MAEjvLR6SIKmgkfx412jGxvEPC
	6w6bZkjBSVg/6NciDUthOsEEaZHu9asdI1gaTpQ7Z12NeA7e7qjvERWOVkE6uzUCuIDgqRbrtzT
	t/JJtL81HGeHi9GYa3OJwq/FA/eIqFw0cfyJiNZaJcLaN4bfiYNLMJK7NMoVXJcSONEGsqe6J7s
	xrBssDSEqInYdDwkvboZ955HfkYJ8va/T6mX+6fOY7P8dnOnze6Srz2hQxjzbJFELVvNehItjA2
	5q7Q7p4KqQ9CchEkcikbAdppqLWuUpjQUudtqVMfvnR+iUvcdY+D5yISKTAsgHCupvftZyjVuZZ
	Cl2DVB1R73q88ogpjK5oE3CDnhpm3W4PPt8cP2n7UcUXGDNteHIu5oPHve7dw6/Zc5TmhlEBGBD
	0nbWa5BT3g==
X-Received: by 2002:a17:90b:440e:b0:39e:6c69:34da with SMTP id 98e67ed59e1d1-39e6c693706mr2631042a91.62.1789797756533;
        Fri, 18 Sep 2026 23:02:36 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:d11b:773b:fa83:c49a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c33140f7fsm3658321eec.13.2026.09.18.23.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:02:36 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v7 3/3] net/sched: pie: correct tc_pie_xstats field documentation
Date: Sat, 19 Sep 2026 11:31:25 +0530
Message-Id: <20260919060125.38063-4-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919060125.38063-1-hemendranaik@gmail.com>
References: <20260919060125.38063-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comments describing struct tc_pie_xstats do not match the values
exported by the kernel.

Update the delay field comment to microseconds (PSCHED_TICKS2NS() /
NSEC_PER_USEC). Update avg_dq_rate to bytes/second (avg_dq_rate *
PSCHED_TICKS_PER_SEC >> PIE_SCALE).

Documentation-only; no UAPI layout or runtime change. Touch
include/uapi/linux/pkt_sched.h only

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index 9c0c9787f0c32..969fa30efae7f 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
@@ -920,9 +920,9 @@ enum {
 
 struct tc_pie_xstats {
 	__u64 prob;			/* current probability */
-	__u32 delay;			/* current delay in ms */
+	__u32 delay;			/* current delay in microseconds */
 	__u32 avg_dq_rate;		/* current average dq_rate in
-					 * bits/pie_time
+					 * bytes/second
 					 */
 	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
 	__u32 packets_in;		/* total number of packets enqueued */
-- 
2.34.1

