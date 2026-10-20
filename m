Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486538;
	b=DVLFkt/9nzGmM+kP0H9Ck3BOY6T9PT89GQEoII/Z9KrsKnp4wl55DiIv+eGrrIMEQLzi
	 FLm5Xgej1OV3xUfrN2XQwOEwT4G3PycqXRbMpWcfY3FsrenrPNufuQPzLvnOzxNNhWs98
	 6klVxOZrpRiqcp7re0M0JXSUrdOi65GxXbnCWToyHLsW1HgEF5nun51QbPExEcKT26PI9
	 WH/lbQ9Km2VDhCXnY9ZZ3aN2DBg1B7I5l5v+P3AD61VYvvhIQNdp45rHzLxqTtPo7S5QT
	 wGfCCLDUp3lJmweGRUOGhhjBuOHLPS7uerZwCGbYDQTWJEyBo+MZ2YjG5H3EXFeSCnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=;
	b=F5chB2bKyQHeVHSw80kwyK2vg9ebNr87XZjTgDVwa06Ug1fkO0UiTnSmtGr6ZTsdyEeI
	 hLNkFkdrtCUqI9AOcarn43BZdpPEVhHiR+0EExNdI1OMzSRcfTY5rEUb9mesrivyT7Ei4
	 403ZUi2l2PFQZgBMkYBesXCJrQIAb9eCt6eULGdQTu+i10coYf/4urqGGM109Gd29PQuV
	 kMdGmCYDAcPGGPdDosH7VyczBSHE/mzq8o8qaTUx3hb5JbeDuwgtkBFWjA6GH6Dp8svcZ
	 HdfPK7MhPkwwEQGGQXmaipgf0bo2l9ED2SOsLfSQEBEftf9y7wpi+DvBdydUsJKkyaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lq9OmtAQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=frZoj4nh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB68606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BB68606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lq9OmtAQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=frZoj4nh
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K6DdXj1385432
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=; b=Lq9OmtAQWjQWLZZr
	0Dx/DKwlsFqK3orkI4FgyxC3gTnbta6JEs7t/qgdeAOWs70gidsWXlO2rumnHWeC
	EKi/EgE/ydB4jYHRjYFIMrlTuMoXpn73XV0Vlj8dlwNAVyuR0D3dXf32gVbZNwVg
	dKLgv5PPaR4MVrmI5Uqb7J0gVfGwB9SruLY3FWrnfhtaje88yF3f7J/kOBBMC34t
	y9t/M5paEhMkUZ67CPPvhtuYIdLQvH7OcG7GSbwRQ3jZ+d5EISOVI2m+uXhtmFlK
	9Dl6N2ZPOb91u+R1S+VGECkXQPVLfji9TxArGXQjOEOsRVDtNxsRs/Z0VtZspvFR
	1RbaYg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5phrnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:55:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e58614290so46148685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792486536; x=1793091336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=;
        b=frZoj4nhqzNvHMqE4WDbRFqI7486l2SBwAkO9gDR4mxtRYnEKwPnFB3Ck2vNGXGACl
         4WYSJE/EQRKhZn6I5eSvwHJrJOgnmdnodasYRd3NCL9yw8BZ8pwgSNH7H9MLg/TGzKBy
         ckLjqVKVyXtoLEh/qtgdxKVOCokZNhMK1KAs+VrF3OcEn2fe9C6/cscUrUEBFe/ELTK3
         K+9840NoRqmt8JDVlr6ZwVZtsc3dTWab6vZsJOdximkkl0wyT+vupPktQNPIuZlSvDwg
         MumC+Ku2bRSxcJ0wP4OBXsfwkUg4JPHhgn121Dpfk4zYlx4QnwlS+HDBzUC2niWteqYW
         4f9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486536; x=1793091336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=;
        b=0ncc6WN2PAVeI4ixDat+5zmFD9U08klZL2FJ1h/yEf9uj8AM+yC81SlNUj3YKb+8qV
         bfIiP8qdF6ImryGJoMuhYzW1sl5E+gPULaTZB9Kw4E+wfHLWpCckM9iXfcS4vNKEigGc
         bYaajwfTFQm7acHsPzMkX11G9XZ6RSoaABpRS/9K7lcmO9P+Il7iUsCPWpJqN1pyxvia
         RuW2TEGOx3E6vnLK9FxQAFMS4W2CpwRHsjfNamV4fOTW7x2nSnrPcUduOmUO6dySr/lU
         voQjRxVOV1CHQOk/0aZjCExp/Cqnnz0OIpZ/izpf/up/aGzGESWSuj6LaZGtdH+zMI++
         hWFg==
X-Forwarded-Encrypted: i=1; AKwUvBzDYf30CII47l9mQevguvaLIQxOWpSVZDs10JzfCM8EOUtfJ6lR8mRZkQdjUP4vjxzLjwIr4wPDoG9uaoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/TvnadgDZDazqbnpiLm5w50DVYm4XRR3gRfwc4nQhPuPboxPV
	djuwgRiJ4XUZfJW36wXcGZIdP+zYuY8SSjdmhAyY/IyoC0B5jKZ1XeOe6nZqxyVgFdJ1BKHryFm
	0xbNLWL0tJn8n+59v85tac89+wA5qRZqsSEZZ2pPl/S1qqLQTW0v6Mc2mjpimIm6+tds=
X-Gm-Gg: AYBFou0VnBcbX8J/vBDJgqyLgc2rjBcxrdrmaA+a6aMRNczbcUApZnTtQuYnOgkZ0FD
	i8UguoyeH/G8hvDoscnkfHLejNEvsQV1zw6I49AQ0onKGeHgh8YEI56CQLYXPEbjnPUrZq3O9hE
	81kp/dwhPjAQQOiun3eLw3gjL86Sz90wh/aagcSzcSGrGuR0uB8JwW6vNVYSla9rYPOWM5yvtPj
	q2buXKQeztxP9a1gG6eDSyGQjQ70qn8bihw7wcHBO44gDZWBqwcnLF0itsysB9C0y59EVLXfzc/
	VZcpPteoQC0Vitf1dddblv2faBRCjTWWXTiZcm3jsotZHDYg7RjPLbZle/9DS8v6SGDnpUwMBo/
	oYmmOPZ8d30k8BJMPUEQpcw==
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1971177485a.4.1792486536443;
        Tue, 20 Oct 2026 01:55:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f29d66b58mr1971175085a.4.1792486535934;
        Tue, 20 Oct 2026 01:55:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b140fsm5189498a12.9.2026.10.20.01.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:55:34 -0700 (PDT)
Message-ID: <696f7294-8e52-4526-aff5-30ad022654c7@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:55:32 +0200
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
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad72c89 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=CtmeqFu_9xN5vWxN5BkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 96HVK2NbVWnHy_cJGCWKriYAuAXQ2j77
X-Proofpoint-GUID: 96HVK2NbVWnHy_cJGCWKriYAuAXQ2j77
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX7TUR5QR7bDxe
 Vkpd+IsXJirY199HvHeQpFMQfyfdk5GnWtyyI3jkwSFKIL2JlgHZxepFykgNh5HGEh4Hw6tVbP1
 DdemQc7KHhx4BYdgapnjXczJZkrtcB1JdAq/1FVk/QgpBBX0cDdRWAtbJo1XBdpU10B4RTYO//U
 V+4NxiJR32OkF82WzPRknmyhh4PncLKQ2hoB2OBmlspWPSi7vh6QzbeiHWuK7MhGIoMnVbqH3R5
 NXdsG57Z/CneW1i0kg+qsBZzMacPFMrd3Mkw6F7EFuf1A9Gz8wjRuczmmrRvlvLJq69RKaq33Nx
 xD6tNlud2YcqIvZ5CSlZwQ3kMrL/d1qcTzccHa2dFMCfyJcVv5p0scodC5sn5tHS/nOAe4hJOKu
 dq7Y6wfaVjEZZ1hoCpb4aa98g6qI/FISYc89q+Kn9TfkRPwfKt9mak1BeIOXjLwemQUGg+JYAYc
 r59YmUdjVGYTViHgUgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX7DYcovg1DnER
 Sj589ss9Gx18KdGBvnH861umz+iYeY8sPzJLo1pjOyxWNQRo1alRuQaCkZsI9UVidicEFDcmlpA
 e52wAvFP1pQR271VgDg+N21sbMIaPNE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200035

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
