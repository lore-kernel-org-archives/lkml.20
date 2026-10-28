Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214207;
	b=TZxQxDLty8ccSH9cigvCBkxYja37x+bB0Yb08r3/i0J+hX5lLoClQYDjbYJ4NDp/Jyk3
	 Pb9eEGd8lcokK9UAlPuj1pBmaJDJ8K1e+cwDMvGBAaGUCzuRcB8xJircI3Z+BsUyuP6Jp
	 ELQV7AsygZyhmmQiv6WPMeW4j1JkFDCiPeLXPCAP5x/AODuFlAZ9quMjmau/4X+iS3oEZ
	 qM9sJqzWcxJcPGJHjjstFD1igqRroSutdmiO2jQsa8/feltde7fitK1R3w6+fSWxk4/l4
	 cctgsnZufCe59vjMG8+ejmw++G6TgVvKh2I92wEU0BBg1wG96LRf0PMHtn5tHzz+FHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RSOo6LMP9jDtTdJ5hdBRPvj8aB4n0MA265Z5u2qq3RE=;
	b=LNJRf24p54F6rmNgNvk4HS3H++Pk0kYliSfr9bHoS4ftu7uvoe1McznebwUIcUtVztjF
	 qy5G0zu7qtjHtyVbv2Bw3SD3jFnmolpqR3EZqIHNwwdafrwqjRB4OKPnIFNEc6YXVQY6Z
	 H6Y9GTyA2gznHvdC+rV1D/PEbVUwq0rV4NUtKi/yyH57rR7Z5qWZwPCTCd6jrW8i/f4lD
	 GT5lVFhIngjpxW4D398M72/xHemGEtJMnQmBMPMx6DJIRE3UgzCpBCJ+OPd69L1jn6naR
	 Q1pC9SRrugWRyzNvhjcN5FR+1HQZCOkaRjYXOuXG0XEh8V/pEMX503huayRAgUVkgcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGsur7X5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eAI3CLC0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBF7606BFA5
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABBF7606BFA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGsur7X5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eAI3CLC0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPqg31395684
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RSOo6LMP9jDtTdJ5hdBRPvj8aB4n0MA265Z5u2qq3RE=; b=YGsur7X5LasPkQwJ
	mAdLe+vSNO8OTd9ob+3LiQLsw1S62uw5lOPc+VszgumKjGmHuZrFC0dgdKWowhLr
	xaKbD2MpWYvNY6c/nHwuwICSXjjAqat77NRNB3G0hl0C4SCEE1Hd+D3Yo8RlYp92
	rErNH6rEjT1du9HtHVkxu/YMZkSC0r03d+qv9vtGMyAjNqyERhTAjDp5fIfH8604
	Evbexh4XzAv3fz2aPT4YhCncO53WMzvuCuj0NPCC9xIRJGy9Sr3dMkYVxgs9VQkC
	t9SYxk3heV51tiyj6I6DRSEFyKC7aGQa/6GX6ovL0Dtt1hC/gn9g4jJ74Wou2IVr
	60Ibag==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjhj66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:03:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2325645eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793214205; x=1793819005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSOo6LMP9jDtTdJ5hdBRPvj8aB4n0MA265Z5u2qq3RE=;
        b=eAI3CLC0r0viy8qIFnTBpgQTvpxKQxvBNE5zA7F+PD0mE5G2wJf9Vk84t8nCQT75X2
         EDPz/EFkAocsqO+LKZrlwhypU3BeLY86my1nQA9DoDhJeaAgLPCxrZaMicCiBy0P4Rz2
         Q7m7yzaTqh+n4OBipFTWNSMPtE6JMv+gREzOPvu+B9qH7COerIyd3xmIbmnejsV88Q1z
         pmIcMm0ejHlbsjoqyF5y5aUnhObs+t7BlxLxpfvm9XNitUwGyikxIztJLJdffwKoRtDB
         ztLD5hr9umNX7cuNTaNNfGBO5VTgoFHBVd7jjqAbge+IumztHH+ZpjYmCPDQLKX1Fnp3
         sz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214205; x=1793819005;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSOo6LMP9jDtTdJ5hdBRPvj8aB4n0MA265Z5u2qq3RE=;
        b=Dki3VXrzkDRsL3NKL6VUjYxfd7xqnFfBE4HT7+6SKIxuIEzKN9OREodHHrB3ZBgg1G
         LWYbVlfAl8rrC6tZ5lXRR2R5hN6412sAXWIRrW8ZRgAgsEyB3STV0LJqrsrh01oy7Rgl
         dfM9HngFbkTlLHMzhYv1+6Q+2vXv2SNaF96QkIDR6tB+1dvYmljdsqFJrpmufuRuZl56
         BwiMYm9majrykagREirq8VwCBLs/wZ9HDKEdg4sW3GodzaG11XpoaWDPLOZ5EXFzL/pf
         rnpiFVORck0oczrIyFF/MrRDAL1tmUMigKsU968UDvApVF76VYW/GkzO+s48jazsZJH6
         9uWQ==
X-Forwarded-Encrypted: i=1; AKwUvBy530M9+S6hyPj6EYWj9X+0vyECX73NEkUrg4Rd+Yo9ieHfZ+oTSjtfoxme5og3nJ7HYgISpeY+QYK50aY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2jGfDmRANbulCFmY58Mn/+G0MyGPx82/mqOb3nEW19wlxov1W
	cUzfA56//z0VNjOuuCTDiUNN1UiE1RrG2iFqzkd2eoKruCARzCFRkd7D1wHFmV5qIABNATkAbtS
	Vo0DgJJkfXiTemgVmJNer51w8h1Cbe7zyWEsskT7GItDKJmwC79cnT6RtqQzdukT2tnAXIFiZaH
	w=
X-Gm-Gg: AYBFou23h2O8qWzvFgL5LbX/sU5CDqI/BD32S0VZApqCOaHGWU3anOMdzwGeeE5UszF
	NogpA9ikcJLBRiPbvUmjL7HBOX5t14DhMjjFKJ25iDFeIGRPE7SnFcRcRHOsKK3/wdqfhcORHvE
	k6ZXnniI96es1r5hFgKE1IkrmwGE0vWYeovkfz4NzZpmrMU93z6E8ZaYxXoZnOagNW1qUCsFkE9
	rvczfg670mYEYNfAvPdbyCSrgKwA6YZbYBynEZo9WEMoZc7ShIEgsHAlv4kdCRc+9Rprw6ThTcj
	LWuGS8I8mJRSXxarECTsXC/eO6/dhlyJsHS40HH3/IFXkvPo1cgNlMyIg7pqvHw7w8tosiEWNYH
	ry0utoTolbbm4hZgwaoDEpHWPuWyCJZ3Tp17SqaF8s5vx6MJGmQQcDwlAIiXR7tjlBMUku7mRgQ
	5IDAsBFEbXCtJxGznDsRWlrvH9B/dPSdA=
X-Received: by 2002:a05:7300:d508:b0:369:7c:bfce with SMTP id 5a478bee46e88-36a2014adcfmr6673862eec.14.1793214204850;
        Wed, 28 Oct 2026 12:03:24 -0700 (PDT)
X-Received: by 2002:a05:7300:d508:b0:369:7c:bfce with SMTP id 5a478bee46e88-36a2014adcfmr6673777eec.14.1793214203994;
        Wed, 28 Oct 2026 12:03:23 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm19055196eec.2.2026.10.28.12.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 12:03:23 -0700 (PDT)
Message-ID: <7ecbb748-85fd-4a5b-b673-3f29b683e8af@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 12:03:21 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/3] wifi: ath11k: add a module parameter to
 select the hardware mode
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang
 <baochen.qiang@oss.qualcomm.com>,
        Semih Baskan <strst.gs@gmail.com>
References: <20261027075544.19144-1-julius@bairaktaris.de>
 <20261027075544.19144-4-julius@bairaktaris.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261027075544.19144-4-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX5GDQ5dpMIxNt
 Xc+QGDBGoMy5fduO1UGPvTcafwRZUhisXzfy2IyaNxEZ0lFTv/BWobXahuwWHpBx2+aWwdaCkSG
 jiMIsK4+6yyjPjdabOh9eAhs3Y4fR5V7aOpNtJHfWLVStbD1jqNBuKLrjI+9eertSQZjxKwtoS+
 1R+0EbQ5aBj3Sx2kSIIudS9jzGAiBgCPXK781z2pAMZb09APhK5ekmn6E/Qa58ueSKTeZsjZjgr
 CjdiwsR0VZ9inZBQ47FIS+mdIyRNgpTkLqrB6ovYuZI7/BKNROC293rvaeiwCx43RDnySV71mWy
 uhKF5cvxYQ5wfxNeEZbvf93hyJLdCG55aAN+rncZ+ypZ2eYnEwwL8vBqz7YU1aoxUEnvm/pCpL7
 llGPDj55H1CVjmnD36DYFkiuF7Nq4XzPHhV5lSqfQE12UkROk3HsYpzmXQBtNjlJbXxfd6yEBVm
 W7TJH+prGwKymjTrptw==
X-Proofpoint-GUID: DmYNTdoFlSc4NUVDtkvcRDm_I9QwN8CO
X-Proofpoint-ORIG-GUID: DmYNTdoFlSc4NUVDtkvcRDm_I9QwN8CO
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae246fd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=stkexhm8AAAA:8 a=pGLkceISAAAA:8 a=ssmgTYQ7C2hsjJ5zoukA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=pIW3pCRaVxJDc-hWtpF8:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX7fWiPFP3hoFp
 z07kzbet2EUQnbJBHGgQgHFGPD+9qsoIzI0PSwraIZCLs6QLySFoKPpEKNHWcrVhZkEErMDV0sl
 kLgu4IdUfhrzStagLQ818mXqJIqcBDE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

On 10/27/2026 12:55 AM, Julius Bairaktaris wrote:
> ath11k always uses the highest priority hardware mode the firmware
> advertises. On the Zyxel NBG7815 that is DBS+SBS, which splits the
> eight 5 GHz chains between two radios, neither with a 160 MHz channel
> width. The firmware also advertises DBS, which gives one 5 GHz radio
> with all eight chains and 160 MHz. Add a hw_mode parameter that selects
> any mode the firmware advertises; for a mode it does not advertise, warn
> with the modes it does advertise and keep the default.
> 
> On the NBG7815, hw_mode=1 brings up the 8-chain 5 GHz radio. iperf3
> from the router to a 2x2 HE client with 4 streams gave 1.22 and
> 1.20 Gbit/s at 160 MHz (two 20 s runs), against 886 Mbit/s at 80 MHz
> with the unpatched driver (one run).
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> 
> Tested-by: Semih Baskan <strst.gs@gmail.com>
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
>  drivers/net/wireless/ath/ath11k/core.c |  6 ++++++
>  drivers/net/wireless/ath/ath11k/core.h |  1 +
>  drivers/net/wireless/ath/ath11k/wmi.c  | 17 +++++++++++++++--
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 766ae27306f43..e1a6085a065a6 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -38,6 +38,12 @@ bool ath11k_ftm_mode;
>  module_param_named(ftm_mode, ath11k_ftm_mode, bool, 0444);
>  MODULE_PARM_DESC(ftm_mode, "Boots up in factory test mode");
>  
> +/* hw mode values are mapped as per enum wmi_host_hw_mode_config_type */
> +unsigned int ath11k_hw_mode = WMI_HOST_HW_MODE_MAX;
> +module_param_named(hw_mode, ath11k_hw_mode, uint, 0444);
> +MODULE_PARM_DESC(hw_mode,
> +		 "Hardware mode (0: single, 1: DBS, 2: SBS passive, 3: SBS, 4: DBS+SBS, 5: DBS or SBS, default: preferred mode the firmware supports)");
> +

Is there a different way?
Adding new module params is frowned upon.
https://msgid.link/6d553cffcb0ae84e141006ae1430f6f37909ad2b.camel@sipsolutions.net

