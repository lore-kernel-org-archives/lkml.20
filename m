Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D894A9D5D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894280; cv=pass; b=OMILUflFakpv6w87kjemzF8NC1KMnSxKeljsdyul25tughMtLLG7D2tRCqjYGT8R2fNmS84qDaI4aTqmfU/4xNJNC6mcZol4RXEdG79OXTXxYrVRw6V24Z6uPjauZ7b6lBKjI1aV8tG6mjaKQMEco9IpgwNu/E3LMt260MZVie0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894280; c=relaxed/simple;
	bh=jUlJOAGscmKzGahwZhW1vZi2twtvH5CpgUlhI/gE7gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qP2Ls3MyqvcaC+YmoQSG/w+EeUhtOHPXuNSrfg+lueXMhYsEB23UKSNSFUtJntTZ638Wk6HnJ1NObi7kD7+WQvFW2zwyoBx++E4zgAUV+jS5NT5OKg10I4b9dQo5Tpn7wsfcPzfTVYtFW7uM7+QONOfUtvO1GlZdW2h9Xwakj3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jp7m5aax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FaSzJdDm; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jp7m5aax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FaSzJdDm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DBaUNJ3209364
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=; b=Jp7m5aaxYj2xkdlL
	M7R8sMwZwwJMzHikLYlGEXwmc4Z4MQBVEeg0ZCnfSXIxjKxj5b1k7WxeZcDZ5nIJ
	ZZ2LcpaeMz0u9gZpZiH9LPEJ5qYLCB/raFiSeJr0wczRVeVyzwNbh5l/630XOVtN
	IV4Q874QRojeN2KAQWAZjR7aw5fJ6cipK9c318fn+iD6RB9RG6gTcpkBZL6fvMTl
	QWWAWly1d7Xm+iEEx29yKpK3cAod4ncsZeXlxi5ZX1sy80+HMAL+ucqentmfXQF+
	MApnxasg/u01iYFGniqdZemDlXvn2Ny5s39a1hEIye/3oABV4KCEtjZF6yrFO092
	lSNIgg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjheag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:24:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-533928ef33aso38454551cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791894277; cv=none;
        d=google.com; s=arc-20260327;
        b=FIut4+pUGJZU3bc8mX/4g7rslFXJgM89BFsm8QsxKrb9cDokQUIrGK0ub1FGVKdwr3
         0kQQh93x23DtLcmDtA8FcDFx//ue4OtO5Svp2usPUEiBE+gmiLS+3HY1IQLDPEbUhG+b
         1g/6SnWH/EbQvQKwb/ZLyeI99yWGYDUSon7OPXllbrMBwQHES6HbuxxlDhAXvqHaw91R
         7F6pqTRIC99okn1n9lPdlxo1jf2M0KLRhv9BvSHwvpQtcLoweDpltH5XNCTuL05YB2RK
         p4N4WHfjbq9Nd00Iqs1N5kouDtjkrk4fTp6TNyj+/oLxJLNa2wefVMczPGhva+JBDpjF
         zplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=;
        fh=QNshMTIAZ1Lr8X1AO2HVyaypApmoIKPZjDHgvlI0xjw=;
        b=cZpUk/f7oyOdqr9lPmnZOCEa0IGipH4xiSq8rczErbQW+c2lzcegyW7zenNx5sDY2j
         pfMjy210fOlzAC/yjJtwwtLSZuhr8BXGHC1cicVfMbSCeP5OLR+s4YpeI3AoSzUL/43v
         I+orRQG4EIcTLheNKH0M04DHnaVGip5nP5NVXPw2KxYWdJfefqEmKlb5lJZnRMldZfQd
         OmC43JdkD1+/1N3LO3PmMdMtg9nmMKEfFDpXYBdWRig4vrC0AN3cFX1MtTZfEEt7Ek4N
         Dws2vETnQjBITjGO4M499ao3tqh5gFiIsx9gSNYOyJyN4wYC2J5mhTkIm8OnBuThhHoE
         xdmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791894277; x=1792499077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=;
        b=FaSzJdDmaGXSRz8AuguXmkMcvJF/tmVKvq3owf9x+iu43sFt620LOp5NUlKOZS7wyH
         ak5hpiYFwqtvHrSR34eFdmgwg+Ngf1e3Iehseu1bPE0V5FaN2EIZRNvNUtzzuOENDSr+
         5lnwdV2ZTU1DFon1QBTgQ5mg3/V7i+1poHzp3vgWGHWenbsSyzYFHdCjFWKo57VQ+o4u
         AJClVIGBAiBHSfERt7VczPwX48IA5EDQbrIxHf2XHhsPstSFjFnvRN1GhhOpfLx+If0r
         xWq6AdbPNJqC6YNF3uzOZJGSYaDCvBUP0tn9zaMEZoVCXnZHR2e9ImpHPzC183IwUnkt
         oOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894277; x=1792499077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=;
        b=Ae7uSvtUb4yiLr+Wd7fBl5oo89VNT2SgNx9aA+vXtcitoMGaqsxJgR95y8tN5d4mQx
         txGCFSxkJm53yJ8yZJHqJqZSBOjQlPxrmcBC4UnAUJP4fx3dVHgY+k3qxME1+S56b9uU
         dlS8xpoc+c4DEIn3CUOzaOTfk80GwGnL0hOPKqoGGh36I/9VMgP7ZXJGvvOyu7LARPTO
         7h9QGzSzChNOPlIh5t9cPUPaMykY8G2517dXgve7cs8TGPHrnukuOdfIJG44ZgyawAF9
         ZNRHpRBgf6zZ8dbA79/RUoDu5l0ekpZ82iLq/8isD4BN3p+XpFLOBTjr8nXuVvxG2ZYo
         9mLA==
X-Forwarded-Encrypted: i=1; AKwUvBxv8RyL+vH6ByQ3nHgz67uNsUcDe0dINBV3JCeDSQT/mhYoR+I+dMxlePiAo/wzhwM26iTXDzo6McDTNDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnCq8lWzGnftEascbgv61ukB/LRfZkTJ7CALFs8Gre80k59RQ3
	xeWh/HkB/IbPAYayjWTO16y0a9uLpIoH27DB187BzE7dVHfq+egN8cihHRDbCCengzBag1Uqoyq
	pJoKieh/1omZt09RyVOgx/8ta8BT8SsepxTx5G8lQSjMhaI86puGgwS8FajPcDU2HmrvrUsFclS
	vslnEqc8TNFN+8CvST+8/xHQd2eVUEl+7oLxG+GiW0Ng==
X-Gm-Gg: AYBFou3nZvc5tIvalLNfwk0pdwV+R684vPWiCzn9aQ5fi5NL48XV2qeRdt0tSalhfu2
	Js4gEo1IvSfxMqVxcwQCQBfLhgpzMatHEdGi11DSN6yw17+s7o+3cOuFJzKMF6EUIZA6Y3/Y7aM
	sVq8KtRZVMAqhPeB3ytv48sSeCTnyMHeTlH9on2Er8+v5kjxJ9tPuLRQk6uWmYlBxkqIkga6mjo
	Lz2/SSTJvtraH7GhfoJKlgnUkaxngiAgLOsZD9Z1svVq4h/ghi2aJZeLVnwwAE2iK78AR8YBrQ4
	T2bCZ4SAVWM7y4GXb/df+QS3sK/c
X-Received: by 2002:a05:622a:1c15:b0:533:21c6:f4e2 with SMTP id d75a77b69052e-5359fa9087cmr195111121cf.20.1791894277417;
        Tue, 13 Oct 2026 05:24:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1c15:b0:533:21c6:f4e2 with SMTP id
 d75a77b69052e-5359fa9087cmr195110711cf.20.1791894276755; Tue, 13 Oct 2026
 05:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com> <20261013-hawi-maili-camss-v2-1-fc93222da89c@oss.qualcomm.com>
In-Reply-To: <20261013-hawi-maili-camss-v2-1-fc93222da89c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:24:25 +0200
X-Gm-Features: AclHuK_DsaujXZKzgQcz6fY7MANZtkJtyyIAn3Pjdl47YmkPjme6QijlN0LMNHM
Message-ID: <CAFEp6-3LXSdAd5seGb1e7OZVYq1SFR+8RdK1Q6mM=2ZeZfM4FA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
X-Proofpoint-GUID: y0jMp279RDg6WhhfElJhBl8fU4LX0JH6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfXz5E+Lvq9itew
 qEhNnzTPglwwfpNpiQ9mh76hOkHRdE9fq40h55TVpV2xEC68PQTH/Phjc84KK6Ooo15Ubc38Y1K
 /H0/MLYO1C+NZlg5lKJ6Srdm+QqiYV7WfuDoHZe/ObgCV2nNmft1JUN6IQQNCVgzzJgp34rqeMt
 YiruJWdJwJCfGqkSxKsus+wdmYq3qMEcwYeE5LTqYCN8ECHFrCFqG0Ym5ZGzSqS3HUPrxY94jpm
 gPUIL3He1eM6AMfLSsomNJxwsY2BJOYm/Dgwkvt7pzzG+QFvjEOggn/m5oBOhu0ljQSufcm2pAo
 /lQ2U1889lEJGsT5x5BqT5DnmcF28uP+8kYudrU58okXlYewRy1l8RRH8SYvONjg5kF5bK6lOpN
 aZB4JYdVF+1wuwwLurSvp6CNhxywJyQiAWyFpXSxVnx653IjwJ4SF8FeQK5HBf0tInEG1USyNmM
 mGdt4dPakx0+1hEuuHw==
X-Proofpoint-ORIG-GUID: y0jMp279RDg6WhhfElJhBl8fU4LX0JH6
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace2306 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=b40KZWPJp5KrgtGOUacA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfXxDxDY5HZ9SxI
 AXB/I7EJZlBWrsvGSRFdP8QqeFeFcexBVLnWVfJKAvJSifSn2GYjbeUF5BKR2zmZztFma7uIqU6
 hvXFJWKyoLT5asJ0hwSfjYleGv2SI6Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130049

On Tue, Oct 13, 2026 at 1:03=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Document the Camera Control Interface (CCI) compatible for the Qualcomm
> Hawi platform. Like other recent platforms it requires two clocks, so
> add it to the corresponding clocks constraint as well.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c8=
73bace1764fb3e3 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,milos-cci
>                - qcom,qcm2290-cci
> @@ -137,6 +138,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
>
> --
> 2.34.1
>
