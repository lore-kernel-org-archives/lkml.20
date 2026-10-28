Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176271;
	b=j7+3dgU9oOOeNsCoHIlHqtVHVofQbtvR0OcK1QidiCEiUpytiO7z52GrslxcinKGme3P
	 ONYgCQVUBxriO4umxe6StIjAmugoy9xeGI4MDobxzqiOP4CE+4g4Yzuv56Xei4axjGR7V
	 hMvd+5voIvkhm2uWS3tvCAYfMdiXM7XAFhAA96ibx2vc4O8giViyvxTNohKcAtS7DeknL
	 U7eJ6IGFZeJAW2FAuvmwpWCufFNdXibu/C+uC5JY3vlfU9pfEHeyq2Ce5CQqOhdKWratd
	 qY7ro8jJuAIY+amCKq97BMTUw3qIzs1oXMng3C5FcjTpXTLphidWnvZlyYO/A6ALEqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QnQhTQHrbekA/oQF/OOz+TgY17TbI7NZlDDcN7iFa40=;
	b=5D7D/ZRQUKE6XWN4/HFAPbQqKXoPTSJID34i+VWrlWjH6HjaY3B8rsB1auwRnHl5kUvZ
	 2hgj7GLkgUj/wMzDJmbj7uWKSLZB7tEuNa/T0dENKDcSLWfCldYcX7lwJlI9cJm+l1Xz2
	 pPTnw8Z7D/pwqK3cgP4JVdbTk4xONduOVntRBHiQHDCUdfzBsLUezqS6ODRtYM3rhQ0ob
	 CYQdfoz4NnO3Gl3TDothJhhCqkTxt1URfAI/+bwFt3rwgQiIF48pzyV4R6c0wDJHUhgzu
	 vBx782iEcpau4OP0YVZG5iv+BLApfsgQABj8Gp2Se8Gx+VetnLESgXvn4hZJ3g1yhUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XsCqMjeO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeHY5B5x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F81606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F81606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XsCqMjeO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeHY5B5x
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K6cI612769
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QnQhTQHrbekA/oQF/OOz+TgY17TbI7NZlDDcN7iFa40=; b=XsCqMjeOARE/Q/fF
	OyY9vTZM6fyCJPBHbBoSATGQoMm036lb53QSYxuj2w1mJhX7tsfHpHnR9PbE3jlt
	2+dMNaf4l+6HztixPmOymiK6lhoEBK4565lHg2QkSILOyQaSuhuFHTkuVf1kOgNT
	6Ija4ud/vzR5ZpJDe2snXqQtfSyxeLJhM0dEFEwMoJPItH+uetJYCdkZ/cZe9Ade
	A479OOrfZIQZmo3V2PUs2B8W7XW0kBoyswSI/IfvHsXH0+47ExcyQi1Z5QvMSIgy
	hUhxnhiHWYbSshrm2QUJJvt8MRlNefwiZljMH9j976s0OJfvEPcdSu+cbqNX2t1E
	5aynyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw8ftg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:31:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so137740385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793176269; x=1793781069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QnQhTQHrbekA/oQF/OOz+TgY17TbI7NZlDDcN7iFa40=;
        b=NeHY5B5xxt/Z7D14ESXS2lzRaoxH+WXgHOyeUUi1CkK5VMsoO46u32dw39KasLx8Us
         mGSNGPT6fIMpRVN59iuc6dBCxv38W/OAlK52ESl1V3q2LOBPE5X450Ip58/9dOJxtgZP
         WkIca9yN7n3ip438akaVnbkyr6GhDAjaB4qoGormW9pdXHMH+azJOfOEolYbkiMWi3DF
         kywsk1qmMvmsDv87vyqOnil9/jFKbbwBnskvXDisdC+yDI7n9VvVV+OrSKvD+wyvegXT
         eDV4HJ+rSEBalj/x/+5OfLJzQY0k0wrReB4k67qCjWvOizZL03TfVNDgwwYzmogn2H0H
         YAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793176269; x=1793781069;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QnQhTQHrbekA/oQF/OOz+TgY17TbI7NZlDDcN7iFa40=;
        b=ftAeQ+tIAATlFlYqTDzVe2S/byT9uQpii7WS+X+R5R+vNmgMpgLL9AkOsGfMoFQZlc
         X+OwBKImpHEs9CqwqJ7qp2JPs65/NjVXa1FzvFuqaF3yLTw1wg+ZpTPt6eWkHH8DTRbY
         efuIYJYXgGrIU3+mWmarm5TUGZUs0lAajNWtP62KTt+USrlcXSrBs2qFtxu6jYqubOuX
         D4aIglw5O+2AHyu09jKA4MzbhTHMO5mS5gsGk0oZSN/16Z9njAz2J8i7D1SdmIBjZfab
         zZOivCzIXAB36Alr+vNTBkrYDyuM/vhrG6pU2ngOdAGux/RkPcIyWS9RQJA81Zl3t4fv
         10Ig==
X-Gm-Message-State: AFq9FYLen8RL/u94Gy73ohnLLWD5RKk3OG5bmB1erzD06yaXHAdwRqre
	VEXKwQywFs2cITsUHU9BILox6RmxCvjAWivp7OZTen6aXVqlv1GZf+CldgTgt2cP7CFjYHrAcnh
	741Y0SE2YCidKGVmNK3Wx5uVxrnjDHxYpLe/SBRVHW7rqjspPKr1evzfbd1mOnqFxng+yzZaRrt
	U=
X-Gm-Gg: AYBFou0CfO3z9X6PLGzSg+Goifm3laStHYc5iEulR/D5v6XyKqLOBdALYSN7OAi+iu4
	od1KV5ArlQoQzAOY2FjsPCgKboK5dZtyS+/fVPtrl1p1BgOImLuiJXMWEy0mxIE/2gL3vFVymkV
	jm9i0KEz6ePFdfLpf9NghLI6Iy/a2+2Xz9Ep1dsW/pPkFiAlVUDOe8zThGPc+E5gwDd1tMuG/f2
	bPSukhwZqtWnIJG/W5ny0WNGWCBkCysF0SIXEXi1ha7wJdhvN2orNS5SAli4Tz2XluCr25sbQJ6
	kcXIo5VOBHeKpRHcWHrwJxlh7qtEh+jDWL/ac0eHgxgcoRiUocsa0orZj1YLc4jOmIjMfQjIGVM
	NW9dcNgsJg6SyIAQAUUMeZUrtK1u/2K6DiqoyL0daPnSqaSVZAg/u6bp+IPZx580/xeUy41xez0
	pC
X-Received: by 2002:a05:620a:8012:b0:93f:43a4:a47e with SMTP id af79cd13be357-94408d471e7mr193358985a.43.1793176268904;
        Wed, 28 Oct 2026 01:31:08 -0700 (PDT)
X-Received: by 2002:a05:620a:8012:b0:93f:43a4:a47e with SMTP id af79cd13be357-94408d471e7mr193355885a.43.1793176268405;
        Wed, 28 Oct 2026 01:31:08 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4115f496sm26025018f8f.5.2026.10.28.01.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:31:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: kunit: add .kunitconfig
Date: Wed, 28 Oct 2026 09:31:05 +0100
Message-ID: <179317626360.6323.17510769245727251131.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023-gpio-kunitconfig-v1-1-0dde8d430f20@oss.qualcomm.com>
References: <20261023-gpio-kunitconfig-v1-1-0dde8d430f20@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ukok6H303BFqU6RqFiztEPfPkFs0lpAN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX8bYHO2gwomMM
 +hwlwOenp7ROAwuVQwgEWW8eCANK3uK4TXfgwpY04zcLukcDF1fJxNv2R3Ufy4RoTbSw+qi1Xj0
 Sc5bl+tphCT6jRWMqrGCSp1mvrVbBRQ=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1b2cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Ra0splB78y1o-YdHdy0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ukok6H303BFqU6RqFiztEPfPkFs0lpAN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfXw18IP31LBQvX
 /D/s4yriiD30H0duPHOIZlsw3cbagrALfpoS0pPwQ/PUg45iZKA/6AZx8ZTpSu6thKAzJOLIp69
 GVcLAPFCpV3twQL8HV31l+VyUGbwvssnjdWzF192U2LbwKh41hC1sA3p6+TbTIaDwLzAkw+bdbm
 6ANet7vQbZrU3YRc9RD2/iLJVVymLoCqRcChub06COOYwYgislqUTnsQxXshoY3YbzWVhtOP9PP
 4Vg2tI5QCR2erwyTQzr0rcfZ0mkLLiiet8QuA6tRbz3zJNz/i876n+2PMoIltYd+48OuCe5Kln9
 JybqHJ0JFL1vRlJGGJ9MhrxWRB3qOvPpBPI6xw/86JKEUF3r3mFI64DSOv5gNcU7nlTr+CEPfPg
 B3mCSAtVonqp0JyqwiZnYmY/9IvpmyJifeac4O8x9Y5p4BzvCbXXZ5Q/Hr/hRT4E6NKEvvA13zF
 RVvIW3+sUwWpteiebQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280033


On Fri, 23 Oct 2026 11:53:16 +0200, Bartosz Golaszewski wrote:
> Add the Kconfig fragment allowing to run GPIO kunit tests with kunit.py.
> 
> 

Applied, thanks!

[1/1] gpio: kunit: add .kunitconfig
      https://git.kernel.org/brgl/c/5100ab706694eb55ea9220891f4e1b0b4121925e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
