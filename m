Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352269;
	b=O1il5GefyGaAe5b/WsWJEYFcWl1PCLJ2MfDgPDBj+XrWJm4zurNXrJ8cXn79/xhv5E5b
	 XsSGeeeFBj4P/Uve6Ieb83SeRGUEvk9ojm8RGphV838Bkn90dvCHGtEg+FH7jwjCqtXzf
	 04rv9pKy+eT7EtmWSkZPp82zZicxkJ9YXR1FXijqypw68Ss7bAXkdN8R1gTJh9R6belR8
	 Kp6SWH3aujbV6uY9wTvPAvLx2Il6V/MmIlrw9LkXIJNTCC0Fd5TmFk6/6CUAAqt/WLCb1
	 CrydOQZvzuCYuw/c7e91MU+YXc/kh3OBkEvgOlNL6Fi3vy966bv6QVIU19hmJrX5ZfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352269;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MYuwVSfjiF3KTXkOBBaPxo7y5cx6IR9zr/hjOjRZlOo=;
	b=WZ0AY94eqWcautBduW4DFK7XgeyUNL0XHWIJsGz+TwwcevW5p69jO/IMvWYHcazMIXzB
	 ZxSY7Iw3gITSwH4y9coNVjlEoF7Wj3pCudNbZ6ZftxGIzgElFLgatr8f+WrEQy2ZCnUd+
	 v31d/m8MVaSxmtLW/aByAj2XWSJ88vyKUezp+UANF8LrDVJB+/aBRqVALA02qNakKS78Z
	 3pE3Kb1NSvyeoYmdESfrvYfawF4Sd1WUlK5e2s85EspAWJfzocKtGOcTxeKnOD6InFuh3
	 r4AJAtjaqif7PJbDq0u5WPUV7P5p887VUsYbDY6XO5jGxfqTYzEd6TuQlkhMzKe9usw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B7K7wAR8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2riCNHC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1749C606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1749C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B7K7wAR8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2riCNHC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F0wU2682263
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MYuwVSfjiF3KTXkOBBaPxo7y
	5cx6IR9zr/hjOjRZlOo=; b=B7K7wAR8/TRi8IXgGlzFrRpeKlKC0Nss9P59K2Dv
	0tZtmXcpx1/o3RURWhJrItGVzkkronq6lfrJMYqIDeb35AqaC2VsvygBzOmOCbuj
	XRLPbqdAP7Pwp1ICahKOwyZiTsCANJRGVumfbun41UG7BRRsXG7GDsKxpT6HmgUs
	vTYNPv1Jr56g/Tg1beI/lHpYtQf+TxsYbzOQYV/JlShTfRmR5mgkpBAaNI0foY69
	0I8bsMCwI1vo9ouh8AqFmnP7deEup/uW6saayMOnnGSqgU9nyJvO7xVuYK/18EgB
	+RGKpe+Jjgu/ykOSp6Rwu1rN6IAZJCHtbtAFv2YfZjbUPA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj7mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:24:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so1174152eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793352266; x=1793957066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MYuwVSfjiF3KTXkOBBaPxo7y5cx6IR9zr/hjOjRZlOo=;
        b=F2riCNHC7FVT5rd/V4GytVGWZqCgjrI6elfXyBd6z9+rdzUZe3/U6keSrdv40XA/cX
         NWM7nJBmpcYa26fzIl18N3MQPCPG7vZYyO3DVx55A03F2lPpP8qD0TEoc02ChRAK7rDM
         YfYkCPXoAmIHGWyRcvPpFT35xPnbXXFBuU6Li/Ie028m7qedEjglP5KxiQjIBsUHsA/R
         xDYPiLi6pS0/vD+m9pYaqKYUcnErUtCSiw02dtVvkPeK46LrcV4dPTkCWrh93VHUJZWM
         ILSXFER3ltMxzvIeMV6c3vSHNQ9Hx2iHJRPV9Nw3WmnV5dQEryYm/802VcBKvdmfCztG
         GEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793352266; x=1793957066;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYuwVSfjiF3KTXkOBBaPxo7y5cx6IR9zr/hjOjRZlOo=;
        b=JA6jqbsNJbutRiMreNtAKvlLsOtNGK1pyOWOxsFQFE7FM1gvzynVAX8Fiu7J/qojZ3
         3hE9tZdfdnRvsgCLZKStWPriI95ufvXVziulzIpRq/rbgyBMJjYOY9JGKEKc29SwhVaP
         WIIcyZAVPwQbx8h0z9E2AIuaCA5cUSxiXdsBS9OpwoBc7ZwR1X7DjdanBw1wyxKrPPKW
         /Jkqrp2DsC42xFUXUUbhkKdkNCji9Gg7TkAAhQMrzOuwBHCuZBfpF8MSSnTQyTgdsYsC
         9QH0lLbon6yGG5Aka98PTOI1EfpEBd3gj+XaRjMsalh32r2pXMXZ7LJDx5Tb1hTI2m6H
         Q/3w==
X-Forwarded-Encrypted: i=1; AKwUvBybFVP3QzU3Ji6A5CaRntaUMT1E82DdQfVyuqbmaNKcqsqJp8UpnUq8iQYscuRtWQxxEY3lSf0CdQaJuHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZmB5Ak097pxq8uf4kW+QMg84wuH0yrvmQpBOudeO2xiqvgk54
	Q5mLf6poCi2dFwbcWKqwFYci66rC61ppYVacj5TxMYMFTrSLPk4NeWtg3NxYMEF8x6/FH6yFlpn
	gML9m6eWX3k3w28gToh+Jyx6n1QCggHxZ3Tk9p4s2BSIfohmyM+ak3PaP+/PIi+Lsj56/3ck+We
	dV7g==
X-Gm-Gg: AYBFou3UM1um1mA5vb0+r0ZD5N9uhvvxOkOoO0tULBaubFSFNei1N//iBShJfgDU3c7
	Lp5haFYYz5xe6KGAyO5x5sp0FFreCBGOGy28EuphCv013p7FB/+W3Bzdhpp3xe1W6qidW3XZr47
	zqZ1xopg0tGWifLaJePcz4eIAgtYzm9CeT8NQC68qm3rK74z5VElFQ566XEg6ch+PpKG7FsRKht
	aKJzGHKNG80WP2sHPJQHcfdKHBBuQtx+VESdqNRGPAmDLFfJydcbCY20yAfnOSCeS6wUJZz8Ele
	eUi7zOK2/DxI8a4Q9I+M62deDv+ENOAIy9jmCWEPZW+1N2RR7ksj5s89Heg8ofJAYnjmJZ+xOzN
	ewiUMe6VfbH232dtUOzgvubg99pW6JhcvXQOUu1pW59shyzu6Lw0NGRnFOgybSP43PgZVuyj8Ks
	TSYbnAIC2jXQCfpBFFq30ixg==
X-Received: by 2002:a05:7022:eb46:10b0:193:1148:64fe with SMTP id a92af1059eb24-1ac56ca032bmr2558387c88.6.1793352266304;
        Fri, 30 Oct 2026 02:24:26 -0700 (PDT)
X-Received: by 2002:a05:7022:eb46:10b0:193:1148:64fe with SMTP id a92af1059eb24-1ac56ca032bmr2558348c88.6.1793352265714;
        Fri, 30 Oct 2026 02:24:25 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b0a628bsm5277885c88.22.2026.10.30.02.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:24:25 -0700 (PDT)
Date: Fri, 30 Oct 2026 02:24:23 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
Message-ID: <auRiR2synrBgWFhI@hu-petche-lv.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Proofpoint-GUID: 0Fe1tMr7SElCso93vAa3Ffr67qvNL_X0
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4624b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RK6R8bCIeNngQi1V4PYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfX67fCLNXcIJ3E
 sJVA1TrjWqtyMoA1lIck6sS/gp5h5WUwYCYflxcMyHfQCJEOiKmDrCLTPWxcElkT7vsh2yN7/7U
 KJXfIQO+gH8Vew7L+0nvnNqmXBf0wXVD9zXQ0Y3dvzWZrlVARsy0rVNwiUxcl4dorg4FyY0k37S
 86YKKUtj8vnnvkGvE1AgbnBqF2/9A8q1yfI641VlG8j6QHb5Ci7sycXDgnazM0AuVNMt6oDmY5G
 TDahOUtD7/L+lLiIreqUCyeFM0nHpVdTISi/kIWI3PWESloizjS1pfAk6qDBTElAvUbQsnFdv4s
 FjuuVu2MezvzO6wSnIz1sDfp9YnVPa/+wmkQ2In53NhV4P0AmmSUdafgtDiPdcEta27v8iHS3Cc
 KsWm5MVtifleaTM/3GB5r3idBtHROgt1eb5QFI4aVNFgDBel1UagTaEeXqsxokQIacrARjvE9TT
 yDfrspVN9y3JBe9JFFQ==
X-Proofpoint-ORIG-GUID: 0Fe1tMr7SElCso93vAa3Ffr67qvNL_X0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfXxZwOeSCr23fU
 QaOJ+FCU7aGXXPAgSO0GHJHj07jUUI2BKAs59Wa9eOrTLWHMYVv474wkm/8883p+tpGIecD+pgP
 hQvHVSQLCLPtnCRkayzgqoDarZfFukM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300037

On 26-10-29 00:29:31, Faisal Hassan wrote:
> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
> clocks. If clk_bulk_prepare_enable() fails, it returns with them
> disabled.

What's the relationship between clk_bulk_prepare_enable() fails and this patch?

> The next suspend returns early on is_suspended without
> re-enabling them, and the next resume disables them again, so every
> failed resume leaves the disable depth one level deeper and host-mode
> wakeup is lost for good.
> 
> Re-enabling them on the error path is not safe either: the
> level-triggered ss_phy interrupt can stay asserted, and the handler
> can't make progress while the controller is not resumed, so it would
> fire continuously.
> 
> Track whether the wakeup interrupts are armed and make enabling and
> disabling them idempotent. A failed resume now leaves them disarmed and
> balanced, and the next suspend arms them again. Disarm them in resume
> regardless of the wakeup setting, so interrupts armed by a runtime
> suspend are also disarmed when system resume runs with device wakeup
> disabled.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index d44f093ac243..d4fda4dd81f6 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -81,6 +81,7 @@ struct dwc3_qcom {
>  	enum usb_dr_mode	mode;
>  	bool			is_suspended;
>  	bool			pm_suspended;
> +	bool			wakeup_irqs_armed;
>  	struct icc_path		*icc_path_ddr;
>  	struct icc_path		*icc_path_apps;
>  
> @@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
>  	int i;
>  
> +	if (!qcom->wakeup_irqs_armed)
> +		return;
> +
>  	for (i = 0; i < qcom->num_ports; i++)
>  		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = false;
>  }
>  
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
>  	int i;
>  
> +	if (qcom->wakeup_irqs_armed)
> +		return;
> +
>  	for (i = 0; i < qcom->num_ports; i++)
>  		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = true;
>  }
>  
>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> @@ -377,8 +388,13 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>  	if (!qcom->is_suspended)
>  		return 0;
>  
> -	if (dwc3_qcom_is_host(qcom) && wakeup)
> -		dwc3_qcom_disable_interrupts(qcom);
> +	/*
> +	 * Wakeup interrupts may have been armed by an earlier runtime suspend
> +	 * even if wakeup is now disabled,

How wakeup interrupt is triggered even the wake interrupt is disabled? Is the
hardware default value makes it enabled? If it is, we need to disable all
wakeup interrupt at probe, otherwise, there are un-expected wakeup interrupts.

Peter

> so always disarm them. On failure
> +	 * they stay disarmed, as a level-triggered wakeup line could otherwise
> +	 * keep firing while the controller can't be resumed.
> +	 */
> +	dwc3_qcom_disable_interrupts(qcom);
>  
>  	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>  	if (ret < 0)
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen
