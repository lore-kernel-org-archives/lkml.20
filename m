Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694117;
	b=5lMCPafO1bORQ6IObOUTGPEsfBT8ekkyFrtNMmvWSckjTSp05kdsMUwYnEnVEX1+Ks7m
	 hI6mBGTGgJxhaLvPw2F4tDYrUqV5OmV4opEVlcktTw5UOSWHFbRc/wZOF7telwZ2mjGb2
	 Cv8+wYDtC1SLHeYTpQrv07qHa8OjQKd/3mnjiPe3DRs6wEvpvVw64HhJ+Bl4woHd68FlW
	 AFfA2naujs6QDNtB1JgQ8Sd7AB11LHTnmhlb//81F2PIJK83lt8bihzZ/QE1sUWfosHKG
	 +7rFKdEj5YPKXlf6QnFdqh4Msq/bsIFmLKSn5m75TFalYb+VxnjOAu7JM0FeYmSXL1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694117;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yLQRnh2hdGlVukDi2GeDt7GCNY8T/kIpvofHSqWsHiQ=;
	b=Bh2t+K/9eSjZsJ2QeZQ4fT/RusBEWWGIRE38i2K7+p/s/ercBD1ThlIOs6dWuG4hSM7O
	 qiwiV8oLujx1MoVL2X5I6ivgSZCUVacIYhTeeDoeulSAQeBNr5t/qKG0ylcDeKo6nqh6P
	 ehID9B5uPNRlUaFuDMosYwqpmyPxUeb3NkQdUD3Eb/yuyKVBiww1uFxlKckfufCY2N7JY
	 7uvybjnhIs9bf/syRDcm6Gw0OS8QTtWBqFtvevOJgCkIOf6orfxD8ejsJgjNm8UN3XXLw
	 QTZcHkRI/INp8y5VloIVWKSuq8OLJfL92f0CGK3nXUFjs6oCDRE5OufUId2n9bZb8zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJVYUhix;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXrDHLwD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185D1606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 185D1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJVYUhix;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXrDHLwD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37pl49470803
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yLQRnh2hdGlVukDi2GeDt7GC
	NY8T/kIpvofHSqWsHiQ=; b=jJVYUhixx967j2ttO4X3I1RY5j/nnJieQ6eYyvH+
	ALvOFWymp1Kw/xWtKRwb7JxUPkj7PvOvj2qZREyi+DjSkmsJeuMQF0Dv4/F5J58f
	9T+gr26qtTUpbxxnPBVBOpSbIgbL2FYQBCNURplYoa1Vtk3ZIO/7uduE7KdpWtva
	NJNm5u0Y0OOFdd516ZiyEeZ6RYRH74wcgbvw2u0kQIxX2Ge4bI+lKZWSjgB5v9b1
	kdwGRLjPWoqFOBmhqlhVJkkxH/r0ViNspS+C1qsVtQGj+u8X9ysgPPVD3ADSFFyZ
	RMcdtCgKeDpw4tIS5ZIgq//qs321DTAk6Vilp1UZuID/JQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081tqpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:21:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so5388548eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793694116; x=1794298916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yLQRnh2hdGlVukDi2GeDt7GCNY8T/kIpvofHSqWsHiQ=;
        b=gXrDHLwDcGr0jy2IYdwHzxamMMw05I5eI4UuC3X49SUi8JnTolpNAUfXAcoVx0Ob7O
         9qkEr8a7cCgWp9BVTOpfRrq5KcdVIRMik2zmSt6tXRS2yL2isX7euSmGWOcuGPUOPhEh
         2WzVHkZ4pYar8OJuB/medfHpHKsZj5yoKs5geLqIkfSdzmSX4YUS2AlKsyOqf3NKhcwB
         2LqYZ9OFq5tEe83a4LDRz/AJ24Tj9OtKo92TiftbCX2rVRHqL8uxN4cnW4KHJ5+DZZ15
         7rNIe9vKQaIcW4H4cCvbhxkXLlBV/eiFRHrmo5yLUyWiSr43fCPf6cnOPAW/R7shTktr
         NmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694116; x=1794298916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLQRnh2hdGlVukDi2GeDt7GCNY8T/kIpvofHSqWsHiQ=;
        b=RWuEse1+y8v/OnB+9fWmhXM5BwZVhDrECeOSuQH+s5MBxFTJ7CRWtVncyhncjPwQ1e
         X25OYUYh/AX/dsBfi6gGxe9qx5EW/6rGPRtd2xokkzGOqUATKprMVlbc5/GwjtHs89VP
         IsO+YTzayuqvNjOuFsWXSr+g9Bdt/9I+xxv+ct++JMqyvUNNmcv3FJogblRY1CD5sB+t
         nau9uQrIuT08Rmr6QImyJ90rYtfRX87X4Yb87vcX+u1PY4fGghgd5IH4QNVsVc8jXopU
         yH2s1JUJxTxsq01MvnVysxsUzQm/Hpliz54EiLd8Kjy5Nu5rPdku0SHKqx0yIeYHmwor
         RMJg==
X-Forwarded-Encrypted: i=1; AKwUvBxlySD6Q+3O2Tt9zIGVK+tdB3XC3fv9x6yOQdkMkXUOFFooj4tus2lgawxkOKp1huYTVQAi87tD/4lD1DU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HBPNH2oH1TzaIBDTCmz3bKxDgL3CysmNIfKQtO1F2ymRZ/mgs
	mVRhFsiEUvyhgKbdL4cO127M6xd3WkYgM3AYnhA0KwJ3iN7MUpjWD+oPyz3SVSFETlgGRwKWw7e
	OSvLsGPSVF5GQMYEEHZ4OKAJidzCsuWa87M49PE/ULoC6MGKCj/YP4nDPsJ2ZyQlCc+4=
X-Gm-Gg: AYBFou2t/GnI8sDxE4CbJ9EwRjIASjbmkFK1lUAH+rB/rr8NfZ6o6aNmiCJGgBOnXSA
	Weg/C18KODEoHIc+z/RDxfmCNFzO0e2Mptj4dy1dzcmc27UTg461+ckja73CU/lkmJWik9i/rG1
	8+wfpaTTao7jjPyJCruE3TpF2bTRleSokBohBolHxTSScQvigLDzl7aw7gLmVId202LYszOcAq1
	Y3Yw8WvZc+KUVVeN4XRCrFawYATXYDYDfabk+gOCwzHhhDLZ4gs5p4bu21JavK4xpKnsG/lEDUm
	vbKxLExIn4qxT/bIEiyCa/1gWsVZMGBOs4FI526JhJLb2N0ovzwRa6AjsKyATDfGcr4JeqUSj9h
	9icGVZzHgcJT/4cdtu6VokovqbMiV+5Q9UWT8kkLjYL0QnrRidFWh4QjmBhujgiOfgCHf668qUK
	tYg7DCXzDMVjqBzg==
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr20200302eec.29.1793694115515;
        Tue, 03 Nov 2026 00:21:55 -0800 (PST)
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr20200273eec.29.1793694114999;
        Tue, 03 Nov 2026 00:21:54 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm39999277eec.10.2026.11.03.00.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:21:54 -0800 (PST)
Date: Tue, 3 Nov 2026 16:21:49 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Subject: Re: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor
 channels for Nord PMICs
Message-ID: <aumZncr_X52nXO_P@QCOM-aGQu4IUr3Y>
References: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
 <34479df5-3f4f-485e-8204-3744a09ce08d@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34479df5-3f4f-485e-8204-3744a09ce08d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzMyBTYWx0ZWRfX6WzALKjlvJ/0
 adv1m7PvdZ+ohcDSb32NmjsQCEg4icbzJETJK7HZ/JEwO4f7HWdurHWV6zUB+0l4fj4Ws9HFH5D
 CGSynnkQ3RXr+eExmdPq2Yp0G8vkfLQ=
X-Proofpoint-ORIG-GUID: LQQPTYYM7Fgl1qTjkatdYrr6HOr590Tk
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae999a4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JDAaRAOIzmlwRyo0OuIA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: LQQPTYYM7Fgl1qTjkatdYrr6HOr590Tk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzMyBTYWx0ZWRfX1bUywwTJWqwo
 SB5EvTPPLS1oXkthM19Un0yOg0d36szM1cU6rJMy+dayBmOOD7gh1yu0sFDZDiq5DZJj5ePVCjV
 JxReol3zFRd7b1LZtTCpScLj6WOe7DE+YmWnz7MQV35k62cIfA+UBiHeiTmvFk1O9ewXBMynj+7
 0YRMWFEC0pI3cBrKv7Wzfwfsi6lWp/xXQaVNW+M3b/CjGCEMjvJIUYjTF4pz3qypec3Z5agd1bL
 BuP5SweeofHVvnNa39HxdSKNbTmjV8xY0c5289MoGLzNsEyH2XJl2Gj4KkSn+uUXZsu716vZO+C
 cPUe1w1jyqMs22D1JkEmDwwp8A1UeyWOPj2Na8ub7uvTXf78cuuRtrPbT7RXyr2dfxIVHioGFeY
 I7RCBVZPZ/umyWT3M8bjgJtludGJABiOAAnRqca2OrLBfILhUkl8HnagaKlaR8LmS7s1ds6rd1P
 uvZ5qpqrlfLMS7Fls0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030033

On Mon, Nov 02, 2026 at 12:54:37PM +0100, Konrad Dybcio wrote:
> On 10/28/26 4:01 PM, Shawn Guo wrote:
> > From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > 
> > PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
> > expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
> > AMUX thermistor pins are wired up, so none of the board thermistor
> > rails feed the thermal framework.
> > 
> > Only 3 AMUX pins are actually wired to thermistors on Nord, all on
> > Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
> > instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
> > pins are either DO_NOT_USE or wired to voltage-rail monitors, not
> > thermistors, so add only these 3 channels.
> 
> These thermistors seem to concern board-side thermistors, not
> channels coming straight from the PMIC, so these additional
> thermistors belong in the board DT

Indeed! The AMUX wiring is board specific. I will send v2 to keep only
#thermal-sensor-cells in pmau0102-nord.dtsi (for all Kai ADC instances,
as it is a PMIC capability), and move the thermistor channels and thermal
zones into the board DTS.

Thanks for the review, Konrad!

Shawn
