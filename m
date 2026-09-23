Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC2945DF58
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150450; cv=none; b=PXdkfVPiyx6ZSOHKT2LdxhL84Fe7j64ZXblZKudsegnV9ePb6dBgL4dgC6QnFQjkjEwatvjE6hKT0CsRsUPvctA3KrhyxgugRNXjrvnTstWcwEoFFUP3cATjIfptRvUTdDwdKgRdO45Mdh/8sCkueX71O4ZbESfQS4ck3y2vwGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150450; c=relaxed/simple;
	bh=JwN6hTpQMoQFMwVkfyByUPHFjCGMZVwMl45a+afjvpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDlg7OYm7RM5UhttwF0PUF434JpVcweQX21lNuyYxQpQSsJqoEGZvTy6IV/hQvyrH7EGoRhrPhjbRxbME6WR1uA/yxlp8s3WSqcEHqqQ3N2HnqubYxMkxuPFPBv4MeKjmIlrAouO/4sQG1LXIVi4bbGOIuXztdZL2w61cvD5C88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LSn+6HK3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PsQRL5qF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LSn+6HK3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PsQRL5qF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79bFY2432960
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbKWYqzhETMmr7i4688SV4iPCxXjaRS2goi1GtN4YHw=; b=LSn+6HK3iMvlf/8v
	2vGE28m8DpnxLe0zP7QeJOxg/CDxJ9LZFz8fRoUfug+UhvaY4RQnRcDxF4ygZ6mo
	eBCOkj8k+FvVzO5s6MmbvehNlRZkFUvImuPT1FVBKUR29QoRgq4C4yNO2NU6yUJG
	ayjiatt/of3JYKUCeuA203Cb+Ol9M2oG7iyudnNkNAz7OsrzrzJMGBgl51EPav6a
	l3Cxy1w7ZceleOiTAu9i0WGM0Ssh5pk8baya1d4MsTDkS79trxUMUf7msRHiy26T
	5XGQubQaeeE7QQ50toylZIDDSST/25DxG6Fw8mnlZErDWzirBc/aacpNYPtwMJzt
	Iim9uw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv3319qt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:00:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91043af01d9so13804826d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790150445; x=1790755245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbKWYqzhETMmr7i4688SV4iPCxXjaRS2goi1GtN4YHw=;
        b=PsQRL5qFCmE/loHsC97ocj3utn39DkLM/5YdtHTimQXaPDiVU10eXmEUUBOiWIpnKM
         4F1NC9ZxnYcK7ejDszE9vxbcOCLh9N43UxiaXreCnrVC8X+wtM0YEDjgVUaF+jFN3qcW
         kVfZa3i4fT4MEt+cpaQMNi1h/8/V96tJfuX8yvcxRYtsKyePxYkDAGme2mywlAxOT/bK
         K2dHc5lYXQJ9fHX57hXPX2bfMDPzecl45skt8KfXxhQBtnjLEimzOCmFk9gLCiTJdglv
         PuC3rbPS3HJQZ+beIOClbfw+Da1gfLuLzC+7ojVbtF94QqNo0Z6CxOxtpJq6v6ySzYIw
         uQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150445; x=1790755245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbKWYqzhETMmr7i4688SV4iPCxXjaRS2goi1GtN4YHw=;
        b=cj9qzJ4YToZ4VTcVijH10Yo4/hyGUJNHE3fikmf88QJhefWIN7D7K7+1+6hyZgyy9I
         /7Llng7C2r6w5btOLTOfjkp4NMRcjTs9MPvvksOIPhz4oI2VbIIAFPGVzOGzh7TMRGsW
         7DuARZVOTrUy0wf1X15Wl8EKtXjXFgZygD3SP4BP+zDbZyGLPkhR8HpGmIjXjY2KqFJN
         Zu/ubb4i8fYD5JSZDgWw6yiEYhrtrunqxJKQQFc7SvWRT7ilCE31cBIqQhorrLRFAuIY
         lqnOcj+49TGEqGOPc4Jzufm5sbGld0agpE78WQfxysp47AMtWenjRXvuFeloo/FTVuXj
         jRGA==
X-Forwarded-Encrypted: i=1; AKwUvBxPUjVGNds4ZgQpBiQJu5/nUxdWzXwavH08DP+2IRXoOziSnwobZed5URpLDA10NY6IPTS8ydO3CkM5rxg=@vger.kernel.org
X-Gm-Message-State: AFuF++n9BJNtLE2P047by4Ne1lCISYuojcvQTywsnRprHi4FCn72a9Pa
	F16BjpwlhJpmSh0KnHjqvEz68GSLBP0q4scI4BusL98CO0sGUQR5dftctdHAs5LkqsNY4iyqLj9
	IFHviUDDOdCS5qmBj8VxaLmxuK107axf7ilybiY5rFFXCs37k7a0bvfWAzDZocFBthUM=
X-Gm-Gg: AYBFou1DlFEwoNIcoY5/y5mLmoOppUuTV7ztE/KBCS0Y+3YZzxgQcDOo3wfKIHGB7AI
	na1CKXzkYv/p3LTygYBHaLV0RXxxERMKGPR4H7ppgjcHTstPveD+q324k1wGyrUM/6s3n07pRFC
	b7mSbxMnt3MFtshg4LYvdaCiaQXtMwU/lqfxYAmsY4vT3A1S4ZkFCkdrBqd76854/imWIeK59N3
	MVXglLvbTdYjj1TaBvTA2S0i39BGh5nlij+o8wMManrzIE+9P38bGaLpLa1HPr4Ctesc71cU/O2
	2Gcy2ODpR3jmNdtR1gML3OYsjfjuwWt6ez4KX6GFVhcLh3dPrNo7MuG2BTEfQl3hBNvO7SCJqOo
	nDtshtysmUg7uxS8pHdV28yAqCFz267coWQggIRzn4ApfIk8O+/ZJYdIrZo37wQ==
X-Received: by 2002:a05:620a:3910:b0:93a:252:705b with SMTP id af79cd13be357-93c2513e511mr295175385a.23.1790150444654;
        Wed, 23 Sep 2026 01:00:44 -0700 (PDT)
X-Received: by 2002:a05:620a:3910:b0:93a:252:705b with SMTP id af79cd13be357-93c2513e511mr295172185a.23.1790150444287;
        Wed, 23 Sep 2026 01:00:44 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a913:ba43:96d7:743c? ([2a05:6e02:1041:c10:a913:ba43:96d7:743c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1a3b46sm55135535e9.11.2026.09.23.01.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:00:43 -0700 (PDT)
Message-ID: <313f498d-a66f-4e38-ba9b-6393f42a3826@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:00:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: qcom-adc5-gen3: Annotate struct
 adc5_device_data with __counted_by_ptr
To: Bill Wendling <morbo@google.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        codemender-patching+linux@google.com
References: <20260922220950.2267270-1-morbo@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260922220950.2267270-1-morbo@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g5HR6dIthic7l71rYGCoWgTyWS8hjNwp
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab3872d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=1XWaLZrsAAAA:8
 a=EUspDBNiAAAA:8 a=4ffO35K8LLM2FldQJH0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: g5HR6dIthic7l71rYGCoWgTyWS8hjNwp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMSBTYWx0ZWRfXy4KvI5Aa7d0Q
 6nTA40q8dc3E+1AW1XdoFQFbVoI/S5dao495XUI2B9JwXq7+BN9DQzmaiwb6jfE05ncqUoFUEqj
 G6wYp45hQ3wHzE72fzGpGflMB+6F8Qo5JeVYrs9Ql3cssQmnP9brSwb47MuGR+emtl3A60Ui93O
 muHnpk31dqQ0oC6SaX56eZi7M/9oaxKve1zqIW/l7gF0S0XT8YOTrZJCijByfbFlQxDa+gxaE3h
 drYgpE9BaPYNdfQHzBx4tIgSi3rt1AiTE9vLNq8+bQDYX/8VHN8kMarzZR3kRR6ROtxHdznDlN0
 qWAaKsy6KnEgbZ6XT8+Vkof1M18CJ0AG8izDHDeWPstOZ2bzWlHNHCk9D4e6FFSk8MkeN5/SzN0
 A15DV9K/r9RnaKhKJw4c7jhRB1UBGHoHmvY04oBdsi/KHjLYTIgo9rgM4A4ff0gtE+yG5lUFCuL
 FFTIRS0tZPzp0JvEwrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMSBTYWx0ZWRfX/sX21Svscmxd
 GilCVfRyCm1mP4AAAmbsx5ZZeFsmGy84yEDDHlhEzAKyErPriPQghYviW9EsNXu+3oSgBiSxnR+
 HPCjhZ3LYAiVpkggvukRddzR+1SijaQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230031

On 9/23/26 00:09, Bill Wendling wrote:
> Under compiler-supported bounds checking (via KASAN or UBSAN), pointer
> fields inside structures can be annotated with the '__counted_by_ptr'
> attribute to specify which field in the same structure holds the element
> count. This enables the compiler to perform runtime bounds checking on
> the pointer.
> 
> Annotate the "base" pointer field in "struct adc5_device_data" with the
> "__counted_by_ptr" attribute pointing to "num_sdams". The number of
> SDAMs is determined from the device property and assigned to "num_sdams"
> which is then used to initialize "base" via "devm_kcalloc".
> 
> By ensuring "num_sdams" is set to the correct element count prior to
> the "base" pointer allocation, and since the size of "base" is never
> reallocated or changed, this annotation is safe and will not cause any
> false-positive runtime bounds check panics or KASAN issues.
> 
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

