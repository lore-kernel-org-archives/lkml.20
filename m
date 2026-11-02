Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793601381;
	b=0rR+WZ1kDjOIB284dPwWuz73kySym0Oe2PAImJneqPx9c05B4IgTEw6FdHuE/uyqRIcF
	 q0uDPQ/452B7JH+iy0BrakacoL5T4K5rI7HdVjzPOEM2R5a+C6f/bN3+BTj1dO91eUK+Q
	 44VW6Z4mC/EX1Fo/P0KExrReDxKjEH0WdL5A/yReSmFxa6mOxXlxTA2RGDiXugsEUOk1P
	 sU8jbiK9yKsOKZb8kHR4UixYSVSPMBv2VGqvKPCz5QRU/dPjcn6PvAmPZXb9s73j5tia/
	 ILWk0V0KhTBGseiriJ7TCRDy7s0s5YQwXRwit/NVMCQ6srNWjdonwBegsl0ptY3wt4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793601381;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FNgNqTqkeVY9ayKVbUhSJOCwh1lLbqAoM2n3eAI1HTU=;
	b=La3GUKOTYR1pSBOg7w3IC5AzDmJJoXko2vvvKkgABKYWTY17t2sqV5WDy73TbOgvV14b
	 LW+tJDM3M6SeGvPHp6Hcb8PwoQVazfV+yyItZoShNjRj8Pi3u57Qnbok+mt05BeZiWGjh
	 Srb+2ETb9xnRoeqCUPR0U5n14355PunrSrsmpjhKfo4LMK3syjTaBd9shWiAymIxrDtPq
	 aIBVHXqMIVlIGmIXZDLYU/rNr1EFzHAtSRAqb1BJ8BANtNRnqDG9Cd0noT6RcaklNXq3n
	 OwCJAQJgzYSr1qUkV7YfuJqZcBTQiz7rLiiUdFQzQoQfGhqTQMuIqU8NklKGLY+B24Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IWkMDN19;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STC+iUm2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AC8606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2AC8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IWkMDN19;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STC+iUm2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vEGp3348759
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 06:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FNgNqTqkeVY9ayKVbUhSJOCw
	h1lLbqAoM2n3eAI1HTU=; b=IWkMDN19kV++YBbZMUAhz+I1I/lDK3Z6w43RDED0
	nDnD4Kk0JLUisYhJ78wK41jYqE1IC98hzX0uoDfGkx2kRg/sgqWi6X/v7w60Erzu
	ZPGWzVcOFMdCOWKWU2B6nwqarnBVjDHvQgWcOhGsSYw2kWPopPIkLIPwkrhb4ZEY
	dfzd0tSI/u/xFhMT+JXGy3wO+p15t3mk00WeN9L9/ohrkMVk7vJqmzVhw4Atw7rE
	JCF42hzSWIt0Zg/8g2Rhj3zdnIXhTuTHVhr0Q3lpRl5hhHGlAphW6zn3R+Ja5wEH
	QnnLE3QDAnbhV9fGwp4bmCUIko70yP5J4cKx+oi4/gII5g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxnhnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:36:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35cbea41088so3880217eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601378; x=1794206178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNgNqTqkeVY9ayKVbUhSJOCwh1lLbqAoM2n3eAI1HTU=;
        b=STC+iUm25DRhs+RRCDCJ5xvKil/a3zzIAL1KQXQaHkDWtkLGJmfOVj1frgNc3kvEer
         a72kRq4o3wmKZpFjNibzlRSzIoq8+DEs9jBekjkDSnFLqa2g7f+lkBVhOJ/Nf4vgtBCW
         /eDo0pbHMAXSlGVgo2L7ftzIOwipdWp7KnSSbVB3UHy9aZU+4NaIpYVokh07bozWQp5W
         9/5MoGm4YTe9sERprvWlt8XqXvADTalGdw0rCIg6WXlxQpyFE0cHktYH5DBkEAynsLLf
         E+eIymz2PigViU6S3YhN4BMXBMHmvlPzZlKayqsiex1xM9vByVZ46G0hJM1KBVFlvhpe
         UWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601378; x=1794206178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNgNqTqkeVY9ayKVbUhSJOCwh1lLbqAoM2n3eAI1HTU=;
        b=nhjCdaXtic1vYBZZR4zXeJzqlFCshc3wFci9UMzsiGab8uGETUJtVN2sKm1noXlG9J
         Ky7YTnIKyA0xQGnE5W4wrceuyhQZ78iI+vdaxcQg8x0rvwLjD9ffJdMXqF2cKduldcZJ
         B3YUfQLyE3jVEUuXvfXAzEm8VvzOkhZj9xHEkf/nUl9cznsRf673El+oHgZgjAY+BTsw
         vnL6Wqf3xzk6rMqGE8OLFPgcbI3KKlsh+aRAEJ9rsV7HzTxNqDAHTB8G5Y+kHpKNJSnH
         A98vAzO/ntIQvS3JJAuMfTp+LLK33hJnyY4ww2n9sby5jqr6rHTbEwtWfI7GqNSFxtTE
         61hA==
X-Forwarded-Encrypted: i=1; AKwUvBzGNnoWvaXXQvI50t8crrwiXhQyh4r8t/l5DYhsHqcK1xwV1UfGxigiC1J6LnMn8bvbBQziWSFze7Qzdgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL38fU0gVJeEq8A3uUBuHDoMXHD1r20L2hmVeSoedEtjGGhnwRx
	EDvhQTie1TDKNxbl/LT/WKNFd3pT4tG7B8jP+dmO0+QRAqkkatg6IWatKSthhBxMLINwRaM1S2U
	7WIqMGpVSKFsFNj0s/xUTS5ae7YzHqpr5tE8PvXjJQRwF2MKcYz4EZVBRWO+gYjq+cjM=
X-Gm-Gg: AYBFou38E8A90K0Qb8P2D45rbEi4ywwY9hlG32jGCGirFmd+0w27uALpx2WRGE0ZZQh
	WEigtD/lFfNgiOba0RtDvcqDS1LePn+PTsShjDoZ0tMAeVwd0xPgRxGxTAtEaiWoyLZfTYlfPR9
	Xnb4sDtEk0YV/XZIQ/4m+t1e5puySk6F0C5IuSDb+GATuB6xBOP88+spk8W3dETLo/6CBr2neSk
	L85VKDGI08cmCh0+lz2k4+ogdUDdc8eu+gMwqP4WKm96vLd+QwonRKC4pnIDHvZh2G5f+Pl0+Tk
	YEEjEi9iyg0CzJG+A2mMhuEOE1s3j5aKWSGsS2Cyq/26X1cVEo5WtUsn21o+NzCaq7GcCPtiHxA
	wDyerSmgPfao2jb60wXmpkJJmOq0SezuHkImgD6syvcMLdTGVvaupc2FqqGMj2b2hvIHtxarvbE
	z317aSdQ6HSOPuPN06PuoP
X-Received: by 2002:a05:7301:53cb:b0:35c:e696:2d4a with SMTP id 5a478bee46e88-36a423ea99dmr13280575eec.24.1793601378268;
        Sun, 01 Nov 2026 22:36:18 -0800 (PST)
X-Received: by 2002:a05:7301:53cb:b0:35c:e696:2d4a with SMTP id 5a478bee46e88-36a423ea99dmr13280533eec.24.1793601377560;
        Sun, 01 Nov 2026 22:36:17 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm35915433eec.7.2026.11.01.22.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:36:17 -0800 (PST)
Date: Sun, 1 Nov 2026 22:36:15 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] usb: dwc3: qcom: Enable VBUS override at probe
 for default peripheral role
Message-ID: <augvX4NwBcJot_AF@hu-petche-lv.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <3c1778a36380bb6d9123c3791f15cc3656b80145.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <3c1778a36380bb6d9123c3791f15cc3656b80145.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Proofpoint-GUID: 2idtQiQV9w1nN9xBVrzFMZFs1pGz4PSh
X-Proofpoint-ORIG-GUID: 2idtQiQV9w1nN9xBVrzFMZFs1pGz4PSh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfXzdoVNpIj0/ay
 Fi3kyYOKub3rhWBKBOw6v5auO8UL3iUlEKr9QGtlEomrRM4M8C+b6i9iROVVgchWwaBixHGyaDC
 ruac1YZ4bDQCsQzwVSZbPMxYw7FOrB4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX13xbQJqDjInk
 Y5NQP1I1Dmaz4gHItx4uO+LOYzskvUhoRPuZTi+xFqmZ66i0guY2PyF/bhlfqxUylzzl2ybazKu
 z1EO/Q+3wawQPeVB56H/DCCeSBQfJJFs6rI3bDBPxSX++AHhc6UwJiHiZ3pH8/L479aktGMuu9W
 XkQTbpsR1hLUb19L7M6cqDop110obaU4T0d1YUZ48mGvw106Q4B6ay5oZHr7kfnrh948+NsBax5
 UicKQqHey6hy7QgnFuUDjtFyqQUe0kvO1+eicBOGh6PNSYOUfVgJberEMzSdwLaU/71a3uhk2MT
 Y9jLNuokT08IiXXCrgbT2shZnOw9/rWkTmMpWNRYIS5jyumnUcHp77JTfeb00iFyDCZCLBslSIc
 lgnYN5BpBhgNEWtH8TsmNQ6UN5cq/fLmfhazWUC/QmAXmzOPrQbDjEwblPzrSuTyWz5SVfT3/5/
 sZAx1mIqpbvaCODss0A==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae82f63 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=uiTGAi7-L7myVgi5AJsA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026

On 26-10-29 00:29:37, Faisal Hassan wrote:
> When the controller is in OTG mode with usb-role-switch and
> role-switch-default-mode set to peripheral, the role notifier never sees
> a transition at probe, so the QSCRATCH VBUS override is not programmed
> and the device never gets a session-valid indication.
> 
> Enable the VBUS override at probe whenever the initial role is
> USB_ROLE_DEVICE.
> 
> Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
> suspend/resume iterations completed with no failures.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 0896a323bdda..92f1223f7b21 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -953,10 +953,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		dwc3_qcom_vbus_override_enable(qcom, true);

....

>  	} else {
>  		if ((device_property_read_bool(dev, "usb-role-switch")) &&
> -		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)) {
>  			qcom->current_role = USB_ROLE_HOST;
> -		else
> +		} else {
>  			qcom->current_role = USB_ROLE_DEVICE;
> +			dwc3_qcom_vbus_override_enable(qcom, true);
> +		}

How about move it and above [....] under device role, let above code purely determine current_role:
	if (qcom->current_role == USB_ROLE_DEVICE)
		dwc3_qcom_vbus_override_enable(qcom, true);

Peter

-- 

Thanks,
Peter Chen
