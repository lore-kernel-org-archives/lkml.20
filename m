Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275225;
	b=5dikuhqZw37yN8ajFxTY81jLJ7NLiSGrzIh9uFFAkT6J//UV2AC3v8u/QniO26QAwat8
	 oO6tLt2W1DxLbRH11lsxjdTso76C5YC9b4VuoCNgbq1t5J5CVc7ZIngQmtm5I38dlcS+7
	 vALjXzRWjD86GvCKwvqsI+A9ISw0rK04LwA7oNV72GU1KEJTJSBjINBddSPXbNaoPJj6b
	 SxE5Xd676qiuAONSxFRmCwtNvNZwEo2ExRALDQ5g0YdFAn1rouUs5xGMFvK4iVa2R5FMj
	 LEjP+X22F3ZGPZSDDOe9biynRwn+QMQNhOGWcSKZMRwlQfgeed8IS6FMZhUkbv+IGCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jGJ0/Ks/pihSpRb1JBHByL4V+Y6xXcN+aNUYF8zbHaw=;
	b=Scsn7PtRU8dP2+G9TODphuz8KxoFgMoKDZq7FULoiJvVF7dgJMiaTIJM4wP7GGhlUdob
	 LiM3LeHG/2Yui+kpb14elMZwyu/b8JLspCY/PPxltuk05YlgJX5tHne5ta9Z9bVJsOi6E
	 Bro6UlyoYBizzZtyZVhRxsq5pgvgyHlIzxaxIeVFethcotHLhftD4d84b69ruTbabyfcl
	 lhw02gGpQz80maKHieTRTlXp73JdrFvoF+k0ZaFCs28pe1Nz6W2KwGriS4T1nHqISfz5W
	 02NOKL7Z7fF/E09H/tfL+ug3rkAgk2jQ4bhv9ExahBjHSMwUYL3okFT1OFa1z5mjnQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="C/s0lAZg";
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1527606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1527606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C/s0lAZg
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b32bbd39d5so12064017b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794275223; x=1794880023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGJ0/Ks/pihSpRb1JBHByL4V+Y6xXcN+aNUYF8zbHaw=;
        b=C/s0lAZgTe4jTIm7dI+lZNR0nccgWSQOm7UxabcXC2xpa5CSpHAcOXJ8Ua2ce8J5xS
         a9R6UkFJvy5hM9p9R5v0m/8+3xcGdZGMdRfiKoZYFtNT+5awEjqss01IhtPvx0jJPnlM
         AZ3l7YFk5bOBXQxB0J8U3Dyfxu8ogYrJR9nqdCAdGmCraY+kURpEPXh4dfQxS5mXq4jj
         VszWHYEQaj6hcIGc1ISvV/+OykFga3tSMxW4ebijVpBSaohQGhzXE2EcMrDcLKSn0ge7
         cCgsv0yi1RjkrdISE0+gY/1QTNa/4GrPNdHyxVeZivUzTqGRenDXco8tQNdfKDpPNUzQ
         /NwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275223; x=1794880023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGJ0/Ks/pihSpRb1JBHByL4V+Y6xXcN+aNUYF8zbHaw=;
        b=PXRt1KQ8qcJQxU+7/y7n3kBOfQT8t8AkWsZ+Jiz4R5AE/tqA8CR8v1vCiCZyMAFTZM
         7LLzoC2W8+HjE6Fi55HS0YNfjQ35qtqryzdaB/JHIIZC+XE3ZlCZiY+12xMoav0GpmZG
         tAgBSbB3Vp9qzuHNxPDKSH38eV2V76vct/X1+f9nc9sFYiYxzALW3kW9M2xUpeU3z6ie
         vENOpD5pqP5W/0Wfw6L7N4Dvq5S/Q1m/AUycAggxUsCHUikSqSzTSz731Gfql8LKPW36
         oCPScT3682ywTgHeqAE/jwxtkt3SsJhGRqQvKT7ZNDAhDM4qZEVySh65IjB0EpN7Niiv
         PyHA==
X-Forwarded-Encrypted: i=1; AL+hErFbFlJM5yEWevRWg23BBolj6iDb0VcW3Oz9FcaLOEUkrXNsuWCNyIHIs1FrmjSrGzrsIxXW9Xa+VSRWyBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z97k0mkiu0TvBYqvmkMsiXF5OX/VGHH3qPH/y+uEKo7nSL/sFZJ
	MpcLJVaYxopY1Pee5rEHZLMTUN54+hLRKnQ9SFqmDv7gSRwgVq0uVWox
X-Gm-Gg: AYBFou0QTEd7k7qW7SET+cbzvks+1H0/lvJJiaUcpDjmWjPCIF7/rvVAg/WadzghTXw
	YUVlQOUx9NeWBW9bNOByIWR2y1K25Z/Bebx+a2q/snBC7erlGER9sGCb7KtOTaw7V8EjMY1b722
	gk26hntJfQGmseb9rJjy75Kw2l7QlOYR/Fk9M1PhGCoMFmv8RknwtpqdQKngbwYG89rksp6YaEf
	HaT3YjE6C2gYnabBfH+8CFkg3IACbSm51tov5boRTitKU6GWj1KodJJKKQphjTPc2bmvqO147mU
	HuONe/CJ2n1i8hflUCsUuOdDmL/P+9dCfYyPuE9PyT5Zs6DnYI9OVzl4/JD7M3oCUNETLBCdkMc
	v0BEdusjM50FsSi4Re3k2bjVfzFMAgq/9+RN1fvkvlGbwlFT+k5FXf6H0DJ0dH9zPAsVKfmnfq9
	nb/Lec+P7Jsu6I57jhZWOBFVEDgM1PG2uUIVq4NLaew/3jl9dxanHjEos/qY71thZLNFh/7mvCr
	oYkMpz3xb/4AngbpaZ/mDoLXa3CPOqV3n0WNs6ZXm0DNcpch8VOyLLESfoc7j65Po7Y6IvKg/oX
	wzUHjoGK5+QU7Ow1i7osg4vH4ueUedIvQPFMELLLJJQDhYnQjQ3VDoM2Nydmt6S5rgsNf5gzuqw
	OuMGZds2kKSIDLYoTdrqRdLY52byhrRg=
X-Received: by 2002:a05:690c:c4e5:b0:8b0:d9c9:3fc6 with SMTP id 00721157ae682-8b39297cb6fmr9708997b3.13.1794275223447;
        Mon, 09 Nov 2026 17:47:03 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393415af1sm8332117b3.30.2026.11.09.17.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:47:02 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 09 Nov 2026 20:47:00 -0500
Subject: [PATCH 1/8] powerpc/perf: mpc7450: Event 0x30d does not use the
 threshold
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
Message-Id: <20261109-ppc32-perf-v1-1-a6e8a55b3b48@gmail.com>
References: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
In-Reply-To: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=JVPs4xK10+lf7V4KHLv5gsEsm8ka9yQlvDi3PWABdjU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI+lU95nDNljb+T7+sPPyfxaf7nyWa+vZnFfLpcd4TVp
 ynPXmVrdXxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1sm8Z/gfeCuqzs/
 v0xf7zRbedtpdLO3unC8Vu9Wg922fNojg99QHDf9fMdbyXG2Mn+oXpKqyP/6TdVuOduGz6uQ6bf
 buvnf2ymRcA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

mpc7450_threshold_use() reports event 0x30d (PMC3 select 13, FPR issue
queue entries) as using MMCR0[THRESHOLD], and the comment above it marks
the event with a question mark.  The manual (MPC7450UM Rev. 5, Table
11-11) says the event counts the valid FPR issue queue entries each
cycle, with no threshold.  PMC3 select 12, the GPR rename buffer event
next to it, is the one that uses the threshold.

The only effect is that r30d cannot be counted together with a threshold
event that uses a different threshold.  Drop it from the list.

Fixes: 7325927e5a20 ("perf_counter: powerpc: Add processor back-end for MPC7450 family")
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/mpc7450-pmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index db451b9aac35..564f6dac3a00 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -65,7 +65,6 @@ static int mpc7450_classify_event(u32 event)
  *	12b	Y	PM_LD_MISS_EXCEED_L1_CYC
  *	220	N	PM_CQ_EXCEED_CYC
  *	30c	N	PM_GPR_RB_EXCEED_CYC
- *	30d	?	PM_FPR_IQ_EXCEED_CYC ?
  *	311	Y	PM_ITLB_SEARCH_EXCEED
  *	410	N	PM_GPR_IQ_EXCEED_CYC
  */
@@ -92,7 +91,7 @@ static int mpc7450_threshold_use(u32 event)
 			return 1;
 		break;
 	case 3:
-		if (sel == 0xc || sel == 0xd)
+		if (sel == 0xc)
 			return 1;
 		if (sel == 0x11)
 			return 2;

-- 
2.55.0

