Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF44141834B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766936; cv=none; b=ENYXsdWfAQehPVGZAZo1r630L8sPKXdpsUVVBduN1x6ieZkxfvXKBVE9J9c2DADoVNCHu6U1HHhw2wThi3CCi7hsVYaMinzWiTbcNfshVJ+cj1D9/m2IwD4OnBmpQ1k4pwz1B9Tm417bMQsnSN2O1g8aKCb7N7/xpsnAM7rhq0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766936; c=relaxed/simple;
	bh=4Y5xAsf43glCZh088++ZapXrJHidaLKDLANNbMfpkt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+gFzpsBvdpokG9BVZM5fWr6oz4aPAcb7EMOxezdTzsmfw0TJ/P4IrhNy0pE3OWxj67t/jySgW0TX/bva4Z2LWgja4V5BQCIa+wBLCC4lEv2u9CRryuiv+nbtr+iLpuNAL8AdbH7172GnMSNg70SIHmdgulTfoXou+XJ6dGZLts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jopQQZsx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYPMEJ8I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jopQQZsx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYPMEJ8I"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777ZqQ3550517
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 07:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgvCrmU1Tuvc/GsdKD3kD/Ov677P/v4Ew88GYviJCFo=; b=jopQQZsxm+iSnWzW
	RMVIJKHT4mZ2cZg9oza2yW8NVJ7IQDHeWvBruJL7asOF4HtDxjPnazQdBkgISW1f
	8mZoF178D9/MSJnvJ8cV7euLqZNmnEdyjEIJ3XV26HWLgoHx3wAq1PrWLZU5LBFg
	t8bCzmqSqO4PhlzBqYXcLAPpcCj2ZRB6SBH9jeCSSo1uitBZpFN+XUPwsK8xZgp0
	4baQLhNADbCEVpYdjlA82wnn1LV+eMCHmPhTwnnpdiX3npGIPykwg+6jNAsLGB4h
	0WGVPN+sBcX2PlKPg5j5+GYygnko4sHFCjdAHEjsX75fD0KKPEDAQkAD4PF8rTqD
	GGtAkg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5vdn6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:42:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8d3a2d3fso7125996d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766933; x=1789371733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgvCrmU1Tuvc/GsdKD3kD/Ov677P/v4Ew88GYviJCFo=;
        b=LYPMEJ8IkxZspK+q7SmU3b+bfqg+MrnAv2ejENAFohPHWbP6UYFxXFsB4LnSdZbRLF
         rrK+7kxyIfFrqleQj7rpCqYGCF+dsxhPkGO+WaM/7nhafxP75npmu11WvFcnV1uRVAih
         kvSWx9FCsPwk90liexhSA761G4xX9hCoeBBuqYo2oVmr4fJ87M3U/GufpQPoucNpxj3X
         dnf/RZkTYdGTXeyKl+pXdRIrX4w3x+kUDaP5dh7ycIaklIQaYOI1CmNei22r4n54Zlm8
         O3JKX8q+wa54OjGjG4e6e8hQezUzTqrQxCO5zolBcsmsWScwFl+fdfPYCgqV2jBl1lr2
         pHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766933; x=1789371733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgvCrmU1Tuvc/GsdKD3kD/Ov677P/v4Ew88GYviJCFo=;
        b=o941jAER5pH7woYmB4/zZzj28xpAAqlL0gAg0FdG1HUEgcKLsDnQ2qgbgQxdKNoUJz
         AMXT5We8h2BwWEchdLkGdAG2jfHxpTMZzXk+RQjo+FbPGYvLUfG5rScheHza8yT/6BVN
         QMuPs9O0yChbjN3hlSzBXJ3uF1ytxSK1cj7FUVIFKHTb9Mojywpa3VMJb/DgPJLkYs+U
         v7v+NMewW3z8pIOwvitNaHapl2tFHmTNWz4mUix6YYuqNzdm56yVwPly13UTGABzlzTI
         ppYoRKXncDJjZahYkinaAu0TkpB2iYT/MQYbF7p2anyRRw75DyTJc/pATuIXhtgsSwMo
         y2KA==
X-Gm-Message-State: AFuF++m6TBZ/NSPoMLiis+W7YL4g157HvKZO05eragqPY2FRTI73kCBW
	pa6i/NsHNyN3EJ80N5bM+xOfW5CmxVQ2NN2dhpUtkZfeqJypOftfRbKT+GZKWHRj5tnUkaTV45y
	3jsqqBSNPuT9u/lZ2co3881kaLyphLhEqR6TFXNbrD1g1D/7ap/ga2cTtW3ObiNjwPD0lmmVXIL
	o=
X-Gm-Gg: AYBFou1b8NAyefEA9NykLPdK07WXrm2tccHSTLpe1pnO1EBV2i9SWvnOWvnLxoTF/OT
	F4d5oGo1sZgzQgiF/kUMUm+ZN4hQa37Bm+a1CZzajbU6Mqqmr5xnexRUNskigsQO5v8h+FZKk2M
	HkUd1TaYDHMyEK47d+E1BQsPnFgkUv8RQHiMM2GP51oQKm/6HwwAPa3ruit4K/2WhtNoqmWgzpa
	Q7eKCWdTBdZMP0dC01A4Zr63wuG4D1ZZ1eC9myyHqfFuoAX21hOh5s6oxk5/6N/sx1kwl6aRXsH
	VIWAzv3pSwXrN+tiYSwoAuch75BOQwZ0I18lsc/w2NHmM+6UGsxxWqDTbyhcV+W+QZMe7sYTsKX
	6gUQuyPuDrsnzAOAR7zIMcQ==
X-Received: by 2002:a05:620a:4008:b0:937:7dc4:d2b3 with SMTP id af79cd13be357-9399184f186mr1035546085a.4.1788766933089;
        Mon, 07 Sep 2026 00:42:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:937:7dc4:d2b3 with SMTP id af79cd13be357-9399184f186mr1035543685a.4.1788766932651;
        Mon, 07 Sep 2026 00:42:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm266442166b.18.2026.09.07.00.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:42:11 -0700 (PDT)
Message-ID: <66a8275e-451c-4a76-94ec-958f3c0aa6b9@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:42:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: fix typo "commited" in comments
To: Hemanth Selam <hemanth.selam@gmail.com>, Georgi Djakov <djakov@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260904111632.29262-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904111632.29262-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Yd0GyncAf5YYUSCW2SXWww-12XEMgWQy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfX0rQxyCytLoX9
 vRq2KpvflY8n1zMCXz0nGa2JhFDmZKhPEwxT4wBdqjGYKjGHoNbCij53E5tPZGPiiaMmjDHh/Ib
 UcPuKSaUibf00YkV4Lv98sVBbYdwNDaQTEzbk4PTrdgRAM8w6EuXyem61YBjyEBo135MPCgwki2
 OWdloHPvuRUx6B5sIWV5p0BHUUcfxrNVC4r7RuJpjohdMNrSdcbezhHcekpEIqbyuEmTItmyg1j
 eAv/qIUUPVmcR5ct+0kYJInmo8yDFVAnX1DL0km3YMILPx8eoDxRiSaWP19X1T/UWPqhnVEsyLu
 Yk7gXPh/Mz7kyZHXwdio7wyH/qUZsa33tA0t1VKkmBzksECnNm0GActUWa7JeElRquGHyNh2wzy
 F7/9z3dADdaBwgWfmZ+ITlNagkEfdR10dpK0sS41TVGYte/yqJsEFGeezHcRcX+p9NtpIH2+mAu
 qYCDcScnVGgXo2IhdiA==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9e6ad5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=kddr3pe2UqKiqFkHGCYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Yd0GyncAf5YYUSCW2SXWww-12XEMgWQy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfX7lABJ6P2x47w
 jWV76LUYhiSyx24fg05+8pCM0rJQPnN1+cvO8xRe/0EJWa5Zl9XZ4KfZ7b0+wyWoHdhdL0L9GDC
 Ka7W/FZiIAoVfRvzD7jsJ4zigZmiOO0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070082

On 9/4/26 1:16 PM, Hemanth Selam wrote:
> Correct "commited" to "committed", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
