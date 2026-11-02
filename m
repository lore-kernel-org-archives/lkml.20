Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793605332;
	b=1I2/OESnFOrqIJ5YBfIDRoiB+qYO9wuW7CWK0SYfXCNt5DZcUZwPCVT9CJHVv9nRjXXa
	 LhcxLqNrr0vbkV6RACsxpufjyyImo7V3/u86AyLJRDti/dQLZmFOw9RPTryiizGIrvbD/
	 DwsnMgDUepmyh/K3OKMrYFprvdcGE6HME9isOaNbMSWDi5f8z1u8OvQ3I+dPOGnu1+0eC
	 Aupp1AKNxaomFHRcuLRMDjXE9SdGQfpDzxHCBUbOpnj+1NAMJQ6DYfzofvUKJftBDVCcR
	 Xcpn6rFIPjpN+1DHUb/zG8YAGZOP2xjOWZFYvdrhHsHVmApY0WiQ+8Vj2iQXlQVu1cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version;
	bh=5mFBSTRr0j5MiHbKH9taC4fPcpaGn0/BbSg2iUW7YhM=;
	b=3mO1EhtoqbLhDI6IWTYSbIG3uetkaekjbYfCEqndn3IFIj2T6IolcrcPOZMlaHmKBWyZ
	 z1BbT1dDthiE6P2Ap9YQqMriG4RtBQXg3Kjf3lYqovFLV1Yt++EVa0WX7bRxnuwMqxcf6
	 8yR5Qg2bjeCTVdhjfQi3gN/us8S1+XZmACh5oiz7ShYAwqT41y+G8UZnIZW1SgIh+vcqv
	 Y3b3DVWBxXM0Vvd6tmN4SfB1x4UNbdlA66QypLKZBUfihpbNKH6UI/iX6pNiAjiMBwdIn
	 dOPcZcSFj7Cm1a2GKgFyEct9mDQqiqQBCoFgQk05doY/0xcB5poa8D2hdGPT9cPaJdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Y6Vrek0Y;
	arc=fail smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6B2606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6B2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Y6Vrek0Y
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A249khs2146079
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 23:42:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=5mFBSTRr0j5MiHbKH9taC4fPcpaGn0/BbSg2i
	UW7YhM=; b=Y6Vrek0Yn8jcVvuIJhYfiBagoJU+Keb+3UHoIkoh7evxP3APa+2/O
	YCJWv9Z9AJNZZ+HRspxLIVpjpc6hwAjZOc/PuaqFkQjdUFwoOd2f89WJsGfPndaA
	pf4fJi7PUKY+Y20Pc2ZrwP1UrY1tMEbI1QGn2a+4UW5WZj9Pt3P3mhCkMyublN+I
	I4F2hTZTgksKUXtxVaC+699KEdxa6VX7lXu+zc/2AzzriG5dBMlkJYdBDawbmUYd
	SD2un/gGNphjKTiCF88XEDsQXgNQEu3Ca/fnQ9nYHJ6/vF5u7FAFq4hu5Jjv6Qml
	rFu0qyWSCHTPt7lz6l/2+azJz96bLa4+Q==
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hne2cyhhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:42:10 -0800 (PST)
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6aff6a8ee69so3046558a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:42:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793605329; cv=none;
        d=google.com; s=arc-20260327;
        b=WXyjFhyY7LQDnDZnCceze9rhfdB+3wx7ZQq/3Z+CJHuGQQUDJx5+ejz2eorhHbUyYU
         OjriXqvbHkm16sG2BnpYQ3nLR4w/h9OPUhBeTdXGaRa27x1RCHqEWwdXHGNvBeEnLdC4
         5oVNq9t+fAilWMoUknbo7P9bhzABOjwggNOiV9J3DXBWCCURfc6Mw99IWcgkeDL+J9OS
         w+ceihNcUYpH1fsILhkpDqsv0DV1AM0dcO4myT67HA6CfDoMZ5yUSoNw9LvPTz4ghNzl
         hC4jPRYZAO8KiNrAxKgSgowT/rJEMByFmFhbMyNU9ph/ATa9hhO0j6IZFHsLjv9yXBB/
         itBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=/tISQoeOPy1BAFDyFldAVc3RuvTUszXOOf5Ksc60ZGs=;
        fh=EQ0NE/L6gX5bSuJban7S0NxHXS332L9qRGtfeFwyvu4=;
        b=Rxh3AhvoJSsJiHFZcJPAEa2xJsUtcvLDmMjDq6r/xG4oi/sXOs3ELCCYZyrgRqH7vK
         AKqJpN8QR/p6RzPP6QY7Xpay5U0e7tpnKjCPDn+UH4uTiSBoaAGP7HT6B1v5JbxzNtYT
         p0mmnaBhiF4zB/56Q6Q+9xYTba/PKMlGPXsR2HnRVBpI61IBcrXiCzneD0pql6Jwz5Cd
         51zp3UbM/AelP94z6jnIN2tJFXm03ja/NU4xATmbFnb1QFRz5zUxUREgpTGMhE2FVyJW
         RjllGMl2HKjiiMtwUZVti7BA/xONL4OvhqatUItyEOpERkokmvtdaXZ4XPb8HF0yWHpt
         JB2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605329; x=1794210129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tISQoeOPy1BAFDyFldAVc3RuvTUszXOOf5Ksc60ZGs=;
        b=zVDBERxd71I9T3FGhnJxriHWkPobNOjR22O2Szc51K8sXhgn/xukOmBMsO19WZWLHB
         NAji4RTytlljSJ52tmkxuWu29r75Fm6+IKRJxwc/Nadv1akVTkgI4V+RT3rlRVfSpEyY
         ZX6baMlYedTOgMdkqmOPjDiJAYDWGkf3RVTrTsoj2JfU5z1OwB2rzJRVwdEkzISFD0J5
         M9Po26wUr9ee5ViB0M/olb2edNCS44R6AGC+p20VL8QZdIFn9naJj6i5CM2wePQ9MuOg
         VAO5D5ntcuhspOqrimu3WJczcS9aISrUU4AohSOorrBvySWktiAOcWgkxIwZLN4NVpne
         mWIg==
X-Forwarded-Encrypted: i=1; AKwUvBziXx0Lxg9svs5lA9qZPZIxv3As2VjNjMn3ORTbDciNBWliZx4mO4wd5wvpSlaBhp6GkfKyKdq30k5eYEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vqD98tv6+6eGM5rq+sTfA9QMo6VT95NDGOojbngjpZMNLClg2
	KYKDIQEMeue25Xf/Gsx2S4ZRE3sMZP/A8iBEeWFrlybxefUQ5bPv1V28xLH/Z3LQ9Wr/lXRNYWN
	+ql9nZ47AFgRtpDJq7sDb/HlX9orcYzt2NR5LtRuUP/Rdh2Yeh6Pid9e8n1mk1OtDKwiu7ddlIz
	H/d6kJQ7MbFU5EBekPcS/Kt5Zwq9eauCowYhV7Xv4=
X-Gm-Gg: AYBFou2fMpbXzR0Llsod8ARkixjvlyy+qcu5Z/qvUbZOGYV6lPTSPPOuATM9kFuHD6P
	yowTMQLGeglfElYj5SoU5snX60mO/R+RXteoWoa5oH+4t2QX3STCze0Q6AtxQ7dLbkqFL0fyDWm
	1hiOLw/pflOz7J/cnZAXjLSns/S8MfCP8PCFEGF5Ah4ZjqDW55gqBN4ZDqYNnuXTVUipZf+ub3i
	j0R45g5W+GScKDvJQ==
X-Received: by 2002:a05:6402:c9:b0:6b4:12df:8243 with SMTP id 4fb4d7f45d1cf-6b4d468ad29mr4577800a12.20.1793605328770;
        Sun, 01 Nov 2026 23:42:08 -0800 (PST)
X-Received: by 2002:a05:6402:c9:b0:6b4:12df:8243 with SMTP id
 4fb4d7f45d1cf-6b4d468ad29mr4577778a12.20.1793605328346; Sun, 01 Nov 2026
 23:42:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr> <CAKEwX=M6G3NPOrGJg7Sz68BDSjzrF4R-tTjcX07L9oZ0GK4Upw@mail.gmail.com>
In-Reply-To: <CAKEwX=M6G3NPOrGJg7Sz68BDSjzrF4R-tTjcX07L9oZ0GK4Upw@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Mon, 2 Nov 2026 08:41:57 +0100
X-Gm-Features: AclHuK_ZBjm071ukvNbDmfZJEnuL9tpwTpRPlzedYNA1H7fjxQBxYf7Dj8f29uQ
Message-ID: <CAEmasaV0jxQVTGRi6vfwuZbm6kcnxJcn7xJmT7aHHKf+Ad3bPQ@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Nhat Pham <nphamcs@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org,
        hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com,
        baoquan.he@linux.dev, youngjun.park@lge.com, chengming.zhou@linux.dev,
        david@kernel.org, ljs@kernel.org, liam@infradead.org,
        vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        kasong@tencent.com, ryncsn@gmail.com, chrisl@kernel.org,
        baohua@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMCBTYWx0ZWRfX3ifEUq3l+Aie
 rcxyMhyJG5jp+26NypUnuDx2mZDN83aCNW339OIEUpn43ZJg/5YC351dF/SMyYrAIuo8gdDksro
 xBjiMV4S8Ak7GZueznMjhTDV7KnoOUt+yzAmquhnRwAJsUTQ3XuMRoYrV76jkl1Mfyfw04rhyFy
 jOXlAvUTCcHGaGncgMkeHU0IukQOuOMK4ztsDY8AdAaaeV3iShn3maeuZdzI2Oe5lIArkCmKrZU
 o6kSHsw5TEbWAXP+G/AMQ29xJ4YUw8fRsqFL1fIE8O5lqBpOd4hcStla97rJ4P3hGnd8A26t1CZ
 G3GCh6agb76kaNf6O8ICOr8NTwODRXF0PD+sfRcC+4tGNBB6mCoQn6EokhKO8rKKWh09bhfmJ2b
 uUmfxKJflx5fN3RkEdpbnHymxoiIb4z+qSHEU4JV66LBXY7jovUgwlHXs3pjc2BF+4D2QDzx51K
 8gRP4T5/kCr3TQ6N0vQ==
X-Proofpoint-GUID: oPIkgXPrsuagJ487k5mjn49xIc0RMaxl
X-Authority-Analysis: v=2.4 cv=QJ791QLL c=1 sm=1 tr=0 ts=6ae83ed2 cx=c_pps
 a=9KvDgq78n9V61H3VJbnhTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=pGLkceISAAAA:8 a=h8lhBcyy4TMpjp85FJYA:9 a=QEXdDO2ut3YA:10
 a=j5kO0B45gQVIxiUYEfTy:22
X-Proofpoint-ORIG-GUID: oPIkgXPrsuagJ487k5mjn49xIc0RMaxl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMCBTYWx0ZWRfX2bSWP100NGqf
 VrlJZkUE/ODzr8n0lX35lvdseJDx34RhfM5dp8WRG2PdPt7LofkvEhIUcJ2rmVCfRKZSvQF1nlr
 T6uSMJqpX/pjSCGMsJxkOfAWGNlkbBw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01

Hi Nhat,

Sorry I missed your answer.

On Fri, Oct 16, 2026 at 6:19=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote:
>
> >
> On Wed, Oct 7, 2026 at 8:39=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wr=
ote:
> >
> > Commit 0bcac06f27d7 ("mm, swap: skip swapcache for swapin of synchronous
> > device") made SWP_SYNCHRONOUS_IO devices (e.g. zram) skip swap readahea=
d.
> >
> > zswap is the same kind of in-memory, synchronous backend as zram, not a
> > swap device flagged SWP_SYNCHRONOUS_IO so it still goes through
> > swapin_readahead().
> >
> > Here are the results from bypassing readahead for zswap too: it was
> > measured with a kernel build (make -j16) in a memcg, zswap=3Dzstd, shri=
nker
> > off, on Sapphire Rapids and 3 iterations.
>
> Would there be regression with shrinker on, when we have mixed zswap
> and disk swap backends?

Readahead won't happen if the faulting entry is in zswap but it keeps
happening when the faulting entry is on disk. But if a zswap fault
does not bring its disk neighbours, we will incur the latency of the
disk read on the first disk neighbour that faults.

It's hard to say if this would regress, it must depend on the
distribution. v2 deals with that so would you like me to resurrect it?
That would be in addition to this patch as I'm about to send to the v4
so it gets merged.


>
> >
> >   768M memcg (sustained swap thrash):
> >     metric                 mm-new    + bypass    delta
> >     build time (s)          405.0       341.7    -15.6%
> >     zswap-in (GB)            79.5        53.0     -33%
> >     zswap-out (GB)          144.8       115.6     -20%
> >     swap readahead (pages)  6.79M       0.45M     -93%
> >     swap_ra hit (%)          72.1        89.9     +18pp
> >
> >   1G memcg (light pressure, build not memory-bound):
> >     metric                 mm-new    + bypass    delta
> >     build time (s)          177.7       176.0    ~same (no regression)
> >     zswap-in (GB)            10.2         7.5     -26%
> >     zswap-out (GB)           27.7        25.1      -9%
> >     swap readahead (pages)  1.07M       0.08M     -93%
> >     swap_ra hit (%)          68.6        87.2     +19pp
> >
> > Similar gains were observed on an AMD EPYC 7D13 host.
> >
> > The gain is from no longer prefetching pages that are pointless for an
> > in-memory backend: readahead inflates anon residency and thrashes the
> > page cache (file pages get evicted and re-read), lengthens each fault by
> > synchronously (de)compressing a cluster of neighbours, and adds
> > compression traffic when those extra pages are reclaimed.
> >
> > Bypassing swap readahead for zswap therefore makes sense.
> >
> > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>
> Code looks solid to me otherwise! Nice job.
>

Thanks!

Alex
