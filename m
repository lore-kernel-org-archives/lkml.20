Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620488;
	b=EsCEOfYAiA+ItHK2ydvblfDYgeCkMnpREqeFY6f4niEHQRWDfY4R3o0gk6Y7zVA/jDV0
	 Rh2rOs5XXC+F9cCdKOeSqCXLOWECKi2Ox2Za3sra8dBAgzsDzlLXvav5pBhtDgUyBgr49
	 UcUl+2ve4Kbi1tYXwhDDPiyIwUyWWzwPWWdPapYOBJRzKZyxNfhgPPE3MNO/jtsUPWJCg
	 TcigUyfpCPGxOBC+8sKQ/lwC6ZiptMruk1Sr0fCITEWKxl9DeSfn2lJByIkLwaIOl3VGu
	 S81X4H3SKCi8qy1EdyuuVNomoL+JI9IO6w7k7jtve0KPEYGWLbPle1Dq1dJW1jnB9yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4N3t4eDhampYwv7B5sS3V2bq9ATvW0NO8kdCR9rWbEw=;
	b=EUwi6GIBmuoUyymdky/o6ubAg6ChI8ROIsh4N4Hs/28RWiWO2IchGStDNYUycCSKuhG0
	 6IrmX6VWcCyMASfxUOjAdowHuj5ekeHs/tixXV3aL5mrIQ0r4nqUhYItHYwM5tU/fan7C
	 SWoJPAL4a7BG2r5GRBAbUhh6H3i6i6V5YGHfNc/2abEiDEEUVAdkZDHBRdpJmhNltvmrc
	 HE29KebilspdxZfhKIVm8J5xy4hN4BfC/LDP8GFN8OWQ6Lrs2GQgDIP5y2JDsAnGHsnj0
	 qbg0WZm5R/Elgz7dMknlXcHpF1pcKFkOuVCSISTr4yCIWgcQ8fxKpy6NvfHxN5pJxcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3bRWMVp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvXxk9GF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC504606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC504606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3bRWMVp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvXxk9GF
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1g42466158
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4N3t4eDhampYwv7B5sS3V2bq9ATvW0NO8kdCR9rWbEw=; b=W3bRWMVp+/iuWIhT
	sG5pY52IZ0yJhEEwBCO3o58i+kUz6HxjW6gnDjz46lg2cugQrJYe5qscPdrX6EIS
	YrZpp/i6i7HBfQnTFWQ4W/E4jTADjVoFS+Wrg6wi69EW17zJyOHDWoxW3z6dvf8m
	lml2+4uKy6RAxwyqR9d+/bLQJT8jFILSfoLSEmoOEXTHZE+PJqeL9zQ/ebfnimxi
	aSGtaEqTw5sSHuyGauhyf8bF5FzdiBdCih7NaDv2BVhk5GAkrm9p+rINg75P7iBU
	XfOF1BrjKZLOxQzzkr6CBjg1exXSJihqsrerrVSv77114bLe32Eew22pBxI1hRoA
	5e9uEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhn4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:54:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53630cded29so4735691cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620481; x=1794225281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4N3t4eDhampYwv7B5sS3V2bq9ATvW0NO8kdCR9rWbEw=;
        b=bvXxk9GFNgA8D9vTd72Lkv0tK8aDlBHRk4bFfnGmhcC0fhzWlEY2Zifhw5mSZDVK28
         lmCouDcCxUPMj73En76TO2SU4y+rkvMpPNiQDGsAOruUQVM0eHjFOvd5dNw7QiTvGnoi
         tHLCuSHgoPYHv/dIOwADilIn1e05mvTa1+CasI2559DCWChRbDMSZuNhM110nmYW9D4g
         guVtek/6To3XJuJPnecaOP7QMYe4ddZt5E15m8LJyYa4qRiuVr9Oe23znTh1gccv/jM+
         9ozBqefKGT4+/tg8tD+pxA70rZv/GLbBLqeADk7mU69z8eKWv7B+QNnV9c4BcE6kcmXs
         zilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620481; x=1794225281;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4N3t4eDhampYwv7B5sS3V2bq9ATvW0NO8kdCR9rWbEw=;
        b=DDYJECsjyerSPvpK4kdiOCgSWD9oyIMzyNp64Uu289lI+1KjvIwkcP35OODNdyCqgK
         NXSAWiOLNPXSyC70aBipAGsibKD5zBB+Zl9e8nk1Z00lHDOuD5ku5UaJHC6K+d0dvP9G
         NAVVos+Y6IKyC8jpt4BRk08I2i8PM+onQKI+Cp03Xsa2RKYRpvHdmdQWUXjF8IWhgoEK
         2Y2ENMTaZbLi5eDtny76vD0erhZyXacQC/kAxAib2WjrfFjkI+HJACtgvYhGsqQjXUSB
         6wRinFDDT0snQYjM64rj4Y/+Wnn5YX2z+HDI4pf9vzmYqNf2v6wt6slFEduQS2EXErps
         giCQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3UgsHK+UoyAc588LWrHrPX8vBc9rvz2IMSrIkVkgniAVRHNSV0MtVtcZVyOBbwqeotwOcJJwXv56QuUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkoWSYKxeqsdpyhTW7Ocu+Bnvx5YUIhNSaRWeuo8uaUJFQ7OmS
	tWDXYyckCvN0g4cLjgwFOwrUCiZM0Z0NQnrkMNC1nxIxLGJQ86c+3eavCAZHCigner3DLKPy8/c
	S8qzuIamGvadeckPwYI4JDYiHbBC5OViwYon7Oai8mTtSJKsWZKVR854JFkeObphAnaLtX4aely
	Q=
X-Gm-Gg: AYBFou2djiy6KklN37wLtna15TTmgwf3liGtRfoqvD6sPnGTidCENtTS4WBbg7Yxjve
	cbjwgZY6YDKWpXoICfk6qLFrsQsVP9/WFEXb/IROMkl8Y4luWFyayG7JupWCjz6VnFTMzGJDVP0
	XJN06c5CvRX8y2IuEbw34oDc7mF0DJeIkMBdz4JmmX0OJ2G1pX4N4pD/UybeNR76+fc9CYjqDfc
	0Bt/ACp1jenHD9Qut8YVDEli1Vx7XbbY5YbwYyr1SFXlxsJpClmqJzdKbndXECYWxq+2WRX8tYP
	eZUvXN20wyjM9+wIh3K1w0vwhJmd/WOYvEF715w0b6VGq5CqLamrMMcYjct7t4gkO4jKPnhbmc6
	NgxMGzNsKrdnnwBamDMVvE0RNjTinELyE2uHHCrt4aTdkZf9swRGYHm1u/efQsxTBb7MYLB4=
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1515922685a.3.1793620480908;
        Mon, 02 Nov 2026 03:54:40 -0800 (PST)
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1515920885a.3.1793620480494;
        Mon, 02 Nov 2026 03:54:40 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe10133sm376949166b.46.2026.11.02.03.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:54:39 -0800 (PST)
Message-ID: <34479df5-3f4f-485e-8204-3744a09ce08d@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:54:37 +0100
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
Subject: Re: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor
 channels for Nord PMICs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
References: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e6lF1DoC_g-L8GbzlhihKcKxb134Kobp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX3p1yqSVV9MvD
 FbnTVGI7vQvoxf5EFnloIzln8sgpsVm2NMHEDuxZ8hMN7mWiJoIlFrVuLsJImAZTxzTQijBPF2S
 qG/ygnuO5UK4gj4ZEAu4VXPG5EeQdRlYycxNiJncdswJYE2GkpqbqmX6zv7JQcGrXWFo2skMTGS
 hDbaGsP57WV2iFKwf++geTnsOVNt4tDoxLGRYN1loIQzZZt6s0mV/k8hDUGXByCbPp2UfjeQiX3
 Tu8xFexgx3L6+mjRwpfnnUG7l+NFfvgFUTR3rw1S/HScOl31sAmj446XF8SSeNrxHq3GzvOQVHW
 pgrM0xu+cdC7wSo412XbgRRG7Pp0PqTavkh3EqkNvQh48k4TTSfV4kWDcNvhaNp030OXfQsf7AB
 lUr1LEyA93JZF1D8qd1KXSYO4FR/hWZ4vsNcxdHMzUzgfU80iCv+Cyjby3GjJL87Mj/kyOaVbvp
 2dl7bPRTAgtIuM1RT4A==
X-Proofpoint-GUID: e6lF1DoC_g-L8GbzlhihKcKxb134Kobp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfXz+5vDCB4SfKR
 QkqCHH/0/qKWJKfXp8KNxqZE/QIlL2II9sHI0DfHo8vHD7p1twZPECtFPKXJUvDLoVgkZp/5MWh
 NfP1vSQuIWP9df0yoS8Z5+yNJ8RenU0=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae87a06 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dR0caxw8Kkv1fo8ERtEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 10/28/26 4:01 PM, Shawn Guo wrote:
> From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> 
> PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
> expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
> AMUX thermistor pins are wired up, so none of the board thermistor
> rails feed the thermal framework.
> 
> Only 3 AMUX pins are actually wired to thermistors on Nord, all on
> Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
> instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
> pins are either DO_NOT_USE or wired to voltage-rail monitors, not
> thermistors, so add only these 3 channels.

These thermistors seem to concern board-side thermistors, not
channels coming straight from the PMIC, so these additional
thermistors belong in the board DT

Konrad
