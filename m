Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9150337AA9C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848366; cv=none; b=lJOUkbWwPaSx92Rr4uMqYE3MQOEo/VyLddxjq0iUU0GPZGBUiLTHlgcaLtyheSyWMBiWwF02905oIaQvvrKv9WfDau24aaH+gevzaR25eGT3T0JMEVoPVZ8/YsIbC/5VvbH2mOXWENH0wsCuB4MWKLuB4h+jb9DIuOhA9Y5gm78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848366; c=relaxed/simple;
	bh=GG7G+9T2Oo1QKtwlAlwwLqKDet634AxeiXNEgqyA6mE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQnzCcs7bXnJxEjfiWXI0xwwQPs84ApfL9pVdspmKWF27065KMI/I5woOwVg5eSN4hqBQkeQqQ8aI5bmRfuarSAWaAvie2Nis6xsWKSUO64N+BAcEkxSneCLYwhPaSAghWxK0tEJ48h0JO4qsVAuoNf/VtqC/cDwAI6ZRwcgSR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZWjWtvg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OGo6dN9O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZWjWtvg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OGo6dN9O"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NmBtJ681987
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 06:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GG7G+9T2Oo1QKtwlAlwwLqKDet634AxeiXNEgqyA6mE=; b=CZWjWtvgTB1ecmzk
	kEU5K3FZaJ96nVZgvlQm1brKVcKbfztNoSBCOgwJBhxeFnrtmeG6m3LATHUdUYqw
	g7jUqu/uOOAI3nwekpNOV0AMJyBCTEWQAYsh4WlnBRX2BjuKTm2xJoVtQ80vl+Af
	ow0Vq8vQSpqsP9kGqKETsXejVsoNNZNIkOzN8LScczEHYp/NGrmeqOsAH13EesLp
	NgVIXoi/r8IJaasqQpdm6aaR1WNhcURFNd4DouujhtZ57+p0oFtArNPutlpA8qyH
	tL/1e7UGt/FDiaYP2NEydZaWWKZUxzTDxG9U7kNFtPbifaRdFpmV71kN0jtozX/8
	/Lq0jw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077j8fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:19:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so6588582a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788848363; x=1789453163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GG7G+9T2Oo1QKtwlAlwwLqKDet634AxeiXNEgqyA6mE=;
        b=OGo6dN9Ob8HZmmLJbvlWZUYq62xaASgGahNuonyxqwexYVhSQM3GfNjdpCJzwENskE
         B6+89C0yrQr6FmiRQyk/CHPkuyS0exTH72hA81Q6hLbrpl3pTifoJaLGc//LAthLdrfn
         0sNIf6YpH/BB51UNPTAJmA5pDQ+Lg+yBQeLlCHvXP5IoVgUtZV4GGh1tZvziAgZznlKG
         UrEg6StBz6ahBT9H+CHMhNsQQy8XQhXnLNi+t46IAIIH31NFWff8y5bjId3xVveqNHh/
         h5gBO6ShUIKxb1NfDd5FsQ5+i9Gi/0b5WG2MGoO6nYfkZ6jfuGlhXxzWCl9K8+wt82hy
         I9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848363; x=1789453163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GG7G+9T2Oo1QKtwlAlwwLqKDet634AxeiXNEgqyA6mE=;
        b=a2X0AfsxtP6fHEa3doB0+ulGySoqAZMs9aWqL42dG6YxAnsY1JKzU554rf95aOtZ5s
         noUOxME43P4PnJtP2v/UZVbrEa99sT1othy8JPrIMWS+W57blXw+4hC50uHJhdk8y037
         7js8SWZ2L1F62PINLbXMIKi/xUe6PMVGspxeAxKU6KFPi/q/XzGFFSp0+HucR+KPNyHy
         YzJA8T+iBXJnO72FVCUrYyEG++5tAH6yNANAeCxvMr+kvATqG7gf+orIHNxnU3End9T6
         WjKHqMG62WtqiBd0cBbjAEJfrZCEACVFA9nUP4Jd6qiP1ubXCwUuceYsAUTne0e+MTHf
         nY1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwtJS3AsbaFWwbZu8qL+ygWcIciZoK7IBj1BQ4jgDDNcjsDxsod4inoNbDGe/KiS+q3e4Xyp59nExFrwH8=@vger.kernel.org
X-Gm-Message-State: AFuF++nc5N2RWUHohhhTo6mI30XwTPxP88+mLgA0A5+jGJTKWWY0ptJ8
	zCva5aCHzt17XZWdNNWcpOePmDmOmtbyBYC6CT2P5pXw387afrV61e1Yd/0V8APoH8HrFq13TzV
	YeR4Eyc+XZW6YHgP8i8+uxw+tJxUINvn8Yc7aOBTi2MBrVUaGJdsJml1wdR5osdku1so=
X-Gm-Gg: AYBFou0PVyedoRbioeYhGslIt17s1WXCJsX0IFu5jzqxCc4h40YM/wpFbLb12kIy+u1
	T/BvM/McOvVz6XxAwrctGQkjXo7nVf/prnzQK0OF/g0WDuFsK3VbD3/JqZiMhVVjhfkbAEOgPy6
	PNChtz6Hzp83IldhGhrWfe3Xo3HHZKQqVjeQEQOuOUWcONV79j3EsCMUhLQGLluYn6lyxN9aBUb
	7vZInVgkIIllEZOXIYTTwd3CA6HGwCP8aq9lOom0oatbTDidGwTDVSNHMQBVjTjL6pp4MB5eEyZ
	S469F6qH6z5kJ3cvOq7D1YLNI0rjOSsyWUIYaX6dh3Ap7XOedE7Hh/DwsF0LTfsrv24h5hiw2p8
	EKhZTOFrkymz71/8iePgedicX2wcOJA==
X-Received: by 2002:a17:90a:e703:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39b2629926dmr42480945a91.24.1788848362820;
        Mon, 07 Sep 2026 23:19:22 -0700 (PDT)
X-Received: by 2002:a17:90a:e703:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39b2629926dmr42480891a91.24.1788848362367;
        Mon, 07 Sep 2026 23:19:22 -0700 (PDT)
Received: from [10.217.216.255] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm32885817c88.12.2026.09.07.23.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 23:19:21 -0700 (PDT)
Message-ID: <43009f4c-55c8-4f82-9efe-b72747f68cc5@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 11:49:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pci: designware: Set DMA_BYPASS bit in outbound IATU
 CTRL2 register
To: Manivannan Sadhasivam <mani@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260826-dma_bypass-v1-1-3a53dc748ce2@oss.qualcomm.com>
 <mivyhgl3axsebyqktjqqglqgra3ptx4q3u5a3ybudmnxigvdqy@tn5sga4z45cu>
 <1fe0ff27-abc6-4813-a4a8-8bf8ca92b91a@oss.qualcomm.com>
 <ycyc7cm4y6s4nmez3aojdenqikh35eqvk2ady2azbiyghbbg4v@r3dzmymx2xuf>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <ycyc7cm4y6s4nmez3aojdenqikh35eqvk2ady2azbiyghbbg4v@r3dzmymx2xuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2NyBTYWx0ZWRfX4KIjCzI3cyKX
 ixq2dwsuVzcEUHq9TfMVAoscs3LxORLA1rvg5XUSc7i7yXyeuz6bn3uzlSWEfo1WYMu5SaaPJ/f
 mg0YNtWLKz8CwhuIQ0TZsi/QRdOi5FFR+VbEDzPoWIvPvMU4k7ZcxuakadA/bZ22cuQuBl6xbDa
 7zkeL5IC/1YDKSVWqzZtyyOP8DHCV6Tgo9tMA7SsfUgAyHxdAgzS4vPf7MeCqjfecw9f/tWmdKW
 zNBVPBicR01+zJnveCcEB6ARH/sgS9W9/c9m3vtSwJ+NUVv1UIggrEjDtmIkqjofQ4j2PDEcpuw
 wHZhpylHOgHeRIN21sXVisS3Z+Uk+RpkAoYqX2LRejXcpFW6k2kPEAT+3nQn/SBNfKIljSuW0xJ
 YOYoC5PazrDSvKC2FMaTwUYX+BhzU6BISBPDGnFo9cAhs75hfEVYjHm6oy1BeIAh1GE/suv54Yd
 nhPw6cpHDPDfYGJN8kA==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9fa8eb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=YUdBlht9uQjFYAMZ6iUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: iEZYYMPvnw5qu0q0Tffjz3UgPE5tXM4V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2NyBTYWx0ZWRfX40uDB4EmPNOi
 Jy3n69/tTnq+ndZVEhmMfbr7OCPDUFZ/q5iEepLNV5LsQ9l0wQmzmgd1e0X0GeI6i1xiBr5JC5D
 2XH3YFLviGiGbBAH02Db6P5Mmyy8zX8=
X-Proofpoint-GUID: iEZYYMPvnw5qu0q0Tffjz3UgPE5tXM4V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080067



On 9/2/2026 9:47 PM, Manivannan Sadhasivam wrote:
> On Wed, Sep 02, 2026 at 08:44:57PM +0530, Krishna Chaitanya Chundru wrote:
>>
>> On 9/2/2026 7:37 PM, Manivannan Sadhasivam wrote:
>>> On Wed, Aug 26, 2026 at 02:41:20PM +0530, Sumit Kumar wrote:
>>>> Outbound IATU apertures are configured with local device-side addresses.
>>>> When DMA engine transactions use destination addresses which fall within
>>>> an outbound IATU aperture range, they get unintentionally translated by
>>>> the IATU, causing the wrong address to be sent on the PCIe link.
>>>> This results in data corruption or IOMMU errors at the host if the
>>>> translated address is not mapped.
>>>>
>>> Why are you using the same device address in both DMA and iATU mapping? This
>>> sounds like a mapping problem that you should fix instead.
>> issue happens, when host address(DMA destination address) matches with the
>> internal iova address programmed in iATU src address.
>> As we can cannot address in both,  we need to program iATU in DMA bypass mode,
>> so DMA transcations will not go through iATU window.
>>
> This needs to be explained clearly in the commit message with an example
> matching the DWC terminologies such as 'Target Address Registers'.
>
> - Mani
>
updated in v2.
- Sumit
