Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626367;
	b=y2dKQznBKZwcGZxPfhuJtcB4hWJ5BOuH3GFH2d+rAwNVAlH6kyq4gGRFtbeJXsvZ/weO
	 dY9v59JSmE6vm9KwiAxd6s6rFKR0xysvE08clCh4pPONSZFepWTelc3Nult5G8xsziesF
	 l2DppVPNnOKV76WL0KbqXXC+gRdlqgku+XUQFr4zcgyno9iJjtEDmUp5oml0ujnJOfLNp
	 98wJXmGw3l9xm0xhD+y9ouXIbl+V06Xi5S75Q3bbsvO0dcP8d/M6keBaqB+amzdVGikaV
	 raHrqzFw0hmOJVuZTfrA9V2Za0RTRlwfKjJ4aNz17ly3epRZPj2T74cpVBV0y6DDWYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626367;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tR+OZFxLmIVQc8z/P4BPDGWfdgglmzGmTKnECgqBzWQ=;
	b=VT5ZjVTq0ZQrzAf3SCO4/RCc+NPF4FFa8ycDP9nJ5kZ2Qq5hXuxqip2IHJQHWgVFqYXt
	 A+XO15Ucg56cWAyUPaNte/3eMRtaegc7Ta8JwGi5igd1vgRGcXZ3EZ+prQIQY8Mj86/xK
	 zL5JEsAenhrHsYacE2/0dsTGZJAD21/WyuFLs1anik9cifYUofR//Sb9ufOqLcACV0Mpf
	 6vcI+CXCjh2OLWXxze0ly1hbxMIfTCXddPbTcWm/EvCsTqf6IiVLSK07EVRApUmIqQBD1
	 +QT6ibAHknG+5qExEV+LzQRDmf/A/r6ektLWRZTto2a5zU8GgVV5xzjyQxb/NIru11Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P59XSVoH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dU7GnjLH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67562606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67562606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P59XSVoH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dU7GnjLH
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAIOg3423267
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tR+OZFxLmIVQc8z/P4BPDGWfdgglmzGmTKnECgqBzWQ=; b=P59XSVoHrOScgxf8
	JGN0AjrgGr6OODVYAzeCgr1p/pvq3QwDKplo1EDSSLQt8Cm4xW5VD9C949ZhH4B9
	C1P8FaxXatNj+Utbl1taKQ+7GamC1FPHchBqjKuHjOGol0sTs2+1GXW4GuIczrWm
	OAd9aOtPMfUBL17YDSHg9Sthv39ImYZ+RAAFJcYJzrsqe36CJUh2LcAkEvqPIO1h
	er5fdgUmIhjDg8rKPfByKg3MX5Rl815mwX3S0GvJfV2RfDX4rwY9pw3BJM9T6zpP
	lIdUMoDG+cSW3F2J0LFzdbE8nrcdvW5EQ5+WFpoKrYa03mc758EIRwCiNPO9HG4A
	XLuqJg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrh1fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:32:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ec59601279so35507e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626365; x=1794231165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tR+OZFxLmIVQc8z/P4BPDGWfdgglmzGmTKnECgqBzWQ=;
        b=dU7GnjLHsQDfuID+vnOmOcMTdTdvdbcF+nyEkPfXu4J/LFbrsjdhhj3Nq4krZWv2oR
         ITA+Lcf9BNho8QqQGjEDPzajHo8zd+DuN26FTguZ6LDP/u1cWdTkwhl9a8mY3JqZaQ3L
         OXRr2o+vHEs5fn/BWUyYyYADQjb1wdnULDfEk3NifoqVDA0jpDYNP4BOoP+ZxRF3SRGk
         dX2t7KcF3fHa9LC+RZV+a+h45gHWZ6QVDdzbzLZg1TtydA+J5P1JNbEfR9bRGskTiD/h
         zT9kb4K22usmmiVgO6UmQhJFPJEdxrVS9tEE4B2mEKGrzB67I+I12Zv5jYKvwzruBuHN
         k5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626365; x=1794231165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tR+OZFxLmIVQc8z/P4BPDGWfdgglmzGmTKnECgqBzWQ=;
        b=k+621iuNAPLRZkG3GPr3KOHWbiOudh6vUdshMdsuiifnH1XquzV9UhZHXsP1aLi9gH
         QNSX97TblkSLzvPOfheFen/zzZ4dLwg/1JOBPyj28jNt+YBuWE4b6LHWmKMjPm9vegvu
         sz9r06MlUqIrHw0b8qH/0q+UkEfQz1DA7FwcwL7BdjSOYGn9Q1qrG4ZYkIiX9+25yvms
         39ooXPnTOyaqZkac0Nuw6Egq6/oWrceExzf9yV7S//9v9spJ4kwFzKM2ZiF1LFMqzlY0
         CsPz/QIcqZW5a41zDKhcoo7baqJrayTr6fzXYDdGPtq31/kMoIVZz5PsBmHpONXH07R9
         NJ1A==
X-Forwarded-Encrypted: i=1; AKwUvBw0mYxxEUxMwBQPgrEJBfntAxcN/aou0QKSv1gX9RQejJX09ClC2oB5HaG/XaLnDJhfjq6gvCEWpj5M/qs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LRzLB63M4L/7Mo6uRg4LTKpBOuds8wy25a2UYwtSsGQaW9bpJ
	N/yOxuckdRdSi7B8GTDRndsygC4qtwLvsHPepvS5JoB1HAJm+3lpz9RPcSQAkjShsW6TKAJ9ghB
	uYxhjOUT5y2jj1uTZ7J1MD+8lPW3tRLl5ocDgwbuuhsGEBWyXrszLbqe84b9fz4FTmjQ=
X-Gm-Gg: AYBFou3HdHCvhCkH1zDlFlJePigtk+eCZubqEr/ERl6AJ2hgckQm4BbcLgXGf8fEPt2
	32wvLLBdR9510s71eVJUO2fEp+Av4MbWTAVSPpvZoEZ9w+VrWjLpEBGQeNUG2ybJgDMcJXJYbsl
	NHkeXPV2295w78o4+XsnIhNfKDStA4wXHLgIQubQxD59cnclj4k/B4r8Zr/Y0p07JMqnh5sGWh5
	pCa3u7I9vIUv6I7elz1LCfMlT/FRrqVgmAfqn8LZ+ctUrc/B25u12FWX87tpbQtfq7j3d77Fgtu
	MGv6d85h7yPv2gXTKDPYqQm/BWFm/4Nz0g0aIBho04J++rWkUp4UZLxwJ7DN1pwKe5Nx9HkKvqK
	3ztevn6GeTDZAb9ktpkp8yxL/z1E6tfjdhhGfBHcmV2CAIWn0o8znfywCDAWBcBZ7vov6vcA=
X-Received: by 2002:ac5:c3d6:0:b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ec6894cb47mr4070325e0c.4.1793626364648;
        Mon, 02 Nov 2026 05:32:44 -0800 (PST)
X-Received: by 2002:ac5:c3d6:0:b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ec6894cb47mr4070290e0c.4.1793626364119;
        Mon, 02 Nov 2026 05:32:44 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4a98asm408806566b.59.2026.11.02.05.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:32:43 -0800 (PST)
Message-ID: <4d831e77-2123-46eb-90ed-dca3c580d47e@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:32:41 +0100
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
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Leave the USB PCS alone in
 DP-only mode
To: Joonhoe Kim <26rote@gmail.com>, vkoul@kernel.org
Cc: neil.armstrong@linaro.org, mani@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, val@packett.cool,
        wesley.cheng@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261023123512.1912-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023123512.1912-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae890fd cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=nlylCrhKMTYJnl4vkq0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: Y0MyLgxQUdtQXCUNvjqZLwZq8sefcXNQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXx5KFtP0tIWmz
 VFEGYXGyHr+ldMjWBMJupEi48npFaDIRKLeKhMbAy1Ve4bpvqkTtvSV9E9q5ej8lD5q1F77qVIN
 FNvVyRmwazht8N8+iTCAdOdI5AOOcrY=
X-Proofpoint-ORIG-GUID: Y0MyLgxQUdtQXCUNvjqZLwZq8sefcXNQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXwv+ZJXsta+hI
 HugS9q6VwwqCDcQrZ7B7KTDHdTYadTz8mSV2VMq7lQ3hhKGDswvK205KASEBsAFl5kqLnGIPWG/
 +IfqhDAmmRlM4hh0Bae8BRnIq+Mgn1IWq1XNkwegadM/bFdp4FvZ+iynEJThDBUWZn0VfG1NWXF
 QmtpwJKoC0sf0ki+Mld06bnCAOaRVw1+wcNDxzvr9dhHXt5riEe1ZbMfdAhADVwGB6CXDoJXlH4
 k1tghinZwWPXhrzEa9p76tU0YO918s9RQ0nP7U+RyuRbpGkMjR8dpq5YCl6h00wyIHDucAJMfDd
 p0AgOHuyK9qQWgqgzaVBN045OGwLkbyxOUPzwnB/4ArME36ipJEhKnFqOPbBntjCrHhhqE0FIHO
 ptYQ/j7YJDfIGz/YK4FrY9+jL+ZjeLneJ81mauOmBPQaHTxhdMg7VZnxYK0IIzVHg4zPzskoZ6b
 ARJ+jc3V3enKK4RKbjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020053

On 10/23/26 2:35 PM, Joonhoe Kim wrote:
> In DP-only mode (DisplayPort pin assignments C and E) all four lanes
> belong to the DisplayPort PHY and the USB PCS stays powered down.
> Three paths still touch the USB PCS in this state:

[...]


> @@ -4459,10 +4459,12 @@ static int qmp_combo_usb_init(struct phy *phy)
>  	if (ret)
>  		return ret;
>  
> -	ret = qmp_combo_usb_power_on(phy);
> -	if (ret) {
> -		qmp_combo_com_exit(qmp, false);
> -		return ret;
> +	if (qmp->qmpphy_mode != QMPPHY_MODE_DP_ONLY) {
> +		ret = qmp_combo_usb_power_on(phy);
> +		if (ret) {
> +			qmp_combo_com_exit(qmp, false);
> +			return ret;
> +		}
>  	}

The USB sub-block provides the PIPE clock to the DWC3 controller.
If we somehow enter DP altmode before DWC3 gets to probe, or if for
any reason we need to access that controller (maybe debugfs reads),
I think this will fail.

Konrad
