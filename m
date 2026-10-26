Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025068;
	b=uzfnSARKpAIundLO6TevrdDg/jt3Xvt9yYmhlQ0ShR5R1LNnVmDQvFDOXCDJ2vqEz/ip
	 OZPLt/tfL++Svnz7QiY39Wx8KyrUa0G7pJLI5r0uVZ5qOcr/5qPf+GCx08joeq1LlWibD
	 CtLK91uR8NRomzYTjG8hwhOaCF5N7hyjrYERLhulPQ99pCqU4At3r38jsJ8sJukJk4Apc
	 pqHbgF8kb1TyvQvKampF1Z8o0GZz0Z7EmcEAGFDUEwGYqCY68k0aRMWpAuoGoOTtjxP8h
	 pCSmXM5wz4IwsluuQCnTW24If7guNxl5yy3uTyTVc8m8qHBp7UyyI0OdPCuSIhyht7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=S2aF/nJPcL1L7k4kule6+RDBiZtzu5J4Md55u9FTmQA=;
	b=4tGYWuUAZnU2yZSCApy4cPJwCIpTnw4NWH0hf7rO2pvlb73byTYx6o/YSMDBGC3nCVLQ
	 twvsYFT5eUwapLRTGNUbr1h1JEml34gpisf9XNfqvqkoCtR+mSoj6RtSNcj/O/4l5lvvU
	 g0e6JSf+3kLi3rGswJrEnLTIdM23rbZxINu5S02G97wdVtWS1vrD3JXs0twOTe6wcXrHD
	 FE5Lkswyw90XV20lp9BpVjkFncK/ODCYUA3dy0O4p4inpASuyoiEDn9Xora1V+XPfR8TZ
	 Md7W9/NZr8L4Yb1OocoSv2N9w8USLxBCqUA6cUaA0GrlnEi6jYts+VtKaHMinN82uUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="stEoNO/V";
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB789606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB789606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=stEoNO/V
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ea7190aea1so13817875ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793025067; x=1793629867; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=S2aF/nJPcL1L7k4kule6+RDBiZtzu5J4Md55u9FTmQA=;
        b=stEoNO/Va7L3S2ug5FpXuRDzuQUh59NNi4tR/hLipjRU84Gt+KKsacKw/1TengoaIN
         voRuuIUTWcrDERER+gkc13GEdwXpTJKMGjBjmUVDMUW25QH1h+qQxKRtx0OebRFrN/fR
         kOweUfA6WqwAfiPFHG59LdUiiEW/t00efjNag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025067; x=1793629867;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2aF/nJPcL1L7k4kule6+RDBiZtzu5J4Md55u9FTmQA=;
        b=XSxtwosgWAoHKhB9FvgXeLCIIu3iSG9exGefP4wHzFSjvotGb2GODd1/rzANvafg4x
         VuETjyFCPkXxHSUuyx/Ztw+FOnYclk8oQNw1d3uahWluPDUCoNkRfMK0cPWI076QaQFo
         fdD9h4SeKgZc87PoQAjDnuTq7g2UeueUlrVblGjAqGoeprAIM+F8Jw4+4LN0SHlrXzVO
         z2E2zFOwaxZIi0e+JLJILT8L3sqhun8FFfczPAOLhWpgu56i5o33PdU+A1wjOm83YzNI
         s+J9zsDnGWRN7TF5HfqXegfLaoLcOYUymiVdtnPQ3PbrsFDsCRrsCDjCSeWfZ0ZFRZRX
         3eVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoM3HrZ8in/E7k0cchCq6wzKU+EF1KequKwJEMj73TklR+rlYfWS9LBaZvdtJOedKuIJeOlY794B7CZck=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvm5QsAEYQAw3VZrjvV6RleJrujTE4jNCUBPo/fL4ifcJeusdi
	tcW/1JKvOH2ibnMM3ZZC3oo+5y2EEULeFCsCiYdLkZRwAVm2Osa0HfeTcvhYNYnF7Jg=
X-Gm-Gg: AYBFou1P4GJMiixteFboCGY9EPP3E9HL+itrqU+ZqYEyVfwSJYx5TiJTjXqZQNZ08R+
	8ci5UK9fT04noGRVseh+ultWyoO7NN9usUH2cYeUTXGH5qkwbZdHFNibYV9JfwxAHDMWdIM859p
	hJEiaTIOLTrQZ0i2/wUXB2/zZDTR1Detz3fJd/QMThYoQm35bpmPKLLy2jaek5HLFCRxUauR1mF
	iIbKAvBWbuCkKL2X85el4qECONibp0zT5mkOYmWjMyhaSf3fedOWUkznFO+omwSkbd8CEemKlg9
	wHz7NoXnDcg6jLMmm+x4qs9DZ37hHJTharznPtCL8DKEfAAB/feJF+66VQotqzQe3qEd8u0inrl
	OOtkaRIBUc5TOwTST8aZsI91RpXv0X9ol5LnRzCe7XdIflK3o9t3avik1Yigd2BlJ359IaCRVg4
	fBje5sm0yLXSiCp61PvlA+HKD0nsylARa5nseKcYjCGANiMxyd+cMBcpLHWjTIBoJ4Ln/6QKuB8
	LkhNoMlrp6v5YYlSPX3nifAAt9oU61G3fQEGKp0xsXTmRQyGYNfizC8O5rS0ch336s2DI/E9mD4
	+40gG/d8SSLp/rVyyvXw7E21nXgbYFm4K6VfDDxCoVYkQjkWGhJYhuZaI59Jt4p1zaUXGYJ4Rl3
	0csU1/YvrZ4rQ4+yqdrqDUEc=
X-Received: by 2002:a17:902:e947:b0:2e9:4f21:91ef with SMTP id d9443c01a7336-2ea9c876333mr51977345ad.36.1793025066909;
        Mon, 26 Oct 2026 07:31:06 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af332d9sm17635845ad.11.2026.10.26.07.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:31:06 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:31:03 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>, Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Ying Huang <huang.ying.caritas@gmail.com>,
	Kelley Nielsen <kelleynnn@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, stable@vger.kernel.org
Subject: [PATCH v2] mm: Make swapoff interruptible when unusing mms/shmem
Message-ID: <at9kJwdGkHPsWwgG@chrisdown.name>
References: <ar2YlFYjYUZ49ZA5@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar2YlFYjYUZ49ZA5@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

try_to_unuse() only checks for a pending signal between mms, and
shmem_unuse() doesn't check at all. That means that once swapoff gets to
a process or a shmem file with a lot swapped out, nothing can interrupt
it until every last page of it has been read back in.

Just as one example of where this can concretely show up, freezing tasks
for suspend or hibernation has to wait for swapoff to notice the
freezer's fake signal, and gives up after freeze_timeout_msecs (20
seconds by default).

Here's a facetious example where one swaps out 2GiB of one process to a
swap file on ext4, starts swapoff, and half a second later tries to
freeze with pm_test=freezer. Writing to /sys/power/state then fails with
EBUSY and this in dmesg:

    Freezing user space processes failed after 20.003 seconds (1 tasks refusing to freeze, wq_busy=0):
    task:swapoff         state:D stack:0     pid:3175  tgid:3175  ppid:2955   task_flags:0x400100 flags:0x00000419
    Call trace:
     [...]
     io_schedule+0x44/0x70
     folio_wait_bit_common+0x1ec/0x3d0
     __folio_lock+0x24/0x40
     unuse_pte_range+0x2d0/0x348
     unuse_vma+0x158/0x248
     unuse_mm+0xfc/0x150
     try_to_unuse+0x104/0x3f8
     __do_sys_swapoff+0x220/0x5d8
     [...]

The same goes for anything else that wants swapoff to stop, like an
admin hitting ^C in a panic, of course.

Prior to commit b56a2d8af914 ("mm: rid swapoff of quadratic complexity")
try_to_unuse() was driven by find_next_to_unuse() which checks for a
signal before every entry, so let's restore that behaviour.

Just as an example of the improvements, here's how long freezing takes
in the same test while swapoff is happening on my computer:

                      before                  after
    400MiB anon       8.925s                  0.028s
    400MiB shmem      1.639s                  0.003s
    2GiB anon         failed after 20.003s    0.011s

Fixes: b56a2d8af914 ("mm: rid swapoff of quadratic complexity")
Cc: stable@vger.kernel.org
Acked-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
Changes in v2:
- Return -ERESTARTSYS at both new signal checks and at the existing
  try_to_unuse() signal exit (Baolin).
- Request stable backporting with Cc: stable@vger.kernel.org (Andrew).

 mm/shmem.c    | 4 ++++
 mm/swapfile.c | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index fadf23f9e21e..13e0786436cd 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1742,6 +1742,10 @@ static int shmem_unuse_inode(struct inode *inode, unsigned int type)
 		if (ret < 0)
 			break;
 
+		if (signal_pending(current)) {
+			ret = -ERESTARTSYS;
+			break;
+		}
 		start = indices[folio_batch_count(&fbatch) - 1];
 	} while (true);
 
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 254ce86fa923..0f72a5b23a3a 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2689,6 +2689,8 @@ static inline int unuse_pmd_range(struct vm_area_struct *vma, pud_t *pud,
 	pmd = pmd_offset(pud, addr);
 	do {
 		cond_resched();
+		if (signal_pending(current))
+			return -ERESTARTSYS;
 		next = pmd_addr_end(addr, end);
 		ret = unuse_pte_range(vma, pmd, addr, next, type);
 		if (ret)
@@ -2922,7 +2924,7 @@ static int try_to_unuse(unsigned int type)
 	if (swap_usage_in_pages(si)) {
 		if (!signal_pending(current))
 			goto retry;
-		return -EINTR;
+		return -ERESTARTSYS;
 	}
 
 success:

base-commit: 0c06cb3fccd831787a8e46c929d6c5bf6ea22652
-- 
2.54.0

