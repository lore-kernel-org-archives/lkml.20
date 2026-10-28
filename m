Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793164398;
	b=jKsTP79FjHWysmcfyAT1DAa97MxSzyIh232LLvrd7bTu81ufz4WDJLrlSgQKfynlOJ0O
	 e+i8YSx8S2PnK6w4FWrd5V8Wq/oktIa0M9f9QEc984FOlqQglaZrDuqfqEnfiKHL2zs2a
	 wSP9kQhfLekCMgeraqV1XsBGn6rOwZHMc2k8m37UNkLXj+TnhwKIORxH3WEe4SReYfaso
	 7ZXrhrhPAK2aAFRL4va2ROdbX08Ps7VRkRMM15mhWaZK9X/Q5o0++lLVIhDvkbvX74oYY
	 4CksoFaBlLdfbFtgGyiRPtmNVTvkHKi5QZC2FguM94tRNabOn59s7xGw5PATcV2pEwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jGHdCexy6WO9vn70fAdnEqZgjYrf6z9TvrrdavCztqo=;
	b=FT5O56TKD3uK7lfa7AQYWU4XmseCq+cIvewMxbR/LDRFoymWZzyJv4qPZt0NU8qcHM1l
	 Y36clCBJBMECiwdNdAWnQ/saAwBF3YSB6VisncDSyFDmLmQCQdTyX3869FrBE2W5QADy0
	 CfpXB92rnhkHVMW2B5sqoNIvAlOENtzcqtaea/UgAp/6imZQwYTlFkG4YiZ2P3HL7FV3x
	 8HDB12yRMWw8zB9ifKUNuqvy/Vzp9GTlBibKyvoNw/KsiIuS3kAiuTsmSwkD1Ul8Lj/xJ
	 YVWZFk+Y6v9zM5LDMN0GqZU9ve9BTKNph4C2FXnmPWnsvFEpPrqD688i2PH/8OQEFNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--surenb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hcYwNKo8;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A29606A326
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A29606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hcYwNKo8
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1003369eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793164397; x=1793769197; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jGHdCexy6WO9vn70fAdnEqZgjYrf6z9TvrrdavCztqo=;
        b=hcYwNKo8138h0FpRdipjf3QUR1G+D6Npw4/bXwM9y1EWlTJ1AmtowA668MOfypgmiF
         Z9c/hVLG6Szdrj+YdwQZcg2wPQCR1iMVn2NUpuqryQ1rlzKZinM++QhrAbb1qdESEBWy
         NDRrWGMIbo22NUVz5IEh+R7A9LSbfRiw0tIkb7kWBTTbNP7cthcKHo5VIkjixOc3am1L
         9nXSCR41Q1B5l369TKOvEY+1WPOiJXLrjmOMj3fpOPrW/VnBz9p3mIWqF2aTswby175O
         NKWFrtb0rmBs5FVgx28uvyTYhTIpn9W1PpruQ+dekt8qYUZmaeTx30X7jjUC2zcuqyI+
         tC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793164397; x=1793769197;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGHdCexy6WO9vn70fAdnEqZgjYrf6z9TvrrdavCztqo=;
        b=fl1b/3MXd2jUrpG3bu+4G4opQJ9l1xU/ycGd9wD/P//N41yCjWSFLtue02M8Ja7AuB
         0iqv6eYdNSgEJ09zAFQ0/aVxej4B22ilT4i5qoqyt5qPqhtTTGOHksjj3KevFhYHgXRK
         YlDuaxvSyEljz91P0iGk93gN5wYovSwuq//HUxsZbvhdGU37piKSJsJyGUBaXbB/YgLa
         EEpq8ErCB1TnML7abG09Bd/bjrEE8Sh/HmCDnH2FrCMDT5GirjfBWM+DBF2nwy+NpvhL
         5uhpB7FSrRTcDQTMutiP2qit2jbycoS/B4Wb7zmC+K31wfc8zZWclc58vqH8MpEJBUlZ
         3nFw==
X-Forwarded-Encrypted: i=1; AKwUvBzNYv5MCqADYLcOcDXJz+n9HXyLW2FkgZxeHSbR1nN2LJcZbG6mfF/Z9y9NhB+F/upWF3iOlLx5t9Z5unA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW2Qc+lxtZXklV+SAoJajLaD3jr7mou9UW4LFJM8M+UkSyVibc
	xpi/IWcyI34aFnSSAD6qPXxpdtXSzRYdx9Dgi0IoMmldRR+I3d/A+1uw+W8WzK539kKLwGzJkdS
	gwxSA9Q==
X-Received: from dlbrl12.prod.google.com ([2002:a05:7022:f50c:b0:195:e16b:fdd2])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:126:b0:16a:c6f2:60c2
 with SMTP id a92af1059eb24-1a6cd498ddemr1946287c88.12.1793164396372; Tue, 27
 Oct 2026 22:13:16 -0700 (PDT)
Date: Tue, 27 Oct 2026 22:13:12 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261028051312.1505295-1-surenb@google.com>
Subject: [PATCH 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup tearing tests
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org, ljs@kernel.org, jannh@google.com, liam@infradead.org, 
	willy@infradead.org, paulmck@kernel.org, pfalcato@suse.de, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"

Pss metrics can be affected by map count even if VMA tree stays unchanged,
therefore test checking VMA tree integrity can't use them. Use Rss instead
and pre-populate the VMAs so that Rss changes if a VMA gets skipped or
double-counted.

Fixes: ca5480fb53fa ("selftests/proc: add /proc/pid/smaps_rollup tearing tests")
Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202610271934.fd287c3f-lkp@intel.com
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 tools/testing/selftests/proc/proc-maps-race.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/proc/proc-maps-race.c b/tools/testing/selftests/proc/proc-maps-race.c
index bf4c5073f6fc..b6d88afb252b 100644
--- a/tools/testing/selftests/proc/proc-maps-race.c
+++ b/tools/testing/selftests/proc/proc-maps-race.c
@@ -528,13 +528,10 @@ static bool compare_smaps_rollup(FIXTURE_DATA(proc_maps_race) *self,
 		struct smaps_rollup_stats *actual)
 {
 	/*
-	 * Clean/dirty metrics might change but Pss-related ones
-	 * should stay constant.
+	 * Clean/dirty metrics might change. Pss depends on map count and might
+	 * change as well. Rss should stay constant.
 	 */
-	if (cmp_smaps_rollup_stat(expected, actual, Pss) &&
-	    cmp_smaps_rollup_stat(expected, actual, Pss_Anon) &&
-	    cmp_smaps_rollup_stat(expected, actual, Pss_File) &&
-	    cmp_smaps_rollup_stat(expected, actual, Pss_Shmem))
+	if (cmp_smaps_rollup_stat(expected, actual, Rss))
 		return true;
 
 	print_smaps_rollup_stats("Expected stats:", self, expected);
@@ -759,7 +756,7 @@ FIXTURE_SETUP(proc_maps_race)
 
 		for (i = 0; i < mod_info->vma_count; i++) {
 			mod_info->child_mapped_addr[i] = mmap(NULL, self->page_size * 3, prot,
-					MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+					MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1, 0);
 			ASSERT_NE(mod_info->child_mapped_addr[i], MAP_FAILED);
 			/* change protection in adjacent maps to prevent merging */
 			prot ^= PROT_WRITE;

base-commit: 39274b454e9993cea319f4ac342a8082a9ee1730
-- 
2.56.0.307.g5fe7bd680c-goog

