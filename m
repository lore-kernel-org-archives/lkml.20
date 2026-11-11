Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367910;
	b=FG7ZZI0d6tDihFfGeI4InBUKznyQzau+KhRJvWWuizoGjQzLa7+NKzzkbmvWFs3ejUAt
	 FNt92DXPVe5qsmyhNdRjs4MNGBlZpQnJMtFylALI5bk+gJsiEj+UsLu/ke/gXHe44BHFP
	 shJCi46QHy9mgDmHVG2Gdy0tx09+jTI9uKQtcYddopdLrXGLNOaqjwArKkgEu8PsT3XJo
	 MtHFxO8GzxWNjfnF2LNbo30WQyqUsV56QkfDrZRPVYIg7Vi1cPxM5leKQ3FnTj0uVbHuk
	 wFu9kI5EldnSR6HO8RXniHrsQius+0kOMw7AyNb7vcx28eWbXt1s06VM+AQqRBbjjlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qNGauoob2TP5WIpfVA9MGfoc3EzZmkSfCenA2eySi4o=;
	b=5DR4Puq9ezrVQVnSd1Qbja45fz1hWhodl9laNokmK4oxFVQMkUvx2DkQR49ws3gGYkpn
	 SI/PNGSEo0TKebKkFIxYIg/Fjh16seQt7+nGsnrn5lwlk/znuMa3TPodpEDI6WfBBRSUM
	 iZnReP6XFq+6glj+GpzEvtvXelwVHj9JM+0tDR6xkOgbQYSWjRsxx9cg+IBGUa0pcAecE
	 qfLTnDbLErG1FtawuuiA/py41LwR9ZhtWa3sSxYfoP+dfx0pFERqr1b1fMiZYTr7JTpTQ
	 LHz9gz9ygew3TG7oYYIAs2faEn+iqt/HDOjA6PZ/vqxfBe0BPH+bWPFf8fyrV19qMSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuRGy0Y0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ypax4VbP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B522606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B522606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuRGy0Y0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ypax4VbP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1t1oq4167208
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qNGauoob2TP5WIpfVA9MGfoc
	3EzZmkSfCenA2eySi4o=; b=AuRGy0Y0w3oA8aN/uKuSGfGyCz0wlbYNypqRsPu9
	+ZtFtOtTAwbuoUnhpJtEQMCjw27JPYaoUAtaKbdcsfvYiKVMbexGfdBdJDcG6pId
	sWLIOVJ3PuMI+Jl+DXQVH7M9IbGXd7FfE8ODr8IlsajMJoXVsP8/qX4z7Lj9wari
	mKpZ2EWwLRfaN53Bb6ReMkH5fm07Edh8rjxYjl11oHCjydkCRKyJmGcwsaQ+f4K9
	quzSc0oMqOmw/kn95O83TuCtZPz5ZCU7oS17wTsspDpa4790J9X7Z/+Daf6HXi31
	JMTa2yGPcONmTSicyEQ5EKQbRaABsEIvAedG9dzxjkX1xg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4c444-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:31:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so4393734eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794367909; x=1794972709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qNGauoob2TP5WIpfVA9MGfoc3EzZmkSfCenA2eySi4o=;
        b=Ypax4VbPE6ye2OvXa33EybZYC+ejnCt4k16K9raNL4HaOZIjmxgH0YXYia6nWgbcmd
         AXohEcgvrv2nV5T6PuWnCTDoR5omr6xsSU56lJJvftZsYN1MpZIDXOOsEd5M8lytz/Dp
         CM6z5QDvkvsDsQu0H2Rd3VwfV1s6F+Ifp4Nfxf7BioUFniIaTFW4MXdjJCG35uv9lDJU
         lPnb/Iu3y92BxVJqtKOQkpP/JlZKwFieKHXOvu8DzsrYTnCv55DqisyjWxMeFf8QDhnp
         CaUhasuZaSTz2YrarCaWqF1EdO/tBAMgfTSTh2SG10AEYF+raGTDX6skDbPyHapIO18Z
         MyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367909; x=1794972709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNGauoob2TP5WIpfVA9MGfoc3EzZmkSfCenA2eySi4o=;
        b=cprekGzPTYS0mzU1zYcsk6FrivUfijtucp4AT27TB+ITMh27BLMm0on7y/eptAJime
         knn/fgrn0HWZ+/2H60hKfZ6k6vh7I2QerwST1/i2lQJrHJuQN9uAH7Z/dvVJ89slG1yp
         rZGkwLoipni43xn+WgbSjXrlUK/XBQF7XHCMtDRrm4hcoUe/EfYm5KN8caZijKwtDf8Z
         hdZP3J6fBqdSVeTsKWc/8CCfIdxsQlagN6IH8cDWt6RGe6Hy26KLKGu1UTbx/h9Z6GWh
         qx/KIz2IAbrvwBA1fq6rcVZ+l+V5Y/AB3MabepKAXMWqBcLPGhgt+U9Ld70m37mwwZn5
         nXlQ==
X-Forwarded-Encrypted: i=1; AL+hErFmeJ2GUJ0FkklJzxaiZuG/BvVTVuSM03ZyxFAHgTz5x4078FwLUelxD9sBBGYEOXTh6pmgceQDDSOvENw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9npCH1s1RVGUHoTw9z7nnPUmjeOKoYO/8xkCUbU1+B+YdDtarO
	2oaWmJB/MRHBBaNwqB1vFp1H8LKrHlc1NnD3wvVZiswFp1iwmkGyK9NmdW2S3a7n8e5VhVviN4W
	6AQdrFe4Ul+eKx4BobFWoZn/sVBEywZiWnZ5IXhkqJsUKZkrZyn/qErLGCXkqeuW/vqE=
X-Gm-Gg: AYBFou0bAIMs3ATKGmFLpfEPqudNtDQcXvVG0mJua/mwST0mtlml5MpD37VFCSk0trx
	lbgWhj7V1Pwgm0cYXIWymsISs6QpaoO4GJ3f/kSBhFLwn76pFUUmsbxHJqxMBLoM/m3StcZDl8F
	+ZckYenPT/2gR//INWREvUUcyo/ClatiRCkSdcbxK4GwG87VjicSYCU7SLjc6Zzh3sPs8g7sHBQ
	MUB/3a7LtyekMOGLKsVNKCsLiDxEq0sfG5tj2RTxHV8ph2/O+rzyfp9X448+WqzeF+YI4ahErah
	Kf1N0sBo7FXB4M2piiLNNYdGcoyNCMcL51k4c8zK8glrNhcQJku5G+of55WxxslNJK0S1MabK5K
	GNhei8DdGloFKx3Qs/eeyq91J0Vt55bDqRX0AObBjBjHAOSejdtZAESEWM+TxRJpgKIrlrs/jNx
	NVvULysl8mSCGuq3CfkqakzaE=
X-Received: by 2002:a05:7301:618d:20b0:36f:6b99:f963 with SMTP id 5a478bee46e88-37685d72e49mr1839298eec.21.1794367908703;
        Tue, 10 Nov 2026 19:31:48 -0800 (PST)
X-Received: by 2002:a05:7301:618d:20b0:36f:6b99:f963 with SMTP id 5a478bee46e88-37685d72e49mr1839266eec.21.1794367908089;
        Tue, 10 Nov 2026 19:31:48 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ff2ab59sm11513881eec.6.2026.11.10.19.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:31:47 -0800 (PST)
Date: Tue, 10 Nov 2026 19:31:45 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
Message-ID: <avPhoe95Xjn3A4ec@hu-petche-lv.qualcomm.com>
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX56pbCSMkGGlr
 YM3ZY1pKdYfe5xykpv6mwDNRKqiJUJoA+/l+yu3w8rXolqoJIeDg2e0e+8pOtc/XmLd+ZkWQ6hZ
 n/Gu+abY0GctXNdI7h27YK9IzzICyflm1Wa24L8N5b5AUG0oj32RJFdswjITGbp2BNtwZPq6ZPF
 3M5rUqBuo4Jt5k0qCkBuFgv/Losr+TPWo3R/Tnu/WSW5y299UzBvMfU7AhwlBlh3H1nKkSBOi//
 yaV9CFxa52ITLikn1I7sKlcz9PrGFOHyo+3AynpgbQSIPB6T/zDK3auxXnFTu1wWTixkKCz6l7r
 hQ6APyzlarWFAqpaz4sssftz6KrQAtSHbkepUcit9dokonFwIGn5ReiAX31m7ru9R1FnD5SdqV0
 9x7SEBUHqVbbp6sYbOKLG2QcZvdrVfxQUlW6a3gBgTvn8EoALrYGO4cgHiCsEFwZ0AbecxWNImS
 fkicdPZjeYUAnheM3MA==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af3e1a5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rNO_JpGmdzbLC-vSDh4A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX4nn8kSOxmM3x
 Kye0JXeGvponldAoFO1lUuTBsE/VR1RXRhULt01HW0UAIvQaEbOxuwMDbLhkjtSXIl/eFbgf1QW
 W9qqs2jkMBGBhMj2rF7aoIVASoXMQ4k=
X-Proofpoint-GUID: HKW9vnJJXDfCsh1Rtubj2b2OJ4sIS1Mf
X-Proofpoint-ORIG-GUID: HKW9vnJJXDfCsh1Rtubj2b2OJ4sIS1Mf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110013

On 26-11-05 15:32:16, Akash Kumar wrote:
> Increase the nominal max USB memory bandwidth vote to let DDR scale
> higher within its nominal corner, fixing glitches seen during
> simultaneous USB audio use cases.
> 
> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
> MB/s, ~1.8x). This ICC vote does not by itself determine DDR
> frequency; the vote-to-frequency mapping is platform-specific and
> comes from each target's interconnect/OPP table. On the tested
> targets, the old vote kept DDR pinned at 1 GHz within the nominal
> corner, even though DDR can run at 1.5 GHz (+50%) within the same
> corner. At 1 GHz, glitches were observed during multiple concurrent
> USB audio use cases.
> 
> Tested internally on RB3, RB4, RB8, Shikra, and other KLM targets.
> With the updated vote, DDR is allowed to run at the higher nominal
> frequency, and the following were measured (not merely projected):
> 
> - USB memory throughput: 125 MB/s -> 145 MB/s (+16%)
> - RTD-USBC audio latency: 17.9 ms -> 16.6 ms (-7.3%)
> 
> RTD-USBC is the round-trip audio latency measured over a USB-C audio
> path; lower is better. Note the +50% DDR frequency headroom does not
> map linearly to the +16% throughput gain, since throughput is also
> bounded by other factors along the USB/DDR path; the frequency
> increase is necessary but not sufficient to explain the full gain on
> its own.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
> v2: Added Details of targets Tested.
>     Added details for usb vote.
>     Added KPI Details.
>     Dropped USB AVG BW vote change which is not needed.
> 
> Link to v1: https://lore.kernel.org/all/20260611081831.2743464-1-akash.kumar@oss.qualcomm.com/
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56..3a19385969dc 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -46,7 +46,7 @@
>  #define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
>  #define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
>  #define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
> -#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
> +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(4500)
>  #define APPS_USB_AVG_BW 0
>  #define APPS_USB_PEAK_BW MBps_to_icc(40)
>  
> -- 
> 2.43.0
> 
> 

-- 

Thanks,
Peter Chen
