Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DD33859D7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723601; cv=none; b=ejy3/ut2PEcY1Yfb+sSgHATAXBdFhe6RUC7nWnlY8pRO2sWEXi7TZOJcoUIx7UyVTApCPOzM+6O1wv2vdwEWbLvmi8EZo3dl8i3g6Xm1nx7PUoZz4qB4nX1VmSheVKpH14/lf2mtoP+bXVK80prYNuucOzghgjSc4ci8mUJicTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723601; c=relaxed/simple;
	bh=gIL6hDWa60lnccTvkEgMeuR8E1aTzwkmdxPpMKIZ8xQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FAkSnrEBdJYmaDBou/hrQvH4RV7hu/08vdjywjbBh814PgBREKbby1dSu8eY7hsX3xVWKudCIWHnU5x5l1QwN/3GUHjtP09VQ7uyJrmSnnjV6N/AYIzOoapAitPMyLYJ0z+/+6v4nikqUBXVNgXd7QQMi4R9zz7JUD51U00B+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTdV6ECt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqrk4zUA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTdV6ECt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqrk4zUA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I602rA3304793
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OCfArd1fgKC44I5JZ5GUogTe93k25uI8hDyLvcW7e3U=; b=KTdV6ECtGkqjFMIM
	WXoXqJ/mkAnnVOVsr77WygbTheTO6/QOhdENm1trWkudebiTEuMbDGp9MKdVk7qR
	2gJ1jcv/8/zxAYi3iakUmPWQlKid00VAFCYbaKCg4worn0wrOnk5s1eQ56xSWnhi
	HU1i99bJU0CBq8RNI6P5SVxtfkIPEWVhhHIlq7EiozcJKp3ko08ChTNG8/Jgu262
	/29CrT8U3Kq+Za1iFZkgGqUnN4YoNLd4ggMe8SC3YgbdPz6eLV5IjMqpLnvaxT5g
	vYCMVFtkp2nJHTNIcXz90ayR1h8Lp8NIp5aWQscHW2zLCRSO1iEKlo4L4gxGUv4r
	k+OOiw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ktumf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:26:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91242b356cbso7343136d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723598; x=1790328398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCfArd1fgKC44I5JZ5GUogTe93k25uI8hDyLvcW7e3U=;
        b=fqrk4zUAvx3DZKHyzALVosv7fdo3fIfekWIDdIav7SW6Fs4XPV0DliSZvsHG0frBWL
         pvp8YTTVHSx44t/LWKFbPf/wSrRYDalPSJWJq2jIEjsRVd+ayk2wgP5SvcKeFtJVxyX+
         nSMwVYrYn7IyO0A/zEqrva7s9JfWNQMz+cV/e0vMPlT2EufWiKLIfJ7Z6/xtovtC8rkW
         JJwhhy+LhzPFrWiF1bl4rocZaMC/0HWlWl0xNhAtcri22a5YAZuOh8jWJZvGRrJJGX6n
         0SQAwTaQ6InR4QX7/CE6Y/oci+YszZoKcAYzHjFDhLjRIDsmyd7p75uT+S8pZHh3Hwnb
         I8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723598; x=1790328398;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OCfArd1fgKC44I5JZ5GUogTe93k25uI8hDyLvcW7e3U=;
        b=TEnT12NkWeSmKGzvF+NBlQybFFBqG1B5vN5YGBZ9Ay2Q6V8QTTzvozFLFBuYXAG20a
         xpd1v/sg8exZqIKW+euntBQtFbOkBx5R8VPVV5bqRpKkYHFkRrkvUBYEOomprjL6OaN8
         YyNN8MM9PDqZcYUhxNQ17yl7KYyadcLbmMjmqOmB/LTbk4QIi91UmDL6ngKvk7AeiYIG
         XuGUtNtXUdITuNHc3zYqTlqVr6J4yTUVETKH4sTrX27jsioqtIGSaolnhvZzAuOfjNPQ
         dokQUqtBgQyQBTcGUTCQgFOCr1N02DzTous/QiJfImEmYkHKzZg9FHg8Eq27jjS6hNmr
         kfew==
X-Forwarded-Encrypted: i=1; AKwUvBxJuekEJxgP3cIcEBpqW/V6ixq+tbwRNnLKUhrQsYHS0lDCRNcK7ne8pdVBSc6S2ttYs4Bnnfms1QNkX6w=@vger.kernel.org
X-Gm-Message-State: AFuF++mMOpaqxn+d0X1o1Q2whgPY5I0wHUO4Htvcccq37Iytfcc6a0q+
	D7vlWqCXr3F3TxEjkUyPLlV2/OBH4r3RlXevSu2+Vo/Fhkx3M21+5HDpIat/Whp6AWf5L8x1/0Z
	fBm108vljI27tB+yRbb9Hb98JvIEA2nmsthP2EPUn/cWwKdJ9Yib9Eqrf8+ItuPDfpU4=
X-Gm-Gg: AYBFou2BK4xyj7IroH2zyfTFYA7l61jppchs7fTpeocEGAMWZQwY8LYnF112CfR3jYc
	t2quIMIenq654E17gBsF1TKjjuzDFsT7MRd5snLJpzOjIAyRhe8YWcTRFbNwwwErOfuRfUTPAqm
	16ScajdfMJhjYDm3Un6/3KBUGU7dP631nBovLkJPx7RzDDocXdDoqG58gVwEFQSF6q3SpUgPCel
	3aAKKr0HeFZBiXUbHEys4PWGOKiyexIYWyWToP4Opm569xiSb2YzXPWP9YhLwDFy8rnQTSzRObL
	JaAFtLrKOwhLeNR2H+skFyEkmHeQSyEGLAh/e+4jUM+roF04IcIDNHEZNSenPwBqHekM3fKBZxO
	vLE48fE/M85ePRN3NCUwvI9YvewpXrJhLsZmMTornUHZ1jviDTfLh64h8kmkSoJ9p7Dmv2UrWWY
	1c5wu+MDxM9HaGU+y7fu3wZIEaq1HHhHxHOLtr9HTGZ5G8c8jKbhrBo1ynYj7u9Fs4MVE=
X-Received: by 2002:a05:620a:29c5:b0:93b:d7b4:bbf with SMTP id af79cd13be357-93bdca5ed54mr202483285a.76.1789723598297;
        Fri, 18 Sep 2026 02:26:38 -0700 (PDT)
X-Received: by 2002:a05:620a:29c5:b0:93b:d7b4:bbf with SMTP id af79cd13be357-93bdca5ed54mr202480685a.76.1789723597628;
        Fri, 18 Sep 2026 02:26:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb0715esm35946966b.20.2026.09.18.02.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:26:36 -0700 (PDT)
Message-ID: <6d103565-42aa-4f02-91b8-bc7598830c8c@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:26:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] firmware: arm_scmi: Fix
 scmi_protocol_device_unrequest() race
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-4-johannes.goede@oss.qualcomm.com>
 <20260915-messy-imposing-frog-ea9338@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260915-messy-imposing-frog-ea9338@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMCBTYWx0ZWRfXyzxhd2Cil09z
 eDf6TUhzB5M6aecmg3NvHrHcAbXmC2OfeUgRhwZ9ZEAXH77PP1E8R4Lio+QingZXVhsSNuFJJM5
 lVcJc0M9pGanxRJSopNNBHBMml1C/5TPmLftNUhactgZAez1EJQ+7s6d7G8wWk0aa8vO7QXV2zF
 86wIk5PMsSo9tqnEZsaW3Wapd1kOSSZbe47LImEFZwXtgYOQqSs/YuqhdyYG3JRmF3I4BaCNqqp
 ckPdcPWokEnD3UNH/Qv9hIkgfpIw9PrCnqGBEGy9FiFxghNhwyXJxwK/UaFiS2gfimhBseyOQyH
 YaHKhY1Z0VylL/+yuQu/dj5JsYzt4SclKwxnwZ3DPVVJPLgURNkUycOjef0C7jP3VnkR/qQarWF
 DrZZ5jSADbCcwVUWsokN8sg/27mmLKu5sPJ3egPUUa2G0rxmszs6Y6InGm/RUCCU9OFanSxnHRd
 fohntQpwwMvOvTgyqaw==
X-Proofpoint-GUID: Skl2uYWIDC3w9vWwfd7v6Y3g2z6B5Hgj
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad03ce cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=U7ZbcBUnRWPs88qqOtMA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMCBTYWx0ZWRfX1ZREZhBbv03H
 MwThE3pHetvWum8/SfWwqZ8eN0AH4QAy+h8MmzdWluHHjhMa2eEEx1wLRSNFH+T22TbeKUCZrPB
 f8VZCynljdRil7o2LM0ZB5XKN3pNduA=
X-Proofpoint-ORIG-GUID: Skl2uYWIDC3w9vWwfd7v6Y3g2z6B5Hgj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180130

Hi,

On 15-Sep-26 16:21, Sudeep Holla wrote:
> On Fri, Sep 11, 2026 at 05:23:28PM +0200, Hans de Goede wrote:
>> scmi_protocol_device_unrequest() unlocks scmi_requested_devices_mtx during
>> the notifier call. During this window phead might have been deleted by
>> another racing scmi_protocol_device_unrequest().
>>
>> Re-acquire phead before cleaning it up to avoid this potential double
>> free problem.
>>
> 
> Does the below address this issue already ?
> Commit 2c4097e6c4ae ("firmware: arm_scmi: Fix requested device removal race")

Yes, the v6 series was based on v7.2 which did not have this yet.

I'll drop this for the upcoming v7.

Regards,

Hans


