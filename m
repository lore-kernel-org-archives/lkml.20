Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEB730675F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785942; cv=none; b=FdjvwX9kr3j1Kb1mqkQC3/IYP79nmBv1ic+bxWw3p3q6f98ZmLaZU1efXpbfeRON83FiMJLFfKoagaQt/C+imk0fpfw3Q7MGgeA58uvu9kudfvO5WeTEo8obOSx3wBknO5bkbB69E318MEPQZ9azU6jPyKlisl4UbjJDKKbmS9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785942; c=relaxed/simple;
	bh=DCoJBl7amgy1yhvT0dMKEv17zLSUXval2AKvsyCluU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uO6l8aie7Hux96nZ+JOWu531ay/63TfH76axFxbJGmzHMjeuGTIEH0LQ7/aVT6mbicjxNDg+IivDjZsSIvv1DL/cL4dArNDdPi3/CqpsLEtyHhtJCncrDFYr0mLxqE9TG+x1AO0JoFuzgnQgYL4gF3YIxBVo/zoqfYmCSZysDQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGcf6o2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjDeGOfC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGcf6o2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjDeGOfC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnReY004319
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 12:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=; b=EGcf6o2UIIuEKCYK
	CaYp0Nq/4gplEhtVAlwhmQ5EslBXQU9NyFdO2u5HRtgmsRf0TS0UXDhNBEX9Kdmr
	S+6mBh5GAcKOymJvbErVkAnZUucs63xmwQ7h2wkVNaacjCSpyhoi6hpMldlUEoYY
	EGJ+oHo8kkRJ2MXAfNeZhw9mqtKRCmeRJxP0qB6yUn6K3zA5vmvAoeIDUrjSdvb+
	37qKC6ZNxjV/Iz7VfXe3LEbUD5qVQAwpRXXvqij8MFfsSVXQ36wCQLIZ/LAWf06Q
	3rwB3W+lTBHjlFSrQTMTi1bJu8X7/WvtNpbMciORo6r5JYKX0KH1zyunCm5/qEkq
	+4gnIg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg131s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:58:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so64761685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785930; x=1789390730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=;
        b=RjDeGOfCCgF3C977Vx2lOqzuvynwrkS96jRHKmKHIoDlDmOZ7nHEqGTp1ok5ryCPZg
         5zalpzhGz5OXtB1dA4KzICi/kGLMzUqVDf/E/bjSptrHgG9xwqvX6A3F/THkkABfG8Ae
         G6gL+QjO0MXwcsFUVg19H5VpdcPH0Mu6XU7SJIzUyH6VBOsFf5dwmrNGcvqToeo0AYC1
         xy4MpoZTe7ezskhg0gNzTp9xrhL0ztATBm++R4gcbQA9K/9LWGmJuAUWwfwxbkc4biEr
         qa6qyLIY5LFqwWJ890p1D7YjzJOfopIESF419P4avtj+tDb774A02sA7RaVDgEUzzWme
         7fXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785930; x=1789390730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=;
        b=YqPpEIALzJp+mP9qbMjOPKaDSpRw74orgbUX7ISvBPfyoovh9wiZ93zNgrOHaA8vsw
         zi0kxHSlLy258qQkyu7JpAB0xvZLXUua5G4oUidp7bPnkUkQLsIHvK8y8w5MkKW2qjYy
         JH/q/lEhwRBa0/YCkj7IwkNSSYfS92fX4v59kdCFPjBsTjB+35JgS5nP5Ih6Aqd58fMa
         FbBakfD2H0j2FdgdS7J0GZT3F59mVZQ92VZhje6NIBiDggqh3CrVbU2VWdfAv63J7Zkv
         qBND42mpMVuxzPnQx109JyiRwnyJ1PffGzpIpxmkZIby0xDzMkNOaA11c8Q47d+wJoNW
         9FMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwL2Kcn3HtqSma3Jxd5M6CrvIEKgYj+kKdAPqjSowiwCRyWOIrZiCNj+byvidSM3jAiCTeeXoIXwao9z/s=@vger.kernel.org
X-Gm-Message-State: AFuF++nMmOaKfXgWLmK1kdqCwOXfh891D78JHdMWuY1kYNcupx8WBr5z
	+xfswczuak1+RlbEpyNvqKi4VHoB41cFmvvTY02xiZrkFwenfikF3vgkO0eak2Bz9DG2qaO2pqj
	6bA92j0YvW/4syUntI5jPmp6PzGrCmnfE+T64hUTb1MsuIRe2EgxtnyBAC4IzJtGZ4u4=
X-Gm-Gg: AYBFou0icWON2SV48U7zQs8gHY34gs3+HWSAbNiIIFQ79wGZB1UCIFoennsjSpl5+hg
	z0TocQ00ZErCMvJBGe+P1DoEtil4mgLt3ZAe47b6DtOLy6qZdJ62BqByoUAwOeuEX9pAdjQkz7r
	vmqYA+stmxWwW5duLM0tLywIJvLYrV06EvNAR52+cYzbvikmydOa+bZxBsNlyblgyP828lO253q
	IwN0j8tWcQL2EnJ5SlH99v/dR2ufQPyZoQrq6JdI6sY/YJcWBraLxI05g5TrYyR4lvGhMHOP2Jm
	z3c0g71S112J0M2MvY+SbCIVY59A9yIvWaRe1DKrgYqfE1CnoQEGh/yU4PoZFtoVRol7ZnPBQ4T
	mFcSXmTpp6P4rfP+cSc6abw==
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr1857110685a.4.1788785929770;
        Mon, 07 Sep 2026 05:58:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr1857106385a.4.1788785929336;
        Mon, 07 Sep 2026 05:58:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68e9889sm4250685a12.22.2026.09.07.05.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:58:48 -0700 (PDT)
Message-ID: <0d79b582-75f0-4577-b4f4-a028f83442b4@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:58:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: ipq6018: Flatten usb
 controller nodes
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-7-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-7-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX6RBZt5BbucXw
 iQ7wmZ2ZLxfuw+utfxAWMHSOlChHkWNJmq1lJzwkzP/ajWHRHA1X8L4Pku+eSGlE3EbhM4ZJjdH
 SuuCRDNunn0SReV5ZRdEd+N5jFtw9sIpN94IWhxXTMo+wMmI50s11/DV0FV7/Q9nVp0tyLn+0XI
 cCalypF1Jr4S7tjob0VrcbOilhucn5AlmsEBtDZSL5GttuqVbq3XGesBX4Zmen3D2M0mf+I3WoF
 bO7PTX2a0P8uRDq/ZMWBbkEK8jqOwex/dCuw7fkm1xyLiDTk2DB8ERnsuI3ln6gWSfeYJqc2pfC
 VxgjMfaYYlDAtyfoRuNJdTlfnPm3AbLwkUVugcUOO+x55/cCUfDCtcda6yw9leRqz2mzw59k0Qx
 TVDJopunXxHxMGxUc8MifiGNuFuNjvXs0sj8y6eZTIKXm741BcqiwZcB/CyUcaK8cVfKhb9V6Jd
 a3nr/zNaeB86emtuoEg==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9eb50a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 9R8PblgmKqOPKs9YUuBIVZC13RpGiZUc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfXwZHejEmIQqFc
 t78ZsBOTab8aIYrC3aIe5J+NVyeXjow/pkdn4yRV3rVo9X7t73ekVzQwKuLPMDVm1Ih1YTevqeo
 VCGuqd3If+OMmFGrUTXAnk4a4kFp3SY=
X-Proofpoint-GUID: 9R8PblgmKqOPKs9YUuBIVZC13RpGiZUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
