Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866960;
	b=XrO2jz4npVoLiCu91Sw2vYscvLFD1rnPqxc0VspLdnMA1GWIST87yGN6xq0VJQdZolq/
	 NKLdazoxcND3uG8AG2AynHzS5SbTechNmgfGykPYjmo6Qru7Xhc7P1Kph0tw2IwCMHS3D
	 u0gYWZHyC5AJkT922sNqheEYrql9gK0/6kpJKd6WJbcRMsTU9ccEVfO8/w4KibP6F/9oz
	 +6IrwsSxoAaz2OdddQnPXMe0RPGQ0QNZHORj2Uea4dnH3Bq0LO5i/xAsTzaYXmjcQT+6M
	 0Fkrwuj53SSJ58pdIjkKk+9hun100ZZ5yTYsAbEyR3iE1zezy8R3t7oHzkU3G5SmKDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ix1+20DyoRCGmBOgAiA9EOhmvPdqx6nMCYqJ+YFb1H4=;
	b=5bBECZiHbl34zEbCepbgzrBWwQep7oXy4Is2TeWk8V/fnZzsaAYnC31M2SAoxVF8IceD
	 5OARrN2PX9CYMocru/3yTuBm2AeL5V6soWeiOnCK50ot/iVRXcUpX5D2OMqhh4z8S5z3G
	 GSHzDaWOnGv7zHEdSJowxo3h/TJBrglQW0jJ5VwIQjrrfwRphGFMHpj7bl6aCsiTgP5x2
	 6UAyHwzjxF9ksm9bkmxlRRf4pEFZsIxTQoZusPB2eb4T4LCpSpsv5uEpPvS0tg6xXyRgQ
	 N3sQDuW34F4rOaWnMpRZbe1DLZCHBJ2Siumqt2BE4l5SAQTggAGXQH9dzYYhQK80NnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=memcz5aT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YOJ7WMtd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6EE606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE6EE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=memcz5aT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YOJ7WMtd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UZGC595348
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ix1+20DyoRCGmBOgAiA9EOhmvPdqx6nMCYqJ+YFb1H4=; b=memcz5aTefo4KGOZ
	rgWnJ/uabi3neKbmngooBNvd7gHrIpsZOx1v8gPp01TSx/0fhIHBJqOv+lwgFfCG
	47mYl3Tw62xnSS9XD1oqDXhK5a/cCwCK/aVh3WfzN4HGy183y1iKNnw34xGH7CNM
	4w8Z96I4V1sjRr/VMEsm3PlWdHTFJ0E+2oc1RrYHWy+IF57bJtBK8XPAutXx1Gnr
	5SnOA9FmmYdNboeTIRW1b2MUIOABLurLebyBAgssvIq6xdd4XnkDpyqgfFtQCrlj
	MgZaKBrrCyBTdr6m9HNGLaIGAfiZOPg0BL/B22YQa/XLqzoZV5RttPlEF0V78/Wo
	+SaTBA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv3en4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:22:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ca23ede8fso3494146d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866958; x=1794471758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ix1+20DyoRCGmBOgAiA9EOhmvPdqx6nMCYqJ+YFb1H4=;
        b=YOJ7WMtdQz0aIapT4F9RwpJ2i+ZE3XgX5li2D8OAA3ZdxMkOyrB23muMp/CaD6usN7
         fJP5JAMRjY0aFPc1hNf8n+yLXnPuEbHWd9meh9NQjFtJFw1wS+bK5ljm2OBd4xKND3zR
         uheh6pWUqEny6VHsU+U1Ye5NgpqgpGKRKgIvy1e0JMzA4cRH83XKidvXwWT4igX6QiRS
         BSwYIozmcmtbIVoaUNi0JIHwfr4NGdoYFYnPsdsNbGEhd8wqecVz5ORdfVCd0es0D0lO
         8HaLGcYOIgZIpuO6X3bxxs8QywZU5YItmgNUEUc7iaLP/JusFA1bdqLTE5/AGO9wfcEn
         /aLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866958; x=1794471758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ix1+20DyoRCGmBOgAiA9EOhmvPdqx6nMCYqJ+YFb1H4=;
        b=waY62X4zQb0YEAKBhW8cbwoY1mYuACz2cEV/XYKBUn/GbeSSz2ENicslDOWOOtmmrT
         AC8xGAcXFEs657YH++4No456lRghL5AK7zYKBZezZMNb1qTOKvr+Wgh7VblWn0Cf+7jV
         H8Y4WJBR9V5eXkdA8y6vyNxx81hfiFrd6OyI3ejKDFoI+z2Q3yYvaVgMLw0Ey7h99MsL
         9W33FyHfvzrMVu6ebZjwCBPK43HjAXqi0PMrUBI64B3T9E6VBFKlN3EmSj+X8qrYvb2E
         18V3rAhpwr4X0QJsWLftY0zkbO8Js3RMkzPTnq3b/4+6JfFmewIIj/1qSMrJO84FAQFX
         Xs4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxC60TLpcwj/sitZt29J4k5TTY8YTn1SynO1Z2j2ZZlVUYwqXaN2dtHZKqxZt+vSUthNSGRm4i2Hqpj3d4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xB1mmjyDIKrdhH7LiGem1QviX0kkF21CxTGaF5JBNKnFdocB7
	UjcPO3b1VHw0XQjVpEbfdAU33xbsDWkz+1Q1OPAFsQh58q/HxBptyRslFtTu62jhPdul/Vifwr0
	nfRat+AZ5FcVTrNqBDRMISzwL/zWTIWpw+iFtgEzfN25RLV1twE0K/220P0OLkhjI5qk61yP50k
	M=
X-Gm-Gg: AYBFou0FUAFwDPPVeK5qKSfl1fce3RVtDKvugoRSzbuNM7VlgfstrpTQ5YOOwNZyXgl
	ie6lb4dFAcNJnUDUob//QK0QSSh24SPZLUhGGaVYD6aQMwTr1ynKgpUwAul/5mNiAuKMPnuPZV4
	Thxx22sSK2ntCir0VlL+PYOjt3qJ4nmK6tmWij0nz1Z5dzUGB2SWvXwhWrzYAdjhDdLMsgfKV/9
	L+5m2gGgApiAlgEBcf91h9Fi4DwOrGF3pucyC8/tmvcxYpJPAxuhXZpC5vzoq5+Ln87sY9dI42G
	DQd+bzwa+YN87BNpj1VaZaJ9KqXUzwBCs/aAjiQciOygME+A/Ad75Be745wzoBiVQXc7rOkQrbt
	2rxHX7jItd/DdvU//nnCNd1afNwG3UVIqSvH2Bffg7MO4kuPaqYDtoua23x+D8uHZTJDD
X-Received: by 2002:a05:6214:5284:b0:914:521e:7da5 with SMTP id 6a1803df08f44-91ca49e1e07mr371652966d6.1.1793866957749;
        Thu, 05 Nov 2026 00:22:37 -0800 (PST)
X-Received: by 2002:a05:6214:5284:b0:914:521e:7da5 with SMTP id 6a1803df08f44-91ca49e1e07mr371652436d6.1.1793866957143;
        Thu, 05 Nov 2026 00:22:37 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b57e26b0ffsm438510a12.32.2026.11.05.00.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:22:35 -0800 (PST)
Message-ID: <2711cffc-81b0-4078-b3a4-decad4969e33@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:22:32 +0100
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
Subject: Re: [PATCH 6/6] backlight: qcom-wled: Avoid AB-BA deadlock in
 wled_module_enable()
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261104183935.1214630-1-lee@kernel.org>
 <20261104183935.1214630-7-lee@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104183935.1214630-7-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aec3cce cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cyDCuRFuYf_2H7WJZrMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX4InbrFJELR80
 IuuLKWNrFn3T1M/d/pAwdNAZQg35eGW3bc4zrgMdSt2in6Y9OXYTWeAtbdyrA6ze2a4C6VaqntR
 5y/Iu4ZbYKBqW/ED0Umb5j7J+EAakdI=
X-Proofpoint-ORIG-GUID: LKfZXK-TgoxIU5Ek3IOpdmv5OzMw671J
X-Proofpoint-GUID: LKfZXK-TgoxIU5Ek3IOpdmv5OzMw671J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX948UnPmWEd9O
 Rz1zSobzs+HgQ5PCL4AY33qhNi3vRPujo7pwDH8+MqUS/pGRfBNaapv8+AJ/R7LpFOIziIFNa/e
 Z479gFJb2pkU9MIvaFWZ8aUylk4DFx+G7iajA17XMk0y02McPyMjrc7AbGyeHte7OS1i9VbcM7l
 6hPEgR7QV6756TftcYHH3HwyK0Sh4AQ1l2H/ucu7k8pGjZNJuQciMgBAtpJCpDVgz80sCgpWm7y
 ja9g+jwEfBQrptd87xoic8bo6p2Z2zt1ls6JLW1NVUjMRWZ4wl0CrjncyfUnX1263Srraam0mk8
 v+mGmhOj6N33x2eDlRB++UKfV3lV2pBzDEGTlRuHunHUdFkHlHh0rgu5x8/M5SCeRN0+20Tk+sB
 c+CRlKTVl+vn10NLlyMlwsn8VXZEAo96NU1dY/00QnyFUSDc68+7hQ4aFvkZmwVHkdslKlDMjHR
 dXG55EOu8Avj+YYrShQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050033

On 11/4/26 7:39 PM, Lee Jones wrote:
> When disabling the WLED module (for example from wled_update_status() or
> wled_short_irq_handler()), the caller holds wled->lock and invokes
> wled_module_enable(wled, false), which calls disable_irq(wled->ovp_irq)
> and blocks waiting for any executing OVP threaded interrupt handler to
> complete.
> 
> If wled_ovp_irq_handler() is concurrently executing, it attempts to
> acquire wled->lock before running wled_auto_string_detection(),
> resulting in an AB-BA deadlock between wled->lock and IRQ completion.
> 
> Use disable_irq_nosync() instead of disable_irq() in
> wled_module_enable() so that the OVP interrupt is masked without
> synchronously waiting for the threaded handler while holding wled->lock.
> Because wled_ovp_irq_handler() may already be waiting on wled->lock when
> the module is disabled, verify under wled->lock that the module is still
> enabled and not disabled by a short before running
> wled_auto_string_detection().
> 
> Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection logic")
> Closes: https://sashiko.dev/#/bug/linux-3afa151c-7b8f-432c-8f85-8c43a83b964a
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
