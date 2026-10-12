Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF0D404BE3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814818; cv=none; b=rrnTcwhlAswW+KcsslqvbtQiVo8IQpKWiEvklqdrItJg8/BLmJTdCYmteiUB1jUQBIoYw1wr/X6ycvrcaGnVaYv57l045ac05lIJRrAlltjrnof8qZ/G7sjV6gnZD7xBblCmL6V9ck/zPu94oBVyA2EB+u6QzJN5JCfcMqPiIKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814818; c=relaxed/simple;
	bh=vGRDJl7kyRoobjtQdlgk+yLGBbR5Hgt/PTr9zi/5TuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L97W0SaSk9dpxcelnKivb1HEsggbLbWicJHdGDdKTwwZwlRn7p8b6deixfd/hY8/YtxFakWaAtYEXJ+DBK8zQTrbDhWygKX3aClqaa6BWe4UyAt3E+l9tXJQ7d20A1I2BpXIe62PXsXhShgMzIuEYFnSWXI4frFU5cx1rK8dpr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxeHOCiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLrpWO8m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxeHOCiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLrpWO8m"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Fwf1236347
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylCK8hYC7LZLZaR0wLbmkM5b7kq2nz3B1dnKXYSCvp0=; b=LxeHOCiV+2KSo/Qa
	/QrIJiuAwRpQMW6LoLY1q6sLOwspiD3PuSd9WKVXm69JWIcOm1iQimp1bYIPWQLo
	3dj5kTWLttUk/LmXtLlKr+BgUSpjcg84eTOmIl3Npo2NmXfynxL5XZlGz3Cg4L0M
	Mp95zBa8GlM3mtRkm7td6QS7rjOVYE0nn8l6TclKM2k3PPKxyMCuFr/Vn1SjiHOt
	VX4DmODDXgYTuxmLcWwhPEl9/RPX52xRmOeYt6dPAvqvRm/dtEupswae8L2QIl1S
	+XfokUHKj5KUkXndkd52T3+FTDv+N/6e11itNGba9v+TkZtgSjvf/o9mPfbmw9Jb
	hkzhXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dkd3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:20:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso6165985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814814; x=1792419614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ylCK8hYC7LZLZaR0wLbmkM5b7kq2nz3B1dnKXYSCvp0=;
        b=XLrpWO8ml5PNxDG6GH1ikBe3bVXw/4hycA5aGJXgMHv2xtBYFT3sfjrFmbkN2HnwR3
         /Ir9BVlINteYzObM4UPQvT7H/0X5Rb/KdLWF7/NDFxKAe8gidr6+nIQfMCUanDPDtpYN
         0Kk+IxpTKMlLc8Xil3FH8SqLYG39CNMUN/0k37x4xCSx+NmBdmylpt4xr23EwkTrsYFg
         pca7dOmAvs6tfapsUGcySUNLh5KIn0XdQXABqeCBtFE8BNs11odQTVMiY2IHPBtIQwVU
         2LGwJVrritRNHbcndBl3vWmQCL0wseg0HFIt/Ss5qckXXGTo09Mj+KLYUKuV/OfFGNja
         CciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814814; x=1792419614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylCK8hYC7LZLZaR0wLbmkM5b7kq2nz3B1dnKXYSCvp0=;
        b=U8EspwGshBllIH4Y+m9ftJUqRfw1AIzgMZtus0Gl9wOjRBB5pvu5UkHHjCOxBYOfDS
         Y66xz7JihMtEKsvP9BxxpvkBnrvnDd1h5sWvF9MteXBidt8oJspC/U4euwXgV8yeGSZW
         PPTXEUoiLBg8ht2/X3coxapDJZtSAdxNmW8Ul642z/HuwMuyAdTOXJ/+cKhGwtUMCVqu
         GNuhZFN4x2FpuDGcz7zFnGiY3LfRPriYqbM7KdawaM/cOib85NonNwW7cEtGkU8MhQ5q
         yUH/as3WxBEki0FED5sfBTzOELRNI1Hpq3aQ2d7ME7uQBnK9zUyCNIoWDCT0fv/2+McY
         ScwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWlnjrdUibjz0rux4/5LVR7dGg5R/gtjZ1i43EkC5AGm9hftgJrjqicclTNZCm0444H7tesp61rV54ttk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBRAMvSlCadCoWobpaKpKYNzj1d8CrUoH8Jb6lWNJQk4HAu2/K
	2X2+KFJjcr45dK4cz79D5JRCkrc3ybBM1D1QtgQk1JJ65ZjM2NedL/39MMeI5SMXVM4JfmR/3Pm
	jstPgyFKWSc4TP5koUvkmP6pmxhdSgwfq7TSmuTF1J6ck4wP9O3mLnOjhKRCVdnHWa1o=
X-Gm-Gg: AYBFou25vWH7i0OQK5v35kCU1dxuPEPbbe909AqEM7hjN3yyfC5UhVJxF2xCKVfJunO
	xzNGCDGiNs4yFGiFP6is4zpCE7q9M+TQsIm4F85I+teP7LRjEruTo+L8DQtsK0L5Vlon+PGwUM4
	w7cq757QiHpZSAjUkhUlZIrSPKunJwgnEJzH/gplqv99wp2kQvdsEbDL6l6N0eI+zl6xO1VbX0X
	hGeNXXNS09bxgRMsfPSIscBe5/vOW7J6qXNrRNnRtzsToojFrfzOff0MNaHiQfv4WuzMlpY63xR
	MUNxClDcHow04vfyaOQb0pi8xE2PUT2EL1UJa4m5U8QOyvq8DIrdA6kq2QMmxECMWION0IWE9Ot
	o47MsL+tfiHeZqiD9MdllYA==
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr1904418885a.3.1791814813960;
        Mon, 12 Oct 2026 07:20:13 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr1904413485a.3.1791814813429;
        Mon, 12 Oct 2026 07:20:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1aaec1b9dsm2257054a12.0.2026.10.12.07.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 07:20:12 -0700 (PDT)
Message-ID: <351225fe-4698-416a-be97-df68b9297224@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:20:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: q6v5-mss: Fix memory banks count for
 SDM660
To: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261011-sdm660-mss-banks-count-v1-1-f4eced49b509@minlexx.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-sdm660-mss-banks-count-v1-1-f4eced49b509@minlexx.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NyBTYWx0ZWRfX2GIm3FDzS8x0
 TK4pQs2mw00AeTQVzjAckX4Qd1R6Ujfn/ztCvCBu1MRhJt9AJe4r4WeInYNVlyanO7VJsR2eP0C
 k1VILp6dWtq/9KFpuLDalSaA3fs8/7onbr3DUlfYDsi2OqmNyfF6vyFU2KXFVf8pB27MLIc6umE
 xhDLySG/xMJNziQqqq9X1R0FTIidiS40KTLV/fv/scB1PBh1VdNpJJdi9/l++uL3rltwv1z9iUP
 Wj1tdb4qwDQBbDGMpXfgALrxbiBr/Cbkv92fm0iQw6bHBbeQePAnV4kmiBTmOxD2EW3TFxw6OmV
 c7rh7EORyvGrJ9jEveIwPXkzVZza5hePLCqAxAYn1gavVwaAIWrbBRRhUIIGNHyS2cixhQIfBc1
 DeR0oBJ1mMAryTNfk16BJnBolY6fd32I5oCPOfVR9L9Q3uW7dfp6Vfw5WATK4z83D/fgwtES+tU
 jssCVHCwq49IiL/4UIg==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accec9e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=ZEkBDfZtAAAA:8 a=EUspDBNiAAAA:8 a=BNY3paFinK7L0Tc9HpMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22
 a=IqjDwHP2KxQYjTbYCZGP:22
X-Proofpoint-GUID: SNmSPzbB_cwd1aiiWUzrYP5McXrURbV8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NyBTYWx0ZWRfX6U/1r7nqIh0g
 4mHycB5GmnowFtKL2sEb1eO1DORmfFZ2YqKBkur49d91+7kI9QWQHmJ0QlWG8DHqsLZR5dLt5rn
 7FTtjH0YemHwXYwYaMVhC7+5AzrNuqk=
X-Proofpoint-ORIG-GUID: SNmSPzbB_cwd1aiiWUzrYP5McXrURbV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120057

On 10/11/26 2:56 PM, Alexey Minnekhanov wrote:
> As per downstream driver [1], SDM660's MSS version QDSP6v62 1.5 has 29
> banks, not 28. Leaving something unpowered sounds bad and can potentially
> cause unexpected crashes. This was missed during addition of the initial
> support for SDM660 modem remoteproc, fix it.
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/
>     LA.UM.7.2.c25-11600-sdm660.0/drivers/soc/qcom/pil-q6v5.c#L508

The linebreak here makes the link unclickable

> 
> Fixes: 10b6fec2c8c99 ("remoteproc: qcom: q6v5-mss: Add support for SDM630/636/660")
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
