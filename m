Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4445D371D02
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946217; cv=none; b=ZcHMDJ9wMCySKCQ3VTGq6cHXte1Y+EZxcZkWifsnC+F3GW++qw4iwqT3KjRXXysgIY1ZN+IrmiWWnUrRKfmnCVhFTpZCKFovot8xD4mpWO5oeJ2Q6gb8atEIMMoXruWNYRiMoSQe4mqKsiH/Df79SpB1vNqPH3s77nNFdYxhXJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946217; c=relaxed/simple;
	bh=b+ZrbszRlr9tKDb3C0bvlN7LI2Y6k08QRyYRWjJKahE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ME5QWRWUMti7S0bSz2utYOlLZc6PXyz8GJCdhvlzQRPYfwHGL24egRiH6BLbaosLcvXkTyBxzbBfTOEPR9/1/40gYtpTerEZ8mOhygI+gzZqS0vQBkJm/HvpOzbmrZUGSZRsnOmIpbr2tYtbzo/hEzZFusnY4wYpTyQR8i77UNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGX981xa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6xijXdB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGX981xa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6xijXdB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nYXq557443
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 13:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6z5IuxgZF+4qKvUvtMUrTZperd+qzTCulZgwTnrNmnI=; b=eGX981xa8ZqWDeFI
	gQfPrPzvO4ore6ZoNNVAKhkn5z+eMUGja22OrluJxt+SmqOP9Ha+Z7Z3ytgOW33j
	9x9xe83J7RKEBh3PpVoo3b/zeg6WL17WhVrZ8daJ2ZxenwvzASAxb3uqqijdVj5+
	LQM63y6IpdH+aOSV1UuF7dlKCTvGOlwRYVeAdc3jEGr2VYO3hDyCy9ck6OncZxd0
	mowN20rep8hkGWmAWZ1LhP+pgjgzkpyVwNU1oDjpV2BdeuCyhXSNokvX5NEQh7Hn
	n5a9XEz3uzUskjczJcMDXLcnqnu6YumVO2LrFyt5vMbrRSrxsmTZRlst9gij7PH4
	AujSSg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbgc1x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:03:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4a053dcadso4184420a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946211; x=1791551011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6z5IuxgZF+4qKvUvtMUrTZperd+qzTCulZgwTnrNmnI=;
        b=B6xijXdBDYHPyBOWlUF2F6/D1VRgxkv53VXJjE0WgBhrcRhT4MbvPP8dK2ThwVA1X2
         /ccLsb7ImvysgydidQQeXEdLKFf4P7FZ3SEzkWROYn8kfdr5fQRUSnSgc0qJmxHbyDVZ
         CqsFjDyJOKDqMaJ+KIuKkD34B77z+OMJ8PMuSf3rEGBAvuS9++g91S2gFZVKechv/45/
         EPOlDkOpEsc97qtpjgFflJTGmrP2v8gHfDV2nPd+D7I5R4CGD53NORcODpBdG7a3rVrH
         7H853HhCT+ujStF0j15Dz4eqjiWUrGE4CXLsZqNTP61nN6S89gsjL7Qvbx2JH9D/Sn+R
         jasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946211; x=1791551011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6z5IuxgZF+4qKvUvtMUrTZperd+qzTCulZgwTnrNmnI=;
        b=VubTeX+RSLnp6GMCP41lMEJ+iiJ1EoaDd9pzLQzN0LlntQSKBE8ZSO5cDO7MJR/k5a
         hk0j2F5vq9Qc19Fh12Wqpq2V/yfTMgnTCIGtKRcHgGI+WgP7VIeWQwa84SxlqG8K1lPP
         oqwzy2wXcQutooboW0AjWer6ruL+xPceEB30gHpqr2wxMAZG749JupETdGRuNM2L8OXp
         8QxzcL6Qvixi7HgZdkRApZZBqCXgWAB97i/AEREmtY6KLfTxw8Cij3K6Sq7dhjVhLBIL
         RFDbiVcwiry37/Ku4ZkTxFUzY+4VqreElflJj6NTna3TJlYPMmCDHsvZr3Wf4tPNiHac
         mh+A==
X-Forwarded-Encrypted: i=1; AKwUvBwuInrMrPmLT6La1Ao8MsXrqOVReEdFCpJo+i8zH48WEBAuGB+s/dDpB47zllsNtXb5EPzoT0NvE0d6lLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIt5q92JDHc7eZuFJnnUkez3TydV/K0xeqpPwciJZPKTKHaqntu
	Q8gOgrM8sciej9/SkQ80g63cKhG2WVJY+AtczVcY3ZeHCTkDSdkGxfIifGazD0VoTzVzZPcWcLU
	bRSZ16ZpVlUxw2Xg72U1JZp1T1OZQJYFnjxbsHd5w/zq3sAIlsyvlAH6oAGQ/L8YHNow=
X-Gm-Gg: AYBFou2xCILl9LqxXH8gSmxXeu+Ehm6FchdC2CRD6W5/AhXiEJZFG5JK6h3ebh4G2XN
	AusFc8kQ/aDIV2vVjAMGV0qX2YulthjF7xbh+S8jmz85lL2lY5+W69qNqhuapKDkfxZwtBzz73R
	kVmIbQ3h44V4y7Qp3kT1pi3Q5qZkx1boLAyYP2/n7gncXj9zm07YjfPhRkXGsgGpt21rKyOvlXm
	yF47ambIM5WT/76mRBvIw97efr0W4A2q8GorDvhXo1CZzTCm6YVX3SHDyf4cNfGxO+9JQecNsnT
	Ep/kNj2Fg2ukfoMHh7pESnmgQrmh3L8H1nL81Jyxiix/Kq6Vyi7ZZR0KzqMMrBECtxFR+b7qVIT
	DmRMMoVkcC9T0YmBGzPHkde7IifAMNg7bs8eZTIGS7Rs=
X-Received: by 2002:a17:90b:58c5:b0:39e:6c6a:657f with SMTP id 98e67ed59e1d1-3a6ceec796bmr2429031a91.66.1790946210458;
        Fri, 02 Oct 2026 06:03:30 -0700 (PDT)
X-Received: by 2002:a17:90b:58c5:b0:39e:6c6a:657f with SMTP id 98e67ed59e1d1-3a6ceec796bmr2428878a91.66.1790946208517;
        Fri, 02 Oct 2026 06:03:28 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.87.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd3962f0sm1302687a91.3.2026.10.02.06.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 06:03:27 -0700 (PDT)
Message-ID: <9d024cf5-1a5f-4cdb-9ebb-1c3d7c6eb049@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 18:33:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: sram: Document IMEM found in Qualcomm's
 IPQ9574 and IPQ5332
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
 <20261001-imem_restart_reason-v1-1-79f516906010@oss.qualcomm.com>
 <20261002-expensive-boisterous-nyala-4d8bad@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20261002-expensive-boisterous-nyala-4d8bad@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX5K2bK89Fmimi
 d0+LnAJnJKiLU7l1hCAwClDCiOPz7fdwWYD2fZjRe7a/UAj8kBAF63XbvsBt/ZS4bN9Q3ft9iyw
 Pe7lXibym8jYQL8+77lAIU6BXP4x8lc=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abfaba3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=h//ISAYwLoXuQW9fHTCWYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PDAiVhL2AEIrZ4fXd3IA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX398rXEAUUjKc
 knOl+5bSLj5qpzD/bTaH3vVcwvArX2p2PjASb5bu+yU7NOk3SKNojr4bRqB6fFN2MK3D0hcgH9a
 xtjwSGCsIcirlEBQElHeS2hGiZB39ehzgdhUAmZ9y3fggoCugPjPIkvyhJWgQWJr/kz8M3ikheW
 SUHjLZWBjwJV8odEBxupzJ65h7co7jj3oFzOrk1IgyorAEqR8ILXIFjDc4DvIkN7M7G/4oxy78m
 kCuC54oqqmKpyLH640srXzqAhr0fQxDc0Unrb/n2KiGpKrRAo229Y4dF2ZcyanEr/oKYkXPldWO
 bVN0u29nlgoHeLcMMMBUQRbXLsROjCIulmyoIemT+nl4Zx0sMEXYDdHhs7zjwAHRm1mhlyIC/XD
 2KgP2IY84QcIL9R0hyX+gNbYLnI5JY6OUQQQXn//UDk1lBzhNGPDbLUh4960T7YniNHrdk32M2A
 HYmqhoJx2CKxYKH1s8g==
X-Proofpoint-ORIG-GUID: ZDv-41YB0Tpk1kZeOBMIC7GYMAA-T8IQ
X-Proofpoint-GUID: ZDv-41YB0Tpk1kZeOBMIC7GYMAA-T8IQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020051


On 10/2/2026 3:11 PM, Krzysztof Kozlowski wrote:
> On Thu, Oct 01, 2026 at 08:41:11PM +0530, Kathiravan Thirumoorthy wrote:
>> Document the compatibles for the IMEM found in the Qualcomm's IPQ9574
>> and IPQ5332 SoCs.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
>> index 6ee0b1464722..d65696885e6a 100644
>> --- a/Documentation/devicetree/bindings/sram/sram.yaml
>> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
>> @@ -37,6 +37,8 @@ properties:
>>           - qcom,eliza-imem
>>           - qcom,glymur-imem
>>           - qcom,hawi-imem
>> +        - qcom,ipq9574-imem
> Why reversed order?

My bad! Fixed it in v2.

>
>> +        - qcom,ipq5332-imem
> Best regards,
> Krzysztof
>
