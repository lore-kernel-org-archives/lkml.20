Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC53BED75
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075428; cv=none; b=MM1fI1cdILqK20r33EBhV0mXSldZidWb0jqaV6GBc+QG0twUTPezmbkAyFDhpTKrsGq3x0n+VGIm4fUDmVtjx996NphBwzGSL5aaL1TyX2QmYWliotKerYYt6AVF05si9tSULtPIEv9wbHXvYCl/P16tMto84hg732hWCkl9ogA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075428; c=relaxed/simple;
	bh=4jfueo1KRT+VSIydQk/kkJuNFgop/gPHtRCFmdEUFMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CsrGvd+cB/HkoCUfU2KFGUcqqHzN+MlJHQypv5wfM4ThUeLMnxjNHg1WeC+NZQ1t4Xk0OlDdtQ1E7LwiCfypNeSxCvLfmAeXyX0MtbQaGnnQTBO8becYf1w59JJOE2YiVUk4CIdPTfCP6vVT1Lur1Y6jd68c+kj3G7yCCmGkotk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=huzXDH+D; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=lwPVBYiS; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="huzXDH+D";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="lwPVBYiS"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEYBML1621659
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=5gB+
	ZqwfjG4r0XBpuTzegxUAaW9Dt8o+O2PoEEbjMe0=; b=huzXDH+Du7y64TqAVPdI
	xZatt1ZhX7j7jDgcl9ltcuD3V8nNbLZuzgNaxJpRXpyISCwMXBg35aUVoi0x8B9w
	UKl0+BZav8mz3gTZKVQTuMzfjYcB6hZT/OZHDFQ4mvnPPZkVnHfYFWhTZPYaddji
	fakSvaz0Ws0aCZD8nIlQstHIo0A2d6KY7vwOGbo999MgaIsDC9dR8pruvw2j3P71
	lDaOPtJoB8iqZf4nJaI4HEtJKYmPvU9pY/IAmUmSlmFqBktpOw71uOl+yjp42qQE
	rHos9ScUWsdN3jpUyVhliVt/qxFwNqNU54dDUlX8pNy36zEGpGlvaakNh5611BjG
	sg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hah8evwj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:45 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b7e7d5f56so96916036d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792075424; x=1792680224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5gB+ZqwfjG4r0XBpuTzegxUAaW9Dt8o+O2PoEEbjMe0=;
        b=lwPVBYiSxY8pMSbSvyHV6Lm0ejMRqwfp93Pqu/zgVDJx+W4AklLMy6UlUdcLTMw3FP
         AxBHef7JUvYNplDfHslULc1D54fANuLKf5sceWlS2kOT0thtQvjwFEvhJufC8qRwLkNI
         jS7IFXucQTpPcsgTG/Qk6QuGfx6iEXpInjYgSQNeevvh22dkZU4UVrUQ/ip2cMK7KpRS
         3tigVj5/KxXiTDH08NKLnw2fjUMie61zwTGlsDbjb37DLUAPGwiag2oBlEaqCNg2fu/B
         0DQaa/A8o1bM/E0DqyKGVV+DF7CU+fIME/0bEYbzzuzVeFpUpx3SFFrzxOpWWOSB9QUU
         rLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075424; x=1792680224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5gB+ZqwfjG4r0XBpuTzegxUAaW9Dt8o+O2PoEEbjMe0=;
        b=1rQrjNE9XhzRzG/fiyh45empr0PzskvuHwFuEJKUEkix7gv9/2/N0WEfHe1S5Lm0Zj
         o0Hd/VjgWt57aAFzTZBaayGmFmJK0sRb0MA4lsejSxjZCP/hIS/siIh1/MxaZqNJKU0W
         bguuENd3Q6gPEq4Uvw4mWs31/dd2yI24SJWyNAan8VBHJCPDt4lG4daj1XFPeOJBSWcS
         ZwW+Sj5mOkpMZpIkPt7KvDw3FSEnTNwE1cuVoF7Eojax0VvpWPxaCTGqmEeZF9RUUSaW
         8tag8LPBojZTPYigWxl2eIVXJoz3tUMrZuS/OsOfcxEowftB3RBGV8jcxZBu3O7AaWQs
         UWEw==
X-Forwarded-Encrypted: i=1; AKwUvBz+hFCVBXPziX64I+mK0f0DvNSQNWaTt3JjSmOdhB37JOnagPaUA5F4eseQ24d1y4oN2kSIIPEQ5CCQV5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI79pTyH/4D08WEbf8QUlwUkgTlQV6C6RFw3YT0Qht19YNYmrTd
	x6DJHJbYHvV3lvIDhDkn/f7h+eOG9GLFpT6V9Sxo3cx5bD8vb2sb6wSKckZhVIbPMxW0QKlCs+Z
	0mxGtZ5OcRzQOqRfFGNBtHDB7o+RMkgRJ3MkTRdUbodkmndS3wPojaZIGMGx21g==
X-Gm-Gg: AYBFou194ssE5N9fXh+OQdnZHU40Mb7lR6v2wo+Sr4/OfiiNBaFN1qX0VUlbughV6Jf
	6VipSAS53y4hVuwShxVp2INld6MakkW7cl3GFXnqrbH3XWhbi36FraHlR72I2Iyat6msY5/Tdtw
	sd11reP/i6/IHl6pBiaYSpIUcENRbLHn60a87ELosswMSdJ1R+7YvHd1sjMoTkFsPqU1/Uz0KXh
	rOZD4NGbQJ1dSKFv63dIlG/gQ4Z0vEvqXS+fEk0dfW8g/By1pg125UMfyte72scec/RIajhNWFK
	IevdfusPE/witaXs5K3rzRL0quNY1sJnHigPGb/h7/gCsO/nhe1SmHOcL/XKPUw++XENp8hJvqz
	NgNElMzMUqVZNlbCC2e7Ul0H/FBNPidcnY2pI41MiXYWX
X-Received: by 2002:a05:620a:4693:b0:93c:771e:b672 with SMTP id af79cd13be357-93ebd2955d7mr3274780985a.54.1792075424580;
        Thu, 15 Oct 2026 07:43:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:93c:771e:b672 with SMTP id af79cd13be357-93ebd2955d7mr3274775585a.54.1792075424035;
        Thu, 15 Oct 2026 07:43:44 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b5f323sm83026476d6.20.2026.10.15.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:43:43 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 15 Oct 2026 10:43:26 -0400
Subject: [PATCH v5 13/19] btrfs: remove the free space cache trimming
 ranges
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-btrfs-remove-v1-space-cache-v5-13-6b31347d9998@columbia.edu>
References: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
In-Reply-To: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075404; l=7161;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=4jfueo1KRT+VSIydQk/kkJuNFgop/gPHtRCFmdEUFMg=;
 b=i7GX2sa7SGXswYILoH7Wj+SBc6u8wcFVDBfoBE+NokgxUcEQm8I6to5LUIN4EhFFHywrJNPuQ
 KTg1KK9auj8D9xDmscba3+s2IxPBMp488VELK5UqQzuZl0sd4rVUUcA
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: 2e731T1FOvtujSdU1hft9_k6k1sWJeVv
X-Proofpoint-ORIG-GUID: 2e731T1FOvtujSdU1hft9_k6k1sWJeVv
X-Authority-Analysis: v=2.4 cv=Ob8NnRTY c=1 sm=1 tr=0 ts=6ad0e6a1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=qCNzSPQ7UVaF4CatvjwA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX2oXa92YRI4Ot
 aB0L0WOLa3GchrijoqorVKT7iDymcugClnA/bBamuLLxT7v7B6mkWyyN/seIhvjtqpUcb8VoHUU
 dlkfDfSxXy2g8EwU5FcfiR0chwhpZqfCs54ncuLG5L7YTwm/4HGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX41xQePEsNtsQ
 S4nb4x5mXcfRsvJfROowDmFYRQD6ed2049IobmsK51JyFuUJFlE5QtaraLJDH5f+Ah46DFjjbiV
 h5dQvmlbbUTyj4STNjSfA6wraDk4wYvSVgQyhWbcoqOrZZYj1JMcZpB0GZuVAN3V5JeqecvvB3g
 DABIP5lmMImaFWWpLFMC1Q4tygmzCTtrrci1gvPrh3wZ+xZKcmhOurV0zuuWZE9fyVX8uzpM+ve
 x5YH29Lu8y08EyE/Buq3vcLXziZF2i2liCoGpLEo5zD8ezLPloL6g2JG/mL+qa4A/8uYNAJaQuJ
 mHrcwtifAYxAyDFsyBmOij3s4TO4Zs/8M6c2Tc5VgpfHonFoa+3U6Qpj3hZZGkOMdOo7RadvOZC
 vfeIqnYpVl3XTj0FdD2lcyCzlghisTr0l1e/JvL2qU5xmZNp7yjqS9hpm22+BHz2Pn5+HxVcfek
 pokmWCiOwQyQTlJdw2A==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=10 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

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

