Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377195;
	b=m8fXAnxw6cPFLfZifG0pwVAUj/4mR3yyVVOO8WRcLmmUXTb/IgrF+wsZhIgR+6sp1461
	 Z+6hfi287pjUHhsMLDiLqceVIELyjz2GBVILWOj2gFUc8sHnl0vuGqkjL/+wvhvARBrj2
	 UNLzeszNFwlUTb9qHJwVb47ksYdaBJgz6HrKCpOllJkphnrwWG7evHyTI64tG2W8GEROC
	 XQC2ZgLZf606AHOVRxkATqCsWlTzcHkleiECDOU98rUiKQHLo8YaabECMupb7XR+jERO8
	 8uXbznEF0ydcw4vrRHOU1Dhs3ZqaUPEGmS+ydlv8ZajVPVhI6lZSIvJbmoqJaiTK7Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377195;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=em7nwsBvfkjrmGxpt9MT8h8i0Wxrvo6KZRBsSUc4l0w=;
	b=U57oXxAQQ28M9BvBVQhY+1xE30Sze+mdya5ip0L1KC77nukDlzS2Ly0sSdWjzUNfiU7L
	 MZ686T5+kgbudg6GyaMxzf7Dwwtu3x/V2JmIBmWdp9uIUiLbShSOGSu2f56CFD1x8t5GT
	 TQhZQQPVo3/44r2onhRBT0XPDE4LHpE3Aw0jpQd+HKY6iEnQ8GT+2a95mH1Z9SLL6dh6X
	 PxMaxxzOTuPgzepWdloZrp0XDhaypZ/TOCsyN7UvNs4gIL4AFLOXoWOJX2SvMd9BN9FT3
	 VBzZ5xHZH5REb2GjjLv2jQ18MoFYbmGDFA/kN2eSL0lfPdXZeeEQStiVmAOAhdiabBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BZJFO39b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7h4hYvz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC90606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC90606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BZJFO39b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7h4hYvz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERLcX2495322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=em7nwsBvfkjrmGxpt9MT8h8i
	0Wxrvo6KZRBsSUc4l0w=; b=BZJFO39bVpwRcsNSYuDl9B3uxiG74rruMnfkZrIU
	Mu2PYyaDjL6u++CRwdn5AdtMY8XASnCVN8kqgiKt9nuMtZns0XxLF2fO8hbD5j/x
	4eckunkiekMnuMbD3EsOQOTRBn611K9TiF+u9wHLqKBb15j4PHqJoHwF0SsbD1FA
	0+SfPB9E/K730dRBI5/ZaFGWQKJQZzc75jtLUw7eypHPNIrj58C2anOAoEgmapTr
	VxH5gxon9uwaoZjVilUYyBa/uYULDxZsFzIrPAMYRSlD9jadWzNh6zW7CccPk03U
	GfkuOPQ6XrTtnboEZV2MZ14nob0dGu1hFIlNz4/EOUaEBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p40q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:19:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943e8ff02d0so79083185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793377193; x=1793981993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=em7nwsBvfkjrmGxpt9MT8h8i0Wxrvo6KZRBsSUc4l0w=;
        b=Q7h4hYvzLOm7FJg5o4lcC6mwrfoVcJ2k5uX7U0uRMq1aF28lblN0W4ognMaRhPovJl
         ruMRuoRNp4jINI7jsaZ+XQlxokDFrOAkshPYFj7+OB9Dvsn923YscxYXXE+3mLfa62aT
         A4FQL4ZxIdnbELebv4lFaWwZIpqonEiSRWsZxxsgvr+4z8yw0vpxBfFK4QmoSgkW6RJP
         EP/UCc364aJP665F1BXJEq75Me/laViyAOX0nMQC7waohl67+XB2BV9XmoC5ic4H7prD
         Q2O4l0u93cs5o/fT8Ctu/9AWolJPeqOgjtZAE4CN9hDlvplt6oiKnjtE/aWH+KEiVJNQ
         53gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377193; x=1793981993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=em7nwsBvfkjrmGxpt9MT8h8i0Wxrvo6KZRBsSUc4l0w=;
        b=sGEsbylavZQ7tK49eIj3GaP/5gtOEsj04klOMN0jSycO9CIfPYzQIFh7ARjgona9me
         MaJFKHQOS4qIktlT75+YJ6cKPKkbNkmLgFydrweyCbnwFqsT2Tt0CCmB/2+cep1Sr4Xu
         f3eEUJ0EOnQ+nuSz9s4qtevy6YaxqhwqdIio2gR9M8FiPjH1PcyqH1XhQIPM1E+WEP0t
         HAcO0sLtwvnsJSaMFSf0nPR2G13uTw87XfNTG6/eR6E0yqoesqSAjOlW9JF+IpXHNvUV
         c+73pS3f0AJ0leHhBLz+GISeZCVuF0gPU0blhbrS3j5RvlE2kd+oyeEADip71i9TJ4kw
         IrDw==
X-Forwarded-Encrypted: i=1; AKwUvBww49YjtpGE91JMVjSPqj3cnS55k79kYjTd+1FcG9IizGVCr/PafYlqsIW7KXldnLjfHXb1/fOruFxzNNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjy1XiBdrGz35eLUx0gRQxgLYC42XWOUIr/FlUrlJmf07vmBMD
	i54gOR9qm5li2WOH9wtlaWybUEl2yiEr7XUCmPL3u6bgY48If0DLgzyD2N5rJoHWDgvXQz+NTHx
	KbfzBPB870vdoBiR8MhS/8faF2J2qCmjUIUB1Gjl0makRJI3T66JvJLFB6HV0R/z0wKw=
X-Gm-Gg: AYBFou3lx7ZtDbLLWYzbxs/5REg+P2z+wW8RpYRxwxHE73dfnbT5gxufi5lr+HZEhAm
	D6a+k//CJRp/nOuYC9uIk827Fev4P0OogYEdk00u/yjIf05fmTZ5IjL7BXCeON8fCtsFAO9qhOa
	UKbmU8GH1Ip7Xa84U34/5YkMmrl4ALS7Yl4XdLrqfdhJPCD3kChSLMRY5O8rSKNk4nwY4UfLstS
	qBZwrCrJql6P1dOZT36HV8IDhwqe/vncWfS/fhmYo3heaREiFGeMFC0rG9tt7b1e9izx5dfeyPZ
	usMMCsfrCf+4JZuyY+fLSpFplgHbvzyVYCN0kujpijTiceAgWXFfXYvXRD20buEQ8zq3nEKPvgp
	UqpUogFmjN0Cwe9pLlqt375aQqb34ksvqkS6Rjocc4ikA/eIYTR0UFf8ZrrtjAqGM
X-Received: by 2002:a05:620a:28c6:b0:93c:ba88:cd65 with SMTP id af79cd13be357-94421542269mr462071685a.7.1793377192937;
        Fri, 30 Oct 2026 09:19:52 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:93c:ba88:cd65 with SMTP id af79cd13be357-94421542269mr462065885a.7.1793377192292;
        Fri, 30 Oct 2026 09:19:52 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9ee537sm126104a12.10.2026.10.30.09.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:19:51 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:19:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Mark USB controllers as dma-coherent
Message-ID: <3mxenh7tqbblbipiybfjfgbm3zboui7gnzw47ondqet2pjvwo6@55xlnjgmop5y>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NCBTYWx0ZWRfX2xzsKqRuGTIc
 azMJqbPGoZd/HDPZeR4CxZBSQijK/DLCv3EklHbpQHQpo+cSEGydbXZjbd/PxVr1wUKBYms68g9
 LFYrpKuQYT80uN48zGIrL+aNpQ0amDsP8qeBw5kxXD6Vk1y7A29gGY+33es888b+FuX7xT+HexO
 8GXs02pxB9NAEY/Tz9noOzATNY/OVRYOgyj4yzrz0uWt1q3WnGQxsjf7cjZJji5uT4xTUFYvLQl
 SqdpQqUm2SmpdLuSojOGbrGZpWF6M0qsps36qD3X6rFT2tLka0BMCjdRwVsuBtT3gvH5Zuaqzyw
 SHGptZ2Xiic6zsMjnPKPdaaR8AW1POckt3192z8uLtrkuponOcGM9NoUT2JBRjGbBTR6fmBXwXI
 Z8jfPixFp2SWHQcfxAypSovLDhzA90EX5eS7wslBoNupGXj9a8/vBa04tI0YjYo5HBsEz/EHpA8
 OWRY7J5Zz4nScC5Sq8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NCBTYWx0ZWRfX3kRzOvE/aHyd
 oz+hQMi3RZ92l8uJc2LOiesmJcITFhxE/eI6UPWMGDA+sjBKZj9srLtfHudqWelt49LYMn9XxwA
 3XC81oNhPsaV79a9Vrs0NJ3l/QQv1DY=
X-Proofpoint-ORIG-GUID: Xk3LhGq1Rf3SoyXzn0L-giBLT-KveYRL
X-Proofpoint-GUID: Xk3LhGq1Rf3SoyXzn0L-giBLT-KveYRL
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4c3a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=q5fyLHn3ZVvuh8gySswA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300064

On 26-10-30 00:03:37, Krishna Kurapati wrote:
> The USB controllers on some platforms are DMA coherent but that property
> is not marked in DT. Fix it up.
> 
> This series has only been compile tested.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Entire series looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
