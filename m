Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D837447CA84
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324594; cv=none; b=YRyMWQ/l+IpjmVSXXTtWWzzwI6yUOxM+nJ5UWuCrv7CFbshyyPo8oXTz39NItpc5TbDC4nr15gDCs6QVhOsG40k0GvvaofRBDqUAzebn4i3bRjRZ5sgvl53VMuMbbJIBdGdSf5QxmXoBqaYJ9Augwl1fhKbjap6yHrILClAmcWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324594; c=relaxed/simple;
	bh=ap+80GaPDnXI09SxjszHeawrEkEUnedSIl8LSpSpaRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLTne+FFvFK7Naa9HCyhpIfSvtJV8DxrkTWNTIeiMKqNvZGvGtEtzq3Sv2B063C0BoSTj+ArsQVD2EGWD71o9ItYfH5ggvHo3tcTOSmT863K+jOBYZjAcQ26bq8kRK2eyOSdn2EJy4RcFUef9aLohUTkJQJ3C+y2kizf1KaqB6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QvQ9Afmz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIYmpMR7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QvQ9Afmz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIYmpMR7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I82pbT251134
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gcEYZe12IS5R8fbm0oKp4F5/
	idlukA88I/0oldtDxJQ=; b=QvQ9Afmzj/fGG+aeASrcA/JAaYzYGKk6IFlJtbUL
	W5uH3JiBvrYtBFZykDTHD+Tt8jKX4GWEdGsUD0D/CNPcV42pZYoskpnfq8yAn2TJ
	JXZqU5JFzIO7YLkjVbnQ29AjMQkbTeMKVfeGXEPu2rpZDRdhAl5uLx6qU0X/Qxg2
	D6gB8QsP3SURJ9+VxKET818hKXYkd3wIoLVBDMXRbjBGDdPQrFH+ZLYwJUC8r3W4
	yLU/HfKASohkj9S3ANaovwgwu8urHvo1FRMMb1sg4Gdb6QvubeYSQ226KPx3hdR+
	CDGjnlupNYD6znJGGMCNc3Nq9nHEt3gedBst9cjCh/7Sdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys351q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:56:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso344542685a.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792324592; x=1792929392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcEYZe12IS5R8fbm0oKp4F5/idlukA88I/0oldtDxJQ=;
        b=bIYmpMR7eSOK1TWKlF4snWvPeV2X9sgKMkfxhZvBL1mZy+NTUzGBB/VfVZhe2nb1sC
         gmmy+oHY21eV9JaBGgLcG+pB5Ah6q3Z/r+phl65oje5zIAoNrDjNDGYoSHlmKWaRVBj3
         MMQjl8pXHHhafPjE4OIaDBvR27osDZ4txyWhyGAWMROLJbvDUxvt7soeR7lYZ/zSm/32
         QcQecs5G9Df5wD1+opWNW+RK1uIE6MbiD0fClAs4sPZj0K+KOeBi9/csciAq9C962+L7
         CyBHncaPnBslpgyp3Cak6Tc5NkynaThSAwvubrKfJfB2ZfdheWjNlId8+7JZlLrhtjeY
         BybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792324592; x=1792929392;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcEYZe12IS5R8fbm0oKp4F5/idlukA88I/0oldtDxJQ=;
        b=m1BEhjgmqw616XEDFx1ZFHkuK4oT+16ofOQRN2N6Y/Iz/v6W8C/ua1c3TgPe7gQ3Fo
         2N2h5bwSp13Udwj1G1Zh/UaGGou9gKwN8P9R7wWvtv2LQdncbq7mwh829ip6N7795ymO
         RoTtLlSnPpbKvVzV00GW2s+EzIAlhL21RBU210aJE1yCLmDFPcTyKswBqJeFNYX2dhvD
         duu4KwgdNlnWT4xd+N0DKT243OK8+1cKnuqLHsYw+zMZ/HDxZOCQGGc6tsJpgi2abPvc
         H64TczGAMDWKyRv7jUnK0OizCDXg57Rek5jzwVA4p7+xPApDaRSbKFUo9dRg8yvc+7p7
         Lp9Q==
X-Forwarded-Encrypted: i=1; AKwUvBww/M2X8HaU+yraQjpVDYUeQ6uJc0KljjIZYRll/VnogfrwOKHYD9b4vfDVJhKELX80qYgLLDmNp6LuXYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZGZvlkxCjTiWU3bdHYMu7Zj/pRbrHneLFMn1bhigyQ6/Dyh3X
	CX6VK8N4FEFsRoPasvsS89ZpcNBnlhDnbihsxLiszElg9jkrcDSr2n3sSB1n6mFZiZ26j4t89n4
	0BTU/ogCwrJ7wJqEp0t7VWlNKiLMUvCljdzYvHQ4pbL8dsszEj93OnX+M3RyHWW6i1g0=
X-Gm-Gg: AYBFou04fCR76bNCOratNy6d2s+5hTEV/9Q4AlLILRRGM32byFC0epmUvFkf0gC8ux5
	OZahwe/o3QHy35YY5cH3TaagTRQKt/uFuNiTfz0N35FOJTgEFqxAV7ekra/aHx6U8KhzjrEVspZ
	sPqRMQTJaV4w6PgI21qoS9ekqY62y/efinMEUKHbluspvrL1x2BxQQi3Bz/51sw0TPxwQsiTERz
	0pj6gzqzrYSFS2Dd/wB03lo6KsgQXNiG7lIzu8DM802dMEUahVEuMe9SlVstf8JOVeDKcVowVmb
	KlvLzbW8M8yFCznPTfzgTGLxCJFUR1jC9p3u1qyfhjNt86kr6ml5mMrNq3X3xMUczAISKPV/kan
	bnOoZObbKV3qxX1l/0vrOwocql8g28IbMHLBcpwM+SCs/c1XbWRxpv0YA10HqOrDdE3YznwsnSl
	c6n2V4mPeztHA5
X-Received: by 2002:a05:620a:2314:10b0:93f:31bb:e3c with SMTP id af79cd13be357-93f31bb153bmr332141985a.68.1792324591819;
        Sun, 18 Oct 2026 04:56:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2314:10b0:93f:31bb:e3c with SMTP id af79cd13be357-93f31bb153bmr332139985a.68.1792324591331;
        Sun, 18 Oct 2026 04:56:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63cd1esm1370126e87.72.2026.10.18.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:56:29 -0700 (PDT)
Date: Sun, 18 Oct 2026 14:56:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Use DP AltMode defines
Message-ID: <46mtzsydckbt6ca66h3stj7sn37ittzarhc6nqbjp3fitaqx3x@i7b7vbpxsui6>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA0NyBTYWx0ZWRfXxpp6a66oXuwB
 2G5r1TC45mzCfFH8qKtNLsDxsh1UkXmoKstMbuDwlDCug1ZQXyXLDcuAaM0u27tde+zHV7R3Pxr
 tWpUiip6IPPQpK6BgDxbZHAOqLwzFvEfQ3IzClHfqM4WRC0b8m57TK96+ELViSlwSwMWcWksBla
 bU4JSeKtPZy3UNHgmV/jStf/fFu2gYt/tDyo5dQY9u+EehgVE/fkOYtul1+Curzu3TcPTjkEmz+
 17cpn0X4xG4M1t76lcbF3PYE6XKHGNxQJbKyrxb1SF7nMMY9dff9nv+qY9NB9F0G9hTFCXYkafe
 gZ09jK731c0DET0TmYiaVR31Jt1nrcj1gPOHSI5Gkvw1IcGqxgw1AKaR6btCwzhSSBIUg2C4NeZ
 5baPJXeN4j7ndBAglUFN6EamdFN18laqGApp0BNm8dhAQNDOgsWpUMXl5yq1cxKefagBcmVbNXv
 9FawaRq7AHnHRUrtJ8A==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad4b3f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=imkpALUroobUoGdfvlcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: hFXe-WFo2H0c5FjVuUsraTG3xRIIm_e-
X-Proofpoint-GUID: hFXe-WFo2H0c5FjVuUsraTG3xRIIm_e-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA0NyBTYWx0ZWRfXy5l4uefxqRnJ
 6pMINDqUjkLQSpNFYe30BdcCQYhHoeU0POXgMslaYHzleY6iI0qeghPTj1II2+6U7gjJ60UaFjw
 CJS4YnAQPl9p0vIwGpPcxFW6NnsEUGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180047

On Sat, Oct 17, 2026 at 09:59:33PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++++--
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts  | 9 +++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
