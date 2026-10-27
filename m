Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793096590;
	b=SoE7s3iry/Sj6qTncXn02/IOlrfWoEplpOD3h/6/MCF3ZJUyFSQCPHIbEn59LQ1bnyyJ
	 XrfhbIqzOs9ElJ1Ys4xFUtyBotnN80FWPpuSWK4PqtDqG1pPhi8LUsF1tovW75SIUFikw
	 RCv2XLDIWD8PRy1TCzYmLzVZGlmFJjxQaslABAkPoM3Eav7rwkCwwL8cGgpalYPQcaPSe
	 F5rdcKMOSW6babMtrqW1fZNO7DkIiPIUnOMNiQOfKl3gAw5gJcckPdLZ4RLcnkQdajDHO
	 FNTySOUZPckYtZyPOuGrcEQBmmHTlShWfoWW0la4zwhe9mYAQwLh6uzECAnRYBGIb3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HuWBfUhRw2eXbrJVRrdIsgOVF/qwEOWqwz0sZ/JDeUA=;
	b=V80WuMVb5an/VJhsxtEND5FLO9plb0zrr0/Mx0vA8IIifCOzZQawyf+NJk52rkVVNVPU
	 UoAGhMN9qroKjH+qSWQF8FFxw+BUS7M8AEjO2s7FhoIm7yc8utLkP9qTTR1mZnAvlvX5f
	 FCvrQ1NHQbfXtjVF/YNvREofxuOUoAkb0qr6PUKaERblyLYZ1agfx1dgE8vSL5PmPxQJM
	 Y8A9Om3FsMWTjmdZha8tKO4uYuauD+/2srRRXGcgfJKsLZ009Ep0Jw9dTpCrzyxpzOOny
	 TghfDvMv64VI6IgSduKw9HYpGdYcskvQ18xUj67JWW3C2/hgKouRuq/AkO2CyOlS0hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rlxPCoS9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C338E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C338E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rlxPCoS9
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c34bff61551so580855966b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:23:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793096588; cv=none;
        d=google.com; s=arc-20260327;
        b=iBcOrzF+DdUlDHovIaOr1c5epPklSLFezCOCmmWFeZaAWhyhsLeOGN009GkQ2PC8KF
         pD1TJb/qeFLDEqBq6aHYjzipeFZySzDKQJKgMXzjFv2sIeBs2exQiItYKFMGa8p4uXx7
         /ZJbPFznAPCNFbeTDExVEEZlB4JEBSrwEUNUhtGHlqhzCPflTCPWG0nLGc1pLi8df8u2
         pNj+kGMiBomKZF+SPWem5GAqJ/WN90WP8Pnltf8Q8WcJM+tYs1tLtJeW0Z4iXMupz/wY
         DF/QoeStUEkcvlzTiNGqDAgkxDFqBElX3TmVchb2KQYbCO5lBABr+L0o2MwsU/EucWxS
         vXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HuWBfUhRw2eXbrJVRrdIsgOVF/qwEOWqwz0sZ/JDeUA=;
        fh=P8vYswim4/Z1XxBR4njUhPDBLJqWz7pbvmDGb+Y9QIQ=;
        b=KBQDDDtwSUgPPfdWza8j9BmLLHsQiuViA8+uzZ7U0iFKF8US6V0ayH0Bume1CxjrT7
         sMtfwlFOOWcCbGF/Ef0w9Mb2uU/41InaPLCCLRvJp4jWcFb/7cIsMsAoDQCx7yTZ/pRE
         H69tNawqjvGjiAzg+bgkBQrXJ0KYZOtAU48KqF4NYcmc/ub0SwJqLVI6e6JSm1BYsfV6
         mJmgnGxCZvk9CTZc2athTkfxpCzchrRQoXbSgCJtJUySWAggyfBF3YfQ+4QICbOWgaru
         PrEvgXQ1fcEBNSm+8clr6V2gRT/jAhoBdUrrK25iFRReV2T5g+fPThpvPRNdBx/f6pri
         VhDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793096588; x=1793701388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HuWBfUhRw2eXbrJVRrdIsgOVF/qwEOWqwz0sZ/JDeUA=;
        b=rlxPCoS9TacJB5sbR4/DuCvg1gHofa48v4RHRIbBlyZQUhw6r7bL6zg7MUtgoZBxKQ
         lt+YYPbrvQtc79S9rfvuPcGOb7C0BZY3qgF3U0I/tVnJgBGJx6xt/DMQpY30uai4QsoX
         P5Z/pcj6R7IGmpyEZjIkQ8RE3etZC17RDFgvcM6Y+9bhDyYYZoMMp/cQ3dx0FSoFEG3E
         yCnpC60BmhPOCYYuljKb2FIw3gC9JotwIBxNU1pFqurxlv0c49doWeUpfGKBEj/1fv6d
         Iu3zIa2GIe2Vu2FDkwEINlHF1PCgOTqXmfejtN27WWbwQvMYwFzZDiaJKRXsAeQtFbxn
         7XPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096588; x=1793701388;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuWBfUhRw2eXbrJVRrdIsgOVF/qwEOWqwz0sZ/JDeUA=;
        b=OGaFkeNtpUh80eRhSkYM/b1n2KgE8TKSJBw0IPwzCCvamF03QgIAZz3FRVdMzM/+Nb
         ZLa9uETxL8q+nh9QxiWA9KvClQ/eEDH43CJLxsutVJM9jiGrQj9VDPbcapTilfLm9ebF
         vXF9NHPaAEgbJJcVSf4U0BAa03eQg4xHLP9L1BAiSCl4hmTNYs8REml91aKBgHsr4hH4
         9SgNwZQzeqK2AIb9uWGuOQ7xZaUyTTKv893TXGKYNSNjGNcwDhS52dJyZpX/kjG9G/pJ
         j7P5tWbaerll30pRZ0ZdcTbmvpMzfsKMsujNhUV4ELxuVeP7W8P+WqgHNRq27i4SO98o
         pBTg==
X-Forwarded-Encrypted: i=1; AKwUvBwExVENfPI6JfwsQw0Df7idLQcDsuneMhywcEgtkT1xr9BKFMW7JTUukKQmdvdPFYswuEhuPBz29MeQMN8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA9qAk5NAeAggolNPKiNvq0mtfCffHPZJM3co7GPj/yB5hMog8
	NSLyYy/bpZN3UN8IGAGDF9fdXO7t/dAbwMWphk1OVPGut9hJ9y+pXgtEheeGlMTRoP3+iV/w8md
	+JnPJFpHf+oVTiibBN0Bypyzs1DqwPrU=
X-Gm-Gg: AYBFou0sjV9fMunRY4F/C+iRijANlNl7WEoQdatrKxvnvjs4ymGWb9qyMB2hfy9Xjxd
	6AAnxGwyRL/BC76zO/D1TI2VzlCligebut3ZvEwtyzKwbQ3uReNOiNaHt7wcH42VTHlTX0AzVk3
	b70FgU8TnfySWqhh7nzL86gA3sMSZeGji+HwIC+E2tEq39i3d1FN1UOhogPr2//5owoAfu4uE3a
	vjrhVq/s5LKORNGFKJC8K4Cg5ntdRSIXCX1PGNtPxxuRHlyKlSp0BAsZFoCIUa1xiiB5SRbgKEY
	19ygKMhGO95Zg0mfJ313VsBDkpwU78RubA5ltHH/MDfwdVbnx1oVUCqbcmrGGv8GqzQ14+w0nHr
	nZcSTGMJQhBf3eVoyiLCrJJns+4A8rgPDMl5n95Jhk+PslbOlAOmEc8ZH+uHwPooPMW/oFg==
X-Received: by 2002:a17:907:86a3:b0:c31:5bb8:4b3b with SMTP id
 a640c23a62f3a-c46bdaf85e3mr1028439166b.2.1793096587718; Tue, 27 Oct 2026
 03:23:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org> <20261027-fixes_core-v1-1-6f74bec9a5bb@kernel.org>
In-Reply-To: <20261027-fixes_core-v1-1-6f74bec9a5bb@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 27 Oct 2026 18:22:29 +0800
X-Gm-Features: AclHuK-sc-Sst_xgCP0rWexz2ICrmdMlmxE50eDjh8zWXXtcyxqz8s5Avp5yS-o
Message-ID: <CAMgjq7CgeA5OYUuXAQF-PQ_LkmsLw2V3VzRwPUdMYTcGCmYCbA@mail.gmail.com>
Subject: Re: [PATCH 01/46] mm/mglru: don't use stack pointers when walking PUD
 and PMD tables
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, Hugh Dickins <hughd@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Lance Yang <lance.yang@linux.dev>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Alistair Popple <apopple@nvidia.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Minchan Kim <minchan@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Xu Xin <xu.xin@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Gregory Price <gourry@gourry.net>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:18=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> From: Josef Bacik <josef@toxicpanda.com>
>
> MGLRU passes stack copies of page-table entries in walk_pud_range() and
> walk_pmd_range() when walking to the next level. These copies can become
> stale when khugepaged or MADV_DONTNEED (CONFIG_PT_RECLAIM) removes a PTE
> table concurrently.
>
> This pattern dates back to commit bd74fdaea146 ("mm: multi-gen LRU:
> support page table walks"). Likely, earlier locking masked the latent
> bug. Later changes exposed it: commit 1d65b771bc08 ("mm/khugepaged:
> retract_page_tables() without mmap or vma lock") allowed concurrent
> retraction, and commit cf4a65539c13 ("memcg-v1: no need for memcg locking
> for MGLRU") dropped the walker's outer RCU protection.
>
> The fix is simple, so just fix the original commit so we don't have to
> speculate. To fix it, pass the actual PMD/PUD pointers. This restores the
> RCU-protected lookup and validation against the live PMD. Note that the P=
UD
> handling is required as well to handle folded page tables correctly in al=
l
> cases.
>
> Fix generated by an LLM and sent by Josef Bacik in private.
>
> Fixes: bd74fdaea146 ("mm: multi-gen LRU: support page table walks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> [ david: handle walk_pud_range() as well, clarify+simplify description,
>          adjust Fixes: ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  mm/vmscan.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Kairui Song <kasong@tencent.com>
