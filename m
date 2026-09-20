Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C387A33986F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888778; cv=none; b=You3AOnFmeu6LfXh60Rm9UdP0woTJP656QTN+o60yV+l0dEUNyY0QM16kVND2sB1SuYGfY6mqE7M/2f33ZeaM4P6Sjk+gZoJy4TFjkBGsZQbpF0B6QI5SYAE3E8IySewnLRwO2T1dZqRY/Sv/RgPRIwD35/ydOTG1dv8VBpZDas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888778; c=relaxed/simple;
	bh=1AHr/cZDLYgzWqzLtsRYID/EwEqOKpAqpoxbl9StNXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqSQ+lhN6UqCCAw30hKtppaoCz6aGEI/2Qf6LDqtSlpMjG1K+vT6FeRtwWAkczty3izWBB2X5UvBrYM3ICxBIzp+WElk55Apek4+ZRjeXNsXXvxzHxzNRXBTtvEehYFQ8JCFH8xv0lCi/tZFp6233vlXIJbDmJ5YpaMDrHc3TRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hxq6XZli; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3nzGc0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hxq6XZli";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3nzGc0y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55Yix2097102
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X6Czf91RlGu4QgdZcqEUbxtU
	bWcfp1ToKAncC62o/K8=; b=Hxq6XZliJ05+3Kc8PEG2G7SFpszYPuZR+EoPbpQz
	3nvFbt53Noz8RYQf6fZ7aNXJJ/VGTXlma9j6ho2u/t/HSd/PteE4U0Q1wxUw4i3x
	K3XxcrQgNTgBbiiw7HZgubolBuu+n105aK/xsddb/NRjOjszd86uUP6Yygq0NoI+
	L8iVJgnegtMFqy9qkvww8l7YXLzRqYrB7wc7++tetJekgcn6rlc2B3gAkf6zP3e7
	Yasyp3Y3PxvbYSptiBJEWy4qtOGwF3sXcMwpl62hUmvB9pV//i3gfy28rQVvt8G+
	nZFCLS5Srge5og1vREgulrXIcAPY1GAZiYUucsSddqWxiA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxthne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:19:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so2771841a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888773; x=1790493573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X6Czf91RlGu4QgdZcqEUbxtUbWcfp1ToKAncC62o/K8=;
        b=K3nzGc0yLEjICeDODEH2fWJKPVZRqQJqY+JfDh33SHPuNIGN1KugfWex1LlLReMrFH
         axpjQ//cg94e+c8QjD9oqaHQFT0Rm40Rh0KYIG5COiCbEFktKYm+fqgU3PE37xIWnLFO
         E9TBoKb68aLt/rsyr/0s1HxnGRlo6kQZxT/cEcrSl8vi5aCZ6cMgRxmo9y9ClOGG5Gbi
         5jHHwzwNisUT+SU0tC1WEphLgriMEShVhNG/9i7JubkwA95cHAlAjoNJ/Mw8G2rSaG+6
         v8INNWF3ScPLQIx1T4yJz46DbEBmQAFviBZSwD/88FLKMmAG9OzQo9zSpWBC5qEfvlqC
         EPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888773; x=1790493573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6Czf91RlGu4QgdZcqEUbxtUbWcfp1ToKAncC62o/K8=;
        b=IfCYHTT6eiXjtmYK6CAShEH7rv+7/RrurpD0pQIWgQWU0uC+LRjktWSJb02EEidqbO
         9TCorbPJe5PHfqT+3ulk6npO6QtTlf9q+idO/DneYiLp9NQgVdSQRlX+q85xwDwS+ZpT
         eEagmxfQm0x732MSivEPUGQXtdnC1jn3Chgv7CoCsnpTGzcJk0TnkpQP2M0iz7RS446J
         5MwBIdzvPcWj1jcYD4fDvIH3WwPAEb4uFjGrfcAzT01d+AjA4hVsUbIOgtzwJvco3Cz2
         qKSblQTtX30ayQeA9mCJYLtvbzbJC9e3kCIf3riA8T5hQi31489xmAXwllCn0S7P9rxx
         4nCg==
X-Forwarded-Encrypted: i=1; AKwUvByvdFagWZuMnfUR4rSdgHI+qJeCdv4g9hisw4gw+I1piUPkZNtSNHDdcV9TltbdCWBOUgtX2AIvlwip8eQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n2SEnGaxagIxMWL8gNc6VyRgs9eWXrzSJdsSzeR0PtVV6xfbXq
	Cif8hkZULUlQft0A8fek7xlL8Rtsd7RM8Ech+b6adNH7uQ3pCbraCcfr6vy17jd2tVIZy+NoJuv
	lVZmEco5p8FDdthRCQXEtym9C6PkcR+Gtzy4sScyFl7IR3MuBulDj0nIL7LrMOzkoX5k=
X-Gm-Gg: AYBFou3jKOIE0EZFbX8tY+Mv/TcjWvpRWiyXRBk7zYDyiEQZ0G/GKKcGlfGE7sz/aBL
	vhHECxx+ts6GIhAmm2LbVP2O65dAZeYZ47g3s1u9FXgiNcs/bzHGEyPLyRlhRqFq+6ki12p0Fat
	J00Qf8Flv3S6FUwWzvz1/85Iy6luTK0RrrSTUbk8oAkYnsuNb4bwXZZ+uLlkofnhsfN+f4KZ01f
	veYSzaf2jXVhODZYtQlAz08/glPf4TO17WwiDmLzteUZOeKEGZndCxZRn4e6W0kSoibJ0j94DjS
	WBwMB3rSXuxyIEs47ERW6QBKnll+qP56HaINRUbRBFN2X22+HFcUIt2CWtiGWljifsT1oxZ4tY5
	0AlT0eAy3zlMZ+fXbWQ/FOlgMxMeDholElE/ADQyyKw==
X-Received: by 2002:a05:6a21:178a:b0:3dd:85a8:4c58 with SMTP id adf61e73a8af0-3dd8c57a4f5mr11492526637.31.1789888773430;
        Sun, 20 Sep 2026 00:19:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:178a:b0:3dd:85a8:4c58 with SMTP id adf61e73a8af0-3dd8c57a4f5mr11492511637.31.1789888772891;
        Sun, 20 Sep 2026 00:19:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55e29absm16867920c88.12.2026.09.20.00.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:32 -0700 (PDT)
Date: Sun, 20 Sep 2026 15:19:26 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] media: qcom: camss: vfe: Add support for VFE gen4
Message-ID: <aq-I_nDC_ua3elhY@QCOM-aGQu4IUr3Y>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-3-20db41a7f1ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-nord-v1-3-20db41a7f1ff@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6aaf8906 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=l4MyZbu1PlRJkBM_CE0A:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX0TUT2cP27CfW
 w6Dz82rJVsrwHx52zQv3xZe+CTN0Tmpj9a0g3qCzJ6T+sv+j0ljsAJ+gCCII469WMhOOyalSktN
 2Sn8i3CG0YUAoaMymdTeCwBSL2UMsa0=
X-Proofpoint-GUID: KHgLsJXrNMonv8uqFANsYT1BFZUFhg7E
X-Proofpoint-ORIG-GUID: KHgLsJXrNMonv8uqFANsYT1BFZUFhg7E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX2WXOLe9UMDBQ
 gu/RPkcL7+rk6pEfelwooxrzaejBBowfPQkUo3Km9B/eLBXD3bVQfTxvP1/LJnn8J52sHtMWTHi
 Lg/Tn4rAzVR98GMUTNE4BLF3Fm5GYhiIl+DvAJxQG5iD9eiUCz26Yt0EGAxloau+wC0Z6LcogT5
 MoVjCtXGwm4WNX1NCc06uLicrsWgtxWIk/RnQgRL7wGHaqSWVrVcNazdtPJjo3iqH8sqLp4h3DU
 dj56D07VuokOD1mChKkrp8lq6RLVh1UWVW27h8xqNMXoCI+njOePIUpime4OF10rbDlNgXcCiLP
 Lf7Tk2+n5OTK/6tygmoTNXatTNRMaKqiptAOsG2Fi78ihebhQYmmli+6Se1xz4yzLMiTN0/vGhX
 JMoJa8O0AftOW6uzb8YMk/ka2Bkks8ZudYR5tlHgV3QvHR19/O+6mGq/T4IY5uLDgoT8PE3VQ9F
 ST+2F8KgdemUK0fsRMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

On Tue, Sep 15, 2026 at 05:34:13PM +0800, Wenmeng Liu wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Add support for the VFE (Video Front End) Gen4 found on Kaanapali SoC.
> 
> In the Kaanapali camera subsystem, the front-end blocks are referred to
> as TFEs (Thin Front Ends). This driver continues to use the VFE naming
> in some places to preserve consistency with the existing code and avoid
> unnecessary renaming. Support is currently limited to three output lines,
> matching the constraints of the CAMSS framework.
> 
> Kaanapali requires REG_UPDATE and AUP_UPDATE to be issued only after all
> CSID configuration has completed. In addition, the number of AUP_UPDATE
> requests must match the number of buffers queued to the write master
> while it is being enabled.
> 
> Although real-time TFE traffic is routed through RT_CAMNOC, both
> camnoc_rt_axi and camnoc_nrt_axi clocks must be enabled. This ensures

Neither the binding's clock-names nor vfe_res_nord seems to have
camnoc_nrt_axi.

Shawn

> that the PDX_NOC, which sits downstream of both RT and NRT NOCs, exits
> reset in a fully idle state.
> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
