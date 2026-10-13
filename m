Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6CF5218B7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908764; cv=none; b=BtRNJEvy3X0Qg8Y8NVYGE23gmLjuVxIZpwaVmy8ZC2xa02aeE5W0Envwab12bHlekbegrUErSxbHM1rRD43gvvH8tKGyBXozf83Vo2xGhhuYaAJ/QCknNu9uNH2lARksmnm/kK0VwvbqVGDD2WqqVfab2NlEjDgR0RHD5UCfedU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908764; c=relaxed/simple;
	bh=/LhdTHRISw3c+fMgpb6bY/t23rd/QPqJjlL0cArUNVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uBnBvBmWbdi5CiLhqhf+mwqI+/B2E/2FobETAWTwd2m7PXxzEbb6f0WAAgjwHQUNy7WccrKykPmNnfcw4KhdegRE5bTUTSG6iJRI2xgMlz9Du/JwDbOOHfVIO23SkFZifLy6zbNRBdGciRFeeLzZzMtcftMESMqWlCjllK+LO88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGqUDLIt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKFE+HhY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGqUDLIt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKFE+HhY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DEpvII1402895
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOwomiv3iYjegKwc0HbneIrFbyqtKJ6r4RmiI2zRloQ=; b=VGqUDLItTOQ5LmFT
	BiWV4G+SMa8fjAnVYoJVbm5Iu0C41cAcPcYs46YMMgDc8Sf8kZjbIV7qTtxmeFsb
	1lGuhHmv4vzf4welmU1KlqOmGxIf2uRF3VK07BbqxvAwrmMDjYMbzwljATpdknYD
	/KOi5a8ZGvNPPk+oY6O8woVDEnOEdO4sHLwphr7HkkuIuwQTHaqo8Ak33kG3Aa3K
	4DzcPJHo3NUk0S7AMYRt9pXTn3esSP06E4becRzkQl2Rx+HjThaeGlEARG22c8fH
	7DpFTPYALEaK0LvrGcRVsOxWyGlAl/EErYW0bwzcAsskhXzZp+p4lFw14R/yc5yo
	CG456Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9psk0efx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:25:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso25846085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791908759; x=1792513559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOwomiv3iYjegKwc0HbneIrFbyqtKJ6r4RmiI2zRloQ=;
        b=SKFE+HhYFMgWAPBM5bjiy37OocwGFoftXDngqVM/RcnGEL3AQllLsralfVQfTyNoeE
         5IENS8a7akQZGWiyHWWf8hCBtbxV067g1zICtO4SDcnpb8b3FykgZ8vZt2L3jCPdwOef
         G+NTVHSrYy4DKyDwxAvVEnN9NLi9HFkt4NNwL6b/rhFI3kS+IeNiF1GiHq0i5cVzs/Ri
         HLo/lDdPQ7hRsytEgAXowz0s+fGY6GpRFGlv8co+3OAB3zbHIHzmz/sPdSd5m9ZeJA70
         hAxzz3834WBFn3QORoP4MxPw61YVM2IPLGGI3eLbE2m6TIr3w6KlPkQda2MbY6I5QMfB
         OWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908759; x=1792513559;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOwomiv3iYjegKwc0HbneIrFbyqtKJ6r4RmiI2zRloQ=;
        b=SnYodpF/p2NAEUivuGYTaY+mR96AEBy+gfOqK3WML78M4BcFiyNU6+TLLckQ7awqIA
         /jUG9BKKlg/MYzQQlXn+GHdnOil4k3lu1UJUqp1fPytfm5mfkdOd+793/C0hJO1/UBFf
         1Cv7zR8eseqAnnvW2gfhkUKHETmHTopII1ypxCEXP9Ndcx0hZCwLSxeENoFfFuwbIPLD
         DS6qBAAgnAdk6GmK8KxgCLf9MwQZeE+IISDLs9PY65WVAFQkxyIj9KzqT3qx2IOIEmyW
         KJpwxcEtTbrWl1kEaQZLvSgtawjy+MdZguroDlPav5X4sHrP46pG67FhkyMfUwDG4xJ1
         +mzw==
X-Forwarded-Encrypted: i=1; AKwUvBw7cku+JsP/7L38a3rpEi1jQklZcUmK24YngV5KITzQi6VtThqNP/muWF3eHZKgQ/Eq62zV10d8xjnLst8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDrAmOnR+J6ZeUOgt4pkspEczUhifeTvgTkmTkEMcQzVYfbK6q
	ngwK7IaSX5nGl1admUeqJIk4FKP74jqZhBAOlohfZ7WlbwlU9Oel1yCULjpK2RjlnrwTWeLUVRr
	2akJiYgBcdLDC609mmF5OaxjT60coxbj9hu9BtQuZjY4kPtJlbIzi2dCOlUn4+3+KJzQ=
X-Gm-Gg: AYBFou3PKXSqZTWkI41REuDDwEH9G2FeMQSZ+ZFFDA9aRlAOyJa4MNY8r+4O3KbgE9o
	FAZIN6hgXu8VKCdd1gAE3ta79/U7D3mgngqVjrSfmSc99AXXTCDpzksbQVX+EE0KD8APLT4pIIp
	f95hnHS+bVL/RJQMj1HNoSspcLNe+QUbURtzi/UuOh+OxvooXdK9bXvuf2QNRXlb1LYuQlPsit1
	Nw35pTKxKbrsMGakNR+gn9rz+hQI69R5A/GIL02G0VoRwLbjy5sMQWN2XGJPhYxcE1yVco307IT
	YKpgv1a8Rz6Y6tagMXUXX5wNMt+Byv/ZUGFCYf3ORf62+RUrMlGjsaq/yMu6V1kyZpWFArhEJOT
	4bvWK+36OrOfYSHDAfTVphg==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2469759585a.4.1791908758739;
        Tue, 13 Oct 2026 09:25:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2469752985a.4.1791908758193;
        Tue, 13 Oct 2026 09:25:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839503sm48797a12.8.2026.10.13.09.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 09:25:57 -0700 (PDT)
Message-ID: <96c4e044-151d-4fd3-9d7a-2eb2b4870a89@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 18:25:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] usb: xhci: Use update_device overrides for tunnel
 reporting
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sven Peter <sven@kernel.org>
References: <20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com>
 <20260929-topic-dwc3_tunneling_state-v4-3-63e296346d57@oss.qualcomm.com>
 <asBLzaNbnBmG3mdx@vbox>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <asBLzaNbnBmG3mdx@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5cwJROZm3qiCJTck_gtCLFVCWgyB3gWI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2NSBTYWx0ZWRfXzb5Eu3akRdTJ
 vhYbJSR5N+zuLLkl3cNHueyiFqfItDm40a9xqqzmOSVgPhvQeB3+/K9jG3O+JzVivv+eVxR2zaL
 ZG2LwSfkptpOE76AIOAxCXFFUpTlgSk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2NSBTYWx0ZWRfXwtxEGGDXCXOh
 ME5Vg30gQNnZHucnE0iDD9TUUy3W+9k+i05+59JqtiLF7OJt7b8rH+qwZm1tfpSbnAM1bOjS95V
 KuoCgwSq8MVLHI5u6efqZ0fi4rErjsEljt77nXeG+wTBW7HnM/aPRMKY19boFa6dxFgj9u8KOyZ
 iRZr6bGb3rrWMuGAEJsA4LnGAjCRUOJeKbekpuIkG1WYj1mcBV//a31JcvQpSVv4XC1xTdPaLA3
 c3DTaRMnO8Rx+ecTtpqRmV3vbJc2el6lpEyzRwxwepfmzr491RyA34ZX5m0fcn4HShbZLIQ5ubZ
 HVwRtYfm3y2lKC3P/0asryFsD7DVkLCbj8qi3tHWAPi2/JD7ysk4Q1D6+TxoDzVH1j3+kyJXask
 D6i/YlDufZFpXaHdZYqZZLBcSnxj0SWGkKXvu/pXz9nmR4FM9dCoS4MMVLUz/izTZms2cFUN0pC
 FqkjAavvJvO/EQjg94A==
X-Authority-Analysis: v=2.4 cv=cbJHPXDM c=1 sm=1 tr=0 ts=6ace5b97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6DcD0Cm46KKLOwhum1cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 5cwJROZm3qiCJTck_gtCLFVCWgyB3gWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130065

On 10/3/26 2:30 AM, Thinh Nguyen wrote:
> On Tue, Sep 29, 2026, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Thunderbolt framework relies on USB core device links for tunneled
>> ports, so it needs tunnel state when xHCI updates a device.
>>
>> Use the .update_device override for controller-specific tunnel
>> reporting.
>>
>> Assisted-by: LLM
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>>  #define	XHCI_CFC_DELAY		10
>> @@ -1981,15 +1982,18 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
>>  int xhci_hub_status_data(struct usb_hcd *hcd, char *buf);
>>  int xhci_find_raw_port_number(struct usb_hcd *hcd, int port1);
>>  struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd);
>> -enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
>> -						struct xhci_port *port);
>>  void xhci_hc_died(struct xhci_hcd *xhci);
>>  
>>  #ifdef CONFIG_PM
>> +int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev);
> 
> Why are we putting this inside this PM guard?

It's like that in the original code, before moving xhci_update_device()
out of its current place

Konrad
