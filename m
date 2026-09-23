Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A5486BB6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167577; cv=none; b=HFojiHehqjwQcBdTA/NzSWqgmE/5MGTizTx/ktZLo8aOvDHG2h50lwBgNsJmHATZcnhOoO67QQc65AKju15xU5Nz6DVjeWNO8z3guNuGHfXnU8nWMCp4XB1UzezqwEvMpEGyGQwqDALelPoaICyrmD0AKay/JPaDP4ozGRcCHMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167577; c=relaxed/simple;
	bh=2ptsqUzh1G3mtl60EIsCWIOKDbdj3Zp7St1CjUKx+vY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lq7iVZzrH6CZDeazl0arfRpMqg+iYRA6e57Je/JT25jIdWedUq22l4Ty5wyIRqfnLxhJK9A46/9vDOiR8D/PT8u3Bx6CMhBhyjxydHwUXZaU6B4LcelrSa6NZieBLVNiEXUF6ndmmwIbFgspld3woylOxsccApRgVNtqPO88Y6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dn6lPZvB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxN6l/QA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dn6lPZvB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxN6l/QA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbUiF3295545
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Mwi+L/Gmuhk1BHYUarpYFgWKSaL2RVV5ZgB5B76mRk=; b=Dn6lPZvBvB0CYGpp
	PK7LthTcz42F4nj8aBDfb3wx0nC/f1s91ZrGhYM6XpVUT1hCriuPRUaW/HnhiVC6
	2A558geTm42jC1gZ0bVxqkPPB76n6UGozJ1g8ilb1cbKngeAvoyCKvgTSG7Pe2ts
	fIcrzaFkF2GNl/nAHg7AFDlpGbt3piLQbdojuna33wRSqHwLwJ9mek80Ne5Bmkbj
	rDWbHqJX3JZymNgXrSuPmI3gEeIhyKS9R+aRaq9gusVTb+8fUVQ0iiaFJ2Yie9UR
	YPIsOxoUj5MwlKfGA5JNtJyxXViwylPqvJThkGGLD5y5loABPrjGbRov3qSzruHg
	q8NE1Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm8umn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:46:15 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-980d0c9fc21so35133241.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790167574; x=1790772374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Mwi+L/Gmuhk1BHYUarpYFgWKSaL2RVV5ZgB5B76mRk=;
        b=WxN6l/QATc8zYPQyAjMcPtwx93wSDo2nAxdPli+izbM0rlfdrkj3ssEw1lxmhpBL+f
         iyctlHZPCjiWDLtlsBUy2JT8xePLWfBKfUfrbuRESyiD8684XFBAFjzWXgljy5aWEr/O
         D+dJQSE5BDBQTk+NcnU9G4ystweS6gXZExZIVMmDEmPexDF1pPCb67L/gl7/d2/ydm/Y
         9k/sKDBDz2Pyfi14F9gebWrCFCPq0zxOjuXkUqCImU1h3y9BdQgk8Do28OKkcMadG9Jf
         TRgwR92YB9kTH65OFcEyRTHI1LDAbm7dDsV1e7DkVbzZe479Tt+43OJ+4T2W38hfRz9u
         3PgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167574; x=1790772374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Mwi+L/Gmuhk1BHYUarpYFgWKSaL2RVV5ZgB5B76mRk=;
        b=auy1o/3YVPAohdIXEfQCQ4USvTBZW2YXyQyi7gx82HJnCmkyUFCDGnFE4UrNCYuZ66
         VPtBOM8IL4prDKae5rI8aBdiUSKayQxJZMWoH1DPwDIjmtbv39qpIoqabwX89hNIOSOq
         akYR5DJAZpmAXAxUtFYK1EfazllVf4NGJpby8BlUSGSsRr9XCyqEc/vu4Uw4pvpIU6c4
         NI/xdDYj+Ztb1uv1dbsdo1R+dfq5KHKVo0NrB3TD/WWru61fa/D0KXSIxXyCGcUhutWG
         YNXkxmfzScpaXkglg0BmhwquYsLcZr6To77Gamm00xe/NurKWaLWqKWR0DfAhLifTN9B
         RUcg==
X-Forwarded-Encrypted: i=1; AKwUvByg0sJBAPLRlXYiGYTeIxhdFipue6z9VdBH0LDr4ufUGwA/2tzaB85NwlOlDHcE/1H9W468peh1PLq5svk=@vger.kernel.org
X-Gm-Message-State: AFuF++lg4NWPZgPP4TpxE7OCSn8vrM8qs1LRGh+DV6X3Qtfcy/gFu2Bg
	8R8ZyYb/ssKds/bykXZ2u+kZ6tUAtgV1ESP/GFAlIkWRlS2knEnHHKa2puCtYS/Vfh9Rw0/8ZsE
	St2q3+6I+1lRS5o4zbHkSbw2YEfaFBz10nqfrsf/Ae/j1TmcsvGzH/RKV85rNZ+lVsEc=
X-Gm-Gg: AYBFou2Glfl3UjlNZcX3D9kVWQQth8PSpUPYM1deh1kLp8UtJnYbBRvhuIw1BEZ0EhC
	hAtRTlWLYtJ+U5oyzRBUGUqmfXVq7fF45QBXx7B8U6R1VRfxXDxduwrGmxvPqPpzySm9M0rNS7Y
	19htIlHN5SiTv8Ejt0ViHGcy9r05+ST1PRPNkJv2/l9mKxYfXQshRnzEBy0zItRDJ/nwkQNLEju
	HboUCfcPN0rTMtsMH880+w0vS8KoJsvjvbHUS+5QIdFfvNhYSkniDdFyciZHAK7wI6u501d6acL
	pR1qwtjJxX2KAZfSmPQn2LspgptAqpSuYcro/EHTkp1jSvTLxWFtV1PzxvkdKaFN2qY8c93QKlI
	QMtc5FlP2wr2BR6y75cgh8w==
X-Received: by 2002:a05:6102:e08:b0:7ae:546e:4ca with SMTP id ada2fe7eead31-7ae546e088emr430761137.3.1790167573913;
        Wed, 23 Sep 2026 05:46:13 -0700 (PDT)
X-Received: by 2002:a05:6102:e08:b0:7ae:546e:4ca with SMTP id ada2fe7eead31-7ae546e088emr430753137.3.1790167573414;
        Wed, 23 Sep 2026 05:46:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5524sm113601366b.21.2026.09.23.05.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:46:12 -0700 (PDT)
Message-ID: <7431ceec-62dc-4dcb-baa4-9ec41392e72c@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:46:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Extend the
 xbl_mem region
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Molly Sophia <mollysophia379@gmail.com>,
        Petr Hodina <petr.hodina@protonmail.com>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260916-sdm845-xbl-mem-v1-0-6e3c88507997@ixit.cz>
 <20260916-sdm845-xbl-mem-v1-1-6e3c88507997@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-sdm845-xbl-mem-v1-1-6e3c88507997@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX0gZsTgrxg0GX
 8FkgHF06k4ujzwAEtBJphbUTGp0lBHYjcg9zMu0gGixMngG4y9R9bjzoKbg/Vaki6wsGwIU/J2x
 9wnizKkFjm6vX1VgmdIbsaoswib2R/Q=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3ca17 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fZxPOWFe8h4dJMscNt8A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 6fDMMAoZf0veyH8lBwZVcZlu-45hAgpJ
X-Proofpoint-ORIG-GUID: 6fDMMAoZf0veyH8lBwZVcZlu-45hAgpJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX4dJhNl8M57vM
 VNbcSxzI3MMIJRqVZ+wohlpvofM+f0diEY5SOJy9vD1kL5OwrLrFsgYh0bfhsBDspInN5oKNRuk
 QA538J8uAaVwQbxyjoV7/U1lRySUleAzbhDevRmT4CQTKhJ9V9TUS3oEUTNHU7d+KfdMHTenK+l
 m6PH5FnpmAcEWkCBiCtadMTFMWKDzITdBGOCch3XwxiiRogvL3ggYwQtZJ1PVQU/RHELHDBSxLL
 apTQUF53t081NXXpx4kfyOA9gzKopClR9Oeyvvh+I1ndawCPqxa/pn0/5wmO5MXAGlMO1HPuw1M
 6tgZbcBws5k9Ak91tAcotrmjs9qZK3UuLr65VroLPkpZHSiyeooxgkn1ow6K9s/9tTPJCRuq64B
 usmAFculiPQy7jCkUptxuMl2YDvtHxwQsqFC4/KR+T1NrOcaL6o6s+0Brdoa2RiuHOPmBSiip+i
 Fg99M6u1IkL64ZOdBDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230050

On 9/16/26 12:25 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Xiaomi's Oreo-era tree still had the CAF 1 MiB region, the 2 MiB version
> arrived with the Pie import. This isn't a board-layout quirk, it tracks
> the firmware. The later XBL wants one extra MiB below the old region.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
