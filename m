Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ABF47F76C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522736; cv=none; b=I6Gv3W4zjlZlnqtqPUdqKOf9fJ+hba8O6cjGw8gAC+/RRSgiUz8jhCnehbbsWVwj6srF4ikS9OvUgp8Ja+V0//jFEhMLqI+hpAodpqFyuTqxN0sNUhCmCLHhmTY7yW6WGldRNq5kB7U26LBTdNSnQZl1Um1z3TXItfDUtjxjN8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522736; c=relaxed/simple;
	bh=J2jIpnwRwmawDH4c8lDRK1h7v6vJRlzFitCH/AeZlb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZbSlKX+5IH+PFUBxO6Jd/ACS/g2z/cv25U6waET7ddIcIBlJ104sE9hZd67WjnVPfebUhctkfwfpQSj95Apfeh9lYfhs2ZKGPGeLjW1EqZ5e+b4g4v9Ks5unlsj47GxHJgf9TMEi+BHuqVuRBCvpHyOMG8YrHftTfyzlz4/qqsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjg54Kl4; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjg54Kl4"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d9db539a54so7988075ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522733; x=1789127533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLeMeXb2KNYqnZ18JT+L0ExYRqspXMX6i+NVk7wx/RY=;
        b=Yjg54Kl4Gq5Ymi+85zj+dPOUs2hdAIkaZkWFPAZ5sPEeOVi5vm3D0YNjM1IzOYnNXG
         mU9Okvcl2WrkVeUYcIw91UTjJe0no++U2BrZZ0UVZVSqxD0ctTL0LGuOdtD/fk1wUxJI
         oW+ES2wpmQ71Darc6WMTcxMBkjmB+RtfmZUtGVPQlLen9YDRVBqjHIWRkDh7dktzuYap
         Z8hzZZAkgGGaiPFSS1qt5C0oBsedevxjw03aui7eMEGJkuTAbepHm1+w/mn4NxD0lCMi
         8D49ss3lnxnQJ95sgQs9rDH+Fl9jfEooWiOIKpqI8hGR9+okHqEseGjyQ/CODg0nPNM3
         vOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522733; x=1789127533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLeMeXb2KNYqnZ18JT+L0ExYRqspXMX6i+NVk7wx/RY=;
        b=j0xkUHfhh1zV7r2iFwlNrDrpk10FgVF0GkTrps6q8t41ivDfDMgYjdUUUdQbMFHwBN
         BZ0LWek/1qHUD6UDRbRWKbBZVJZZwsREv6Gf+1bpypzjQYTbVGZqd/qONGrlZds7wE1M
         fI7zIIh4n/E2BcGAsG+wudZKJI5/OyChgiPhQuadzx5cfrDFaQTQ5yEAGqLej3Vfwxkv
         YuLNk7pdhkL8TrquQ/uSnXhl5kDYmlKg0rxBahWL8B/k2ZRsCakSdl8hdsDZBFYvJe3W
         rTlPZEm+LhgTJCclefqmTcnBAnAgO5sxo7Y4vBgGJ5wMVfd8woXsJcsv8p3GPDCYkB66
         5RbQ==
X-Gm-Message-State: AFuF++lO9o8RFhaHitdrW6ZUsyTDv2XsU7SYlUyxm2r7AnxUH07jhYVY
	S2GKaBUqI8biKeUMj0LZ4QX4cGEjeqgNg58/ZxFe1WtMk0mxXRrtn/9pGW2Wt/Gj+ZU=
X-Gm-Gg: AYBFou0VerAiStieNicKX1Zcl4qGHnNi715IEHX/pPG18eOnJDAfW6dnWUmSjPfSjMU
	KaFw0t6CCEp02TgpoS6iwTkjfiNwtruy9XkHsJvwdtK/ZMvEvRorTWy4Ltqiv2gCP3o46M0HbWs
	8ZEE6BzDBSF3l7UL/wgbnlJ9OWAVwd6LQ5L3o5sVsFKL8bypxqep4xesTX+BzxgcIDayh3W+486
	j9fFdVSbxJxWdzFBW31Z9awYSeqldFXCL8Bh9NMM9jfZ0Ome8Ii8WO6qr+KpBdurpVbY0wgAkmu
	VaTf31qtBmR6S3O9snK7gx71pv9c0v7nQXclO4MhXI6KAskUXsOQfVongLPvSLGqaQAfZKL3nqv
	eRQgdSBPmMtvVSRCG+wULqir9MGk0TaiqnobopN34cS1c7KdzAq0nRwepWOAlP6V6g/KLz25iw1
	kx7rWRnaZEoLjq95DsEv0UKEYV07R2FlIWo2YKR3QRWE+m4SUGGhi9s0rbp49xrsaryStTS61wD
	Q7VkGNRiDHnRLc=
X-Received: by 2002:a17:90b:17cd:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-39b26272b4dmr7443008a91.13.1788522733237;
        Fri, 04 Sep 2026 04:52:13 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm6162943c88.13.2026.09.04.04.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:52:12 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>
Cc: linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org
Subject: [PATCH 2/2] btrfs: fix repeated words in comments
Date: Fri,  4 Sep 2026 17:22:00 +0530
Message-ID: <20260904115202.7113-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904115202.7113-1-hemanth.selam@gmail.com>
References: <20260904115202.7113-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/btrfs/raid56.c               | 4 ++--
 include/uapi/linux/btrfs_tree.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/btrfs/raid56.c b/fs/btrfs/raid56.c
index 1ee52a9dcee3..577412b7886f 100644
--- a/fs/btrfs/raid56.c
+++ b/fs/btrfs/raid56.c
@@ -953,7 +953,7 @@ static void rbio_orig_end_io(struct btrfs_raid_bio *rbio, blk_status_t status)
 
 	/*
 	 * Clear the data bitmap, as the rbio may be cached for later usage.
-	 * do this before before unlock_stripe() so there will be no new bio
+	 * do this before unlock_stripe() so there will be no new bio
 	 * for this bio.
 	 */
 	bitmap_clear(&rbio->dbitmap, 0, rbio->stripe_nsectors);
@@ -1451,7 +1451,7 @@ static int rmw_assemble_write_bios(struct btrfs_raid_bio *rbio,
 	ASSERT(bitmap_weight(&rbio->dbitmap, rbio->stripe_nsectors));
 
 	/*
-	 * Reset errors, as we may have errors inherited from from degraded
+	 * Reset errors, as we may have errors inherited from degraded
 	 * write.
 	 */
 	bitmap_clear(rbio->error_bitmap, 0, rbio->nr_sectors);
diff --git a/include/uapi/linux/btrfs_tree.h b/include/uapi/linux/btrfs_tree.h
index 127aabd88639..81883beb3b7d 100644
--- a/include/uapi/linux/btrfs_tree.h
+++ b/include/uapi/linux/btrfs_tree.h
@@ -230,7 +230,7 @@
  *
  * Stored as an inline ref rather to avoid wasting space on a separate item on
  * top of the existing extent item. However, unlike the other inline refs,
- * there is one one owner ref per extent rather than one per extent.
+ * there is one owner ref per extent rather than one per extent.
  *
  * Because of this, it goes at the front of the list of inline refs, and thus
  * must have a lower type value than any other inline ref type (to satisfy the
-- 
2.48.1

