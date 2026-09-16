Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371CD47A88D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549293; cv=none; b=pko68sf3dHeyunRXae3iEv6HISRj9dKkscTQ21nn4Ry4Xq5Cj8yfkV4Byk7veOwl92s6f8dkCyp2XYoL5n7eQV1r+1X9vaBBg/uj8u64P4EJ6OfDL2vKrLYfoPHwy+jj4RMRc8zYuuP+7uESs9mFt5ChxuFYg7EuMtlOuoq0QVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549293; c=relaxed/simple;
	bh=CWBDM2qqMRRPmKNdOVeDiRRqi7MZd4f2mtsjAI+eLnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sonsfGvoef4xqSJoUG0/QFsjuP4959sm79NEf1NfuJk1yyLw4AcOia//drCP8xuG3fkXz+YwUTEKf/+Bw0S0SDFxx5SzUQ17riOqWpxOGI8J9hz1LL6bae9HxhyFyqXMKqhzjr6LoX4GuLrc8xoGEhuKXRmwTJSXSFdTVrrecDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/6ad4lK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b9M6lubo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/6ad4lK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b9M6lubo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68mqn2986928
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BaNXMbsKLmmQU0DHI8wG9aQCGqFB8wg+jxU2xGsRTTM=; b=T/6ad4lKrbqbrVP1
	asH/3zWYxxkg8tXDLfzaXeoEL8p3v9Pfs5TiH9SumOtfvm6Hhvr7bALP2iq+SzcT
	db3iJAaGleup6zDeTy1SY0DhGSzLk/a2Qq/NOX2ZzdH/S7EYxZTk5WCxrODpot/A
	uHLJROWE1gX9feN8b3C3W02Q780QV2o5MZfpkjsrs28GaxzJWXV3PdYlhoC3WKqN
	qN57khrNllB9E8tby+WGa/b7nzHRNh+6aALMEepXljR/j8MMNWqE05J2bQtGLNu2
	SEUiy9R+MUxFOgYzcX/QE3I2y61Uaauk6GIciACvkB8k655rwV8dG8dl2FP3Fo6L
	lClZvg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefpa99a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:01:08 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45ecb9dd589so4450092fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549268; x=1790154068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BaNXMbsKLmmQU0DHI8wG9aQCGqFB8wg+jxU2xGsRTTM=;
        b=b9M6lubo4tYmPie2xJDtyv4JSefI6Xo0VXVW34PgJtfi4J4JTMSV4rqWYM+di+v1aG
         UOSY+6e2+9l+XkMMlTKCOwG2Nc8pnoeSpS+zwCjHqc3a9MwYjmZB19pT8kNjfok/9PG+
         UB4Wo7H+AVYLyGoXlXQn1YlcHYvTNL6RNJjhQUBpM4dn4Fh3xda696QmUUhWM6/dK9kb
         XdsVM1fsNq11QpaGUA9wS4wrnxhzdaMGutvJC+UZ9jymt4dsP/Ge1X9oZ07ALaylYDYg
         zO79UuDYJVVwL1X050rKR3/wTaZ+wWrxj1tSgg4BJ5w2WBW5YT1yH11UURk0R7PkN0Js
         w0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549268; x=1790154068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BaNXMbsKLmmQU0DHI8wG9aQCGqFB8wg+jxU2xGsRTTM=;
        b=Ktz5AUzGEURwgD/1uQaDRCEQPd10nOyud+4+qfdg8RebFmH/2DIRMWhxn0L4AkMkGS
         UaVRF4WAIyj6Ys+4quEjcU4fVXG5Y9G2SX/l+gwV9FXqO/omDBbKsZ/Ed+tEeXb4gE/M
         wL/PY/k2hQNM3rADh3f9K316KitstcmMbgozIxGZNkca3BZ7cZnqBqDfcJVraVsenue/
         W/YXRk5FYPWzq9aw0d1e9p4AtppKa4eTVyzEohWi5ez8ujG0Eh9uw8DAoRyIqIdKfGDo
         KhKnW0j11hEAeaRmZNtm6uQ2X6Ht7EY6piMn3EfFlyk62b+uZYOOIsc2zBUs72dGuvZi
         0wjw==
X-Forwarded-Encrypted: i=1; AKwUvBxhmm8TLAZR+5+r/Yg5i1NEwenU3sIvvvHGjrnykWmNMr4mXajq73wSPeqqDMfjRrZs6BVITcDNIfzzogo=@vger.kernel.org
X-Gm-Message-State: AFuF++liKo2STuLJ7dzPo2jHY04+NkOl1hmDwLyAXxeaPovt4ed0fo0U
	bQyq7NVHTSydaWctOt3lRm26BWYvNVQ34Tk/ViTDLCRtKgN+89AU1ckhxUNKDUBN6Pz6u+nAwTb
	Wk/9o3y23G+EjJVmAAu/bQp3sOMHiELHyRRRcmc/MMNvkmYoEXEEl3xXFKucewT8KTx0=
X-Gm-Gg: AYBFou2a/eAe0h/d5AxT84FRnL0/fbCCVLN+OKVzMWiyVW3rI9hLqOAtRhUIWgn5jwu
	GRr0NXLRQQdsAD1Rsy1VDnOVnza+aveKao3aYgq0EMzuoyRjCIkjcryTN3RqhoUMopaBmYcYYPJ
	rc75gwpLv112pyJ4pgUFAnlNY1Ss3nCLnWQm9TdVU5EFibqOuPefUbIsprt5cuqeLyunNxq4ElX
	tLFWA+Fo9beUrzIRFKhPR71Ogu4X5RVLq0W3tM5KfFbnx2Vbjc3dqP2CUDNuYW1Ljf0qNcvW1uV
	oCAa0PAv0BYul+iFFSA2Lpe2cBeeG8ah8aVOXzxy2ipXR2RMSBRQ9ZEd8kclcx8zkTpgftPcnW6
	PXHGuSWerxBQHVhwVGmihKkXRJX/znA==
X-Received: by 2002:a4a:e913:0:b0:6c1:c628:b0eb with SMTP id 006d021491bc7-6c7d1cbf5aemr1689517eaf.25.1789549267940;
        Wed, 16 Sep 2026 02:01:07 -0700 (PDT)
X-Received: by 2002:a4a:e913:0:b0:6c1:c628:b0eb with SMTP id 006d021491bc7-6c7d1cbf5aemr1689419eaf.25.1789549266537;
        Wed, 16 Sep 2026 02:01:06 -0700 (PDT)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm4617242c88.11.2026.09.16.02.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:01:05 -0700 (PDT)
Message-ID: <75a26e11-8780-41de-aa69-d5cd34d68bb3@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:31:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: u_serial: fix NULL deref in gs_close() after
 failed open
To: brianellis@gotenna.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuen-Han Tsai <khtsai@google.com>, stable@vger.kernel.org
References: <20260910-u_serial-gs-close-null-v1-1-9a5e848b1dfb@gotenna.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20260910-u_serial-gs-close-null-v1-1-9a5e848b1dfb@gotenna.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfXyaO7rlcYPBOT
 4e5JPsi4dY7IggyrtFqa5y4Y0idV6g0ZznlwK5tozwrLFQDWVkFQ4ytzf1Fr7qgpmcHyZcHfFUy
 sGDP3nkKRqbrx7cl0L5OA0kFYk7z+HE=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa5ad4 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=fDP6uvXCAAAA:8 a=eruXzHqZ9En46dhP4nYA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=wfRXX3dx_hO_3EqEzryc:22
X-Proofpoint-ORIG-GUID: jfUCTHMkn5NLgI18s576omFAw6Xsbjpg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX8LuJCn34SSC/
 +RyJ4CrqxxDOu+mNCVgSdiphgtHTDRzaMecUjIApRk/wRwEd4jKsT07Y2jFnvDVMYS+THNLyLKK
 IFEowFXBl+mZa/MhyxBR9H7FM4mcT0SCCAv3gnc6UOO4jQc3vOQQOtq5xowcqmiqC9D1BxiUjGm
 z+jtsekoGpK8UEwX/u8mA1A2hLsvEo2+cH10dgIfm9O3vBySWbH2zZREGRJANiYka4T9snOHthq
 B8irQqvnfMqrf5d03EOW1D3XMPytshZXFxBT1hx2/HXvdbyXtKfqPMzdNd82dHT66PvFQS7L+wJ
 P3kJ2rhDtYUh4g1+ghIaug3etEtKGgY4XwFMj5zom/WA32AcJAXRkhFRMKJD/RMQPYjb1bI49Mu
 sEhnRuSjLNqkxIf0J9NyCmShWkeTKvbWvAuYXvI3aT07lTtNdWizv05j69f1/6a4Xo5pnoxZWkN
 1EpPAZL/6Vv/M2FO+6A==
X-Proofpoint-GUID: jfUCTHMkn5NLgI18s576omFAw6Xsbjpg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160116



On 9/11/2026 1:23 AM, Brian Ellis via B4 Relay wrote:
> From: Brian Ellis <brianellis@gotenna.com>
> 
> gs_close() dereferences tty->driver_data without checking it:
> 
> 	struct gs_port *port = tty->driver_data;
> 	struct gserial	*gser;
> 
> 	spin_lock_irq(&port->port_lock);
> 

[...]

> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index cdd1dfc66..5bbb4d04b 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -695,6 +695,13 @@ static void gs_close(struct tty_struct *tty, struct file *file)
>  	struct gs_port *port = tty->driver_data;
>  	struct gserial	*gser;
>  
> +	/*
> +	 * tty_open() calls tty_release(), and hence this, when ->open()
> +	 * failed before gs_open() had set tty->driver_data.
> +	 */

The patch looks good.
Minor nitpick, can you rephrase this comment?

> +	if (!port)
> +		return;
> +
>  	spin_lock_irq(&port->port_lock);
>  
>  	if (port->port.count != 1) {
> 
> ---
> base-commit: be4219dd98608736e13e0b790ef742b76a13254d
> change-id: 20260910-u_serial-gs-close-null-a80a436666e8
> 
> Best regards,

Regards,
Prashanth K
