Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490139;
	b=dXUEtNjv4K0PWXaAgZ7yaWamVLpzivZlvQ0FwAfxvunuV87Eida5oFzj5h1K+OCA9Ixk
	 OZi0cALGYYwbthiD6KK+XKoVgZ4wfFYJZnOIzg3RB0qQPCOXdIqPUntcd9XIwBTiqBkMg
	 AQ4VQlEChp+k8VzHEtrz0MMRNEaoRna+nb7tJWYNtK/Yu4KhhOHfFXl6ch7KR2f/HLVZI
	 JbQLrhfr11r4MM2jZ/hxG/qSMCQIVJzUS5WVm0qiH12b/YiGxhA5zjrqvLB7g/yNamIT/
	 rtaE4zTPupeBRrdi01EO7EcLtrl77sXgfVZRMB1dM6AsYBn5X6qsNAYir9o1Gk/iFRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=;
	b=pwtSVc73DenAN2s01wgWSU31h/2qUE3+nfrMglQXknHn07BoSRUjSKkQpcXfipy2MkTn
	 9JiQUIZ380U8C7jJep6zTsX7KQmwQ0VY8osTBwtNBu57hJ+k7ETosZHvOnpEXNFV4jFOn
	 x7zC9UT8uFcWX6w1UoEmuHeCkG3LijbMnOkxlpQzQDB8tnsI1EZQXNVFOUwygRdf/twIM
	 1BAoEGtlRsdxRWw1EgXTPjqZmfxL9xgfhdI+TuLdPDOTx0FGf5nPSWh2pSZSrtGnu8YPX
	 V/d385dciQJeO90qXTAVDzQcoPo4bN1x62uW3DaQLY2VPZTSn3ZqBq/ON26fBEYkcjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oGhfbJRQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q4lcd52M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B438C60A2603
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B438C60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oGhfbJRQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q4lcd52M
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K9pajt1302056
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=; b=oGhfbJRQfvbeZtL+
	gRLH62ZIf4MA+U25I+PDRuPyk3QHkdugT4eAvKiayCW5npyYzyJWZSh38nfuwHxS
	2S5fnql5P/tTSZEPLqTI9Atpv5fD9QiTjXtbjFNAWs8FXqf2a7q3VOGzY1FI2GGm
	Y0o0YsmNa5osTkvuJJukEkRj2BL68WkOCY6PCvpKEalI+R+VLusX+p4W3qNsdNvQ
	rvBTV1OvyBPwEFpmx7qKaZYXTYPgRQMzkkIYl7trIUQyA/GGxGb1QahgMrtAkgI0
	F+z/DuP5f2clI8F6zUK8Gwk2tFAB4qYbpJ05CTUP9qdJ736sc90bqRTXcUYv+x7k
	B+DKNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1xvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:55:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so51765885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792490137; x=1793094937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=;
        b=Q4lcd52Mf5jpeLmHrgE+XmCKc0GGcR0v0jygipGqHcUb6bX/bYeD3AYW/+TZWcldkg
         fz0vabmj99SdBxmC9pF3VZFNvvzTauJpdA5pJSdy2ierXBpfDdWAYXGVT45nls/bxLy+
         j6s5U44ZhdDFhUoFdche3CZdN9HzOFX1A1oi5smpQLRtxZsHWqD84uq+W5o3qR/CoNwn
         KGwXX1opecTpe3vndPe3TBtYJOeGSPdpUnll8wxdQ8tqmhu+C3dlbm1Rc7V5psQb0Je5
         gHyD9+Zh+XBKKY2BVZ7c4qTPNgMxvxPH8gyoSwGTOdOyjA3qpP6/z+GDX00mF1IjX/Vp
         7oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792490137; x=1793094937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=;
        b=KyJu2CWyBqW+RcPs/OU4dQw+SkOyUK2zLlB+c0DkPYPSwm4qjamBk+NFBaf12y0R20
         /BnZTN6iRLOkOuQDrfyRE3SZBzNPW8qqAIYLeeQeQk2Q7HzjNyHDqCh4iDYUSf0Ufkdo
         rf9k8ezU2dQ6tPTIPS8yMA1400Qm1F8kS1dXWRxeCYZOHvXYqDIwNmFX96tEG1oPJamR
         n12gM8q3t8G86Ofq5/iOgbrndZjNQm/n75grz7ZcoDTTHeg93VpMPmmO4RMTxE4liDwm
         TwYMPOUjDQh7LZYyYmDQq5DVIse7TkBFT3nS7kbfgbSFTNS/FcUroiG8dP3QUzaLEr7O
         BYtg==
X-Forwarded-Encrypted: i=1; AKwUvBx1/fdxSwjBvOl+em0xlg1j6TNLe+2BF2M3TdW6/MtyOB1v2tpxV6cJ7RDy4YmU1orhe5XWgTP9BtchuZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9XaU0vZ+f9N0M/q34U4rsUhIuKen9mJRymXg3iPbv+OJvTME7
	m3GVNluxvfKgs8g7isf70SccfWXqr1i70SX5ueN5dh2PsI2nNN8FEZK5MnN2gFxMN3RwEhjEM6H
	cFnPyqUCLQmNUpy9Z3Q7Qpphhk38Jb4hAisceCcsxs54jbGBr8eHaIqn5BKtnz+rsTxI=
X-Gm-Gg: AYBFou2OEbS9uln9VpZsscmajWdih+4FOVxfGgVgwLOHzMDQhVX/fq0vbU+r78sweWS
	imSKckKgqY+lwOLvcHg8YCRY+nh5m/6iTwHqMOgh1crAdLdDFDV3BHioy8m5nDd29qvthYDfGAJ
	62T6cDM4l7zfJRSQ7KDOpClO9SreiyPYMvn+7apDCZD5xVuoJ1brRo+8HAH1TVi9bAU2weF8Lte
	AfI7umc84bchr4S7YwyhcZcPJadneH1JpyS9IXWvZk1ZRVv2dTN3caWb+kd9REo0El0A7Var3TD
	+Qm6oOh5mqhUdbhKxnuZ5ECJ0yDxndOF6FKndlVFx630XfGEXWPnhtr9q3/r7CX6nVTxiAbwc4a
	vywnSbYCgqOPcSCGVZg3wMw==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1820738485a.0.1792490137124;
        Tue, 20 Oct 2026 02:55:37 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1820736585a.0.1792490136680;
        Tue, 20 Oct 2026 02:55:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb4ba6sm461409766b.75.2026.10.20.02.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:55:35 -0700 (PDT)
Message-ID: <4ec618a6-052b-47de-8418-e0e319af10ce@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 11:55:34 +0200
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
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: expose the charge
 current limit
To: Joonhoe Kim <26rote@gmail.com>, sre@kernel.org
Cc: kamal.wadhwa@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        dhruvin.rajpura@oss.qualcomm.com, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016124806.1789-1-26rote@gmail.com>
 <20261016124806.1789-2-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016124806.1789-2-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IjwkD_9ikUEqKdL3yPWcJPLqfOAUheAS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzOSBTYWx0ZWRfXyqaguPCUmuvr
 GWlfa8jB8tI9QGBOFsLT2dqqasuY3pzaDItnnWSSMmiDW1+vmzq3GeYW1wFGPz/hbisEgtktVNC
 lGCBt5q71jqA/KRpkDpCR1+oP0VUK68=
X-Proofpoint-ORIG-GUID: IjwkD_9ikUEqKdL3yPWcJPLqfOAUheAS
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad73a99 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=CtmeqFu_9xN5vWxN5BkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOSBTYWx0ZWRfX2pGmv/KUdpFm
 ZXkpTG3mToaH6wbaaKj4ET/pbnnbMfS5qDSyiYPmnc2GtfbT5Hxu0b4kd8Zt5nKkcHeUy96SkpK
 asz2lpyiCsxqf71lowRXQqkoSrzRjNAEUSLRY+Pl6T7SAFlsutbdnRU7Iyz2lAV13Dr181KuXfJ
 PXRUHe3BOlcOUUNh1iei6RdpBDGG+uzlGPJ2iX3TpWfBB0xULNLpKDfLzYoSjSr4GRV5KgMuFjn
 TrL2GOikSuFwimKpP2V4uUT6nq6YLxYF15tvWi6DcbjuKhuG1w/sCyVvx9F1OLHj2r/dzLYTG5P
 G2wSEAq6hX8wgcwAwHjvc4RbnyWhATKeA0FHmxyasgjoG1HYs4UkwrapQOF6EXDAjdNRnSIkU0t
 fekkKs7qSZWl/lt/udAC//dtHQUCLKqYjVBnrh+NuDqMpAZ7GvhTIULbtzKeiNwUQKNVA0j82Us
 CB6WalhhcFCCl2Rvdjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200039

On 10/16/26 2:48 PM, Joonhoe Kim wrote:
> The battery manager firmware takes a charge current limit in uA
> (BATT_CHG_CTRL_LIM) and reports the highest value it accepts
> (BATT_CHG_CTRL_LIM_MAX). Expose them on SM8550 class batteries as
> charge_control_limit and charge_control_limit_max, clamping writes to
> the maximum.

[...]


> +static int qcom_battmgr_set_charge_control_limit(struct qcom_battmgr *battmgr, int limit)
> +{
> +	int ret;
> +
> +	if (limit < 0)
> +		return -EINVAL;
> +
> +	mutex_lock(&battmgr->lock);

guard(mutex)(&battmgr->lock)

> +	ret = qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_GET,
> +					    BATT_CHG_CTRL_LIM_MAX, 0);
> +	if (!ret) {

LLM suggests to add:

-	if (!ret) {
+	if (!ret && !battmgr->info.charge_ctrl_limit_max)
+		ret = -ENODATA;
+	if (!ret) {

to prevent a possible zero-maximum value coming from the FW
from messing with us here

Konrad
