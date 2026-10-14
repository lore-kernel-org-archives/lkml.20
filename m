Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801DE483BCD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962697; cv=none; b=C2YCztOPmd5+3hiVt9Cx3yREN2AlGnYIN1qeQIwm9Pm3jeD1lQBjN3DY8P670EIOZzjU1N200kDrZR61LHcUMsxLn7Zc6g5utjqtHJGRdVmW4TaJGHWYrgBrPUEXefjGH52fTzXlZYApUELKm8mubi3gl+01wtH9K4Cb8LGb/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962697; c=relaxed/simple;
	bh=dDa3T4LL5IpxJg+Jw1O52rvh+4TrC2ENbVfqwgR4Dg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKkDNOuf3Cm5YLNYgtNnBj74fGo7KoDbMXoy/ftRPbuqllEpJZ8dsrx37KkOoHmFGLZdNdtRNZo8U6eBG4nfNm1WmOkjp9bODkVllio8TMGBGZJVgOd95XDIpKhS+tu3+S1llM6AiMC27Ho+arFIjnPtoVBqlO86PKQ/9A7Qrm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lw3AI7Gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNaMikDq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lw3AI7Gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNaMikDq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E20LLJ1592103
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	trNalYmEySgSEmIVqxKOUHAXgXHiZO1fSqcMnYiYX/I=; b=Lw3AI7GhYfbiJz9T
	YarnYw3hvSt6xmcYyMD4WfuKKBloP2wu71X9p5TB3p7W4Ipkm8AMjKSVdWo7PkcB
	+dKkYQH4cSN/vGMgBmYRMnpNVJkXSyYIynXEOw82hMGHjQ2OFvHsd70wbodA5VbO
	kAvasZ2rLpGHxTHHkcIDJkESPu4831Slv2Z20Vl6LZ/8d5AENt6GBy+0VYbGVSMa
	EmeIXJTIwZ9euHuFYau8tDv6NBcLEe+BpzFLdm6tRaYKgqsjYNgbjcnJVPeCHUfs
	82xRsMr8n4Am2PV4QUd2wI1pfacvMja0ni3QxwWup4+O72sRbfwbuCwZK8Kayr3S
	JdIYGw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s1tjy16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:24:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106bb33cdfso10697976d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791962693; x=1792567493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trNalYmEySgSEmIVqxKOUHAXgXHiZO1fSqcMnYiYX/I=;
        b=ZNaMikDqOjfdFXw1bAwF/uSp+K3wWO3mOegH721AUZjykBo1NfmTbTZoLHH6tlW8ND
         bmrUHMIMtDno4tLXntBLANWd3enhSSx19CN6NUqU1PdHmDx3fLMtFIPTmmtz3cQMGsx0
         Lnjis0VRWp3dZhMWIXpin1pzyCrqYdTxAWwIihbKbRkp3BES5br3uQ59NSeDjOtNP3xr
         hlvckGrOb5hPAG/guV7N4qRNstr9dY+gKILyBYCCOqsjaNQZQA5Tyyw7rfMOcG8G9W0t
         /ho3cKXHEfqzm9OrZDpuEHgUTcFZpR4ar0wTTUPImZUu6qsoMXKgKB8i946KlKv9RSKN
         Wy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962693; x=1792567493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trNalYmEySgSEmIVqxKOUHAXgXHiZO1fSqcMnYiYX/I=;
        b=dG3zPMVGEQI80pC4pU0pdMt3NHNDAyjttTGPdhSSJrn4JndzzHTIdqBF77Ov/I7B1X
         ehe2HJ35UOE8IfsATk1SjCYOTM1QHMhEGxsj/EZSVrbtaunKFI4j6XVb4vfl/CDyKNm1
         8XJ6g/HV9g1K+Vm8hokA/IBumKiszsQZNQ7DIN9fN3A1io0cOEh3GgY2CcPxtl7jCJEO
         s+6YzVEsBLsj8phOGycz33rvF6XmCYIVOiTn++PGoqVGSaoFLxUIMijSqFhX+eZd7BQv
         IG54uUWlDjpBdPi4Ci+AEWbrm5wAS2FDFH7SNtI2yWZvfvtGyywrCG/6huncvtyNzRY8
         VHDQ==
X-Forwarded-Encrypted: i=1; AKwUvByaaocJ4gUyRYdOFw/ECqKMKf3sTIk0GrgufisaqZ7eDh6dy578rakq+j5gF3Ab+jFqq5iNg7zlK6rZDM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU+HkpmPECJm/XdJcuXnK+e4XrCX3Dso73YFdEUQRsjhR0txMO
	c+AdrNw3J5fg9VtnRlcGoTfCi+EKPIyHMMZNrKR3jqWOmqeabHuZq54o1aCfLeT9oscJETFxM2d
	UQgavrX3HThdtuN4NVKZ1fLS7iUIBCprutTrwXtmECVosDbSMtUvD2iv/ax86UaZ3KQ3k6KInyC
	Q=
X-Gm-Gg: AYBFou0dHiGPtugQ7a25b5x5I5XRVaVwByp7tmCuqIfHvQLhuscAGlLZkv08nlVnfU0
	+F4EL8xDHWjSFlr7OJKZ2ltELjoKe3/Pcplx08kX277dLQQDT9Xa1RAFWksNtrNPJ6krkqhFiK3
	3Kf09VRoYqqq6U/I0PxGgB7vw610V5ezW6X/KLrJ/ldNiCWnM4VXGWGMbKsilMUAbEN0Wx4Mn1Y
	4vX7QMl9Heu3zVUi8xDBIBo8t3ptLpWZrcCiLQCtyW2dNg73DonQPDSo0Fa6WQIfUQU1nKV7lHR
	4cqzWRhr989xVFalGV6KhthEr+mMdrCVuQEzjHxArax+oohOtVU8F/l74ruQW9VEY5s2AuxhGNm
	PFpLPWYq53/+QckbdNrldxQ==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr2969001385a.1.1791962693563;
        Wed, 14 Oct 2026 00:24:53 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr2968999985a.1.1791962692965;
        Wed, 14 Oct 2026 00:24:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae4a94sm690977366b.82.2026.10.14.00.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:24:51 -0700 (PDT)
Message-ID: <bb87b142-075d-48b6-a737-f13170d76d5e@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 09:24:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: cmd-db: bound database walks to the mapped
 region
To: Oleksandr Suvorov <cryosay@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013091611.2592612-1-cryosay@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013091611.2592612-1-cryosay@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IpOL47/g c=1 sm=1 tr=0 ts=6acf2e46 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=rRUGPTwFRYfZxENE-AIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOSBTYWx0ZWRfXwRGsppjNXNqQ
 KMZza0SOxJc07GiXCNLwabm98jv7AXplxXguEbxT/V/39AWP45vJmPYYb8HC64iBy8QzGTsjADN
 /USmn1vK6MlxlYP0TPMxMROUgB/v8MIAIYEEilz9v3wM3xGsgLRs19vKUPc/t+hAlic57SB0Lsk
 C2IDRspHE+/EB1XLtYtviUV3mXMhEQl8PGjY0SummJJAJnkfEo6XT02zZb3BnRE/z9HkUE0yFK/
 W0GnThVv6X3Hp57B6KWRRwbdD9cdQdRK7/zfaYGWw8ik/9+fj9/Tkesnn1gOvrWd039NmPm/xfY
 Q5Mutf98d5OWuYaqoGFfxniJHuL0lyZX8wwqCXReGnArQSe4jnKCEkYXwNbe8hn/NkE+jrDZ0Se
 tGpCBt7GQgM/cUE9J5+ScAI2PlMNVzZHZIrw8NajCYfjGMWES5dp9wAtgBHoOcrP1KFttjsqDm+
 +xuP1xTX2fzIPCMDPPA==
X-Proofpoint-ORIG-GUID: 9aeXqXgpkMbHDyHzekZnSy7qMQxZHw7r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOSBTYWx0ZWRfX+o8fpdXvAm0C
 k2b1Z/eAqfeqyjueDgYd8QySQazTKIyrck9zTK20RGxUHjrIR4Mzmvf6nKdAbI/Yg6EUwNuOWBv
 9MLmgZKsqUY5ykj6QtBuOTiTPAVIOxI=
X-Proofpoint-GUID: 9aeXqXgpkMbHDyHzekZnSy7qMQxZHw7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140029

On 10/13/26 11:16 AM, Oleksandr Suvorov wrote:
> The command DB is read from a reserved memory region mapped with the
> size given in the device tree. The per-slave entry count and header
> offset, and each entry's data offset and length, are taken from the
> blob and used without checking them against the size of that mapping.
> 
> cmd_db_get_header() walks rsc_hdr->cnt entries for every slave when an
> ID is not found, and cmd_db_read_aux_data() and the debugfs dump return
> or print len bytes at a blob-supplied offset. A count or offset that
> reaches beyond the mapping makes these read outside it.
> 
> Keep the mapped size from probe and add cmd_db_in_bounds() to check a
> range against it. Skip a slave whose entry array is out of range,
> return -EINVAL from cmd_db_read_aux_data() for out-of-range data, and
> mark such entries in the debugfs dump. Warn once for the first two.
> 
> Also set the size before cmd_db_header becomes visible to callers, so
> a lookup never sees a header with a zero size.
> 
> Signed-off-by: Oleksandr Suvorov <cryosay@gmail.com>
> 
> ---

GPT also suggests this additional diff to block a smaller-than-the-header
cmd-db region:

 	rmem = of_reserved_mem_lookup(pdev->dev.of_node);
 	if (!rmem) {
 		dev_err(&pdev->dev, "failed to acquire memory region\n");
 		return -EINVAL;
 	}

+	if (rmem->size < offsetof(struct cmd_db_header, data)) {
+		dev_err(&pdev->dev, "Command DB region is too small\n");
+		return -EINVAL;
+	}
+
 	header = devm_memremap(&pdev->dev, rmem->base, rmem->size, MEMREMAP_WC);

Konrad
