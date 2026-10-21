Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569139;
	b=vf8Gv0tsR6Vv9Lvl/orspkH0cTcdmQZTnxvbuXXq+4/SAV74W0+zHyBYTd3gui/ur5go
	 YtgPR4mIMGgLOYq50Afm2Jqng7lObYvqAU5HA6j029wy5nRLxE1tDkx8xGrXYH/OZDHSV
	 X9FRbi7/zNHItsAOxTNvboBuUaCvRGaSsOvNR5Dq14IGHrEekm1iU8HKHM3oliELq49O9
	 GLYNCHozS/himq/nnSsJbG+ippwJoNwR33A3/EgbC4X6AUUWjb0/aYktd3rhrNaovBYYF
	 4y1424TCMkBcgj9Qbp8LQxkPr8KwjyG3RA0Xls6PHhbpjey/JXQiIbO0DACGH9QNRtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
	b=iI1NysnuGn/O57XNZ/G4Pw98iJqTT40KEpdJg9fo7/4ENx5+IRuU9BHULyM3Sh9hVZf7
	 UadSGFxIfq/tn3+xjNmCiyV3DQlbI+TMCVTaxgIYDx3lm3hVb+YCjbDDETJZH0ovHJhs5
	 ZKImFf0u5pFsRdCcHbZPmWpgWam2ii3fnGyAqZDxD0CT2iS6ico8w5WLzVtfx05HO89kg
	 HQsp+QR7+mNISOlSbqctyAY2P3sJVBXFSTYfzlpRlRiQ3fJG+zE61t9vKkgyV492pSb0x
	 ZU1lHLotBv5YUfe6tXqxAmJG8qQnfoC+RbhEd/9Sxy84/uLobdhGE3hrS1fD/61alpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AyQbDhhI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kaaNZghx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76228606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76228606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AyQbDhhI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kaaNZghx
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j33V3355940
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=; b=AyQbDhhIrkFWR6Vk
	Qi2NR9JA3Zl2CUV7EWDi6niUDRqZIXrxHan5CO5/E/BXU7ve/rdkbmA1nMYiorTj
	uUnreypvOJoV9NBh7qXqdcP2SpKXHgjoLhz89Rwh0hy6JheE85O54i4M3fuBy9+K
	GPoUifUKk6HR/ZvKSW5RdHvWNFEesfA+HyQp4k8orY6iqKF5XuUB1191IkbZE+8P
	plpke5EwWoQ+7NfxTqbvPFLeYU9SR35EZlpu5h8sxqbblJm3JCdRo8AnJX/ALU05
	F/8Y9yWbh3i75DhlSJm/79KrlTXj29up/7QkDqsFQj2p0RS5n2rG7kpyuT0V4JEd
	ihpS0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0jmxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:52:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so13426285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569137; x=1793173937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
        b=kaaNZghx1V1tDVFBtfbOHdOEr9Phizi5xlJ6ERiWDvDbI05JyEfD8rWGP5+yvkruew
         TlfhXByCfoj1YkiW/fDODftvPmJftZIjr7Iw46dmmKiZZnoy12TAeIbExF4QQEj/EMmR
         gBVn56zqc4I7isgfEVvKVzPVOPVeYOFh9QZzb1uf1zHmZ7QrFXBZ7w1lQLvXfozybWcZ
         HQSvEbwYmprFOVV6VFjgN/6MewUKUNYD4bNMRVF8lImECzYCCASqyvAMJ2MXd3qy2tbQ
         dfquvwSA8MVDVame3bezw0dSVPs2SYFy8qtYfhPrgCagyVqEna3l6E2NGwAfAE8yyKW5
         Em2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569137; x=1793173937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
        b=k/kTOTFXIpxqthqhpMIEHvdhkJDt0mQTMqKe/M33EnTz8hGVBSqqyai+/T551KS6Cg
         BkSvX9f2KLVivrHNtcm5hsE2B0F4CPWfs6CMbFW90VNr+QAZpY/81gm7HDgMmtnCi4fd
         L54hEKfzxN4eTyH+q16R7xxaby5p6cMeghxwrJE0pKsKy1fcqJFZlYhqQ9PSWCJzej1X
         2Ko+Y9zrEE7JIfLyf7bLkg9/lI5ySfXh6H2mGs8/L0N8FvdAHA8ODSzbHxZGyqNeAw1f
         3a8gt7LtW16BXhiwcb2O43K95eg17wPYQFzdg0JReUnPSynXqSYxBY7AmpGHt5yci9JW
         cBbw==
X-Forwarded-Encrypted: i=1; AKwUvByvTXkMetGIzI6uqW0YFAhuN7ifkdcDlFTEcV2yqxmnpPvtYI3XVcZ9SqrYJLfz3yFH9U/rBVaXBvUAGG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1rDuyDA6/fJvjjocpCT36sttP7l8loPBNXgk71I9ZO+LeEEJx
	bJfVO6ZlZU1nyHH+zXMQ22GYda7ezPjAwS9hmzyss9RDAVyUrVLevnBW0ianW8zef3sqW5v6Unx
	c3PHz6fQVZNBZmvp83C6udFCvspH7NdmbTuXU2HXGaPVX/cmGyodfm1P31vfv6sPiI0k=
X-Gm-Gg: AYBFou3QaouuSPg6yzttEhNaLq6uA1UUjesvDIK5/qTq7q3ScIla2R4UW9TndqYmvQ2
	i814Yuk0W8KW7lyVdltKwPOjLOd1kqWueRRFWBm71wLHjHootZ7BxeYgFNIpk7MEXfKCKiR73Cg
	Pbu7HVXri1qUb2TMFwtJniSAFDggaaclmcVTMA6tyynnxmO1v63MlsLp67sdSba19vCySnpDtsa
	m7As/vdCMEFlerIe6BWDQOPqJkY0cPeOUgfgBKFyDpE9xjpa2vUBU1eGe0vLqu8fVisBoOCu4rX
	lSOY3I134WFraJh7zYYAviehRpXqkbDxaHhGJfZf/+p9oV/6P75WIRgSk5DHEO0OVYKLEhT5dH+
	iXSnsXtHnPP1ktk01hTh4Qg==
X-Received: by 2002:ac8:5707:0:b0:535:6cc1:589b with SMTP id d75a77b69052e-5369b4a11bamr23256071cf.1.1792569137616;
        Wed, 21 Oct 2026 00:52:17 -0700 (PDT)
X-Received: by 2002:ac8:5707:0:b0:535:6cc1:589b with SMTP id d75a77b69052e-5369b4a11bamr23255851cf.1.1792569137150;
        Wed, 21 Oct 2026 00:52:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679009aacsm49878266b.78.2026.10.21.00.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:52:16 -0700 (PDT)
Message-ID: <08dea1cb-aaf2-4c62-ba9d-8bef2d6d44a1@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:52:10 +0200
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
Subject: Re: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its
 FIT image script
To: Douglas Anderson <dianders@chromium.org>,
        Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
        linux-arm-msm@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org,
        Julius Werner <jwerner@chromium.org>,
        Saravana Kannan
 <saravanak@kernel.org>, Will Deacon <will@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX4Hed8n4JpdgI
 qDcmr6KKWzY8eCC+OeFJXZQthYjVn4u9Vj1RYboV01p5E/7h3uPS8Gx4nghgziWY6KzF16WF7tm
 yYeBq9gJEGl9wIC8OpLh905nw+zQztsq2ey2xSl90RK1e2yQ1seyOJX9vz+O3G0WyB1qDlH+GIR
 sATojvlwjKeuB/bq4ZFrZzyMgeDBOnWyXhHpD6sgFwWHq47b+74KAFRhtDwUzAqg/LTxygj3S9l
 ooMYeYevv928pAf+tDIB1Gd9HGKhYrcrRAJfSaaiGwuoISRtk+72ETsr+tJb7poBAPTqZ/iF31E
 bO7IpWlpMrCR5YgxA2wTbxXXC6hIQl3LOuNrqhjU+ygK4Rxqw9ooPlK4KktjxDJFfuUg2iomuxp
 KoKB1grrf3lg6pMN621+IURr3yr8xoJk9/WvjcjSMqKs0s6ohBCfhbNARGhm9gbDEwfu8XCqts0
 1PMwk4O4ccd4HxI/mYQ==
X-Proofpoint-ORIG-GUID: nYdHUGXkjl1SqCi9phQQ6W2ezz40bb_g
X-Proofpoint-GUID: nYdHUGXkjl1SqCi9phQQ6W2ezz40bb_g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX77cdqiclNar6
 gkn/MQbMs/DKLYqMMZ5DmJo7RgNlIPWIVqfsFEx19BhqLvQjd3zNuhZyy44K3WlQV6J5DK/F84N
 aQvIscjdorZV+EbmUgGcsAcmbyEFer4=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad86f32 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=hCCUOKFY6uXp-TWS5dAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210031

On 10/20/26 5:35 PM, Douglas Anderson wrote:
> Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
> image for SC7180 Trogdor family boards using `Image-framed.lz4` and
> LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
> to be built with:
> 
>   make FIT_ITS=qcom/sc7180-trogdor.its image.fit
> 
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
