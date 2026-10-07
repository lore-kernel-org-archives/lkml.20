Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AD61397
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 00:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791331469; cv=none; b=dB1zcxZbmeVPk0C8ciqLFssGTias7xuR3L/+qUDtbVhfX7Je1hCAAjco6AejjUHQMv8UfLGhVBpJFvPe4v1El/qC3jOqj2PO3wrElBtvVjKaOX1+LGxlyU/rYnnB++Yqvr76d8L90qC513PtbuM67KaXe+/GrB3wWhAzxIQJrIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791331469; c=relaxed/simple;
	bh=VO4HprmEH26bPDpYKpkRUcTkm48LKb/lQGoubvhwlB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GpGDC4ur+bZ8nZaIah6JOjVTsjxaEy5doxk8oz/RdOqC8I5AgBR/Gd07tetaIctEh1k786mQRoJGLlsARODVCyc09LZ4FyizdTNBLJrH0Hzjfvou/Jxw7+85sci0AuY5aG0HFuoScjgxVUakkKEXP3tM4zMvv/vvYz9124SxnTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tas6yyzW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1/wS4/F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tas6yyzW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1/wS4/F"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeUFY2049528
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 00:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3JSQSkvd1It0UiMktc5j45ZpdPQLK3YDm6tjbqw98c=; b=Tas6yyzWLItqucKS
	dl8jKUO4sIMPfRmjsoIwJHH65AtlbBDNF38QAKrvnnYDFYDVUBumtF5eBNxc8jXW
	bYI5kMo5syUPyHzMdl7XUOCWMqPwhXIYl0WJzs8c38bj6jx2pmYgztfoUkpnEoca
	QddmSkahpwP06C0ciybD+Fj25oizt/IXikLsx+T/ELm37UQ1ZXoAJLSVgRJofKT3
	IbeKzchhTCEN2yNXdFgxeSzGhSO19G4mzz+TG9LCEEjMWFDUlEyoi+IBZ23FaDQ1
	pC9zhRkxANkzOhYDAPbmlpSdwyv7UDR/sJgO7yCmdQX3BlDIJ0tAb4JKBZ9kWGxk
	832VfQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54621qrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:04:27 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1416f32fe11so6887247c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 17:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791331467; x=1791936267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3JSQSkvd1It0UiMktc5j45ZpdPQLK3YDm6tjbqw98c=;
        b=Y1/wS4/F/4MuuysEMHxD/8b/Mq99k9Howq/eUEGOVMv7sWNwq4V9vefhffPdhHD7MF
         8QEuIQFw8HrCMkk2jsNBqEUU7kPXA3sxN85DeodjFbCz4/XwLbJgWQ441OFgk++yag7p
         B7g6oSaXjNgwtAmGcdqwEMNk4xKdc+U5KmaGjtJ813PDsKYGhOPGH+OCptDbIfUOJ4Ty
         tQNPTRx7E/7s2PkcZPIkORdCnteEAlaiGNWip9gF5PD4tICbBuLWYafhlnRqRdrRqOUs
         p1MOzD6wMg2dQQ2PC1Sff3GF3HKNUt9X4i7bE6UPr+n5HITdeju+B00BYbtHyezI9KPU
         xckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791331467; x=1791936267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3JSQSkvd1It0UiMktc5j45ZpdPQLK3YDm6tjbqw98c=;
        b=sRSKM0QdJfrxCksqfUF4xSfeDS7pDIrIOipqQBdNc5bprp7o60QTM3h4yUOoG3lY8o
         xmEQ1ud3voYVLtxn60q6dC00WMEWTJ7QwOO/gpXbwE5Og7IXCYyqeSi9CAQEPpAh35N7
         72FziOsMNSwDS3tFW1+ZcaKMvF5KGI1bcX6iua1BmFIwfOi7xTZ7/R6DIVC9x5fMuanM
         pD46Ets5Focx2mAuP8ip1Isjq+l//s2flUZDPYyIiubO7BlEHdNZyI4mhbCb/qJBzyUr
         LeX0/pfkjQGFKR0avPYyZz8DcAzjvW5FAl3myoC+21vhgoZu2N4BdpcxwTI/m0GVyju8
         cwbg==
X-Forwarded-Encrypted: i=1; AKwUvBwMIAlwscKJy/GxsDNyVHBWm49CQkV2v9JlF1SUHF6FKOtP2ZBry1Y91/4+4lT+/HESKp23u26OH16YPkY=@vger.kernel.org
X-Gm-Message-State: AFuF++nSd1zbkTp8UObCNgZc5RxElJPsMmFyreVarwvj2Ny92+ftwmlV
	Q8ffjSR3t6WSNxpL8tsnhEIePgQJCv0CZaXA4KIaED1KS80aRnx2YDtwpSZfG3MJdAB45NGhI/1
	CGzW/C12YUmQ/ixWky5EQ7V8HFuxW+tFVbQPiM3B1JKZB+TTPZ9RIAt6nIze0JDG9TjM=
X-Gm-Gg: AYBFou2RVxn7CxqxcPHa3PxgELjaGJoffa/JOxtY3JVS8q1NXWGrspOU20g8KooCcxq
	HzwtjdtNVv3dr7lI67Gx7eINLGyGcu6an+OVsd16D14lwYEOa8+pqx86R8/+VMiaBDT0O/XdHb5
	6wJ6LlDqggu+Fu3e9ef/xlih7JeisFueGmmEYLKLvSj7m1Z0WvoXfear46GN7weAccqBxw4kN2V
	QRZUPHlfPxrET1WhApLKn7iBIveNaJPVxJTevMNPU4mUvWlbXZWfAzsbjNzRiTe6MryNEMze+iK
	SpPRpEpAKOmxq1An+S3nEW9XZhu30GULWTt+V1pYXtKkhbYriz9/xc5U9e+pXSxO+n8hkKXyRqW
	quEYZ7wSyIbfs1S1mIAv31lSZ3t0Ht/JhLq7p5Ckppi/4Zkv9mm6Xq9jIlBtKQgM=
X-Received: by 2002:a05:7022:225:b0:148:8aa2:91e2 with SMTP id a92af1059eb24-16207d7ca8bmr589142c88.38.1791331466725;
        Tue, 06 Oct 2026 17:04:26 -0700 (PDT)
X-Received: by 2002:a05:7022:225:b0:148:8aa2:91e2 with SMTP id a92af1059eb24-16207d7ca8bmr589063c88.38.1791331465559;
        Tue, 06 Oct 2026 17:04:25 -0700 (PDT)
Received: from [10.71.184.34] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166121f2asm1995815c88.4.2026.10.06.17.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 17:04:24 -0700 (PDT)
Message-ID: <27eafbb4-22cf-4706-b551-34c0c8d30ae2@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 17:04:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <georgi.djakov@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, minchan@kernel.org,
        axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <20261001-dramatic-hasty-pug-68ebfd@quoll> <ar4070oH8lRCJMRw@google.com>
Content-Language: en-US
From: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
In-Reply-To: <ar4070oH8lRCJMRw@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qDCyS4v_Z2x0da0WLXMqPL7zsVQzFkR_
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac58c8b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UI1gRxWom6vz8qzGwdkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfX4k8BVaTHcJ46
 DoMQ0Qiu7hgn1hltTBFHd81TF7LGPPFyZiJ2SaHg8WFy/10eyvFqu8NyFZadViz1PNgPnbKNxPN
 CuZQukdVYctusrMNgSwbrHRPWhjUUIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfX01qReu93gZ/w
 E1G3d+cmIBeiF5evX+2L5Ux5y9J9QlXFzR9C/HIOuDYa7zwA/tSu4OdeTkiPeO1mXEbG89BX5T4
 ZYzDwAb/v0EIVK5miw6bNjQcY3t+K+zCkTIiLyR6YW3BBLCykKe1ime5EmwEOsRb53qdaH5+SeT
 v/BX0sbmtn8jCeAUN3GmOUnPUK9/Rlpi76vAzj88PJhuFBJld6IMzbVl18mXNjv8ydJDYeFCoLD
 wff0sviL6HqF7gQhYrF2EhjrnBUTUYvk0WMn7BsGo38/7SdwaGS9JLrGuJe32lPiE6V0Zr490iI
 cQvAQvh9gXy8iSub4qnhYs7ASzR+jREjh3LAEi9jljtR9GPgNh62etfcIT39MceTNetIJP2liN+
 Sci0vCRk0O5MVJRdECAm0qM2xsFZe5YneLSamRGY/OwyiRRkM57LnvjPDwZv7tjesjp1I+C9lqI
 3f/EkVuQ/zQ+s/5FwsA==
X-Proofpoint-ORIG-GUID: qDCyS4v_Z2x0da0WLXMqPL7zsVQzFkR_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060095

On 10/1/2026 3:27 AM, Sergey Senozhatsky wrote:
> On (26/10/01 10:51), Krzysztof Kozlowski wrote:
>> On Wed, Sep 30, 2026 at 07:52:13AM -0700, Georgi Djakov wrote:
>>> Add a zcomp backend for the Qualcomm Page Compression Engine (QPaCE) so
>>> zram can expose qpace-lz4 as a selectable compression algorithm when the
>>> QPaCE driver is available.
>>>
>>> Compress and decompress operations are handled via the QPaCE urgent
>>> synchronous path: each request DMA-maps the source and destination
>>> buffers, issues a blocking hardware command, and returns the result size.
>>>
>>> Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
>>> ---
>>>   drivers/block/zram/Kconfig         |  11 +++
>>>   drivers/block/zram/Makefile        |   1 +
>>>   drivers/block/zram/backend_qpace.c | 134 +++++++++++++++++++++++++++++
>>
>> So entire qpace should go here, no? Why did you create this entire layer
>> of indirection, singleton management under drivers/soc?
> 
> qpace seems to be standalone/independent arch/soc specific, and can gain
> users outside of zram (fs compression, zswap, etc.).  zram's backends
> potentially can disappear all together, if we switch to acomp crypto API.

ACK

Thanks,
Oreoluwa
