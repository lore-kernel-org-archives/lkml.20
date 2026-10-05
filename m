Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A63144F563
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195730; cv=none; b=PK4aznFN/VhC4/EMvEr6mrn5xtnY41d9wmcwOXOZCNqbmfm8g216KHEYyZU3/rem40kFof1JxoUDQyJjVOnlg0t+ZqUZG5b7zPQsUWESHlpQkG229SF52sYRP9UjYPdXt0gpU4ZjQLHGKEdT8B6WAOKgsHGcnjR1+ic3tKhafHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195730; c=relaxed/simple;
	bh=JNGa8E+AuDcICcHu4F+c3O719QtLHq9LkWm3dT4PIfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=br2MoCw2JuILnq7HG6G21LpJyMdTmaPSr/QxMsIfLW4EA7I132Z5Ogzc6aQunRoX1ZAYq6UA49Yr1zd6OviQliyp8cHeAgEDM5mxqnuYWadiqsrztgQqrsavwK/RuRkHR9uqRzlN6F96Ck9v+GhgXQMVA9E0AOmDfK3Wx8389v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAEn3WCq; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAEn3WCq"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3115c4451c8so1038172eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791195728; x=1791800528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b8O5+ToR28xo5Jv79QYGMGkDtxfArHOxxj72ik6dsYs=;
        b=rAEn3WCqDsmXbqhqB6Q2zTrkoiE0yp2LexFDrcQg8yaT9SeovzuW5CboHmO3X1CbjP
         V8XLIkgpJ6r4wCQmusVpYuUst7crpqhACH88Ohm1JJhide/XuCt7zC1Xm/cPpqoSL7q6
         fsxtOLx4fwTFiqkgSJmHsGDhWEqXOiLtdlyRel2EydgsrbeBEVFikruKhDx8nJf8XxpW
         M6qqGJzUPrC9aim8VgH4N+k0t8QYVZAWRLHyczSaI8XWGjal6HQVs2dkwoU96zoD/5AF
         Fz9Xw9JXl+u1e02wGgLzXrliN82j4d2dXF+2NnT071tsbQt4c3UIMAC8rGlv2ii/LvNw
         tJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791195728; x=1791800528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b8O5+ToR28xo5Jv79QYGMGkDtxfArHOxxj72ik6dsYs=;
        b=smtSygKWJhR6FqWEwR1984jPFlyczwT08ws7vchkAZt+wDJbnEbaeUhO/TxV/fByCR
         HnCnt6dS7BL2huN19ePq5Tf1hjFV37IPVm6PmqhQ47XmOPcOPlJr/ypGCb2kmlwx8ptw
         HImcp8Vu/cQXOiA7PZI8UBMNMWYlMtO6n1sw6E3Wl5W0AhETQhxjkpHuoW+JoiBNhF/+
         5WVty2FsAc69n8dwEfQUUI0A05C9Nn5XZ7u/4j/FYGGCvYwPO2plXyFTuqNe8Y4wRjRU
         dLJcwfeMemxbL/1Pg6G3O6Mw+Plg0t3ad4zf0UDzYWIm7AMLp3SBdxmh9cIQElQBov1S
         nNNg==
X-Forwarded-Encrypted: i=1; AKwUvBxBz1MITAFzMRcrqu+DaeNAPvKR85kKAKOS9KQ99QJ+59RYqa5SGBEEJCBzo4+KSsoo5SEPAEgYP40XYig=@vger.kernel.org
X-Gm-Message-State: AFuF++mcMvzRTBBAw81OXhDBW+au89maS8SrCnmBZnPFoALFO9d2zsNb
	eXqJM9stF1te4VVTHtaSo5Fh14jnA/kCMuapJjSlgmA3OlrzyMv1v+5N
X-Gm-Gg: AYBFou3LZ/6eZd/oGhikvaXwP8mhyC7+5Aw5CVjzCIxM4s08/bWb3HkPsGDeVDP+69Z
	GW2FwRXgJsk883JUBacIoen4mMHjYnxS9AWerFAYU98KmpEEpDNabNXGDcoixNjYOu5QFujRGEP
	u1vD+rIReKyd9JRNdjXsR1tEW3ASWoHOO9veLSdAACuWDlfRa8wsP4+ILuzoEToIdPvUaGMxWkg
	veQdywiGkVAkmmeDI9PdJKIAVPDJOdOira6Kq3jmkNTTMOLt11zuQaEhnUgcLSrJ8GV2AZoKmV1
	fW3/3WSrwrrv6mIJnD55FhKmq4iH+fBIvk9UL7WfNVErQLLTVlzG2iJC6ByKmMtaA1n5vYZU2tj
	tlYfWDonAQHfErQWlgzK+0uEGKnBC0Th1jCwZzhENBfydFe52WJhyIOTegPqoE1gUYqKqNMpIWe
	4OLZnqcBSK82zxkbvAkcOA3YLNqNgLBoX479mFjVsQwPbcThSeZ3Tb5y2gvP2S7oS5taK/qWNNe
	hfo0CbnCecG50Kwfw2eRho=
X-Received: by 2002:a05:7300:d08a:b0:339:851c:4c1 with SMTP id 5a478bee46e88-34db6bfe0e0mr15476783eec.18.1791195727818;
        Mon, 05 Oct 2026 03:22:07 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.132.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512713861fsm12863695eec.10.2026.10.05.03.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:22:07 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+342762971f666337474e@syzkaller.appspotmail.com
Subject: [PATCH] x86/mtrr: allocate the cache map before taking mtrr_mutex
Date: Mon,  5 Oct 2026 15:51:52 +0530
Message-ID: <20261005102152.368-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtrr_copy_map() does a GFP_KERNEL allocation with mtrr_mutex held.
It runs once at boot from mtrr_init_finalize(), but lockdep keeps
the mtrr_mutex -> fs_reclaim dependency it records there for the
life of the system. Once another path gives lockdep the rest of a
cycle back to a lock held around mtrr_mutex, the next MTRR ioctl
reports a circular dependency. syzbot found this through nbd, which
takes cpu_hotplug_lock (via sk_set_memalloc() -> static_key_slow_inc())
under its tx_lock, while mtrr_del_page() takes mtrr_mutex under
cpu_hotplug_lock:

  WARNING: possible circular locking dependency detected
  syz.9.5848/21744 is trying to acquire lock:
   (mtrr_mutex), at: mtrr_del_page arch/x86/kernel/cpu/mtrr/mtrr.c:408
  but task is already holding lock:
   (cpu_hotplug_lock), at: mtrr_del_page arch/x86/kernel/cpu/mtrr/mtrr.c:407
  -> #1 (fs_reclaim):
         fs_reclaim_acquire
         might_alloc
         slab_pre_alloc_hook
         __kmalloc_noprof
         mtrr_copy_map arch/x86/kernel/cpu/mtrr/generic.c:413
         mtrr_init_finalize arch/x86/kernel/cpu/mtrr/mtrr.c:618
  Chain exists of:
    mtrr_mutex --> &nsock->tx_lock --> cpu_hotplug_lock

The allocation does not need the mutex; only publishing the new map
does. Allocate first and take mtrr_mutex just to copy the boot-time
entries and switch cache_map over. On allocation failure cache_map is
now set to NULL explicitly rather than by the failed assignment, so
the behaviour is unchanged and cache_map still never points at the
__initdata array after init.

Fixes: 061b984aab58 ("x86/mtrr: Construct a memory map with cache modes")
Reported-by: syzbot+342762971f666337474e@syzkaller.appspotmail.com
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
Built with W=1 only. syzbot has no reproducer for this report, so the
fix has not been runtime-tested.

 arch/x86/kernel/cpu/mtrr/generic.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index 67cf69f24b00..430bc9dd6f20 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -402,20 +402,25 @@ void __init mtrr_build_map(void)
 void __init mtrr_copy_map(void)
 {
 	unsigned int new_size = get_cache_map_size();
+	struct cache_map *new_map;
 
 	if (!mtrr_state.enabled || !new_size) {
 		cache_map = NULL;
 		return;
 	}
 
+	/* Allocate before taking mtrr_mutex, the allocation may reclaim. */
+	new_map = kzalloc_objs(*new_map, new_size);
+
 	mutex_lock(&mtrr_mutex);
 
-	cache_map = kzalloc_objs(*cache_map, new_size);
-	if (cache_map) {
-		memmove(cache_map, init_cache_map,
-			cache_map_n * sizeof(*cache_map));
+	if (new_map) {
+		memmove(new_map, init_cache_map,
+			cache_map_n * sizeof(*new_map));
+		cache_map = new_map;
 		cache_map_size = new_size;
 	} else {
+		cache_map = NULL;
 		mtrr_state.enabled = 0;
 		pr_err("MTRRs disabled due to allocation failure for lookup map.\n");
 	}
-- 
2.55.0.windows.5

