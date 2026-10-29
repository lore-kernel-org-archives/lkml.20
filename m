Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263628;
	b=0cAq0WPUXbgdfJnQD3Mw37fsG8NY+p+r0tUYxCJNo/7yfa02NSMe47ll4WGtHRD+SfaH
	 oGEcYCfbjH8TZ2kCmjVa3/Lzj/RZj4Idgfo6e7QniOVBokKk89G/IVCgMO4aVUme3bFD4
	 aF0yg4+qhlqA6JrDBOdFHaOQ2XDTztG91Y/NOoWG3mHNMW0gbQuVx8/AFuQPB+EPnVKCI
	 C4poy+w4CKKz/KYT+jLIJ4f0ruLzPXmGn9Fqp5LenZE9mQj/Yes+XmnHmekJ+TX3uds5Q
	 MNPZsvGeJdfD7I33v2+tK6nvmeRbW8rul8T/+PP7m7PFfYfvIoMpd5ShEgA/2XoQ6ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263628;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r/V5FzpTEmhAfXg/PM6SImlMZSJhrMQSfQjqFaMMmLE=;
	b=4CZJa2MEDSuTUFrdg67epIJVwMODx3IvDzY2AILuml2ci5k2RgG10jbfnmOu2QlxGyWK
	 nR9S3CbPQKsdu9V9GrN2Y9epefuoexTCnUf0GQ3iQhY0dhbEdKKsgZD+z/mfN/v4SL1ar
	 zagIkpfL/hqdQ+mJV9uz/ISja/QY34Krbe6urW6BCAIbHmWTA10UQk7CsfGAz1zkIc7vY
	 YZPY/IJq9lIxcRxR16ZklVCHIz7HKQoyPS00hXjcuJpGWjVgZ5Snm7ieUcAzCWk9KXRAF
	 GrqdoHXl6m9GbXmOWd5BYGSzvKZ5/NU2/0VoWPIEK3VQjXmzcur0ctv17S0LB0oThNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EN3iYYGW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="URe/yDo+";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814EA606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 814EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EN3iYYGW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URe/yDo+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H6c02244541
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/V5FzpTEmhAfXg/PM6SImlMZSJhrMQSfQjqFaMMmLE=; b=EN3iYYGWjgvabrIc
	QO51CZcIcn1x3YZfiQzdD5Jqoeg8nrAlCCi6Znrjz3SPE4tOXrsuGx0pmgQJNCGt
	q4DVo+o2oR9R/xNUZANQSDtUIdD3yGVdXnzzP5uYM00mmKKQIMF6XNZkb0T8Sz11
	pH9uLaVfSmoTNLL+DMhNMCUOtYCikudcgqqMvba0tQYrIoj52wxUOOJtXW1VTBcC
	KtVVXpDHSMhEej5G7wFzqWJ7XbudUGD4mvib2ooPhYE4o7EQkPy9DdL5iwD/v/cZ
	HKSA+hRZ53J1FqOt8FIm1deEmgFKaa99QScc+T4BDB4VOtEQefOcQXB2KbwT7vNp
	lDO3sg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s8ucx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:47:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5350173dc7aso5495731cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263626; x=1793868426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/V5FzpTEmhAfXg/PM6SImlMZSJhrMQSfQjqFaMMmLE=;
        b=URe/yDo+/DX8iHp5fD5XH34cPlGO8cQ/P+tpGMdZisFYTMd2uBxI0XxQCNsPYWq/j1
         UVUZd8fnkU29VnPq+GM67SXhkNdG9rNjglgH5gsv9SNv+7Uxzs4LMhZOkLfV1cj2XYJW
         kGNAKYaJllVNIAXnm6NTE9QDeW3hmVvsOP3ERuasDKT93Gbk43DsP/c9MjghWwBTJNZH
         5GZnjTIabWJNB5iXK08T8sKmykeyL5+oXLAGFbVwX7Hdx0ahJ1J6520skQs9diMIP5mW
         afmxGdnXft4YVm8pHxKgBiiQT3Gk+GG0go/PQxnwcR3jxaCuTup856HzHJuOYLy3/fHM
         /l3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263626; x=1793868426;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/V5FzpTEmhAfXg/PM6SImlMZSJhrMQSfQjqFaMMmLE=;
        b=cTmLrDeh4dun1eHux6Ycndqt+4mxowt9ufinCV9sbBjl8yfdH5M24lxSyCFS65YzKp
         eDhM2V62M0TR9w6qtfnWd0f6Js4s5Xl9uFwPHz5OJdc8kNXb+5NZWh8z6gLOoTvmRywq
         u0eNl+E3nWWbop3SCXfBXghNYfCc+7BJOrFdKN/+dXxHBYnmTP4W0wfbSs5/rE6ocqYK
         Umz3K4dhVLZhunkBDAFzaYl76RiRKuK/cVwlCDxtvIiYrzZYAeaw3PylRmrYsc0VOGr9
         lykIDWlQR2gBx3kSq8tIwHpOCGjQem7rSCd5LMB+wZunaF2y9dAzd/dI3y2J4TTACu4B
         TGIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUNnGC8sqPOYxVAmFiZqiRkLJXn0R5Z6CF16GXdgmQKS4WdfrxIzvUSVoZ0oNhuI4MnVzLi+rN3FUqI28=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQyz8VC6FxHiGJB1vqVMEwF42Jv6jBDq02+gKJv+MmGvMSZNOI
	RzxKaC18TotXFGQ9k7bKcc4Y33/BwUqfB35eQ2WzPfe0FHlhSP5HW+PI2KnvcjlCSQ80RBREQxJ
	Qcb1dfkbwHy2sokEMzGt+hAq6O/aKMpnjZ676TJ1bgFttgGm8AVcyDhGjZ3vFOAcJBBM=
X-Gm-Gg: AYBFou30sCh1KgVXNy3/Wx3mIk3+D9vKl/zB2wasULNG2D746X9cbHRfqT8qtNYI2Pg
	t0kjTEqD8RGklUDlM+Sxv6tdOeCvY6DAB+Xv2/m6LdOe8mPgEraQXFq0q8hEPXYYiv7RkfP471u
	QPI9KWDLDT9ZGC5qzGF8DuYevnly+c0KcoZpEWlnA721Qq/bSK5Yr3puDhcmGXE0PxJRpzcelk8
	c7po2K+tbnog/OR0O/OAELQDKyaQUzi965N3HI6vKoZH+l24m5nHJk+HHju27C+wyTBep+pPpXR
	W7W8YcE9e5Pww9zGTTo3SE8STyW7ZaTSf86zjhLt7oqz9RgRTT2gwUNG/oJt9f5jMA4g7GlJqFw
	Eeqzfv1zlz0OJJ8t5RnThxn9tyYbXpS5zhE8HLg2HGIAc/dCEE30LSZIWlWBblWaKSDRQlbE=
X-Received: by 2002:a05:622b:206:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53fc697b2c1mr77059831cf.0.1793263625727;
        Thu, 29 Oct 2026 01:47:05 -0700 (PDT)
X-Received: by 2002:a05:622b:206:20b0:538:40e2:bba3 with SMTP id d75a77b69052e-53fc697b2c1mr77059531cf.0.1793263625147;
        Thu, 29 Oct 2026 01:47:05 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f874sm710387266b.9.2026.10.29.01.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:47:04 -0700 (PDT)
Message-ID: <f7596b4d-20ea-430d-948d-69d42bdca671@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:47:02 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO
 polarity
To: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
References: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX72gB9NfLliRF
 tozoESKZnF8xVqF8yV6ZXD1jqDAUTkG5iUgpKJqNYjDBH6TVozKmc9TqFkQ5R9hxIZfnucE/54x
 dqINgAUyeSlrk98l2iNHUBk7muC0TYttNj7U4QsanIal4Lxra7Ky/WWs6lI4AyXBk2JmFJ8afvu
 a/nIX8Vlj9wuKK8+BPJJESNFCtcwN0ODNw2Wk/F5C7vLlp8V0mhTewq68bEtmQJPQoPR7YVUHAn
 yAtV1SUKxBHzj/DkH0+0oHgKU0y+jTK56DlyDg0oUYPc/M30qj43++wbsXk9oIRen9P0irp145s
 NGZYKPnIhOIDeYPkaDCCwFh88UQqUpJteC6pczBSXGUgQXmiKzpZBJCGuHoMrgoyoiFUovcZWgp
 u4KIrjfP32Ja94pfcCFQRfIGwC6gOZ8zssOXnPIlJWb/nwmJrBf4ZDEM6CusttGgr1MsLiLMrTx
 KC2UCQ8KxlpcBUAV99Q==
X-Proofpoint-ORIG-GUID: GaUiisBeD_U-_inYt_2F7BrsbI08HfH2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX1oDf//adEoUv
 sIO7KAvO12Z346NxXUIDfzkQvYMCkMXpMgp1lA2bBFntIeIaT5B0MznVVt9RG9LQ68bi0ki04uk
 J7Mi3dI6ZGIw8+LD+wCEWQSj631v9ps=
X-Proofpoint-GUID: GaUiisBeD_U-_inYt_2F7BrsbI08HfH2
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae3080a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=A8FiRQsTqyrrzY21g8QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290033

On 10/29/26 9:42 AM, Zhiyuan Sheng wrote:
> The W_DISABLE2# signal of the M.2 E key connector is active-low as
> defined in the PCI Express M.2 Specification. Fix the w-disable2-gpios
> polarity by using GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH.
> 
> Signed-off-by: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
