Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192331;
	b=LiORjkrdumpZLz8UCHQ1IjRNIncZVtMMB9x599LP81fb6kxiecnTObhLIIJgPC4rcFJa
	 SwAxzX3+4w+xsJiHTKdHOjPn0PysFz73NeSwNRsucI+3ZMuCeshorvN5OeYzz/+gdml/f
	 XL/8zDKkdXEBJJhinC55newY0sQ48i/no8oq0nRm7hSgE4IyBQoCT1dfIdiGKblzrsgQE
	 FHnKZg7ZiG8XqV6d/+SoU3orpfZRuwOGR2XvTPSIGL0BSUUoSA/RE/lHkmYI5BS+5BAg0
	 aCqYQbjD1RuM5l4kZx/Z/liHUm0iORIm3sOGgCjsqZU2r+nMi6EucwC04n3BmWLhHrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=50yXasG1rK3Yih4I8BA352afkn1vVFs6oRSImNw3Dm0=;
	b=TuJV+4fl2MmNO2DeTIzavGDuM29QIj2Hlp6nmOVXxT2Llitp9k3VubwdqX2FVoTTyl9F
	 Q+JbHWpylqM0xhwpUmBNnFRiAy32HYzIVLW9z8+VapPSuN0fq09fk8YDSyO0ORu5UVI7S
	 ULM4Cmeai78nNumw9VAlHflgNNREBfLBdCoFv/nD0WcDCislmkyrIoUmmx4YBL8Zt12Hu
	 S7HnkajdcTxanSDDz+PE5IpRI/fodtYAVj0tq8MdIX+8w1vDsaDxWlZz8KLVuJ5vEGTQN
	 m3kjpWTVV+ZJYIzeBL7m/taLi4FKdMh1obse3MS/Z0/IXE7Hz6AttRFwAzrjss8a9hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oq8ULE75;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIYDkh45;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A1A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A1A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oq8ULE75;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIYDkh45
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2a84154745
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50yXasG1rK3Yih4I8BA352afkn1vVFs6oRSImNw3Dm0=; b=Oq8ULE75Gcg3exfC
	6U+Zi+fxge98zTgHrKQJGltM0At4YS1kOwUduX4ot2nTU4Ax9wPC7+QwOfnB6mCc
	HRYHNEi8TJs1smjDbYt+BWwTPmYVExpk4QH0YrVfUJFH4aDKYzUfeMsi6snXwTd5
	0nw6p/djbHn05Dq7FoGIa1BlElhlwodV2ea7ItrKZ2I8OK54k0+8CMTlTQ0OLRNm
	DdmUzeuJbzXbqsRi1D5L7swvxd6UXpIrqd64qYG1rjqMKNPT8UFRITJ87l88zrIk
	Ol6RhJXeYao0ms5R9q3K1Kmn0+vZGhV8eyJnDiQbozHXkPMFauMPyIw38jPJ+L12
	5bLIsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0vjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:58:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so24915685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192329; x=1793797129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=50yXasG1rK3Yih4I8BA352afkn1vVFs6oRSImNw3Dm0=;
        b=AIYDkh45J88Zy7n72stG802I+YSHhqvGJjKH8D7/olbp9F73Lt0F2VJT3OOi/i0FoI
         a3O+b7LNomDV27lORCTV4ye4RDVcHwyiTSFfFe3ycTwL1IvOBHSugczPaOgbdOVfHWZ9
         hYMqUqXbT3p/zxDeQUl7kJYWixc8HBlr5BDrIM2OVBxgYOhs88FR1/3s0sdrtSb9Ot98
         QtWpisExA0pKdlAsPEMmemUQvztouZvgj3H4+YTTEnf4XE0Aw8xYQ+nj8VH5N+ZLpd6d
         UwnbyPizO5Cs3Bh1UxPM69TNx9cIqg3gb/iJX0KO1WhjVJQO04Lx9B4cnJm/GS53TJRe
         ITHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192329; x=1793797129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50yXasG1rK3Yih4I8BA352afkn1vVFs6oRSImNw3Dm0=;
        b=oNZnzZCbZc0x85LyDvyzBwucmLQE5R9Y/HrkkO6RXYe/NMnW8XYcDK9kU7vdCEv+Qg
         eIbO9JzHfa1QBBgxNmIcGvwlht3hfoAy0y2yZp0PVQCfMhoVAXS+YY0iHUy8AEeZq7xe
         4UUJH1X5Ywvbe1h9ChblqjEC77cZ2CIUcUN294kX+SsoCmAVkmWIFONUMBvzCuTRheDZ
         cV7n60Bt7mGjUMaMkKC9PoWjldjSWjg69CiJd4hdqa4nImr17MCtluAAeoPJTQbx9Hxj
         /nOVmk/ZZOi9U5L2bahx4NBQh4ro4TTR/bRflSBwGVGcmKEj0AA8imt5iPLBR4oI4xMl
         ej9A==
X-Forwarded-Encrypted: i=1; AKwUvBw8uEXHlLO8n/Do9ep+cbM2SWTUzKRxcsLR2q20Ybf1upVLht9aQgXsfnX2plw9ls1iCTBPSUtk/Q3FQq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzhkx8kD8pchIUrtz2azcyWJaWRtDj3j60Q6pK0IZDNFcaPfxm
	1x6h9qIWDMnWJhkCqL15Thf1ffNu1d8RuARkJ3khj/oIAxh+AAtSIbRveiwzilrOrH8Uwe0ck3C
	rBGiZ0DrO8k1ZpLO0LG9TUmdiEAYPLCuwtl9WOYmLjw2tMAqFgi+zqdM1j6gZYvs2nec=
X-Gm-Gg: AYBFou3I6zqvAKJ+rehLGwz0Stm1FPVfEc57+YGSlzPKA7IHwQL+xtvU1cFcwNcOjD1
	3j5IvcELLNiaQSAJSA9gnx+GAW9TKEWnj6svXIKxlfKiCgxWG9ER3kSpkFPZ5oGlFEGhskOm9ZR
	lbzvn9L32NKl4H8aJJrfmaNb2aMOf9432+SokxcDpLqoQK/Q7UgFucJi9HnP7YS2vPnKimtQ9Wg
	RZUJxsi/n/OLmYgBpaVOTfqJeKTDKRoTEkj4ACtUzn93/VLU+gvje75SvBHXT1DNJO9ktSGAQmX
	EuidXgLCf0Yn9DR/8TxvRLNOteL3OQe4naeRBiSRRHAwZxoiul0B8pzB0Hspbbx88jG6cEXgsKq
	Uv1lPE4F8v1m8762YWRFA1T4vBvaZxaDoe8b3VzSo02P7OY950iehQBatQsaBAXQHU7H74yk=
X-Received: by 2002:a05:620a:871c:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-94408a74b23mr306447585a.3.1793192328850;
        Wed, 28 Oct 2026 05:58:48 -0700 (PDT)
X-Received: by 2002:a05:620a:871c:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-94408a74b23mr306441085a.3.1793192328193;
        Wed, 28 Oct 2026 05:58:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd77e1e9sm599765166b.67.2026.10.28.05.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:58:47 -0700 (PDT)
Message-ID: <3bd30903-5284-4bcc-b740-19635ec9bb71@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:58:45 +0100
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
Subject: Re: [PATCH] clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0HgFLEMIu-ePHTmCXpT-JavAHnSm05A2
X-Proofpoint-ORIG-GUID: 0HgFLEMIu-ePHTmCXpT-JavAHnSm05A2
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1f189 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0I5sxNIOA4Q0ZI3ESucA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX1y21SXgmRKHB
 Fh1qH7GrjmhU4D0nblWyo4BEnywMNUBczfgIPSfEDLt0HmlOUuQxOEnQCK8YU69B8aaQ4yQvwlV
 9zDcoGNAKFaGY5NAdUTlubPjoYIOMevg6radihx1TqbrMw3box8NOC/CF07CPqtpHAPBTz5Mf79
 i28GcK4PnW1cSsaNEkdNR9Cc+Ft9aLbxntb8vCPOTdyGfCuAIhNyv1N3Lkdu8ly1gfnbW+60Jd+
 L0GuEPG1vE5H31epGxjcsFjuAqaGzqhlnJeTYcM4VBwgnRpY81RCtkX3i4e+kIt0JguP0VAkxuP
 Tz8VXmF8hGlijm7EJsL8a1AqQdbD6KUOEdGuDyepTka1vI/7a9mZRKs2dAhd138sUTHjiWY2/lN
 u00z8NRLRONNOFppVTlLO+xsjnERZoxgo2BUMTk2fHd1Vsy9zpFP/4B8jjR0B9y7/sk9/WsCNhr
 55fffXgesTm4uqmt91w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX1XKNliyc7DXw
 zx/0Og9aXS5A+hxt1IME1eGn3ozJY9tDOL2O/GyjuDxkT4JMQwBMG+K5CBaB1+Ms1x1EPna09VF
 sNbLBYkRr18a1q5MyeQgU0dODz9N83Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280051

On 10/28/26 10:35 AM, Taniya Das wrote:
> The PCIe GDSCs can be shared with other masters and should use the APCS
> collapse-vote register when updating the power state.
> 
> This is also needed to disable power domains that boot firmware enabled
> through the vote register.
> 
> Describe the collapse-vote register and mask for every PCIe and PCIe PHY
> GDSC.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
