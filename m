Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA403CCFD2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673388; cv=fail; b=NOG4Ph8hkkxcHDVZENgZqEEVKuF+FRM/t2rc5WMmROqbW84iXUxgnxTycbzX+XQrSFXXd4LaToIH2M7an+m/ofyMeDBtP6gCrB++H+34YGAFFjrFdIvaKDRYJ3rQkB4KM7ZNo0uL/W9Lx1c6JlavNFqPfI+JgB7R0+0lPJrhkwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673388; c=relaxed/simple;
	bh=BNVccYi1LnLrZu/mffNsQ0VeGIIlEsAHZtAlQgUKSho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GrWMX8YQJllyKBd6IKYSnk/7XpoORLepVtqFOrAw9v8UuSbMwG5GSyRSjMd1P+MaEiuXbhen7dVdGsXyX089zedcQ+OUAYO/5jat6ja2M2eMpB8caJ8uF4rzrg9ojrbBnYjkl9VElLY6iCa5pnxVkoqgP9iTot+1IyM9/fszK5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=KWF2oOLW; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="KWF2oOLW"
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7UCOo1644494
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:16:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=UXOt0DR/qucJrjzcbWN633PqrJV6/4ZYqTTDG
	6UnQU4=; b=KWF2oOLWZqV0qtVOV+RAoOj/bKInEHA2dCJiDhdsxUn/NCwq6IWJK
	Tz9cgDhv3tNVxM3VJLUJOe4yxCcEK+JG2p7LZE30TQ6S+jz4iogQ/XPcGPCUoHpl
	n2OZjxjDadiP4BLSbClNOosKwfwSyLfPFHvexb8nKGF1xK7HnOT/hpbdziidMu0V
	eQXF2tvCjJaQ41VREWyRlkPJTDNG+C/OAxmLb/QCFg+CQzx5lSmaJozJIeLxDsN0
	KEdLb0JNvn4tAmjuRaLLGTRdHr5jcwsnR4ZmzY89fKCoj2cdHLguRjp7XGPQw5D0
	PTPMWHscS0t5Gai/UfjzDBFfpPbvpuoUA==
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4gy22v06m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:16:16 -0700 (PDT)
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c29c391bd2fso366218666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790673375; cv=none;
        d=google.com; s=arc-20260327;
        b=A8IOe8pCuFesSdrz1iLZd4QOgdEtMrY8HmCrwbgfupPP42BmuoogNnMP9VbKaWYNy6
         WFZMbp2cUNPQiTpkOjLCoA3P82MRIokTbypvYt13QPVNQAgTORCr9qvK6Gi5R2/VsXZD
         RK4Td3S1tzQxciLZtUeJlflY9JcxyoPSeqCTlEKSeMBvRzkVYdHyaqkiG1VeZ4u19dBR
         wcnR7Hi3qFoo76da/xwq9dl9vY9so/w0wQDrST055ou21qD6f3h7j9HcBuwYTlTZJwdX
         oG/p7r2tDlGn2A/v+z+P3TzQKBeZSHDPX0cd8NpYVcVTMoPHqVSjwC2CmldBjqMGzlnO
         gwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=RutqN0XzeZ2DQTMI7Gduqm3yztWbS2+NpNwUibf3R/c=;
        fh=4ABFlvYU796Xrdh4toVFQnAb3jk9S2VmgEyMVgGjSBw=;
        b=rXYbr5CWD9TrIhVH/yBrigysW6g1jEbWktDnFzzV7DbzVFgLEq1BuSvbyt3qO5srkp
         Nyrfy3B5xGix5bXgBWaujWmwotAY6Py5Mj+tCDIoYNP0LVy2nIytFURBILDE3NAsTNSJ
         satI3qmEStcTjlgWb04aBt+xZClATFMAARmgHCFHVTfG3TaKEtkYDbdFp8/05RIGykU/
         QeVccIMAFwT1Qgw4lR86vwn2XatTufILJKU8cbODwmB1S/bP0ckfwnDYRBugxodx97w4
         ic9WBgwjtYAD4yYEqW1FZoE2y1yn/BZTfynvKwxY457wcOT46vGePU1smCZP7A+SIo7h
         JTRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673375; x=1791278175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RutqN0XzeZ2DQTMI7Gduqm3yztWbS2+NpNwUibf3R/c=;
        b=rnzkhiyKPwQFhRZzY4S5OxwAAH4llqegY3Bagh+pV2iXOcbOn7w2qEUMtaTtivpHsD
         w8Un6HvrOUJH8LvnlI94DgzADbDDXojG7WeK7AmKnvOgG6ovjy0oHGR2Go692Pu/dGH0
         mzDO/7tCxJZdMPZSqdpb25bub71DtHLNGnhWNjJFebcNi8yfVGIHr2e7qqPARfbAfuNh
         nf8/3nIg/11Ye5HUq0Z8ns5ZbihUC15G92N7PGC5CaBcFheZs7aHW1iGqPgCr5WRs65V
         DXcy5pBYB7JNapXsTCs/srkN0ZNVJRIB/wo1pVCoTe1b/aJ3c+X8wsDc2faxubCi8qbD
         LuZw==
X-Forwarded-Encrypted: i=1; AKwUvBwM3Yr0/2i9LBHT4HWsuc1725Kug9i3QuQyOYvwYMnPhgwvmKm32T1eM0URrBPjVoLGeVsD2CPNbh+JXl0=@vger.kernel.org
X-Gm-Message-State: AFuF++l1SUWg3oUDwUsE8fHFLgaupnOxv16/gETZTE6xfI7C6wdYD5+2
	hlbyQYNAzN73hQXeyZ4fQDOGhOaNIO7mckBUEToOcLyYXuf6qVBcstSeLEcOzRaoqCCNNumAQCC
	BFHBU0TNNdsKLwJWDuqoLUd8Q8BEjuKJs6F9oUI6UjnkJFy5/3JRvzlIUzsHT+o53IVG0M7awgo
	RuyC+GmXhv0xqTLfaR0JhuxqTJdpaHRTsm491ZUNo=
X-Gm-Gg: AYBFou11XiJn3kHTgynIHztodTd6rJ1g/s+qSj6uU60l46mtn+SqKKf8Oq+jAn8yioY
	YHYEcISeonjexcWFoWAC2v5yCTStV5b5YV6XOlP9XxGkeP9JmjrQ/XxQsfKWeqA80hgV6+bfZRG
	cP9zGQlaJvrd6nTanxOZZUdtGLgmzgfIOF9A348fpzrSNbvlkRSLiBMjJQbqRvL9ZCj52Z7k34w
	c9fD296N2u+Uks3gw==
X-Received: by 2002:a17:907:6ea3:b0:c26:1649:47af with SMTP id a640c23a62f3a-c2ac53cb0afmr1291011266b.37.1790673375133;
        Tue, 29 Sep 2026 02:16:15 -0700 (PDT)
X-Received: by 2002:a17:907:6ea3:b0:c26:1649:47af with SMTP id
 a640c23a62f3a-c2ac53cb0afmr1291009966b.37.1790673374768; Tue, 29 Sep 2026
 02:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928081900.4187482-1-alex@ghiti.fr> <20260928081900.4187482-2-alex@ghiti.fr>
 <aro28ZGuYgmNg_n5@infradead.org>
In-Reply-To: <aro28ZGuYgmNg_n5@infradead.org>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Tue, 29 Sep 2026 11:16:03 +0200
X-Gm-Features: AclHuK-D9BofbMEsWSFPaoMRP_iu1F-Wj4thWHCh7PID9jFqkf7sbSb8Hc_0i2s
Message-ID: <CAEmasaX-6v_EpwAxHtnhA5SXk=jGW8+Lm4m8zAC=+f0yXmiCxw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] block: do not issue background swap bios as root
To: Christoph Hellwig <hch@infradead.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        cgroups@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        david@kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
        Josef Bacik <josef@toxicpanda.com>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNiBTYWx0ZWRfXwsM6dzmKcVh8
 I7ofuONlVqignhgjPXflwldXLe6jKgZo2NSUI9FvC96VryMyCwRyNFtMQ634SkEu78H2Ai5SNQd
 NL7hA8dtvKJuHWhZWEBuxwN2AnY2PoElcjjGqbq5Hdutg12QEFHCD1/J6gscngntT1nYTadvPdv
 mYGENwrU/pw/5+bZ7Qkin/Y2uQ1ayX0SFxkuletTZAhCe2zJvmKFVVdPwt3K1FEPuTkAtt3jgZY
 d/E5jWBFEDeNa8oreKxJ4rMfplW9GDhppdIeVVWdPuODMe6y8gc7vGnaYfXUrWb+bXEBC6lr1BD
 xe3dsRov9avTyFrUGHiA1d3vnY/LdgKJT7z6j1i3oK0Q/gClbry//Dvpy1opcFFrpCAtL686Nmz
 q63kyitM9Bd+YlL9XsIBDaH3IkwJpzHExqzZDbz+4TPk1jqiEfCMsAmmhovmeyvp28OrIwKmNg2
 3YLJacsucbu+u8RCi6g==
X-Proofpoint-GUID: erWbgB0YtHfGMqwM1IbYXuLn3YB5D-W3
X-Authority-Analysis: v=2.4 cv=bY3+w+PB c=1 sm=1 tr=0 ts=6abb81e0 cx=c_pps
 a=jJvPsHQLKLf2UdvVr97r4g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=4h92JMTCafKA-fb_NiOh:22
 a=JfrnYn6hAAAA:8 a=gdocsb_8Clbhv9H3gegA:9 a=QEXdDO2ut3YA:10
 a=q7aydO1c4wibL4nb3gNS:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: erWbgB0YtHfGMqwM1IbYXuLn3YB5D-W3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNiBTYWx0ZWRfX2HDccIhybWgf
 ZLz2LVFj46j1Ms+v5VOD1qel6d95cYHLMLSUqwE+e6KfyxjCcD8MwxxiUeFZDpsxbIe1xR9qIOk
 EsxMEkafqHLYbwBtrm3pwDFAtgiKyI0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01

Hi Christoph,

On Mon, Sep 28, 2026 at 11:44=E2=80=AFAM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> >
> On Mon, Sep 28, 2026 at 10:18:36AM +0200, Alexandre Ghiti wrote:
> > bio_issue_as_root_blkg() issues every REQ_SWAP bio as root, bypassing
> > the cgroup IO controllers, because reclaim cannot stall indefinitely on
> > swap writes. Some swap writes are not urgent though: zswap writeback is
> > best effort.
> >
> > Such a bio cannot simply drop REQ_SWAP: dm-crypt and dm-thin rely on it
> > for limit_swap_bios, which caps in-flight swap bios to avoid a memory
> > deadlock, see commit a666e5c05e7c ("dm: fix deadlock when swapping to
> > encrypted device").
>
> Is that true?  REQ_BACKGROUND very much implies the I/O can the throttled
> and thus better not be foreground paging, and thus the caller should be
> able to tolerate a failure.
>

Yes, I agree, zswap writebacks are only best effort and in case of
failure, the compressed entry still lives. I don't see how
REQ_BACKGROUND could be an issue there?
