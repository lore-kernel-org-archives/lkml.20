Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654637;
	b=FX243Aac1sBPC8e+Yag6MVbzLYzU22sw+MGidYXeVj7tGHcmF2UCIbDUA+eMartcCy+p
	 NF2h0IH/GvYLZUvW11XWOohVPSBIliWkxi5bWQOdmPETuLbwxDhnCc5HFncaGwi74GJgH
	 YTlK9QCy08YGLM7I06mAtF4Z9iDS+9oMrgkYZGhhMCPBQRAgg5t9sF5cb2hDvRNBL/JvY
	 GDitbuJdVg7D/Dx9slaoQ7PiW1oqWRKJzIX2yM+HgQWNi/p1vruyrpynr0pmVcHBUJuGv
	 TwKExh/ATBiBoR5jLFYQmCu+MB7LGVwUt0GxSLerGRmJD4I2bnWRJC82w4spZN+QwJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4hYc9omMporgQ8o9YFrSac2Ru+5Zr0Ii2QHfzgUBX1Q=;
	b=asrzHjdrRcYyIghDiPAvz7k8zdeNywFCNRmoznQ9Ft0HoWpvLoJAvd5UHd20t49iLSjB
	 /2/8VMg4PQapySvla6QICepHYrlyQHpPjtaucPqZCwQo/6pirjwDIeYrHT9w+dJJlcbQS
	 4eIXCub1Zd3QhX24Dyc20iVnc9ShWGFJzPJtsUeo/lnQ59IPhj/nuILkHoDoSvRWTfCj2
	 GGbcWydkUbFbgTpqnTkjviOrs1U9s7ZmpnbDk9Ns2RnD9RLYLzPg86W159tCc6KeFj13k
	 mapHp/twFxIUh2Wcb3Vp3jQ8rFp1T574rDdqOLJeNCUKfkSKkDV/hj1aRosDp7OYCBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3RGPXIO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1ZSyVl1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112CA606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 112CA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3RGPXIO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1ZSyVl1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M701252714175
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4hYc9omMporgQ8o9YFrSac2R
	u+5Zr0Ii2QHfzgUBX1Q=; b=G3RGPXIOEp039pvPfiEjgsS4JmCjJkF/YkT/H8ub
	8az5KUEWnNL+K6ta1ZoQU5mV501ev6ddGysJCV+Ks3zAnC0cPII3Uxtlb4gu2hNJ
	ghZ/e8MTaXnwz1VybzA609unDE8JQkz6eYSxpnARo/AcdweUpEdEYn9dvVX2szX8
	WSbnvELbP1Q9YbbHPqYCvcbwQQUP15lMh/m2yH9KfdiUzlT2HHbE5jya/GKzHtPq
	0tujhwBeHY29Ul9rIn4XUOcI7tlK4VqKcb/uc3zEsnEsm8RHgpJbOuPumqtEnFAX
	RG6OP/e9Ocecx6m+8gHgBAwB+b6Fs/M7s8jfXeRQr8X2rg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bs8e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:37:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so5683061eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792654635; x=1793259435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4hYc9omMporgQ8o9YFrSac2Ru+5Zr0Ii2QHfzgUBX1Q=;
        b=i1ZSyVl1jqMi9yF0VT+d/bujp3iX4rSC6WQctBPYvCw5dlIIfvRWwlACEx7jCUGYQB
         szV8B1UwjEwBekRqRPx3JWL3+TK+0CKVZXfYNiiJloBESNzfo4N91XxAqPOM6+WldqYK
         ZDvn9syVEJEw+bx9qE7YEfmoSDC9xo24G2hn5HayVUTaR3LcKfUpPOfUDrLXPhcHWsyv
         YVsYZ0aE7iO6NtHOfp00kpafH5Hy3+l3J3xfyo9JcO7GNnqk1PECxu+F1hY8361YddMj
         fAHNLS04MLKI4yZ2lWl6RcuRhGFoq5UrkWxufQ+w6YnQ9/fEmtKQe7FxpdQgpiWFWY44
         2a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792654635; x=1793259435;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hYc9omMporgQ8o9YFrSac2Ru+5Zr0Ii2QHfzgUBX1Q=;
        b=kdnmmj05rDfndw04tWvzaZ06qEP208nZ2kcDweXnG1qIfl5g3ZuxHp0RIsSIpDo4us
         I5r/13Uc8ByPVHFHIl2FD46n9mbXyih3djEs7zrtyNVt9hk4nnO79+vkZrWCBi6+FRXr
         l3ypotmOopi/Gw8Aitf0plLx6Mni/epsNJpRXsgmo8UkYmWRscwjulpBcdbcQ7pPoFvK
         Mp1Zw2rmJDk5ufx+1z+2daEoTgR+xlCLPo/RtxppFoVJxkCw1pGzY3rxDHGqUBPr2qYb
         WwKTkKR+6M61TjXpQo5voGVOV1SfgTmLvk3rj1qgHMX9Fx7a52nEOk5Sgm5Wh0rw7SG2
         olCw==
X-Forwarded-Encrypted: i=1; AKwUvBz9ncDT2jK7gzBHOPRoJyN3uw+wNqwYBpDNtOj2zbevkq5q4VGS5zXV/JN86UMPRFP3Ol3/yrUyrFyoJFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxHK7tFtC++9YHSAUJo0MBGeAE9ObpXHHus3tw8HRUsW8HjcVv
	6HiI2FQntPqY4t/H9ELI85zMzrYhXpxLWdzqF3+hXFHSE16ukQqofVSRh+S74wyocxcCA12zLuJ
	NRVg5FOekHrEqqI5flfXPlRGGIlRwZEvmYFdT2V4yMWcnZFvoXu/Ix0Mske6K+IsGKveVMOJlQ5
	xeHQ==
X-Gm-Gg: AYBFou3CJt/ZTS0/5EB44H6oQYFsXJ2exWfGXyLllxka/mrZGFzwfJKkBO8uUbEinWA
	QpEIxwNUSjlet8D0WCZdPdO/KLKK9gH5teB448n0bMnOwUZg7t9mozkV81qvm3M63AxgQ3lYkur
	qysIC01JwRtnjYfPlpf6Nql1jDmTtU9hz7HAOQNjax1SRKiPmfUfURAYWQjXoAGTxhw92fiXypV
	xKJqd3kbj2xdeJAfJW7dFx+tA0fcadtvqaOBMGgWStWgtVaa/wJKVq5C157uINwnsZtiGGBi6Dn
	sc8B9E1zfZrFceq0gu/legXzNFB42Ivm7fZZ6fE8ZJFiBlBludpmIwMIa/zIailcnnFg7nVqovJ
	ruJ5i/QbWhecN3MCPr5NHF82maehGj8itJu42r1tzPAwXRz9kKA==
X-Received: by 2002:a05:7300:f80a:b0:343:9eb1:9940 with SMTP id 5a478bee46e88-367c9ad42d2mr4506145eec.26.1792654634780;
        Thu, 22 Oct 2026 00:37:14 -0700 (PDT)
X-Received: by 2002:a05:7300:f80a:b0:343:9eb1:9940 with SMTP id 5a478bee46e88-367c9ad42d2mr4506118eec.26.1792654634161;
        Thu, 22 Oct 2026 00:37:14 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367f52ce166sm10507642eec.29.2026.10.22.00.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:37:13 -0700 (PDT)
Date: Thu, 22 Oct 2026 00:37:11 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v3] usb: dwc3: qcom: check for hcd in
 dwc3_qcom_read_usb2_speed
Message-ID: <atm9J7LVKhohcINl@hu-petche-lv.qualcomm.com>
References: <20261022052602.2335652-1-prashanth.k@oss.qualcomm.com>
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
In-Reply-To: <20261022052602.2335652-1-prashanth.k@oss.qualcomm.com>
X-Proofpoint-GUID: P-zWLwr9VeANIXgqQOGiB5pwa2NjwgGs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfX4ZbhX0rmXt7b
 DzYPCbej7T6gj2lcbgVdSDQq3xmCpjtsr7zzCrPBC+kbFL9qBr7/VcdCpgFEr2RbvM9xIoDYyYh
 yGuxo7tf2bSXUhTatdm8Mz7JVYzbR3Vajvfew9oLTCPLO9OEtWBPBDPzjb1a/iwtCAP7vVDBaxa
 xidrs2eHjaiQYT0GAfN56U5IvPop/FGKNwJrejXc/WdRAkF0ZLwnERWqwC0n8u5Z+dCWnq8TyT9
 51M6SAZM/0IGQE7OtiMTOhgadJxPg7KRmMHc/6WVVAEEt2q9x18KbolJUAUZTAsO30kHol/fI2j
 OyIlTwAq1S1HB+aepSEA8Tz/cr/1/QHrl1rDWZpduHMb269msxReLOsCm+FJUwRDwGRM8hMHLDj
 d67hMQzid7BHega9g41qhRiWNidJv1+qBmVUHjvrvVzFCoLVllVTz7r7bcpWuy9aQcmwgDj0UyD
 NhXssrXQhnM8rtKMOVQ==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9bd2b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pciwyVzMXmyOzB9NHcoA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMCBTYWx0ZWRfX2sPhZEKnWFCh
 jbXHigfX/Go3eDyWGJWYdp8GbqOykCJ0jwR/efA9xs2zCdQip1xDf5z2YdC/GsDm5W2KJvPt1Jm
 ubwwBKAqr0C19VUQ0lzSeEUDZ4FrOG4=
X-Proofpoint-ORIG-GUID: P-zWLwr9VeANIXgqQOGiB5pwa2NjwgGs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220030

On 26-10-22 10:56:02, Prashanth K wrote:
> Currently dwc->xhci is not cleared if xhci_plat_probe() fails. During
> system suspend, dwc3_qcom_read_usb2_speed() checks dwc->xhci and assumes
> xhci is initialised. Since the probe failed, hcd will be null, and the
> subsequent access results in a NULL pointer dereference
> 
> Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000058
> 
> Call trace:
>   dwc3_qcom_pm_suspend
>   dpm_run_callback
>   device_suspend
>   dpm_suspend
>   dpm_suspend_start
>   suspend_devices_and_enter
>   pm_suspend
> 
> Explicitly check the hcd pointer in dwc3_qcom_read_usb2_speed
> before accessing it.
> 
> Fixes: 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
> Changes in v3: 
>  - Initialised udev to null, as suggested by sashiko bot.
>  - Link to v2: https://lore.kernel.org/all/20261022044748.2303528-1-prashanth.k@oss.qualcomm.com/ 
> 
> Changes in v2:
>  - Added null pointer check in dwc3-qcom.c instead of marking xhci as null in host.c
>  - Link to v1: https://lore.kernel.org/all/20261014105711.1708244-1-prashanth.k@oss.qualcomm.com
> 
>  drivers/usb/dwc3/dwc3-qcom.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56..e4bf0d5fc9f1 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -231,7 +231,7 @@ static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
>  
>  static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
>  {
> -	struct usb_device *udev;
> +	struct usb_device *udev = NULL;
>  	struct usb_hcd __maybe_unused *hcd;
>  	struct dwc3 *dwc = &qcom->dwc;
>  
> @@ -241,9 +241,8 @@ static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, i
>  	hcd = platform_get_drvdata(dwc->xhci);
>  
>  #ifdef CONFIG_USB
> -	udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
> -#else
> -	udev = NULL;
> +	if (hcd)
> +		udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
>  #endif
>  	if (!udev)
>  		return USB_SPEED_UNKNOWN;
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen
