Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460333;
	b=5jCd0soaOhu7x3YDEIkCOKuUkxi6hmzhRWrSMs+Dj6BbQZq3FJtLdSRuAff6XW8bVe75
	 1P8rL+fR8r7JLMXHN2d6efEAR4UZIqw2JCnnGnwQuWujRHPk06HsaeIuavb4PUQcMKXCL
	 wFq+Zs7FAOVnH4289wcFPSiKpo4QM1kqiqwxwN2yBX2KKcdcrnOgwIVHRBkOA+jahUIWt
	 Xu7ETQp+dxHKLJb9rTj8JKDgEBkRgpQerG7R687vTZmFZMYRimw/CMEl6QOLPbPKOTrrk
	 oFWqBg/DQyoTs9/AuXoDzw1zmWRg8VCzuakMwL+gVbzY1qiUQ3NOtPoVj0OjdQUBEUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
	b=zid9KC9eyZnNqgDnGTyzuyNNVaScgImt1l+VApKs0RBWsbNYHmTebd24VICiZ7qWaeU9
	 v1lHreUTb+RTCv8qBrR6bWjTMjZhSGB8FON4AfszIrA4hxXMRISF9bz1wmQxWeWBurvp5
	 mJQt9xR3wIAgWw154Do59L07dQwUHeL1sjhvqpd+UL+FigZka3NGHlE9XAiGHaNX1KjN9
	 gt4s0jEs9q1/AeGBdfd1vMjNeoqqB3Y30lJmJyYc7XBI2wZTPftOBq/h7JjWL6NiNhjDD
	 tJXVL/fVSmTEBxUDrvLmf2M9x+rPusHrnDk0FswjM7skWzmrpem58PQOlFGVuvhbxBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k4Vg50J9;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6592A606A8B8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6592A606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k4Vg50J9
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so5873321eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460333; x=1795065133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
        b=k4Vg50J9fupa9Alz/gxsezfGnSg6c9SL+nU6684Lwc8aZxxY9JCeZ1opzrOd4JIFAy
         xqQ0NzLpMVH14Fw3AUHd2UHIePbkznIZ0QKi22ajM8erBoPUFzwZG1oG4hDLiQrejMCI
         gb4bR8H4TObY4sBZoyRi2T6c94Q3/MpbxMca72reLRE60hAuCNRA6cGOkJVVUrdEg8kQ
         ja79ge0lmQuVjLLNBg82+MEIHsOXX0oXUyzgKOD57HOXY6gki1b7oa+WcjuPNxPSYFuP
         CzcpliJTi4OS/exWE7TJLFKOJOXXo7+v38orcWrS4V5+cdv1s9U84V1YIrXGrIgVx6VS
         xWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460333; x=1795065133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
        b=s824qYZTX7hyJClncC+uzz2Nk/A/dzy/G/f+gYOrbozNG6wlYce3qUD5CpNeaZ31/6
         GoAfM17pfAt6SWedx6qhlPesPOJzGk1pirXBpjNErs3Rq/EXAnmOltR8bASd4wKmp1E3
         kLZyJCiKQ7E6yeGqgJBOtoGwDcHbO6k5/BMTkyP9XQeFuMkqjYIoCbgOffSYD/ZPM6uz
         VA1ys0iIpYJKBSfngJ8+F1pGbfri9/sq2YZIO0jOdoyoPV2VlfuE72CTniBmx6Vgzlgl
         QmOSgjbXyogPNGId6PV9hleE3oWU9uNc62xEIDsycBT0vpTIKSJqbhPMG3elUyeeeiX3
         qMVg==
X-Forwarded-Encrypted: i=1; AL+hErEBpzNjKt+1zG3ct9lYgoVbP20gb7Frx8PFb5LyWslczU27myU0Wpsaw+SWHdaltwOBxFYrNoJJeEdTbM4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0vcLiqh17LFIuejzT/tPbJeVNAtk7YRK4f+YRvgQDl2c367sL
	o4BUO9d5ZK/Gz2G1WNi3DKxrdX7L1zWmFfnICSwoY7Z/FiCzsmEDKAPDSQI12YqTaEc=
X-Gm-Gg: AYBFou0rcaopUTyEff+9KsLhT7xE99AwBZRf4RIxu8Hn51OXPbj9D9Nal37K4gYGaSQ
	ig+D1cqqMb8UyNSgEULQtVuXkw9FjI3XaMj8FGaxdFlmfjULjARKZikAPAzSFso+Z7lAuc1qFwE
	EitkqS6c5iz3holP4ZcTKuUAbZVJq9e1980ea70oiVKzbRWIHSZP8ydcjpAXn8ONDlzYGTLkBQL
	ll27dr4x8QMNda7dV1iqPF0rBPJpYQRt57Zg3NWpZ+9OLRorFmiAvM5epiaPDPQgl+vb2zuHKRx
	PD4xEpVRiusTaPlN3ELCjCgxZa7g1/f5sox89sGZeiXdyUp67EgHWhsePCeyNAUuBeiOPBSGR8t
	FFPcSKG+afXlBYnP1Uz+qdQyfqRSB5vA+o/sOrtXaf9Wr2cXMSJwsMaAboZp1fb5gaSFGy10jWa
	phsde9A/L6k9Eqw0tahfL75Isto9cI7pXLw6Jzfww5StRnddot1+6mqau6mVe6L+et+YKmKr1ti
	K4z506Nr/BhSHNt+b5OMsUTJatdc66XO9K9wpDBmZkneXQGnLkAsbycAb7ghiAORmq5A4EKA5SE
	AUzrjM3QY23mneq/6xCRfd3ngMAtPjGtRIUS2Cqq1EJcdAlJG2yZKzuZ
X-Received: by 2002:a05:693c:8814:20b0:36f:4615:9747 with SMTP id 5a478bee46e88-37680a5d9e4mr4675175eec.0.1794460332594;
        Wed, 11 Nov 2026 21:12:12 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:12:12 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] wifi: brcmsmac: round short-GI L-SIG lengths up to whole symbols
Date: Thu, 12 Nov 2026 13:11:32 +0800
Message-ID: <20261112051142.2797529-6-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112051142.2797529-1-ragulbaby@gmail.com>
References: <20261112051142.2797529-1-ragulbaby@gmail.com>
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

The L-SIG length of a mixed-mode frame covers its HT part in 4 us
legacy symbols.  For a short guard interval, the HT PHY's TXTIME counts
the data symbols at the guard-independent bits per symbol, then rounds
their 3.6 us each up to 4 us units.

brcms_c_calc_lsig_len() instead divides the bits by the short-GI rate,
which rounds the symbols down before scaling them and uses the rounded-
up rates of the MCS table, so it can count one symbol less than the
frame takes.  Count the symbols at the long-GI rate and scale them.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 46116d66f3..659b37bb43 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -7114,9 +7114,8 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 		 * the payload duration calculation matches that
 		 * of regular ofdm
 		 */
-		/* 1000Ndbps = kbps * 4 */
-		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec),
-				   rspec_issgi(ratespec)) * 4;
+		/* 1000Ndbps = kbps * 4, at the long-GI rate */
+		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec), false) * 4;
 
 		if (rspec_stc(ratespec) == 0)
 			nsyms =
@@ -7129,6 +7128,9 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 			    CEIL((APHY_SERVICE_NBITS + 8 * mac_len +
 				  APHY_TAIL_NBITS) * 1000, 2 * kNdps);
 
+		/* short-GI symbols (3.6 us) in 4 us units, rounded up */
+		if (rspec_issgi(ratespec))
+			nsyms = CEIL(nsyms * 9, 10);
 		/* (+3) account for HT-SIG(2) and HT-STF(1) */
 		nsyms += (tot_streams + 3);
 		/*
-- 
2.53.0

