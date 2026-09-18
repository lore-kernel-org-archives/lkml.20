Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412F330E0FE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723834; cv=none; b=WXyERLOk0czZyHIRcDaML2CucYvJG9gIDaX8bkgr6Sx2MrrKW65yv3vHGCfppfifAZfWVLnELM/omCi0BCjpReMv4C6P8lL6IZLrNloZrQQMet5/pr+yDjRTLeJ8f/7gml1O4FqVPtxLDh01KmNCYt08S5t4Oku3nDWEzdc8dXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723834; c=relaxed/simple;
	bh=xVvPBhcxFPbVB1dpikehNudtA6+pusoKbTL5cGXpAfM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LgU07QH/bAl2V3sEeikTqAxHzmJuhqfjpm7Gjc0Gce9sYdmTEaHP4B5H29it6KN9THcetGPQ7bW5jPYl9QGp6D8CHRrGwIy36lbqRa1ltLz9KL3fwBl2NTy9+CP3WHZlpM/WDI1jQ8u8cr4GCcifwMyHpTIs9iMnVx1OKfmWnIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLPoiHxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iu/nlUaE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLPoiHxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iu/nlUaE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I60ViL021427
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=; b=YLPoiHxsIe8HtJiX
	oRFJRCjiOGzRoV9uipka15Bze9kbzS8DzAO2GzdTk7SGkPMz/qKuOT74bkrHyt6K
	rWWrh0X3aG6oRE9542rI9flAMwzY8xHW4ZPa/yYPwwmJQZojBBeH1DLbzMQPHF+6
	9FKrkHY/AeqYfFldo8GkzOvTpp8EquXjwbv8JQZjEtlmZHEEaanMTbaHt2ZCtUlM
	gYWcp7P7Dg9YNt4OTIumt21JY7BICjqNpWPn69RHGGq8JAFV+Z/xsOqTrzotEcQi
	JuYhYVpylKaFAIYS7LwfInhuNiU1pemnFoMSyuDAws5Ov1DJ5lI5F50FY06FzO18
	sYAdSQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqeb80t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:30:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90c8da50f4fso7495286d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723831; x=1790328631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=;
        b=Iu/nlUaE6BuoTfsIvg43be5okbo1xOL4iT9IbLjTYwg3vVTS13FIOhBucfnY4LJNUh
         v3nNkhrUfShrshTyOhy0tpWkbaK36KIu3l44RYtStkeHUSjqUODYYjguswrO4Z5l4r6t
         mWVxja86RzfL7UAcZ066vCgwclMfO4UaoAuQzBOxf8A0Y5J8DTjNPoDB4a3yYIzzmDSA
         99xP76TN5G4StFeSDInnVjmus7hVysubGx/tkUQDQOULqr0xlo6rVPInxtZn7Q6WsZtx
         qseORdAvWZk2BFV5uvaranjz02LTttPYbJecMzuj1sXleJsmYIMVyJzjbU5YHyANI2Ug
         IlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723831; x=1790328631;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPt4UPchwds0HyAFeyAS2O3QFIIxm44YoVgrGfIwWCM=;
        b=2Dw5jjDf3DaNaZkEiAuum+M4uaYiYOLuRCRn5B4B8hCwgZ8YzGeCDY4sQh3tjJW+n4
         sxy0QpqXOo3VPBpnTnwB4oV3B5kzIOV8RvzJ1sa/sPzwWov9X0NHRaSCQ/Qd5qHtSgaQ
         IzoE7i3sfi6dri42RkG2lp0PtkUAQDKQx/cxyh+L4At62ELEyCKndpyf3Z2trTdN5n0+
         GFsem7rXtDexP62vlTUUTJgko7ZMUcfGMkWbptInIW5nQATdIK+wx4EoR/oSylnnR8N3
         1Bl/uKH8JfDUQ9/RROyChSjjZ5275oWfQ1Ci6UVHmbfqE68E0jl0ISsr8eoPbUQjcmdl
         OHgw==
X-Forwarded-Encrypted: i=1; AKwUvBzKOf5fwFIQ9IJOZa/dlUd5RiVDcF7sAqpuo1ll+9iqMSnXT8c7YaQsD5Dc0d2uJhrEZ6wAjFTCaxhy/Jo=@vger.kernel.org
X-Gm-Message-State: AFuF++nUbJ0aWezpwQMdfHKLPVQ3OmZjZVwcop9IjmDX3A1GfY0QMBwF
	INtTiSuum/L9Bqs2JKEjeO64KK97k7/6gmJkqu9UpUnzKzpsLgjCIDQWmOqWgjR+zovBMJlY6TC
	wwGCd+HPRrkQVh5mZfZjGlfWJHPjia2fNW7dveU3bRLlFDP3hfrr1ey0bAXNRppusIRU=
X-Gm-Gg: AYBFou0kjitJeuXLPj1WruIu83WQ03GQD9mzSweeLr2qbRMsX4EC/G3rI5VNgNSEptK
	GF7O5qKKf653Hr48+ZuBLpDivRIpo7C7hn+iV3h+/O0vrG5kwba5Tft1hd0+Td/9SNPyBTuEEKR
	LuNH2VCUEll5XtfqUO2y4CSIZlAFNcO0aHlgUEKiGbV6hyJusQftDCRynZ9Mc0aRjZYy9ASE6Li
	0f0C/HJSsaMk+xWoUHSmrBRigbYb+qd4gppdUmH00ZC2BhqiC2bG8bNpr5psLH6jALpwI5NpP1z
	LubAGb4tW4+LdRIzcdltK3JEAjPNAEmHcc1MYCKYobWofZ+QuFdORN4Kr2OhMvDMvzu2BgdVIqz
	4uAC3DYAX9zhisxlblWCy0oE66WYNHaNjiqRqjghcjqPIfHYCyoSVy8w7is2FtN96C0XaFPCSYH
	1RpmPd+AFBmaMzG1z4IZiuNaICrUqgMHTuiOgr5c46sizNSTyIqq8yQ3Cpv7sy69yNNg==
X-Received: by 2002:a05:620a:4385:b0:93b:d7a2:83d7 with SMTP id af79cd13be357-93bdca24e18mr230311885a.70.1789723831353;
        Fri, 18 Sep 2026 02:30:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4385:b0:93b:d7a2:83d7 with SMTP id af79cd13be357-93bdca24e18mr230308885a.70.1789723830923;
        Fri, 18 Sep 2026 02:30:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6a06sm36747966b.53.2026.09.18.02.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:30:30 -0700 (PDT)
Message-ID: <6f1870b3-c01d-4434-a7e7-64c82cb8db41@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:30:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/4] firmware: arm_scmi: fix module auto-loading
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260915-origami-ibis-of-love-adaac1@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260915-origami-ibis-of-love-adaac1@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i2UoYI9J1nkH7rpNcN5N4AaIqvoMaW1n
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad04b7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hAX5TG2nhHmSM0hg0PEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: i2UoYI9J1nkH7rpNcN5N4AaIqvoMaW1n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX/aD9S/R8MPSK
 sHK59p9K+F4YZzVh6tHj3FyuwkZVAf/GtgReaa/vhQPPXdnMhKpEptgOwlsbXkv9mWgIuJTBgj+
 lHvq8N52ItmFtMdoPiBkcNfE4NurwbxqfEVomqlH3EsVEYFilBgNA+qnEP7PAcb5RK/75zLBE4f
 d/ppvQQ7NbbOpwe9DWiibeMZyj9uyGpWOiTiXBx7vCzBZUqD9qB14ElN2jY+Fiau1SC3NretLO8
 dkg3HwqIeSPqJbEJpj6WKTmeXQPBWZAHGfbE3+JdO2D68AL1jBPPnzyrYDvq6wwXfqunkCqlf7E
 UfDbl+im2mwZF/xT8f3r5iZ6FOcg41MJ5dLDAMhT43wIl7R3JSG7XqxRUeUFoYyMujEysxcjiGJ
 pNDiroQDaR4lCRTPnlRW2+O9azEjkbncsEPzh+3/No3cACTi9KY6AH01MfbOSMJya9IKpxsAUWk
 7qtLGaYeDIVdtROWZBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX5iWegA15WoL5
 kknvHK/UiXF6JSpSsAS7Lp+cTUhZlOEgBMqz+q/YOXNrNaXw2aOMZ2d9f/lXSc/3bHCjAJ1COx7
 hjipAGBd4do53MPqXV0sndPUavT/HJo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180131

Hi Sudeep,

On 15-Sep-26 16:24, Sudeep Holla wrote:
> On Fri, Sep 11, 2026 at 05:23:25PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is v6 of the patch series fixing arm_scmi module autoloading this
>> combines:
>>
>> 1. Patch 1/4 from Bjorn to add support for scmi bus modaliases to modpost:
>> https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/
>>
>> 2. 2 SCMI bus code bug-fixes.
>>
> 
> I had a bunch of SCMI bus/core driver fixes merged into v7.3, please
> rebase these changes on v7.3-rc2 or above and post.

Ack, I've just send out a v7 series which is based on v7.3-rc3.

Regards,

Hans


