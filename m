Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349493;
	b=jn+9JIuea/iqPTZG2j4Oid8yE4KI2aRxydzZ/uHkwQv/Gkdep7PJdvhT9SSBgs563qIm
	 C+81mxIb3D8gFRUr4HhxDQFy/bkhtBJUgdJkWym5AagH6S3cx01qOtYpPyTnusIsS4x7z
	 c45yQLvYq+nrmElRptowMjeNsFozEKlCAGChIyP5Uj2jS5e/AZzVLuIRlZlZO27avFTuJ
	 JwuJ7Fhdtpmyikk+snEyAAPtY+xISa+b37QFnOPWpwDqOR8SLrX4dyjWM/fEUTwme0WXB
	 TV2c7R/HCLxDJpYMO+t7muHMHDI7QgMZINtInqQA2wrdEFHcJ+owoRVTLdP23MnjyXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ml5g8GJyiKqZW7cPKgtShDnwVwZ+S7TeGUyvRqBFqBI=;
	b=dwawTHf2UvLeFP+dAO3RAv82+w4OaZRTPRN3dcmps0IRG/1yPZH8EqN/5AwwqvkM3l+1
	 n411GyDPmbYmJFaTBOtZ2lXHmzhpQbo0Z0A8iQ0Ld3ftJtQXEE5SBrRDCq0ky22TBQ9Js
	 6BiNzGYeiw8Aqs1uaORRDeQaRa139MKgidquR3Zdo/rTesNqQLoXMcBIrchmYFmhRRj03
	 ozypVTp0AUD2oTJQ+4/7vtdjGoLc+cEEvgYlmnW4tw5FWu0ylKgS0w3RMgetGxBYvtjBW
	 NlQdAnzrAhFCEYBvogQPYxaAEwHjbAVwtexSmZG8yE1Voh+RnSLxZAinLOMXu8bLHBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=B3qLNBas;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB92606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB92606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=B3qLNBas
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd623dfe420so302368a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793349492; x=1793954292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ml5g8GJyiKqZW7cPKgtShDnwVwZ+S7TeGUyvRqBFqBI=;
        b=B3qLNBasitzf6QWVfYdSO4M4fb+3mJygu2Kl+gY3YU+aYRkjSfNxVvnwbTc3Y1MYmh
         SrNHFFRP6u2kzxV2WkRKPt9zbzjRMIwFCENvXZJEr5iJb2yyq4eNLacHh1Wob+gtM9uy
         SbRswPI2mty1hHvr+50TA7YXj8o6GoxMu+ZpgFZFbUjoHzq+uqnCw8jAimDCDM3LcXJi
         zTMWX2laLn/Zw3UlsiR7ZX2lydLN59p4udq8E+ZMZmtUOFVcJaSBpcM2upIYp1RJaq4O
         Y46Pn/FkGHCTZtrkCXyufob1K6unSqc3aA8EgpD1o5WUG1FxNrtm8KYgAx+zgnbrluK7
         2mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349492; x=1793954292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ml5g8GJyiKqZW7cPKgtShDnwVwZ+S7TeGUyvRqBFqBI=;
        b=zcfvwW5Q8HiyPBLHRp6y2vlfxd8ka1xQ3zbsQGmAuXdfQ9v7/yLoAj0wcpVsRZK5Ej
         K1yfD7IjLHgsro8QDwT+xAQ69NsRVQGvE24hXQGqvAz5Il5WHohktpRYkf/TPmZVXt++
         1Y5CDATJfPvOL4+Z+CbyrqusnBvauLE3cJhuS4Gpg8JpFTt4kqk1eMJEu5htCOl4rZvQ
         rvweguMBJqW6IjVbUFoX7+UKu8knghWhUbbPQgjKysui609LSCHj0xQ28mxw+ekMprWa
         ZnyNwe8Y/4vHpyo6OGZ4pPiEQOADoUh9ZY9kKt2yJFSeI320FMiKfpH1RSbd7gKPPaAe
         BzJA==
X-Forwarded-Encrypted: i=1; AKwUvBxkuIYyDkvlF3VEo4TBGCCd8rwyjf24Gx2/32sDMgQfzWP5/WrA/iyc+TiKCk6s5qSIHlGGBeA2adNSGQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/1YNWcJPkzzIW04Z61NkMPAtwPWYHZfEdzjhId3D5XOopJr33
	34wIaCTx2eCS5syUfuuiIKON8sEYyCR8/ylUsquNlXwzAlvkOA/3aozVtBiMrGH0MhA=
X-Gm-Gg: AYBFou0eSHglZLioCts7dEJULXRSgG2m9Gu1YpkLseHGiFfTO/wTCDlWfmKQQ2ZUQ1N
	BvCFGCppwafvuFMIpi8NMCcuw1pLURf4aCDAA9CfSt1HqCdgTnq+9LAKTsanlLtk7oOTl3vn2ls
	uA8/x8rdNt2ef6sf/1kUi9N1FAPlfN8QsjfQWAmrCmQjMbBb8CpMkd2QUOc/YY3ym0ba6ytt64z
	cq0fzlxuCh25HZMRl344xet+LHNeZ3EKUSgBcuNdp94T1AWqM7TwbLem6PMY4ErOeMupd6Ublj8
	txBOuLfa/Rt/kVAK0DAVRuhRNxTOrEuiaqDZPbFsLJULY0ZjKIIWJWhxe58hqo9V79TCUlvFazR
	YZe1fXDKprqOjZ659znYKk9GnH7dMbpNb+ngtvvbXQEFgn4VVXIxpuWWbxG1EjaqKLwVhgdefFD
	jU0DH+NusSTrGwFb08faqdtJruGxzSQx6U77X/uttRhfa+F2cL0ORtK4MdFJqDtM9JA4PRBN9X7
	h/0skoQyIO1OK8IvvEbdI67f23W4ruP3oDbEWBf1mc1L9vcX+J2IwV1J99ofLsxOlDAgQoOj9yY
	AdVyPymvCK+0pVHPypge+z5RSvJstm5ObWWGsErF8j8V4XE7DzQ=
X-Received: by 2002:a17:90b:5147:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3ae897c7c28mr1424866a91.14.1793349491405;
        Fri, 30 Oct 2026 01:38:11 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9b1506sm7542122a91.15.2026.10.30.01.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:38:10 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Alistair Popple <apopple@nvidia.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH 0/2] mm: Remove pagetable_dtor_free()
Date: Fri, 30 Oct 2026 16:37:58 +0800
Message-ID: <20261030083800.599152-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
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

This is a follow-up cleanup to the page-table teardown fixes [1].

pagetable_free() now invokes pagetable_dtor() for constructed page tables.
This makes pagetable_dtor_free() redundant and leaves explicit destructor
calls immediately before pagetable_free() duplicating lifecycle handling.

Remove pagetable_dtor_free() and convert its callers to pagetable_free(),
then remove the remaining redundant pagetable_dtor() calls. This keeps the
destructor decision in the common free path. No functional change is
intended.

[1] https://lore.kernel.org/r/20261023063428.3658761-1-songmuchun@bytedance.com

Muchun Song (2):
  mm: remove pagetable_dtor_free()
  mm: remove redundant pagetable_dtor() calls

 arch/m68k/include/asm/mcf_pgalloc.h    |  5 ++---
 arch/m68k/mm/motorola.c                |  2 +-
 arch/powerpc/mm/book3s64/mmu_context.c |  1 -
 arch/powerpc/mm/book3s64/pgtable.c     |  1 -
 arch/powerpc/mm/pgtable-frag.c         |  2 --
 arch/s390/include/asm/pgalloc.h        |  4 ----
 arch/s390/mm/pgalloc.c                 |  4 ++--
 arch/sh/mm/pgtable.c                   |  2 +-
 arch/sparc/mm/init_64.c                |  1 -
 arch/x86/mm/pat/set_memory.c           | 10 +---------
 arch/x86/mm/pgtable.c                  |  5 ++---
 include/asm-generic/pgalloc.h          | 12 ++++++------
 include/asm-generic/tlb.h              |  2 +-
 include/linux/mm.h                     |  6 ------
 14 files changed, 16 insertions(+), 41 deletions(-)


base-commit: 9c449f885765cf8d80b2c60b1971e774bba51a3f
-- 
2.54.0

