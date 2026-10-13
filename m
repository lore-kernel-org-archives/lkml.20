Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96D43D8100
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884029; cv=none; b=Oc4KsSODlGcb5vjoKbPnQDJDV7wWwS4z8+K1xro/yKbOTtu/pwY1/PbcfXvmMIL52VHC0Mj7evtgouVWqUjJ/uIYiVg8biZAJSyWYceH9k2LssypJghYahkvT+USRYmQbxHWXbn8aPbwNqAAN1C0ykvMg03yRYRZW+MgzbYdTto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884029; c=relaxed/simple;
	bh=nLb1b21lzxvN+3LUVcKLtkwh/UVCiSWzv09Ew8JyhUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/7HWJ6/N0CLDS4DsQgsovJJPNotiQuJcfHHxqNn8gsPl770NS4bAnIwvG92REusmCoQCsGNlTvqU7/C08uQ3r06vHpCzqZMq81Yk50r3mOBri8YWU9xZ5MD0Qi95e7ajHCD4N/hdOqZGjcJMfsUOAvGnPJC3TPm507vUKGblBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMcDl5sq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AbQVWc7C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMcDl5sq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AbQVWc7C"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D86ke2988787
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYeOkeit35ph64NPvNCMkB86ITDKOLzrRswMYB2OP18=; b=lMcDl5sqN8wEVEP8
	HsyYkfddnslcDF4/8qIWUyq3e7XibpgV7Dc6kudmFMEZUMMA6XTLT+ZPLhhTARX/
	F1Nz1brkVAP1ggGocu0rWlkV1KWTuum7ldiT3q8BMhpacjAAfDufh/qnLjKAJaAX
	HMvGXlfmO2DBShkCS3lggTt1Z6EwDhOvty+B0w0DEYZe/gdYbLZQO8j4xXt/NTJk
	EEfpadfFqtoVbQC4QSIu9PlCBYvkAMwacVzfsyF18j/U81hrSJ5ugrJh3ZI2xscw
	nagv8w/uvX3Ka4TUym8VZBEgOvwLgHBPc+QY4kATF4sBhr/UzHgaO4Wm+qctIMbU
	BkWmpQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hca783-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:33:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so537613885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791884026; x=1792488826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYeOkeit35ph64NPvNCMkB86ITDKOLzrRswMYB2OP18=;
        b=AbQVWc7C2IX2FLKljFQV07uHi/AvUB2ERFdkcG3Vo2zJ5JeL9lcOlNhc3aGNws1r5q
         8xxSbHU7vGd10JMABRrYrWTwiS1GN+eCAGCG5C+fD3a2zrUDwB0XsFxCLCG3MOcOVXbW
         CMAOfvUUCM5NJ9m3gDj0rOsANXTCetVcdsa0L8q3TV4zYU5GIRql+PLmH/MfR46HCwwW
         4rzuGwPXa9EcE8rnhPs8zOSiVd9Cxxxs703V233tVc5UVC1hwTdjGkAAOuK7wSBGXkHB
         aGijSsbxnOy/wTU8ZddVI2B8eEpWuPyF20gH4i7d+cKuxk3EwpVdXRxSBAjXZJS/bKNo
         1lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884026; x=1792488826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYeOkeit35ph64NPvNCMkB86ITDKOLzrRswMYB2OP18=;
        b=KxrgMSyAqt45QQvEGxS0lRbebb/RcFBcMlPcki8Xr4Z8VWeLYyrC2Fsm7GbrYX0eIy
         iLUtZjJx3A9vjpLFpzI58Y22cgPRRWgw+E5f9xUFGCdor41LRnPjYlIhCOFf35okW5OH
         LjyfHxVdSHRIsrbXf5IIEXyHkAR5Q6JNQz05nUyDWOB7dCeMtvmM2NSRQR3tHzdBDW/7
         SZvhSeW1a4Xo9Nq87KBRTbEfovdAbGulXK5UrKW7B5dZgjqDJvQRUmMu3aSnSpdRaF+X
         PnbhK7REDZEFFb1RmPLNbZMt9CN4SVRF684JcT+1PUnsyiXVPRCvYtk2ya7khjpmsHOG
         vGPg==
X-Forwarded-Encrypted: i=1; AKwUvBwB4OiO2JqldPdoulc5eQ0kShkSVaGGmfVQBEEqWfea6ZTXilfbMaCEnBGc+nmyLaKrb8xLxuh79Qbvlu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZSwd3W3FRic8lVS8wHZq5uWSARbW7SOKlJpx7GpbUlRG2guSU
	cfjM7yoHlkGb3CZKOp0m723e14XzgCCYB9Lol3ripnoXCG+R81+YJb97REk/OHvBs5DZOLn32mh
	kl/4FU9p0lUdxAjYEfE2lrH2EJ02GoaJC915wdEo5LBxkTaJ8iE9CnHvaMxhPXajfSGE=
X-Gm-Gg: AYBFou0pPp4rNc4zGwqpnSOTUCwHfq0F358Fg0rYayHhaHUIa6zxEGfGMPx8L/WwbvT
	IroFUHBPJg9iwnqZWOcfUiC1BkKD+npi8zPMXC8plQZfQSbOcW9zVeBmW4hfTaHRqo2Czw3Hinf
	2fVok5pSHbWRZUq17I9HXhyHkcJZzcuELNCpquGKo0kP5X+JSCufBm/hfcBt6QWjrn1nbAkCCYB
	1MUSvfgsEF1+mX+nD9QOG6XkZMiYZAUQTSOoUouUw/k+H3FWRTmfxT+Rsl5Qg9GawEjoABeRuh0
	DOhQGp9z0O90rhuJxrqY9EE0lLMSjuea/h+wXRRQX4NZXpTyvB+F2r62kFvJth+pkcvgzQEskT8
	mtoeGl5zgVGtb6D4u0a/j1nOzm6f2LMeUTYfY6VYSZs0g++tSDqEc+ZoiKqOPCQ==
X-Received: by 2002:a05:620a:408d:b0:93e:5508:24f8 with SMTP id af79cd13be357-93eb9677234mr2019268685a.32.1791884025813;
        Tue, 13 Oct 2026 02:33:45 -0700 (PDT)
X-Received: by 2002:a05:620a:408d:b0:93e:5508:24f8 with SMTP id af79cd13be357-93eb9677234mr2019265685a.32.1791884025327;
        Tue, 13 Oct 2026 02:33:45 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac3970sm3930449f8f.37.2026.10.13.02.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:33:44 -0700 (PDT)
Message-ID: <a5e5a7a2-ba8e-4229-af4f-7479e7e8f37f@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:33:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: ti-soc-thermal: Fix the return value in
 ti_bandgap_get_sensor_data() kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260912062252.42762-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260912062252.42762-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNyBTYWx0ZWRfXzZzsqXvFoL/G
 t/h0Jm7vDDSD5X0gXITVQcaTl5Itn07vm5bbmYNky3ojyurT25VnrOust9K8b2sthCqSk2l2yhC
 mNVU/48VeT61dhXmz/hQbdWBaU27lVYWBJNK4fAj9Lc9/Jlrmqad7CWmzz4skZLVR/K4pw0OxNW
 b1rtifBcYOvy1w66/+mkR3sw/hSEK7kao+KkazgkL8DSD6WbNzP73APgXO+zvcCeTFpuzHgHME8
 ffQuQj6iQAZMoR64aJFqyiJlkEFzLucFH0FghOvKeSF7c77uhv0onU6APoW70nzSZtvgqMUf4ek
 RvRZK0IMEbjRCXQAQ4FwxyZbbbp1LWSts6l8lAjTheW+tYUF7KUzX4ZWxjM+FOnxtyGpo0ZxE2a
 q3FDDVcbGXoJyjvL1QMCtHn/ChpE76SpUNxRLnrujrKluHfQjH1AM3xIhAhGvuWpoVvp7/7G/a+
 78h55BiY5+ESNTNyCAQ==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acdfafb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=Gq36PuiKL5ZAMQJggHwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: IyWntzzQ3DnxCZLeRV0NgnNGfCrh5vRB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNyBTYWx0ZWRfX0/8QAQOKOyh7
 Wm+DcoFz4Q7xvPUFga0d0j42FdDklxEgCgxMqE1zmiI7ax2kZK6UHD/UO0pnjcWFusINehFfU//
 +zk+4ITLzTxWqTPsE+UVrHd1vefCFp8=
X-Proofpoint-GUID: IyWntzzQ3DnxCZLeRV0NgnNGfCrh5vRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130037

On 9/12/26 08:22, Karl Mehltretter wrote:
> ti_bandgap_get_sensor_data() returns an ERR_PTR() if the bandgap
> instance or sensor ID is invalid. Otherwise it returns the stored sensor
> data, which can be NULL if no data has been set or the stored value has
> been cleared.
> 
> This mismatch was already present in omap_bandgap_get_sensor_data() when
> the driver was introduced in staging.
> 
> Document the validation errors while retaining NULL as a possible stored
> value.
> 
> Fixes: 8feaf0ce1a04 ("staging: OMAP4+: thermal: introduce bandgap temperature sensor")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
Applied, thanks
