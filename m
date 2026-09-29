Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F84535C69B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666123; cv=none; b=rU6cPRwyfiXnTSL+KDYgity5xLKElbMMUuFVD7E6j4bPpxtMlQBkGXYevFH3wb4N610LJLNf9Wx0GTdguOe2Wwi4LI/jkQROhDSZ/nexMYqkpFdD4bB1xaB/RcQE+jCEHE6SjC7XL9VTLH4YtXwgIUNfM3rpBUzy9lSRhu1HqHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666123; c=relaxed/simple;
	bh=qszUiDvaOO/n1E+7SSEf0ZKynE5xJbrnBglcmF9RpRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jdt853KQW8kXIMEpN9Bi+/W1lezyEvzKz9cdxxpDHfdWvPul3A7zvW43rCNO6zDRodSHZ0O8KCJHADFth7oquOZd0k/EiQXdfoY64kDijx+5i7EGeLMwb4i1UroP9OeEOQou/vjlZroIAlo5ctPyV1mtsNyymdjyyID2uK8lOD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2N8kMTZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EdIZSgeH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2N8kMTZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EdIZSgeH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47T1I2991310
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/utobSwhxghVA2xnPXVZCi3XdzkIWIdMCAeXFlgaONU=; b=I2N8kMTZGHQUaCTS
	cfu1f1pKXwfVUf+TcGGez2yj0leuv+1uMJLmWRaeCYMaOuoklGOaGM3srSVhePBg
	QgOcnyNbKc3TmVKIbymmWpnkEoiV81kE3OqOSpv5AWUtJg/GOMmZ5rOy+QdEK1c0
	ci4cjR/5G8sVnIRhLpkku6ywTlwKmh0YmUBCfl80oGRV0vl+Qyev09fuEeDpazRd
	XNsVffcSLDE/JaGzMYO6lK+HR+FRH+q91UOIOSGh3wg3ZafqaUlg5lE7FVLzn7zu
	kMy/lIkdxqtJm4h6oytwB3zeBaRHtESWbPRZqFkZgumyia/EkqSCk4UVYGs6DpDv
	i1Z3jg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnaqqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:15:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c63d960aeso428840585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790666120; x=1791270920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/utobSwhxghVA2xnPXVZCi3XdzkIWIdMCAeXFlgaONU=;
        b=EdIZSgeHh65ovBoSHvFu3Xv//a/h6NvfIYcDkup8MoDLUZEoyJOepaEEVYYab+PJ/t
         EDNC+tta7f6cAtMqKeqGCzI9+7yPyx0XILLV+q8CgtaIfst9itN1Gs/XiC5Ny3apk0E7
         qy1grRjT6K7cFTeOAMYD7w21K3KFmBBdGQH+PC7unxhteLxiP3YiNv2x+/OTx/4PP+HR
         XvwoN2yhr1u+mVww9A/bS2KIitsPfFZ+/7JNTliPKM64WdtXSW3H7M0AYI3d0/U5IjGX
         29yXQFkT2AVttERpHK3FONo91YTD3OrF3VaxbD7ynfKLA1KVC//t44wBeh/05PcksjWl
         bJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666120; x=1791270920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/utobSwhxghVA2xnPXVZCi3XdzkIWIdMCAeXFlgaONU=;
        b=IF+QijwYwhHtSsCO442tH16GJwc3hj4hKHYBgHnG8wNibakX68q07BrRNaMKYQaDOh
         fchRylOUoHFgUlLOCH8TuKm0h+a7imAxEDOnJhUy21aK/7phS2I5uZhyddYbPfWKuZbo
         U93ZfP5tesjARJA3Uw8mn9lATo0prALhAwYLW8VAKy9nVFi5SU3H+lxad91qvm/1T3mv
         Mdr8/2u0F4+TBIvTNtHW0kvti4mFeZ7pqJ+QVhJyXL0JkddefOBQ3wkXDJDvQqfKaKAl
         bZdgXrjYNgkZAFPO4dTz1/I4yQhMmgL7t+viWrZwfKmqCMH62idH89U7EjzUst3tqIbQ
         eH2A==
X-Forwarded-Encrypted: i=1; AKwUvBxT/ZdAc9yhbXAgLo1pVz7urJ5hbVUmLfztv8QtE+v0jY56GConbGkVwB8yQod0fi154T7pu4R8hjd3C20=@vger.kernel.org
X-Gm-Message-State: AFuF++mKAYK4eQYoWaFvNFj4lxJ/Kbcg82jB93WYjEvL3HXkSsYms9YZ
	AAWeLag83AYp7raCsdVjSlmbNyFbYcTps+Z/2Sb3nZYViwD9mdZ03bUR3c0EIcP6YiIv4Svl0GS
	4OY8NSYgIFX6pQ0sc05NiVEwLF1ClXdCvdVOYXpWvxeHz2n8BIhkTdt7z/YJcA4s5iVo=
X-Gm-Gg: AYBFou2fQMvkdpU0YCxWvAkdXuj5SAcbk0hLjCAUEVLiQeAPbcpzdkHf0Mhupu+KL/o
	QpkUCFmrZBRvImm/zJd4wZnBDwPVTyWn5TkIw7eP01pkP+9c0OmS5z8jbAIOv2s6tW5ptSqtHei
	9tImqObxa0RUbJ/XC2AM4O1h2aRCmLCn6UUFg9RZhA5evecSNgjlsaS01ywd+SjNozSbXkLOvOZ
	3Z6TSXU4JjdV08XfIlUVRN3OPYSBRbna8NA6nwsfjRKjk4FxKxrOXa5STHqWizg4AEHEmV/l3JD
	EcF2hfC2RAJzn0UFtHPUL9i/PQSNVAbmsLUjI0puhhNsu6jDJcAnoUuEu62eGgz6EZVwp9hNyse
	c2wrmwdYK698/q+MtrWwlnRprGC9yRqzvR4Zyu3C/ggHY3ZUuwrDB/Ya+g4bgyA==
X-Received: by 2002:a05:620a:801a:b0:93c:6f0e:8468 with SMTP id af79cd13be357-93c6f0eb1e6mr1223984585a.43.1790666120459;
        Tue, 29 Sep 2026 00:15:20 -0700 (PDT)
X-Received: by 2002:a05:620a:801a:b0:93c:6f0e:8468 with SMTP id af79cd13be357-93c6f0eb1e6mr1223979785a.43.1790666119968;
        Tue, 29 Sep 2026 00:15:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c0730a8sm58408545e9.0.2026.09.29.00.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 00:15:19 -0700 (PDT)
Message-ID: <4005518f-5ca7-4849-a256-5c3fd481f2f0@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 09:15:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/ti-soc-thermal: Cancel pending alert work
 on remove
To: Weigang He <geoffreyhe2@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260926124931.3599746-1-geoffreyhe2@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260926124931.3599746-1-geoffreyhe2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bKchfUlRJiZfUQy8lXkXGeNsqdZE9LzI
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abb6589 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=xTF1z28j0uidfqTO1jQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyOCBTYWx0ZWRfXyvAmXQkyvrYy
 y+8rzEY5Pq6mblAcJiAZgDILZBJsXpVGxAs03xgaowL6wV4c7zH6QL2mX19iDUhyqDuRScrB4LT
 feZrNJ+Ekko5zOa6UgTL4gHTdHjEBkt09p2uYLy7r+rGZu/GpX1XDLgg0TIyQavqIJ4mmBByVKm
 wtaN0NE5+7AsqgJZYkKvCNGmsGx6KLxNKPujw615X6EPKpDn5zcxgT2LGqOQhtgTW/uiOdvydSp
 5M4+cEWm+oyGCRwrzGOKOQPBzAmaUZ/egBKy8S5z58kp0B4AoNaSyKkDUOT8sC4v7gBF/jNpcHw
 ly4EHzDZcZvK0CL2/+Qv4yENSvPVuOPW8EayrrRq41bODRhb9ZKDB62YvHYjTyDLxHz3Qy6FbBV
 mQ6HTnPwRxcxH9Vx8bZp/qTwsXNi65MTPVMYAwavgO22h41dJ0Ld555rnD6QKFTivkXbgzBSeF3
 cF0mbxKSa080JyYXurA==
X-Proofpoint-GUID: bKchfUlRJiZfUQy8lXkXGeNsqdZE9LzI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyOCBTYWx0ZWRfX8JBEspAD5YJd
 Cyu5e9qsHwTfJyHF1lrwduhg8p5tDjt0e0rGCC9yE9hz9J1nZYma5SL0r4CmTnfIOaFQAYM+Q6W
 iL8dbK1I7JztblajMHlnRNpXnCPibXI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290028

On 9/26/26 14:49, Weigang He wrote:
> On a threshold crossing, the talert IRQ handler calls
> ti_thermal_report_sensor_temperature(), which queues the work embedded
> in the sensor's ti_thermal_data on the system workqueue. Nothing ever
> cancels or flushes that work.
> 
> ti_bandgap_remove() frees the talert IRQ last. free_irq() waits for a
> running handler, but not for the work the handler has queued. When
> remove returns, devres unregisters and frees the thermal zones and then
> frees the devm-allocated ti_thermal_data, so a work item that is still
> pending runs ti_thermal_work() on freed memory:
> 
> 	ti_thermal_work()
> 	  data = container_of(work, struct ti_thermal_data, thermal_wq);
> 	  thermal_zone_device_update(data->ti_thermal, ...);
> 
> Free the talert IRQ before removing the sensors, so that no new work
> can be queued, and cancel the work in ti_thermal_remove_sensor().
> 
> This needs an OMAP4460/4470 or OMAP5 SoC (DRA7 has TALERT but no
> ->report_temperature, so it never queues the work), a threshold crossing
> just before the driver is unbound or unloaded, and the work still
> pending when devres frees the data.
> 
> Found by static analysis tool CodeQL.
> 
> Fixes: 445eaf871bf9 ("staging: omap-thermal: common code to expose driver to thermal framework")
> Assisted-by: LLM codeql
> Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
> ---
Sounds correct to me, so if nobody is against this change I'll apply it

Thanks
