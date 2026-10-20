Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482064;
	b=BBFK5NwDFgRz7cJRsxr51lsyomBeo2588TWdGsDdaQ2CHZar6fCrBw33JbJQHRMSTjke
	 Xlk/6ZtxghVRp2myLVKu2kbjPv/M4YLJyfDrSi6ErXEOB4zHwPt5FH7Ia9ojgvmyqpR6H
	 sB5M3dOCLXao3GbH+BW15WVnG55m7LspgJj1YBWGY3mVLRRI0OAU7tNbQWUJtDRQkkT6P
	 /ktI3bngL8YWAJWuYlIGoKpOQeHsLVicWwo8fg6EFSFjk653CbSASoLBDo7mGr8XJOrHB
	 ZIMPk/zQPn23/3aZ4XP9SUjja4yL3y5Cv1u/rhnhF1U3E3/jtMejPDdqJ+rARe9kVVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cp1Y8xvBrewZXXFxU4t9Ix6XbCVRlU6BMPwpq9aQl7A=;
	b=wUgSfHPZS8sNwgp3f7jH6m90/9N+QegUdR2ysRXr9jBtOEAP+A5DFuB5sPSqMAmumrHA
	 f0XL4SKuE8xAHR9lgBYMXqxJKo/Ct5neP3+3GmOloS5sAPQFuXpsVQ6LGAVgBbCSpGsTL
	 VsKUKW6cTRFA7XIKrjzM9ppoEFx3xOeS3uMAKB9c+RMssDqcMMT4aDyx/AfqvizRP8Gma
	 dKub5shrYl35wufzFQYCgni0C4mGBh+CCBA0ei/cvk/R2F0nuS3eEkCufS1+NNDXo1qPc
	 JSOWyCj9C9tahp6fHn/RFpR7OfTXcXaH5nR7mv6ExqkzGom3RXxLHCCVnVewxKYPGlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MaH755m+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MMcLl7FV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F45606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F45606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MaH755m+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MMcLl7FV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tAg8186182
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cp1Y8xvBrewZXXFxU4t9Ix6XbCVRlU6BMPwpq9aQl7A=; b=MaH755m+J3aEMTH+
	PCxxT72diq2tT11z6JtY3r4IixHNeqlOVpN8FL0r/Vplgxek5zVIVyCT1B75TrYw
	Hk7z4linNXb8fESvkTT3stNJ1Z3FUqi32CcSj9tf9OgNswHoxfvtl01SWReucujX
	s5CL2FpWoSgRmwvt/qCUK0GUaX2pmlhAp7W/rdnlQQwtVgAGg9Z8vD/7Uyqy+vOD
	C/kpja4oV5nYoLrq8Yp64KCeqjJ5OvCWbaeN8yiILhyF4IIWk95dJ30wHkpr0abW
	POLu82aaM81+fMIzFx4KLsLGqftr4b6gyeGWZm7v6ckUN1+FN3l647lkdt+w8+WC
	IkbdDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsefe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93df7a9466bso44008785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482062; x=1793086862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cp1Y8xvBrewZXXFxU4t9Ix6XbCVRlU6BMPwpq9aQl7A=;
        b=MMcLl7FVbgkcNgibqy4w9ZJZ0SIvfk/Ig2s5LcO26HqwkZnVW+5KAIV5iZK005GOJv
         K0szqBVIuNpQKPX9MbsyVPckJAlSCWX3IYCr7MVbPYKeWJ3dsH7FtbKrvo2bQsW3J2N+
         IgTRm+EsfqUuK5ylXENiVczpZO5gyY2MsshLjl+NeD4h+B1JKPAd279UZJTNTuZY/wxX
         u9QMtw2Xt1+EkeVg8y20RsiYzZPG0N43fo88p4aHkE8uzi4tLna3bRY+aOjNynvR47ua
         f/vFpP0KQW8D+VYtfhCmplA8+DU35YtjM2dU7KfcjfulZrzqo1pk30Aubm5wEf5xk3Bp
         MZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482062; x=1793086862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cp1Y8xvBrewZXXFxU4t9Ix6XbCVRlU6BMPwpq9aQl7A=;
        b=epkVd84GXcAs/FAE8edHr4q59vVHZ05CrvpUG1CiRRAMcWGWgMTdW1Ssn4nUAWvexw
         gnirUNHKJw08+TDMwxe5QDg4O2FPwzmZPtdv+sHbM6x7bR2ZgtkG5MLdhbUBAEG2djzs
         V3bypGn6gPU/1+eN37YnGtWltME4J5mi6UbRBSVWFlBdDJiAMW8MdNT+Jn+awa0ysa30
         tikALuOnKCO1/gDYGSZbA3uw6fkRHaK2tWylC7PPMctfBzYfDwo5rs40jVetaeBHl1yq
         2+uJhO3nKjt4hel360ZAtuxyIl1sowjKVl1twVo+baVuuIXStF95+2YD2+sZfAcP+fnm
         c74Q==
X-Forwarded-Encrypted: i=1; AKwUvByf2fKSPyFfKhTNzAgWSTfeIVl5S+zioiJqhRYSn3SoS9nT3t9zkv4B6OyZnscCdrwfsr9fuYO9ZmFQofA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7dIUJV0IF55gGYIzvSVTrSaGwFYgmgHuLrQKXt3uHCk51WeMH
	uxNkPXdkFwVukXP8Ls1FuR+wLY3jWVypMKJ5bmg9GETbuiqEdhHADicvoj9Ou3dFG5u6j4JIrry
	jJq3/w8qqt+TdEzdPUK8nj1d2tWgTH/oTZGY9/Ht1Hl+6bm/73b8lrdQ+8YJmrPO4G38=
X-Gm-Gg: AYBFou39UqaOPk1/9kavbKA++Jd3nVk8yMjFw046JQ7JuJI1SzZ2ZMSVOI9kKy5EE5b
	DPnMhYSbQEW6AM8Wc0CJRMYEOyQ2adV3q/W8DEb97lvW3ITF7NezSxHx+viT6e1fWOQ0e3rz+7O
	COuRd1U5f/VgJSA8b6v3QNuTNYz+cOYgqTsrGUDuHefz++Ni6Iy0aamnJQSxgKsjIvVsVwbsYck
	gq9xnr02hgTBFa5ZykNW6xnC4l4vR45wqegV173cgfvqNZfS9NNzX/p/evIk3fFSCusp4FCUZHP
	2uBMXVmihN3PnRJmlypmbZjUKhApuDrGG/YSl706QCDv2GUrLquPgSmrr4akKaEKxNWawGX7gVa
	8r+T+X3wujYMDnZ0SRoXRmA==
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr465668185a.5.1792482062343;
        Tue, 20 Oct 2026 00:41:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr465666385a.5.1792482061925;
        Tue, 20 Oct 2026 00:41:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c42a3f4eaa0sm287773166b.0.2026.10.20.00.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:41:01 -0700 (PDT)
Message-ID: <ec59632a-d923-4247-975c-7ab9e23c739c@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:41:00 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: use
 'ipq0518' prefix for dts
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
 <20261007-tplink-ax55-v1-ipq0518-v1-3-0ef058756596@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-3-0ef058756596@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Q3oXGUdaF4dpwdJRR4T0jlXPx_dGGvaX
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad71b0f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pyv2_bVU4k4AM6XG6ZMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Q3oXGUdaF4dpwdJRR4T0jlXPx_dGGvaX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX9qburW7jOpbV
 kPAQuqHW9kNK08syPyUUQXz8Hw+uAn0gnWbn3sr+mZ69jFhqjEyJ3WeILwKwVQlrXqMdnxhKpN8
 d/iQPLSWTz0SoY0/UbZgaTJlv6tVCvQCPwlx1sx9Bc05a0Lb3wwsmEwqebsU1VV8JBO+4okoKQd
 jX2I+jSdAyqJWXlw3L5LiAriDKS3zF3Q9VFecxAHhHvwbhryn3aOWxiO1PozCOjRr7M0MYZxDb0
 G3j0BdrStKAl10J4CIJyIo/xZLWhbe/y3lXZasZd4kzRnQoqBd2pZD6xXMxxDQRkfqwYYQiGuwJ
 yb/0c0xlZXeo3UiH4XVE23F2AdWd3ht27Ook3P5wgPAQuW++0dlYqkI4qpwuExx/qNsJPHu7rtf
 czIZ+ZkC/TbM14foB73gzjowU1Qp/81zaJgjvv7nbuUgine1sfcgs2T5UuT50IPKm+2Z/fVeT0A
 W8/CLYfkloP7ljhwryA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX4DErj775KzNy
 O15ed1/Yd4BAqAoboVHAwFP4l9DYxUriCPFF8Wkjm3tK7kaWtP/W67QbxX3Uoj1Wu5ZjFu2f99/
 WWaJ0Z1ZOs5gzcmWnFbTJEMS6+qNsu0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

On 10/7/26 6:59 PM, Gabor Juhos wrote:
> The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC.
> Change the prefix of the board dts to reflect that.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

I hope this doesn't break any of your workflows

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
