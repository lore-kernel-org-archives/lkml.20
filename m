Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CFB4446E6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022671; cv=none; b=kTnW4+4I4VcCoILhuKRCymdBwzElIFiGhgfbxQMN3eOKSbsqUcui0kq6xyDUpiIDvReHVd8y9/tWuuYQCMqULvAShCSVgZCZc7B/8CpnxearH4IuAYmLTcjJD9t2idYiLVIGVCYbYBqvJAMRxhYdLVEpxQSwzQqOmUDilG4wIjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022671; c=relaxed/simple;
	bh=KYrFug4HjS2poolGnWNstx6F6UlgofBOdMPNGHbVId4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XiGQxETm7sDB4+ziX6bfFXiwIaXLlRqIkgQpGpIxGRY4TOA3OssVs7ETcKhzro9+ifBTFmi6MXqKtO/yCN/n9llnFU6xfDny47RHvoOXG8e3FkIZj+UPlV615TbQV0V8X4kfgn3o4YPK99pd2d/fnj+n33RlPrKDQYbe5H3+Ons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLssMX+f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+U4xsVZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLssMX+f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+U4xsVZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAaUb2163509
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/CXT2/U+CRIw/4TV1GykFykopBE/d4y1YwwzQgX0jw=; b=BLssMX+fya6Qb+r2
	qOR3FAbpv7hF1J5bOOV/WTEfUk0LBwwTMDDx9/nqyimDBSP/HMMuTjLuSMCeatIJ
	UNv3mNnYhH42bSOTGv9fMjtzrH3S5NtdRViKSA+UK6Vrh4ibTypEgmKSlL/svvAN
	6eiZ4G9dJ9WgUA+1UJODKrqqpZhxDhRXaJsVDKGerLa3ocxPqING4NT9C3CZwo/f
	qfew/EkyV7OjhOr30gpRwISh2LW4ZkaLD/Amnebr869azBQcyVFePydiWzjYHXB0
	TvCZZ319C04oPRM9szIHcNf+E418RXOdF7Wkxe2ohWb56T84+GYrv6HHMbeR+oO2
	cd5zSQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw38xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:31:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc489e7a701so4981136a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790022668; x=1790627468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/CXT2/U+CRIw/4TV1GykFykopBE/d4y1YwwzQgX0jw=;
        b=A+U4xsVZudzzycwvUUV64Ihr0tc3gqegeTR2AsTzYB3WfdiIawyojywZSOafQFvqTU
         vbaEWoFVvY8/cwLEVqut+B0/8VrsDg7VXL+FBwx40fJmJeXmiQGKg4GOjgmHm4OoAR+g
         KR96rPq6cv9AKW7HiYsEBHe+vhc4wTbhkjFI6gzMbUKxrvI/yGRUdwDSE5IS3H7t/IHs
         Iwpd4SXDtYZ/ai0g8telzbulk926K3B6743VE8FchP9+cjqJxQk5x7GsU+ZAhFWL9252
         KTXy6FEm7wIkinynLhJiTbael/TPEbkW0h3NzPsAq3G5UFndVniNoTLqqzeCXfVhKW7q
         blKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022668; x=1790627468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/CXT2/U+CRIw/4TV1GykFykopBE/d4y1YwwzQgX0jw=;
        b=PrfAIv45ksMaBmk4gKsH8GYcq3LzgsEvqJGYoqjxxTx8JejE7z8nVAHlcFGoiJZ1ux
         K8i3sInZLlsmXuN+LvAsE7Fq17MCMp6FbKPMl2HftQVbNJHrmOGpwlsC1he4w+WTqfi7
         Uh07QnffCi3Qa5wnDWsCQdpzUJukoYVrFxQr7MudKUrtP+fmqjf+uTbXIVHSQYmao6+k
         z1q97Zi9FaYQ049lvcnep+G/rAKYxZDtE4lrXIacbrMjtTSEAgXRStzPUuZCJvAwI+6O
         uM+0NbEr9Evtmw/kdhIP7cZK0+oRK79h5V18zy7wz2GgesYwcBnxg2wc0M0yyfXHGGBb
         Z6Cg==
X-Forwarded-Encrypted: i=1; AKwUvBzSsKjNlr+fTPifS6g/uDeexTyiMqFyqgqnZlQuRRZ0RfQnPs+IFOT9CaQAWO9ftQQhhZLV3f1OHHXYj74=@vger.kernel.org
X-Gm-Message-State: AFuF++kkOs6dW5+BkBw0d94pFK6Zy1CkZwrcUL0GxifvMwUaMZRn8xTA
	4rn2B7UOz0IUqoovxOuqIBN9JnykNGo9Kc5ffICs38ZKA+usy1R/G98fyqGwAsDWb1sWTqZfmxa
	gvAHsTx9ttJCdy2Ga9QlkC8kjE9gB6xay7ZUd4HHeUZyt+TZ2ml1bNAJqB2Zqks+6mjk=
X-Gm-Gg: AYBFou1wGImModvMN6J+sjORka094goicEWH0ttlTfk0bUHQSymlVmeZhLZqmvPKd85
	XsuslGRXAFxIGLCz8IpAwYP09Td/2+Z8RCK+DxElglxjGKkTReHa+fbmMZZdQekMWH0a8NalLgQ
	xIYDJWtyqmS7+0QZ3RlEn4HeJ6Te3m2yPwqj+uBHORf8jZ+oFTAF92GHUFanFHKBg0likIFV326
	ZHFQXX5smlkMKMr8D0LOmnZOLcjDBGB9Oc08Ze5sy7zqTlcYwKPPW25+LDwvTlBNA2kxgPgCg6y
	SgHSQRogCWB9KiDpiUe2wOCNTmAXAxuxV1+ymHvlWiU4IXiL+wInpeprdrw6ujKX0RdBkFWItfF
	dYvQs3PpVx2kBB/GSHDRpwuD9JgjyujqnIg==
X-Received: by 2002:a05:6300:4049:b0:3da:c10c:6aa6 with SMTP id adf61e73a8af0-3dd8c2dc837mr20393382637.1.1790022667460;
        Mon, 21 Sep 2026 13:31:07 -0700 (PDT)
X-Received: by 2002:a05:6300:4049:b0:3da:c10c:6aa6 with SMTP id adf61e73a8af0-3dd8c2dc837mr20393344637.1.1790022667022;
        Mon, 21 Sep 2026 13:31:07 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f0c96f8bsm172225c88.11.2026.09.21.13.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:31:06 -0700 (PDT)
Message-ID: <ea53d79c-4aa9-4e98-b829-cdf6f43cab66@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 02:01:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, alexandre.belloni@bootlin.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Frank.Li@nxp.com,
        wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
 <0f77f41d-589f-48da-a013-48f48f1dbbff@kernel.org>
 <b7d120c8-1215-4923-8810-83cc0d7cdc36@quicinc.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <b7d120c8-1215-4923-8810-83cc0d7cdc36@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMwMCBTYWx0ZWRfX7PIC/xESJRFG
 rX+M8Zcsqzws7rVI9e63Gt3PdS0vkLrcQoOVHUthHv9PfyqtC0t1mwssyj4NoqFjz3a5X7cE1rp
 kcjjazMAd1PF2k1Nbl4nTxx007aWA5pn15umsRapWiUjPH8JGORMl6yG/ngUeDkSNA8KBQDBnP2
 lIocaT4pL8ykTt0/fLhMDiz/g1od4L6kGFVvrFZxQknCaFve/l8o/IbP6Rf6dGfbscElevT/+ML
 ee3I37n2SsK6OUqPfaQ0QePiEyrQInJUmHfMeTiJJ1T1Widx6HJYOhnIOmontQJSIYGZqdFoYeH
 tUMtkn96chNqZspumXkpBSMbYV1E1/+w4T3YpqOypbfX0gfNvmuepthjO0//Hh/RNxKJadgLy9p
 w5WdB+ITQWjHJ3zG6OVoJU39ZGPB24PH3GlCMa2+SXdPfWsEleRDO31pasd4Mgj4eiQLQ9L3mcD
 yKPYogODrN4OfLa8Vgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMwMCBTYWx0ZWRfX4nOfSgf9rd3T
 h8BdlN/Ja5YpvzYOVFThqwMKQwwsopbChup91ZHFpJIbGPA/1lq9svw2XCjDMTeBrgxZ+mX8KN+
 nPZ4GKULMrEErSUvyFe+YRnQyyhVsNY=
X-Proofpoint-ORIG-GUID: ddzVk1hEdEtXa467CxSKl1RP11wktzAg
X-Proofpoint-GUID: ddzVk1hEdEtXa467CxSKl1RP11wktzAg
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab1940c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=jzypiudHYq9u_h9wWJAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210300

Hi Krzysztof , Apologies for the delayed response. I was waiting to 
verify the changes and ensure all the suggested updates were properly 
incorporated. The effort was further delayed due to some slave-side 
setup issues.

Since, I migrated from my @quicinc.com email address to 
@oss.qualcomm.com and could not locate the original email thread. The 
replies below are from a draft I had saved earlier.

I have now addressed and validated all the suggested changes except one, 
which I have responded to separately below.  I shall upload V7 cleanly soon.
> On 7/1/2025 2:03 PM, Krzysztof Kozlowski wrote:
>> On 01/07/2025 09:18, Mukesh Kumar Savaliya wrote:
>>> Add device tree bindings for the Qualcomm I3C controller. This includes
>>> the necessary documentation and properties required to describe the
>>> hardware in the device tree.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>>   .../bindings/i3c/qcom,geni-i3c.yaml           | 59 +++++++++++++++++++
>>>   1 file changed, 59 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni- 
>>> i3c.yaml
>>>
>>
>> It's v6, you really should have started testing your changes by that
>> time. :/
>>

yes, clock-names - Got added by mistake while uploading, will remove it
in next patch. Will run both dtbs_check and dt_binding_check before next 
  patch.


>> Nothing in the changelog explains the change made here, so you just
>> sneaked something which did not work.
>>

I didn't made any change into this binding file. I would have added in
change log V5 to V6 if there was any change in this yaml file.

If you find anything else getting added, except "clock-names", please
let me know.

> 
>> Best regards,
>> Krzysztof
>>
> 

