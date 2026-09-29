Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0B51AFCF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687870; cv=none; b=RlxAHQvJihdMOfpyanCuLhwOIckwJq+LBXPMaCALdMvtdILp2imaO5boVl9UBW+JZSj1aOo0BfcMe6mfyyPVJPXZ5M79rQvxYIeIX0yoZWDJ5FrIO2C4qawYCI8aZosBHft7KeOf/Wq4Pxm43/Ld0JQGbmPpekakEFkb7RrBJPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687870; c=relaxed/simple;
	bh=9uITES1c+z1LwEDwwhjcHSvT6lcopxRkz7KYTY2wSgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+8O9Ymc/3NWJOik8eMIWCLgP5gXmh8sqn7/6k04Dve+LdJVDarzXN6lG90osUHhgiYHiY8iSe0gUvD8ehn+mIWKenxIXV/Gxjy7suLxmYmwFjSnI9YSs/ib5BNybaGzZ4N+TbM1ukq/2pZO5kF+eqoL84N+hUO37rUnGpgq8OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMfaLW/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BN8GO+B8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMfaLW/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BN8GO+B8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqerL1577176
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hOM6D8WYiBBJwNCJU5OIk+JD
	Q8hRCCk2RfwO7zCPqXg=; b=PMfaLW/YrGuBxy1SB7cio23SoWepq8x6J0tt4O/I
	0Qmp4rots+8j4MIA1GQ1qw3ECR6GcRyMMOqqY4FX7leyLzHoGUHcj3XhbAuNMkQy
	X5lhfjXcy/JnTgdlyTfaG17rz0Bs6bzCXTR1vaZy8yU0LiYEaaJ0YGvwYl9CiWLF
	QsJK7zowDZgO8CMzrvT4fdu1OOICh9R88sj9cA57GzA/o4Ud4Xo5uCVpZzi1Fei4
	SgUK2tu6wyoaVfSZDSQTa68pW0IxF84egKFdmeYpVS1TXopbjQAGhyvs6eiLotS1
	BI4DnZz6kWOu/H25YV2+JEdDDtK1Q8yycEsvslSD3eHHAQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4s5j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:17:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b58fd86edbso316533137.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687867; x=1791292667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hOM6D8WYiBBJwNCJU5OIk+JDQ8hRCCk2RfwO7zCPqXg=;
        b=BN8GO+B8n38ORXombr3H7CSiJ98HK10OKxQa0OuySxKFNVidD9VyhmvMUDCpPtDkCI
         2Fkd7O9wfX6S8+LnT3KlSwxpvSiZTu7MIVV+EACZIBMoa1hi2OMkczJVNfMdsQCYauYZ
         FAk4qL6i4t7OmEIEHU8uxWWcwOCZ9mg1IspZmKDPmDk4osBddwggaUoZhtLEhOSeKj5Q
         JVttBMeUQRmnndZXtjpRRxGdTIXC9VDgJkz3Bo9b04WK7RrusDPuCrFkEhmGIceXOJU2
         WB+BmDJbkQpW2/UHSVqMNpMKOmSfBTestIoXL78F1uLXA0W+jpXqKfxbbXfVXgCuu5cn
         SIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687867; x=1791292667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOM6D8WYiBBJwNCJU5OIk+JDQ8hRCCk2RfwO7zCPqXg=;
        b=JESWhO8S8wU5fusHKImBGtsd31afBanMqZ1qfpejEi62+iw6d/KoAqCQ+mJ3tjdBYq
         zbkWYBs3xA2fEvvzyRbBdY6zurqjCdm2nDTWcqfV+usVvEp+a4EKCe6mo/j/yxe49r6F
         jWbUf3+XwXbTgMYM6ga02xfW4I9mJGghkvYgh4jBCTWdqLglLH96ByZQN3tRiMWMijpR
         KntyPwTt5+tEFgzEQVkz560MwgbiMAUjQK/xbLJ0k4yi3/NaQeaAvO/yx9msHoBa3r8E
         doKFC+JzBThkfSXlzdPkZ2PzZdWDxG/ZNN/FlJPd7KH4k1z4jHQHfL6HZMujNqKYeUfR
         SkWA==
X-Forwarded-Encrypted: i=1; AKwUvBxDJ4N8wQoUG4SFh5F2DTrT3cd5zQPoWfqDVRqHO/Qam+lr8wGBTnYM1SKY2cfXzBFotIGbxwk1fpsmMu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF69Pt+wFyIrypWuvuObUtt0LP2/jW66x5X0yo3eQ3zrnF7lDp
	CjsEmSu3gPrXBQaJfKSYXBb6y7IbKtFQFyt2AShapWIOlJ2b/UFhnsUU4p3+vdju5XJ4RHE3qNY
	ZafrfcHARHgIVWqmo4y7bfN7p+YjRGsSVpBKm0u8SbG8PZO1ngG1XND4Z0b7FU/WqNtc=
X-Gm-Gg: AYBFou1yqfJAt2GMDShwIyQF2MM+hyb+RXw0JIs748heVtx9gSP0yF/VROB76iYWSl4
	m7pyseGZ4R/lyGFNlWniQo26CO8d55qIs1wPZ4SgcAz8GmstC4/dO3Ys8Bg7RPdxcfODFyiK0RK
	iinecds0rBUAUNnoWqPcrFtDaEJM6BtpLlysMGwPGo+vDf5rNyUGf0Jd5CJ44n6pCo2YydLUJ94
	5GkOg7B3elHxRVg7ekEw46Q1jPTN3x3d3hwGNXwiZRZR5MttPmzBImxTAhNIG0MjjsSUNkMjEYd
	lQE/C577WONyCZO7tuzrfLwA0y7pCIMpONoan3k5zrh6bX/MTEGqfg82J0IRzxQISGDecfnLuPJ
	Ji0FOBdvT/sUTtrI=
X-Received: by 2002:a05:6102:390b:b0:7a4:c3b9:1e99 with SMTP id ada2fe7eead31-7af1e9f582amr4743120137.19.1790687866862;
        Tue, 29 Sep 2026 06:17:46 -0700 (PDT)
X-Received: by 2002:a05:6102:390b:b0:7a4:c3b9:1e99 with SMTP id ada2fe7eead31-7af1e9f582amr4743103137.19.1790687866208;
        Tue, 29 Sep 2026 06:17:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe13a1sm76923395e9.5.2026.09.29.06.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:17:45 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:17:43 +0300
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
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor
 node
Message-ID: <nqpxb3zpvlpzw5ots6otyr7v662q6ql2dk2sies5w64fvrfbhh@5xd2nixnjnii>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX9HWMjSLANE/w
 ZJ/kkqMr5vpL9bYc7hvGm7/v+3e4BZoAEafz/RMOYiuPJgmKUQU0wCXThQ9eC8CK2K+VPl13E4x
 PtjjBW49gNltqFR+AuVXrqGV5/2rThA=
X-Proofpoint-GUID: gW_Rwl2P307VtRHHVPgpqLjwpwEFVBG4
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbba7c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_82NC3t17uPQdkoQo54A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: gW_Rwl2P307VtRHHVPgpqLjwpwEFVBG4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX72AWAw7sPf4f
 wsTUx6bD7zYxXsZjVaEGfx0XdgUUXrv37pWc40FgyPAKap+AllUa73RLul/c8GiAbr27qTQt7X8
 BGpEseapqOwf3njsWvpvFKcmUJFSfFeYptR4Zlhv6ZaCmzcFgFpKhfZgBqhphQqaKbPm51kxkiC
 hAgsb2rEqCB8ytLFUw4ckSKW8XyXQuBt1heGM6JG9hJL+EM/O3qqvzy3KB1dKrnSZzkVvHD3ESh
 nHMdEvBWiJzjMQoYkBWqEvTTYBDW2Dai6peQGmACuSduplheiyJcZLI7JxmpXmjd7U09LbBSp9d
 L5TFSlxlMtC4A922FhAL5s6j8fcAvW/wMcUTIf+1jfnOWgiuSnlSsTnI5pCEFytfp8vj+Z0w7QF
 zSlrkGsFWuuzSMxMQZ+hC6ZA5XC5Hu0PA4QyOWB7f9gmtdsUkdF9HyH7xBU+sY2n7yzUekJqpAc
 iAFNSGcvgYJM/Qv9gpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-29 18:39:36, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
