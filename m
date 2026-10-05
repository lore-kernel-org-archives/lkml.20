Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4632036E489
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183723; cv=none; b=kTWpYtA/SUJhV2QQgI4jnjDd4X5CHpBMeOFVnPdQ+X1gf5BCq2V6ZgrMGJfRKymU+DE3VgfDRnXEJywXqRz0kK5hUq8JSIQWiE8ReiKIOzYgdysXhWEmlGvLv9TlkzFYsSe4UYsaIhjTlM8lM6CxEjk3uFfdeSiYxg0m/5h6Peo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183723; c=relaxed/simple;
	bh=XJQHz+fa69hLNOTfiaj+ntovmW7NecNwSmoTYXDh3Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoLEZtfxsK4LdSz+pc6tYUDokNumTIGKJA5LHdwkrUATczHmgiz+G2/Qd252vwnJS4aP6e5sL5VgrFYU6dLL2KuQAFsadVJp2Qh0F0/f9xY5gMxzK6q+C16IpCLrTkEDz3h6k4Bta9P3mNjNU0K/qJdzRys4muB/v+relmm9YVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFQigi6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhyYBeNO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFQigi6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhyYBeNO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510IJi787605
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44lmmXHu9OxWrvFv/Dp80+DaLPYnkIgWKx4lSUJuz5w=; b=nFQigi6h83zbdwZB
	Q2lq1gMOxSDy9X+GumLh1Om89Kg8/fsekKWSVD1znW59LGUVSx6HotCur7pAY1Kg
	1kPr6qv//09ZK/WzLKTvsj9ZHcMQjnkLD+gAHpFYqgy2xt+EXnRByJ/98kYNLPh3
	ufLT+QOYpTPb+slFrKde1nfFnMjZ/hGkmuP/bg7mQb0cHdyYEwpCB1K8Xl4avrxG
	vV3a4gEZQtYBSW65dg6o9xJdrqpaGRH1DKHA+mphS8EkXr0peCVgU9P4cfqq175T
	ILL0nvw91O6Adfxj+PN5CGE9OUz5MmELhgR+qqey/wvZEO3f9LpyWyfilJLCj2I/
	LNbMzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa4un4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:02:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so298287485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183720; x=1791788520; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=44lmmXHu9OxWrvFv/Dp80+DaLPYnkIgWKx4lSUJuz5w=;
        b=XhyYBeNOFBq9dZ25dGXlYITon1dWz+uJJR3g3qGb1EW/hcJATBOk1wTBdrFviSDUL6
         aYtG+1wj4fRXOh177J6f4B4n4FimIkUEW1aChmoPH8OEf0sm6dXkHe2vIfexfQuuWxkO
         lLqPGpe5nOWp1JN1oDB2Wg6KoUoS+W1bRAbkdIULfoLWMz0RpetA9vGAism/GDMRKXjy
         Tz4PxXbGYZC5VDsTlSAH5mr+Xtxa/h7x6w/3eu5UOPAtFaidqyzX+PWRcvfZ9fmlUk1I
         35YsQyzbv/Psla0zwiVchfBbOmZjxPu3n+N6ENbQBez81U/jB8acgpHgD0+uQ7NjjIOi
         6RJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183720; x=1791788520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=44lmmXHu9OxWrvFv/Dp80+DaLPYnkIgWKx4lSUJuz5w=;
        b=HCPZMtl78lbBsfacxDnWWoLqYlCkZZwD/igc7ydWDi5tmtvpgnJlyU4N5gqxGIL85w
         irYTZ2y3daYKS/nAzfcKrJeY1AGR8/CEeB8xyMoLUMz+lpO9j1N9sfWaltokWA9zeYBx
         0oq/QgeVCNICfCSMHZM/1NrgBmL9uDsAKTh9zLvH1GGJkmoL5E+ywjPbIAqgVUViC4li
         E4UzH5N6z8qv1gkbU0HDb5X5HA69tajFQsAAA50XkgxFLFdjWmOtkZ8Auj0ji3w3LP5W
         zMSourwPZC/LhQtVo6JQ90X1BLKSHg7AXQdHBypAF3aNWGt/UYrgJJwxsbXPLD0J4Eye
         9ofA==
X-Forwarded-Encrypted: i=1; AKwUvByi8dWmHHdMuMT5WCNLWhcRWwqY3RyzEAGgrrnmXIhcJv50vpS9d1rzvFjz0WBBRkMRl3mTEg/Fphzu7JA=@vger.kernel.org
X-Gm-Message-State: AFuF++kaaLgZZMCgkNkS0T1zjV0FoqMNHIoLT94luEjwLOT/EmCpzMtP
	DohPC7zeqSSTo7DaNmtJojctDQlVT+TVYzP22u87UJvTrpiH7svBzWLbG9Z/w8HPiS6v6iWE8kO
	1bEJV9OHz18bB2oh2auO1AyGJ1UaQaJpyoz7AlEPlFdHAU2jFGGGtRe+YqxTn37CIMYI=
X-Gm-Gg: AYBFou39EFe92LV+2x4IX8CgVIL+cL3D7TCBRTX7hh5YGN2EkZI32xKSmngv4wep5sc
	Kjkiwm4EEBufJl9n9SvCB+besDZPEE1c45fIdryIxYdO3Ke7+DiKssvRpMI8yeDXl/LDxctoj/v
	IdhnyUWOJl9cD9q2P44UmIpsveuPl0/QUPb+850ZVEw1zBxFXeU+T0o0D7WvgNTLM0fEpvoX34C
	0yLdTk6MRvUL+UIv4m8NMgrS99PufAJXm3Zp15Zbb2vbywuHNFgcTSvHBkXDPhsAG2q5AZ1U8uj
	XskWUAK2/nlLsqeFxvgO7wELo0sQFNiNkEUiWjeKV9MxwDF0b0i0/jppHDoAFCsjxPzQyCTP55l
	hi+6wCuAlteUgVoF21PFlXYFCIeJ3Jhk/HnGx32zpEZ9Al65vWzKm/lSXu+Wwuzf3ODlnbnuUQJ
	6uZ/9GANR3QDQN
X-Received: by 2002:a05:620a:230e:20b0:93e:6068:7e8d with SMTP id af79cd13be357-93e60688896mr486490585a.10.1791183720113;
        Mon, 05 Oct 2026 00:02:00 -0700 (PDT)
X-Received: by 2002:a05:620a:230e:20b0:93e:6068:7e8d with SMTP id af79cd13be357-93e60688896mr486487885a.10.1791183719641;
        Mon, 05 Oct 2026 00:01:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79f7dfsm2903284e87.58.2026.10.05.00.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:01:58 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:01:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: power: qcom,rpmpd: Add SDM632
Message-ID: <zk5ujmwz5jfna7xzqaaove745lrcarqmkqua2hswl7e4mnme5l@q4ik5vuav3a7>
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-2-95c47d0f26cf@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002-sdm632-rpmpd-v3-2-95c47d0f26cf@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfXy+5exThKHQxc
 o9//4y9X4eUd0CElE8VzfV6yYvv3k7jyGgfFpG/Mdjhag/YKbUkVrzMFT/T2gczS8nugTdpdWA/
 IoBQdv2croqjG1ZSTxAwVFQxsTqUViZi6BB1B1jbP5/OxXEfcGpOtsGfZ4aLa8/lZnFC2SH29/X
 AbBg2pg+J0/qT76HK8YJPn8R1ps5xMrjhbyWD9TuO9NDR4KPyQlSZrBKsRiFFYU6qe2FV3QeOeB
 WZn20eE1E4Ms+JjYHFOEOQ0sV0sBGHu7FtT10yy7ISlpGYzX+oDFqdEhVZoCYqGVXchESJ8s/as
 15K0Gns6EJo1webZaV3leyXR8NtOEMUjQVLmeuWoY5tH/hbPi9hALY0sZ895M1K/cH0ZNqEUXQ6
 KiI1joIKIzBmrAqkQomAwGPFjdwfToCZMa2YE3y+fFC1m60PnYWC2MX3iPem/HTqA/3msRI+ku7
 SQoK1L9ddfLCH8AfV0A==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac34b69 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=OuZLqq7tAAAA:8
 a=qZHw2mh3vVBxtvyT7EIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: BJ-6AN2ph3ueAkeh64PEJaqZNE6I5SEY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX7BsNZC1qPaf9
 UcedxsHbkW4IsAPZnvkrj5c1ZqdZsHHW2SviY1FhSwB0lBl82Bm/5tDrnI1FC0B7nrklANT3CG6
 nYPTURcyYZXp4tNnBDL7H2V25z/H6KY=
X-Proofpoint-GUID: BJ-6AN2ph3ueAkeh64PEJaqZNE6I5SEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050027

On Fri, Oct 02, 2026 at 12:38:30AM +0200, Barnabás Czémán wrote:
> Add compatible for SDM632 RPM.

Please write something more useful. For example, why do we need a new
compatible, what's the difference from MSM8953, etc.

> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index a70bfacbc5d1..4b263a982fca 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -51,6 +51,7 @@ properties:
>            - qcom,sc7280-rpmhpd
>            - qcom,sc8180x-rpmhpd
>            - qcom,sc8280xp-rpmhpd
> +          - qcom,sdm632-rpmpd
>            - qcom,sdm660-rpmpd
>            - qcom,sdm670-rpmhpd
>            - qcom,sdm845-rpmhpd
> 
> -- 
> 2.56.0
> 

-- 
With best wishes
Dmitry
