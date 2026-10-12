Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E444BB263
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822536; cv=none; b=bwJBZs6KQFoz651HZbWWxKaEhjhMFdaU0OJfkUhb3r/AyK3+wA/ugrcMkALsPicPqP4oJaFim2F7FSSx9rIf5+NHIvxMFs6lNsBh9hD1uY9xhVyC6PKisHv32oFJhrNN4pH4RBQvKHkqXX9pI36e+Wb7acc7Y30DJzX7KQWsEho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822536; c=relaxed/simple;
	bh=4jfueo1KRT+VSIydQk/kkJuNFgop/gPHtRCFmdEUFMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mskQe4BNJzEdA42HID9IEE49w6XPA5CEnxnOC+wIKwdvnBHG4y9Hx5aTyH2seWAr3+ZVkvGlW/QeeCmSa+sm5gcx5yFYKGIwOhYpDK3yzBaXh/wwpg4mBB+VCzjZtuttI354BJNqSGSoDeaF/bdCOpi/GqXuGCU7UyrFlp2+5k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Sd4RqKOM; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=NxxhIAkT; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Sd4RqKOM";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="NxxhIAkT"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CExk6v915817
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=5gB+
	ZqwfjG4r0XBpuTzegxUAaW9Dt8o+O2PoEEbjMe0=; b=Sd4RqKOM7WW5PKVca91P
	lkXwZJYYp3TusUklcKSrW5Meyi/cVoGQlJ4SNWyGvV5FSy7ApBHzLn2ZCeOToNxf
	Rz3tdQPVzl2lEQsuE+CHVJmUMvbqtJWehVvaMgUjr6tcSR5tKEqfimqzWeqIAfQJ
	BjUuPzOIH3g2PRS+9PzWOTdIjWMA55tgyr3p7Hn/Uu3tGLXfPjMHoLSxbkB2wkKk
	OubwP2m7+dcXgxzcAoblM5luaecEXWpSMzlwdmoeEAsHsjDnrIjmy7dikFzBmGxM
	rTcTeEfV2N5j9xBgmoA3mvlqUdszpTQs3CXf1v3EGBIHsZSmY6gn16V0bmbhHkJU
	Hw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h91sy910q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:51 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b529a8610so48852346d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791822531; x=1792427331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5gB+ZqwfjG4r0XBpuTzegxUAaW9Dt8o+O2PoEEbjMe0=;
        b=NxxhIAkTycbfTYqvXaAh/hH1qCXlBjWskBKBuwgm9vKRLhutVxW3gfcJiq+BUlsImC
         BocS/3YvXlB0rOa7G+6kr/Z92x65IX8YlxTXhaW+uzvu4By99PD2HsneNEERasM0GjP+
         H90mInpQ4M69/AfZs0Xi7bpB2yuTNCHzMzrPBYsIgZLeaAZARgjRWg9FUp411hWlMnlY
         k6zTuPLlxT+A3WXJUE61i46oU3V0RlyKJJv8CDTF7z/iO7So4DG9fUo9tuqXDYUe0S8r
         BHV7QUpsjxYNObzwDmYH1yMcs058duLhiFFy+KUs7K30f3EQ62PSRIRhii6lR6i895ml
         HRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822531; x=1792427331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5gB+ZqwfjG4r0XBpuTzegxUAaW9Dt8o+O2PoEEbjMe0=;
        b=QHKQJ7orle9U2tsdIWxKbChgboytSUMdS0MRBCf2+M0105fjdMmmqdTeMae/DIHSdH
         PS5p+IXBNff8ffFX+i7yIaenQZGh+PaAZ7LB1qjl1j8g8NB3QBqH1ga5hgR+FWLuuV8Y
         aIpkSQr7tY3ulKQYBW37BClRvCiGZhmTJQoaTs0bmb7/nMf0oHTEwvH3gIXTtycV0lkH
         4PbSe9s7yjR7NIkJzjCV8r9I+aHSDTAjTX2iwpKSp3XSWWKtKG3cAQF2aLFBq9HhIztk
         OHkehj/xjUA2b9Dqa/tbZ/23O9LxSsUmPch0enDCQAtawS4yrXX8b78cc2DsTa9i1uCR
         crDw==
X-Forwarded-Encrypted: i=1; AKwUvBzpVNkUKJZ1o267pSQRnYLbTvq6ZKOE2ZP3EqY258OIP5FkuJb7YK6GqIkCOLuVON6EeRP/yQIQwO+yBBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+VvQwbiC20xKIg4PjOjTuofA8hJ67jcpU6wC1Q9rkBOPeA9gE
	KUKVAHnOUgnSIIo7HjhVscAJ5NHoltVtkEXAmI3DcI5LrWwSqvXvklQXNThmdzKy47ddGWUbMPU
	qG2j0qVp7vjyjpHaNBYO0wAVXjRHGoldv2tzIe6YX+nb8b/00lgu/347bxzJGjA==
X-Gm-Gg: AYBFou0CB5eQnVnDy1ml6c/IPOs2F5tVi5Y9Rd5Aky9TS74DzxV80o68wSXdYGKqhSq
	cRjRj/z9qrgxfoii76piNO8rwO3BwcOkjfzvPTm/FE2RWIz2IKpUUut3tn8OP8yTpJAiJ2iRKKk
	0JCRCDJlwLUnV8mherMtuRp3LW0O0TYGEFBtxVw1KxI2a9zyXjE39bL0/pnPgtSyGwvfw8zGWF5
	tBXFcC9YZSWG2Pv5IKdrrVWnO1Ruy1nItoXp0gxwuVx8qvVbuapiUstHOb9EPk6g14q7ZBmf/ap
	J6chGNJC+E4jDh4HfCJfW5djs43Cf0/OdHajObxcZl+ES4mj6Y/FSYt/Jhv38D/qwUU8W2diO3d
	PsoeJXRdkJ5ixGYIreeVaL9JtnOE0U7/rNBl72GVJq8ekgBw=
X-Received: by 2002:a05:6214:21c8:b0:917:a80b:b910 with SMTP id 6a1803df08f44-91b557bcb89mr189578046d6.39.1791822531225;
        Mon, 12 Oct 2026 09:28:51 -0700 (PDT)
X-Received: by 2002:a05:6214:21c8:b0:917:a80b:b910 with SMTP id 6a1803df08f44-91b557bcb89mr189576966d6.39.1791822529909;
        Mon, 12 Oct 2026 09:28:49 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c27146sm1411796d6.29.2026.10.12.09.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:28:49 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 12:28:24 -0400
Subject: [PATCH v4 12/18] btrfs: remove the free space cache trimming
 ranges
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-btrfs-remove-v1-space-cache-v4-12-f125bd8c07f9@columbia.edu>
References: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
In-Reply-To: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791822515; l=7161;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=4jfueo1KRT+VSIydQk/kkJuNFgop/gPHtRCFmdEUFMg=;
 b=id41IFkKv0P3FXaiEbr/RuQkj/pvKNnMy18gCMnbGCeOl2S00nA8I4ttJayDm/xBvU7vA7Ppq
 pjaKbGkKZn1B0ZpPbCMAOmodch79gLHy4irNGdcBdoHRITBKXyBw5mk
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX6XuyK68UDcXa
 QX/ppcQzhvDx5lJbwDMrAJwXj1JWQuYjarFRoBWE3S9ALLASuCjs4cr/QFxH1IscDN9Xln4frR8
 q84AoOn71Ihz+AccItVqvaEMy+3ywKytuNijmqQYs5BxFpnHzcPL
X-Authority-Analysis: v=2.4 cv=JMSuIMKb c=1 sm=1 tr=0 ts=6acd0ac3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=qCNzSPQ7UVaF4CatvjwA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: EsJz1pTKLakrIS5WNS5F9Q_4eo7mzTiF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX9EIpOevmOdu9
 gHy8Qn6Q8TLcM8mrITJ2vVikwrw06zySpKXECTHp+MszkD7IrElqFyxFuiNkVgzc3H9fDZsFeei
 xXFUALRe5gY91XCONJQypPsQUIeuOfs/Q3s74PIrWmQFunpk+MhIHVBp8jf8yY7josapwigmU72
 u3j52HEtMt19QipzaTr5UEUpsmBajxOlD4fDEtp4PweMDKeIubjKpj1/bXczpoma2To5dQmtgbO
 +1ZOSEwlv2VWLLXUlJNSg+wwt1QH3QLXljfimCIpkDj1ofSE6pnwAYXClo0/FsSlEsLzadIw7co
 VxPcmgjDb4KZzT9VMC0RUWIKrgUzsWZ6ObOMRuklL1JZ3IuRSf/dCkrFbzuB5az+6RywTxVYuU/
 PPF1ROsCAn2h2gh9wOFn5MkgTROvOVsS/ftpiadZKDAes/y43vjAfw21q3o+El4AeleoKEnfNft
 VFDcXAO/rWboewXVueQ==
X-Proofpoint-ORIG-GUID: EsJz1pTKLakrIS5WNS5F9Q_4eo7mzTiF
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=10 lowpriorityscore=10 adultscore=0 bulkscore=10 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120065

cache_writeout_mutex and trimming_ranges let the v1 cache writer see
ranges that were unlinked from the free space tree while being
discarded. Nothing consumes the list anymore, and the tree itself is
protected by tree_lock, so remove them.

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/free-space-cache.c | 41 +++--------------------------------------
 fs/btrfs/free-space-cache.h |  2 --
 2 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
index 4dcbefb0bfed..bff6e5b372d6 100644
--- a/fs/btrfs/free-space-cache.c
+++ b/fs/btrfs/free-space-cache.c
@@ -36,12 +36,6 @@
 static struct kmem_cache *btrfs_free_space_cachep;
 static struct kmem_cache *btrfs_free_space_bitmap_cachep;
 
-struct btrfs_trim_range {
-	u64 start;
-	u64 bytes;
-	struct list_head list;
-};
-
 static int link_free_space(struct btrfs_free_space_ctl *ctl,
 			   struct btrfs_free_space *info);
 static void unlink_free_space(struct btrfs_free_space_ctl *ctl,
@@ -1702,8 +1696,6 @@ void btrfs_init_free_space_ctl(struct btrfs_block_group *block_group,
 	spin_lock_init(&ctl->tree_lock);
 	ctl->block_group = block_group;
 	ctl->free_space_bytes = RB_ROOT_CACHED;
-	INIT_LIST_HEAD(&ctl->trimming_ranges);
-	mutex_init(&ctl->cache_writeout_mutex);
 
 	/*
 	 * we only want to have 32k of ram per block group for keeping
@@ -2399,12 +2391,10 @@ void btrfs_init_free_cluster(struct btrfs_free_cluster *cluster)
 static int do_trimming(struct btrfs_block_group *block_group,
 		       u64 *total_trimmed, u64 start, u64 bytes,
 		       u64 reserved_start, u64 reserved_bytes,
-		       enum btrfs_trim_state reserved_trim_state,
-		       struct btrfs_trim_range *trim_entry)
+		       enum btrfs_trim_state reserved_trim_state)
 {
 	struct btrfs_space_info *space_info = block_group->space_info;
 	struct btrfs_fs_info *fs_info = block_group->fs_info;
-	struct btrfs_free_space_ctl *ctl = block_group->free_space_ctl;
 	int ret;
 	bool bg_ro;
 	const u64 end = start + bytes;
@@ -2430,7 +2420,6 @@ static int do_trimming(struct btrfs_block_group *block_group,
 		trim_state = BTRFS_TRIM_STATE_TRIMMED;
 	}
 
-	mutex_lock(&ctl->cache_writeout_mutex);
 	if (reserved_start < start)
 		__btrfs_add_free_space(block_group, reserved_start,
 				       start - reserved_start,
@@ -2439,8 +2428,6 @@ static int do_trimming(struct btrfs_block_group *block_group,
 		__btrfs_add_free_space(block_group, end, reserved_end - end,
 				       reserved_trim_state);
 	__btrfs_add_free_space(block_group, start, bytes, trim_state);
-	list_del(&trim_entry->list);
-	mutex_unlock(&ctl->cache_writeout_mutex);
 
 	if (!bg_ro) {
 		spin_lock(&space_info->lock);
@@ -2478,9 +2465,6 @@ static int trim_no_bitmap(struct btrfs_block_group *block_group,
 	const u64 max_discard_size = READ_ONCE(discard_ctl->max_discard_size);
 
 	while (start < end) {
-		struct btrfs_trim_range trim_entry;
-
-		mutex_lock(&ctl->cache_writeout_mutex);
 		spin_lock(&ctl->tree_lock);
 
 		if (ctl->free_space < minlen)
@@ -2511,7 +2495,6 @@ static int trim_no_bitmap(struct btrfs_block_group *block_group,
 			bytes = entry->bytes;
 			if (bytes < minlen) {
 				spin_unlock(&ctl->tree_lock);
-				mutex_unlock(&ctl->cache_writeout_mutex);
 				goto next;
 			}
 			unlink_free_space(ctl, entry, true);
@@ -2536,7 +2519,6 @@ static int trim_no_bitmap(struct btrfs_block_group *block_group,
 			bytes = min(extent_start + extent_bytes, end) - start;
 			if (bytes < minlen) {
 				spin_unlock(&ctl->tree_lock);
-				mutex_unlock(&ctl->cache_writeout_mutex);
 				goto next;
 			}
 
@@ -2545,14 +2527,9 @@ static int trim_no_bitmap(struct btrfs_block_group *block_group,
 		}
 
 		spin_unlock(&ctl->tree_lock);
-		trim_entry.start = extent_start;
-		trim_entry.bytes = extent_bytes;
-		list_add_tail(&trim_entry.list, &ctl->trimming_ranges);
-		mutex_unlock(&ctl->cache_writeout_mutex);
 
 		ret = do_trimming(block_group, total_trimmed, start, bytes,
-				  extent_start, extent_bytes, extent_trim_state,
-				  &trim_entry);
+				  extent_start, extent_bytes, extent_trim_state);
 		if (ret) {
 			block_group->discard_cursor = start + bytes;
 			break;
@@ -2576,7 +2553,6 @@ static int trim_no_bitmap(struct btrfs_block_group *block_group,
 out_unlock:
 	block_group->discard_cursor = btrfs_block_group_end(block_group);
 	spin_unlock(&ctl->tree_lock);
-	mutex_unlock(&ctl->cache_writeout_mutex);
 
 	return ret;
 }
@@ -2687,16 +2663,13 @@ static int trim_bitmaps(struct btrfs_block_group *block_group,
 
 	while (offset < end) {
 		bool next_bitmap = false;
-		struct btrfs_trim_range trim_entry;
 
-		mutex_lock(&ctl->cache_writeout_mutex);
 		spin_lock(&ctl->tree_lock);
 
 		if (ctl->free_space < minlen) {
 			block_group->discard_cursor =
 				btrfs_block_group_end(block_group);
 			spin_unlock(&ctl->tree_lock);
-			mutex_unlock(&ctl->cache_writeout_mutex);
 			break;
 		}
 
@@ -2712,7 +2685,6 @@ static int trim_bitmaps(struct btrfs_block_group *block_group,
 		if (!entry || (async && minlen && start == offset &&
 			       btrfs_free_space_trimmed(entry))) {
 			spin_unlock(&ctl->tree_lock);
-			mutex_unlock(&ctl->cache_writeout_mutex);
 			next_bitmap = true;
 			goto next;
 		}
@@ -2738,7 +2710,6 @@ static int trim_bitmaps(struct btrfs_block_group *block_group,
 			else
 				entry->trim_state = BTRFS_TRIM_STATE_UNTRIMMED;
 			spin_unlock(&ctl->tree_lock);
-			mutex_unlock(&ctl->cache_writeout_mutex);
 			next_bitmap = true;
 			goto next;
 		}
@@ -2749,14 +2720,12 @@ static int trim_bitmaps(struct btrfs_block_group *block_group,
 		 */
 		if (async && *total_trimmed) {
 			spin_unlock(&ctl->tree_lock);
-			mutex_unlock(&ctl->cache_writeout_mutex);
 			return ret;
 		}
 
 		bytes = min(bytes, end - start);
 		if (bytes < minlen || (async && maxlen && bytes > maxlen)) {
 			spin_unlock(&ctl->tree_lock);
-			mutex_unlock(&ctl->cache_writeout_mutex);
 			goto next;
 		}
 
@@ -2776,13 +2745,9 @@ static int trim_bitmaps(struct btrfs_block_group *block_group,
 			free_bitmap(ctl, entry);
 
 		spin_unlock(&ctl->tree_lock);
-		trim_entry.start = start;
-		trim_entry.bytes = bytes;
-		list_add_tail(&trim_entry.list, &ctl->trimming_ranges);
-		mutex_unlock(&ctl->cache_writeout_mutex);
 
 		ret = do_trimming(block_group, total_trimmed, start, bytes,
-				  start, bytes, 0, &trim_entry);
+				  start, bytes, 0);
 		if (ret) {
 			reset_trimming_bitmap(ctl, offset);
 			block_group->discard_cursor =
diff --git a/fs/btrfs/free-space-cache.h b/fs/btrfs/free-space-cache.h
index f5f18e397b13..e22443598b8e 100644
--- a/fs/btrfs/free-space-cache.h
+++ b/fs/btrfs/free-space-cache.h
@@ -83,8 +83,6 @@ struct btrfs_free_space_ctl {
 	s32 discardable_extents[BTRFS_STAT_NR_ENTRIES];
 	s64 discardable_bytes[BTRFS_STAT_NR_ENTRIES];
 	struct btrfs_block_group *block_group;
-	struct mutex cache_writeout_mutex;
-	struct list_head trimming_ranges;
 };
 
 int __init btrfs_free_space_init(void);

-- 
2.39.5

