Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950038;
	b=dry6lj1Qkai3XsPm4s+UUhFdGOBYdgtzdJs6yXOUGnj26n5kX5mpK2sa9I0Srs2jbXjQ
	 rnZsx+G2UDFA63lJgfEX/yNOkYT7goMopSOAK85rjpO/tt7A4PR1TldIZWcCK7Pdww+FR
	 cb/DNPn0xhYNqTxBIVTlKdtYBX8mp2rSCJ+iXv95EfKmZ0mS8hB2dm8QVP1w2SSWWKPzt
	 CRWUgsi/w45RQI37X/aKEk1SqM7Ek5CRm0VfkLKKztrsW2ZYUjLkPXkK9m3dOwSOO8SHn
	 NhW2IOgvvPyuCKdf4mpjdPC/lPe1scUK7w3teZor/o8o4mSVzjGoCLs9egqzhGWNzZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7dxq8eDBlDPCIVTBkGYSUFbRjgK/3rDeHdp3Ckw4nU4=;
	b=hK0DZ0p1joi/eMZqdz2eonxAWMVshuoVuK2lAiqahBW4vzv1OsdBSTSfM2OTuK9tf4OJ
	 CeCDlQHY/L3WumXGCdueotiBDSWZ+wNJDZJu23ZTitGEbtlHMogHNJcnTqXGRAJTN7IZg
	 up0nmvdRXNQoulY4xDQ9x4X2RtoG7THBu1+LPPftPTgn60IquKau0xdvZUnXMDwoH3B3T
	 HJuucbpTnoD8gzZXrMBPjgRmhZ2LaTYJpuknYKlCf81xWoSvmCj/4xUKBbee10KQlGUtO
	 i+U/BYJ5NfWia46xEiwrNbtbxn7gtOA9zA4TnNi2icaIorZTMlbSPcgU+onmGV85FiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=DsvaovbJ;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23489606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23489606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=DsvaovbJ
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eabf7d5bbeso2386692e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950029; x=1793554829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7dxq8eDBlDPCIVTBkGYSUFbRjgK/3rDeHdp3Ckw4nU4=;
        b=DsvaovbJTuAkS0ufcSRAS2lyhPlL+5q0P15UXZsOgtHO8EVVw1N6LgOJ4klj+0TdF+
         Ynh2HaR3BWUX2+SYJjbgszI3BkuB7ijAKLiuYi+DH0cvi6acDWNQ26kkplt0owno7bz8
         7E/BrGQLl+0Voh5aYklH5AUCm3SxDyP/nzGSh9NOVEDXOjW8pBvSXnOqDchoGXteyyYX
         PL0/8cMxqe32pzVm3wdtbCZA9G8g4yEgMm6KiGoJ4wrH7n32fbRT7qeE4k+VyRmSi9tZ
         IlHeX9Xp8O7mhyq9G4/pTTZKEPDYQ9Q1qkbxQAUkiMh2KfhL7wx17wJLfUU5uofqL0Y3
         pd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950029; x=1793554829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7dxq8eDBlDPCIVTBkGYSUFbRjgK/3rDeHdp3Ckw4nU4=;
        b=Pf5lDYB3jkceL8BBokvDraB+dGfZ+qc20AreuCn7tVWhHDyV+/WuvXeokz6pMH732K
         qFzrMmDtn7nkqSjpwlgLl0bNeMFKLs1cOa5h3yrrGWnRxkYB1f6xAQdU3LgQts5beoaR
         7SBUWNg8Im7yZpP2bQXiSspKskBRPCpMGBatPSgYKy86gOh66BLAwOYyBGrdenD16zFz
         jUo+H7ra60/360T1jGdCYALv5MQy0DNEvvbmZLbWR22dJxc9SpA/UoLpUaYoFWMEipFY
         CUoruu7TdLc4mrDnWgYKtKcZGtyg4hkLs/2klGP8LMJFPJbMDma42TmCrbQBE3sq6qUh
         UksQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwlF73rhXdt1WSxmJLwVZ9KauJB+z3F6R7ysmvHsA6I1GJPU5yMRyWB8l9YzcNJvTW/qktqXBpXoVrLKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS8Z3xB1qV+2/iZHpEmlNVelvhLgOP00wKHtvTHGW3aeu2XFKm
	mKZEcqUX+utVrhabCbSAD5b5Km4EDdT/I5a/WEf1rZhDr8/QudbDh0G92o3aBZg/Vxs=
X-Gm-Gg: AYBFou3V6NQPW2W12NdkFGNMGXGKKJ9C1XuRFyGHzsPVue7utEVakFb33DuSRGYPVSF
	ZZy8+lYYKw9bltucVAqw7zeK4Eha6NaEU02GS10MjEBhSTyZK4SpyiMiJUNbonnKgTk2wOcAcnH
	i96Im4wRpGkqB2lwH0mQ+0mWpvLL1Ry1ssxJrmMWgiBbRuP1MSguhI2ZB5noXdna6k6uCq0ehIN
	V+T54jVnMmwzgH+gcZdkWz2asBPrHuK9k86s38s68QVzLQFSi1Kfkljb0dGjT0ct3DrIb4PmrqH
	HgwITQYkSBSoaWhNzxD3kDeNfteLeR2OA4BzNQGAl4bErSs997+TH9b20p+j2+VrY4NOdlrwEuN
	SRgGwUDdl3h/s7k8AuE0BshLF6Wp4R+ayUCKVBPy4cl/WqGaO0ZMK4MT46YdC3vQsBvvLnGWpS1
	+fzrIGMubK168f1F5AigxzLx4uP4rs/jTtyg1U3iQZ3wVXhcuvYBrCt6JqX5NZtRPKoFvTmIBqG
	/wqYion3Pgj3PDel+3SIRPC7aSqNTYP2q64qJaAOfqvcPhI4ig3huc1GEyKjfWC8izouhGDB+i6
	4cAtTvBry2B100cERV+EcyfDD/YK6PuojbqshCPFxV6Jn/UEZ8OrH3Pl8h64BA2KYqvdd1Zot5A
	T
X-Received: by 2002:a05:6102:41a3:b0:7cc:2f04:a078 with SMTP id ada2fe7eead31-7ce5ce4cc06mr1588692137.37.1792950029106;
        Sun, 25 Oct 2026 10:40:29 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:28 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v2 7/9] kho: support read-only KHO mode in kho_block
Date: Sun, 25 Oct 2026 13:40:14 -0400
Message-ID: <20261025174017.3870481-8-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
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

In read-only KHO mode, incoming serialized kho_block chains lie outside
the kernel's direct map and must not be modified or freed back into the
page allocator.

Map incoming serialized blocks read-only via kho_ro_map_folio(...,
PAGE_KERNEL_RO) during cycle detection and restoration, and skip calling
kho_restore_free() when destroying or shrinking a block set in read-only
mode.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kho_block.c | 62 ++++++++++++++++++++++++++---------
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index a4e945f28fad..5b08bd8a9623 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -60,10 +60,24 @@ static void *kho_block_entry(struct kho_block_set_it *it, u64 index)
 	return kho_block_entries(it->block) + (index * it->bs->entry_size);
 }
 
+static struct kho_block_header_ser *kho_block_map_ser(phys_addr_t pa)
+{
+	if (!pa)
+		return NULL;
+
+	if (kho_is_ro())
+		return kho_ro_map_folio(pa, PAGE_KERNEL_RO);
+
+	return phys_to_virt(pa);
+}
+
 /* Free serialized data */
 static void kho_block_free_ser(struct kho_block_set *bs,
 			       struct kho_block_header_ser *ser)
 {
+	if (kho_is_ro())
+		return;
+
 	if (bs->incoming)
 		kho_restore_free(ser);
 	else
@@ -197,6 +211,19 @@ void kho_block_set_shrink(struct kho_block_set *bs, u64 count)
 		kho_block_set_shrink_one(bs);
 }
 
+static bool kho_block_step_pa(phys_addr_t pa, phys_addr_t *next_pa)
+{
+	struct kho_block_header_ser *ser;
+
+	ser = kho_block_map_ser(pa);
+	if (!ser)
+		return false;
+
+	*next_pa = ser->next;
+
+	return true;
+}
+
 /*
  * kho_block_set_is_cyclic - Check for cycles in a linked list of blocks.
  * Uses Floyd's cycle-finding algorithm to ensure sanity of the incoming list.
@@ -205,30 +232,26 @@ void kho_block_set_shrink(struct kho_block_set *bs, u64 count)
  */
 static bool kho_block_set_is_cyclic(struct kho_block_set *bs)
 {
-	struct kho_block_header_ser *fast;
-	struct kho_block_header_ser *slow;
+	phys_addr_t fast_pa = bs->head_pa;
+	phys_addr_t slow_pa = bs->head_pa;
 	int count = 0;
 
-	fast = phys_to_virt(bs->head_pa);
-	slow = fast;
-
-	while (fast) {
+	while (fast_pa) {
 		if (count++ >= KHO_MAX_BLOCKS) {
 			pr_err("Block set is corrupted\n");
 			return true;
 		}
 
-		if (!fast->next)
-			break;
-
-		fast = phys_to_virt(fast->next);
-		if (!fast->next)
+		if (!kho_block_step_pa(fast_pa, &fast_pa))
+			return true;
+		if (!fast_pa)
 			break;
 
-		fast = phys_to_virt(fast->next);
-		slow = phys_to_virt(slow->next);
+		if (!kho_block_step_pa(fast_pa, &fast_pa) ||
+		    !kho_block_step_pa(slow_pa, &slow_pa))
+			return true;
 
-		if (slow == fast) {
+		if (slow_pa == fast_pa) {
 			pr_err("Block set is corrupted\n");
 			return true;
 		}
@@ -266,7 +289,11 @@ int kho_block_set_restore(struct kho_block_set *bs, u64 head_pa)
 	}
 
 	while (next_pa) {
-		ser = phys_to_virt(next_pa);
+		ser = kho_block_map_ser(next_pa);
+		if (!ser) {
+			err = -EINVAL;
+			goto err_destroy;
+		}
 		if (!ser->count || ser->count > bs->count_per_block) {
 			pr_warn("Block contains invalid entry count: %llu\n",
 				ser->count);
@@ -283,11 +310,14 @@ int kho_block_set_restore(struct kho_block_set *bs, u64 head_pa)
 
 err_destroy:
 	kho_block_set_destroy(bs);
+	if (kho_is_ro())
+		return err;
 
 	/* Free the remaining un-restored blocks in the physical chain */
 	while (next_pa) {
-		struct kho_block_header_ser *next_ser = phys_to_virt(next_pa);
+		struct kho_block_header_ser *next_ser;
 
+		next_ser = phys_to_virt(next_pa);
 		next_pa = next_ser->next;
 		kho_block_free_ser(bs, next_ser);
 	}
-- 
2.56.0.307.g5fe7bd680c-goog

