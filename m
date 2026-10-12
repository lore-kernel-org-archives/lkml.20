Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826BD48EC91
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819247; cv=none; b=jVaHCXCOBvfOyUa42DC0OsM18AAWRZH8/7tE9tmJAicwFMlIc4i/Mf9AsUCHR4y8E3yksfSTub8G30khHnF0wjOsWqxT5zQhqSHjGpqc2sdsmyeAhfcbkTShJPJyf+rQutnkZCBXQbDr/sLLRROVphXQPFZ0ne7s+5MWLwSRpR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819247; c=relaxed/simple;
	bh=8dASgvAeQFXZ8Qm5V+syp94x7IID/FvtG2KApiz5+hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdFxwR6BWkliOCOcZBo5NPQ5KiwWxLkYfCIasqcpot+AGWt2MRS7f+c7qtgWClpR0sxCmO0+3nRJSged+9TxO2WlxDLlYAbtjZIF28jIr2XgnmMoQ3C44PGNEFJ24ZXuC6gf8d3FmNdsQQaDtCkVzIodAok1D72Y+G9vxMZkrKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFvzY9+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E8MLomp4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFvzY9+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E8MLomp4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0BXo2275910
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHtdP5oSiwaDYUou6J6EML2gAJdq+QdIsaozFMsLVRs=; b=KFvzY9+HNJ3V9Usb
	x6KdEDB9a5K1rCPv5xS+tAR47nsIJBRMEXMrgustFMXsqOoLP6DOq00Wbt7obKUe
	4fEZGcCGwFKVCyYQk9DW0Dyl95Jg7U31Dnhqzgw03diIk5mKx0kg3LqqGO73BlRP
	iQErrB+EkgLTzmiAXLqTFCVIdwM7+w1TlQ/DLLg8UnhsqwBhOIHbN6W/5sDZAr2v
	U5oL7OsthCre+oT8wk7RN5N7jUmpin+wLiH773FL47lt2bQerxXD75wG537YZ0KV
	MYdyPSiMj+g1NiQbATwQyoh515nj9nQf5oygf4LtutnA+FS3KrHTt48g4gtnBlqN
	fNOcyQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq2316-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:34:05 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so8472527c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819245; x=1792424045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHtdP5oSiwaDYUou6J6EML2gAJdq+QdIsaozFMsLVRs=;
        b=E8MLomp4QwYimgS/PiHc1XU0CD0KNOrc03YlTH3vYdHYuzuj4uGFBpabbPdMxYiuE/
         qByJ/jtydpTkx61UpPG1gT31kLdEXfECGvy8IUe/IfKbtGLT3fBrQ6l7ErttGM++Bklc
         yxWT9c75Laf/NjLfw/mMD+Hq5Lyu2d9UxDbK5Zu78uDQJ/Oao2RbOk2GtatHVdon0h1A
         SNlMIhYetjWFOiBW5aMddf9CHCivDSNC9DMXECtJGnDZjLIkm//jTXvZQMEYF4YMPAsr
         75w34BCniLDkZXc7vFL9yD5bwQKqkRrHe0B1wOiq6d4B1xROKLZzLUbK7YMcMaKVhZTH
         xtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819245; x=1792424045;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHtdP5oSiwaDYUou6J6EML2gAJdq+QdIsaozFMsLVRs=;
        b=Fl5cjhN2HPxkZS3EEJ2gqwi2kGXr3IH5weiScRo8ZJpz/daK73Y7E1kiZYqXiiJUpn
         ZaF02y/2RYAt7ZWt9B87FfP3QdTsXJA5K63wVHdIhxAXR1RC/8iFO6zCb4ZFyP1fOiTn
         LzbUH3IKvZoxfmLP12shtUqfEXHw21ENTTYmYeINh9Q+s8+Itl0QxGb9c6zPvj1wgOIm
         clIPBQmUx3S+pkS//CuksukKFenYTNYGCkgUiwN4uBucAT/OFUzGT80esUdKrAXmoM7C
         BDl3548In74sJTCiuqKMDz2TrWA/dLbmLBoTOXBIkJY9H0fOnlhjX9cxgRx/9ncqfqti
         1xHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRRF8PUf8i3E1on2FQpjxduG6T6tOrK4Z/nfXG0Y9yof5v849mQx/CpNKSdeOuL0G6E8mKGFMjG3e4Fjk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH+UQ1STl9BWHUncTPaRIaLIuDwU7ruR8pHKQwYKvejRyVX7rv
	7nQZSGd6ZUsGOfN16Dn6fV8xJUY65A3z+p/BURDJaDnYKSDQpF2tN9kf8InMd9BL3JUFlBGq6qU
	jh5LIRH7w1GQRzD1Jb6B975yVaYlFK68hiLiGwXJJlE551J8aiDXtOKxIDZMTlJGlV2Y=
X-Gm-Gg: AYBFou3lVCk8pi6kIBwzvED5Kjtn2jfhVpoD96ISGtGLmzCGVLjTANiboI+LJD6ERRV
	Wyv4k6NnpueOlk28LNUp1vg757bQPN09VvANl38VPuySRgzzKH2qri7HRPEqUINj3oqq0ugljWF
	eGw1CgaT3h8EkjFEhvHWb++ctWbUJnSH0FISJkaTVeKUMAqEsHOC2XPsAH1M/PueBvlZyFADxpC
	77G77UymeNfwXGunH/AqBFAIG0ZZhjYDSHxEipvkbCHVEtYkDSkhn3XM0PIhXdD+932qFY9hyaA
	zfmGQVyoej0rf9lLgPJ+P6mxWdqQ4GGgJTCio1TPk3Yn08fOUFRm1rxt7sCPqEPIRWLkgFceb8N
	cY07NMPcBq9oGjhRCHnuxxQ==
X-Received: by 2002:a05:7022:b0d4:b0:161:3942:c07f with SMTP id a92af1059eb24-16a660d44f5mr15641062c88.47.1791819245168;
        Mon, 12 Oct 2026 08:34:05 -0700 (PDT)
X-Received: by 2002:a05:7022:b0d4:b0:161:3942:c07f with SMTP id a92af1059eb24-16a660d44f5mr15640998c88.47.1791819244510;
        Mon, 12 Oct 2026 08:34:04 -0700 (PDT)
Received: from [192.168.1.8] ([171.76.83.200])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a620bdafsm40540655c88.23.2026.10.12.08.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:34:03 -0700 (PDT)
Message-ID: <c50aac72-edca-4690-84bc-abe7ade91212@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 21:03:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS coredump
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
 <20261009-oob-support-glymur-v1-4-96cc8ffcced3@oss.qualcomm.com>
 <20261012-burrowing-tarsier-of-serenity-3bd5da@quoll>
 <bc6440b9-0226-47ae-9e33-594ab6b92004@oss.qualcomm.com>
 <7759e73f-58ab-4a9f-b3ad-2e8a42abc843@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <7759e73f-58ab-4a9f-b3ad-2e8a42abc843@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accfded cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=xT2OdWCu7OPer0wVDpA37Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WhK8QHrt5qDQpnd42zEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX6hY218XHnrmR
 Lfs2j14jXvaip8jAUymwntKNTc2hu5bMipw9KtbesLYDwqTRcuNC33zFnIP8z6rXK6mJlKsoJYs
 cIcLnUdX/IEn6wZ6oVz0dhBln5uB6yQ=
X-Proofpoint-GUID: 8h3n6xKIp_7aEsk_UQycoVV_zOuNd0-M
X-Proofpoint-ORIG-GUID: 8h3n6xKIp_7aEsk_UQycoVV_zOuNd0-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX27ArVpdUg/IP
 AZ296rH9rfID6SUq59KN9pTb49zqVDlwL8NDbE/2qxhojIKxBXT9BidJYHwcyQCeNcLwpqEF8js
 V3830jOnoACIjRvO/z99GbtHl2pUFzzGCdMuojfkgTUmm3Wi1E5KiKLh5OGxAf8SBUiWf7QaxZi
 8sZXDgeXvpZoA0h7x6yNS/88YLUvKdL6bxzbNWb0ILeki4BasAue0QYNT0kbcrzsLzxCWq1sMiu
 WMXdCDoDyINCyShu33iQ6lwRrYXhI2Sk1AYxyTeqOhD0s3Trj+y93P/ObfHREmHA69CAhCbTi/Y
 MmQV8+NUeFLQFixT/FjCVXmDfmsou0YdoSv71W5G44PsuXOcK6rRwa7V4QhJ16QPl/deZ3GYYY9
 CpQEEjNURE8YjEXOzp/dTHCf4K8s6iPI24Uf5WFRNa287IYNYjX7QsfHI3nJ+HUQmDmsTHQSfLL
 vRCw8gZZaDUvf2izKNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061



On 10/12/2026 3:58 PM, Krzysztof Kozlowski wrote:
> On 12/10/2026 11:50, Anvesh Jain P wrote:
>>
>>
>> On 10/12/2026 2:26 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Oct 09, 2026 at 12:47:42PM +0530, Anvesh Jain P wrote:
>>>> Add coredump support for the secure and non-secure OOBMSS carveouts.
>>>> Register fixed dump segments at probe time for attached-state recovery.
>>>>
>>>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>>> ---
>>>>  drivers/remoteproc/qcom_q6v5_pas.c | 85 ++++++++++++++++++++++++++++++++++----
>>>>  1 file changed, 77 insertions(+), 8 deletions(-)
>>>
>>> Why is this separate from Glymur support? How is your device suppose to
>>> work without this patch?
>>>
>>> Best regards,
>>> Krzysztof
>>
>> This patch is diagnostic-only and is not required for OOBMSS boot or SSR
>> recovery; without it, the device works but no OOB coredump is collected.
>>
>> I kept it separate to isolate the optional coredump support. I will make
>> the subject and description generic for coredump support on PAS
>> subsystems with secondary processors, rather than limiting it to
>> Glymur/OOBMSS.
>>
> 
> Commit msg probably should mention that "recovery" is here for
> debugging, not proper device operation. Otherwise single commit, if
> moderately small, is usually bringing entire support for a device.
> 
> Best regards,
> Krzysztof

sure, I will update commit message accordingly.

-- 
Best Regards,
Anvesh

