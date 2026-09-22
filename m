Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB32453D0AC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079650; cv=pass; b=pvh21fz9F9arbM44e1n3qKJRx2OBRwDXV8facnuCwj1yczlCxH4zl7lereg4oXI+Gm8lR1w+LalxHQANjI6soLtkHOtX7sXmgXyNe15gYpyyihpx2zC76XAj+7HJk9D5fcbfbJo4U5ievX3WBBxlW8o6aN7HyFFNepsQ0texbvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079650; c=relaxed/simple;
	bh=MSdsTB8asp6sbX+GEc7UhobdmE9wd/t8j57szPiLqh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ik2jXB/FZmgoVPWcfVkisBKWrOGXMHaT8x/Cm2QD7/p5ETlCVdN6ZvdHdnicaVdnbuUq9Bx04eGRi5w48j2kHhAmhnJxUx0JrokV8GJRTqwU5t00nPZecIdwl6deIkcraTrfBDFXu8/8ni3nVeQDajPlpnNvlEG/WBP07qhixF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8pVw0Hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVnWbDFi; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8pVw0Hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVnWbDFi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBOu8F984473
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+05yLhpdjxIjVjNj5alAxW0Kp4QLw+qzcHO01XuOZE4=; b=Y8pVw0HyVHJ7coKM
	k3sofOBeQp8+A1tWooBMhmH6659wA72pxymQfJNeHY4P6/Pzn4Bg4JEL0P/1AGCk
	xZMHnhHBhci/6OggyqWoQnnVa0PH7qgKP3/Ln2VhSgjQv63mNOhoV6qeNerbOh9Z
	yqHd5foamo6LwbwkrcA80SxABzi31nLF91XWV+EFpMW6x15jsQj6rNy361pT9oAu
	6MIayiHAZDU/BKA4LDDjXHzsidYTIw+ZEWRNTSBG/h4I/hQHXkCYNI3X0jHuqOV5
	Uwz+t87gBXgPMBDV8tNOoF6TlY8fz3MavwroOVv70rVR1W3hm3q1fo42pYcx7vu3
	U/iRww==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4rg44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:20:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so5451058a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790079647; cv=none;
        d=google.com; s=arc-20260327;
        b=heL0RIZ9fnfWWYaTtH+KaFiVSN7TT8VBVjfxEccNenvGaIMeHWyQWJtPIv77YbmW81
         h71SpiDbS4UfuTn7uQtpoFdltOprEpRmOPYN/Pd54zb5XwrO6WrokYmvi9Eo/voLEyve
         bRMZHtnhQaB9PUZeljlYFbk5XDLM6Uj3SUD956Nh3Hqk9KkRnzGZwNf+AGNKh5VZDxnz
         G0OiwR9n8n8uJ4prGPyQP5MkHglw0onEXGgjBE6fc2838WnwRLiuxd+caYg9N/cgAQaf
         jfeyxA4IbNcdlisFRj9T80zYmjjJQY0SLDGdqCKu9RriFvQeKoCZc+4ijTKXwuUQ6a+X
         Shlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+05yLhpdjxIjVjNj5alAxW0Kp4QLw+qzcHO01XuOZE4=;
        fh=7rOpy5D0oe3bJzJVnL10m9P2BS6s7vBJLitFiD1my8A=;
        b=A0wcAsBrcJZXIaxPhmeycjypKEWIoiQ8TcltYvpy5yih9NhjlkC4aWlO4ybmQrhH2x
         Sz/0xf2G6XGfdEdEjpPXoluYWBaWg/YZd+ux8oMn9PdVVIDt69Btt/Vk/tx4qGhYLciO
         yM9aZszOuYDukqVOszzN9WJXzL8dxNTwi0DTptXZpmxZ5GsoyoeBAHb3qu9dIMMvtuUC
         rfeKsxGR4z0LHPD7ySoX3JrG23SgEa8m3egRP91yFheZsXP9h1ZeTqu52BpARdMqtWlp
         zmhTQ1aV3FhleNgdy1nylxNRDGD6sMMQMHvqhz7QOYm7sT1gi+OhkILG1EIs46rQ0WQb
         wSlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790079647; x=1790684447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+05yLhpdjxIjVjNj5alAxW0Kp4QLw+qzcHO01XuOZE4=;
        b=JVnWbDFiC8Sm4sXt14cHmFMJod3cF7+xJIkYEEzznWA9z+MMd1c1J+dO92fej1Cabj
         rqoAeZxvxTUs8//gGUSZm3G5Z6qZdr8xlhjmYe1WQNNA7bCPfJQoEKeavf5QI0bL+oZd
         DgC8XzTXxtacNwLC38JvJose6uMMN11Kp0R0biFw0d8F3eaiLUAfiBVWBaczPgBFkrwh
         6D0sUmUlQvxQilW+QvXFMqWv6KAiA+baGv7RIs240QlkUobVh2U7yJw6EsH1wuZV/c63
         77HiuMgJ0EYQhLl/YzoLc31PLrgN8sYUmrsUTYHmo2pMcEwzkbEVxqIFB59UdcVgQOgG
         BvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079647; x=1790684447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+05yLhpdjxIjVjNj5alAxW0Kp4QLw+qzcHO01XuOZE4=;
        b=gpuLtzuqa/DfHO3oIqTAK84pFaHnWvPYa5SV2+B0JMOmG4kabGiF8Xc0V2iYUOUJjW
         EmMC2mPLOdC/XD/ZksxxIGjqQrpKBUpPUnIzExs26/QGDeyWCbIqEsYJU1nV1XlTBdW6
         KN+ubJt8PzTLpVxMv1scSv0m2fG3uDx3M8o/pNcYc5MGqAhBHhOT8zv2jw9V5ySbAet5
         tF/s2levtpeY/EhEWjwdeYJUwOKKuAhmE1yXgjSeyl29d3sFKBl77BjlsQxRKnvMfs+h
         8rVF6yUduouE8AYFP6ll/z/eKK2qumthv4e1ZeDrPpiIuSwLtXCeh9PH57skdXd7+DSb
         yspA==
X-Forwarded-Encrypted: i=1; AKwUvByn7pkn+t/hreg6kAjR36zmd8DDARbdQEf758w5YCyrjlZ0rFEuSDfW0uMtwB481B8L1K/xiWDT+dK7lQk=@vger.kernel.org
X-Gm-Message-State: AFuF++nsk8EbkuFTng19rSgtzmLcc2fVwv8vVZQEZoM0pJbgM89jiXG8
	VCX0X0v8/UyUgNYOsNAx+C3k1+QROSXC7Rhw/NcovK+l1b3nyo0c63MiQth//TDXaIExexOG99t
	lRmnjJvXQK3QnkDDeP5G6meE+tf2Ofd3Lu4oUWNpxzr8phcp0AtDzU/x/xaf3XA2t+qrnPa7LSZ
	QdNdErOh30tCxjDeYMI9f1HWvWggw2IBAeTuCxeiNutQ==
X-Gm-Gg: AYBFou2gpW4LHqEV38WZkoNAbHYNxP2B9Y/wN5xEtb/dE1euxIF9K+HGNmu9nnF81um
	BmzFLjo1MpeHISzHNUb70EHUVFdUd96R4nCXDYe2cWe6UYGX0PpIRezTVFQ8V5sN3HmaxKQcDeL
	3b8olv0FysCNxRqS2gUsZR7NC6Uf6eZgycK7KaeDNslsNnB0dgDSQyJQOHxA==
X-Received: by 2002:a05:6a21:8287:b0:3dd:ddbd:c5a1 with SMTP id adf61e73a8af0-3ddec1bb561mr1447631637.0.1790079646796;
        Tue, 22 Sep 2026 05:20:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:8287:b0:3dd:ddbd:c5a1 with SMTP id
 adf61e73a8af0-3ddec1bb561mr1447597637.0.1790079646271; Tue, 22 Sep 2026
 05:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831090134.585588-1-zhangfei.gao@oss.qualcomm.com>
 <CAFkd8hth1ds5j9jbe3vjjpCYkbTVSeTiVsQvzy30YCyFUH83ZQ@mail.gmail.com> <21aff47e-07cf-48b5-9752-b1a9dc7e6095@kernel.org>
In-Reply-To: <21aff47e-07cf-48b5-9752-b1a9dc7e6095@kernel.org>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 20:20:35 +0800
X-Gm-Features: AcwNN1WMrRCQu0nVlsJVMe76UpuBh2J8SD-x-wYYcin-maJATBqrUQkOk85mQYM
Message-ID: <CAFkd8hsmBeDzWn1OwCgM0bmCmAP_B5iD7=9JqwzYnziwOWB=pQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: add nord cpu-bwmon compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, shengchao.guo@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3OSBTYWx0ZWRfX5l3bLyH6AuFE
 bQ9EjJAeqjAVuvdwEASYrg/wQLSlaaI1oWXiTz/bdijQTc5V2TNCJio+K3z5QliJbhuIhYeLWPf
 zFwkGlxyD4/msbpxWR3EHdAapuHVREMDlHU+YYsmMtUL/uLIJ5Qm0u++MCFNcG24lxRhVzvwtm/
 u40EnV/Pk4VBAj0jhDaIVieVyjjot8MwxPKKSMAKmCNrdxzhuG8yKgGjQIrMmWMwsdCsPD/ygRh
 +WA4Jfy3TyI9YTR/y81Umb3ElMUKN7kKmrP1IoNUCNgG1Rzi/AK1LRbGH2MNto78h7yfBOFVrjB
 KKY4UMsgwplj5Kz+HWup2PvGeEqj3YAccXYb0Z6IQOTFYs5WOM1234Cv4B6lRZcnD4T6knkbuAu
 gRQIJI7Tk8LzX5dXUSpK9kGuH7iBtmfeT9WO1Gl51qhUKycPsJkMdZ3FgDpQP8uipv/RFhVO55+
 KpxmZz8n52WAlHC5IYg==
X-Proofpoint-GUID: M-P97Ihv6WSosbMCTq9B1BqsJ4RkxWRw
X-Proofpoint-ORIG-GUID: M-P97Ihv6WSosbMCTq9B1BqsJ4RkxWRw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3OSBTYWx0ZWRfXwsYZOAXnzCQQ
 qp4oxIWa5w2PvltZ1+a0icWMptKjY0yltu2nXT4+ejT6KGVZQ3guFB5eU+QjZx3cxTDuqxL6iYP
 UxHi69ZPg9gbIUcBbiev66mqnWMniHs=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2729f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=D19gQVrFAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tDlUhY5aTNnqvAx6hSIA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220179

On Tue, Sep 22, 2026 at 7:38=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 22/09/2026 13:21, Zhangfei Gao wrote:
> > On Mon, Aug 31, 2026 at 5:01=E2=80=AFPM Zhangfei Gao <zhangfei.gao@oss.=
qualcomm.com>
> > wrote:
> >
> >> Document the qcom,nord-cpu-bwmon fallback compatible used by the
> >> CPU bandwidth monitors on Nord.
> >>
> >> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> >> ---
> >>
> >> This compatible will be consumed by the Nord bwmon device tree nodes,
> >> sent separately by Shawn Guo.
> >>
> >>  .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 =
+
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git
> >> a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.ya=
ml
> >> b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.ya=
ml
> >> index 21b4e04727de..8c82103fb86b 100644
> >> ---
> >> a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.ya=
ml
> >> +++
> >> b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.ya=
ml
> >> @@ -30,6 +30,7 @@ properties:
> >>                - qcom,hawi-cpu-bwmon
> >>                - qcom,kaanapali-cpu-bwmon
> >>                - qcom,maili-cpu-bwmon
> >> +              - qcom,nord-cpu-bwmon
> >>                - qcom,qcm2290-cpu-bwmon
> >>                - qcom,qcs615-cpu-bwmon
> >>                - qcom,qcs8300-cpu-bwmon
> >>
> >
> > Hi,
> >
> > Gentle ping on this patch.
> >
> > Shawn has posted the corresponding Nord DTS change [1],
> > which depends on adding the qcom,nord-cpu-bwmon compatible in this patc=
h:
> >
>
> Based on acks here, this should go via qcom soc, so part of DTS patchset.
That's Great.

>
> > [1] https://lkml.org/lkml/2026/9/22/844
>
> Please avoid using lkml, but instead use lore.kernel.org.

Understand, next time will use this instead.
https://lore.kernel.org/linux-arm-msm/20260922080416.484280-1-shengchao.guo=
@oss.qualcomm.com/

Thanks
