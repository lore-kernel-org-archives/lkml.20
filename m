Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274643CF1F0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121782; cv=pass; b=DawjY4z/1BDlDCBJyesQ/W2ESladLtb730qZIZdS9hrM9hfElOKKzYb5ySjopP3EwKjKH8iLTYz07tEZYdVD5PXI7Abhh3MrfPJbdlIRYxnifq6o0riXVVfg+ELiMiVPxt54Ch3vew0jxa1IM7n/BmV2dB0DZZmkdu+gGwSKvxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121782; c=relaxed/simple;
	bh=sTM5l7/mcpTgFtlO+bTq27FtaZVY8D3bMeRpxINvEgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5YOKHvdBDQvTwYTsV6fxbOlCUmMIkr4VyixI/pBc/iSvrpnbuDoN1fQf0+QT99Ua8Y4CB+HVFuKMGnubYMEnpPN8+CIUfK5HkXkGvm4zPdzGQzDoOArSt2Nrkg6br906t6wrw6Uk7054T/begiQW573QleW8A0oPw9D5GUOU70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrR4J3e8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTysus5B; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrR4J3e8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTysus5B"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B9maDw3292377
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+OJapG3xvg4UDzpEuXgFJ8O+WhYav0LSOmiv7Ij/KE=; b=PrR4J3e8x+OtDO1O
	JurWKSGR7mZQMxGkxFWrpX+utMAc1QQmmECC+J99ANcXMVPnpxGQqXEVk78ieeLF
	bxhyraqi/484Ui80ebM9twYlZamO5izrF5AYuLp8+KAX2jecaajL9u6H6H1eISCO
	v932yIZLlL4JlVLgDLqgzvpPfw5EYDItlo0FNKWU5r2eqec0HiKlQpI3O2nnncM4
	qUwBxfMZZSDWthrnGgMgYc7K7xaWcBsBZURlATzRDj2dBWIwJc4LWfERpaQg/V15
	C/4QPszSa9Vrx6kK/UPefSCK/uJR5vDyst8JwV86MsQvZBGuljEO4GqtcEY9DMmf
	GGck6w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbg3ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:16:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso17650635ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789121773; cv=none;
        d=google.com; s=arc-20260327;
        b=aqIWDmaRJd4OTzoM0VsFimvRTjRGjckRly892FFs1UFaTO3Lwro40aIP7rU7vk8/by
         gDNjuk7OaCsw5R6cMqK+gwnOSJz4JSJzNEv6YIGM3Pmqn8jiOz5ga07WdzmzaKCrXn32
         zM70Bi08TLGqRH9GVA4RhTDNKYzGxSTCIk9AtjCNH1iFsYN4bdPiKbQpyXXt03mLHEsI
         0IM1+OVhuNtr45MVR+BRfCqdIhH2xehXdgz6WfUuyRt8y3FyXlCHbFi+yCNOkgmBi9g3
         6S6f74aT4Et2boVKcRSrv4HOAf+Czy9aTm7Vzb7WVIbW796Aksq0yNOoy3ve8rZrv03G
         lwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O+OJapG3xvg4UDzpEuXgFJ8O+WhYav0LSOmiv7Ij/KE=;
        fh=JEWyyN0eouHQ4CnumkJRE9MYaqfNkMEY0XJcSiAxeEI=;
        b=Wv8sMt9ZouIF/D83x72LAthDd6Cjydr3nGSbSwj4FHUfL14APn1uVCqGBYUgkFC021
         UdiL8vhnMDv3BhJH5GOc59G+Xt/rX0fLhkkxmaGIbpCaysl7hoZbgDb32L7boXJwQosI
         Sqkn1sEsiA14wBfNb+p3ZZtyLvEa9OzTkFQerqS9yp/CUB9JeNzanFpOjaJ6HHbcQHXl
         XRBiYJyoYyxujTJRZqTa1Eqe6dwYA5fEmEjLeZ5pXyEDFeEGKrpabw4ixtQD08sgRRYH
         RAktBmxiZOBaRmww3cKlirvP19RZ9LPtUfGA7BRaehJ5J/nxj1wD4uLRUKc903IOYzVj
         rVtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121773; x=1789726573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O+OJapG3xvg4UDzpEuXgFJ8O+WhYav0LSOmiv7Ij/KE=;
        b=QTysus5BIfdvN/xf+iZzwakSsQxEVCMTjFZ6uGr8a0oaV4Z6huFi3T+Qi3TOxqRuCf
         nR9wtlZDKNe8jwU/1t61V53B8CUZzniUma1gewwdRJSTqGpKUinF1CWzp31BbTvkM7Mn
         jFQZUnu82uds/rntrqwW4ks6uFbPnOVUfGCP76C2e56MLsX+tsQUTylIwDAI6D4U/dGD
         tJF/D5LQ3RD/iaRNQLuklpvwjtKwc1+0iz//4R8j5X8E+PXMDe2t2HXbXk7BuM+r1krz
         T69d+gvZLDFkVKEPrxhGPEg3/HMvOqFMNxK7pYTiQ8EkqnGdhQNGpmniDOVZ1EUWtNW7
         8dzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121773; x=1789726573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+OJapG3xvg4UDzpEuXgFJ8O+WhYav0LSOmiv7Ij/KE=;
        b=Pm4tNvRo4XnFYCKm8p4nYEXO+r/3L02+7/nP85uZbpIIhhMTP6D2iGVbgUinc1JN5R
         dwPlVMig324Ge+6EatQP8WmgLYnjJ0gLLeJL59krlC8eQ3bDPm7QxM9654p8ZkuvBa32
         vTRawEUnup+TZODWuBMj1L6GK1h22MQKC643cmstidtof0+cU63QzlX6kzd0yW2gIFsw
         1Nu8RCtuZ73I7MA9a+uye53QxRzavIN6jDXXpM/KVs/Ii4pvxVAfSRLYqOdIfWvSrssl
         mN+xEDgfTDpezfywabdL79cpGRIDUd/YYLiGFyjtn85sLVtWXtuw5ySKPcnx6FjneQ0R
         FDIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPti6kCDu/ydriSEavB7i4nekRv5ICpaOoSDyh9dq9iNpBxHEJ92zJxEtkHNjwJOXqtsboV7hWhw2stVY=@vger.kernel.org
X-Gm-Message-State: AFuF++kImihQzY5OrgFWT7oVagIzDQO7acBo8PSiuJlIKAXMGbzsGCcs
	ahdX6FKhLFgRg0D6st6noD9qGVN8KU/pKxAXZFuM76ISb7DRCeGhQ7p0gHL2Zrk7UhUkjqIOfqE
	3NkE+sJ/kPbIqN8TS8daVBzIXMBerftJuXpA84aH/RYuR5jICHM+tqLWrZ9DbGGZR+CCC27fTjz
	AKTP3ABD4oB2K4+4nRM64sygumpO1/hNdGZVBoKWS49A==
X-Gm-Gg: AYBFou1PnUr93ebdlmSbUZ5GHvCRm75iFWNkZtOTtj4GjYt9Ig212kn6TmVy4HA9W4I
	+yaZR8VC3VIeK258LSt2e2zwpe0l2HnGDtqkBtDQueRg9oxAuVVWEzEFrgFOCHOCSAYxg+rV7NI
	FLch4HttCRpEgwd4Wg/3WeX0BnaSwL60pLTUaOmDx0QS9bCAHMzbqabthINQ==
X-Received: by 2002:a17:902:db03:b0:2db:55d6:349d with SMTP id d9443c01a7336-2dd2a45818amr67010665ad.21.1789121772782;
        Fri, 11 Sep 2026 03:16:12 -0700 (PDT)
X-Received: by 2002:a17:902:db03:b0:2db:55d6:349d with SMTP id
 d9443c01a7336-2dd2a45818amr67010175ad.21.1789121772237; Fri, 11 Sep 2026
 03:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-3-ulf.hansson@oss.qualcomm.com> <02b29827-3ca3-414b-9377-972f3d46eb03@gmail.com>
 <CAPx+jO8Cf_NGJ6h30+cd-arAJGQL=V1HayRZqaTrM-xg9eUhpg@mail.gmail.com>
In-Reply-To: <CAPx+jO8Cf_NGJ6h30+cd-arAJGQL=V1HayRZqaTrM-xg9eUhpg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:16:00 +0200
X-Gm-Features: AcwNN1VXOL5T2wS1gBfHMSChb8upujLEO_jTsEBDjEO09CtMln6UezixLgCoqhc
Message-ID: <CAPx+jO-ZP_09poe0rHm+h4QQZBbHJisCdQGa6kA67sQAkU-BfA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM
 domain to do power on
To: Dhruva G <goledhruva@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: BC0ACU6OBq--lZ3tWVN0t-_ZvAOo4oWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MiBTYWx0ZWRfX2vVoBJ+BwlcZ
 I4y05XSsGzmFOHz1/pEAtPbYAcchbDQBqW6VPzAc+COkoqZJKe8v9HttZ8099KppQiL6SnfUxhJ
 66p7FH1hheRihq3Zyhj2ifx3ZyhAAVbqQvuptAeeQ1xOklUIsWY7KjClEHhuKVM6ykQwRaibxke
 wjcp19im8d5vhP1VqfHw35DIx8pjRTWjp8eKw+mhK+xHSYl9FFRhgKHqe/sFqHF8bmt47q1GAbS
 ZS4g9oAqAubkLzTOeJl2ckZ4lbcrULoHyJxvoyE+kbnF8XQg+hamWx5Abix5SpFMD1ReN/ONV1p
 2mtzdFj16yy3D2jxmS/F6GH/F0NST4Iozzpfy3tP1wbc0ICGf8KECp8pFVxidCOB2DsyJlz4NGu
 I2G+5T82N3uHuzuqHJAq11YclAsrFEC/WYfh/fCr+NuzFWl5FV/chC1gCuFuEWe2g0nGU2SK6Wp
 YPKUTLl+IXTGGtuXKxw==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa3d4ed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=u8BtVuMVLpZXKRMe:21 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=42KKylR2Cj7GAKIKN3YA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MiBTYWx0ZWRfXwdouUEbmN8Rz
 hcuhVmrWdTYiUvF5cqFN2pr/Pyn88qR7OCwbzkj+B1ImzuEoCVGqrLIWklkYcxxa2ccQiv5Hvu7
 4azi4VZ3XAsIMwtq/+y5Nk8WnCp10PY=
X-Proofpoint-ORIG-GUID: BC0ACU6OBq--lZ3tWVN0t-_ZvAOo4oWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110142

On Fri, Sep 11, 2026 at 11:06=E2=80=AFAM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> On Thu, Sep 10, 2026 at 8:31=E2=80=AFPM Dhruva G <goledhruva@gmail.com> w=
rote:
> >
> > On 07-09-2026 16:46, Ulf Hansson wrote:
> > > A driver for a non-CPU device that is attached to a CPU PM domain (th=
e
> > > genpd has the GENPD_FLAG_CPU_DOMAIN configuration set), is currently =
not
> > > able to power on the PM domain. More precisely, to power on a CPU PM =
domain
> > > one of its corresponding CPUs needs to be woken up if they are idle.
> > >
> > > The current support for a non-CPU device is that its driver can only
> > > prevent an already powered on CPU PM domain from being powered off. T=
his
> > > leads to problems for a driver while probing its device or when it ne=
eds to
> > > call pm_runtime_get_sync() to turn on the power for it. From the driv=
er
> > > point of view it looks like it all works fine, but when accessing the
> > > device it may end up with various errors as the device may not be ful=
ly
> > > powered on.
> > >
> > > To fix the behavior for these types of devices, let's adjust the beha=
viour
> > > in genpd_power_on() to wake up an idle CPU that belongs to it, in cas=
es
> > > when it's needed.
> > >
> > > Link: https://lore.kernel.org/all/CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNr=
sZVYO=3D38R2cLV8nw@mail.gmail.com/
> > > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> > > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > > ---
> > >
> > > Changes in v3:
> > >       - Moved to atomic polling, pointed out by Dhruva.
> >
> > Thanks, but even in v3 we still have potential issues.
> > It does not fully address the consequences of polling for five seconds =
in that context,
> > nor the parent-lock nesting issue.
>
> Well, I assume we will not be polling for 5s, as it would be an error
> and it means that we fail to wake up the CPU. But, I get your point,
> 5s is really an unnecessary long timeout.
>
> Ideally the timeout should map towards the deepest domain idle state's
> entry+exit-latency-us, but rather than looking at what is actually
> available for the PM domain(s) in question, I think it's easier (and
> good enough) if we just pick a common value. Usually these values are
> in the range of a couple milliseconds and in some cases up to
> ~15-20ms. I suggest we decrease the timeout to 300ms and see how that
> plays out.
>
> Also note that, at this point I don't know of any use cases similar to
> what you describe, where the device in question is in an irqsafe child
> domain. Hence the polling would not be done in an atomic context at
> all, so we should be safe. Anyway, if this doesn't work we would
> simply have to limit the support to non irqsafe child domains.
>
> In regards to the parent-lock nesting issue. I don't think it's a
> problem as genpd_wakeup_cpu() is not being called recursively, but let
> me double check this to be sure.

Confirmed, I could not trigger any lockdep problems with my tests.

If you are fine with the above suggestion for the timeout, I am
thinking of amending the patch when applying to avoid posting a new
version of the series. Please let me know.

[...]

Kind regards
Uffe
