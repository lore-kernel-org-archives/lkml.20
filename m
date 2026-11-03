Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724462;
	b=J088VL67jlH2lBrzY1AjIMzAd3JUwFHqRk/RhgsE5N3N6En3KEx+aA5Jd1IXrnWz6sNQ
	 bq5TIBZ2pAOSm8LWGxkr4AUn3jZbaME8nC1jN2iOl5eVLV3++0S1SHD8dlaOI1t+LLO1X
	 14hj/P1q7pd3WF0ZnE/SlWBBJCJnahbnzAe5ISo5NvGOxj0UuCU+2kIlNNnbCGRVORyW8
	 b1l9N0JYRM+WLINBd2jkf3Un4RPaqXC9/+1bQBkWs7ywhXjZYfQu/QWDgASGi7xj9xr+x
	 vhMnaMg8OyooOWufmNUViwPBM92Wo/Si89Epm65qu0bLm+wFIBtly/mKlIa1/8evYQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=;
	b=WPDMWbb8KXbNrYjpE3ehMEn+fj28i/nB2UKZtpCZnXZAJFzcY8ev360mHj/ey7gogJ6o
	 Dw7pZ0tBloqFwY/YJKmF//9hnGzcRCN1L+zIgNYd3jqGMOGfBZ0xHQLFLqAMaDr01ejP2
	 h6F675uwtPyebF0IBRJe9q7D4UgF2ZvbdMFamG3l53POUbhYVztzM9HP+8/IcCm1OYCwV
	 8eoYiIPM0ut+r3tkuKgoD8y3ZtiGrIpPTWa+grihwbsj1EgFpehKyJTBqAkw8m8fH2H8h
	 9zo4DHR+oZCJxYkoDRFkh5XlUZpFG+grgJduWr1o3C44hcpw2b7+iovDUIrmhQpFk7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bhn+6NiQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GustMljW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC23606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC23606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bhn+6NiQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GustMljW
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3G6DVE3337293
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 16:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=; b=bhn+6NiQkuOQKXG6
	XR2m53GsSTThmw+w27tl/BJmR4EFjS0irkF/k1h+e1fkw3OdIxc71YE3cT04Wnq5
	VLq5MfNX2Zogbp1rCP23LJcEhL0EYKx+1dg75LRngxkznojXxPkX9Ig6KJ4cvH5y
	CtETC/QVuj6CgNZt779t3+4DCN11aPXiv5ofMqy4ZZb/PPvQTC/ym35f16EOivP1
	d32nmGAA7DwvnGJmjnDZKSyU6jcP8Mr3liGyA04Hpw5fJaJXGObmClAcSKhSDdfd
	at+XJYYh9vg48qwb/U9YL8+VIUsDNHoX+q7yFDTZTFZWzUnlzhIdPuDcwHfNLbFe
	OiKh0Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubg627-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:47:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so4547724a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793724460; x=1794329260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=;
        b=GustMljW74EyHYAGxYnZJlmz7VB6Z7HF6zWtTvun2Jan967g7FZKW+2SDHqbJnm7iY
         V2wG7rQpR75Et+VAP9DAfCP0cBX3XEH49+ro+fYD9u2SSewjW4hffIUe47m+ujzsq5Gz
         ROEjh6qyBbbEOLAcobLucguM4gaDJjITG/fReHcbEWYnFSo17nuW8VqgPy82rq+KCuvW
         uAj76L10GqPKH9lK5uV9rfm6Kx7NIux3rkW7bG1pu70mQiNEnXcA9VBFjyLnQ2xGZeIw
         jlfTSCe3d/h8M88U4Yozk7tqhJjasfsK0k+XPljafncPrK6FA0T5RZPAEKWN1qCDqGsv
         CTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724460; x=1794329260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Paahz2cu5Q9vlGBYGrknkFs8wYwBWIJPZ66Zms3vNmU=;
        b=VxVZ5b6dz0whQaBhdfAZQQMBQLrgY4V+ib0o75AgUtBTCwr2uy4BJlwDDBE2OXHPTk
         9RYnjUs//gnyKN9olVpGrj9etcBGfIsaMaVLjQzOAeburVsxUjhhIc7wU7Pgc5lO3d4X
         SsA9FrkEguP7jkKC9Z1Nhn2Xv21KMkqxK3jrYAxqQx5fmdEaW4iSRfcrM9t2/GfmNCN5
         Jz3TF5cCrxyD1BIodME865pIHjaZC6mQylfcV0Muia5dmAyS/ibo6Nb/8rI/gkWDRSEF
         IcsafDx/g0V1Lzx+vf2rQ2pr/0uoAvjN70ZRlrlxIRjclOblpU+lWe0qg6yPt0xbcqv6
         XCwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFrfpfoaPzXnycDPy5ddrDdgBaZK2UrNXxA1c5cAbdj1ugfPgPRc1euxv+TJS+71PnYA2KKI8pikosHyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6M7Pmy1Ru9+f7+q8MADaVyXtkUlEkQTXuMilrCrdOQEwGsnWr
	u6dfcEh1qp6wrJj9L+P6mE1Oznf1C2D71bdcx3y6RqFfSfGNJif4nvEFduB7kAzGWuGy2ntcYIV
	8EZMQGN6iaPSwoq5RlH1H4aa2s49Zq+3C2BycWGShvmd1igPmBxuEBAgl+E0jwpTcCCg=
X-Gm-Gg: AYBFou11KNGv1NxTaUzRz/kQgjbXDTYgzA2WddhJasHk/7cbNA0To3HA7mND9fd5vMs
	vQ6MtwcKL677A9d+/Q5zrleOSsbCajnhQD9tH+0zfDoludVLVNWpbfL0zHpt5iKmkkDL2eSKPs8
	xyV9LUF3litspMm/Bd/yjOZP4s1YMNRDrKOwn+mO8HyxvL0f+VNHgdWh0hFgFu7KucLX1eQtpWu
	aJqm0SLeoOcbJGhM43D63ONXIpeBV40TM7k8lf1ZhyfAZFgmEFE6mAS4817WNqzTZfRbCJi7RKs
	tOZgCmwu+RyjqccujYvc6a1NSZvw+oaBfG43Gdh1tamDo8BpR6VAZTlCGANu86hXkFWeM4Qd1sF
	UggPwj5FgQi/zxwHAmwNyKCqcnCLcsYYGX+zrhSDIg4vNCGowMC/ReOKOg+a6QztjNH+aO5N1pb
	Ph
X-Received: by 2002:a05:6a20:9145:b0:3e2:1160:6d20 with SMTP id adf61e73a8af0-3e928a80f31mr13008314637.3.1793724459639;
        Tue, 03 Nov 2026 08:47:39 -0800 (PST)
X-Received: by 2002:a05:6a20:9145:b0:3e2:1160:6d20 with SMTP id adf61e73a8af0-3e928a80f31mr13008297637.3.1793724459204;
        Tue, 03 Nov 2026 08:47:39 -0800 (PST)
Received: from [192.168.1.10] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d3603sm3400303b3a.37.2026.11.03.08.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:47:38 -0800 (PST)
Message-ID: <ef38c950-5fa4-4b57-b97c-8f306b2295e9@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 22:17:29 +0530
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
Subject: Re: [PATCH v12 8/9] arm64: dts: qcom: shikra: Add OPE node
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
 <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
 <zymjeclhd2ezemd6jeujtsu4y3gb26gi2v4vd3gmi7diuaa23m@aqr4blf32t5b>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <zymjeclhd2ezemd6jeujtsu4y3gb26gi2v4vd3gmi7diuaa23m@aqr4blf32t5b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2NiBTYWx0ZWRfX/AdVrEEd5Fax
 9ZAT/HHjl2AAx3u3fnyVlw2BZdBTnbi9oo/5YJ+bsobp06uhMONL4WQywBNj5NDBwjOR55RDDWW
 19fLZljkHWwxcnq96ibPMlbNFuVyg/4=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea102c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DwxOReZszbjtibhM6OkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: EyUNDTp__p6s4KS7FnEVYEt0D0jwxB1w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2NiBTYWx0ZWRfX5pCfoCiUx6E6
 1/3a04SQyt19M40WB+lr5u7EWZa6eaLz7oMLwhZZIiCfE+8ervPNtiFjrdFFMDMdd2NqouD8QAz
 yENkQHRnW2qI2EFt1Toucmgt06ZT4+FnnTUa2EKSCQa896J+cGz6H+nfvpDyfSccZRZ1kaGbXCd
 M4cbgphHSs7HrcxmiGHmjYKnolgv5wznygbXHY06patL5cqlqwTXV87lcCeeaFSpbwyyGf0rNdz
 ADXqhjmofLo2YkkU0r/7SoJWr0nHBE6Ow9ev3Gn5+Df40KHfLiuC1AZOiaJlilk8ioWxU/h1Bys
 zfZtSPh6bAkrHHg1fJDUjIcl7BZwoEQFI/DMXPPXiQ54raF0ov4nyP5R4rdVhJXJLQugkKS3Fyq
 mFeP3OwqGh5WokPprNjOHHNsQ2cLi3aAU2fMJbQ1B8k+ZuQaVW77CmrhSSdnvrFjssuH4WVISJw
 t2kvsxI2+TNdDbg3C1g==
X-Proofpoint-ORIG-GUID: EyUNDTp__p6s4KS7FnEVYEt0D0jwxB1w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030066



On 03-11-2026 19:03, Abel Vesa wrote:
>>> OPE is a memory-to-memory block with no board-level dependencies, so
>>> the node is left enabled for all Shikra boards.
>>>
>>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> Tested-By: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM
> This tag will probably not be picked up by b4 and it will probably confuse
> some of the scripts maintainers use. It needs to be "Tested-by:".

Thanks for pointing this out, sorry for the typo.

Please use:
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Shikra CQM

-- 
Regards,
Nihal Kumar Gupta

