Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6D03A4F32
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882005; cv=none; b=H+6Ep/GRO8BD6NOdgFw1FjVS+NJSeeduYCCAOWsIk4tmN5/EYtYIhhEV5VgRN+2a3y7+FnAnQ73WMm8tsSE4grvOlBps12YrtngoF3u5ARxZejTmjw+mx9qKrMa6o6TFbhNz4VlmNkNu6/OKPWgzsnDfKPe3MpIyWzeHMFvVMyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882005; c=relaxed/simple;
	bh=w6x87UjaFHsrKyA+7m4aSrPptH2kCNOxsudR+EhOw3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8pJvyzcIzgyEofWYadv15x3S/+xVnWWES+SQ7NW5914eEwKFeoiqHXTyZdbOwSYSKzRdX3VGMb+zF92qDaEgfL25i6wLEBKx9mZyYJ7zi18ACqXRqR/02fuzCukiyDuGV2hiE3OD8vpZ/qadHmznJ8OYZgDD/TT/9iY0vLrngk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=naERWWLz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2tSdRC6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="naERWWLz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2tSdRC6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CS9N949398
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iQTEiG25+GBsZpSMU1QGHntgV/SUjXZCZoJ2h3Pe7wQ=; b=naERWWLzAY+57mU4
	FQmhOwxX5DScgl7SKnZAKfRFAv83vae63G1Sq/N8gppy2R1ispYE3bNdR39qiLwP
	yfQUGNhQlrgNsWjDj0zS19nNBIrM4Enl3Foun1sdW+g5liDQ4QlBi7ElFG0rdP9g
	6z8IYVmKMwOyhik+YTZvT1XClPZKdGifIvRtgRBiagOVTO5RThsXgsjt2gPBY0wq
	wbZlCVaf8xWZDh36oQJV7wf0pr0PgclCZgB/cyw8BXZjZnGnDBoBmIXlA3iD3yYm
	M/1Q8AUPdsNVKTG/cEs+QT5CI09ukfh4qgt+8iUcuFS7appoecFsVl67ty397Sxn
	mS6XTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f628nm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:00:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso546245285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791882002; x=1792486802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQTEiG25+GBsZpSMU1QGHntgV/SUjXZCZoJ2h3Pe7wQ=;
        b=F2tSdRC6wajNOeUuYmobcmtZ9Fyz09IPKofI+5hFGc3SQ5XJ9IMh0fiuVnQCkHGTgs
         9pA4tGZP5c+QzXm1IGZieEzHdHtXf22jNWX3mC77rB0Rt8xyesUs4Rmg5yfOWVwRQZJP
         RkKas7K1CIulI/n9adjGCT7zjnmG+/EkmkL01y1iBlnodkZ3OY3SQO9kx0/PZexkX8Wk
         yX4ykGaBzFQ2VboineeBkbQwUEanUIMhVGcbNBiAizkRYKovsyhdyY7CgakiXUSVk1wi
         nOq+4wx1762/ZXHfb5BEnZ89Qo6inxHgJH3Fbfv80CrP63c8aqnkEVE8yp44TZI2fmcX
         rFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882002; x=1792486802;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQTEiG25+GBsZpSMU1QGHntgV/SUjXZCZoJ2h3Pe7wQ=;
        b=YSOUidDv4dMew81CHhBOLMKw2cTpgK5xa+H3tkDwulPLDhL8OwGXah4lDd0dGg15me
         EP2SGUIuHBKVzJenksSapi8RVLh5bYKFo1aUHBU4w9b4GECqAhdfClKu1MwzXWBdmH0/
         +CvNAg79dSBY4EriqfdVR+LRpscJGiIRr1E3DWLHJ/BRoThPrO3aABEOe3IMtKFIk5Xf
         yI3p3u8VU0+hJ93kIF+MMEQS/Cir3RdtTEGjai04D9dPcirR3eiuxhItqXXLpaxpMcrk
         5ZPVbBYMFsNLc1FPgovwPLzHSVM4m29eAFd+eiyBLRaQ+/lKypL3bJUS9OMTVyt3AUHZ
         RfCA==
X-Forwarded-Encrypted: i=1; AKwUvBwFUYReWoZyM/DmnwgovsstLNWdUZyNPRkjfYS7+zjm7q9mqx5smumam+Y23+QPjLR81AHtRC6YK1o3tf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaiDK094jyt7CyeCsf0YdFTDVB2+4bquQy2+e+/a2zRdl9ihrH
	cHzEC4j7bPYuaoizGJiOAf4QGzVzZ9xhimzwEBbCMMJ4YNilrEmJEWG1k+T0GuDh5be3vp0EN+n
	jQPkxQY0Y9pomZL53+Gr6ys5/StkC8Wq8VDztXJ6T9aFM+U/xYB/fdIcDBoXBn+QYjU4=
X-Gm-Gg: AYBFou2ZxOyEWd+MVHtQsBMF4TFffk2mq4OiImzamxwu2NZD1kiYuC0r3AC8zM16DJu
	nniGbNKH/0gb4Xzl/ijbQDqX2JzCRowOmrpdi2vUfZ5aqC8H49vf6tnCZvZRd8j9tRZm56vDe8v
	BLm4j1G+hnJ43KSSER9XLfprHfJpG5hGt5f6QDFgS26tFxk8rrJsWFMbEHG+kbH/tDYd21NP/jt
	OUSEzdQyKQke5vlhskhql7hh1mIBIQUbiNCPlRRnhT9aNGSg8EEENHxQ+0ehSQGk5m4G/ompj/i
	/0TqtdvzsYDkKcsbf2vIUgOuyMHJl6DNDVFF/5+2JbhGkRP4BLuq7wCv0IGVIFYE/czm0Qxc9Qu
	Aa6yOPr9GgwxrrGw/Qaa89nAz8oiSz2PSPEv+yZWQ6u9xZDVVF25QZqpMkgxpOQ==
X-Received: by 2002:a05:620a:a182:20b0:93e:c12c:f122 with SMTP id af79cd13be357-93ec12d063fmr1250533485a.78.1791882002529;
        Tue, 13 Oct 2026 02:00:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a182:20b0:93e:c12c:f122 with SMTP id af79cd13be357-93ec12d063fmr1250531285a.78.1791882001985;
        Tue, 13 Oct 2026 02:00:01 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c198134sm352269355e9.15.2026.10.13.02.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:00:01 -0700 (PDT)
Message-ID: <1d635317-f59c-4279-abe3-18a7e8bd9f50@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:00:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/fw: Fix kernel-doc parameter names
To: Aryan Sinha <sinha.aryan03@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012152037.33461-1-sinha.aryan03@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261012152037.33461-1-sinha.aryan03@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6acdf313 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=-VtTIaBU6-woz9S0zHEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX0j9tMg7UY4Ul
 lNQ5mrJw/xckaXudi1cU1putCa/f2dnh4o1Fc0te3nHH+Jycglp6lB+UTYddpDIQk9bfB7eAMFN
 r0hgdbBjXBdpjGpwg/FK5A59Gn/tYdc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX8cTONjUJvKLj
 OoTdU4AOWzKMG2qeNQ/9l55qCARz4SmG4YE6/tOqRRwTMYc/KPxkAQ4HIlPdlYHgmMMn3UTc2GX
 Yb1s0DE0Tjvwmf/9d5MiErlj3uF++z0X2GsURRhWFLuGMGoMpXS6Bav/E+Dq+XlNuxJqI3fcYAs
 sPst225oxnPYm/FFBHw6VF5mVXzbQLz7M9sffnooEnblPFfHIHfroE13wETLl0Sg0wmYEmKwi/O
 xOLmZQWtMyusMYR+VVVGUsM77x6iJsvc74y1qIPSJQ+TxjYEG2RWJFiPtSWSmvxUhiuMgBeEHko
 fZvvqvs/ZUUmY0j2cJSSIB96oDyIGWdwdSeVjhe8vcMNC+oJmCBKBgfZ7xF4oHOHqpgTN1lGUvW
 JlJIpH91vuA6Eo7f7TVyZj4sDUfXiQfQo8+ymjO4o+CJ0wQPZwbuiiSXRZC8Q6ZmNRb6bzBr4Nc
 YU7HFHnbX+ftXO2IthQ==
X-Proofpoint-GUID: cNGDzoRaBOQqPRkrmxVFC5IT3DcGMyQ_
X-Proofpoint-ORIG-GUID: cNGDzoRaBOQqPRkrmxVFC5IT3DcGMyQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130035

On 10/12/26 17:20, Aryan Sinha wrote:
> The kernel-doc for thermal_fwnode_cooling_device_register() still names the
> old device tree arguments np and of_index, and
> devm_thermal_fwnode_cooling_device_register() documents fw_index rather
> than fwn_index. Rename them to match the code and reword the device tree
> reference as a firmware node one.
> 
> Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
> ---
Applied, thanks
