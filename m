Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2972A3546FF
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620366; cv=none; b=nDHz7Juj5l0cadIAns5enZ+B9mcWtfM+BYrNnQYxIDpo8S1jkEebGf4tSz/rPt/5LUlO8sYPSi5/+FFM6qs5o7q8DJZzPsf2GNXMbkF9PmccHr9D2srpHeOfUbU3f9HJU4MFyTHymMqje8NC/F69dDLfbsi/B41kM7n4+6QC28I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620366; c=relaxed/simple;
	bh=0jQnUQZ6GYmOkEjU/hu8xUsDNPSKN8MBlsFXFo/Rdt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cD6U8SpdfoU6WBfJxVrbRcUlBGAdmPLZ33vmSdIIFMHRutrWZSz9hie3uq1NiPUrRPqKpBA/ViehfILIdF7Yv5z+Bp6HAbQXdkQlcK9pZ17sCIOow27VjD0rxnVU8YM02R0f1P6D2dMPyLid36qLCZK9zNGRytXMkZ8AN/qGSl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxEche/l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxEche/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741DA1F0089F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791620360;
	bh=a9vcN5JkECAkVJNOQThJPXP1vaehPftc9ECVJHZpd08=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WxEche/lEUDz6jUn0sLV8ZxYgjaj2t6pVfrGwVvoHyyMDFmmtWPHu5jlWhHqFe77x
	 nxdY8oYMKsELpCWQKI7IGdVd05gm49Ad/i0DGPeADyD7UHUk0gwyP157NL72WZNtAO
	 foo6IEQrC4tbTf7NyC7bik3vRj1nF7uOnS5/KajONYgGqkrwacK7MYH4DN66NJ/Gdo
	 cGhWyE81SA/S7Ic5k6DLukuPSHkGlO4wfAEfc9aqaUAlewkzDeyFOcEZvvQsz+JrON
	 O558gQt7JUvjqM7iZQRpPLd2FdiX6zG5qx2uOxxWnPEsJtHa1p6b1xEAw71YQpZSYE
	 a3zi5FTxTA6Kg==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e6eb77f0bso42648985a.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:19:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxpkUDn0MtiCnTRBQxqk8lAB+96XzHHrwdL6MoGOb+lnkHS93vqBXrpWx7zWwaqWw+uuxQZ7xeivHw99+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1u79SjDKzxYi8NLZuE9ZPGxGQ13vz6+rJ2rcyaqyq+BNFNSa8
	+jqgOl57hz2prC22sv4tTKTvbfwWwzw7cdci/R50y4/g7D0O2Of68sr2jPTMfOsgVSSB3xraE93
	z/2onjk/JwlsGCq/mwx6KSZbpzFa4+7U=
X-Received: by 2002:a05:620a:3726:b0:93c:7948:6e84 with SMTP id
 af79cd13be357-93ebd23a637mr713801685a.52.1791620359703; Sat, 10 Oct 2026
 01:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <SJ1PR11MB6105E073723CFEEE8C8EDBF48C832@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <cover.1791577417.git.ehab.ababneh@intel.com>
In-Reply-To: <cover.1791577417.git.ehab.ababneh@intel.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 10 Oct 2026 16:19:08 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wmSL7i4EPLWLKhDD6J=1TywBi5EYYDxp=SvOuXdmLGjg@mail.gmail.com>
X-Gm-Features: AclHuK_GyqhJzFU674x9sTXMJsFNi6PizF-xomQhw66ySxZ6AOmNeI0WZYrAWlc
Message-ID: <CAGsJ_4wmSL7i4EPLWLKhDD6J=1TywBi5EYYDxp=SvOuXdmLGjg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] mm/vmscan: adaptive multi-threaded kswapd for
 NUMA-aware reclaim
To: Ehab Ababneh <ehab.ababneh@intel.com>
Cc: ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	buddy.lumpkin@oracle.com, akpm@linux-foundation.org, kasong@tencent.com, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	baoquan.he@linux.dev, baolin.wang@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 4:30=E2=80=AFAM Ehab Ababneh <ehab.ababneh@intel.co=
m> wrote:
>
> This is a follow-up to the RFC for adaptive multi-threaded kswapd
> on NUMA. It handles concurrent MGLRU aging, adjusts wakeups to node
> CPU load, and scales the hopeless threshold for multiple workers.
>
> Under memory pressure, an lruvec can end up with only two MGLRU
> generations. That leaves an older and a younger cohort, a bit like
> inactive and active LRU lists, though MGLRU tracks age differently.
>
> Regarding the concerns raised in review:
> - In the updated Cassandra comparison, four kswapd threads reduced p99
>   latency from 6.5 ms to 3.35 ms (about 49%) and increased throughput by
>   10.3%. We believe the latency gain comes from the reclaim design,
>   not from changes to LRU locking.
> - This newer result compares four kswapd threads with one. The earlier
>   7.3% throughput result was measured with eight threads.
>
> We also saw periods with zero file scans. The MIN_NR_GENS guard may
> contribute: when only two generations remain, it makes scan_folios()
> return without scanning the oldest one. This patch tests whether letting
> kswapd scan that generation helps reclaim progress. The current traces
> do not tie the zero-scan events to the same lruvec, so this remains a
> hypothesis; more per-lruvec tracing is needed to compare it with lock
> contention.

Hi Ehab,

There is a patchset under development by Kairui, me and gaofei:

https://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git/log/?h=3Dk=
airui_scanbalance_0.3

which allows reclamation after we arrive MIN_NR_GENS.

This might fix your problem. Hopefully, we can find some time next
week to send it out.

Thanks
Barry
