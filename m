Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471743;
	b=02vCbIIdSKvVZmtv4XU2wUlCjjtER7Va5x6pOIKf3Kq4Y2pY8jWQEPnVs93rOwVzstlZ
	 EgwPfQ5ml4u86nHgOOTxncj8KP1bodScFu5abD2des2q1yMRboARkPiNryZdEGzh2IemW
	 FemaTEYLOyrlzeXiF0VPE+7Fd5ysMnj/QOJjAF42jF0Mel9k3AKVrKZRpjTmuSResvA3J
	 xjiGM8LUY4tArVdz8ovTcDSAfh+J4vm82IH24Q6hSyRJyiwvBF/dRmME+5rc/fw1uc9iP
	 V3g2lAXd87FzevaB4pYC2RChWKByAMIqnqmPjQPqOWUM1EiRNFTGDMDL/wHx55Yv10w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AVn3WXTCePSez5Rn5noeCdq8yUKomZ/xweK/qX5fOHo=;
	b=eq5QwQsP9U/MZKUKGKJytv7va/TVKYdloaCkV/Kr29M1cUXOIXcLFgxm8bXHS3DylJnz
	 4eRn9giRIjSvVoR0g/ioi4EUJ5Cu93XqtjSjTyl/+Qmx54DTAESMM4LnE7QM3fJe311tM
	 JTFqVsNiDposv7bDT9fHV723CAKleUBi8An43JX7OCvTg/nOeoODziEVg/SVhOs+Vk+Qq
	 Ya/JrHXc7mBHgtQMj4zzqKU7QyGBNIz3b+Vt+0pkcWfLNShF646sdhnySubqSE99rdHCz
	 auVFUrz6JuVr+n79m2F3IX8Xa0OUtPPSI2Tb6Kv6vdfEgo9xmnkqa0CPJGabGnrFDzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gcrjIu7i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qz71xTK5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEE2606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACEE2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gcrjIu7i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qz71xTK5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC53jl83476753
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVn3WXTCePSez5Rn5noeCdq8yUKomZ/xweK/qX5fOHo=; b=gcrjIu7iJ/yFq0D8
	tnf/bIqZRxIaI+rObX9zTYE/88v6CZeImHvG1LHH+93xtUWfUyL10VkfoFi7sAkd
	hkW1l0clQxGmz24CHnOIrxvnlhBmKYDDCCIbthgPxWXkqeUN+KMLjEmzenLw4fg9
	eeLbB8Im+ej4JAdswvMe06nb8RDsdAGoBfadaDZeo7fwGRkqXW5K+J6GD/ZUlczd
	EB2Jox+7lDI//NwfnG1lNM6G+A9/bsec8KxI6HTKevmk6rrFmp0lXBUeQO+5W417
	rMMGUeZiv/oiLatKTxOz4zuFBDN5OfZVX088TwcPMW+qsIKILVJpph88MMj+PArN
	hu2eog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yugnhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:22:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so3626470a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794471741; x=1795076541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVn3WXTCePSez5Rn5noeCdq8yUKomZ/xweK/qX5fOHo=;
        b=Qz71xTK5loOYszReJvCsgieR5AKIcTJEzYIX7HeAOiTS7VAkmj/+u9GBz2mMLr4YBY
         Znu+6Yxc0Upld0CvcFqUMe2JAIUfvdgY32crtZejiYy7aMBOvlH0FVQJqjev0NmawrIN
         ebj+OGLtthqZWPV4qaDlOvx8uW/QXOgAdlxnRmPdqhQD5Q65fRcIhHygF37R/97gFrMP
         0/JhBEjMNb/fPEMhYflZICcJYQrAzD1uLAMPNFizEtQUaLlnj5wHzzq95j6wWB7z82i5
         pMay/tdRdclofc+s2/oT2baHeizprnZPQjmBRwG30yD5raq82ueqt3Mmi/yVmYovWTDS
         Tjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471741; x=1795076541;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVn3WXTCePSez5Rn5noeCdq8yUKomZ/xweK/qX5fOHo=;
        b=gwfJjOzXFJ47rZaxcrmJgWHujd354kKamuXC0hjgkFhQDwvbckv4bsS8VNUq7log06
         A8XdrJhcnUqwMtia1BbAmP2BxKiTsbbEIW+DJg1RHmUfjbFsBrPv1u6YpXWc6H29XR7l
         EC1mj8z5IAwqQrCJzEdB41dkmAV8yJ7cMxxQOwkftVTc1szCxF3NY7/b0ZXbrpjuHcKq
         6CnkMH7pWMT1XSCfZqqbmHeBhz5IXEqniRLMtHe9RC7pOy79eiCAOg1u0pfCUcbgnAiu
         U/V7mb/hn6JXb8sAaHgj5CH7YLLN9/lNc37Ec+V8TLr+jmIK4cCc1hzpwGRveLDNVa2r
         Ziag==
X-Forwarded-Encrypted: i=1; AL+hErEENyGVfj5yxxHHvyOS/KK7Nh5OM4GQ0OLF/KX+vbFsYzGlIp+SnykP2zMACwY5iDXsTZbgf4wxq4q9oX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OE+EQDB9LhGVeW1VkLB5eirXtl/CncH+sDmrCmD1zEOOWNI8Q
	EOJVv5YKUXJxW5AKJPWulmNB22zvKLdLMZ7XKTRWCkVUcu6eLQ938VVqKIlJuDZmCaEdjUvSpwZ
	shWkgq3mLZjtw3o7L4SbVbrTf6WMub/jfW/LAeokQOcbFX/LwMKlmd+TSj5xMw120QLI=
X-Gm-Gg: AYBFou0aey1XAhfvYjuCgK+x4uG93ifKtSZxpRGpNhkeevbfISG93hSVQr3Su1URnkW
	rEzIf0/d40siTBkNdxLqIX6YfTTfdszYRjSs5uvemfrPpf2/Mumz8OSEFbI4BuALM97dOCvrETO
	kqWAi9LtPHdhYhK0AVatDb/R23tqOP43vj0e9go5RCdaYX9JtlqSgXjyttemJxWNj3kp+Tb0JyI
	lwgVG31FCdOzrnCPiNZVuiJeKbdWAtG8Ch1z0MU+NrHqDMp8P2Alw1kAEhhLJQUFtOrPWoM14Kl
	c/NGooKdBvoW6foHy+sQ1uvkfaBWRIk4Plb8WppFxU04aZiaAZVtsFl8sXLjC6pIUvFQx7FcmUw
	71ZEfpJzHOcUD9gyQKYVEA5YyWEuJEpFLk7wdWXSzHzwyrbZYcOFjUKH+S2J8JS4sfgv+rHwozX
	ep
X-Received: by 2002:a17:90b:2250:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b182f57211mr5338908a91.37.1794471741167;
        Thu, 12 Nov 2026 00:22:21 -0800 (PST)
X-Received: by 2002:a17:90b:2250:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b182f57211mr5338878a91.37.1794471740510;
        Thu, 12 Nov 2026 00:22:20 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182debb54sm3082736a91.2.2026.11.12.00.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:22:20 -0800 (PST)
Message-ID: <2ac0ce9b-f54e-46ff-9d28-511c07a4fe18@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:52:14 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: glymur: Add camera MCLK pinctrl
To: Jesse Casco <jesse.casco@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-3-e7b1f403146f@oss.qualcomm.com>
 <20261110221232.3883-1-jesse.casco@gmail.com>
Content-Language: en-US
In-Reply-To: <20261110221232.3883-1-jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MKpXzcDdxhoXkst6H65ClY1OaF-JMM2A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX+dzZ8RN+Ib+H
 QvkZS62aGrnCxoChaAaZ53WOWCE0QZQA8MlU+DAnE7Uc7BJb0r8hvesL/61AWVsTMeHosUeUox3
 p5j/e44lMxykLWT9OQvJ4bDqjtPoU00=
X-Proofpoint-ORIG-GUID: MKpXzcDdxhoXkst6H65ClY1OaF-JMM2A
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af5773d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=smo19LPPzjqg-eG-KNYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXyXwHrpmUvWpT
 caIeaV1tUsIOPQFdQDGvPY7cvLc8wRuqn8rzpjA00/Pv4QeWScvZ51xuX+cvXD7lgk8mOXO6Dtg
 uCChTx1W8ujuioXpTmzX2MFLzH5igr5CBy9fq6OEMFG/V09nxaRY68rFax7HV/10jRftrhWPPGw
 13lY88gsxp14ZFBnycvigNZTamwF+KJSF7suYeHZ2wqbSPKHOwK4Cp5c2438ctZCExvNlsT8sXG
 nnujK9K+6M+xaciaJvrclL9hTU8ePzX0zn5LawsWAESXzjIK/ykg9nwYnFedh3j52Y7QjAl2BMH
 rUgHufX1gNBHsYFOWlrgGVY0pzUrCxMJLM+/cTxJWOAgeSKTIXyL+uLWWsw0wjVg8h3mokErJOk
 6F/sAaI5XntnGk1B+OBWjqqAExrxxYbkAmMPSqhzYDXiFWqi3DHIR/342N8suxGZ3tx4PJlt1fb
 A1RyoSPPb/VBj5UK4kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033



On 11-11-2026 03:42, Jesse Casco wrote:
>> +			cam_mclk4_default: cam-mclk4-default-state {
>> +				pins = "gpio100";
>> +				function = "cam_asc_mclk4";
>> +				drive-strength = <2>;
>> +				bias-disable;
>> +			};
> I've been running this series on an ASUS Zenbook A16 (UX3607OA), which
> has an OV02C10 on MCLK4 at 19.2 MHz. With 2 mA here the sensor shows
> horizontal banding, and its frame period stretches by about 9%, whenever
> the internal DMIC clock (LPASS LPI GPIO6, 2.4 MHz) is running. The bands
> are already in the RAW10 frames, and the sensor test pattern is clean,
> so it looks like the MCLK pad itself rather than CSI or the ISP.
> 
> Changing only this pin to 6 mA fixes it. A/B/A across three boots, same
> kernel, fixed exposure/gain, row high-pass RMS / frame period:
> 
>   MCLK4   mic off          mic on            after
>   2 mA    0.96 / 33.28 ms  20.44 / 36.17 ms  1.04 / 33.27 ms
>   6 mA    0.89 / 33.27 ms   0.90 / 33.27 ms  0.90 / 33.27 ms
>   2 mA    0.95 / 33.27 ms  15.33 / 34.37 ms  0.93 / 33.28 ms
> 
> At 6 mA the frame timing holds steady at 33.27 ms and the image stays
> clean in every phase, including while the microphone is recording,
> which is exactly the case that couples interference into the 2 mA
> clock. Normal camera use with the mic on is also clean at 6 mA, so the
> fix holds up on real hardware, not just in the capture script.
> 
> Could cam_mclk4_default use 6 mA? If you'd rather keep 2 mA in the SoC
> dtsi, I'll override it in the A16 board DT instead.

Hi Jesse,

Thanks for the detailed testing and measurements.

Konrad, what would you suggest here: update the SoC dtsi
to 6 mA, or keep 2 mA there and override it only in the A16 board DT?

-- 
Regards,
Nihal Kumar Gupta

