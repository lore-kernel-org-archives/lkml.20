Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698A62C15BB
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988442; cv=none; b=Xe0ZMpWv5cksEie6sdvKtcg0QFDh5PG5MykBiDYkQGLEGaVfzTBPLTKhH1f1iZruNiZES/BLTCt+nDFprRHH96FvSWm2PPGEwooXo9z8LnwqL3LJmNU6gYKxLdgiKDfbCki3G6ZwFHuaacZugSgD+ZY2qWyk704C2drel8c5wEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988442; c=relaxed/simple;
	bh=7MnVFgNdC3RvPzdpl/bBNmvKJknpsmhzM9+gnj4Ftng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mm9+TVrXYcgaAlUmeo4BmlRFJYHDaLUX1mm8mh4mlSdS2GXozrv8qEj+Bjw+YeJNhRerrRs0P4kTEZbcFN9XHPprVbndFdHrAY+dfki1DcUB7+v8gxiyfR/fvzhKY0zwFR4UppQxIFFH30/BWoi5WJNVJeYqE22d0RPAwYgw6oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/Q6ytf8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UBvQ1Wnh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/Q6ytf8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UBvQ1Wnh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeDoZ1503926
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZcxU10TAc9LTeYRglm1g/5Bzo8itS+vHj6k+ekfAkQ=; b=L/Q6ytf8kWv9eKaD
	xtQE0v7LF3Fw6PfttVeQgX3/zHCGQDa8tRjgtvmlCP/SgXsbjn6q8ibAAxVHx7sh
	jStM0GEul9bIF8qNtm5E0+qCEcABPZGoUsIShQlUDW4c8kYsw5dqDTiJPyDUEFIF
	prGYDqLKIluJ7V2Egi6UD1Fl7jpscIhzmq5QWpv6ZHfktYNyiN1jDl1Mqcoq87yb
	1mlLtmI1yjjj+jEfg+/wa66KCv4kVPji7Em/cne5B6zHl2rVbx0PthAOOcDil3fB
	w1/EKzWsnjp10k7GGxLkTNnwLR0xSkwPLdWH6pHNM6Mza70lVhLGH4QEKplnRkw6
	0d69cA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2n2rre4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:47:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso412995785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790988429; x=1791593229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ZcxU10TAc9LTeYRglm1g/5Bzo8itS+vHj6k+ekfAkQ=;
        b=UBvQ1WnhIWeduXK/BJww2TiHrQsPfyhhR3ZA15JJjeegtzgNv6OiejSk4Mw1dqJS5D
         x1TWnSeysN2znW1OLNnhBrwLZdyPd6SWTmroLKTHQbTusM7B+CZqGB3AdjyyAtYwOQBB
         8qdsOseZHMNSHK0SGbFuHlThOavIqK9EUK1xGzQPeTOWxu/BKk7MkFvS631vQbznu8xb
         emwWMQsXJRL/B6xMQh5hRAPNGKqWAyHrA76KDntB3PsV+17+Vn84poNYCntEsEe3SJIF
         +HTMMyHVf0EhWwwLxwQDdPRkJbAJvMayy7HzMlXRwsDQHXrtb1ljABwt2ARS+1RTq9Tf
         R4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988429; x=1791593229;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZcxU10TAc9LTeYRglm1g/5Bzo8itS+vHj6k+ekfAkQ=;
        b=SEi/RVUeqAQQYOILPaZ/GWuuLzyj1eGPuCOH1si/+cx77Jo0cjAf5nTty+VQ/jatxq
         UuCILw3k0RKaKLMLExcTrkDvIi88HuY0cPhMn3O5pBFWHN2mkF8bQXSY6AT8JEnstSCF
         4BoT5+tSzzZG2tmpTBwWWE+PmSWZnnVZ5vQGuNmDCUowFKN6s1Bg/G+JC+CrkoZWYXJT
         KNjKroO3BsiwAdD0u3Xyj/iY8TCKjWICk+X2qT8uoHw6aC5RGTfIRTurN9mUtx/8sPVu
         4tTB7XX4nz4t50OzKUIUGJ8e5LKS72fAE+AzMM8a0ANCz9OCX7U9hvSwsoKpSw+MHqHd
         hGpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvjImUAMQsHpXMAoqMfZnKP3stbHa+lWLT0xRa4UBNKjc5goPg4oq2xRsSaY7BcZNtBMNbZirwy1vcuzA=@vger.kernel.org
X-Gm-Message-State: AFuF++kGIdV9+yIMF5nV1ICBJ/jN8ZGCPPUSvAZZzIlaiC40SC8/br2Y
	oa2xXYuPYFebthub2MTJ2oAQYAwiFQOQjm5nRDx1t7+Ll0TfinEsPCX+B0iT78ujME/8MmQviQr
	xc3hLyctTsOYpCZAbsq2ilDnKp8D3M5s90FoC9XCPHQCsAgPBHsiTAkDt5uUCJ7Sni+s=
X-Gm-Gg: AYBFou3TEX/X1JbdtV8/2J7mYXwEkI6Wai3Eld0C9o62SfjP8gEWVMBX01ivu+pnfEk
	3Y59ibCvb6Zbk9Z4LkBhRgXjyQBIxsVbzQb5mts/1NjQLtTnB0Ym8T6KUk0Ew68ZWdQLnuWuE+J
	JcdgO42cztBI0RESDm6IsMkjxOuujsOmMhmaf8hI0WdZlHVCeGe/L1Dtcx8D53IWsaSbk2fRgOd
	F2qk6ZSLtHuGw+ZCY8WAc6I+VwFvkqM8xKUcjcP7RFat+56+q+NqHd/EzfZlnEVHrgCcbRQbgGA
	SZat01vwqOirmHXQxZhlnN1UvYeLhUC1PxoMs5PLY7K/oClskyZgq63GdK8rT5ayuFszO1jhurd
	s5GyymPdgfP+/YEh32p0O9SMD+7ikQMdJzMf1D6Mqx7Ha4mEu5PapYGJRho/b9tcsEk8FXT5fmT
	D6c3VDZWAR+SEh
X-Received: by 2002:a05:620a:1a10:b0:93c:65e3:df81 with SMTP id af79cd13be357-93cb5a5be1bmr1444375985a.13.1790988428838;
        Fri, 02 Oct 2026 17:47:08 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:65e3:df81 with SMTP id af79cd13be357-93cb5a5be1bmr1444372585a.13.1790988428238;
        Fri, 02 Oct 2026 17:47:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm1160748e87.11.2026.10.02.17.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:47:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: abhinav.kumar@linux.dev, Wentao Liang <vulab@iscas.ac.cn>
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, jesszhan0024@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lumag@kernel.org, marijn.suijten@somainline.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run, simona@ffwll.ch,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Fix VM leak in dsi_tx_buf_alloc_6g()
Date: Sat,  3 Oct 2026 03:46:55 +0300
Message-ID: <179098834079.3641559.2074719170971578581.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916175738.2089950-1-vulab@iscas.ac.cn>
References: <20260916175738.2089950-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d/VgWhjE c=1 sm=1 tr=0 ts=6ac0508d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=nOZalv0Y895iF468lBgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: zu9zfv76zBBoZbRvMjCBc6VYB2waV6bK
X-Proofpoint-GUID: zu9zfv76zBBoZbRvMjCBc6VYB2waV6bK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfXyhs8QLIDXwyV
 vfpw5AtNUjCiexqlkVNTI1yaI7F0z5hMXwP8lez58tv6vKD4D9xZovvkJRz1epPQ0nkKN57wFjX
 gL+nxHlP4DI1VI5lNp04qp3vkLNro+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX4Nft8BWp+2Fh
 gBv/CEk/+tLKmrIRYSVouUZIUPKCmteGZLyplggfgId05p/cQTKbzOcS6LHDYW0NOi0t006BP8s
 NyisFhU/yg2vXTZVjy/2aVmX9G8m8V356pX2ZESKtyUW88FCEhr2BcZDeNSck/ex1k09Ko65Hlu
 gOyFA6MtYrstReFxybIcng/1/ybhQtwWNhYF98ArQ/KiUuz0cT4bzQQ162qZK7itvVMsXbxmZd9
 lj09ERaLVRj3aVhV9tfJvj9EtJg8iamOuPOanlsv4JoF9zg03C1nc8VemVqllT2XjMcaOlf0Dea
 0tqrInhNIiWsFmnwB/EskyGbHtvCHhKPyEwNpc9TZjrWpU+Osh9XVRGFo4uRf4HmzOO/HD4pPMH
 pKzUE/AsjWG9oQG4RxayQ8LPXsaaIlPzq4u+0MctzIz+apGqfTjiS+0LF3wi89LW++q2BkDg54O
 GvflxFwSLwoBIX+foGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030002

On Wed, 16 Sep 2026 17:57:38 +0000, Wentao Liang wrote:
> dsi_tx_buf_alloc_6g() takes a reference to the kms VM with
> drm_gpuvm_get() and stores it in msm_host->vm.  If
> msm_gem_kernel_new() fails, the function returns early without
> dropping that reference.  Since msm_host->tx_gem_obj is cleared on
> the error path, msm_dsi_tx_buf_free() will never see a non-NULL
> tx_gem_obj and thus never calls drm_gpuvm_put(), leaking the VM
> reference.
> 
> [...]

Applied to ttt, thanks!

[1/1] drm/msm/dsi: Fix VM leak in dsi_tx_buf_alloc_6g()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ab91ba61871a

Best regards,
-- 
With best wishes
Dmitry


