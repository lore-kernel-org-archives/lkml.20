Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1E230AD05
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526362; cv=none; b=jJwQVXtzeZNQwDHbwjyLaIcAok2Hf8adNQ6lEh5rGNxgaHWVcOBAW1jWjSFMXHhr0/ZK2+tjd1Se1ksCsoplTapISa0b/s/JWo6m/A58I5whIosrGw0KDtXJaT5Aih0mQiKEGH149BJi5z+XaKh34hZ1qLETQYK5c4NpXANYyqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526362; c=relaxed/simple;
	bh=g+o5GorNkv8qi9qYCJmUtBjISmcF/Ttgm40UCw9Aams=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cq8fqtfeW1IHHH4GYpnitFmo0HcPeUTJnvx245WhK/N4PgYh1A+4Nz2RR8mVufsIbfLoonCkZ8gPL2SxEeDPPpZPqKw0tjWNASh7xRemipcgUNAE8OLIUS8/CcF9h1zzQlq9++Ha4tbiol2WS6EhLLzn1O735RX1vmH1C70ka0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rxe0ZcDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTpErgso; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rxe0ZcDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTpErgso"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HAfL3942629
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 06:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIPd0Djbu8CBc4zLDdiv751Zy4DXleUy72RpLYJZ1zk=; b=Rxe0ZcDEYe0hX30i
	Mht6EdKU59lRhEleUm3WrCPHGk+ibhZsIC2cssPY2tP0QAcQTIZNyiZNUeV6V6Oj
	IjBgXEy2PBiV+sT9bgmpo1NnA4FbbaqnAsSzg/27XGiUx+HTibWFz1lQXr+S16rV
	1XiDYYk6d/7DtSWKCIaBoykEJFWCoPLDTfCjVyy7GB467ED7bZzdVGgn/JhgI9Hc
	ZKHZ17CWJ2orPi0OGgEfuQMfKTCQ0pkrxb6qisBh6dcntGv/hN4B/UFjA8ZcR7QD
	V+YU/OzQfSkxdoFbZFPx2dDA7w6k0oTgofHTW2t8+qs/n4263cr+U3RvH5hUgJId
	iexd5A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk279t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:12:40 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso9038748c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791526360; x=1792131160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIPd0Djbu8CBc4zLDdiv751Zy4DXleUy72RpLYJZ1zk=;
        b=CTpErgso7smKUWwjSo1IVIhNoKYNjWXiHUWoWRp14eWkoDaFt/A/Ehn20MPKPfUW2T
         IFwb1Nk5VDsyW/2IAgm2ZjzvzVLzE1kUFFNyi7HrVG3B6e46Vxdg1oaIwKw6qQ9zleJQ
         AKfyFkny2NiQ9nzL4tR6qcn7HLLpKc7C76kNPfqPgptCSmCvstWV4YB2oJaPXndmnAsq
         JqViiadp5DK5afquTMfQiuurd8jQQd2B5fUa35qoQlwQD4YLz1q59RhqCDnTwegpdKXA
         Xche88U+HmWeS4vWVn0VBv6Qtc0S8KDx9IJOQx5Jks8VPIrUHFKL0tf/qyVLLKrLSxdI
         C0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526360; x=1792131160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIPd0Djbu8CBc4zLDdiv751Zy4DXleUy72RpLYJZ1zk=;
        b=ZfHHh+poxOCanybx0kLYAVu3R1JBZPlatoC58bioOAei4Kl/01eML/uTtY45dDowSv
         W/gwjWtwr+P2uRxYP0n3c4EJFOQeDti5LiADWq3KmXyBcHm/+KGxFUSCEvbjN9k+xeqx
         4XzV+ibFg1Ogu8NVTVe6g2hmC6Y0Uf9tlw22DyxN3Y8OMRZOCU/seexd6LiTZ9FLFVpS
         FWeQ7mBkOxwA75/fd3wH7saO7QOZjE8FmETbvXpflNHQNseBrxzN5KG3SxQnLcT/g5CA
         AuYM+6wUlYUjoi6Mbrrf3+nUQYoUsuNgygFWQYZaVQcvIdw8TGAVHuV07gdKNjrIoevr
         RTkg==
X-Forwarded-Encrypted: i=1; AKwUvBxZCApn8Q/cOG0ILXF9X04SUGOVfKcmK7JSQMH6MEUXZLnzARrNNS1NNRXyHAMfVODRoOrbeNnY+XkDgJE=@vger.kernel.org
X-Gm-Message-State: AFuF++kUoTnH9ys+V1ZTjuZo/REjSdWIOo40OFSB90JRphte7s6o/qy+
	FTh3qDHaRrR+YZdGetILMYVZldUlSQ24Gkh/FsLz/Gud1SZLVs4syDMR1olNT4xpb+0lAO4H/qv
	rXLyctXL8SaSETMpbzaMCz3rJj+NpHwIjvxTPZoibjnVW9jY9j7Oercah7vdRmcQ6j4c=
X-Gm-Gg: AYBFou04kQBRH7SZcvSaOcLLyVl/8scoQyLfRYT/lZyNdL/UME+kj5vxdSzCy+wKzQ/
	Yyw/8A4wVUkqE++lBuqsm6eKJmuEutxTVHHzPiARhWap5ic6637fm+hQSgC3Qtr77gYks8ktFks
	baYrn7CNH2wPFLW4VhIum8XXB51F5rMLlcIolALI/foHVUeJVcAu64goGMj1CaDiFRgJrI/gzaB
	QuUIQNnBXUkc7E9o4RctR3Km3wGSTkPq3csTO6xPJsd6rEzJlEkKN5/F938zwYTDR/dJAUt1Wiv
	Af6PTUi3aKBsbji/KVNycIGExBrevKC3Ed+MiZz3HnKUD2joDipYRQA+fE+uEthsrEr70xumXYg
	fE+am/PrKy0NWeUBd8D5eoOK+zLSi
X-Received: by 2002:a05:7022:f50c:b0:151:2e62:fe54 with SMTP id a92af1059eb24-16a5ef287a7mr1102572c88.20.1791526359630;
        Thu, 08 Oct 2026 23:12:39 -0700 (PDT)
X-Received: by 2002:a05:7022:f50c:b0:151:2e62:fe54 with SMTP id a92af1059eb24-16a5ef287a7mr1102534c88.20.1791526358938;
        Thu, 08 Oct 2026 23:12:38 -0700 (PDT)
Received: from [10.219.57.162] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a3f6186fsm3562167c88.14.2026.10.08.23.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:12:38 -0700 (PDT)
Message-ID: <5022011a-c239-43f3-b8b5-73d6b5fa8e0f@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:42:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
 <20260923-dup-sessions-v5-3-e953133a1827@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-3-e953133a1827@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac885d8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KkVOY3T2wTLdEB6rIlQA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: zkzEn9GDOvaM9hZ2anniv9IM2C4kDifd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfXyffgon35fVPO
 56/3RFLg6QDVSOJnLgcYZlRbaVp2H+hEyVuvtooOi7DA4kb/TFk8xlL0eWntZnJbXerfVhPvubn
 FvPU9G5znCl/5jqnaZXJMdHII/iPTQg=
X-Proofpoint-ORIG-GUID: zkzEn9GDOvaM9hZ2anniv9IM2C4kDifd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfXzWOew01BE+5d
 YAqXP3AvXqL44Jvt/DmW7wEgzNEudVjOi8GpVnbo5CIIGvJIqsw7UELqfs7OEj2FeJgHmm5iiEA
 twA7g+PEHSEU5f3vyJ8C9wTZC0ffrDAbOQZbEzX7Z8Oq2E9OS/IVc+y2RM+zJWKj8B744+xK24E
 7WHUpSgYgDwbnIkG+tRHcHv2lxgGLuguiQW0Ete0tYr8kKJwcSvlWw55L1MNAo44e7XQ5Z70tsq
 3JXtpUjdG1TaOMS+pKZ/r1G5GVwjkX0AvHaY2UJLJBROiLJc84N9oDlC4o50p8hALYAnSyV9sWc
 0C0h8SUOLimPfH/9zBa02REiXtXJ4v/QE2MMpA6FM0pidZqw0XjmlwfbbhMIRWChPPeXhONCT8t
 MMWm+qdUwKGwyE8h6/bikkfrzh+D+RTgVek3rbAgKiZl829aXnRYWJDz5EKgVzgxEsPfjHvBBc7
 Ducb2BmDc3PeIs83How==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090024

On 23-09-2026 14:09, Vinayak Katoch wrote:
> The qcom,nsessions property was used to duplicate FastRPC sessions
> inline during context bank initialisation. Session duplication is now
> handled at the driver level, making this DT property redundant. Mark
> it deprecated.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
