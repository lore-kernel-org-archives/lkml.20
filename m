Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009933;
	b=tencvBKnd4QQh+tw2JGIE2J1J5orA8Sf+lTefuG+SOKqFgxgK5E5uZMOBGN61LkrkG2W
	 dZLGocTVN2CJAQFLdx8RKok53PTmf9JW2NO6sgJDLYfEVvBwuMRMeiwmDREcOfIQ3u780
	 9hydE722n0Qfj79t0xWBEv6CodLgxFOuaUPRbv6hKCTr/l34f02L7Kd1DtKvrxpGvUdBA
	 FctMA+mt6ksMewEh0vy56vVpdKMxNb4sV24abuF0eG+/FpVgmgNkm+hao8mCgwv0dX+VO
	 mtjF9i73lMwMTYvQuXomeNyGSK8Kk/G7yQ9ZqdSAglRMPqAV6nEXEBxN9qkAUwU4RXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XGaYi+CsERuIoATe1YOs5CL7UhAoUUf7A+yyeWfNMes=;
	b=3MDiKxylJ1OY+0Q0lT80UHc9ZfhNNWhXr/By2Lb7RcZDsHuDCdjbBQrQ1NvXs/YkXm7/
	 tbYiLysvPqohNrDP9GUaH7+L3fva70ceG1Z+06KJONwW2VazaCIyB9rMlk2Gn2hEY22ub
	 briLciEJjhPxNKBV5CsTWB3X9pHJLPVg9BWVZV4P9SfY2K+SvrAY9a1vpzTrUNx7tGdVq
	 3YCKo6TAck27KMfhf4o8qOACgKeahj7cULFWrdEglaB3Fpy7W3GMrI2Sit5JPZLuiGHVC
	 UrVpnZySyv6YzUJtCf4TE2Yfg6Jm2CajIlzSixUO+vZ2/Spyf30Ucy3TmYdz6jp//iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DcN94e/+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3CbiXdu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F2A606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F2A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DcN94e/+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3CbiXdu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QA3sYX3448786
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGaYi+CsERuIoATe1YOs5CL7UhAoUUf7A+yyeWfNMes=; b=DcN94e/+5R22ZwDE
	2ZXIXdMrZ2u7Tc7Q/T9KcG66KQUrr6W72pJoRHTOOdl+ZM93oqNxR2qPxYBFlIS9
	qUJlV2Kb6LPwPr3Pcsuv8MFyAGS2G9lkY2SE9ZauIHmXOb06AWS20dpAugMpFNLP
	ocgWi3qWOYHUGR6q8Cd9ZsBygvQXX8Rha9NoWu7bOvIMHlhVwg2Igh0Tpm7/elQX
	3MZ529TjU6WU0KivVvLnap+BbnvErNDPhVNXmxoz2Qt6ArZxPqv6IbvPrir0FsW4
	XgDAC3CBi4DcPQDLp4cZ4TTZjrhQP+IteVVMYZz3hgOEGaohgi1ief8o/dmAAQ7e
	pFxjVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90326-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:18:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb1091fffso20713285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009931; x=1793614731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGaYi+CsERuIoATe1YOs5CL7UhAoUUf7A+yyeWfNMes=;
        b=A3CbiXduKfh1fqXKtJ5sDp9FkuEcaQ0lXEA7753RcIjdX4izFdif9biqtFdxDuZcz7
         MmzMmUF7tPFVJm9zHFiiidKLEZhpoGs2dAaomjeHI5MchUt2wZ1K4z13nao/sfK0+9/F
         hNj+HEUyBJsU8EJOH2P2Tdey7yEoge/lJH+JMSixsXFlqkzcaSh7MwVJ3LE53/cpqY8J
         ox2kfpDgTMkVQ1AgYgFZWcKTjquZfH6DGlDtORWqFaI4qG2r15V3uh923fzMfc63IVBx
         xb7alol4DGjyh+ziJm5Kgzd05nwi9Z//TUCi8oXUlluWm+36rtXco4enBhn7tKJfYja0
         NyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009931; x=1793614731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGaYi+CsERuIoATe1YOs5CL7UhAoUUf7A+yyeWfNMes=;
        b=yWBkw2ab6+AxwF9IvXqKqOLa2j17bjtKpeXjYXNU0tm42HjIqt70ZMP6OC5ssvx0gU
         u1HLYDMQJylaScqsl5NffEBwLMdrqpdGftZ8e85gfbD/mqNh9ftRjMRr7Csb22MnJiGI
         DClLRNmSiFUPxJLEbKFzh2v8Zyldqpqk0SFa13Qk00sVYmli2nSnPvOeTS04xZw6xjDU
         1H0SWZRX1snwcHzQ1o0OGMEDO17L6Ro5VM40xAPmkbb9MrnIOtd1mH8hFhlIJGreVoMI
         rPv3Apa0P2pm8UKhWHtJ1sDXUNp/YdlFunETMFwQEfBWvOZzNLkTpWQhZmyGoaNKljTs
         U3TQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+UfJq4TlZpPo5Qcb8H5ul1v5m/RciGH2uWHlfPXeGUzVAC+zda2fnluAvNESP4YKLLPYSGH5axmlM+VM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZlLczeFZhwbdclNU7yQ7AQO1y0iOG5w+718gAgvgXfSEI5DV2
	TfGVXxw6xhyWxi1JGnhpJUd4lTw9+pHSFQmXNdKOH0z2RuwlSIevkBeXR6rbYOd0PO8uT+qFJJp
	dHaTkKN5AlqdNgJLtNSmwb4EM99DgY7gHflnA0CT5GIwEoquE4VomFqMgwgIjRe7guz8=
X-Gm-Gg: AYBFou3wzpai1eRFPVHxtdYrCJaDtP8F81Z4NE6gUl5MQKwLjVsg5DqP6t8YnVTbA0w
	yi/4ceKa8f157VfPR5pLtUyTGBRMb++LSz6fGEpcuV+MFPXfAtVYCUznf6qQG4KviYAfQ4Grwf1
	+WDDA4Breo+DkxPWR/e5FLCk1IRSb5L6MxKRzx12L84ZtKOOlVn/ZU24FOPpG7XZpXp486Wcu1Z
	uthuC1F3csYPdnRTnluDwUYAQcfiO7S66KxZS1aaLwWcbv3XG6IcoKsw2JQ4qRIBkRM1U/Fq1Kp
	3WaIOBAgzCAoqKLSQVpRL+ZbNZLwtaszP7C7sVRThL1S3S6ladXeN5tyiKETuD9ZpDV0/lXnnYw
	zg4BcakU0IF/g7BZXczibvQ==
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr917024885a.5.1793009931007;
        Mon, 26 Oct 2026 03:18:51 -0700 (PDT)
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr917021885a.5.1793009930552;
        Mon, 26 Oct 2026 03:18:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f874sm306584266b.9.2026.10.26.03.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:18:49 -0700 (PDT)
Message-ID: <fd712bf4-6854-473c-950b-5e0fabe1947e@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:18:46 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Motorola Moto G10
To: Michael McAllister <me@michaelmcallister.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1792840208.git.me@michaelmcallister.org>
 <1e50fab3692cc285621b2ad4a674dca79e5391ea.1792840208.git.me@michaelmcallister.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1e50fab3692cc285621b2ad4a674dca79e5391ea.1792840208.git.me@michaelmcallister.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX14z3rFLB/L6Z
 u14/sTIzsOWf780BoY59YN9Mzaadps6beAKwsa2ibSV419Bwy7Ev8sdF+Sh7KXmPWbqTWqVQq7e
 d9fOXbP98JHsdqmgu+qcwBtpOJlQ0WbBW+v3nfQ8XY1KOeReU5LBrXR6JDvY41z606GAxmLSg2C
 SKe+ubU00hyjEBfuP4/chnBgQly98OglaYQgATUkdb/oh4JLDdt4Mx/5SN+TMS/Pq2tiNo2EwvW
 +T9bKXKIyuDocpC04/5LTb5cmFyX/K0Ge2AS3Icq6NsMbucuhnqpcWGQu3act1DKZxnzH1ZVdw9
 NNAGni2PA7DEi3KEaMRYeBteIWfDNGBLX3aVy8QmVNHrFiKEnPvX+I+eaq840BhDLmFi/gZyqjK
 VF3jTunYm+H5BximnLyMqyDOEAKgNBm4DaDl3Aeso0KiRBzmM5rHFe1LOighicN4vFXhFt8vvS9
 6FYXda2sQKBVuFW33cA==
X-Proofpoint-ORIG-GUID: bzaeiqKX323pv3-kZhWsVEmEUoM2PdnE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX2DBoHyeAiNfO
 yWnLKhA/3Wt37fGCyaAFY9Cg8jaOT4UyHWBgcQ3TNEMoAcdcDmlpmPzIbsB+Vp3EfPy8g3jgJzl
 X0VvvnuhubwGswXEc9nA5HskvJeyzAY=
X-Proofpoint-GUID: bzaeiqKX323pv3-kZhWsVEmEUoM2PdnE
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf290b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JwJ85b4fAAAA:8 a=EUspDBNiAAAA:8 a=uu7B1lnH_z2CDsybQgYA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On 10/24/26 1:10 PM, Michael McAllister wrote:
> Add an initial board description for the SM4250-based Motorola Moto G10
> (codenamed capri), including eMMC, USB-C, buttons, GPU, Wi-Fi and remote
> processors. Describe the board-specific firmware carveouts and use the
> shared PM6125 and PMI632 definitions. Put the modem, ADSP and GPU firmware
> paths under qcom/motorola/capri/.
> 
> Use the firmware framebuffer until native panel support is available.
> Retain the GCC display AHB and AXI clocks and leave DISPCC disabled to
> preserve the bootloader display configuration.
> 
> Leave Bluetooth disabled until the WCN3950 shutdown fixes are merged.
> Panel, touchscreen, amplifier, sound-card and battery-monitor support
> depend on separate driver and binding submissions.
> 
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
