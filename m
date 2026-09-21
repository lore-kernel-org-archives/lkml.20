Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461C9244667
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789960637; cv=none; b=sXhGP7/DN28qhpfcKDLCKMibwRPIW7MNQfHpYL7FHsjv9JPJok+1629M27oY5ibHohW59mM84XMUfkfcVk8uDW2ZaOvOPVo3kJ472rl83wEUh+68ZERvM72NxiPVER090AS5OlFtdZ7zMUacfOmByBAeXDbykei0QhNbQ1Bv9dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789960637; c=relaxed/simple;
	bh=gt8sPaxLPYaXUKUkJI1qSSKVhWtta+kMkOc5+Ye2iuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFo9j02BQfZcWvLosZJTE7+fiab4WUdXqwxfwjQ0jk5bay4RFlH2fMSGcCfMWF2kmntGLuuh8J1ZVc7IEXa+mYU42DD8uQ35OU/+RHfurqAUxttm9qbpsGHNgvfvKCRONG+xSq68nWCcpY55eQvMM6qfO6GkJ53f37DdRyONi8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YrsXGJtz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cl5+MhN7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YrsXGJtz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cl5+MhN7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L0kjpT3846718
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cYt8LOSON/JsGZ2ak1N5nI/Npl3t37NWkKDiiRq/YtA=; b=YrsXGJtze1bTtQjB
	54fIcsSgtaQbQAhttkwdDJ/7E3ussqxqXEr17889ChwyvuW7nNRWM16F/uDa5qku
	D9PpwPoiaTM+PngooLSiL9vH9ublSb/Lijfcx4lqWSmy+Su9udPzAaJIG58Qfu4T
	wX0n2lWMn1F4DTpNrjXvF0iIkijZB809iVRkY/v2hevYBIWIGY0DFzBHdidgiC2f
	EtzbKYai4s8/Mgt+71/XWMgVYuGHy4m9QMndKXmKO9fLeqOh3eh3j5ZG6ro6T/gr
	/KehjtVNYQ4jLQBNX7DUr7b7ycKhG/5jtmYa16nz7QwYZYfohyA5PDDgATjc/wLW
	iiQ5JQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8b8n5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:17:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc52c77089bso3807921a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789960633; x=1790565433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYt8LOSON/JsGZ2ak1N5nI/Npl3t37NWkKDiiRq/YtA=;
        b=Cl5+MhN7W/1Z6FY9TEvfHrdyeABcD7OhrfkX8mBqM05zfiBtVFgsfqiP3w/91D31QE
         JFSbSVEdjmTz0K4YnAaY4bXlBrIKf29gnvTXAWV63IxtZT06PjvvlaOKabRxuTQMZzmu
         NSmnQ/m98lG8jlMb8y8w1ckIL9V5VxyvsHvi801DFVhL3S7GGud3e9MwFOJxs2cWoMn3
         v6lvMIjCvNr6FJ3FRf0/3JmN4mfCWHIJfkbLCW4nwxkH3cZkXTm+mNDxunDgamwjXYPP
         +8ext28uiunpMghHNk5b7iJvwM/8bzP4bMz4H+ntlb2l51thvekqlj8EsrO0t2Na6yER
         T8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789960633; x=1790565433;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYt8LOSON/JsGZ2ak1N5nI/Npl3t37NWkKDiiRq/YtA=;
        b=RHaZtyTLRbstM3xKqMLhRYbcDrhHC9xca9IWPBW6MBn9iTWvI79lO0bM85jOIHHsS9
         xmCzMuGpiF6Xqc+4+czbe3SATTNTN52AwrNUoVht0y19zk9zQohbOu5D5XWZQxdR9yS6
         baSPUSfYWK923U4p4RdALtTSd3kBhTeJniy2qoBsujXx0jqqiPJkvBnnlZgPI0yvlcri
         OcaypUd/mOcqgRHiaPt56eXmO3fr6zw+KRx2Kk5Lrb4q5oFjtXxFJumGAwXsiSkYwYyj
         eROsE619LM3D+zMcHtRk1BzfrX2gRLlqNW9nhf5mCcs4A8G+v/+O6UzByv+fKBF2kdv0
         HOjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcAA+uMbq/9b548jJJ81ifYV4BYUiPOhDhpwz3jL7uiFpjnxYrdtV+6f7x2R+TtQbK7NaW0PFz7a7zsyU=@vger.kernel.org
X-Gm-Message-State: AFuF++ksPmYMveDg4hTVOe+4VR969rn90K/kzvz8jA0szV0OGFLzPtkS
	h0FsKRt4wceJk1nE02nkO2h5pafNa+9+AGVRoR3DK+SPjQAZzy8b+4FjZI2NF3RF+Z+y0jBa41/
	HlaYLT2dbPFmw7o7ditK30c6DJWJjfsS6gJcQe9YI8giLK4iNRwa/wlmZ4ScdQtCY3ms=
X-Gm-Gg: AYBFou3c92oVcO4R01kd+9ntVL3JpRkX1jILHwiVQyC5Z8odlwzw9U9iw1mi+UIHdyl
	BB6nFmOeQ8nywvXPjNiH6wRWAVkQ54dfeEZpct7Nd4rFcEAbK/mHNRlz/GL/clGRiSJx0SStKEH
	j6TSyudiHTupT09OXo0kDt0UmDP8Ju0Xwrgx+itraCOLA19UzkrXt+kd6mG/Jz9mdwMum7lyHVp
	IdJdbaUQMDJ/8ZA6+ERRNR3+zoX2EB0NAVrtvAYALN7HAU/dmEPgziXA8nH+90bWY8oK9/zn7Ub
	jlgHprE9jW1AowcK/62M0ddeITmlv7Cv/UksQJCXndI/h2IKDvNIC34g8PtBu25UwjwOvYPzHNQ
	/IQQ9WxwSOuKUkqXn3zzf+c/tRkKWl6KqE82l/x4vk41qthu15S0KjZSyDWABFGRT7m7GC/UQ
X-Received: by 2002:a05:6a20:a10f:b0:3dd:a196:5392 with SMTP id adf61e73a8af0-3dda1965441mr9479660637.52.1789960633196;
        Sun, 20 Sep 2026 20:17:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10f:b0:3dd:a196:5392 with SMTP id adf61e73a8af0-3dda1965441mr9479640637.52.1789960632788;
        Sun, 20 Sep 2026 20:17:12 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aed5c05sm2662578a12.22.2026.09.20.20.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 20:17:12 -0700 (PDT)
Message-ID: <358d7dd0-20b0-44ee-8b1e-a0cc6cb40abe@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:17:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath11k: disable interrupts during
 firmware crash recovery
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
References: <20260726221908.104873-1-julius@bairaktaris.de>
 <20260726221908.104873-3-julius@bairaktaris.de>
 <CGME20260911075315eucas1p1b4ffb1f57ef187e0a055072ccc0983e3@eucas1p1.samsung.com>
 <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com>
 <dd342f3d-36d3-4a85-95ca-6cacb7b834ad@oss.qualcomm.com>
 <10491411-b500-4e89-bf85-5142ced60aaf@samsung.com>
 <CAC1t37Ltrh+BBaEPi8grXnMrDt3qGDH8BA56av-h7=yPCCk0Nw@mail.gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAC1t37Ltrh+BBaEPi8grXnMrDt3qGDH8BA56av-h7=yPCCk0Nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA0MyBTYWx0ZWRfX/LfdooX3xrzk
 RVIO1dCt4VhxQPkwh/R2D0QA+t4qxy2T157FGjXyPiaOSCf1k8weD5ibFwDryDQVH8r+Z7/UYAc
 HrVq2QRgQtfS3382fP1U0NHdayti9F184BT+3mp6RMKHXrQCCTUAyqiNd+P7JCcpdvcx5z7DEqg
 HKzUcoEiHX+2A/I2KU+tAo3RjNwrrytk7rjvcGzOEnkdQ1tmUhsL2LZyXP4P8FCNjURkoipdK6Q
 z/4gWokBWWagO/stsmbn1FUEvV0PPiU9LAEY3/dfdc0HrE7a9DarLPEnxFSs0RMoy2C9+MI8SW5
 ZH998iknnxknRiX88s4xVi6Qgs6vvf1FJDYK6Jt+z/f/fYg515gf89rUSQ6/dC5LYyvuKOvbDZB
 f0BQwG3PpACKGj9JUiVDoInBEVj4MsF48B9+xTipKaMgS7ZvHFBuamMuIiouVWv0KrUJyIQaV3g
 Sya2rYkGtSBdcZQtZeQ==
X-Proofpoint-GUID: eCP7baa63RFY-gRmSb_XbFJsJxf_X4IV
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab0a1ba cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=19USHdIQmY6s7t-heMEA:9 a=QEXdDO2ut3YA:10 a=D25mL4rx1t8A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: eCP7baa63RFY-gRmSb_XbFJsJxf_X4IV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA0MyBTYWx0ZWRfX3DfMm/1/7Cci
 zRusnkTx9ektTLc1EmHiMAb17gdnLFp10/lvn+gfECiGp4lc70P0OVBddHcQ1264m5nCBhf3HYE
 qRe/vhve34K8L79gGVYxfmgzAndr2N0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210043



On 9/21/2026 12:42 AM, Julius Bairaktaris wrote:
> Hi @Baochen,
> 
> tested 5 times and it solves the problem. Thanks!

Thanks. Can I have below tag when I submit the fix ?

Tested-by: Julius Bairaktaris <julius@bairaktaris.de>
