Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793779761;
	b=kX4MH/acB01G/awvsHEMHy+GRy4E2dnRvpyxTpGaeSlE0NpBkjCTHrm9NJXkn55I7EB3
	 humiLPR6B0fDw6xTkp2TaWs2kiBJQkjXps2JMIAKos/Z5rWo0N7kxi+XWKFSfEpz5Ladn
	 0w3IeoRdiRU5KVAklId7H3+6hpQaVs7IycZxxSHb0h78odMLuZ6JpM3hLNxD3khXPEwAW
	 J4rxbl8q9SrQQs0GX9XNAJpFWtA+oaZ+q3U131Vzs9dInkdTCmK149hP2+eDuAOfSTl79
	 LquJLn7R9Jlx3Zg/6wnOOo9usTIZZm2Ks6Y1w5hb8VsOU/UcmbJe6D3tJ2WpJGkcwFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RZRuOZhvJ+M8UAjchgBjXC6213tCtv2f8+7YeeLXEsQ=;
	b=0dJa6ZS38INiMT6lKXszLYpSGr8Hk88371+EkymuWXQC3nggztY+RIAmP8AWodbtNdRj
	 mZPwDM0v+D68v5aMB3ruWvt+RmC63V7PfAVdy6KdI13FaWs03Tj6WUQHALR/8rumPK6fn
	 pW4N5VcD5kMwCfTu4ySfNWuUTfMMs0K6BxKRqCFWbuSVHgEFwEi0tzaQPTGwbgvHgDQMA
	 uuJswYel/hA+L8FgagLLy5LG3al8BjqbWAJ9b/fwKwSI7i1daE0GS8SY0yyk/C4jnoVce
	 oxIT/QKpnaIwGqRWpc3FTMJ9WxjnNR/OWU04cyfsWPE24VbbQRyU/TpTlCFd8KteQ4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kiNV4aT1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYMKMGJO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD92606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD92606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kiNV4aT1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYMKMGJO
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A47A29U809391
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 08:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RZRuOZhvJ+M8UAjchgBjXC6213tCtv2f8+7YeeLXEsQ=; b=kiNV4aT1KYh+5EFx
	eB6M3wCE0EpfzX3kQBv4YXabp/AtE2h9dZkR9sUgfXDP2cIZouXeOw5KA96xagjd
	UvthDoYOcgmv1lsrfKT4dHlX1LJyJ2dysAFSiE+j5VOnpI3OmvYBcRnn6CR/XCx6
	9qXpvcopWjIVQGpzoOrnzLnf4hjtvzjBZmcc3GyGs5T5FMgwYqVzYmHobeofsMJ3
	NEYSJik/c9pBls67QWJNxynCtry2+9AKU2VK9s8OdJwARUrlOBrQAHeYVsEvT0mz
	+Lzpv+txhSpGnBpOkV2NLftsGQ+EG/mFPeo9JCdQlwqArU2sgYA3kfplhWJZKtSe
	LX2CCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpbcjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:09:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso89379685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:09:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793779759; cv=none;
        d=google.com; s=arc-20260327;
        b=bCjk2FPGxgOomAuith53fet9Y0GIK+mYIafylVhB5yrMzGdc4bw9sL+UI7E49+agYe
         3rG0yuoNwALo8dFUW9TUakTaS/mbp4YFIQrbpftejyTShtSKIoMztwd5xO2+ikXQg8Fs
         WHOHojWdo3ccc4pn5NmkzCLxuTB6KFfyPXPQYB+jPXRxJBzcWmQ3F0SPAn8+4Pc7zSdg
         UhVHX2lnobng3/4IG0rvcd8Wd5OM/qVPhOPj5KEw+LjO3+Bk5LTRw80pu2yAN2cl4vG/
         lLG4jiHwqTUX1mt7mSgTNdPNgcC19Lv2W+gw3wylBRC3nn8mlK0C+kdHi+lfngCiHywH
         kuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RZRuOZhvJ+M8UAjchgBjXC6213tCtv2f8+7YeeLXEsQ=;
        fh=XHCHYvRVQs/qoPQaz2qgjLfq37Yo0zphUyCjOLrb6qA=;
        b=g70X6970VBUifrForr/Mh2wGGcpDw+IR/6qRpqnnDdonW8+9GL5kPIjuzf+JwpdcBL
         V83PgG5ci2jnM3i1aqFfNaV9/SqLg68MBlfD2gjxg71oEimjOdrG6Mp7K/vfelNFk6Ip
         FyScJpaeKJwl6HDLZzhmM0HTxRGti7NbLRLcCniIykg/ZaUsLcHB40qizCnLEX3OrCAO
         7WNgblixg7SSL85B+K2E6RvqU181GshgJgTCyooaUR3cAV/iJSHfQ9fvwOl2cerKUEPq
         NGeTW6AXxv73dIRYc0rzPgZ2kA2ZtcABrUNGuP6megvc/lzwgtQH4azBT+WydyLHk2Gx
         fthw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779759; x=1794384559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RZRuOZhvJ+M8UAjchgBjXC6213tCtv2f8+7YeeLXEsQ=;
        b=OYMKMGJOTNcvFP2pksDGBnXRktz46TkbpRKexrz9JapAhNKxhCUWjV54aTdvbFx40l
         ewqGIbgM3DVCV6lKoAgMz24UMqOQtKrgBYSWluC76Hs/g6KTxa07bmSxsCAJSFyyvQ9Z
         Fa++gfis8He+RsoPPOQQv2RT59v2lTXB48n6PoBUnRdmEgTyKiZugOnzmAj2JTejeAZH
         rNkpDlOdkVGsi1IJ0kiHYkW3w3iyisjj+7ktwdQ5KKSxqJEX/cIiS91vNeftetIi+gI9
         29JkmABNylnwuZ9OTnRfJAzmfnjatQm34gYmkk0bnfiywc6YMikOhB4eeayV5wNjm7Nw
         CmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779759; x=1794384559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZRuOZhvJ+M8UAjchgBjXC6213tCtv2f8+7YeeLXEsQ=;
        b=pc62E9LWpwzanqGvT6UptZNGmTJnLXM/M3wCXKbYlpswCJ0A85CjgyC0P7Tv3/hG/t
         GxlKsgEZ+KoBMd6TnyV50v7HqVsIy5mw7C9tEaZg1P2johCUjQMXdLWITC5Aw/ufdJwF
         HyojMj65z12sUTxVcoydy3iLi1JtyV3sDn1dI86MJRpT7mdOIwxMOr7C9cxzX+rO3YcZ
         WlYkQaLwAkob4IHZSCPG/ACw3QvDzdXLIXyjzB8xg4Z3umleXI8acP08FSwUXw6XJTG3
         PtnXK/Io38WA6YOs+mFgJBiCp3fKloB6BrGgDcTMe4l+91jbsThYbwu+DyALRDfzLbPu
         lFBQ==
X-Forwarded-Encrypted: i=1; AKwUvBydDYA+Lltw46Z5AYDaFxE6VZbVCwfnd1UYpcgyvskKSOeUTJ9H7plc1wOdpGLLLBqhFllyzN3oZoapmII=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iei9hTak5hQnhbi/w6yTnSOvhg9iwppt1/0tK4NT3j7hN8gFT
	S4ykqKLRaHGIEZu9Q8mKAVSgrJctIukS+ZGmueIiG4ICQLx4OinpTPVKMvUHyAoyjIsEZCVnHRi
	mPTJpFXvvDruZChpeywpgua/eWDugXSy1EXCC9GevswXGoUHll+/fPFm9temk5ksQoKbt7y6Akd
	HsjXsVlCqpCY88Z8LEUGeBANwLWg8YT0FXwK5S2aYIbw==
X-Gm-Gg: AYBFou2izQEeVnHGpqk4R+vTT4/kyvMhCP6syZgSBVMgIZVVRvHaYZtEvuU1/IATk00
	ygZ4uupmhxn+UEZM4F6aT8NL6fq/UjKodjx0LiUezfIoog8oZqFUexUhkpxH56qUj3Pcl4lEyYg
	Y0vN9R9ra5BGQnKMhjXt2bEL66idItdmj8PdZfAjgM0wqsIU50424cNW1qiqa1Wc2xMXZ3u6/u1
	KcddrF70m1EEDpnZeq+bc6ZEXSK8tnAKi20oNAsntn3whKwH8BxBqGe4xW7r9Pl4Np13rkrbaM=
X-Received: by 2002:a05:620a:4627:b0:93f:362a:a893 with SMTP id af79cd13be357-944217ee29amr2579092085a.50.1793779759033;
        Wed, 04 Nov 2026 00:09:19 -0800 (PST)
X-Received: by 2002:a05:620a:4627:b0:93f:362a:a893 with SMTP id
 af79cd13be357-944217ee29amr2579087185a.50.1793779758458; Wed, 04 Nov 2026
 00:09:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
 <20261103-qcom-bam-dmux-vmid-ext-v4-2-3690cc5ca0fd@oss.qualcomm.com>
 <CAFEp6-3iRLDJUHAEa4qGGcqJYUSB733wKBFDw_k5NF7LQF+jQg@mail.gmail.com> <ca063b2c-a218-450d-b28e-7bb1c775e7f1@oss.qualcomm.com>
In-Reply-To: <ca063b2c-a218-450d-b28e-7bb1c775e7f1@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:09:07 +0100
X-Gm-Features: AclHuK_qb6QHn3SKTgJyNyyRF7E8etXUIprr9JLQmofzs9FM6AEtBI0fw4N8r5M
Message-ID: <CAFEp6-1SjCBz5G-9YgJXTQsk+YU378AqZUh61cHrOpXxpR8AGQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX/um1YPqotDDP
 QcdutCll5drcKfMRbTSYcbj3zmw5/w8kQZTkL++tN31PLz76ZEi07kHqFFuw5heKfRuVbcy+nn0
 nD0OriKTsZGASqCX9N6GpA92l8gg9b6mxoZmtmD9iKQbP6ROMRX1y7n+mG9lJ+bnFQLoq41FVAD
 QW8M+AzaAaLOTWuS1Fio7lHBw3n2m4O8Vv90Ed+/d5mEHEoFwfmSFEVizTwiZEj93d8tZiK3chn
 BHE3TosSWXMlxSKzQjuRezBQm+j8vgirnjjZ1G4od/Rv/UY5zEl7vX6A75zfodzewQf1bKiEqTk
 0OqNOpxLlxkBySt3H+u/WFYovoyyXjN6h8Hj+8Jcyg4wpCvqps33esHmfk8g4fixrrDVk3rcBOX
 BOjBKdnuMbtPT0iNUbeR6vPPks654fddUuT9YSY6w/lJyiX6CIHEL3dkmilTIY5DyknGAnfxFTO
 mOqugixe1qOR7D1ZGkg==
X-Proofpoint-GUID: eO1Y31ARhqD1f0Jl-fGeCsV3V33alV9m
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeae830 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sSW3jX2S7Jz77nn5xcgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX1ZNVChTq0rqF
 MiHPaECS45qLmwvseW+APz2UIWq9X1RwKCNcVqChwxKz5NNmQjuYjQwlFOcVbq3W94wJDiM+3Tr
 OrXmqXI9UYgsOVTFHSnP5KfKaW2TywY=
X-Proofpoint-ORIG-GUID: eO1Y31ARhqD1f0Jl-fGeCsV3V33alV9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032

On Wed, Nov 4, 2026 at 7:22=E2=80=AFAM Vishnu Santhosh
<vishnu.santhosh@oss.qualcomm.com> wrote:
>
> Hi Loic,
>
> On 03-11-2026 09:34 pm, Loic Poulain wrote:
> > Hi Vishnu,
> >
> > On Tue, Nov 3, 2026 at 3:19=E2=80=AFPM Vishnu Santhosh
> > <vishnu.santhosh@oss.qualcomm.com> wrote:
> >> Some Qualcomm SoCs, such as Shikra, run the modem in a separate securi=
ty
> >> domain with restricted access to system memory. BAM-DMUX DMA mappings
> >> and BAM descriptor FIFOs must therefore be constrained to a designated
> >> memory region that can be shared with the modem. Accesses outside that
> >> region can trigger an XPU violation.
> >>
> >> When qcom,vmid is present, require a restricted DMA pool and assign th=
e
> >> entire pool to both the local and remote execution environments before
> >> requesting the DMA channels.
> >>
> >> This ensures that BAM-DMUX mappings are within the assigned region. Wh=
en
> >> the BAM DMA controller references the same pool, its descriptor FIFOs
> >> are covered by the assignment as well.
> >>
> >> Track the assigned execution environments explicitly and reclaim the
> >> pool for the local environment after DMA channels and mappings are
> >> released during remove or probe error cleanup. Skip the reclaim and
> >> leave the pool assigned if the remote side still holds its power vote,
> >> since it may still access the pool.
> >>
> >> Fail probing when restricted DMA pool support is unavailable, when the
> >> VMID property is malformed, when memory-region does not reference a
> >> restricted DMA pool, or when the pool is not attached to the device.
> >>
> >> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> >> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> >> ---
> >>   drivers/net/wwan/Kconfig         |   1 +
> >>   drivers/net/wwan/qcom_bam_dmux.c | 114 +++++++++++++++++++++++++++++=
+++++++++-
> >>   2 files changed, 113 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> >> index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c5623161526969814=
0187ca3141dfe48dbf 100644
> >> --- a/drivers/net/wwan/Kconfig
> >> +++ b/drivers/net/wwan/Kconfig
> >> @@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
> >>   config QCOM_BAM_DMUX
> >>          tristate "Qualcomm BAM-DMUX WWAN network driver"
> >>          depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_T=
EST
> >> +       select QCOM_SCM
> >>          help
> >>            The BAM Data Multiplexer provides access to the network dat=
a channels
> >>            of modems integrated into many older Qualcomm SoCs, e.g. Qu=
alcomm
> >> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_=
bam_dmux.c
> >> index cc6ace8d64371eb8d00c638a39b234ee540b83c9..c9639474e58acc16ce0d04=
f181b2e999cff42bd1 100644
> >> --- a/drivers/net/wwan/qcom_bam_dmux.c
> >> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> >> @@ -9,14 +9,17 @@
> >>   #include <linux/completion.h>
> >>   #include <linux/dma-mapping.h>
> >>   #include <linux/dmaengine.h>
> >> +#include <linux/firmware/qcom/qcom_scm.h>
> >>   #include <linux/if_arp.h>
> >>   #include <linux/interrupt.h>
> >>   #include <linux/module.h>
> >>   #include <linux/netdevice.h>
> >> +#include <linux/of_reserved_mem.h>
> >>   #include <linux/platform_device.h>
> >>   #include <linux/pm_runtime.h>
> >>   #include <linux/soc/qcom/smem_state.h>
> >>   #include <linux/spinlock.h>
> >> +#include <linux/swiotlb.h>
> >>   #include <linux/wait.h>
> >>   #include <linux/workqueue.h>
> >>   #include <net/pkt_sched.h>
> >> @@ -75,6 +78,9 @@ struct bam_dmux {
> >>          struct completion pc_ack_completion;
> >>
> >>          struct dma_chan *rx, *tx;
> >> +       phys_addr_t dma_pool_base;
> >> +       size_t dma_pool_size;
> >> +       u64 dma_pool_perms;
> >>          struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
> >>          struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
> >>          spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
> >> @@ -762,6 +768,96 @@ static int __maybe_unused bam_dmux_runtime_resume=
(struct device *dev)
> >>          return 0;
> >>   }
> >>
> >> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
> >> +{
> >> +       struct device *dev =3D dmux->dev;
> >> +       struct device_node *rmem_np;
> >> +       struct reserved_mem *rmem;
> >> +       struct qcom_scm_vmperm dst[2];
> >> +       u64 src =3D BIT_ULL(QCOM_SCM_VMID_HLOS);
> >> +       u32 vmid;
> >> +       int ret;
> >> +
> >> +       if (!of_property_present(dev->of_node, "qcom,vmid"))
> >> +               return 0;
> >> +
> >> +       ret =3D of_property_read_u32(dev->of_node, "qcom,vmid", &vmid)=
;
> >> +       if (ret)
> >> +               return dev_err_probe(dev, ret, "Failed to read qcom,vm=
id\n");
> >> +       if (vmid =3D=3D QCOM_SCM_VMID_HLOS || vmid >=3D BITS_PER_TYPE(=
u64))
> >> +               return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid =
%u\n", vmid);
> >> +
> >> +       if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
> >> +               return dev_err_probe(dev, -EOPNOTSUPP,
> >> +                                    "qcom,vmid requires DMA_RESTRICTE=
D_POOL\n");
> >> +
> >> +       rmem_np =3D of_parse_phandle(dev->of_node, "memory-region", 0)=
;
> >> +       if (!rmem_np)
> >> +               return dev_err_probe(dev, -EINVAL,
> >> +                                            "qcom,vmid requires memor=
y-region\n");
> >> +
> >> +       if (!of_device_is_compatible(rmem_np, "restricted-dma-pool")) =
{
> >> +               of_node_put(rmem_np);
> >> +               return dev_err_probe(dev, -EINVAL,
> >> +                                    "memory-region must reference a r=
estricted DMA pool\n");
> >> +       }
> > You later test with is_swiotlb_for_alloc(), so isn't the above test red=
undant?
>
> Right. is_swiotlb_for_alloc() is only true when the DMA core attached a
> restricted-dma-pool from memory-region, so this check is redundant. I wil=
l drop it.
>
> >
> >
> >> +
> >> +       rmem =3D of_reserved_mem_lookup(rmem_np);
> >> +       of_node_put(rmem_np);
> >> +       if (!rmem)
> >> +               return dev_err_probe(dev, -EINVAL,
> >> +                                            "Failed to look up restri=
cted DMA pool\n");
> >> +
> >> +       if (!is_swiotlb_for_alloc(dev))
> >> +               return dev_err_probe(dev, -EINVAL,
> >> +                                    "Restricted DMA pool not attached=
\n");
> >> +
> >> +       if (!qcom_scm_is_available())
> >> +               return -EPROBE_DEFER;
> >> +
> >> +       dst[0].vmid =3D QCOM_SCM_VMID_HLOS;
> >> +       dst[0].perm =3D QCOM_SCM_PERM_RW;
> >> +       dst[1].vmid =3D vmid;
> >> +       dst[1].perm =3D QCOM_SCM_PERM_RW;
> >> +
> >> +       ret =3D qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
> >> +                                 ARRAY_SIZE(dst));
> >> +       if (ret)
> >> +               return dev_err_probe(dev, ret,
> >> +                                    "SCM assign restricted DMA pool f=
ailed\n");
> >> +
> >> +       dmux->dma_pool_base =3D rmem->base;
> >> +       dmux->dma_pool_size =3D rmem->size;
> >> +       /* Track the destination VMIDs explicitly for the reclaim oper=
ation. */
> >> +       dmux->dma_pool_perms =3D BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_ULL=
(vmid);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
> >> +{
> >> +       struct qcom_scm_vmperm hlos =3D {
> >> +               .vmid =3D QCOM_SCM_VMID_HLOS,
> >> +               .perm =3D QCOM_SCM_PERM_RW,
> >> +       };
> >> +       u64 src =3D dmux->dma_pool_perms;
> >> +       int ret;
> >> +
> >> +       if (!dmux->dma_pool_perms)
> >> +               return;
> >> +
> >> +       ret =3D qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_poo=
l_size, &src,
> >> +                                 &hlos, 1);
> >> +       if (ret) {
> >> +               dev_err(dmux->dev, "SCM reclaim restricted DMA pool fa=
iled: %d\n", ret);
> >> +               return;
> >> +       }
> >> +
> >> +       dmux->dma_pool_perms =3D 0;
> >> +}
> >> +
> >> +static void bam_dmux_remove(struct platform_device *pdev);
> >> +
> >>   static int bam_dmux_probe(struct platform_device *pdev)
> >>   {
> >>          struct device *dev =3D &pdev->dev;
> >> @@ -796,6 +892,10 @@ static int bam_dmux_probe(struct platform_device =
*pdev)
> >>                                       "Failed to get pc-ack state\n");
> >>          dmux->pc_ack_mask =3D BIT(bit);
> >>
> >> +       ret =3D bam_dmux_assign_dma_pool(dmux);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >>          init_waitqueue_head(&dmux->pc_wait);
> >>          init_completion(&dmux->pc_ack_completion);
> >>          complete_all(&dmux->pc_ack_completion);
> >> @@ -829,8 +929,11 @@ static int bam_dmux_probe(struct platform_device =
*pdev)
> >>
> >>          ret =3D irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LIN=
E_LEVEL,
> >>                                      &dmux->pc_state);
> >> -       if (ret)
> >> -               goto err_disable_pm;
> >> +       if (ret) {
> >> +               /* The PC IRQ may already have powered up the RX path =
*/
> >> +               bam_dmux_remove(pdev);
> > Calling remove from probe is a bit unusual, have you checked that
> > everything is correctly balanced?
>
> This was changed in v3 following the Sashiko review of v2 [1]. The PC
> IRQ is already requested at this point and may have powered up the RX
> path, so in v2 the error path reclaimed the pool while the DMA channels
> and RX buffers could still be active.
>
> Yes, it is balanced. At this point probe has assigned the pool (if,
> qcom,vmid is set), initialized the works, wait queue and runtime PM, and
> requested both IRQs, which is everything remove() undoes. The steps that
> may not have happened yet (netdev registration, RX power-up, the PC vote)
> are handled the same way as in a regular remove: unregistering an empty
> netdev list, power_off() and free_skbs() are no-ops, dropping the vote
> only clears the SMSM bit, and the wait returns immediately if RX was neve=
r
> powered up. The PC IRQ is disabled before power_off(), and the IRQs thems=
elves
> are released by devm afterwards.
>
> Do you see any specific concerns here?

No, that looks fine then.

>
> [1] https://lore.kernel.org/all/178996250389.2160803.17277339384338088713=
@kernel.org/
>
> Vishnu
>
> >
> >> +               return ret;
> >> +       }
> >>
> >>          /* Check if remote finished initialization before us */
> >>          if (dmux->pc_state) {
> >> @@ -845,6 +948,7 @@ static int bam_dmux_probe(struct platform_device *=
pdev)
> >>   err_disable_pm:
> >>          pm_runtime_disable(dev);
> >>          pm_runtime_dont_use_autosuspend(dev);
> >> +       bam_dmux_reclaim_dma_pool(dmux);
> >>          return ret;
> >>   }
> >>
> >> @@ -879,6 +983,12 @@ static void bam_dmux_remove(struct platform_devic=
e *pdev)
> >>          disable_irq(dmux->pc_irq);
> >>          bam_dmux_power_off(dmux);
> >>          bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
> >> +
> >> +       /* The remote side may still access the pool if it holds its p=
ower vote */
> >> +       if (!dmux->pc_state)
> >> +               bam_dmux_reclaim_dma_pool(dmux);
> >> +       else if (dmux->dma_pool_perms)
> >> +               dev_warn(dev, "Leaving restricted DMA pool assigned to=
 remote\n");
> >>   }
> >>
> >>   static const struct dev_pm_ops bam_dmux_pm_ops =3D {
> >>
> >> --
> >> 2.34.1
> >>
