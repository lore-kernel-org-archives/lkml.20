Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AB6493D4A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983244; cv=none; b=W+LPgNrmwXDNEJyvyWJYksWSRpYHCXmUcteEib37QJ6FLo8s2uzTIYdu9TYyxMzv15KmCzqi4/DXJ4HoGb2CtO0ne9cIcaeFHKt3lRS7rZJbcQo0JVf0h5dCHsX4dQBRbCmPXdjuh3Fs4IFmn/HQZFwWq+HGPIvEcdkphBWWKPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983244; c=relaxed/simple;
	bh=0J1b4Nzf5ZJ1sGsLzkFbqHO/xtQTjulT6PuhEg+Eyuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jm/1loiaaC5ebYPOHngjJ5+e8fr8ZY0tj57R8yWVS5nPqHn2Wh0TVMxamXZAet4iVwiYL3XKNQNse/P7+rlh9/0okneEiPV5AyOx351j9cAoDC4z3t/79C+uC7p09oRdJV1eCShDeOi51J1WffkexN+inJw2AhB3x1NYIXX/x4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbZyFTb2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hOogYvaG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbZyFTb2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hOogYvaG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L84X914135113
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PtvOL14YM3nT3vmMLJC7ZnwiIKwt3L317gMzSlbLMW8=; b=SbZyFTb2kS7NKCNU
	kLYx/JCkdxkuvWkf9rlXjWW5yO/aLeYME/9hWFOw0THtXuGDhl78tCjzQmOLkWMw
	dL6TTbrVNmyCXtUX13Fl1zNJezQbt3ewoVlrPhC9puwPYK8gvgyQxj7gyzAdkt6u
	ft8nBORkps2gNc5s+s349dBvzM3UCHQ4j3bfPSWfg/jiuhT72UpGgifyUroIsPJ5
	KnHecinBNLa00ov2Q5MZ6BG5ZOVLcj7j3yGPcnFBsuFtpt1ZVIvflONIEU3CkqYE
	St5COCheswdDIToETIeCMB3l8MqLOD0KP9sie+mkvS4ohMb09VTeb6j6/oeZ3Y9r
	YjRIQA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj0csf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:34:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so5513997a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789983240; x=1790588040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtvOL14YM3nT3vmMLJC7ZnwiIKwt3L317gMzSlbLMW8=;
        b=hOogYvaGz7qQFivY1N0qZD5a069y66sAZij3SYSFPcPJcXJaIvn+hCUSmniWOnw17K
         yEu+lObeqfbz+yEkZmLsgTMxDlnG9d34qVklhh0aQwmdDGL1yC0aS/CDpj/XV0/SKxJo
         tRbc8rriPvQz8swT5S31a7hrQTfMm9gNaVIHoVse7LFRPd2tqZlyq4HxHrm+HLejLJxA
         ykZ+XeCycWMNC5tihh0miiKVhbz7o9wQtCt+zFzu0FooZ6Q2lM3de8u6PwZRL9F5e31u
         mDZ+pmyM69/neEI+bFS5xzqcCEsWAMXC9qUcg1AW/Hw8vU63cEVlA706l9djAPfZj+af
         3aAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789983240; x=1790588040;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PtvOL14YM3nT3vmMLJC7ZnwiIKwt3L317gMzSlbLMW8=;
        b=sXyE9TkaQRpPRXmtDstqKkvY4u5A/4F3G3SWyqn0zHQ37I1cPJTYzsDW9ark1uJNE2
         YM7/q3enTB6bDQPd+IKjdIbLYfxbP8UvfnU0WNKuiGsMAJPvKAH5MZh/WFax+e2RQj+b
         HWhqvntIJfEZ92V05ubpBhP2vsRvj08aLlmT6DFOC6Hwspn6yCJBeHFIsvLhOUz4fNoy
         QZBLhhcVjdbnmNrrpntj5kUxieVylcLdi2Np9l0OdTNcoJr+XhrgtqC41sZHCczssH+Z
         EZa4Lk1gPzGQqv0ksrjsmY2OZrNjZktejKNzDXP4HTX94ojEq4fIPtmspSyZsXA9RiI8
         o4fw==
X-Forwarded-Encrypted: i=1; AKwUvBzpsZW/VWU9boaeX0ACBpG2dehbeTUW0QDqNanUfoGZDDi3U6tzBfUt6bO3NT+E1eSHELSFjoyfnON4vME=@vger.kernel.org
X-Gm-Message-State: AFuF++kyJEelS/YVU6zG3hVOnnJ3sNwbg3PqgZVvDrW5OQ2AqhLO1EsD
	IVlL/PoMbGnfr/6YdqzjSXqDF7OqhBCmOEJte+VErA4B9n5MKnCfUCx/IhnxWQ2tycmWqkD//gX
	fEmejWRshcXP8mAlS1MvJNBLZ+pjWH2t7rhEaoX4172YAb0oSHEbCXJM6vu/lDS0Qu267DWdseO
	I=
X-Gm-Gg: AYBFou29/epBGy4fQPPtKQvo8a8jzUX2WRnmGFJ6ei8joIEJHvSdNEQk7KFFeo3n8Tb
	Ldc4HoUNXbqPgjwiPoDtYEpm1L1smnfjt7RulT6rDrcUdxp0dlAd0bAuCJkit6RJQCYDxfTggv5
	5pyjRj1jJ6PeJU3lkIcY0Lk25+HPtHlh/8CEEkaADRNHL1xWTQN1U+DBfbI4cgxaOguVAIxiQMb
	GUPzGosOn0KdWxfcggVOqTqQurGW9YPmBaM06MUsQfS7kOR/VHMCxQwCiyLSlMIZSbGaWGHI/Gf
	dpV0sv8v2kboJG4/ZtIFIHTULeZ3cCxhIH5TgbV7zev9M+Kjs/kNceO/cpmAl4rrXUz/tLvyqIP
	IokgoCrJkySNx0AEfhzPIbSPmE3T2vg==
X-Received: by 2002:a17:90b:57e8:b0:39e:4c7f:8b19 with SMTP id 98e67ed59e1d1-39e54d458b7mr16314378a91.30.1789983240034;
        Mon, 21 Sep 2026 02:34:00 -0700 (PDT)
X-Received: by 2002:a17:90b:57e8:b0:39e:4c7f:8b19 with SMTP id 98e67ed59e1d1-39e54d458b7mr16314346a91.30.1789983239541;
        Mon, 21 Sep 2026 02:33:59 -0700 (PDT)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144e16a7f71sm8005661c88.8.2026.09.21.02.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:33:59 -0700 (PDT)
Message-ID: <81666138-d6b4-460d-90fa-3b372e9da99c@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:03:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: ucsi: Get the connector fwnode based on reg
 value
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260916042808.2879079-1-prashanth.k@oss.qualcomm.com>
 <aq0B1fbrqk5_ppsv@black.igk.intel.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <aq0B1fbrqk5_ppsv@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzNiBTYWx0ZWRfX/g7GVbncu9MM
 JPWkbIx6iOpTOVliK9eDl8i9aMR41vlMScrDMb5pfD1o5DpQRz52mW9iksDku3obMeYvVoEQuaN
 uDH5bmGlFjmddJ6uqWnHQtm4hIo8RpU=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab0fa09 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=KtO3Uq3HwnMQzyJ4:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=x3d6ePvnTooygXxn4toA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 8d8aHHd2iFzQmJQRSABSVtHPfA0qNtuY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzNiBTYWx0ZWRfX53PLrw2HSvDG
 ZT67reItL8PQddJoh13iSQIqTVlRghRGoCnQ2vzba0MecsGpTb27E4PGotHdNZb/UTr5LUNsRtF
 JgOLNaFzULoG3djXyczpMFuC/XwDhARwHhb/sBZOrFiHCo++Qv7o6Ikh/Mm5RabKO93+HiPYDo+
 aTP7I9+g+HevmTQmFxe2V86ClSAcWbumXs+N0qQQuT2nEfDT/7eE4E6LecNSbIix+8By2p+d5nP
 666oD9PScQQe//nTTKDczFXt+4Bq9yE5xhdbLkSOZevuz8JzobXEYJHpYFWAww47gHjdxEapR8V
 /ODb4l/ru3dsg32qRVZ7fngAvRchcrXrtr7U/hT1UMlbfcviOe/AbXGFOreujx82uRyyW8XKOLi
 NkeF2oOQZF2kMO2MEQLWzuZK4sLSAMtsP6bHkZppvfiyLARHoisfZ/W4D9l1K5o8qBqG+v+U9c3
 cKPKD2+ekuRiZuCyORg==
X-Proofpoint-ORIG-GUID: 8d8aHHd2iFzQmJQRSABSVtHPfA0qNtuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210136



On 9/18/2026 2:48 PM, Heikki Krogerus wrote:
> On Wed, Sep 16, 2026 at 09:58:08AM +0530, Prashanth K wrote:
>> ucsi_find_fwnode() currently maps UCSI connectors to Device tree
>> connector nodes based on the order in which connector child nodes
>> are described in DT.
>>
>> This can fail because the ordering of child nodes isn't guaranteed
>> in Device-tree. For example, DTB may contain connector@1 before
>> connector@0, causing connector numbers to be associated with the wrong
>> fwnode. As a result, role switch and Type-C notifications can be
>> delivered to the wrong remote endpoints.
>>
>> Fix this by using the "reg" property of each connector to match
>> its corresponding fwnode. While at it, if the reg property isn't
>> present, then fall back to the old method.
>>
>> Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
> 
> That commit does not yet include any kind of support for DT.
> 

I understand DT wasn't added at the point where this commit was
authored. But this is the base commit where the bug was introduced,
that's why I added it in fixes tag. Do you have any other suggestion ?

The patch simply distinguishes connectors with and without <reg>
property and uses different logics, hence it should work for all targets.

Regards,
Prashanth K
