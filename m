Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE4E527582
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688033; cv=none; b=TPf//z49K1Hq6HPxuAvPwtYvongd4jhsb175BMSEOd4YhTmi140ugn2lOR9wuDd234MYejLOcoArTaCD//MM1bhj8RV4wuTrdS905w/jbRK+7+Sc4L/5/3gH1rQzhN0oxHXLmgRWdA6rH15FG7/wsmC93j7hi9zT/S64m7kyRo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688033; c=relaxed/simple;
	bh=32Y3KM5bCP1SDuaXQ/j9zM68Tajy2ksHRzCJwpZJBxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqQ85t2DWOofQM0FoHg/8JnMGf6op10ld3vV3S5P/ctltnu5ivc76uHU1M+C1rpzOVAa+rb7GQRH9A2eV1hTjRSghfzKIBJD9d3wwyZy0r8pLmfP+85+flQyqysZeRdQKgJ99tLzn0iAOM9CK2r7CBufLt2LCwlSUfx4emkBsGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cp/W5y/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyrlQr9D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cp/W5y/o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyrlQr9D"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCrYtS1479313
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2T5RkWVrZxsjtjTmZsWjGyBA
	n0522HCwfBHwVcNib0U=; b=Cp/W5y/o/+r6C9nXhvcXSn/xELYr389Kp79ZmxpG
	2NuxYC2uWb3p4qnbwPzT9BaoPfJI6QJ86QPZUdWbHY8+CXI9EOBx0DosSa3FFGPp
	MCogYlNViyzj8W2bhLfan3joyFqF+yFUoISr/VUpl/RGAi0Y4RtQQJNADArUvzhy
	dq/1yoUcTbw5wCW3wuV20yx5ur0F1GSUTkB8QC0Iug4Q3tVQpt2J341kSeiGUEl0
	13+PVopSgwLyNDyRwv4f5Oku8S7emz+aoURwVpSzUl7kZ1UCw0e8guoUjHkhuxLx
	q6RtxJlTFRkezp25r7t/eeQWMkgtpPy5BcrJlb/XnLUa0Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03m7mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:20:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b3cd4ce08fso497383137.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688029; x=1791292829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=fyrlQr9DW4UYSXutxL0alABk0SWZkkD/q9WRzIRJWwkC2syBOsksAluOKYFTNiZDpl
         w1HZhsNvyNZcX4+T60zSwUo+qvOeq2KU47SJvXNSFccEDkEmlmdzcm4YnikVuxSEjIV2
         FHSYyRiCfYbCZURWk9bAqiHPhmKGnl8W1+QRdepEymd9Z7isFgh+dAmAZmF9IGUMxn8K
         lh1qYiMjlcNJE5BBGwjvm9USa/a9U9YDe9ZGaB1RhzJmD50nzfwfcH49+oWqO3xKLW8t
         WOZOgbutr3eyP/NYWnoSxp2extLeNx6yeeaH9sgHtq8gN7qhORpKur64TV6KjklHDJtb
         cw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688029; x=1791292829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=mZYy0zWfYS/YNjCOIpSLD0Ddzj/i3HL8yj6TGFd8qnl6AmL1UU/4arj+wXersZ3piI
         L/cGaEjr1sKK2P4vIQ6uKOw+4LZJHldTuy1aEguutZxJliOuNRLFovIrHJmmAXdn3In/
         TJq+gfzVlpIHHLt0F571aRRKvfKDyWJK/FRBDsek20RgG21bLvIJEVp5diUv2Dku9bXa
         tQzVi49Xa73gkiqgYNxokkDO3rHg1sakB+/pJCQt37CDBptcEtnL0kdfvRqtfzlkhjIq
         JSMoOIIetgT2+PXLY+y/cYzCTJLY8YFGfKZnWvcOV88sEPU/u6Rd039TCeCVGyRjXJsW
         IgoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy841ZZ2RS7jTIXG9zndnSO0W+SJqEt91l9TID/UvJNb/OpilRlwGJernatabQe6LWfgf1VJp4SVsrR0i8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb0ZJLIlgbnImABFkRwJvtcdT3dBh89lDmYCIA1QGb3HOqFa5x
	EW51L9gN5KDrpguXuy/F3T2J16EULZ3es7im+/zlFOsdlfCVDBYt3G9etdyVzCGIKWt7B/+eGB/
	sV568ec8IAe81FBqiFMByfDA6SgbnBmaMkl81/tThcB3wYHBkUMw+CWqytDXPKBpcG3c=
X-Gm-Gg: AYBFou2eor6TIyDpWt/OOAszZvKzC76freYnChzhgKHJtSD8DCczjCT0JRkA3c+DFkG
	iYHhwBasD4Usy9i6LGq2Ay23tM6E5fvVXK/YeOa0/dGAdjIW1LsDDwYElGKcIiPE3Q3lpos2UKL
	tM4SHNKJkfb7n91yJO9Joke3yT6Jn5H0qggLGx18xtTn/UaR5DfpFtcBjZrlmerW8Ne85cXEkJR
	Q/REgiZmgoSrIVp6etcBRT+FIRpEY3wXtX+AKs0AvxvfR41Eo1wlqi+aYxKjfG68ne/a8KJtDPX
	xMPoI/YBrQ8mlo5dDmvclT6BWl7jMm9jZUPn308T6AKfTzQU0npN50gE+N4FbsuUKBT1vZ5oz/n
	7bbnqupRpdUslPlY=
X-Received: by 2002:a05:6102:4186:b0:7b5:7cd5:2a1b with SMTP id ada2fe7eead31-7b57cd52fccmr1747276137.10.1790688029345;
        Tue, 29 Sep 2026 06:20:29 -0700 (PDT)
X-Received: by 2002:a05:6102:4186:b0:7b5:7cd5:2a1b with SMTP id ada2fe7eead31-7b57cd52fccmr1747265137.10.1790688028694;
        Tue, 29 Sep 2026 06:20:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec770sm82731695e9.8.2026.09.29.06.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:20:28 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:20:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Message-ID: <kab7u3u7mtadzvnmknprujtjszdryurwjbwqgyr3aovzobumtu@y43okjkpzupz>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX015N/fyMaq4v
 KEtd+e9B7DL8RO/GrdunupFR6QmDuBNAjJxip16GOsjQ0EZIGFUtzS62ujl011NfoBOxoSA8rW8
 EMZATtjN/OkSTuW+JPbZooRTg5S1wHc=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abbbb1e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=X6Y4kDKz15hUnpVYhMEA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX8QV4DzoDDolj
 w5uIXOVsSyt9ZYHv8DptqhNoL46gdkQCM/vDQpVWvCXEEn2iSOtGW7WO/sYMuFTtL9ny4Kfkn2t
 32IeDCAwwMzHFOqTprF0QLA+nUdnYV6lQ4ovZoEQ0SaYlLnwjXSw0y1CAkiko7jrl2BJtGKqlHC
 gdxVEwHszh6GLQ4gS8jb20nKW9ioWXFeH0kltpDZyTXujAGBSz8l/D5k/fXVuyiR4Woj7RKbzEM
 rDWdq/JIkx9YYplvN2NOa8AvDFOjnwATXXWA5eNtBflWDYMEw9RcDoNEIvBxhq4IDq0SOmh+Ogy
 bn6UjdDZ+D5eVM9KpMIskyeFGYIjKSKMwJkUKbqoy2+uqQHa8vDZWDUob/nNMZXdr1DhB541qpR
 4Z7jsgpgL4KEfGoZ4jU+Im2uPU96T3gimqlPYSn+R59t7N6gIexW7XozLEW5/vmMK2NO00fQsxv
 0Akxd81tUvkklvNdHZg==
X-Proofpoint-GUID: wCG0V5g6dLZylhLsndS3q30ESQjDikiO
X-Proofpoint-ORIG-GUID: wCG0V5g6dLZylhLsndS3q30ESQjDikiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290053

On 26-09-29 18:39:40, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
