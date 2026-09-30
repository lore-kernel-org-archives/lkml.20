Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C744D17A7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771882; cv=none; b=tvFkUsON/HL3o4bc0bGyJuOSMhJm0KBvLI6rFefRd1uJnyIV1noRxucxHsP7muN6MdD7oF5t/SQubKyKFVXOF6NYb9HHKPapwzAb0J5/jWoLxg5SfwEII0Qzx8DWypzkYM4dfTbgReJxeFNizG4qEnV5GONMsA1BA+xxiR5eLGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771882; c=relaxed/simple;
	bh=kg66g+UvDwg168UNQb/RRHCbGtBGxTEKpUOmJIOl5PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vq5OktZiLiBdkOGts+u5R+l/ChKVaEQJa+irJaklYWYfXvA0xbuxQE2obiZmfjRxhj2oX7h0X6iLrJux+oRbB60zbSMDER9xr/qPS5f59UQyVPaaRDqWb/cuqyod0fjNGkzaVyea9p7R29HbJy7N2sYWQBXokFLFH9N4r/rLau0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4DzFyl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjk4gBUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4DzFyl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjk4gBUk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7hbB2584078
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/FBIdQAFOtpRV9SArhXKK7VUOg8kAx8+Nvg1pgL1fk=; b=p4DzFyl3A3itTisH
	sBSnqoHs2b+hFtnMnFEtpqnY04hp43l7EIBRFWOJAwO2kfGMkJ61wKZqZZrB8sy8
	tP2w9NITF1QRZxxuaZKfLRY39Eoc0crEK55cZ1d+8Qs9gkiSmxripQLYQxDqSQse
	o35g6SpMXVyt5xeemne98rToC3o4ByvveF072y9NgbNfXX+/yDmmE7SbNuEol4nN
	v8utUMf/ymBEu5rjc2t3HaFFnNLk5fKGn5DJuZq1oZIOeGHikRhx5Xii16FUQs2J
	mE1vfYtc2BWeCUZCsnK3PSy7roXAeFB6i4Waq8qt/7EZOzG7XTckKszr6+sT6/Gb
	NTqlNA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhejtje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:37:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a04d1cb2so1291776d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790771879; x=1791376679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/FBIdQAFOtpRV9SArhXKK7VUOg8kAx8+Nvg1pgL1fk=;
        b=cjk4gBUkIj5Ne1MdnQz6+7xl9UGfPPC2cc1bvihzHT4gZin/BlT4Y4BE3O4JcE1mv0
         hlitvf0Le4wpKHW9znp2/gTHeRzmhJZAX852fSalAHW4DBuMk/CdjV4eIxz6fTmF4aw2
         4x+Ij7h7BVOZ2+5fcscWFiWKNHzgtKy1cmERkUaxnBl+DvK4ma3Tlsm+h9SKI0I4YTHI
         hl6KoLaBPQSe/bi8X1v6iVKmJuGT04kotwcDH82ocgRJq/8klNcA3VBkksQenEhQz50G
         aVrL35rrdNDguFd4BpCGJ6F5MUP3Az9WG1NwEkLXdi1Gf9m2Ly6cQni0gBDkvxGQdzax
         xesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771879; x=1791376679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/FBIdQAFOtpRV9SArhXKK7VUOg8kAx8+Nvg1pgL1fk=;
        b=pXyvQqlL8F1wp8oev5ygHJtY7i9B6L6hQVZ+rTbp/kRKolUSenLRF4QITz0fPRge3v
         7QyWlvGtQS4ctqH4PASwmo8ACOnQXNOfCT9LOBiZAl2rKhEYeAeJNyCvyqkUDa59OXc6
         3GFVbiJ7W1hDTmOv0URq4kWqx/cCV2i+zkJAh3ceD118WATbbZRoKyxUtovfTYAcUMgK
         WJaTYH9NiDl3cxr2ejGgmItWm0usemV9W4aA+G9sHIgPU+K73p/N+4RmJS4k03yRHA71
         ZaGXm2Qd6RvsuBJwWwMV4IdoqknnV1Tq+3EsWVAtfaytdkE/hBZXxhK7wjAcgJ1r0qw0
         MWgQ==
X-Forwarded-Encrypted: i=1; AKwUvByNYj0c8imqc9X0aGeyB0XOTLyvODnkJ125NTsKAbDaGoQQzBk/uFw+HEoaj1fTXsID9LSVvy86LwcHxnA=@vger.kernel.org
X-Gm-Message-State: AFuF++lGYvjO6Nf1qdddGNiq17GLiQqdx2Reytou+8o91H8qASAkrbFL
	osFcXmqaHcJ2r/UTOhaxk2V5v3cpYQhcrZZQYbIRXs+DCGD4P3cbwZz4ntCueCT6YIP519tSQIn
	1cuuvi8J7+Ume+HdeVgIzT5BMKuE0JAOGTtWnwOgcsa6ZFtLlmoggRqbm+l2i9lpubAw=
X-Gm-Gg: AYBFou3qtYz60frieGC77ou3iaKVLBtd/LI0a2ST/G+EchZ7go6tgQuqYgmWKXj+f2/
	pVI85oIYfARi1+N4BK9ayHxWJEFoC9afrPOoc7jHv91gXoBd99FWvPTF//jPpVbAmr2gTFEVhsx
	n7O+j3vD5Fg+vT9v5MT4gJWmQpodYQxkZieXb/3zKlLdKdUNBcEbNWkDeMOrO2/eHuIvH11OZwF
	NeejFZ+XfUKjl3Aom+F3riSdkf9lDeR8fubumRYyVTAi7kZYep4OEAHQo94AOHihTThk5Ms9t6v
	ewIUNzTTjfo4J01JOgFOlRzSbBiT+/kUStpF+9GPEck0HZ5CNVLeOk7zSFnKkoCoQylIBcqFRkK
	xEHukXUzhefTYP4pKkQuKDg==
X-Received: by 2002:a05:620a:4541:b0:939:eb09:4458 with SMTP id af79cd13be357-93ca96cd5bdmr170703485a.3.1790771878841;
        Wed, 30 Sep 2026 05:37:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4541:b0:939:eb09:4458 with SMTP id af79cd13be357-93ca96cd5bdmr170699185a.3.1790771878365;
        Wed, 30 Sep 2026 05:37:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9b38sm783768a12.3.2026.09.30.05.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 05:37:57 -0700 (PDT)
Message-ID: <a25bf79f-efb0-450d-bdab-6cdd857f2328@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 14:37:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-lg: Enable NFC
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260906-sdm845-lg-judy-nfc-v2-1-63aeb7b1a5f6@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-sdm845-lg-judy-nfc-v2-1-63aeb7b1a5f6@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fU7k73117KRXnE6hobjlVxf_czyJK4nh
X-Proofpoint-ORIG-GUID: fU7k73117KRXnE6hobjlVxf_czyJK4nh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX6kopYyFj/yGv
 tLezSyM5ttjG0wcjL/dYOL2l8VP1Y20iVPgyey+8jzu1UpYfq3TsbsFIyO5Oe5f2cSSWoRCItnu
 kGm15bA+wRCmCR2VwzqzR9rWEKLi6Q6O9noRTZ+6H97QKMW8+goIiXtU2LOGYR7MKDxCsBiAG6t
 vcYi0CXGrXyLHpCtjrLs5JkaPnTNm1YLC/kg4dK96dQ2u5Jhv4Y4Ft+NPixQjN+lMefyTjgJv2Q
 uA8ULAVp9mAIiVbNtHscnAb2Sk1fLyW0MZ8Hks0vp+CxX999nuyskEz2dheaRuPZDbytLCUylIM
 7CejncxxVszRAZd4S0FrFFCuGXY5tfkOybgtdN3JAu0GG5IaKUm8mz9LhFIcg82ZaeK4O/DEASJ
 bnfjoXLEGNxRhvemZiR83kSqXC3Mg06NCj7n8zZAMRDm4weFstdS2BOx16BUDjJ0Ym441SruVuk
 R4LWbTvmpkW+kevTOZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX/zqP+YIqoq1R
 7xxJUGmddLY0wAQzd8+cjq9FcJG09qVdhSbugPqnB7y/Eb/eqZTgbN7v5iJxeirnZC38t9BPLwI
 719Gk8+9aF7p61pszPBoAHA54TQCpeQ=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abd02a7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=OQN141zOAAAA:20 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=GcxSr_ZgTee_yd3lG38A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300050

On 9/6/26 11:11 PM, Paul Sajna wrote:
> Add the i2c and tlmm nodes to support the NXP PN547 NFC chip
> 
> Downstream dtsi for reference:
> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

with David's suggestion applied or not

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
