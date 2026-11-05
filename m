Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793872442;
	b=rIKtnznmU2pfuElIMa1eW7BGOmEu9TEYZFAilRxVWGkJ5JF0Tv2JHfuvAZl2so6qgUjb
	 USImNYtp+WqhRSZvv4r+E5HfgYuA+qQ8JLwaYSjA7ImOSDebT9vtiTbOIfdW+gCjsKuPi
	 wW98W7tf2oHOzeY86dpcScY+zxJdsN7F/yDEfZo0/FpuZ6fVRMpcVjjpja6cYIrN5EDQr
	 vBvRc2TCB8UfEppa5w690NcCWpA8o+hUAwyD2SYrxuQNuC3j+7SgyoBsN2VI7UN9r4BMp
	 8L/SZGdSs4vdIkQAe6jwOxj/evrzgUTlIuH3w+/L5OKxlpEZt08aPv6CTP5YPXqIvVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872442;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
	b=zkDQ8M5Q6cvuMlZCO0aQAXPXMbkMU/Z95M0vKs6Pgf5RqN5rWXPPtQTAZNZsRj47sn6k
	 xOfTYcOywjH4nLVLgJVF40Pt8seWdyHMNy5cNicTlgN5O5E27Eb0K4m0LJ4r5wU+m/i+p
	 bgcq3W6PlGT1ucSuzUHq8faGOch3ssCxNwJNOXp2sVl4PKin7RN+82MjXm4K+12fAlBHR
	 BcLNIA6FOHvkM3RCpQdtSCqcxzpWYNdKiLz2GYEACQzGKityyQxIUO08fClXyKnxakL8Q
	 iTHzY00CYFcbySzX1ggY3edTAJ98IE1qsml/7UZAxwi6TgPs1J+ykkNt/IOfeGnZGIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PdS93n0N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwVxTQ+P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0831606CC78
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0831606CC78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PdS93n0N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BwVxTQ+P
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UA3R565192
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 09:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=; b=PdS93n0NNgqXZtEt
	R57dBU/Xr1B99fPEJdtDFmIU0VEwhIhsMe9LL9F1xyNed5u37biEgI7O1Xv+9542
	mtaPlbXp+PhrtKqdh8Wf9I62/m1pdaIUoPcpoB47n009CjqpwnzuNDr5idqiKaxX
	EEnFtRDdw27M7UlyyBgr5wd2DLhNb+KlPJqTuAMVf6MKkDhxYSEcWS1lq6bITnhu
	/fOfD0roldZjH4WsIl4d2BO8R7lnZIlDcOggr5g8CcktrZjFR8Q6ofgU9/1AFquB
	hwtr04M67SU4ZItU+DnKIDjlRtVqXYOuPzns7acCvaovHbdrhk+dJ02JtIa8j9eT
	1AfF9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq94yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:54:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso344863385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:54:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793872440; cv=none;
        d=google.com; s=arc-20260327;
        b=p52Ho5MkuypUmZpw3KyzeVbQBqxqTlv9eOIDX8cCyUaoT71qqdZO/AX2CrJA1XAxiH
         CCHeNQS0wHZWDW+uBfLjcjSiJs2fH/MUyDSyXA+ugnWOm9/Ugb2WSNgMXMR2z/IJGPUp
         iAZUr2wugBoBwR0L0uQkJsGZcAtMbsX41IJWwRlFrW89YYvQX+PNF0d16IIB924Vllx0
         7u0H5RZkwzd3nsh14BY0H9yYlNIoAbWaeeTa7wfUEVcqziiUJ0l7MCvYmPEBK+57uAbA
         E3xSfNGqVxtM+Ww6STmjajNH0G/6yuqUkKxNp1Y6uKlEy4Nrl41iah7Pnae+7ZEjAN5D
         IQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
        fh=tyLdFmZIvnzdOSrWqno+OFs1B1jdmNbqiWVJiYacaXk=;
        b=LT45AAbOonZ9LxypuLHLA+iEnlgVchJ+m5V6W8RyUXOp2WOENHNNd3cDgVg2gw5+Ia
         7rEdrTDnXgdlooyimL9At8H9fT7Cax1dCdjg4WTtym81maqGo9lmBRexTc4wlH1JzFjB
         2G1xw7GzS0nm8XrXueFyN+MU8341yPbw+eP0528OMgoR78v2bWFSd5XZagN1dadJg9XI
         AGGba9VIeVbdxHeuB9NXrPBoi1rswbmGZVsRFkKQgFYBWgbKZ/7iOl4dzL0s8CF2yJrG
         Hji4hBvjF6j2YH9HkQRZvsMzbxMUp6QpcfgnqvLUzRDla8EGLpSho5qyycGzLs/KVHjR
         shrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793872440; x=1794477240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
        b=BwVxTQ+P1kukm4ZK5AN8CpaHVyt0nkzFV21eOEUi1UdmI1cnfPrRf2Dus/7xz+/5wn
         l0aUh3/IPg+UT6m7LAnh22DL3XNlj0FJieUFCFQRlF0UzNI8EvWo40M0ITejx3PfDuMh
         nLTSmPSC3Mm2T3Q2fi8LPkdlefer6BL14Fp9OlbzQaWIucSmzyRzJIBIkh8rwfRpiRQs
         VP6d413BRPvH0ZhANSo4i/1fmafzxfR+ZRyU+ybruG9F4DIKw+NVkpM0VfLrPMy3Mqu1
         0OFeB2BHCUq/lv6El4uqJiHFcnUaebQNK7HxwD7HhTTT5OqrHjIqAQRvHmelGJ6hLkQf
         1Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872440; x=1794477240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lsc2sIu7G6+2Pz72oVJI7sNPp5bc9+JDQQDPTBak/C0=;
        b=1tmcJ+FUn6J8pmgOgnfx2DOmWbtL/Q6k/sXaHOpqEYtpSBiZwVejTs6V8bXQVYsN/G
         zThnAEtBX6/N8F4WGGbOLs713mxHBn8YO7WynkqvuQsJXreZXJCJ/HbObP7JIb0TMvId
         tsNg2NwvhY77vlU+BrT53m6QANKrjTDLGdVCSqSBS1b2r2tdDXgnvSiopkjtfOT96qNN
         Y6mgkGEkUiLEh9DFgNfSsIGM9irPTSUBAu+kgGMUQnBOYnC2UY+5Lmnhl5p4StScFOdi
         ulPZpz4oSMHP0uE4uxxVh6FKRTt/ADE23p4zXe6ywjcEP9aeYuEQrCPJDjlF1z37OmQi
         dNyw==
X-Forwarded-Encrypted: i=1; AKwUvByzqnBZTEZD2jSvuma8jtFQgB6/rXOgzOzglA7Kyzf74jLAOPG+yabQU1uGaNYMIUccVqWO6wvyKo4hAOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uARQ70DOjnAvPE/HErg9pV7Fkc8B3zMaCPQG6zQM854yMi+rP
	KgsaMkAggCPx81yfaR8fOR9uP8ZB0a4JYeTX2JSC7HNlFlONW7TBjDbu2hinEEg3JO3cV085kd/
	nJULLldqgFgE4UvxZoXkdVgX27kf/s5hFDvEmcYkzFvZBLPDSTp0JL8M8yXszR8A7ijEs4lNm+w
	cpIMC3xZEbqHKgqW1Wzvm7J79vAbhu8W6ONElLdI3O3Axi6fdttJ0U
X-Gm-Gg: AYBFou2XtJA3w1nZ5CrVAEdY8KJRTzVGHo38VXKop/sDtOVGIAgzHOJtPNXIe3oOVz/
	SZsnpVXQKgru48tqkKyQYuBQyyxThJMU7d4Gx1+RJcnDgnTmzc9n4fAYtfSdqfu8VxVB0+gdx2F
	AMu4JW7VdAYqnsvl8kamegIm1tffiN+hZQ22fajhZjqILyipwcAlXugmKowRq6VFd39qVEZYMnq
	E3uIKLR/dJfctkS9OI1klvnAmQRWOSuVfAeNGYM2GPY4f1ZrXnDYzcg8xgEZyu5h08bVOpfc1U=
X-Received: by 2002:a05:620a:2852:b0:93c:771e:b672 with SMTP id af79cd13be357-944217ef445mr2800702485a.54.1793872439930;
        Thu, 05 Nov 2026 01:53:59 -0800 (PST)
X-Received: by 2002:a05:620a:2852:b0:93c:771e:b672 with SMTP id
 af79cd13be357-944217ef445mr2800700985a.54.1793872439407; Thu, 05 Nov 2026
 01:53:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
In-Reply-To: <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 10:53:47 +0100
X-Gm-Features: AclHuK-5GKF2Bn_LCpwzmtoIhVOQ6DcYBmDOLa-YjfFfGok3ouqIdaX7kcvwdAM
Message-ID: <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: kJGMFzmqzwv7kcg76p7bvKLyP7brLN2O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfX3BOiIYRex0+h
 rBTCmpS9jcangJAvyvBCIomYok9zcDR0wTh/5CbbdhhhgDdJynNyG45gzueOPsnDH8is0GogNsI
 z0eXOEwpScUsWWN1PVhHuWn19r+OeOM=
X-Proofpoint-ORIG-GUID: kJGMFzmqzwv7kcg76p7bvKLyP7brLN2O
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec5238 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=pbMnnzsb4hIrvCsJLMwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfX+vKeX+W+B0nT
 R2IuI+KbbSXOfLNhBNGsLgSSRzhAwqlQUpG4f401Cobz/zIX9MD4369V9YVwPUcxRCkovmnn4r9
 Ud9NS0jJ5HDT0l+qXTvP63g3oJAKbrjGY/Z4vIIOcYCfi5IR/nlZAEVIdYhVevBb7eapNDBsHAQ
 NUNCyIacHeQRwr3RRa9+Muxs4tNzJ0aOuebr+2D77DJEfzGoe6vC4+apbW0tiefjSQUA4u+MF+h
 MV+7iFo4l1EubUuEOsjuTYUYLm7eh3vG7HaNjh6We1K68+nFkvquPCZyWPV84u3zIALq8qvJZHt
 sun1/QfaxH9ynE5fwgZpozV5W+NfCfhfMCIbaDBsQs01Y406fiZNfUORH5mUOouVlPsllnA+Miu
 TjBPgjtZRzhAwGUUESooHDL1+kE2T+j4w/OCa6em/XbKtoQVtFeycRjNqavADY/wB4nPsn4piCL
 0eSasDMkfNvwFk8/eQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050039

On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/11/2026 10:18, Nihal Kumar Gupta wrote:
> >
> >
> > On 05-11-2026 13:03, Krzysztof Kozlowski wrote:
> >>>> What is the problem exactly you are solving?
> >>>>
> >>> The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
> >>> graph should describe it as port@4, not port@2.
> >> Nothing like this is explained in commit msg.
> >>
> > I will update commit message to explain it better.
> >
> >>> The previous port@3 description only worked through the X1E80100 reso=
urce
> >>> table indirection:
> >>>
> >>>   port@3 -> csiphy_res[3] -> .csiphy.id =3D 4 -> CSID selects CSIPHY4
> >>>
> >>> New standalone PHY path:
> >>>   port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID sel=
ects CSIPHY4
> >> Then this breaks existing users, no? Anyway, what stops you from havin=
g
> >> there proper mapping?
> >>
> > No existing upstream user should break here; this is still part of the =
Glymur
> > CAMSS enablement.
> >
> > This follows the earlier discussion that CSIPHY4 should use the
> > CAMSS-side interface index as its graph port number:
> >
> > https://lore.kernel.org/all/CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+=
gBT67AdQ@mail.gmail.com/
>
> Should use? Since when? Do you have DT maintainers ack on that?
>
> >
> >> Did you find any existing practice of numbering ports logical numberin=
g
> >> in this device, but some other logic coming from datasheet? Where?
> >>
> >
> > Glymur has only CSIPHY0, CSIPHY1 and CSIPHY4; CSIPHY2 and CSIPHY3 are n=
ot
> > present on the SoC.
>
> Then CSIPHY4 is basically the third (so @2 counting from 0) input port,
> no? Not fifth.
> >
> > Using port@2 for CSIPHY4 would require a Glymur-specific port-to-CSIPHY=
 mapping.
> > port@4 describes the CAMSS input directly and avoids introducing separa=
te logical
> > numbering for Glymur.
>
> Seems you opened a new can of worms, so this needs proper justification.
> Again, do you see any recent preexisting DT review which would help to
> convince me? I know I usually ask not to use poor existing code as
> reason to do the same, but here I actually want to see proofs of current
> accepted practice.

So some chipsets share the same IP blocks, with some block/phy
instances disabled. As a result, we need to decide whether we're
numbering based on active instances or on the actual hardware instance
index/offset. If we use active-instance numbering, then yes, it should
be @2 (CSIPHY4 being the third active instance). Alternatively, if the
port numbering is intended to reflect the hardware instance offset,
matching the register prop, then @4 would be more appropriate. It also
has the advantage of directly identifying the underlying hardware
instance, without requiring any additional driver-side mapping. In any
case, @3 is incorrect.

That said, since the bindings have already been merged in its current
form, we'll need to preserve backward compatibility when addressing
this.

Regards,
Loic
