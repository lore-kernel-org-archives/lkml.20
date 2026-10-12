Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492764A091C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820546; cv=none; b=AItUO1d1j57uGWM0A0yA5gLqu8691N55nja1JocQVGtmJCH6D4HnyhxWVwP9B5devzhKU5d6ZX/Tm26Yo6sOtgevEehHTXA0kiA2XpwbCxmJ7Ur0GZEcYiRzKNSXbUvnEIKyOAItTmluQ2xPWmATWntcsRZCpXpwldQEKooOmzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820546; c=relaxed/simple;
	bh=BI1gVTJV/UeUd/ne+q5JVpH7YktjFsM6NrVxyhZ5dkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oexAJi7A+ms7JAvWSY8GNJuNI2O/WYTaOuREYIE96DF2y8mL0OOQSrQtN68VIGa8BZ0YD6xkwfMyb2j0872LZBhAuD5eH/tJIFhjugqbay3RgtlHNIJUneSxF0Gd0CLMmRKo5fA1SedgQPQbluv9b/I7re3B3mXi+ZD8olkEV/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmzLCTT+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aL0oBQEK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmzLCTT+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aL0oBQEK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFewnF3851363
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+7Su4ClJN+jgCDcp5+vHvDOhB9DFP9bFcl6DaACBic=; b=RmzLCTT+ZQY/pl1i
	GmyEMbJjCaeZCDOvjysCo1g4b1ebpjyEgOC66o10SF8wwV8CA+KpJ8Ldu3mnGUtU
	g3VBIY1hDXJ5uXTKSkbBN8oOSnAF4dzQSU2tItVsGi59vk0LcEuz2EpJs42Ubb/5
	/V/U1RGKmXA2A4yQsCVvGlZk266nFKYdf5j0c1/QRmBBmS/56snKoPNtXWjg9NsB
	sfwBJqPWy9dx/xlUouLwJ5aI8TlY4MJd1Z4mAnaYI5tN9XS8DjqOwu676jSI745Z
	cgf9Pbruz5pzOO8j4nrSonLAlIvpEBw3YYr5HQMDwAYZpjHdLWVXDjGKxbhn7zlX
	1fFapg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr9hhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:55:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179fb39cb4so5899006d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820543; x=1792425343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+7Su4ClJN+jgCDcp5+vHvDOhB9DFP9bFcl6DaACBic=;
        b=aL0oBQEKs8mzaNEqTlwF6ABk3tmOlPcxs+7B9ieAseaSa+eoY917im2xA/a7V0k9yH
         +4ms0usQWiGX6JuDlvOzdxWKxshCPlWZXktiA74AGqqGSg2b9xzI9RdrApy3lReyOfsQ
         j/p2EqR7nKBYg2TNeHY/rr+JGC48gBIodDTbPE13sfKHpQCgu/uLjc0RxY+pheBfOczV
         FZCDHnWjEWa7nAGx7jSHWBIl6k8YWproger224fMbA3uM6w9Vx9zgR5sXzJDCwupHVyL
         /gVZA6kv3pWtdrKXIKDqaElf8eo363Dl+kCgqppMbbvIVclGDB3ERpbCiwoxaae4A2X+
         dMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820543; x=1792425343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+7Su4ClJN+jgCDcp5+vHvDOhB9DFP9bFcl6DaACBic=;
        b=y884Tu2zjlyTcod0A2TNfBc2Lat+qWQa3p37wAumsEEZn2TcKuAZJZB5qsZUmy7Ly6
         Q+wr88g1ry0C6VOJIoQCuQvDZtrji7gFO75+weP/UJmouGCTRO+xqBBAgO9wIVpTAMNo
         Vi4iDsr6eLFCTva47W82XNlLAkGqczTXf2itTV+3GNIvmGZlvsdH0pURUIc1lILKjhMI
         qbRXPWlsfc/7VwJpCeySD7LaHLmfn8HZWUSnr3Qc+J2LkMnbWkDCvqJekAymWeq7P0yC
         PWeptl74gWBW8GlwuXnM6rTYTQZ3ME1MsUUFqgyYYMWBaan+MQB60VLYYQJ7fYPj6eaL
         bLeg==
X-Forwarded-Encrypted: i=1; AKwUvBzEqJJv4t8+oheaNtUBFHz6gEiAwdzlEQFhUIlMvvGFbHsn9rWLsdRk8lCLGY8i/LRPjl/HsyQ+diRP5dg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE4uW5fcCgivR0RtABkb4HDkl4BBCPLPm+j0YGBE/33UujcR0Q
	fgG/ZY76k1Iy18Z292tM90Q0swUAUnNMa7+Ux2hRgmymez+RRygPpy8zyqsZzEOt0DjlDQFlcCp
	pu10fOTQeGCfFjefnmkRr27w96Ai4vC0Qu3yP7L9UKOBCFSNwT0DeLWOEx8aO6UP6Qy8=
X-Gm-Gg: AYBFou3COz5JFWfT95OdUfX/SFgWI/r65zx/RsRZA4ElfavXWF8U0Yha9fAl2xp1g4u
	1f0qW/ePBUp4FTpVhdaesoQS6dbf1QEN4n5HE2Z9Lx2dNpnqvfLWSAQfx31GsnsJhy5XGjtjBSu
	MErPYSP8GuHz+pomLMAPMzZCx1ogYPY5ns5OCMsQLXRCP0UJowQ1lYBld3d0+DB+e3OfwU8PJ7d
	sfl23VTl2aazYXLCbBSV51Hyn2MdHGqnC8Vspk9/rLwOs9Qi6j9FfrFdjaqqjbP+W6brq6HMwsw
	LSc7/VnNtSSu+YuoK0tgPuoOdreZiBWTk1Ecc7rM4mBJoVWwwj8F5mqSDJ2dqKcgSlHaJIXDTkG
	S+W4Nncf92qk/rudqqs6VIg==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr1877789285a.4.1791820543518;
        Mon, 12 Oct 2026 08:55:43 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr1877785885a.4.1791820543068;
        Mon, 12 Oct 2026 08:55:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a68c08sm474614766b.31.2026.10.12.08.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:55:42 -0700 (PDT)
Message-ID: <fd40f44e-8cf1-4c29-837d-85967fc6d1e4@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:55:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20261007-rsc_read-v3-1-7501c014fb37@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-rsc_read-v3-1-7501c014fb37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX7Mn42Jm4+rQF
 4+Z0RMHRKXmwQZSVUXlG98ZODUDl5Zg/sikthYc1yu2nWQaGG9tZW4MjmyUFf/gRFayVCYXxwsg
 lhcJfGDD65j9NXE3Jg0VWcyea11E88e5tAI7O8A+c8SwgNyCiGHz3hf6rVT/W1bRIR5ES54O9pR
 1DMX7r8mcbrfB0cDBCEUFMa6FYwHnhOqdz51tPdWhfzMG/l/9vDisLUFTfRU/obRDuoB3gxUpWE
 ERzZE2O9KVXhT0WV91gZzsTUz82HBfGMTdwCQUdZNDw3+tObkWsunAMPjHjtdoyOi3T4AGUgrZD
 Zju+3kLZsiSyskqz8djbmEtn/rO+u9LgORT/7zvfKueG5eAUy78YEQnxSjQdxbX7Ee2oQ1oeCMr
 +RjignSTVWZoic93PG+h+WKdy+RiI/KDGBvfg2Lc5XmyAi7Q3qedkG6PpEr7/f/DiEsgtGuG/6E
 /mC1c8eVvqEDbnMUqQA==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6acd0300 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pP68ExRZSLElUsFVznMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX4w0HqOzRMMpq
 qkgQGR80xX8lBM06wCn+FCjXxGp4BJ8Mo/aHMrWqO524B/B4qgpRbe+YWHcxFKw8US7Fnb+tTYw
 xMf7Sm6Lp4d1VGyCnDHDmjLXA6Zudf8=
X-Proofpoint-ORIG-GUID: 3IGaCGoCNnjZOCnb8uy7hU_pkU0Lk_8A
X-Proofpoint-GUID: 3IGaCGoCNnjZOCnb8uy7hU_pkU0Lk_8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/7/26 12:05 PM, Maulik Shah wrote:
> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> request instead of default 8 byte on older SoCs. The write request
> continues to be 8 bytes.
> 
> The CMD_MSGID_LEN field is [3:0] bits. Describe the length bits as a
> GENMASK() and use FIELD_PREP() when programming 4-byte or 8-byte message
> length.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
