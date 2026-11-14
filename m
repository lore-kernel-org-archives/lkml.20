Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667969;
	b=W/iPCKX9kYM/FNt1sEGFLneH5WzScux6QinmCizpYV5gT22ngCwX0sOobNHDFByXsh3B
	 U0Z7VOmSN6QgB+7EFxyi+4ylZutUbS1tG27hLOd7xj8ZO5oDPQJRjKUMNXcTnlBlEnTpF
	 VRwY15iJh+ZYYSLiy8jVPLs8HgBoShnFEhRPAY3AizCwsLM05XBZlWzugGpOWY1ted1yI
	 B5ZYYZzD+ogD6+bdAD6zEf0n5bLpv0LM726KC7QY0g20xe4Es2bIFH1PEK8DYJ7s9SEPZ
	 jCo7aRSBYbMUAe7m8W8EKZMzTHycqI+ZSeOi1u+c2pG2dXZdttln32G5x3FD7vEimow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tm/6Ewx7tmmRUl0t+lzW1rhB1ymVzZpDphuMopZREW4=;
	b=Tb5PFbwZFD8Ma8mjobW0yoepPZojjvDugIQXQOJpu8K7e0jR30jgcIEXuuHeO2z/bTWs
	 0MsV64lWNrzLOldnuTlX41ET/D7LHbj3np6SY5tNDMfX5tv5PKPgalm6f/f1MPdJ9IX5B
	 aR5ijGg6RYuUWT1pNW/syocF4Ti+sPZyLpxeUVRsfPQGYubzEUKzUSKyJU5bNdbI/CR1X
	 D+22tAAvNalVAbPf0BG2oyKmmpz5VQiB6l7q7UYpREt21IlvL9sdlRh/wikENyfYInbO8
	 LJ5uaMmDmBdKQJM9ClTg/rBoNQqoZsxkcZMu7hZa1LY7/mtyvWdvBljo8S62TU+g3kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=saV9kE34;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14512606A889
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14512606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=saV9kE34
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed2bfe3252so7079365ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667968; x=1795272768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tm/6Ewx7tmmRUl0t+lzW1rhB1ymVzZpDphuMopZREW4=;
        b=saV9kE34Lmn7ne+De0v8m/auVw+yyZwGOV/VEw/BC5+FKPo+Prxrsk8UrgJ3a4lYJ2
         bb3KVJR8e4caOiJgDyw+bIZQrGcq7tPSeGRKAmijjTx4xunoyANvRLm8R7QY+mb4HoK/
         lJOVqI1x4yMGX7bFLihWRniStj2q8C4M/g9NOP4IdFrBK3R3bBvkV/wmiJW7hdkXH76P
         qwQf16Y3C3sFRPo2eh9JDATqueqItO8ke7/o5gbmnb2SRd6+IOxUexEUBgT/jkJAyTQM
         GlG/DkWQrMnl/r06WBYLe6XzRu14tz8tOdpAyepYe5VBPI3SiMgNvLw+NLCYD6rJP1/H
         sFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667968; x=1795272768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tm/6Ewx7tmmRUl0t+lzW1rhB1ymVzZpDphuMopZREW4=;
        b=VrJBS2s0r9QnkgFF6JDqJ20zE9Yq1J8FGc4VwRkTkarCSfprC4sBF2H+gQsLfBetl9
         7myEIOyoBgzJTrM0T2GSfWBNIejl9nNRlpe/Xksh0cjBfQc7NLG60M2XkiTanMdHat0w
         mrcosgIQ0hKfN/RIqR8LYK+E4vAbU6Wz1iXJFAlvfO1DyRqYiWKaxWneP3VJ1s3rKIBG
         n1lvwzH2F5ISmOs96kpoc66mMPb2/CTaYYJlAunHVZ0AeHcJyApjf0ux1AXJSTvAJ7tz
         3/QR1ZzcKN2uYaAncGNhkPKZ4UclfLyFe2Ox4hJSpwZ7wOzKnUndsvl9H8s52/G0daOH
         2/XQ==
X-Gm-Message-State: APuU4Z9Dgk1NmPRSOg1i2HHenYMyoXYMUQlBpTdEvVyPdg5thSHpdDPd
	OSt6Rsr9rmujuXeGEWkLQdZE2N1eVGK+837TxM9smgu5hFN9O5/Pst+a
X-Gm-Gg: AYBFou3LmKcI2OOZIXQlPfY+2fDcwCBAoOTXfdMosCyKotTP5r5+RUYMPVtN3yHxJO1
	YIde67k5L5WxYmy7mC1NJWmFrWLeUAwSkfsVdm720m4EPqiBOoi+CESP4uQBlIliyQLfGGMccGH
	CzKF5CJJ8oN7JLwbdXA+py+w64G4xVCuNrIPEGN0xtqOJYQawOr27xX3pezQ45Wn5uC15cq85aY
	IO0/YJM5ucaADkM9XjFvg2oAQ48AJocxyMVtoq1AUp2UUzNJ2uOm+/nXJS6Xj3kcIoGnpUdyyIY
	5+T/kZrS9j6kum4OTuU/2YyEm+Ds0q93p1P29zY19xQA9WbmwoIt0yarihgcGOec9uat/1unawQ
	xRkZk+hU1aBVEuzWua8NlgNBzw0aN/Z1yMPj8Bz/pDlLjpZ4Rb0hGPJgzUROrGDxNXuXvZ+bxo8
	HDAuSwhvRg5IHitNx/0vc1dD4tMwyOtDdGL0nj4B3/9+MHNNByhbetJ7XkJzCJmhGRmcxdH+5ka
	1UuryDvyYBwd//uZQl/LK8+SklZfXg/13aBuRA7Kthpfln8OXQSAp+tvNeyP2txhPe4iOUogSr+
	q5DWUGmK5SIe1SXElBL3UgqlZTRGV7EsOS9MUs7vDiyVi1/xOM0Wyp0s8dUYm0MAx/pD
X-Received: by 2002:a17:903:1b2d:b0:2e9:8e0a:cc4d with SMTP id d9443c01a7336-2ee0dee4092mr53566845ad.41.1794667968394;
        Sat, 14 Nov 2026 06:52:48 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8623c7sm21620975ad.42.2026.11.14.06.52.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:52:47 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v4 17/18] mm/swap: skip reader rotation for single-device priority rings
Date: Sat, 14 Nov 2026 22:52:37 +0800
Message-ID: <799821479a3c820a041d0765fbb70a75598e641f.1794666741.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794666741.git.lianux.mm@gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com>
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

A priority ring with one device cannot benefit from rotating its starting
offset or maintaining a quota. Read its only entry directly while the
caller continues to hold the topology read lock and migration protection.

Consume the cursor attempt and check the full/disabled pointer tag through
the common path. A masked singleton therefore terminates or falls through
with the same bounded behavior as a multi-device ring. Keep the existing
large-folio same-priority failure boundary.

This removes reader-local state updates for the common single-device case
without bypassing device lifetime or availability checks.

Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 616339c5ae5b..0c192844b121 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -334,6 +334,11 @@ swap_queue_get_device(long nr_alloc, struct swap_queue_cursor *cursor)
 
 	/* Consume masked peers too, so every walk remains bounded. */
 	nr_iter = cursor->nr_iter++;
+	if (ring->size == 1) {
+		si = READ_ONCE(ring->dev[0]);
+		goto check_device;
+	}
+
 	local_lock(&swap_queue_readers->lock);
 	ri = this_cpu_ptr(&swap_queue_readers->ri[queue_idx]);
 	/*
@@ -363,6 +368,7 @@ swap_queue_get_device(long nr_alloc, struct swap_queue_cursor *cursor)
 	si = READ_ONCE(ring->dev[dev_idx]);
 	local_unlock(&swap_queue_readers->lock);
 
+check_device:
 	if (swap_device_masked(si))
 		return ERR_PTR(-EBUSY);
 
