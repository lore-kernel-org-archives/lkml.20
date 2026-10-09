Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEBA34404B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526961; cv=fail; b=mI9wp2DNmiNGSy91Y4BGsL9SKVOr+LMRRQBBzmkamKqPMDjW6J0LU5/8Goc5nHoyL4vT94lue+Ufyo5k6b17VPd2l7DH543s5ZMMF2+Rswq7XXxWxqA1WyC4mSL6JMXxA2YiCIX2W3Jqzu8SnQE9ZDVMPlOTM5SwFo5MmfuP5Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526961; c=relaxed/simple;
	bh=qTk2TW60ljjCs+seXItsVuX0fpMpjegkE3no27m6ZeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SoWXPv4NHAXP8+4DA86JZdj8u2ijBgW8fWEw7rwfrTcJQJ5miCmog1xG/MhqCZRL5N/9AHt7XX3naCZPZY/cvjrBW2YBtitZ8dywt5C0iAIOeglH7Ga5tvHvCxuYXfWppfhnGM2BnNBRpP8TZtPKjdWU5HK7Yeg5Hsl/JXXU7J8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=BVxSNA9E; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="BVxSNA9E"
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993KFAg804970
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 23:22:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=xrUTSyKtAgDV97zqjefAwYojktkvjwSj6eMRr
	4iTKmc=; b=BVxSNA9ENcWBzNnRptdK+cNy15VcM8QiGxhNxBVmCF5Bj7sm72HzR
	rQQ2FStXdG9W7lFYFsa6RN2RLe+/clIP0YWjq/IgUovEqaEduUZjgjTD+WqM8Ssa
	kmpRGhYoLbv4yAUffhGkDawKdfnQLK3YlhFTB4edFW6xtj5rVuu77pCiTiZTpyB0
	JztefpvE8noI/sHnhS/MWGCDvmyj4+1hXXEixjEHPWBlMQc/mDcIUTKw7fGyNRya
	Fa9Y1Jsf5FeDeF+jtLuvMuWFI37seTHdrgujE8nVMvwjbF+8n/FEmc2ouLLOF8SB
	nRrl3VRVwuh2EXxtDZNZHttS8zVqAj/5g==
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4h5xdhuuam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:22:38 -0700 (PDT)
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c2e47a584edso633030866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791526957; cv=none;
        d=google.com; s=arc-20260327;
        b=fP/8uV+EsWitdsInyvhzu4hB1s3LftPfUVr0/2q8kD/t6OsBhOwBBhuijY01zQS1Tp
         ESF0P0ZyvjMK9MM6ny6W3BuK5E3LgYKsfYKnYpXW38f6j3YuyWwKTyZV/bJg161GepWT
         MVXcfem6qg++yoxJrZdGtEu8VtSoQPJNQp3++7CY9Fuf6DgdoSnsld3wcBrjh0C+Z8NF
         svnOD7f9HxkVlrUKeG7BPqHfaDxAjX4jieTvMI+10+R9+Bcbyp/Cs3cWFoIKkb4omsv+
         axdYn4aw65p8mr6jxyhmgee3pY1iXlI9F7bAhIqKixd4udII3Q/RqUp9jj8mLOe48ZVR
         pBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=MDAPJbo8bAyD4SNPtt3cKmDaYLJkrQPEK8cHU6m22o8=;
        fh=tM2ReTdCiJkZS1vvoehEv/TDduanuMmtpuwi4A+N6/o=;
        b=snRiwipXAVMnV/lEdRlqBTCVq+kEZahEKf2q//fK0izFnSlkuF30MP301EevJxCo1h
         Vst2SO+hSNO0WuzWyJE9DvUpGgNU/P0kp2kRKxLpp4VVmaH04g9OKXjB5ZzL9NxE/s1C
         f1ECM92R72IZUT4xHobrJt50uvZb1HWfq7bym9Rr3/UvG8qvf8tuf2yv310oMrmZ/ZPc
         QQmzTyCqpB9ZCYpdjAQocMbRVp6XMyFqt7rN6XQWaqeYkeV0WkbwxIFXVDaVXoA/svor
         LynzE7mUm++pWbuO3MK2zGUF8fyKUCGCmLbsG04m+z63OcbSExV1oBLpo18P+B4Xc2Uc
         rOcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526957; x=1792131757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDAPJbo8bAyD4SNPtt3cKmDaYLJkrQPEK8cHU6m22o8=;
        b=joLMVJxVBo3OFmWHg/qHRM/maVQOzhpvZvYKO3WQDRL7IRoQpwVbnwt/xDiRJlJ34y
         FAOafbWoIbNzhu0dYt2DiCpp5m1SaAz+3aCPy6lDzDmUVRPqVcoXvRnvLF2kaAl0ee8R
         1LoW1HUxkRT9v3OhdJFUDHhygya0xHmi3t66wNmh5pkrZDoSU+TgWM4ULceJwYxcLws9
         g86MTxf+GJrQm4aMhQmGlSJNHW21jLJx0lGePIDu2dqT8LUsfVU9QOSX4YwMViArEcGF
         EnnDxgvtxP7rycwxsPW8qn2wQdLfs0/ZAnaN9FoM+3hAFGD9uj7aeWtkQh83VqCtaU1e
         9KZw==
X-Forwarded-Encrypted: i=1; AKwUvBwDuTtO0l9ijbk2kWvmvD0lMZFE7wnb++pnvPb1bZVwaYQAcqtHVgf/FeMASbM6Le6VW9oS1qZ2lKdnaUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqpERIx3mKwKp75nEtYzVQW2Scn2NkiCvgQ8rnriSm67x/QTM5
	dAWI8SvZ3+yjpR5UcG3uVEzbSQbuaaLLpLUW3dzUlOj15uPKbPk2mQddKiA5COu7735SMCvbe5z
	BElS0yZP0x+uLnTGptDTWzeW2PcLGW5L2376TwdkO94tICnAY+pJU5Hmrr1ZNnqHs+1d25abbL1
	Q1W9jz6QmDnC9Jzw97nchZTOxIZ9S0nCjQae1k6oU=
X-Gm-Gg: AYBFou2qJRlNTkCKHxLoK5KmicdsbGli3FRrEm/T4MA4IuY4H0igg5FfRQTVx32ZKeD
	VL5jmnHqlHo9wuyvfkO0eRuK3nQYHt8nX7x6V3QpsbZQsmAbk3O2rjHLNBBeltnmaf1Gu7uspwz
	5gH9vWimiCrIGYJR1a4rM4FLpcVYB+nRnT5iO+wE2BBDZ1LRW7LYtDqOytVnZPCpmQIOEfCdK1w
	kHv0VO7CJj59fn7ZA==
X-Received: by 2002:a17:907:c298:b0:c2d:cf0e:49e9 with SMTP id a640c23a62f3a-c31a9ff494dmr71954966b.15.1791526957226;
        Thu, 08 Oct 2026 23:22:37 -0700 (PDT)
X-Received: by 2002:a17:907:c298:b0:c2d:cf0e:49e9 with SMTP id
 a640c23a62f3a-c31a9ff494dmr71952466b.15.1791526956831; Thu, 08 Oct 2026
 23:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr> <CAGsJ_4xyzgUH4uhKqpD7PTVuOzdsAkYgowsyn5iT1LHWiaYqqw@mail.gmail.com>
In-Reply-To: <CAGsJ_4xyzgUH4uhKqpD7PTVuOzdsAkYgowsyn5iT1LHWiaYqqw@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Fri, 9 Oct 2026 08:22:25 +0200
X-Gm-Features: AclHuK8gPOgXXx1_x49eCX24hRCcO1E5atvyhBXA0_dq3WEte7PYf1e43nP0Pwo
Message-ID: <CAEmasaWQm6DPqAhmW_z=kuR+3LDWJ=h+yM0hAs+ryNoFQd6qmg@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Barry Song <baohua@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org,
        hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com,
        shikemeng@huaweicloud.com, baoquan.he@linux.dev, youngjun.park@lge.com,
        chengming.zhou@linux.dev, david@kernel.org, ljs@kernel.org,
        liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
        surenb@google.com, mhocko@suse.com, kasong@tencent.com,
        ryncsn@gmail.com, chrisl@kernel.org, usama.arif@linux.dev,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX3AQI87xU6RuO
 3SS7WsJfXwxJBJyxI9U44odvJA6MdvCbnU1cbADOTsPDtyyp0TtlbGC9JY+g7U6M7PGf2oW22Py
 gaRmaPFtR+GEm7D/EzlOA8n1jlyeScM=
X-Authority-Analysis: v=2.4 cv=Rf8FmFtv c=1 sm=1 tr=0 ts=6ac8882e cx=c_pps
 a=Ak8bExYEjeps3Jj0Zi+cTQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=VwQbUJbxAAAA:8 a=vvh9Qk1aVFpNxidmG9UA:9 a=QEXdDO2ut3YA:10
 a=IIT_bRn7abC_HnDGr_W6:22
X-Proofpoint-GUID: gqkVH16rIUuFVqgcllBx_HYdDqSfYlGn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfXzBwDhg+l2Aj1
 c3rWtefZVyv0Fr5jJiwV68N6RGQuKakpHeZgDvcj1IOqL6NeT9D0rUFyU6mvAm/h6f5Eue/78lZ
 qtnoI9OOT0uUkd4EFrHoBmKDrGvFyCwx2UvbJcB5JioHbBK3yVqMBJsU4x5zAxsuP7xUqQl4z1d
 aSWgHs8qVImegXB3+JPNM0Bj74w4yXp20D4aiCXnJwKgpKaqmbMrN2aUE4YOPvytWy2oTPcmamE
 KBju66Gkzr9+2g7meWCOuY7eCw0MitSx1eOVR9p8qa2zW3m3ccw22UeMkPHvv9C5ND0ROiXGqel
 JIiA2qxe2oGaT2mViOGVvAy7jmPyVeORRqZKM6srZTLCg+khlbrLUaxmBgx+WSQBzcgnJ//gfO5
 vbE+uHWzwpjQm8Prf254qN6HFqnTseSLRKG7sx/by2A0BGViiMRBB64kz19Keuzium6UkiaSw64
 +VoRPhGizMSEFlEiIcw==
X-Proofpoint-ORIG-GUID: gqkVH16rIUuFVqgcllBx_HYdDqSfYlGn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01

Hi Barry,


On Wed, Oct 7, 2026 at 11:05=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> >
> On Wed, Oct 7, 2026 at 11:39=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> w=
rote:
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
>
> Hi Alexandre,
>
> I assume your configuration is as below?
>
> / # cat /proc/sys/vm/page-cluster
> 3
> / # cat /sys/kernel/mm/swap/vma_ra_enabled
> true

Yes

>
> I am curious whether setting `/proc/sys/vm/page-cluster` to either 0
> or 1 would result in the same performance gain on a zswap-enabled
> system?

I'll test and report back here.

>
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
>
> The change makes sense to me. I am just curious whether setting those
> configurations would result in the same performance gain.
>
> Maybe you can mention the `page-cluster` configuration in the changelog
> as well.

Sure, I'll do that.

>
> > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > ---
>
> Reviewed-by: Barry Song <baohua@kernel.org>
>
> This is RC6 now. You probably need to respin it after the new RC1.
>

Thanks Barry!

Alex
