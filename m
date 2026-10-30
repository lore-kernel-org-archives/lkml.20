Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793367551;
	b=GhpYrPlE8nQE3oxbiB0UQvqYfIVchAr3FUnXB7G2WUaB8fJgSZg0ZX7aofcmiu3g7PhS
	 Fb7byCJ0cctNLT1tP1/yE0zIsJiHOQbxQuOfoqFGno4iJyRxewalyyiKG5NXYXhJY9XI2
	 GnR08U8oSVj4Jrdo8d8f3+ryqmFTOFa+uLmzkRSqAj2OZ76eyhV9apRT9McGNbaQm1Plu
	 ilQuuMw6GyV6fZ2+8yUaN6CADhqUYbJSJMfMN8MGseBpwm4/0EziXZAH/19sGW1qSSom6
	 wQycC+UD935HmMVgbfOKkJu+PBX86eXUnXvkgCTAenPB5ftrrH+VEjXYg+dffGVdwYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XwEaob6thLYAra0jHlQOZLAFR199UwLvhJVwj3sBNU4=;
	b=ovgpJ/7FkPYI55WnGhFyw/KvyMGqgP81c9BrMNvm/krOdCTppThKCyv1BRB2bdV1wfI/
	 PnTCoWWhIlIpgahobDrmtstMGCsy/4INUIrniy47qo891WTHGE16WSMUMcr6iQrLGyyuR
	 uS8DFYH5oCTQhvb6k2ZmbJtSuu2SJbVFmn7Zb+uZMRhbAGDyEK6B78vI6Z26VvHJq2dqF
	 4s2MzFpSvrjbMZOlSwHX0zbpdfitHuySlHkMwPB36CVGjyTWUXsLMd/aa6E8G790hWiaa
	 1Chb1xtdBxNrnnnMKUZPuBS3IrePUevcEI/CR6gZO5gX2mS/m49+biGWGWe0DjFCOQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MeCUVtrG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="E/S/5ysp";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468B9606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 468B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MeCUVtrG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E/S/5ysp
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGFWw3719792
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwEaob6thLYAra0jHlQOZLAFR199UwLvhJVwj3sBNU4=; b=MeCUVtrG19q1KNHb
	HYHfkpDegf7bewPeoAgccrjzPBx9yYujR7BRiAkyZH62zo41/o3txLcu/zYYnJA4
	i5ClT4OlxRS/AFJuNMlPGQ36txB7zOAiLXm1g1mQ7yqeHVKxV9JXwlNgS5AR9rvy
	MY7cyRlIdotakOHWpkrHgviXBYymNwI3iLdYSfAHValNCwT/A2z+cnOqAQ31ekVE
	58oI7A01Sx4b6iKQEHgCwYL16WhTcQ5DzfXpXxusMGKLn+MmOXOO+tlRa6b7sRRo
	BVfFd0IIIqfE3SLS75yVdqfGAe+0SiyoMJMAp1bxrBPWBC9uXbyayt05kD/RMx/q
	D6JWow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qu7rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:39:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so143433985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793367549; cv=none;
        d=google.com; s=arc-20260327;
        b=bgHesBU6CqInNgaOPIsT6FTmgSCKVhwIRjdlgNMCCdMBCWq6wenGxtUk+QMbWzkyKS
         9pEd3Bdc+rD07Km1VDn/A/iLbk0cOp6smKZfmJuyKTjumh0drvTxQgJhEqLd/3hSa0YC
         InGNb8Xk29nshencpm2V2e6wU1+22D5/vAHajnvupzgTJfliEJYmLE1SXhE4ewf5nbkJ
         NiDAyPazqtzeNO0XE7kW4MBeN8AtttqOs9K+VGNpnZcRcZH6LtVLsjxNlj8Ly0mqbNoV
         8bsQBo3+0tRhzDMTCzFpIlHQoo1L/cmex4MWluWZRj/W/SCs613XBkVy9hyNijp+35F/
         fRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XwEaob6thLYAra0jHlQOZLAFR199UwLvhJVwj3sBNU4=;
        fh=/o9TBNsCE4c2BzhgyHeIajzwsuI/FNX1H+8Ux7G7PQU=;
        b=jPkyLvA7REH0ZHx2ZiBFrYmaieXfnVoASDNBdllFuZB73VVU9KBc2nsG9CbDNyh+Bt
         d5+jPiuJgS3dryplIo+Ltgvd2tkrDd1wzGj/FSVmOsVeGa1RZXJqMNML1ef8341tlq41
         Pw7TuRPIiUA2TM3pUS2wYsdRIjtqNBizCVnSHAYenR3lCp0LGFyVtdIPSVSOiZvZvk/g
         MilqdZbmSOa68Zbo+EJNUKT28E7z5bhS7x59xUuyAYJ1jWY1EbrDLuprFzKGkhXa3s+E
         v9ZeGoidDNEwHxbaMrFpmgfAel5ZMBrWKqZJdGKY9dbXY9c2g/ZHGxBskwDLKjeTY6He
         o60A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793367549; x=1793972349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XwEaob6thLYAra0jHlQOZLAFR199UwLvhJVwj3sBNU4=;
        b=E/S/5ysp1/pd12RbHcfCTvUjSQ2XX70g5xhqhiEbG72uPbXCntfbpjvmjj9NkRegXv
         mGUTFpVwxbx/oDtiQFn4ox4Qed/zGk3RqJd18a4LPSd3ZcpWbRgv3/XzzpNhP7wOxML3
         58QG9xyWXeZpuo/tkuKsIlQrDRH7uKB5K8xaekQ11dzbn3+A0tk4D/qMhn2a2ru5Rzwm
         dQ9YgtbONQpyQB98uIhPLDsqxPTZYHUbEJYictKHdQoEyQ5AgnCz01KzSift5Nm1py19
         Lq4uRq0XDiEgtHMBgNWc9GMBaGjDGf+9IaEvZPkMRHPsZ7WfMsLF7Y72qcWAyYMpt1h5
         FYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367549; x=1793972349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwEaob6thLYAra0jHlQOZLAFR199UwLvhJVwj3sBNU4=;
        b=2gg/CCehoLCmUnGsRhUU/DgYVq9gySoiKi3N2Zu+LOtE2dBDhKLlKsbcWXRfBXrOb8
         tVIFyHZItJfQJ+ZnOIAhJGaU4ZQkMRtJ8BQ9+8el1mbpBJ5dyjAp3aRKh6wvRPhLAmLt
         mKJpD8dqovz9W8ga6p7/BwGARPNGsaHEg7Rn7p5X4r9MT0YsCQj5rhdcWrHnlWXFcG1V
         6OGyH2SO93U3Ws+UFmu3pirkRC2e4hkEzn+djsahemB5dLRFEKaBtTE4T6oYxj8Pypmh
         TaKISElsFWQwJzouYY2F3BnfR8aFHEJoPjRYp2t4s63ZNAkm1nMDkeL4PTsmc2cbVFsb
         huwg==
X-Forwarded-Encrypted: i=1; AKwUvBzghq0hflQaL8kMaFRXNvD6X7X3+8m29JLUgGtwWklSnw1wqeM6gWgV9HShqEqg+zzr/bFr/Fz8Fi0QVQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlRq0guZPyH6vjP2+Ouq8DmrQkoHpM+aCu/QJGYYVwEgq92F3U
	y1rP7pvq7qNZDdH5dW5LIY/ptVIg3QeAVyLNQJd/prFA+Z5G1rJOc1vjMIPC1nl8fiHJ9VnwP8U
	r2dL0lFYTqPUWKE4NEqRC4sRBvVRc16+Vd0aJvDgXpzW0q1b6FtCyrkfqGO+771rjnxfpaqmL4q
	FQjPltaFo3EUoMnT9OAmTAvIVS6+drl54WV5aOhj1d2Q==
X-Gm-Gg: AYBFou22+FekLoxIpgZAhD8pvdtY2JLbvbFTI8H4gq23nxKYQYvKgtPdP1C+ff/3WpD
	/uNgdp1HtEvj0WKJeqQy8yICcGDkHfvFMkA7TIUg2lNqLOJa4FzvCnuYFzPk1eNbq94UoJ3nIUz
	/u9BI0NMWoIB5M2Bl0gu9v4UhN3eUbYA1V2JhrEhJI+/iFmiMmGIbfT7TjIuo+r0WPD2FCsuG/x
	ORnMfivCGsD4JR0FrugFE96Uy1do9o2gxOV/jq3tYfRZZtrPa9JwraLWWNbyFZOXNICA4eU74AT
	mYrw5dausmSy0GkJXx4ajYgOLBSz
X-Received: by 2002:a05:620a:8391:b0:944:204:7e46 with SMTP id af79cd13be357-94421679aa8mr340816185a.20.1793367549334;
        Fri, 30 Oct 2026 06:39:09 -0700 (PDT)
X-Received: by 2002:a05:620a:8391:b0:944:204:7e46 with SMTP id
 af79cd13be357-94421679aa8mr340808285a.20.1793367548624; Fri, 30 Oct 2026
 06:39:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com> <20261030-hawi-maili-camss-v3-3-9742bca8cef2@oss.qualcomm.com>
In-Reply-To: <20261030-hawi-maili-camss-v3-3-9742bca8cef2@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:38:57 +0100
X-Gm-Features: AclHuK_-EUrkM1XNUcr_Url0Uwx1X3rot5F_HGx50SCbO4oqaf02oTzKKHc7lN4
Message-ID: <CAFEp6-2vN5UEbSwDH91eUzP_w7DHd3WtuLnui-_k7az2oQnoHw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: media: Add CAMSS device for Hawi and Maili
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: tpSBcpDij_6VZSIC-v5DjMcT4jNVvwx0
X-Proofpoint-ORIG-GUID: tpSBcpDij_6VZSIC-v5DjMcT4jNVvwx0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX7YUEn44UA6Pb
 goMDvYVmCx5ubcwwVGKINMhTFS4i2Cb4wNwYQVBB8lnVHMYAt1OGiJWl9m/PHmG4QzNnnvuISTI
 hx+5jfmH4b4cGvUYxTqCTUzSpLu/wlRYGYcJ4B/uayphHne0s9QZUIyi+XwpZBrSt0sEzijMvns
 peEiWf8mfCLkCYlVUZJZwsjPKt6zsogQO9mJfCqXdqfUlzBIEaZg4y3OlL2wfy198kTjlL8gdWg
 HgFSOIG2bDo4OvJ3pLrPT9BxX8p4NyYpVKGD0uVpocxBbvai96BbmkVshElbFk4u0CsBf3LIbO8
 yB6MREsweUOKoNLhcNTXLz27F3UYw5pj410WQzZ95eM5XEIa98JYkiBe+3vi7u3JKmEUbJ+4+HZ
 6X44LH0aqtRR5ae5OSDkteM7cPG4l/ABcBdrhjnBjIfUGWejJBMkjxbgeJyOTEOzmMiC+jSFbkH
 JkXr40T30kHCAL5utpQ==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae49dfe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=x8rGuSE_rcxhvlVRD_QA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXx2R1c5KB7nDr
 1C/KfIMomMF+2OMooW6OzBNL2GkiEw8BEq0r5+Gb4Rp/tbD/n//Atf9/qyaRC9jaasjOrl1ydlZ
 Lp9prww6MRWIlAyYBVByEyrvmEBEwa4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On Fri, Oct 30, 2026 at 1:43=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Hawi platform.
>
> The Hawi platform provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,hawi-camss.yaml | 314 +++++++++++++++=
++++++
>  1 file changed, 314 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml=
 b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..32c1cc59e8767b8b03f6947f8=
fde83d3e7410125
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> @@ -0,0 +1,314 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,hawi-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Hawi and Maili Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> +  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,hawi-camss
> +      - items:
> +          - const: qcom,maili-camss
> +          - const: qcom,hawi-camss
> +
> +  reg:
> +    maxItems: 14
> +
> +  reg-names:
> +    items:
> +      - const: top
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  clocks:
> +    maxItems: 26
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: camnoc_dcd_xo
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_mnoc_hf
> +      - const: cpas_mnoc_sf
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: cpas_vfe2
> +      - const: cpas_vfe_lite
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe2
> +      - const: vfe2_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +      - const: qdss_debug_xo
> +
> +  interrupts:
> +    maxItems: 10
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +
> +  iommus:
> +    items:
> +      - description: S1 HLOS IFE and IFE_LITE non-protected stream
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Global Distributed Switch Controller fo=
r IFE0.
> +      - description: IFE1 GDSC - Global Distributed Switch Controller fo=
r IFE1.
> +      - description: IFE2 GDSC - Global Distributed Switch Controller fo=
r IFE2.
> +      - description: Titan GDSC - Global Distributed Switch Controller f=
or the entire camss.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2
> +      - const: top
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-5]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input ports for receiving CSI data on CSIPHY 0-5.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
> +    #include <dt-bindings/clock/qcom,hawi-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        isp@9253000 {

Address should match your first reg addr.


> +            compatible =3D "qcom,hawi-camss";
> +
> +            reg =3D <0x0 0x0900b000 0x0 0x1000>,
> +                  <0x0 0x09253000 0x0 0x5e80>,
> +                  <0x0 0x09263000 0x0 0x5e80>,
> +                  <0x0 0x09273000 0x0 0x5e80>,
> +                  <0x0 0x092d3000 0x0 0x3880>,
> +                  <0x0 0x092e7000 0x0 0x3880>,
> +                  <0x0 0x093fd000 0x0 0x400>,
> +                  <0x0 0x093fe000 0x0 0x400>,
> +                  <0x0 0x093ff000 0x0 0x400>,
> +                  <0x0 0x09151000 0x0 0x20000>,
> +                  <0x0 0x09171000 0x0 0x20000>,
> +                  <0x0 0x09191000 0x0 0x20000>,
> +                  <0x0 0x092dc000 0x0 0x6800>,
> +                  <0x0 0x092f0000 0x0 0x6800>;
> +            reg-names =3D "top",
> +                        "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csitpg0",
> +                        "csitpg1",
> +                        "csitpg2",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe2",
> +                        "vfe_lite0",
> +                        "vfe_lite1";
> +
> +            clocks =3D <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_DCD_XO_CLK>,
> +                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_TITAN_MNOC_HF_CLK>,
> +                     <&camcc CAM_CC_TITAN_MNOC_SF_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
> +            clock-names =3D "camnoc_nrt_axi",
> +                          "camnoc_rt_axi",
> +                          "camnoc_dcd_xo",
> +                          "cpas_ahb",
> +                          "cpas_fast_ahb",
> +                          "cpas_mnoc_hf",
> +                          "cpas_mnoc_sf",
> +                          "cpas_vfe0",
> +                          "cpas_vfe1",
> +                          "cpas_vfe2",
> +                          "cpas_vfe_lite",
> +                          "csid",
> +                          "csid_csiphy_rx",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe2",
> +                          "vfe2_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid",
> +                          "qdss_debug_xo";
> +
> +            interrupts =3D <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names =3D "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite0",
> +                              "vfe_lite1";
> +
> +            interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_A=
CTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_A=
CTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALW=
AYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names =3D "ahb",
> +                                 "hf_mnoc";
> +
> +            iommus =3D <&apps_smmu 0x1800 0x00>;
> +
> +            power-domains =3D <&camcc CAM_CC_TFE_0_GDSC>,
> +                            <&camcc CAM_CC_TFE_1_GDSC>,
> +                            <&camcc CAM_CC_TFE_2_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +            power-domain-names =3D "ife0",
> +                                 "ife1",
> +                                 "ife2",
> +                                 "top";
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +
> +                    camss_csiphy0_ep: endpoint {
> +                        data-lanes =3D <1 2 3 4>;
> +                        remote-endpoint =3D <&csiphy0_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
>
> --
> 2.34.1
>
