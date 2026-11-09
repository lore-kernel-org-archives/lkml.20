Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264851;
	b=Mn0lDxnGZh+eCT01R3PW/TYb1+xFeVJEzdKRBPLffch8x0WkuuoFcSPNhY2H28+viaCG
	 ocftjiNs/mgVg3zddywKeEMREW5CUQNG/JUd33y1apyZfTKV/RWlIUGCTEWilgtWh4DQw
	 Q8ahLsJORX6dxGxZqn2l6+wP8fzQcFDtB8N1fP3KSraruPPYH70kEyjnw3v1qlOP5xcm7
	 Dql5YN7yK5Etw5MfwCCn73fBNwUe+7DkbTyWDDNF0Nj34EMQdXH1GfB28uaKXM5aMTfFC
	 P25SA1CLtSualY5tx8kV59DU+wITv9uTOLOnHF2KYBKRXX+UD7UqB+qv0y7SxGgYjOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
	b=HMzvQREv1bRYQuUwl2Y+cNByjeWHU7e6vakBlQZDkJXcGgo9aW0X3vfKC9Q1oNWf5dPV
	 wNDBBJBFDfGTxFd9rYZNk5gGZFfs8g67M1Bg8+uFvPeH43BVNBx3wZmOlSre2y9rxYz5s
	 yu4hih61aDMvEgxvF3iUmXzWwQ3a6oOcKBIwKNx3L+STMaeRhn3LZAPZrsTxyUt5Id8Bg
	 DeMcxPGmhlU0Se6LnaHpdyp51rUhpaaT2pDXHFGjov7QgLWC4uJdoiGPRt1TJFGDM0LGe
	 f9pemB+CM1RPCCUSbvl5LgUb4I4kCOBJftWWuyfiUxp2gq7ymHcuQEu6k/NKGLxPMVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MFsGGS0U;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013CD60A2602
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 013CD60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MFsGGS0U
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so10999875e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794264849; x=1794869649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
        b=MFsGGS0UejbIXnx+SdptoT5wibrAQTR4QICHPOWdHck6ESFFpZJBwC11C+Djvv3d7o
         cwkNlimv+6HyRDiM89EJvp6ulchV8ywi9iT3i1HjKk2HIXsFBy/WMqzhbGO4h/kn3mos
         pPKosiqExltLmRIqQ328K3SXjMvIqobbkDZHiAD4d9VxEcQC7YHiaxWT0kX40UByWaae
         11N+c+kUiKRw7GuV1ScDefq7l4x59F3BW6WRpPfOk3JwxJR4T84PfpJQV/qwvv9xp/U0
         vg21FziPzgbI/HjUye4ZXphgg9uGIAOM75D6h2yfvVfKoFf1xqwQHq6SKE9GlpoZL9Y8
         sAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264849; x=1794869649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
        b=s2Sw+0M+vpT5ONPDuVXEE3k8DJ36McuJcn/xxYw0BcGZ3X6LequI0BPGYi9p9nDP2j
         ukw3hzoFANeIdmmSJyS4kKQI3QNQX588+6bHi1SOgBt164bagBCuysM+0RiFkgRwmcjl
         GPX/Ls6yB324FFx6mwbg3pKhFMqdb99xlMesBf0FPTcnSvooFz32yrCngnSjVYYu6a5j
         p/tp400NAQPjXKU1uyxzbQvoY99o6gsN56B8yv7ssR75eGCd6Was5GqRvSV0ca7xhBRT
         xDhVVMFqnlXF3aHPzjlJUmKvNoLxokKSLjzTA1QhY6vhpakx4/66c/5oQiRUdRb4uI7x
         Q6NA==
X-Forwarded-Encrypted: i=1; AL+hErHykTSttVPhNizfrTP0Bqz5vB/F7wBiu2jmHVp2VFe2ZZ9mpctn4Mm9ASU/s/pI2wHDGPhaSXbEzb7hN4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S76hk86idRPzz2mrPofJLVlBBZSEi0zJ9eGAsAg965sSM3U0J
	6BYJhC0wQEhkqA5OuPv1UdjxomV6NBo4q1cJxDPCysY8e4NXai14YjAY
X-Gm-Gg: AYBFou3HEBPfI8TQaGL0chsX2ZVYzfP/jkNCAiw78whIdcHfbQTUdaYdpmZuNTBP+Q+
	PwRE54E9ZN2fVwSolDQB+R7O7b4wwFsGkYtrbbulUDrfiTDF0gXho6AnfSAngu5cDWan4JzDDAu
	Mjdf2NuShvDkJSykXUGGXsytthWDRQoT1vnxb0Y8BbmjkEK3rZXyR1UuzoFsbMDJuKNgx3kG2wD
	0NNJo6zTd04Dx9yo7xiOfbxGzTpSn/tp4JPxvux05GE7ok6vDWaE2n9RIDW/luTYqnLupzrn1Vl
	MzzeWDQpZqrDALjUmqRj3bd0FVZLxJJLFIsOwghVHLMfkyER9YtSr0s24onRN/jNw0UevA51IKY
	XIZwOfdKp/THF4IxSqtfotqhlzYqmBMxHX3rhRLpqB68EOio623LvVJbuujCFGnIkLjV3k+MhO4
	eUR55gzQ3EutBAWxWH0M+ckDSSSe0BDGpLRi8SilkF6xyjkSRBEkT26LpkVk+O7ZW6gETSB66ht
	xUZ9wpsKMff89P623aDE2FnkqrEtGrfWfM2rON4LamvtHClH0amIefJok6V/sbDecnMz7sMqFhx
	lQbYB0UIx4JtD7Q/YZYoQJV5mSAq8pTzJ0IT388G7n7XrghiOs8PPevAp9XsWoX2JsGSqYfCAyi
	kKEzy+4dcAZu5x86fJXcFWJID+DihOuBNyhNByqOUQ62rkVUsiF++Z992jnSWdldzVuEXMB2ucT
	RCqF+7h2KRrmdJLdxDKim9CCU=
X-Received: by 2002:a05:600c:1d18:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4ba02305439mr10274975e9.3.1794264849405;
        Mon, 09 Nov 2026 14:54:09 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm21435365e9.6.2026.11.09.14.54.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 14:54:08 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: use all HTT_PPDU_STATS_MAX_USERS slots for PPDU users
Date: Mon,  9 Nov 2026 23:53:55 +0100
Message-ID: <20261109225355.23161-3-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109225355.23161-1-gsustek@gmail.com>
References: <20261109225355.23161-1-gsustek@gmail.com>
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

user_stats[] in struct htt_ppdu_stats has HTT_PPDU_STATS_MAX_USERS
entries, but ath12k_get_ppdu_user_index() searches only the first
HTT_PPDU_STATS_MAX_USERS - 1 of them for a peer's slot, and
ath12k_htt_update_ppdu_stats() applies only the first
HTT_PPDU_STATS_MAX_USERS - 1 slots to the per-peer TX statistics. The
last slot is never used: a message with HTT_PPDU_STATS_MAX_USERS
distinct peers has the statistics of one of them dropped, and the
remaining slot is dead memory. Both loops have had the "- 1" since the
initial driver.

Iterate over all HTT_PPDU_STATS_MAX_USERS slots in both functions.

The messages with num_users 8 seen on a QCN9274 AP carry user TLVs for
two peers, so this case has not been observed in the field; the fix
follows from the array size.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
 drivers/net/wireless/ath/ath12k/dp_htt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index f5c526bf82d8..a0f98259ee64 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -46,7 +46,7 @@ static int ath12k_get_ppdu_user_index(struct htt_ppdu_stats *ppdu_stats,
 {
 	int i;
 
-	for (i = 0; i < HTT_PPDU_STATS_MAX_USERS - 1; i++) {
+	for (i = 0; i < HTT_PPDU_STATS_MAX_USERS; i++) {
 		if (ppdu_stats->user_stats[i].is_valid_peer_id) {
 			if (peer_id == ppdu_stats->user_stats[i].peer_id)
 				return i;
@@ -362,7 +362,7 @@ static void ath12k_htt_update_ppdu_stats(struct ath12k_pdev_dp *dp_pdev,
 {
 	u8 user;
 
-	for (user = 0; user < HTT_PPDU_STATS_MAX_USERS - 1; user++)
+	for (user = 0; user < HTT_PPDU_STATS_MAX_USERS; user++)
 		ath12k_update_per_peer_tx_stats(dp_pdev, ppdu_stats, user);
 }
 
-- 
2.56.0

