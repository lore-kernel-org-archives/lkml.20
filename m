Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555EB3AEF57
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746062; cv=none; b=mmYOe8iEFDaqr66cHVybSirW0uhzQlk1H0LqkQn9UrFE6x3b3azrXJfSmynlaCXxC5X/8B3H+VW7kgdAX9imML9QWeN0xQTMuHnA8DyUdUIuU1BDyorkF4TomeRZTzHPIfvCtRCLpiFlQU+ckg1LUsbfkaqr7p1JXqfmTPmc2qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746062; c=relaxed/simple;
	bh=xfDGpQNGJre9u7xiddz0LBjMkLCm7TSvQ548tiK6mr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVo2MGqsBHOqMvZ5rHv8phkohfTiX4rcIE35EfgGTdeZ+dqpe+r9GL5DISIKPTXMqrWdQ0Dy+Qhjf1KHZeanadzl8cgptBJ1UavJnTqOJFKu7PmqFBOkuvbB1081xHojRefiVTid2AaNq+HGL2noJHkQD8gdWU2dtZ6JHVwOwYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lv9kgHdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjdjGzf+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lv9kgHdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjdjGzf+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U3VfZG1887822
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9peh67OgvZH3C1vmA/mVc2eb
	alFa6I/ZD9JE1WMeqWA=; b=lv9kgHdELLTnFWB/RCoXHZ+ckoLtE4Gvnd89SOKl
	DOHMU804gJu5pbnNHSd5hUkrpT71dbEJMosIBHuiH+8pOjLSPDLTbpUzRwo5f4Eg
	+Kz0cpYOX8xHiANU4q+qeHk6el/q88mGigLokisJS8DJV0s1KJ2jx7pPrVPag+NR
	Gc4pBaSl6A9mdQEcBolGD13eFJKL5RQZGqLx6kCxQnsTcCT+kEYEdN5EYJUP3KOr
	4HwvjpL0NxAsW85tNIuzWzgjcs+AqRdAyoyNU7JDyFwyIO9YkzX9ucDRBCTML+4I
	WD5ZMhIQ36OrQIqwpEF22wMy7+oNIr2u26RdcFvgYGK+rw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn0dgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:27:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso7314103eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790746060; x=1791350860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9peh67OgvZH3C1vmA/mVc2ebalFa6I/ZD9JE1WMeqWA=;
        b=SjdjGzf+IOzMV6hD92icPqhCpK2HaRagWltGkgjnIihCa+NxkD4iMdy39Hj1bmGTO9
         8F/M7inrXT5RqvORrEwdzJfz4Qyp4PTAwteInkFrgc0TCygdianH+8CFMF7TbBXj6Oyx
         e9dismeE5rXdRZhOZr1rVUL6j/EfrfmWUVub435SMuGZbgfisAxSycasu9d3xA1v5tlE
         0ifu+DWWQj2pFuUy0evyU9wzhf6OtYKWdX7GhGB3qQBwRfHsP5NwT4XRCh6OTCf9p2Yo
         BIK8l3kkJ/8Zbwymxt9iMEe7o7/0Own1NrdoKRnZpbcQjkJlwSJsW68nDC78SgJ8SSF3
         +igA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746060; x=1791350860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9peh67OgvZH3C1vmA/mVc2ebalFa6I/ZD9JE1WMeqWA=;
        b=keDQ69eB5aoy4wiQdkXXU5gYMP4SNhEriitGH4FrfOBCXijQtXus4mvtSbGJnt/F46
         55BPq7dfXzAPmy5p7Jh124AtNGytuSsUTWsxjSUGPNSdiprPrruVBVIpvv5ZZYbi3MhD
         VL6lXxqsexcPVutukJUeuqpz9j1guLoYtqMrO2SSkf61CcQCCRVl1g0hQF/fyxPLHqIs
         hAwhSBxPT3EQTjuXuM18D0i/CxUVjtdIf3TTH59QUGkZt04rO64a/RC70+r/UYAdlIbT
         in8PTNmG0MoY92YHzlJk4RL21AUuuJ8FFfhOaxr85sAL7qB5dOCgxM2ZC0L94rlPgarU
         3XeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXfUCgNG6S/z+BtDM7oxMX7svxy4hoPbrKzW/2UN+X0TZKdA7EoskfZvfj3Jf5LX1LJSs4FeVP6HzFxi0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhHdO9ve2DfbsUigQZ0LbOngsl6IqwWBRkAZOeIzE5D5mosNsP
	O6YeYZ4MMyDpNmClIAaigvUbeahFJuR191C9FKuQIUSEaGMElCufCNfeKyRdD0GbtFgAGStDag7
	V3O99RfcTWuvAoHsbWxTOlZSWtpmnrXfYRo7K1a+xg7g2+q3vLHa2t3EqiF5t5oH6pGk=
X-Gm-Gg: AYBFou1+Id3n7ap6Y/0GBnmYbZBPMHMpg8f+Z9GlN7oCSD/GW9EP/SkWyycRNDRhcJL
	5ReDdzXGituh5eesK9NMbwexnNNO9bmoKz5CVjaR3WaJOq85MNYLV35Xa3b4EgS6cT2RUy7ILpS
	wbpupft7HuXg8rqdcCl3f5jRUbiGJXww9/WFz7kqnfxaiEjZtcd0JU77qGwB64gUhEZsWTwp2mT
	A+iVJAtRAU7A9VkLuTrXiwjRn1e9jneF5xRMPDqMeeqhaPE7TV/t2smZVCMMEOvFAxBhyk6Tyjt
	9esGGZKZOq4MiAhFC70ANdCBmY8/UUgFWYPV4Yp5+yphgrlozmuqEAsj7BZqM6gxwtq9JLdJ+QW
	wDKjC+cSieVuTV+U9h0dGKkfQNF41ZTHBtpMkZm5DNZYN/+dDYeUwL/1LL7QPdT9hdcs1pBbmQQ
	2MKmPL6YEDaPV7LlnQU5p+B5SpHzxK
X-Received: by 2002:a05:693c:41da:10b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-34cdc3c058emr601493eec.21.1790746059615;
        Tue, 29 Sep 2026 22:27:39 -0700 (PDT)
X-Received: by 2002:a05:693c:41da:10b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-34cdc3c058emr601456eec.21.1790746058891;
        Tue, 29 Sep 2026 22:27:38 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf613f093sm1008341eec.29.2026.09.29.22.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:27:38 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:57:31 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Message-ID: <arydw47qwT7jHVsV@hu-varada-blr.qualcomm.com>
References: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>
 <20260928-gentle-lemming-of-ampleness-4b4c77@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-gentle-lemming-of-ampleness-4b4c77@quoll>
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abc9dcc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=9ksu8lDKoU8JCIevmIgA:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: LAOAdgkiWBwu5BCBLY62hlupLgC9D4wW
X-Proofpoint-GUID: LAOAdgkiWBwu5BCBLY62hlupLgC9D4wW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfX4dCemKHAQIPo
 ++AWfAKVLG8LFcepSCIC+fr+E1gob1+2C1+iUfMr/bKrlr0zroQeMCCKIvQZTKt+BGx2fpgAj0z
 kZLe5A8cJSUfZuuHFV425GOxFBd6xgRnbyf8PT0jsmOAqZCVTL2SzxxufKxd69iQ+WCxUFeLHZ0
 Bugd+mPZY4n0SE9De9igYiWm2vR3A1LxrdcuT7OUk3jMNZ56OCwZi+aicKrVzpN+0pOz3EP/uyZ
 Fih6BdtOFBxsymLckir8F5h9IdHvaUvQGzCRRUY4rXqSOm1UOoRQHMOP/HngLAC6X7Ruio0GVn8
 zunb/VJtdDboZozo/qGBfS+Y/SW4HH9MHL1xaBXwscM/p+8MQRG+ls4Ofh8s9jwWkmbyWBrj8xP
 GExJP24eO01gAXplnEBIAkPuy34fXLZtmnoMu7zTAnClPCa10XuKWihQefkMK2m7ykeq3ySCAg1
 m+gcHQHKyZxTfYnh7YA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfX2l0mDDlaiq/V
 nN3D/L/Y2BZaPyKs/Cq3CQ67ElBO0dCu29lLtFniZzRPJwoSqbHO6BC+aM6Aoc6Bw+ElnrBNvug
 apY73WW4olndUWMOTbw6gBhPBp0uo2I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300021

On Mon, Sep 28, 2026 at 01:00:46PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 24, 2026 at 01:19:05PM +0530, Varadarajan Narayanan wrote:
> > Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
> > on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.
> >
> > One controller is connected to a High-Speed PHY, while the other is
> > connected to both High-Speed and SuperSpeed PHYs.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> > Add bindings and dwc3-qcom glue driver changes for adding support to the
> > two USB controllers present in IPQ9650.
> > ---
> > Changes in v2:
> > - Rebase to top of tree
> > - Drop 'usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core'.
> >   This will be taken care of the by https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com/
> > - Add ipq9650 to existing clock constraints instead of new constraints
> > - Link to v1: https://lore.kernel.org/r/20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > index 9f91c8711e02..a8fbf72c6375 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > @@ -36,6 +36,7 @@ properties:
> >            - qcom,ipq8064-dwc3
> >            - qcom,ipq8074-dwc3
> >            - qcom,ipq9574-dwc3
> > +          - qcom,ipq9650-dwc3
> >            - qcom,kaanapali-dwc3
> >            - qcom,maili-dwc3
> >            - qcom,milos-dwc3
> > @@ -210,6 +211,7 @@ allOf:
> >                - qcom,ipq5210-dwc3
> >                - qcom,ipq5424-dwc3
> >                - qcom,ipq9574-dwc3
> > +              - qcom,ipq9650-dwc3
>
> You had 6 clocks before, now only 5. Not explained in the changelog.

Sorry about not being explicit in the change log. The additional clock was
supposed to be passed to the dwc3 core layer for it to get the reference
clock rate. Have dropped that in favour of using [1].

Since '[PATCH 2/2] usb: dwc3: qcom: Allow the glue layer to pass ref_clk to
the core' (please see [2]) was dropped, don't need the additional clock.

Hence the change from 6 clocks to 5.

1 - https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com/

2 - https://lore.kernel.org/linux-arm-msm/20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com/

Thanks
Varada
