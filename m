Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1F047FB13
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450545; cv=none; b=Fb10vxWR/WsVMLTBTddp8fhMjMR06zbQK/aRiktQhoy+cp0dHG4lEZNLCtdDxdN281PHk/OPKzctpNCxoCyD3lRBfnbdeFpIay/eYyvpooQzEVNUUunPv8vyM84TvDqvnmyqOoo4cGCxv74eFsahkf59rvZiwmESWdnreHMDiNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450545; c=relaxed/simple;
	bh=codICaEdp0qYugty23BI46Y/NC2M9dOLtRVF9r6NWNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bTRHEt4NUq5NkZs7SkkQCxcQ51YOBvqJ7q0hjNVf2PO07sY9GEQj+gtzHga4TVe1zpXhRuwmS4JWJF5IIYzyIrlq+/n10OcmST1aO/fMMQp6VVqL+aauTMCt8urqkGLT5rjTvThDXOTg4a9X9Q4lobeamYa/Mbvxenj1iCOrTcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SB6V9DkY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSX5BFLc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SB6V9DkY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSX5BFLc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KXhR1169988
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAjto0isROG6r68KXH8GRJqJeGgu2tcQNi03PKzPdiI=; b=SB6V9DkYAoSFiEaf
	fgi9NqFxXXY+wTMtMzHKk8MNnMufQPEpAR90ZOaDBQeamxYmXG2w2e6YEy5GM4h+
	v27UYJcEECTBBfU3W4+N3JKSpDtLZFD6vpHkNikWazK20QD7BTjWk2gO5zq5Xg+n
	gXj2K13JFwidSCb4C9OPpZjasy5w9P1vn3SfhBntHtzFOMuAy2g+caNH30UbUouu
	7/w2tKA/m4hZtEXkMfM8wG6LtFqzpfkK7xR6bTatw41NRYwQVnO4pLpSsemBSpO2
	qH10h5cPhXhxYs9dtGu7Uu945ODBhxDW7UyHJ3QcZH1Xxj8He3zrjZwCenEt6ffZ
	XJZgYw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a28w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:09:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-352aa273625so213022eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450539; x=1792055339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAjto0isROG6r68KXH8GRJqJeGgu2tcQNi03PKzPdiI=;
        b=aSX5BFLcNQGHVXxDMgeKVLARG+gS9SMO3zpzUUpsNd5eboCNXSEIFFga95Tr/ZB3eF
         RhQnuCgVQZ0oCwq2TTn6A/QK09zIHbMLvPTpB2vwiqCvqaIcrIwzsNUOAa4vdDa1qMNq
         9mYhlaL0AjKoNxKXBwOHdNe+He7V3oK6hMLBumw8qmJ6m0JYTC+/bDyxdjMEJj21Qwo2
         heDbPCUOKneSjPz2FYAdmNJLslsHiHZ8Me1uCw52VfHixoWgPNnK+gLnt68FyXfmCZaj
         l0I1Q1Y+/1XZyYFbC5qFVMgsUeb7NvxQ3ENFvONjGdju5JDy/PsvlkprEPCEo8QUKhZ9
         unmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450539; x=1792055339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAjto0isROG6r68KXH8GRJqJeGgu2tcQNi03PKzPdiI=;
        b=IXz6DmwwG3JikC+ZQaMiEHChOj6NaqmZTSRvU7QonPCtj24dc1QZtV2U8z5KddAOyC
         XVRlzk6fF5g0xY1+ofjbhGRIbEgkzlcul4RIkbRalR9KPNdCkJw8hxQkl/FFHbhGY2De
         LyRn2sNbazL65k8IJFqwnCwBPZOny8kM3I2RA4EKdRISftsbXJro2Eo6yeAre45l3yno
         AudSJ8av/LVb7MxSN9+IroFq5aMrvC7BAlaypolL/hB1ST/SUPn1HoxMsL6Ey8AhWQu+
         je6df7hv/mPSN3vjWlQTx4/mArZoDroh5+ti6x0kWQyFRobxVWtQaldJAfuZpuqw75Gv
         wZMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqAJG1XIzlM1zpVSMmnQgy3T2Ss3QNx2+6bWUueT0c23pzj0eZegco5QSgwtr1Ax3nAULSQ41ePtpW2d4=@vger.kernel.org
X-Gm-Message-State: AFuF++mJMYGNMyobxBom6kHY8Dfks6hVUy+7Xq1GJ4Lp8ZBDQFIMLizm
	UmmZQvd89ooYR3+SPVTefXvaKt0oAOKk3T5dousn1MqsIov65KkHzlczvJsAYtWhCFq4tY/8bZ/
	xhReOjGObwhZn+F/8zMad660stdQCHsoFDilaFPx8+f/cHx65V2ZaX1nXt5iKkEoAEjE=
X-Gm-Gg: AYBFou3DTaAbewMWiDnENXe4w15ouC5uo6Am9Z0fJ5Fp1iwZtfjcUz1qUaru91r3BMl
	btVbCdPYZFPlC47DwUVoU0r5awo3l0hFAow7hO1+ygBqTy13foc8uyaYZrV7OlvxeDoCAAlHGqI
	JvPmu/S5xMrnzAw/ZAU4OynkInr57J6/3ZVrveGt5jZQaWmAaJ4pvATPGM6ym4u8KD0srHsvQHA
	snvCOLIi6ioHqJT07YYTeXVRn1hXFSCuDVOSjeShXxB0aJ8iE4hEjBfxadkfSkkbUMKjqtvk63/
	oUlM7rN88kYsdv9UtnF8pCZSlrcTtlpwghHRTExtoxILuPDtHPEy5LHHvNh51nQJRWttmG3OEVy
	/EAsljiWJ+8zquGyv1LQm3THuxik=
X-Received: by 2002:a05:7301:105:b0:351:27bb:271f with SMTP id 5a478bee46e88-3515dd4c451mr5174607eec.11.1791450539267;
        Thu, 08 Oct 2026 02:08:59 -0700 (PDT)
X-Received: by 2002:a05:7301:105:b0:351:27bb:271f with SMTP id 5a478bee46e88-3515dd4c451mr5174578eec.11.1791450538615;
        Thu, 08 Oct 2026 02:08:58 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af90521sm25647665eec.19.2026.10.08.02.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:08:58 -0700 (PDT)
Message-ID: <5b895ba8-5873-4576-9abb-2130b46431ae@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:38:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark tpdm_dcc device as failed
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008-remove_tpdm_dcc_device-v1-1-48574c6ae6c2@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261008-remove_tpdm_dcc_device-v1-1-48574c6ae6c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q8sxxBpJczOObFddfbqvtj8XGB1_wo0m
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac75dac cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mwqT9ZDZRjcqunfB_n4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX4KxB3oOva4Pq
 2hvD6T2NrKes6oRAqblrA0jRzoKX39ktA4VeQgzEr+qi67bYjoWO6QGxFuFHadrn9dYCF0WbIRF
 PJrF+I1V2C35NtWPVf2EcP9deksIr2Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX/LYBTr3w3WNQ
 Z4VapVaZ1hcXhCZnkR7imGGgq7VLaGTz0VMXmhGzjDMg1yF1usTkkd+g0x7Hc9J5etu2ayUUrdf
 B0vvuc2JG2XyoByGrAuZ6clHSpeJHugL6RiTtPNLWP4FSIEBvBWa5XxlhuxkwWvkZO3ACtbAi4+
 fLKrJKOAdI3fLBPa1bA5ZwNeuEfo3skDYsI7dLB7U9Tm8v+ePl1ItV11fFJfVeL9eYIM9FpVzTW
 U74tAWWjSdFFEdvu6hyEzt6HDGxgWEIvpbrtBm0Huf/x5Z79SMAbar3/LBn/DBhDJmEAb3Cp5lX
 7qJNvpMT2Gzk7vFIO40t9ZrJzOfGqN2RS8fBM9yxtK15lFu9fOE3urKIo6q7PdvxYJdzrAGY6Zc
 V6gHa5kNeodpJ8V/SynX4jG5WmOSgCqOzwlvjtrUjGp7haajTrCpqEK9xQm1VSIfxRzypHlQqtc
 DkOVs5PIaXjXWKaMHPg==
X-Proofpoint-ORIG-GUID: q8sxxBpJczOObFddfbqvtj8XGB1_wo0m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

On 10/8/2026 11:38 AM, Jie Gan wrote:
> The tpdm_dcc device cannot work properly on secure devices because its
> required clock cannot be enabled due to a hardware issue. Mark the
> node with status = "fail" to reflect this.
>
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
