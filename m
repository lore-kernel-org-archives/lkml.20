Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421581;
	b=wgVt/yubI2ddpbyiOLZOZnWi3Nm2D82S4gk+DJq4mJD8+3usovVJ1lDAjHPQDgkddSH4
	 jCMeq0+YQCAERu6sZQ1Yz+H9Q45IDEbM3FMljFHWDn0nF5JSa0T/GSmNYTTzsnuczV09r
	 D9zK3RW/RXK2sViVgF5GyM+MhnfIOA3+8W+ivUZwecjJOo3zdCe/pve9IrrYo2gsXaWKU
	 mVQEfH6yGNpQSodXXjcgsku2XltI9JIA/VTwEmvTJfeOrShyzjOuEpfUpOh+1ZsleUyBw
	 3UeuJB0xbLK5v+hr4n9YRpGTu4AJLcUjawcJJFtCBB/Uj27kiI8BCWJ816dDwcT+vZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421581;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
	b=uPR5FtwTH3Kv/yOUGYrtNmn/2nUqNMM+3dGOHkcPZLMYiGJum37+Ey+7HqzxzSrE0uoR
	 v6VmBvHieP5Ab7DPjFMSL/1pNVSF+jQzMyyhEyqY2z+EvAh5/xTDW25+8JAqgdVpXxsEt
	 p2qi9gh2UQluT4svxA5eF5ZZKmg6Os7pEqW5BgfffCeifOmMueGpeJ5wO0byJUC1d8ycM
	 OXx+gUCirP/aRBhyfJkc9JTUVbOX2Dn6x3WmKN7e7VWGtMOblYgyjJbRRKgJPGXGnfdJ8
	 0VjJh7FhdAIRL7qZ2/laG5WG6bMJGSOheH0lEecCqijI36CWBOHIw3zRL2TJ9enLYrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pptyslek;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP+22tCe;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DCB606AAC5
	for <linux-kernel.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pptyslek;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP+22tCe
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB4E3FDC18
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421580; cv=none; b=hmOvIpzA0cCcuRphmE2jDN2ZiAV046sKuj4+n33MdXPdcqFHHhKn9/n0UvXW4bc899RD36kXOkGARZ1TLaGOSqjQou9RcslLzzUaGQ6VagOyoB3O8rTaeaSZQL+PQ5RkC7pf9lcZp5dJMUCSoH7he3PMT1SQL4qj4uHv06c/4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421580; c=relaxed/simple;
	bh=Q8ELXF6LLbtqADEm3zzC52Pu10rc3XpBpK4nD5ZwOqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qoDZUJ3kJ7pMj3bi9iwKnG+9ui0PNlYlKU7ndmNCulS4f29xwWo+OTQXxihG0QYGj8PbF1OdFSu1OAqBjIQqBxw+HsGndBlUSy/DDwF+lY6qYu6J/7j4aBh4To0x7CQi/PGcW4pPOwlc1a1CCV9o9mg1X5eBFKDFWb+8efVKvvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pptyslek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP+22tCe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Tbr2774392
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=; b=Pptyslek4ttLiH5m
	QQHolh96lkqa5dPpnl2zIbUN3kvq6bimL1s4DNm1dlnyH/0sZcX4KF+RHNiH1m1j
	rUusEkRTyh3ZrSGbYObcBDDDiYINkGr/ciZ47ih2biuwHBVgJMtTpCbJi/OZIz8e
	g7YFqFwIkJqlHbzwVxk5EnaEdH86nUgvSWNKjVC7U+u84ffDstcwA7hiA7Jbuubg
	/DrgcdXgMkjFt7Nz32G1s6clnRTtgwtROq4IoIHIWizxKJVsXH1cAI97XZl8pYoF
	xVQqD7aiGnQaOcpq6kxo3XDpx4n0OfkZLv3JjD+jh/UpmkxtR0+J8ij+QYgb0mob
	6CkQOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur3bd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:52:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so60063385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421578; x=1793026378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
        b=UP+22tCeXsHmvSoohOKJedsC+lnLk3AzOE0gsVg0VTMaftWiE9Jpchujxo5Q7RfhQ9
         1guYbcqKA0yjFJ4wx/2j8CPYQNO5XjPVX/kEz+Ac2hPhuxqnViWLIfEoENzcxYPGCUDl
         26tg6vAJXg7N4oGa6m5GQREDqfmQ1qAwA2oOt+ZvWTs5kNrXPIne/T/WNtsWKUWk7k/E
         2At610cfYw/qSTLuWvoVGeXNN3Sq4QLOW5a5HAm4WrD+vcptF3+ySpL6qbhlRNPU7JDx
         oLL2zFlj6QzEag3MhO2m7I3bfRKBS2EB/SIi0mar5dq90C8nPFsgazrB27RQYNXk2NVZ
         HQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421578; x=1793026378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmP7mf1aTtakbEsKRgYC+LPlie1PGuRE+ut6DuR3Cd0=;
        b=2N3WzmzcUj0jHJ85K4K3uzUVJ07MaqSL9rNUe/ZvQ+HxXGrnM+ciSydZIZSSYDINr1
         ooSJgVG/zjYxnm9qeWF3t4lDPpXtV1W0yEoKPwcTaEAMOLqCD7Dr96tIQNIZJwRaHvrL
         C0f4KKhL4nkz6KuNPbPzlfdY4FUoktzCXcRCV5nHxC1z8RAou12Bxa0xHDmiSR6Qm9U8
         Tqzdzv+eVoiHEdq8g5Mthhv/h4XqCKHLKXOtqcLnL3Fi9FPHGkxN7MXBpXaIQi+tPiuO
         bbulHXds/jVpybMAe8i1LgBK7d00ZbwkY4ors+/gFQn0MPaSHrXTrHHQc1e8iN2EKbOG
         7bYQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9kZ2KnTPRpBsMjLSjqOHEE1eSPltC955bo7nsC7tZuDrg25BtXQnsgTkiSLSrfsrFndyNNm/hTs2H/xk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3n8Btk+5TrlvKeTEbnshsNrpSdD0w6GMdNpEDIsj7iR9j8oFc
	NnkHtlI21hTUR2isXbjoKOLd1Ogzp2UmUvb8DXHh+rxCPlnbpd9mLd5Mu0IATiR9luPiUfTlxzj
	imV3zX1stUIjThS6BGGlc/BFg9xLcRcYDVCdzWxGBU8HLs2kUzcwodQ8eBYUWxmsDu6U=
X-Gm-Gg: AYBFou0fFL4c5cSnrz+bNSYqoJn62uq0XF1CWfJQ332qarZmFSQLqp5na37pQIwyToW
	qLMfQdfhhZ1Zf8LRTdFYuBBS4P9rXai5N+4t/5tTOLJHrQEwECuR0oP9zlwdBGjy4BDhuxPLT+C
	7VFCgjVY7ughHmXOwhJT8+BBX67F0EXuXHdLqO57Cho3BhC68CH27mNpxlZeIPgSNcSpyTemOar
	L1/g3abTLYz6mm4b4rYy+NKsxGkMyRd0y/ZEWdF803lHJOWk9woXVccJu7EjTxDuew5Vffd915x
	fz//VMhWqPofk6lJ9G2Y1AftynrJbqX37m2EUi7WqErYaJyTfjArO6up4YLKNxyHb0u7J0agTIE
	YtMKIj5qqHCeiji+Id44OfQ==
X-Received: by 2002:a05:620a:711b:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f29e15e32mr1459383785a.6.1792421578040;
        Mon, 19 Oct 2026 07:52:58 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f29e15e32mr1459376185a.6.1792421577483;
        Mon, 19 Oct 2026 07:52:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380967066b.11.2026.10.19.07.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:52:56 -0700 (PDT)
Message-ID: <a334b115-6fac-4417-b6da-fd0a2e5fc43d@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:52:55 +0200
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
Subject: Re: [PATCH v4 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX1fS+ucEQOuB+
 6NcXgg5wr576TsmuFFZEVsXBfXj2lbOAwe2P5/N2vj4/O8i9OgFjfpH98xocRvbfha+jFoFo+RO
 MYHHqfVDgqJ6whT1Yeqeb+bS5xOWvnQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX9Poc9nj5P8Kg
 koo+/iSFMMI3vpU+tP+Isbq6PFH8QOxZfnHb0UF42QzQ7Baxc7q0D01Er/f7qgoxorWymeID8qf
 q73Ae5/n8Lbl59eReBIsKHcfJOjbg3lwQIHgbfncw4eQQZaWIy0xXOBNDRDscr1drL6kR0+czPr
 GamMJLKEoEfe8UyB5YHKiR5oFXz2K5qulwLb5ixfV/Zp3+kfhk7G03Cg3ZY72IN8R/VW1NZg60J
 2JtRWtQVq2Re61ITXJEUU54wN4v99I5Ulk1aRQmTEVSwnwde8NU6XtM/jmpgEkcYwWvgeapEbzc
 Fm7NgZcC95Sbn1/aDjqFJabBd+DZA8hHsqLczKHE2yM+34zADkrzdzi7BGyG3kDbYnhglxXGoZZ
 HC+UVllejn9/xrmlS0ICgiwzrTHbhWo16SPQGmOr+8ewhjHpBApPsrIRmkzgTpNDJ7/15SkdiHX
 I5uO6atx5pWdFUUXh8A==
X-Proofpoint-ORIG-GUID: NuXetFDIX_bXiUfgCVTHOK9QQjqkgMzC
X-Proofpoint-GUID: NuXetFDIX_bXiUfgCVTHOK9QQjqkgMzC
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad62eca cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550ba-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
