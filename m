Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472901;
	b=SUqJr55KPCZr2btTJSFMMBELU3IXLuw76Qbd6K8tZXc41ikk6UQgCT9DT4M/kvlkjO6M
	 sAzYF68v5WsfRUX/ddNMF3L+/GZ0BPDPwgx7yimSsz+RbhlHE3jnSjqONu46nYUykn0cl
	 ldwl6i9wBNL4ea+OQILecsnPJuGPODYtjwb8A+2s5yflNNpyzYBnn/zawdwy64j76Rx+H
	 c3AWCfX41qIKf07Gnury4dIxIYDxNd6i6wYWEye9neaZRsbTTlYJNLbmivByOKR28Lygp
	 86JQgzey7yEd8/Yxx6BZiuh7SvhHnhF43dISlmRXOiaFi8EKOQZcJcOFpca7Kru7L6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
	b=EP7cRqA39Ox3OTCSbY74fSJe0b8GSgsqdX1o5uLGuBAM9uH5009r5WJZsng9by2DD1T4
	 5Z32QZz3zLMC7RLdy1t99UhiwInnkD5psDc69fjpv86AS48VOlcINcZlrB1kFrVo2p38K
	 I2kJYfdve3FJvM5WQdFWcfZ55/fJarY0E+kFYM+W23zAvKQrCF1u4Q740/zfJ3tRm1/Id
	 Qo8ZTXm+ZAtrJB8XAI3lbiwGUMvSoOkV3HJWjaCHjeHZBrzTjpjjgEZZzEJzDafJ6PWOO
	 lLKLoPomjup2RjW4NFe3CvIt9KivzG2Tgg/D48UCUFStIlO07VrFJHWkbx5ZJ00DcJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z1EyHatP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QSbfauUd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9296606A8A0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9296606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z1EyHatP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QSbfauUd
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zhfl903710
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=; b=Z1EyHatPMaX6ot4M
	5BaelCJrRQBd+u2LVmN2dGGoww9GhSfxC4pxfVKHyIPiGpGwcf56oTe0MoOYljFd
	9wjeyMWjJl5zFsS3liVBRb88lub0WzOQO9pJ6IeQudSufKu+s2GkLStWKWG47JPx
	nxwW6BBEhyBWjQmURWa6VZLhM+9N+JHTP6RJhMinRXLST8AkykzcqyqtNsOrbWgn
	3TYJCMob73hywpYSs8OxcR6c3J3YaaKvnsMWhwb6pqocPZltWtz1/L9JQzup69S3
	rz3HqftfJ96lyRFyt4QE0C4aSmFJAwip11ItdLAT1yADCQwzhmP7aJkeUfkwCOsj
	hkHJyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1ubs7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:41:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so1000378685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:41:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472899; cv=none;
        d=google.com; s=arc-20260327;
        b=Wgk+hwybty5wmwfORgqmfw7vitI3u1jJHD0cK8mxasqEOxoFfiInxluA6ct2oXIYT7
         5o86HoXHhVcpVrVxeTLp+3Zwou6qr806dDBE6i1D1DlJWCUrbFAM9sv5v8+Q4yYR2pHB
         se5W8/efaBByC648vzl0+7FO8w75bhxmunr5uk8baiSD+F3p0uu7e5PIzFq8Obxarr4U
         RU8TJQbeQiSu5dHGpVVTKw6oufeSwt7SO4fd+vBRFPnQcC8E+OkLRxHcCbu3Ob77S2Ip
         QA3ImmRqlH6ZEF0VoP4vgj99TVgs9OK5KLq733g3l7wTnY8gPVFjKzIyXeVgzjYFLEYK
         HxEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
        fh=5yT1sbQFCb7iS2mq9s4bbb2Ast7PAeTNUNikTnJfH8E=;
        b=K7bONTV+KOf68fO+22w9X66MimPMHNTuDs4DAGMj9PxMCHxjrrWbsjD8lJgQA01kW0
         cH86rWwuZJ20OetAOBPquk2KPR7FaidtHpR3ojQOVT7usptnUgX8EjLhxhHJMIfw4QU8
         resyRyMl2i2qFyyCTFQipEzzcEizvxkTxCTUstLenjyoTwXbb19gDHSme3bLWcL7Yfov
         IbhfngMhKl0vGobhMNbzn6QQ6stbyV+B8pBEFJqlQHK9jj/PJOdidPpVUi9ekV8Yz7sq
         wzqjDZbSik2WI99esySxTWs3Pi3wuba8lnWK8on0LOURdw2SnK2VTnflGIL+qL3h4sN2
         gfEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472899; x=1795077699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
        b=QSbfauUdtCbpBF2jI65s5xT7yk1VP9ijV/S86M6erAL2zONUDbkXm4+GtE+PhvCKwA
         IukOFMcWT2PyA3TRr6LJ3WRBqp2frNL1gfO7PHGNHRvjjtV6EVnus5qMdhGZtcYb9jzT
         udorb6Zihc7Q6sQRYJyMy7uu2eIO2Wa02l4kUgQeg45MN3GsS/TEZT8LHAcQstQaXq30
         vJ0f+zorzW2TwRncZVrFE8jZEbY7bkDJWgM8yfaiUjQjNJU/JNRlFD/3OLyGFCsmN3/v
         8tqvzD2IxPcr+onC3ZCwFA5WioPe1hcWy9FeeYsYqhaSzOnI35HYEtxYXXUVKZuWqXI0
         4Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472899; x=1795077699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
        b=SF4k7lo4kTwfgB3X+BAHDNoXG9tnvsE3fjUtqK5P2oCJNf0CM4CJDA/w8D5q6ABvOc
         tvNOfmegiXvyqIUbJdV5w3daQkzg4wuAQNjCT9UPNpLvSsIOlbLcpoo4+v7xqogeBf8P
         VOp2UY/PQnebBpv80zNxXPh7W7jIBV1KoRQJ/oKy6NGd7RSFa4FIP6Kkp1yUJznHxlX9
         mJL9ahCkcMs/feD6vOHgqzH1MyXZQEIPkYTdToUi6vItQNjKMntbo5LZmAMKi12gJihA
         S70q5QYHVAUY+H8/AQr/cb0Ent1XCHVsoTqqxaMenP7xUF/8litiyT0yLGdguRA2v2dq
         XtgQ==
X-Forwarded-Encrypted: i=1; AL+hErGvGo+9WBERhfHmXv5SxIUSTGK0yj/Rpf86XdxDWhmr8tbHGetkXu58d9sCk3s7dBLao9Q2suwYkyljJiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VoePX36rwOpiKaOkZAta0KEIsG5mWe7Ho1q81Nwsfto/bqm8B
	pXloLWsB9/43oO66IQhH3RTMgJ2XM3Rc55hB0kg42+5k5+7OIZ/ac0GH71iW0T6N6XL4/47pHEt
	Pf8b5aIzT2LQHEL5Fz1u1ZzcsBeSUD1tGz1n8cUkW4XVuzgLoXV3d3865CXkZ2JdaojUe49H9Xc
	t8cWR3mwVXHZs0yKENSZD3BKoqV0OmmCCaguqdD/4ZLw==
X-Gm-Gg: AYBFou1plQAUbMkbFMl1qgiItdHA6+K5EPi1D6cNsILaShj9KS+/F7wGZrFMrkKp8Fx
	dBQWvakivqk3CttprY0MwoMQynkjoU1/v6udRBnIre7urisdb1/dDmSKUj7sv1gc6N+pAOpnXt9
	bsdykL1sdvwFbRwUfsZRIuW6qIrratue7gQYONI2bet1GhFfCoxZVMhPonma3+gClE7cFOZPkro
	CYlSxaRUh8sVc9TvGVA6MG26PongnO34uYbxRsqF5ZjeeUOqU46N/6yJkpvGxxs4zenZVa7d58=
X-Received: by 2002:a05:620a:29c9:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-947b00201a2mr849200285a.62.1794472898750;
        Thu, 12 Nov 2026 00:41:38 -0800 (PST)
X-Received: by 2002:a05:620a:29c9:b0:93e:7dfa:2f3f with SMTP id
 af79cd13be357-947b00201a2mr849197285a.62.1794472898061; Thu, 12 Nov 2026
 00:41:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:41:27 +0100
X-Gm-Features: AclHuK_y_fjpiV6obT_WtVqv7QGfmoWmqqnBvzPuhgwLPzV3bZAbPmW-Fiags_M
Message-ID: <CAFEp6-1dryYHtVme6M7opGHUen3vC+DyLJM8J1WKqVp6zwMWWQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNCBTYWx0ZWRfX+6z0orqssS/6
 Lo8tdev49nprPzhPVFa5+I5FMlYN6MpS3nLWNhflwTv518ZzJVK9B0fvXsb9FfyBWntv9gjOAjt
 nLJEIbYDtDXRqmqWpyvfm7nvVpV68vY=
X-Proofpoint-GUID: pQNsKDCeoniqq4qIMkbNHCmxhhNZnr3j
X-Proofpoint-ORIG-GUID: pQNsKDCeoniqq4qIMkbNHCmxhhNZnr3j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNCBTYWx0ZWRfX/cBCoyvMs9el
 P2qyqXQEpSRaONokvBDJZUc2knmV2uldWc/gK2Hlug8MBmz4q4gcq/2C3JJJrhmCIW8b7fP8SIc
 RJbn2xZrQpculi+CzPCViGe+vezpC8QYd6xxizAJVUb3p0Uzc6b6wH3OmfqW1wp7JRqEgUkVZOk
 B9AowOXoQInmhcx+p3kwTTlP/2dzXxczh1Xk0vW823pOiJ80bIguGFcItzRV5PIOOlgrCJNrbXO
 3p9Hn5ungcYp4iWEeVpr/x2aRc6F+a1lM7kP1ySdgxXV4VAQilh0YgZ8tuUpgDLGiZBnj3UyrG5
 cmKHQopz/SBxd00ecO/F1ib7j9ix87aLg6CdbONM6d3eCiyMZFVwan20NNjCaIen8g0WmFHF92o
 aPpbbaJHBMXFddyhrOhSl/5blnj9aPriudLJVFDBqjM2MsjptdyNfpPFjEZgr6/R6lKBuBQRZHU
 bKMzdg5iugS99gokz4Q==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af57bc3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=C43g6bSQiVhdG0YezvUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120034

Hi Atanas,

On Tue, Nov 10, 2026 at 6:16=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> present in SM8250 (Kona) and SC7280 (Kodiak) SoCs.
>
> The JPEG encoder is a standalone hardware IP within the camera subsystem
> that performs JPEG compression in memory-to-memory fashion.  It is
> separate from the CAMSS ISP pipeline and has its own register space,
> interrupt, clocks, power domains, IOMMU stream, and interconnect path.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-j=
peg-enc.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc=
.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> new file mode 100644
> index 0000000000000..112580f3df10b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> @@ -0,0 +1,190 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm =
SoCs.
> +  The encoder is a standalone hardware IP within the camera subsystem th=
at
> +  performs JPEG compression in memory-to-memory fashion.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7280-jpeg-enc
> +      - qcom,sm8250-jpeg-enc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: bus
> +      - const: config
> +      - const: cpas
> +      - const: camnoc_axi
> +
> +  power-domains:
> +    minItems: 2
> +    maxItems: 3
> +
> +  power-domain-names:
> +    minItems: 2
> +    maxItems: 3
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    items:
> +      - const: camnoc
> +
> +  iommus:
> +    description:
> +      SMMU stream ID for the JPEG hardware.
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - power-domain-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - operating-points-v2
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sc7280-jpeg-enc
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: Titan top GDSC
> +            - description: CX power domain
> +        power-domain-names:
> +          items:
> +            - const: titan_top
> +            - const: cx
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8250-jpeg-enc
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: Titan top GDSC
> +            - description: MX power domain
> +            - description: MMCX power domain
> +        power-domain-names:
> +          items:
> +            - const: titan_top
> +            - const: mx
> +            - const: mmcx
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    jpeg-encoder@ac53000 {
> +        compatible =3D "qcom,sm8250-jpeg-enc";
> +        reg =3D <0x0ac53000 0x1000>;
> +
> +        interrupts =3D <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains =3D <&camcc TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MX>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names =3D "titan_top", "mx", "mmcx";
> +
> +        clocks =3D <&camcc CAM_CC_JPEG_CLK>,
> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
> +        clock-names =3D "core",
> +                      "bus",
> +                      "config",
> +                      "cpas",
> +                      "camnoc_axi";

I find the clock names a bit inconsistent. For example, camnoc_axi
explicitly refers to an AXI clock, whereas bus is much more generic
and does not follow the same naming convention.

I don't have a strong preference, but perhaps 'bus' could be renamed
to 'data' or 'nrt_data' (SF path is associated with non-real-time
resources).

Similarly, for camnoc_axi, maybe something like 'camnoc' or 'camnoc_data'.

> +
> +        interconnects =3D <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_E=
BI_CH0 0>;
> +        interconnect-names =3D "camnoc";
> +
> +        iommus =3D <&apps_smmu 0x2040 0x400>;
> +
> +        operating-points-v2 =3D <&jpeg_opp_table>;
> +
> +        jpeg_opp_table: opp-table {
> +            compatible =3D "operating-points-v2";
> +
> +            opp-100000000 {
> +                opp-hz =3D /bits/ 64 <100000000>;
> +                opp-peak-kBps =3D <262560>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-200000000 {
> +                opp-hz =3D /bits/ 64 <200000000>;
> +                opp-peak-kBps =3D <524760>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-400000000 {
> +                opp-hz =3D /bits/ 64 <400000000>;
> +                opp-peak-kBps =3D <978600>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-480000000 {
> +                opp-hz =3D /bits/ 64 <480000000>;
> +                opp-peak-kBps =3D <1095600>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-600000000 {
> +                opp-hz =3D /bits/ 64 <600000000>;
> +                opp-peak-kBps =3D <1095600>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_turbo>;
> +            };
> +        };
> +    };
> --
> 2.34.1
>
>
