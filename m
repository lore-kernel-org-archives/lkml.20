Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA526426438
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978611; cv=pass; b=HJZXHpqii1J4WhqNFCddZcqbDDt9hz7kC6Pe8VCHt43VE0QUTuh5+ao18sApK6HAWcQ8ujMJm9cdu6mD4TXklyCu2KCqxhB4FAw/yr4J1cmhQ3RScr8gC/l7QSlTCRiPeClnq/B6NJ/JSyI4x/jsXQZ1dJ8fqGkHhGC6x4IU6kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978611; c=relaxed/simple;
	bh=q3EkqwdcLdgFV2VFGPbC3LNBtZOmLyf+gqDHedG+WLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FaCk+Mu6vWrueY7pI3ToFoa9CrCU9K2jEZKdiEEdj2CKorGJWipaKBP8vru3TYqD/yA9KrdSxLDIhrOWk+hiPnSWwcDntGX1/ffsxPKYMFVQBNNmqizpne3vDXakO1WT63Ol9qyoV7jQ3iyq6ugVo1fvM9kFk1T9suZ2uFbpw7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kESnledQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4pxSYk4; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kESnledQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4pxSYk4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7F313957083
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vx8dnU+n6phV57GfzrrgfQ2D/ZRjFORy9xJ5hSXAhSg=; b=kESnledQd8++Pdet
	j62TRILMBoyIcvS7lWMhOXOc3NIB5u3ny0DJZovb/7Y3qWU/fkIHUM4ZDyae/7qW
	7Cgt8daE9hvwrMtDaxVmqV53Dj9ibjoIUeT5DQTKhtL360PUfTl0tutd7I9wV0pJ
	mFYjzMXMdzYTimqKu26QbhtYRwb3exVRHvJrSF5x1HlIesDkuovAb/wVoXG+p37w
	6FAJJAgUDemBP/niM4BSmVfHUHaixVYDxDF8tiafzP62HH4V+pG5j0qQ5WxEYScm
	GGSHMx4FZLlmCP8kGDRodpzKQymMKpxHl0ZNO3hfA/FQPm75e9G0c1AIXyOvg7vV
	bYM4+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d07n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:16:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1bffc2eeso188736585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789978607; cv=none;
        d=google.com; s=arc-20260327;
        b=nz/v5rM5wyaegX0zi0gCNTH3MblsiUoyMxeBJxVh2XVIr+AUxF1gJleZQA6nNDTVKO
         8CUfR7b+GMARe1oAwNbQnXwkVwzV6e6SAXtpjWhybncEtoPRBBoVQ18uoDblTaw0hEvn
         1sdoQMdGIdmha9SDfrfsH47AGSme8mmX7uG9qxQMAVRxwB8aYfcStqInVfwzdfua0J84
         mA3HL9o17OvxRUzioRxmrU0nORsiuyut7PzhaFQOHvWHCv+pIWDZJyAZRAfM0J6GCdHu
         ny2hcptl+aScVKPtKVDReNXiWrOQz7FC1f3UttMJyj7+iUHP+j2xWxsTfYHY7lSKnWVQ
         CIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vx8dnU+n6phV57GfzrrgfQ2D/ZRjFORy9xJ5hSXAhSg=;
        fh=l3ag4OuNCk7zB3oXsS1ooFjzaBuvbbYKvjSBgoooRRg=;
        b=rN3SRFgsJtozjELKqEzkjCVHOIdWjJ6i6uFVhUHsqjhQPH6S5DPkdEN++AQO3hCL4f
         A2yO2JUvRonWQHJHTvlLvnwx2QISQOdTAbmttB28bIfB0ijbmcVgAfBaEDqrl9/iw2PS
         rUuUAKz9lxWBbR0xUW21xGWjTHESHIUTQVm2nYKzo3nCITZTU4srTmQ2i7bte15xr8MW
         Z7thZfLEDAOvIrrgdYpg5SzUY6MA/aDFEu0L8VbxsiFgDLpNKeknWGk9hmbxVFTgK6Hm
         xU/wr3ApHVcsISXgvzdKYmxr+KHxe1OoowkvMkTc2AyEPmYxC1oq/NucOjYXGu5J/aNE
         nsfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978607; x=1790583407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vx8dnU+n6phV57GfzrrgfQ2D/ZRjFORy9xJ5hSXAhSg=;
        b=Q4pxSYk4mzOJtcchWS+0LzAiXerBnzDJRcDq8gCvQnz4vXhL+RmLh6T+ju+Ocljjla
         UyOjdycpqbYJnlek6dTTnGFmWBfHk51EIp7ETV/u9oM/IIgBPc/zq/wZdrlNhKJMWWXm
         Ib/u/sMwkulJbO6/hXs8eTA98d5a2Z19k7tPkXnphOB/r9UGN7PrRmONUuaRUgV4T/eR
         BjRQnRmRAG78cJcmGImr0qnVHReAwjlcXepVt3Vr3wu1J9TLnMlfooegI/ngrY+nyg17
         ae82mEcCf74fg15Lts2EPj7h4cIipGUhDlqa4KOUZOdEDFFhBkllytpIDozFnJgL8n8O
         r0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978607; x=1790583407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vx8dnU+n6phV57GfzrrgfQ2D/ZRjFORy9xJ5hSXAhSg=;
        b=EHbpcjnIVIzoevj+woCzbw+pb4tZ1LX0RlKszdhZCTlSDv5CH0XM3HhZzt7xjNETwx
         8iwqiOAjncbNVKzrk36FS4j7qqnkS3kZWsFC0vcTWLMLaPH7ET22BtkC9mCk1L/+4MkN
         W+N3OVsgvarRzeoC95p1XUobwbJnUP6F5G9XFri0733eHL317M9FYuC5NjrO1HWgQA25
         xQ4Yxhv3kOst17fQ0a5BkuCBmCEXYXEkfncaIR8zjqjuzAACNBhsOgQR0/sqyZaor72u
         1DsjIFnpg+AIaJ5jPsFXx7eqNx4/KpPh5gJ0aELvlgT6nUQv/hK2CuKBdR0QvOfPpKjb
         nKHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3nZE5GEK5DikzgO3Z3op2jDslOSmU2zamcQvtRaq4E0iitQZhA2RPKmQJd4Uho7RKMDIVsEyszCw9p4g=@vger.kernel.org
X-Gm-Message-State: AFuF++njdowaI+KLHMlLR/QR2f4EdllQzolkdTDmesy3lSaaZ+EWsohS
	1a1hb0W303OuSBUCdVEfNUWobfTTL5iE5YpMhbq3R7KOQ9vR0qCyeS+gK36Ht+FL09V6wmO93Qh
	T5c1ylyANUxJ+T/gFLQwYgynRZXPMFm8j5XueTgsGrR5sMhyLBQDH3F4tzAZcqNlwP1VVpiW6s2
	UviB7XovcuN6t4rP4fbdXfpx4GZlKQ07Bbisrjjlu/yw==
X-Gm-Gg: AYBFou3hKq955tFsY9ac0cIS6hGu1MmEYRUBLkUcxVsykLpy5Vy/dyQ5Xq+XSEini8D
	TtLK05oJZmVgJ9Vb9xGrDZzbEjTaFMbrOU7FyG+JgQ526n22fHhXorn9rLCdOMfjlYDlDrPLyiL
	ymUOmXPYXFZXBl3OZAm7B69OfEAf/oQR/fRmiDTC/Mhwl5lrrVKigq7rnpXOl5N4Vu5/BHD5R+X
	P13wkcjgNrsC2cXmwBXV6mtQ4bu/H9p1274io+50DTHGwDAMBF3xbIE02Oex4ICNDlhXlIWJiBa
X-Received: by 2002:a05:620a:2809:b0:92e:bd39:9993 with SMTP id af79cd13be357-93bf55af058mr895548585a.31.1789978606926;
        Mon, 21 Sep 2026 01:16:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2809:b0:92e:bd39:9993 with SMTP id
 af79cd13be357-93bf55af058mr895545385a.31.1789978606550; Mon, 21 Sep 2026
 01:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
 <20260920-qcom-bam-dmux-vmid-ext-v2-1-ef5ca2178378@oss.qualcomm.com> <20260920-humongous-raven-of-charisma-bb99ed@quoll>
In-Reply-To: <20260920-humongous-raven-of-charisma-bb99ed@quoll>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:16:35 +0200
X-Gm-Features: AcwNN1VVhQqlVhKk-jGl48O2Ddr1iFZHmIKcpsImvO5gypb5NVk-JoOt1_b9g5M
Message-ID: <CAFEp6-0juFLDxo6kCTf_RrHv0EAevVqB3DP47=fg6PBNSCDcbA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: -x4Lh1RQRyYDgcK1ClQw57gIWOwTZsiE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExOCBTYWx0ZWRfX0baj4OIfAbG7
 UBwa26t3yCQzZ48oOQ7fCWWWZhvXd8F1B5ET+ur3tuZuHMyNpHn8ycgBvY220NeCHXJgWMUDEdN
 /P+dL5mPakwiOj1MpvjpyUtlPfu+p2s=
X-Proofpoint-GUID: -x4Lh1RQRyYDgcK1ClQw57gIWOwTZsiE
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab0e7ef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=p3HfQXL-393XT7cpVekA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExOCBTYWx0ZWRfXwGhc2u/lH0th
 Q1KFm72CA6Bt1FqOvlMpA0qPvdXURVtKpACkpa+kpvTNJej39ZRL0MXA3wVSl7JeBcqecC9+QZA
 p2hiSRGKtb+dO5iQtWlKF2HN0Z7BwaFbtu3MC191IOURrnlFjkTetp1IbQPyhwXWn9TsJP1WxmQ
 tMniLeIGDW9Xu/H0756Q+MfD8AMOFjj39nnxd7GKvCx5HrraPkIh7fe816IDpnUb4Q03DfvSCCw
 MJ2j5IGp9ExpVBym+U3yw+3Prs2vz+NSRkfLXlkE4h7ppZCe3IBleQvNvzLdB0/LNZhS1Zp9yw7
 R+Weom70fTr6W6uVwrk4WYyE+RmGxKzDPxIt67Dc30O8DhWlCKpjJWcVTWutV5OfFNB0i+EOqPd
 V55Rkq1AopFrKwvNC3PCizdXjK7cXa2CUESJLXM+eymXI5mRebUQkSHwxR2F3Xdz2rCjBKcizM1
 wWfCdWLwO1goFRWbkxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210118

Hi Krzysztof,

On Sun, Sep 20, 2026 at 12:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sun, Sep 20, 2026 at 08:32:29AM +0530, Vishnu Santhosh wrote:
> > Some Qualcomm SoCs, such as Shikra, run the modem in a separate securit=
y
> > domain with restricted access to system memory. BAM-DMUX DMA mappings
>
> Then this is specific to Shikra and should come with its compatible plus
> constraints per variant.
>
> > must therefore be constrained to a designated region that can be shared
> > with the modem.
> >
> > Add an optional memory-region property to reference a restricted DMA
> > pool used for BAM-DMUX mappings, and a qcom,vmid property to identify t=
he
> > remote execution environment that is granted access to the pool through
> > SCM.
> >
> > Require memory-region whenever qcom,vmid is specified.
> >
> > Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 38 ++++++++++++++=
++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b=
/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
> > index 33746c238513d72366bc52359fb10f275475b331..5351269b0ab72ede808ae47=
b55d57580af209038 100644
> > --- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
> > +++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
> > @@ -72,6 +72,24 @@ properties:
> >        - const: tx
> >        - const: rx
> >
> > +  memory-region:
> > +    maxItems: 1
> > +    description:
> > +      Phandle to a reserved-memory node compatible with restricted-dma=
-pool.
> > +      The BAM-DMUX device uses the pool for DMA mappings.
> > +
> > +  qcom,vmid:

I can see several existing drivers, along with a few ongoing series,
using this same property. Instead of redefining it in every binding,
should we consider defining the prop/type once in a common soc/qcom
schema and reusing it across bindings?

> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
>
> Drop
>
> > +    maxItems: 1
> > +    items:
> > +      minimum: 1
> > +      maximum: 63
> > +    description:
> > +      VMID of the remote execution environment that is granted access =
to the
> > +      restricted DMA pool through SCM. The local execution environment=
 is
> > +      retained automatically and must not be specified.
> > +
> >  required:
> >    - compatible
> >    - interrupts
> > @@ -81,12 +99,29 @@ required:
> >    - dmas
> >    - dma-names
> >
> > +dependencies:
> > +  qcom,vmid: [ memory-region ]
> > +
> >  additionalProperties: false
> >
> >  examples:
> >    - |
> > +    #include <dt-bindings/firmware/qcom,scm.h>
> >      #include <dt-bindings/interrupt-controller/irq.h>
> >
> > +    reserved-memory {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +        ranges;
> > +
> > +        bam_dmux_pool: restricted-dma-pool {
> > +            compatible =3D "restricted-dma-pool";
> > +            size =3D <0x40000>;
> > +            alignment =3D <0x40000>;
> > +            alloc-ranges =3D <0x80000000 0x80000000>;
> > +        };
> > +    };
>
> This wasn't here before. Drop.
>
> Best regards,
> Krzysztof
>
