Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B209E48F832
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331868; cv=none; b=MXkkrG70+fREVhC4b3VoNg8HE6dnts+Q8zOOvQdXjvLjB79E/75qN3zUdTxa/eIoBhQfiq/h0ZgLLqDRODyiVe9e/O2dHTCSK6CJoJ6HN1Pq1fgD1berGfdO8Q+3Nc00J8rQ8+Mz459CYMH663u11aRcIbzO4sKEWN9ntxOjKcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331868; c=relaxed/simple;
	bh=//ydaMvuDcE3HJ/Z4qDQc9OC9a2+tOHr0C1rrcwouhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3ApcfzYzhPo76p4R69nV2AjhN9Fzs4whIjDbS/yWQ0c1C4D8a+eZjr6oSmWdR8NPDLDVi5GHczSSl//cxDbRN4h1iNbcuhHErGQcxodurhcZS4KRf63M1V/v1uRQpldhLfzoKFeqscJrZ1MOmYEKRWTbUn3DqGVdhC2Se0KOfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EV2Q77qU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XxUbNWDF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EV2Q77qU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XxUbNWDF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YToU2911652
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GxkbBoFwPDC5kONFYqfHLm2ecZsOlzpQCPq3LAhmLTw=; b=EV2Q77qUK94/KmKi
	NqGEuT/29qQItlpYMJVwpn01J0n0VFcAeDoA7TC50z7Y+kccdrnIAmdYgvEza8KQ
	j4Y6GsDxxSGQsqkwKW8mliB4Y4xDsioOUvi0AOhKiDMB3QhzEQw9oSBd5yHaf6gd
	P++Z7EiEXL6G9rLQZ/T67DPbcRDaSvjxiFuaV8B3AIpmbONfl5KDJJ1i6SfO3lpJ
	rvFrH/5yWxeQOiTDcX16KCQFQaBtntIn5UcseuGzm0DxK9FMEEHHVAa6KshexUlK
	gmEQXsL9TVTN8m//alk69bSKi46Njh0+la5dEEOKfudG7Wbc2UHCzrlvm444haF/
	Eapfqw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm5145q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:24:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1183809eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331866; x=1790936666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GxkbBoFwPDC5kONFYqfHLm2ecZsOlzpQCPq3LAhmLTw=;
        b=XxUbNWDF1roclpaP1J4+27l2Rlc2/ffk9l+k98OZMruUTeLjcUHtASK6fGZVsNcpa4
         NN1Olj3Ihpy8e2PZxKbi3HJLWTgL57aedrGdLSXgKRTt/Cchu5vkdVI1JZXmA17HlnHP
         Z2TuIAckcSbvuLtyQl/KJNr1QYeLqTchqdOUzPVRizV1eCDQTkhmrnIGOr0QyKV9e5ws
         aKTd/N4df15MfDv/79470phjDvREb0QZzUALGMm/eRZn6PWe0jqBT+bhn4hB3I9W8mLl
         qZiKDDy6wQr6sRC6eq0PYcqIsuILeUDQTplyijnmhct19oXukNQ+wIcLvWRChu3d+Q/z
         QEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331866; x=1790936666;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxkbBoFwPDC5kONFYqfHLm2ecZsOlzpQCPq3LAhmLTw=;
        b=ZmA/0nLMvjf7Ee79su3mw+WgKeNW0O5TskCRjVG8YHuxEgvwuxuwoyXGUjIclMEytW
         ZLcFfbpKPhX+KmLGm79Jc3HMYz0Y+FjtT4YUwbFaQjHYoHAV4bmCu2P2xt7vh2mAbfn/
         aq4kml0AJdEErUnyaoJIMeXTInYtk20tT9fjbyD2PEvtGq4h+TA3RiWa4ahnte3km5rJ
         aJ0/7UuYchAWD+6s8IMCwlxBBIuuyW4aAQqsVP5eGPr7vhRgKOptIYRgsizY8vHasZKa
         limfTUkvhqiEWyVPIH4KDlgX1Vkl/Yxuttp1yQ/XDq89VU9QXf6fTUvhVll1AG1kdvp8
         +jYw==
X-Forwarded-Encrypted: i=1; AKwUvBw1rq5pIydLd2WS3/CP/Cyfex8tckH9lInoRzFvTyHOnSUzKD2BBZMyNpL01uaxJXAYpGzzDWn3h4DJqS4=@vger.kernel.org
X-Gm-Message-State: AFuF++mV1nVR6eEXBHmgcPb/Tkp75/xPezrc4OWEF2sU4pHWB/jqft3T
	HOAcFp8SYZG3Eb7c72uq+F8og3C/kI//DRM9NqUmtyyhTR6Es9FYWhcAEwyMb4P+1gZ/X8CE/vc
	fmYzJtok8wCsk06PEzMR7Fd7mxXbVEL9vJwCe9NzdvWbNt5qB9X+KTpCsNUC+Zy1uSzs=
X-Gm-Gg: AYBFou11I8Myz8WaUMxjEvbnXxN5B4VwYlkxIbnmE0qPBbwnd+rr0HmalLXE7kHcg8f
	Hjn7XEcoaKpvLAO4axo53Z+lcSDp7M3m5JAvQcqosOMYgwcxiNq/D5mVPcntToiryQXWcze/SDu
	3tkidYkwqcf1IyZ1OI6X1kajkIZKLUoRUO1Ad/1iCgcZ8rLeqiOGWcuTynoauQ0OAPWqDezpvtb
	8qhutALrApYhdqEwDgZKANYHSxO4d1jXELf9y0eYgMjtk1fZmhGGdStfne3LJXGwmtD6hHuYnRS
	bfArdmYT4nU0sxbu+N2lg6FA5ybWV0ftsN4QOJcLgMNgrkxz4LhNcUYt80h7AUtQQdV+ru3RFUd
	4rEx6TvhzvMmhMVKIcq/MtKwF6tDCWA==
X-Received: by 2002:a05:7022:e80d:b0:143:2719:566d with SMTP id a92af1059eb24-145040d4075mr5212199c88.41.1790331866270;
        Fri, 25 Sep 2026 03:24:26 -0700 (PDT)
X-Received: by 2002:a05:7022:e80d:b0:143:2719:566d with SMTP id a92af1059eb24-145040d4075mr5212136c88.41.1790331864761;
        Fri, 25 Sep 2026 03:24:24 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145aa0cb7bcsm4598842c88.2.2026.09.25.03.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:24:24 -0700 (PDT)
Message-ID: <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:54:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
 <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G4D4rBNV0LunCFY0r0S7FtPXspJQEiEu
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab64bdb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=azjQQSWQslUy6IvBT_cA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX0RsZRX8eTEF5
 4aiBnm3k+Urm1RQtxtgS7rPrBQ+G4EL/aFPnDHlMceVgtM/k8Lzyv7FUTU1LNFt/dIDpHWa2e4L
 2zfttv+/wfG688T5KzkVXCa/Dytyo9RT6yRrtIEuT4r+ekKd6KMrQ4rb29KXIb8lSGr/cQScrEy
 lVMl2YoAi+ribJqg7njd6/DOPlC5GWMzGehQ/9rPV0NB3Nadnh5/8g2xnIpEnQtl0SRneaDGhVd
 oIhMtCnJzOHlZf1czvgayXnL+HzYKUE8yx/Azs0C7NUAt4t7StDKPqCFdnb8WBt+Q/UAP0txwH/
 x/EwnhodGhBzX6hbZtk74jwOqvbmdCKQoTORs4yuLZWCwHftb8nehHsOGSCVTAaTfE+bxN6WwC8
 WS0FDXyLce40iX+0018FczCcZRv/3FKvhqkMItJUn1SPByKWgALKENSchhHfmQsOM+SOUl3Li0x
 ypFqf30zOjEqUZGfUMw==
X-Proofpoint-ORIG-GUID: G4D4rBNV0LunCFY0r0S7FtPXspJQEiEu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX0E2g0qlosrRd
 WWA5HrShDLZ+kqDb+Ya+9LyukwZEBn1YOTc8aJTj2IOX8M6M286d0U/rg0h7um+6yxcD5zTLlhT
 UUWko2QN+Hxkm74VhrvCnayZnnWs6+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250041



On 9/25/2026 3:13 PM, Abel Vesa wrote:
> On 26-09-24 19:52:32, Gaurav Kohli wrote:
>> Shikra firmware handles CPU thermal mitigation up to 117 C, while
>> Linux CPU critical trips trigger at 115 C. This can shut the system
>> down before firmware reaches the end of its mitigation range.
>>
>> Drop the critical trips from the CPU thermal zones and leave the hot
>> trips, non-CPU critical trips and GPUSS passive cooling map unchanged.
> 
> I thought that was the whole point of having the critical trips set to
> 115 C, so that the kernel can gracefully shut down before firmware cuts
> it off.
> 
> What happens if CPU gets to 117 C and the critical trips are removed?
> How will firmware thermal mitigation handle it?

Thanks Abel for review.

For the CPU thermal zones on this SoC, hardware-side mitigation is 
already available at 115 C and 117 C, and hardware shutdown is at 120 C. 
Because of that, a Linux critical trip at 115 C is not very useful. It 
overlaps with the hardware mitigation range and can trigger shutdown 
before the firmware thermal sequence has completed.

So the CPU critical trips are removed and the firmware/hardware 
mitigation is left to handle those thresholds as critical is not helping 
here.

