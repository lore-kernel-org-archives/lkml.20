Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BFD3D524F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384097; cv=none; b=kcEBy/AksrX29hRGewJpsqQCx8I0/zfx0HvSYYtJPZEqsdAyecR6oNoKV4VaenCIvm6BcmkQpgzS7fkvbKlygZi3b3ky8FCqKeykZLY+3ezm7s6M9K7gwZNEDbE18apecfRlw6r2CdWUGD//orieCHJ5OwqZiBfGXLtaadSjzNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384097; c=relaxed/simple;
	bh=H1sQheQGIQzZaf8BGHarv7QlsNW/7jI8aRrywt54u+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSeTbe/dXV96sL/rSlB1li2SD8P88TN83F24n10m5zrRrkrX0bkwUyQMetNfngZMyA42zVtFFV6BQOyD/74gEU6TI7w4hm3+VzJn5VyIQhhbZcJAzr1vVgheK/RB80olj/NWepgMglJx9pscDluak9ALGnnx+4wJzxs3tFmOgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcfdWNwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7V1Ys8e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcfdWNwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7V1Ys8e"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm10A901856
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GhdbIsYe4869hHdUsFlQG2aFmP9Noc9xne7Hz/Z5Kk0=; b=NcfdWNwA4xEUbFKO
	l0kyYjS19vTngKlA01bJHZwAelQFAinQFV7lzN4ca3xap6D36ZulxBcoIgAUXlLq
	ax42hev1I37yqJYfMPfCVFZQjmmE7QLhekFqPZuw3zJ5/6H+FOj3pl/1NpQ41FWM
	GJXO/EZjPZZu7uCQKQOb1s+7O/rwH3T4SvafYdngkryzUZmrMeqQXlHDWeB+YzOX
	C/hxAY3ziCcxneyUCMGkmiiFVPiw8XUoIw8m6qBuq157hTZ+Dw4vb9XTwDroNzOP
	eihMqLnluSrcli8xnI9eFovIHEe/HWzCbo3AIdQ75UPme2GSbMbiCKiWslxCPRSi
	fa9LbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrk8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:08:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f8e7ff71so35316985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384094; x=1789988894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GhdbIsYe4869hHdUsFlQG2aFmP9Noc9xne7Hz/Z5Kk0=;
        b=V7V1Ys8erBu0XnAkRDFKu8xlAU6reQMuVDwi93agEuGPZUtcyFFcHfmlqwykLgJM8e
         XFyuf6Xdz+Ho4xylWmi2e9DAWvCRB9BuVL3BZ6AEudJRrdnBaNpvrEBnYu1cKKJnhPeK
         tIDj5j9VMQsZ/C9AAYX+vdegaSfnAA5MuMC8iErjt6eXtCoBWyF4eOZLGObYdY29WWzg
         QAl160jUmGxfxZnUxPXEZgQjBgN2gkQSNNa7Eh0DEnGF3ce/h95LMP785JACrF1/xgLO
         GgSslGyaDngrTnN07EoODZEcyoPmTrr90EadWawJmekfJvLA5WQro7zoXhkIYlZ+BFC2
         bvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384094; x=1789988894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GhdbIsYe4869hHdUsFlQG2aFmP9Noc9xne7Hz/Z5Kk0=;
        b=HoTP4DX3DmkkVlVm5Edqa4JizFQdppO8obcbIJadu9+fDViwn3dAUPRQxkIR2/0j6k
         LAOIu6zW2/rS/Wl3zPwRC1D5KMeV4qAVTra5AEp5nAKr7+naioGBd2xMaoCPrW/frqDh
         B7p9MFauoPQYwADa7FbyaTyCBdqyPALIesxI9ok/YgN37orMUzXYjudCaGKWDH0rPHoT
         +6H71XCRZSIvOiPWvPyuYgtpMkh2u631/UKGUE7WjVg1mjpSBfQ+yVyxtBRNuxiGXXRh
         E4ZxLIggWOnJk8LLJHdJwhGvmalwAszCv4YFMC5wg1P7o87VhfBRsYJrUmar28L44bOJ
         CZRw==
X-Forwarded-Encrypted: i=1; AKwUvBx0sqtUXLVvSltcgE+2NjzjPR9p3bFE2DZ1Uvc/eI4eNOrBdc/Pdc1gJXFQL/J3cWTPeJAJxu+sm8S65Xs=@vger.kernel.org
X-Gm-Message-State: AFuF++nLpsvwT2gxdTS9/1/iucKkCEpU1Bpxgr2ePHs0CGJ3BVhpK3Pw
	PWL1KjJEoax7Ucr6loWUJu/JqcXBKCCePSD6Wfbzt2wUBVAmRKT0fj1ru1WxCzpJa8rCxwkFJme
	OcYlrm4WYsoZScmRnwXMfCU22Xj3vJtSeuHDeEiulwft21qfU85HxdPz3PT7tWYmFhFo=
X-Gm-Gg: AYBFou0Vy9eU1L6JPTVKYKS45K5nMXWabG63dxQgtEJ61PcvQVC+99w1aV3JFYOKkdT
	wuo2b59EdlZ1faU3x1wmaYdMxlLSUETs9kxWXhq7O6oH783LEP98q0ZJEaHiyB2YtRgxw6wTnf0
	21C4pMdBLj3fCLmZ9iWyDRhTY2pdKhzpW6zCFcbHRUPSK8FfZS8ulr4I+TWavW/yQCmpn+h8BE6
	VmaJJx5zm7mp+9lGCgKDF/ZqADnWDzxYxsQcXNSer1f9LmoQtzaXcB0VWLheP778jZ8bPJnwA4w
	gITh0UzJL5Xhq5v4HDIyhexT7yg6NTH7h1K9/0rctFVGv2TyIS2u2kk2VNfFRMycTMLnMdEL+pC
	SWqpjdZxQ+kU5MRIVtjp+bQ==
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr206572885a.5.1789384093836;
        Mon, 14 Sep 2026 04:08:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr206569085a.5.1789384093412;
        Mon, 14 Sep 2026 04:08:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608ef30sm415014166b.42.2026.09.14.04.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:08:12 -0700 (PDT)
Message-ID: <9e81308c-6d9c-451d-94a6-c4d860a8cfa0@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:08:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to
 PS8830 retimer
To: Xin Liu <xin.liu@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GBxE9eY4lNdlFCkPts8HEti91o7SQmyh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX5e+D5a0EKRrz
 ZIgA8LQgeQFXMs/vOO16RmcjVzbOuH7H0F9Epg0ylOhmG9zvr6b8WyBkDRYvTtJ4bmE9dIPhjHe
 HHKWdbhPsuSi4dw2KRE/sJkGzKkLDCM=
X-Proofpoint-GUID: GBxE9eY4lNdlFCkPts8HEti91o7SQmyh
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7d59e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1vdBnAqgM-xrE5tMc9oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX/2/nCeNnmZEd
 Hoah8Gs6KGq2RTF8x+Y4jEotSn7jAyo31rTdzzDcTOtAYnipyEKdn23xYYOwJCDB5t8uCWGNWdv
 dX4xsHdcobl7EfTlDKDW+NZ8HarnWiPrBiGjD31Sbfq77Fp8Wg5ffE8a/bVPI5I5RJvOOpavYwA
 fGzMIIOxFlmXkSEpzOQyLkf+Jul9PtrLdPD3mZPl1MJrE5I2uQYAZ4py8q+lopEBrh0xee6SE9H
 eFzs3H+68nxEW6XWe2Nej11QTOwE6Dpahx3rIxDneskW64TrlecZVe6ALO3rM4YMbnDNIMu/I0e
 qbjCh1NocnVBRewhJZ+Q0bDsM3MNmCW16VrOtvg/v25pT8L1c1bqRZvxeJ2cR/ZREOVk1XSGJaJ
 zcXA9sMEgbY1MFO+7+P7n6DTB1r1wW4HdS2Zux9glLfEqcBeALdWByddSRahLC+T3EsrLLiN8Ft
 sbiNMdlaKRzs+Vz8UWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140157

On 9/14/26 12:12 PM, Xin Liu wrote:
> The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
> I2C3 for USB Type-C port 0. Describe the retimer and route typec0
> through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.
> 
> Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
> their stale "Left unused" annotation.
> 
> The FSUSB42 SBU mux chip is present on the PCB but with all signal
> lines unconnected (NC), so remove the fsusb42 node and its pinctrl
> group. The chip is retained as a hardware fallback: should the PS8830's
> SBU path encounter issues, the FSUSB42 can be activated with a simple
> rework, avoiding a full board respin.
> 
> Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +&i2c3 {
> +	clock-frequency = <400000>;
> +	status = "okay";

In case you need to resend, please add a \n before 'status'

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
