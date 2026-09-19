Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D951F281503
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789802694; cv=none; b=JMrqTWEkLGAVjfgfnLQEpDgkbXevSZ7J06wSPfw5mIQKF0R8CZOHxwdhyBgheqgfcXcyNlB67FxtkFIRk1anP34vFuAKxFJK2CTuYN4JGYZ3OiWbkUrgLoOLJ590ddH56SpIg5Qh4oqvZrvrrn8BjR+Y4Dyu1L2Q87wTiGzmwiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789802694; c=relaxed/simple;
	bh=QfKdEkms96+QNG5ZIMZeNtPBTMWisJBPBVANMBJcQKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mbb8XAxKSr9nFHYTT+9mcCrpS6pVSpE+RopsVdoSL0ofB4FZuv4+2SszkpYipBLuyWDVRn+kzC004cflSyTl8FAkY+eHFy/tHyVGXap8yPmuTF3BDzFIv7Kpungxb/HOv3wpTl5mCtGwIo3WXacSgE/oJ8AcLtgGSkO6CxThQcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klO/KrvN; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klO/KrvN"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso1582872a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789802692; x=1790407492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MiPpyhYUHVGgWlDeIMWaxS+8sb4pPZWGuCdQapYVZwk=;
        b=klO/KrvNxDOl7R676bnMkEDGyYZwBusp/1BPqBjUeeBgqN12V7tzzgBYOG0Ge6i9tY
         1LHb4WWbkjQRDCQzlyTUZkVcU1oETU8t3J5Rk7ga8I+/zPy2GIjguOTCyg20em+BLQzA
         hYFQs0xuIZSj3otsPde/NWsJUav1QFIeMvRsmSZWxrF8QJnz83vFYcWrOgjOms+VCQXp
         dDaZ6cNDzti5ntWIhLTQttbz+XvXfzguIBcCwq9gWsza+11WT2ixL4MGv0dA7SDVV6f8
         AZHlcIN97vfNnvvQlrvcCHlBK9qMtn0hzgUAjUocosjLjtDxCDL8SZdUUfxVbDsCWFHb
         WTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789802692; x=1790407492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MiPpyhYUHVGgWlDeIMWaxS+8sb4pPZWGuCdQapYVZwk=;
        b=1FJDC6YbIQNGXsMRW3A0ahQeTB4FSOzIFQMiAw+i4t+RoQNfcJ/kZQuDhM3Q9S175C
         97oY5zOFUhWQVj+ylm8egQms+njSWFRVFb+u2Mds4FjKJTC7+n82nj/eU6ba4yNa/K4l
         mwsLtEoUFgkkSRYezu/LYJpTeVIXxpwUSM44G+iV7D3qVJR5wIeYSnqc/rfUJUbeFgoo
         5FeZpOZ/AIg/0iK+IFF//kaSyrL1vQ7ZK4EV683G6sFypHIkppcjZCyktzEEebTQXvfy
         x4/VtCj+UI6Val9IQVxeK9IRmi0GrZgBvTLqPeYUOrjsupwobsw63RA2uYVmxaWbecr+
         HBpg==
X-Forwarded-Encrypted: i=1; AKwUvBwEKRbwoiEemAgGSRqMzBsDcJd/56yI7DvUoi4DNmZmR3g3NMUIfSNRmlRKV4aeih00chFvOVOnCsD5w0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nEqLcP6L8/35RQBNcYDNPgqGFmZ5VdKyzMsU0QETKlxpsdLFib
	+HiB5B2n7+NGXVKQ4dhyCuI2GMFtZmaTXVhiAItlGWk85OVArGJ8L5gY
X-Gm-Gg: AYBFou0F1qISsK26HjQL3E6egoaVZ6FfVFW4wfYUZF/HflJQhQaXQ+BdVDAORe17N7x
	rjv5gEzWTpC+0dOHBfq9WC8Mgb86n5rdPBWEnm1L5Z60rB1miWwipL4h7bt13lqxo2bJD6DSMeS
	JlpfQawWHMFxTp7KFRnOiXcvyIRekhgjj5V3xIYWjbf3W+SOiCV+jNHDlAwv5NEDnzBXX4FOs9+
	9gebEZzofPkLUMAg/64UOSWjfH/DFGiHWBRnMZ1QxaB2wJuty3LPUOlTtVxBF57PTgxusuTsupK
	wNEFlZnHNN1kHFtR2nuP8jUE5p6tpoYe5TD807amaj+xeUQZKWZcy13rQYgJXxEGDP/Gu2k4yLL
	0yantvO9/3ygZ6DmMw4S0FbRmbX11YgPyanDNrPajMeBV2HMXsPeezu8LPtOkjUlkFV4mzDf3HG
	YaHk5YiywMlHtFNP/s0fQqFCLobO2PnrunPCRfoFSjDW/uQU8tiq2VD8ssdsrGaYmQ1qJxVSOCH
	Ixp369ZWeV5ehiKmhr52Mx7oawsKRzWa0d7LqRlR52gfr/bwCMQ7YbZeM55elV4WErpGiX0L18f
	XzotOPib6NtkEGPV3jeL1Cl6XA==
X-Received: by 2002:a17:90b:5705:b0:39e:2faa:2e83 with SMTP id 98e67ed59e1d1-39e54d1e044mr9225583a91.10.1789802691950;
        Sat, 19 Sep 2026 00:24:51 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-198-121.dynamic-ip.hinet.net. [36.232.198.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cae997csm3150642a91.11.2026.09.19.00.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 00:24:51 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: Barry Song <baohua@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/memory: reuse the whole exclusive large folio on a write fault
Date: Sat, 19 Sep 2026 15:24:45 +0800
Message-ID: <20260919072445.542-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAGsJ_4wTYLds56=iyra5FKmgnNACN9QKJH-XJ=q62G7fMvd9iA@mail.gmail.com>
References: <CAGsJ_4wTYLds56=iyra5FKmgnNACN9QKJH-XJ=q62G7fMvd9iA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 19 Sep 2026 07:48:00 +0800, Barry Song wrote:
> I'm fine with your follow-up work, but I'd appreciate it if you could
> mention the previous work and include the link in your changelog, along
> with an explanation of how you address David's concerns.

Will do in v2.

> I think a major concern is that we may spend too much time scanning
> PTEs to determine whether we can batch them. If we don't support
> CONT-PTE, we may simply scan fewer PTEs; if we do support CONT-PTE, we
> may end up scanning more PTEs. So we need to show that the scanning
> cost is controlled and explain how it is bounded.

The walk stays within the folio, the VMA and the page table, so it
touches at most the PTEs that map this folio in this page table: 16
for a 64K folio, PTRS_PER_PTE (512 with 4K pages) at the most.  Each
PTE is read once by folio_pte_batch_flags(), the same scan fork() and
mprotect() already run over these PTEs.

Measured, that is 14-20 ns per PTE.  For 512 PTEs the fault takes
10 us, 1 us of it the scan, the rest marking the pages exclusive and
writing the PTEs.  Those are PTEs that would otherwise each take a
420 ns fault.  The pattern where the work is wasted, one store per
folio, is the one the description gives the numbers for.

> I also personally feel that both the changelog and the code are too
> long to read. Could we somehow split the changes into smaller pieces
> and describe how each of those concerns is addressed at a finer
> granularity?

Yes, and sorry for the wall of text.  v2 is two patches: 1/2 handles
an aligned block of 16 PTEs, the contpte-sized version David was fine
with in 2024; 2/2 lifts that to the folio.  Each has its own numbers,
the earlier discussion is linked, and the changelogs are cut to what
is needed to judge the change.
