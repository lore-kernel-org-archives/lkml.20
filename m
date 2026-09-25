Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0CE3CC7FF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790314435; cv=none; b=hGBmA9C5XbNr7FCGuapfG4S33ngmnLDDp19SAoPQhkd+nFzd6ESauyJNEfzrTEoOdmL126maQ6Ryy3zdreuLG6ryh5cCqppENrdUxJPkM8TsDDwSYJhmJ0NPdLgvwUeiJS+pORfVC9T6XvHrCU6JZ3m9/VZf45dczX7eonZTHEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790314435; c=relaxed/simple;
	bh=Nq4i7Nmp/tdtJVsnvMBVbqxNXwHWcXIAAz3MkCdAHLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eUjIkPOS5NvqzB/baV7GyfYsO+Jv5elIUxXzUlinAUUjGcTzaVMshmWKuMyTxgQdIscQl9fC0KR2I9s9EW/1BynaU7vmG0TxfB7QRJXoQTKTbTBRSM+PvCOe0Bout3wjbZ9vpvQkP2kOg0VhTTeQHqqQy0RvfEZhyjHc1P2kQho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=modal.com; spf=pass smtp.mailfrom=modal.com; dkim=pass (2048-bit key) header.d=modal.com header.i=@modal.com header.b=Q17yYidT; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=modal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=modal.com header.i=@modal.com header.b="Q17yYidT"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-8807e5b8fa9so46393b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=modal.com; s=google; t=1790314434; x=1790919234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+ukOysD2I4kW758/buisnZ71NIZ/Yakkkc+BM/q/w0=;
        b=Q17yYidTf5jJss4wA+kDIeQaS/JqkmN6PNcxbpbAwKPweGH8FzviLYptkcChlREhnm
         EkSIHF+gQZlZbwhhEKn+80ABdCW/mbLH74dkS8VoXu8sCXg4a7Cy+HT+S+epLgk/C8AX
         TgV2rxO0k+YU3ySLZWJjYU+TVPDX6dyQclHReFblzA1DnZwxLwbUDR5Xqn9sd/c/cf1c
         a6DddnVPj/G4LGx4ydwW6DHu4shFpwKXdPIpPBQ8si6BoSII67+MgXXkUK+xnZBRofu4
         /ZVxcPYlbU1K2hO9Prf7Wgm68FJmxjNtgUhoA6GU9yGa7QAFzQsxPxiA8nCMSV4raAVq
         ndqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790314434; x=1790919234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+ukOysD2I4kW758/buisnZ71NIZ/Yakkkc+BM/q/w0=;
        b=QQsDiNa84CTv1C5DE2jWzSTzvOdwg0d+AGq0eAQfPRwm0c04ArJ4J8xiUiJ5bqxc4H
         JmG+PnVbThIu2+TsBSlzjmH+VLNDctHE4laWafQp7Xf3kGha88Sqz3X+KZFe7qOH8fbl
         Dyn7J2RrJpVk8069D9ZbG1yT+B3Tu1xoVJPzCE/gazBW6ckjin8AgaqpQ8trJoHAZpsc
         RNT8x2pTqh0Nu19w4QlUYvKFeql1om01hKHYke6lnfBZ66hIErqmlrK3h7i0JL5kn6Aq
         oSlEKk/rvGYjeQD/OU1+B+c35YJ0YQwi3bK5uv5G5KwOE/2IWXwsyyfZvxSb2sa7qo57
         KzcQ==
X-Forwarded-Encrypted: i=1; AKwUvBz829BXi0SfSBJxnaixkAW/aUHIbtyoj5Jk7Zu+VCwRAZMaRwid9UzGKSPaTEHCV2/a7pBlw7lTNJOrgaw=@vger.kernel.org
X-Gm-Message-State: AFuF++lBTVcl2Wgxams4IwbZL7uuuiJ0S+120S0lDcio7NpwWjjSzQA6
	iFDuupm/ZnZe3h4bJ79d0FZgD8d2bn2b3CWvhnjdKuUVtpipaisPG67zOTejJbYhkl0=
X-Gm-Gg: AYBFou2vqpwDf1YnhSsT2iiUWRvzcE8C1MxLrKsFO0tMnAYXdP5mU3nuV8jPiD339Us
	Ub59IJFTlZwvpP/Pmizou0D05x7o2KTN9rHom5BTTp8Neu/xHFnc8Bh64WCbJc23vmHvMFy5dtc
	R19MmN0bywu/QWmlRPjLVmU4MOeF9355KZpGp9VzsBSbr37XDxJXYT6b7yuw/XzoqWZhho5k6Km
	GSSAslmj8SMQ2gEUL5U6yikhkXt7MqZAnGCaElqJdz2rGU6b382Zm+G8kGk1z3Kia2SdKvk4qbx
	nOHuKhUiFsEBVlNcfChnYKLD4gfzi2yYQF+naH+EBDggI1wa0m0RBSq+oT0UYWJB7ltjgTB38ep
	mtfbDsnEvsvCC7T6NWiRPUgRmCyWIA8E10OuTH3qoGx6JR26Gr7mQM44/yi8ggZGnFjCeD9z9hO
	+PMe2EVefv90IBaM5uYxxLC6NanZZt7pVAHHyxq9GHltcSW+/KhPxbx7GNHw9lXTkha6wf6ddIT
	ownEu51Y0vBJKpS1sQ8FAu24MugHE1t9yOmfWti9aRMQvmnlpmCyrFT2MQ5zEpx1V41UGQTAV5F
	bbIUI0SEn+QhUK/VBfSKVRcGrCMltpLLn698WQ==
X-Received: by 2002:a05:6a00:6c91:b0:878:34d7:6982 with SMTP id d2e1a72fcca58-8802d04f355mr829494b3a.48.1790314433582;
        Thu, 24 Sep 2026 22:33:53 -0700 (PDT)
Received: from devbox-ayushr-01ed.tail5292b.ts.net (ec2-44-242-192-44.us-west-2.compute.amazonaws.com. [44.242.192.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea88a1a2sm509721b3a.25.2026.09.24.22.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:33:50 -0700 (PDT)
From: Ayush Ranjan <ayushr@modal.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Ayush Ranjan <ayushr@modal.com>,
	Hugh Dickins <hughd@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jan Kara <jack@suse.cz>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Gregory Price <gourry@gourry.net>,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] shmem: FALLOC_FL_PUNCH_HOLE vs fault-around race corrupts page cache / rss counters
Date: Fri, 25 Sep 2026 05:33:39 +0000
Message-ID: <20260925053340.2067567-1-ayushr@modal.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <61f8a9af-7cdc-4979-bcc0-bcc932f7301f@linux.alibaba.com>
References: <20260924061708.1645968-1-ayushr@modal.com> <arTdLsBENhrpOyk-@pedro-suse.tail5790ac.ts.net> <61f8a9af-7cdc-4979-bcc0-bcc932f7301f@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 24, 2026 at 09:30 +0000, Baolin Wang wrote:
> However, I did previously fix a race between filemap_map_pages() and
> truncation that caused incorrect folio mappings, and I believe this race
> also exists in shmem. Ayush, could you check whether that fix is present
> in your kernel?
>
> f58df566524e ("mm: filemap: fix nr_pages calculation overflow in
> filemap_map_pages()")

It is present on the UEK 6.12.0-204; its changelog lists f58df566524e
(as the CVE-2026-31648 fix), and the rss-counter imbalance still
reproduces on that kernel.

One more data point that may help: the reproducer punches with
FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE and never changes i_size
(and all faults are below i_size), so the i_size-shrink window that
commit closes should not be in play at all. That seems consistent with
your suspicion that a shmem analogue of the race remains unfixed.

> I've been trying to reproduce the issue on v7.3.0-rc1 for half an hour
> now with Ayush's reproducer, but haven't been able to trigger it.

Thank you for trying. Two things that were essential on my side, in
case either did not make it into your run:

  - the khugepaged tunables from the report (scan_sleep_millisecs=1,
    pages_to_scan=4096, max_ptes_none=511): with the default 10s scan
    interval it never reproduced for me either;

  - shmem_enabled=always, and many parallel instances on a large
    machine (nproc/3 instances on a 112-CPU box; it takes ~2-5 minutes
    to trip).

That said, I should be upfront that the reproducer has so far only
triggered the corruption on the UEK8 6.12 kernel -- not on our 6.18.46
hosts, even though the production workload hits both splat forms there
(kernel list in my reply to Pedro). So the reproducer is clearly
missing some ingredient of the production workload...

Thanks,
Ayush
