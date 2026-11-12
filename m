Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476024;
	b=oQKSQcn1TfuLaPSZCoAokDZ4U4L+5VTFbHHEOHl4nGzLTomcImcU6Sfg15X7+1AuFQVN
	 lTirywsG/WN7nidh9bp1KzGSf7jY2wJxi4kNUw0yjwOzq6Jazbk0CM7XzhRbY+mcBQTnC
	 jcCJ1Jfm5UwBhnWDKC6nrK2FK6O6S6738hxyn+kF7yfblkgmYU96FFOGYzudlU0S2iiQz
	 gT4aQDWuJb/6uPj9CypTVAYGro0yI54QSW5nanzr79l4iYU9w7P/3piJvbLqGP3G/SQZ0
	 ESX4zsw2Gd4ND+kwaUrMv5WR7/JjwpZXN/S/k+MDVcIJXkn7/FI84ud7T+ksGIqgUIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476024;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iCHXDwClae4oFDnyJoawnDwBwVWh3VIIZGhH+xwjJ3k=;
	b=JTxrL9ENXSp9zXXoyWFezi7KXNu8LxIHL52rmQdf5qhG8SRm/nfOtpqQaRiBms5Hhrdp
	 60vS09U8SOHpR01kpbQ3hCX5SBXSiqZ7oFLxXL6G5qXGdGmpSzE4B7KyPJ6ffgWNU19bu
	 HIGSVdft130JHqMr2pziqHKDykc42qRvI3axyRcsVNmhYUzWIz12H9OVfv1hY0BDYHlEn
	 IMpbfmdpgHF/P3Rm0oAWoc6VdAShfmejXzYMxuxy2Mm+5U7lrIiUx6szG59ARSdCjkxHA
	 P4sXoXWJxOYzYFm0jUZUY3hQabchveU1LPuhrFrmLJvVLR1wH79aFg5WSO1cReoDOcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=osA+UM6B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZuxsT+7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2AE606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D2AE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=osA+UM6B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZuxsT+7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9E2pY480282
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iCHXDwClae4oFDnyJoawnDwBwVWh3VIIZGhH+xwjJ3k=; b=osA+UM6BNguP8NUv
	I8hEASmlG4AHeys1KN0uBPHtIozTyZ4v6JhfNz8j7En4XqgiHU4VCoAhMUOFZBhp
	k2JfaVlJESvYgibKklGA+m7Gp5WYx852Nw765KdYrL/Id34tRM6ksKmXfvcqdN1p
	ZOOH86s8+ATr7Jwdos+9GXpABc7Y2iSI6TP77iJ6UCHmAVR/rIjKAuxYHNllre+T
	XVbSGAvwyoWC9WQb5v6wY5rUcbZ7j5QOuBnOkuN8CtROK7DcYyL7x3TalUK5l2AT
	taof6C9zPMOWcHiEJPkM9U4fsLDc9DwYp+Wq9Hlc6JejTHNg64ow7e2DE9pEcD0Y
	Tlg54w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4r27t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:33:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so4911091b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794476022; x=1795080822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCHXDwClae4oFDnyJoawnDwBwVWh3VIIZGhH+xwjJ3k=;
        b=VZuxsT+7DlIg/eOFppBPWMKG9i6N1yJmr3iIjOvI9tdxl+bVMI18ay3EHiD2y4HXAU
         cnT5yPH1Xq4dU98CVB/62oN9ASIxz3cyKiz7AeggxYDZmQfEDyjBQ3mzQoZg+RkwyvZO
         3e6FgpUKgRHTYsO+UoDck8mu4vsePzOtN70joXsOmHq8bVNya5HU2AWXuZs1IIRRXw00
         m8rSHrODCSqJjRAasGklsry7wtgsK80pQ1WF9DSSUOBPkSBRvnJKmK/8SshXxWJuJMeA
         LxoWe/1HhxbmU0ZxsmhDPaTfSC/cXpW88cKWCjQE2xTte1Ax4HUUNgUGqP5rWE+hEXzb
         KRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476022; x=1795080822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCHXDwClae4oFDnyJoawnDwBwVWh3VIIZGhH+xwjJ3k=;
        b=JAKT5hbQzDw9Xp3Eb0j4yH7xe9YP1ctIrUpM9w6d2kCekB+E3C/4HnY6QHvp2hl/gv
         p/Mydi8bQkIxW+CNbY3OFqoCkVwIZfl8hOn4RAsRG4Cao57C5Zl/PtMp1K93o1v1vxQn
         2pkuzxkpbbdMwudTp+wgAaq0/Iq13dky1MKVc7L7+7bAVBFDUlE+tXSK2tyTj3x8noJx
         NVhULxRceE9X0eYp+T4P31sZFr5O0bmLeKggEnn2pncvAGFZaPbIEGV8and4ovPSrEAE
         dAttzmpwcHpHvMAqFs1TiG8Gz3ttgsV82ceQJLIU4zMpKnZmQvgPSRpJZlHVKv+872GU
         rYQw==
X-Forwarded-Encrypted: i=1; AL+hErEnj1aPgRBP00HthXdPG3KjM6sXy2vHiqONSx6ECx1R7q0pZDzgIhyihKSGgSyIVDf8Qp4hXLbyDmNY1lA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nSuj6nJiKNGlYf8W5Rt/Ljb72yUKAVgA8pd1Or4eiVlTPKsV8
	TMbxJQn0DXdXSv6T0pykjOnNuQvieGAV6m0Sv6z8eYxtK+3lSO9CNcFEVqhBWcXBLR6DCFGhEfV
	dEOOueXzxJUDV/qGxoFlOU8V7wtXFjDejuSAJ5yMDOdFQCqxhkqcRRbn/n2gdi84w6NM=
X-Gm-Gg: AYBFou2fq1Ixg8MIk43Lhdf7XoS3GjyIPOhQ26XAeb8EA1R6knz3TzWw/hndSHRGhWV
	EqAIig/9B/E4a6GpTBZV7k+JfWCJhd6z2r3OGMwWjjllodb2TesHx+9xTd/Hwppkj/HtVloPlGt
	0GUOONGG60JcOa658a3y7A+SKbIEJn90+vUmnlbQATMMqRPaww4VNspQEbv6TysoVQ/ncWdTPMC
	+mJppvNRlLB59Bs/a+yHFFMbJRgmrwKhpNmL5Oj/STSB0BIHCYOrHSX5L5ttXirZRfwOieJhq5Y
	RFzpt2i7YW+t1ftJjHFlQULL7jJsw+m/a0HBK/qG6dNyrkKgP8M8FKdqXWP8ZMe+Xc8DJDg8+b1
	lQsSfVrbiXgG/xAPPBl/f6jkm7dtJqSFEzgAPQzRhNWocClHG1iYVBliwHUj6AY/STxn8+UUE1k
	hX
X-Received: by 2002:a05:6a00:1f14:b0:899:13ee:1bd7 with SMTP id d2e1a72fcca58-8bc1c884c38mr5109969b3a.35.1794476021917;
        Thu, 12 Nov 2026 01:33:41 -0800 (PST)
X-Received: by 2002:a05:6a00:1f14:b0:899:13ee:1bd7 with SMTP id d2e1a72fcca58-8bc1c884c38mr5109940b3a.35.1794476021449;
        Thu, 12 Nov 2026 01:33:41 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e9dasm3224610b3a.34.2026.11.12.01.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:33:41 -0800 (PST)
Message-ID: <8d449b0f-72e6-4fa2-b10a-0e034e8bdfb0@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:03:34 +0530
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
Subject: Re: [PATCH v2 06/10] arm64: dts: qcom: lemans: Add support for TSCSS
 node
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-6-d5f575010427@oss.qualcomm.com>
 <20261109-enigmatic-solid-sambar-ada2bd@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20261109-enigmatic-solid-sambar-ada2bd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Gohbo60PCDGCcCjdN9wnykrh4MBpM4fT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX0LeNbYL60TdE
 QjgxeBlH8iJZFqu7e82vbnwcJVaklt3cYfsAeUEH/m8J6JUvcyDbPbtzfokdegdPRnn7S/v6gvt
 fyEj1Qt79RF6tC5/BiKwDi1xyiux2E8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX5sM60LuRyJwV
 vBp1fCJho9C8CFGf5RJR/Iu1mUKGyHhPKSAX8HQxTGLX+CnmsjI/Schd8/KV9Hoe1gDJY1QgMF8
 4NMD15G/A0bc0YXeuBW4TGxzGm6mLApcqvypwrUAM7ymLsGD+YpfNgWLZBH8EU8Tce1H5ZbZlrS
 UTRt2Uye185MYLTw7L09/Ruz09mtRBlcNR26uwXa3/eKYfZzcxWrfNG62RXSV6ICF9LqYi5Udb7
 /31paCRKyp/jKBmhreZxd4ct4SWaaB18L1QAhylZ31ABRPtOjs16sPxRFqv8gILjDnnHIbGTRqZ
 nebdVVk2wttbNoEMxN60eoM0kIufn+6IvLqD8So1WjXkeBQnvqk0T/IXA4IjqT8tPhtq9zOtTFu
 mbKd+ZVtI/1JTUyl4oFUM8EeySVvbVywaLV5z+7gWNEB5WPPKpit2YUjL6R/QPT2tdAHeo7y+OS
 GRSc+K+BtEiQl33E9vQ==
X-Proofpoint-ORIG-GUID: Gohbo60PCDGCcCjdN9wnykrh4MBpM4fT
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af587f6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ClY4ILnnmydcLe65dWgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120037



On 09-11-2026 06:22 pm, Krzysztof Kozlowski wrote:
> On Sun, Nov 08, 2026 at 06:48:27PM +0530, Imran Shaik wrote:
>> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Lemans
>> SoCs.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> index 1fdb72fa5518..4c76c820cacb 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -3022,6 +3022,18 @@ pcie1_phy: phy@1c14000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		ptp@1c80000 {
>> +			compatible = "qcom,sa8775p-tscss";
>> +			reg = <0x0 0x01c80000 0x0 0x2000>;
> 
> Where is the rest of PTP devices? Your binding clearly said there are
> PTP with one and with two address spaces.
> 

As updated in the bindings patch1, will add the ETU reg also by default
for all the SoCs, and will take care of constraints handling based on
the "qcom,etu-slice" property.

Thanks,
Imran
