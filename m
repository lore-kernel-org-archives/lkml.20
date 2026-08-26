Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDEC44781C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757811; cv=fail; b=XpB81kM0sphSEMWGhdQt8JrvKtK47/wpe1318frp/EnyW7DfAn5tj2ipPhVkUnwD5+bHi7fpbpnrha8WgPW5etI9E4PR/nwnI9ogujkOwlyra86IXhJI0k5rrD9SB9e396GQeHEdTkWjQOxVX3gUVOyL8grtrNjshk9g5XLyGhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757811; c=relaxed/simple;
	bh=E66vJeXbntU54L/V/64WsThIeC73q2it2bjc8dWZWEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlTAWR4wwHRbWpFQZXtE2QUi/9BMax8TDc2vQJlG1O39hXA+QX29Z2ZKuS/GTgRaZBRyuIX9O5sowwHQ6t4JsqTEvCzw/8/rBkyBfWkxay0cg5LXZdCTU7EFYTskCaB/sH5dHxXfEZjXkPb/8zO20TBnd9oA4LILmhGG14+znEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=YYpzw2rO; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="YYpzw2rO"
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QEsdum1674596
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:23:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=Qa9WiTOBruKSejQpy5vX1+ZNmguPqrLfKFdD+
	WBNetM=; b=YYpzw2rOOakYVYLUp67awx37TtLpzPdFrSOicHSNC3dIpyTaXwZE4
	LslP67ckd1n7U5R6jh3AhimynEppefe85DwoCP1PRAxwjB+jxgW/S+TqVvkQrg/h
	bJ4Lp28IjEwAwNO9qx0tJ6FB3iMYmJSYpUCuO2FG8mmGlfu/MMydR+ZP9oU4BoeA
	//R6qTLgmETzuML9ReuyTMSQimOP36i1pP47by9cLJVOVk2nimhYkSRaRA+bnZV9
	Y3asbPnDgOTqqszhqwx9eeX2akesOooedK4qXaO1NwUcqkzrL0EFCC51nZBWnKas
	qk3YuTx70el93O7qzmwLYG3ycwM+SuXwg==
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4g9cec0k1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:23:25 -0700 (PDT)
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a5d57a8d51so1222540a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787757804; cv=none;
        d=google.com; s=arc-20260327;
        b=BZdSsBKkoYln3q/7zbzEbs2XzLbkDZjdOZry7W0ssYFN5hoIEktooJtbTr+ngb/o0O
         bXiFoRIsLh4dLWzF/Tq09BC+9lkcUtweR73La070+xY66VRfz9bxF7niDZtKHpz1mgi8
         rPS7cE7sAvWcS4T3XBAizB9KV9ISUNpOQycNSJmcAH6xNrXTaYy6ZAxf72UDMffMr5i/
         kVKpq2OgvUmM436/B/tMYXJ5v7xqimyNKgrIYnx/VgGBunOE4LsooQCj3rpA9z3dqUQb
         5VjcrUHWo2w6vNK08YJD1jOyt+LM3DV32LKU96OD/U/NoB9RTFYYhyqu5ER+hnZQi1i8
         /B8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=WMiMFv8KParNnf2Hm2vAw/N6YmijsTbpNE74wr8F5vM=;
        fh=lPFyHeXukgsqReYPuRM2CcErUk723Kllj2T7gzxBkZ0=;
        b=KdlYC/LHj5hxji9Pbx/Tf16Sobl4aDYLT/4zxrEaMBgUgUvo7TkBgY2ZkjgWKBQ8ab
         GxVvesEgGldEFiGDb0Dp7Ryf++t4xmBeA7Thrpzhutapvoj+OURDlf59Fu5H1UYqb3/J
         V6wGUTM7h8axN4Hh7nmM1YM8c7CdQELYwMolsPFvYRceG+INCVrOYFVItp98LJb2crP/
         0J+E4mv1eRvHCFhT1C1D8ghZvmkWaIcnWSmZGLakTLMF1eW1ZVMtkJ303+zFB9VJya57
         MQlU4LP0FG0MKOwHGDs1DTvi1uLrLPwT3tlWCUf4PoWaO2M4uUc84swT+YjrJrcAZqkL
         UGIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787757804; x=1788362604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMiMFv8KParNnf2Hm2vAw/N6YmijsTbpNE74wr8F5vM=;
        b=aaxl24Uy7cXIxGIZGDmZrG6E/atBUFVop3hIS9+ubVEk6KcUXtdIEeIlANVJzMAi7j
         RK22TpNMh+CTH1hR+xcPnWw7pgeSEIgubjRuGjTxbBFak9/iOpTwzhfhhu5ZxwUizD54
         6KymfpB1Wrrs4XUL+bTZfM4mzVMGLXu830zOcVXX/HwA+QnfdYiVFTDWL7UIxGdHmw70
         OAqR28sg1C1tOq97Ra5ixqJQU6NaONpOKtZKdGKSt9NaCbwS3UUhQf8nSiHjdM3FDaIp
         UgqytiwCdJgXdkHv+e+icNgHbAqHnmORcorz0AmHu6apyNzyrpHogK0S9+6IBN6UtlKh
         xBkw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5ZHz1UjfG5goHgEFmeSVvHYxRLbZ8Obs4R+vcXUkehSPzpKrZh6xlACxfrC8OouuPhGgwXCKvPdtcb2s=@vger.kernel.org
X-Gm-Message-State: AFuF++ngNdWi1zEfhxbzkdGv6yaKb8HsM+o/LIE9ZrTQcWU7SsabvCKr
	h6K43uWN+1lmBdf+e9fbfqZ+iJx4NVzf72XFlC1qdUO64ghkIs5l/AvuK0QuOckzVvv6xQbXp+X
	FVPnmz8P6mRvgwJkJvjtng3OsWiU6T8Ee+E8T/1COgjsvbRscYuqwuRf6G3C3cQpPUARqWJR81q
	iXbbXQC/wT4JVUj8ckfqR1IfL062cmTGS0nYnNtxA=
X-Gm-Gg: AR+sD13zw+LSYizdbgTBVO9rb2qecCf5Yh6G7hL1z89MLNgjcmwze9hWbd+RWl99blU
	OmwINLVHiH6MrYw2IR4d8hzHdemp4EWRO//jKv5AZVgxRf5LFmEumT5mvPHag9a3ZQqMvWESD3R
	IfHdGZy3sdYbJlHzLdqkFYXv2e5exVxcdWoHyRRgT4i++xcyADQEFy5UzXkf7aZQFAHX2bi3GH
X-Received: by 2002:a05:6402:13c5:b0:6a0:a644:355e with SMTP id 4fb4d7f45d1cf-6a5df5b7c3amr9749048a12.2.1787757804514;
        Wed, 26 Aug 2026 08:23:24 -0700 (PDT)
X-Received: by 2002:a05:6402:13c5:b0:6a0:a644:355e with SMTP id
 4fb4d7f45d1cf-6a5df5b7c3amr9748970a12.2.1787757804021; Wed, 26 Aug 2026
 08:23:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825172604.3243589-2-alex@ghiti.fr> <20260826132159.433469-1-usama.arif@linux.dev>
In-Reply-To: <20260826132159.433469-1-usama.arif@linux.dev>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Wed, 26 Aug 2026 17:23:12 +0200
X-Gm-Features: AcwNN1Wo8nO1dMvXKnL495mi39rOONd4666rDugRTP83VRf3os1hkdgJ9zdQ6ao
Message-ID: <CAEmasaUKFZKFjf+bQA3_=V0vE2wCvwF4duy9sTaS_oEgF_f11w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] mm/swap: move LRU insertion out of the swap cache allocator
To: Usama Arif <usama.arif@linux.dev>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 1Os6F1Uk2ATyx0cOBaoBZYC17SfX-JXL
X-Proofpoint-GUID: 1Os6F1Uk2ATyx0cOBaoBZYC17SfX-JXL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyOCBTYWx0ZWRfX0fxCA71gKvV6
 6NCxTOF0ptVQDjMUmgHV/4OhiXfasSyPN6CVzUHoPp79Y+ZzeTDoYKoV2z8F/INTIqZgvukqisE
 bcJuPhpXZ8g29WFg5Apy+VQEhvY3THVP7P4M9uWdplyWWIYSPZuk5MIFACxksppMEgWDKkc0GE7
 Om1irHuZXRV+UnqDlu4QSk5Nr5iqTmZu3jo+34bNb0rknAmizkeM7SDPzrZGkusx5UUlZos/28g
 jltY9VhHg6F9Om4pGY+O26AoVB+WXH6vR13OlNMrQdAdLxOCIeDf3Hvexn4lAtWfi+X5018N8Uw
 LqQRqsoICeNqlthNIhNq1vyfB1mp0rnvIiRqxn+bj71KxK0VI6e3riLqraL0/NU8y7FQoEShcWD
 knihPPYnWc0ur8unLyOcvURILfDVDhcRUSZDl0XSm38UHVmjKYsD9gbI1Cen2LOTyrlKR0uB1XV
 fxvvoDLjtGOgMSQD2CQ==
X-Authority-Analysis: v=2.4 cv=ZP7nX37b c=1 sm=1 tr=0 ts=6a8f04ee cx=c_pps
 a=Tczdrg5if7+wQeIJmxD/XA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=GvQkQWPkAAAA:8 a=ewRncaucmhy4OkKyPHwA:9 a=QEXdDO2ut3YA:10
 a=1oAhN8tkTtOBK6_UvoHx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyOCBTYWx0ZWRfX3SFAlMA+JF0p
 gS3hM2rVN/Mlluia7J7TNccrlccisCYYNvz2sm15Bvakm9tKRhdlIJ41OjXHKMyYVvxjcj2kFnT
 x56sMHyf65I4d48yt/B4XVpytd+6ekQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01

Hi,

On Wed, Aug 26, 2026 at 3:22=E2=80=AFPM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> >
> On Tue, 25 Aug 2026 19:24:51 +0200 Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> > This is a preparatory patch.
> >
> > __swap_cache_alloc_folio() adds the new folio to the LRU itself, which
> > leaves its callers no way to act on the folio before it becomes visible
> > to reclaim.  Two users need exactly that:
> >
> >  - the next patch moves the refault evaluation out of the swap cache
> >    folio allocation, and it has to happen before folio_add_lru(): that
> >    consumes PG_active to file the folio on the inactive or the active
> >    list, and under MGLRU it also reads PG_workingset to pick the
> >    generation.  Setting either flag afterwards does not move the folio;
> >
> >  - the upcoming zswap writeback dropbehind implementation needs the
> >    buffer folio to stay off the LRU entirely, as the per-CPU LRU batch
> >    would hold a reference on it and keep remove_mapping() from freeing
> >    it once writeback completes.
> >
>
> I think the kernel convention is to not say "next patch" and "upcoming.."
>
> Especially as this patch is in 2 series, so you don't know where it will =
land.

I have to admit that I don't know how to deal with this shared
patch...I'll drop the references as you suggest and we'll see!

>
> > Defer the LRU insertion to the callers of __swap_cache_alloc_folio():
> > each of them adds the folio right after the allocation, so there is no
> > functional change intended.
> >
> > Suggested-by: Kairui Song <kasong@tencent.com>
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>
>
> The code change itself looks good to me, so once the commit message is fi=
xed:
> Acked-by: Usama Arif <usama.arif@linux.dev>
>

Thanks for that.

Alex
