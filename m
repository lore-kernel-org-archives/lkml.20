Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B3E369208
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185792; cv=none; b=ml9uqKYWVZzLFEyH1CiZQuB6kFUsv62EpYdwWTlcpFDuReweJwyIjBE6/OxrGockbu6eECf3IY64XHtotTgZJWyomWYrq1ATuLyphKu4MLPVSaQsaweb8hA9NVATtwTPMvjTzNx1cvOpwbZYk3bCxFYnkBpzZjuXIc9v1mUyl/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185792; c=relaxed/simple;
	bh=3rr4LwQX+nXpLvqjzfnjc0qC2ZiHpp/e3plWdkVTZCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gK7rcN3XWJzfEvZ2jMHf5MbBPW0o/+5ohWOHgB7RMev7whr8a/VnlB6fUlDT1aU3suroYgHG8GyCJuBey3AMgyEensHSDtXsOdeppd9vZfxyzv79RNo///546XQhHkbb9X2AfWftipZNgu3w6jBBWBtEl7tGpX60IdE/ySjlCa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6ZyBoBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXtUCStG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6ZyBoBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXtUCStG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695103pc496788
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvE90PLb4SD4ZAizJF3vBu6QMBqFDMhNe9329Pa7vgc=; b=J6ZyBoBdS4qG/SG3
	fLrM9aS1HOXqeVEVUw7J0btHNRL8pQ6PKQ6oneRYPeht8aw29WH8TGBXk7kUaE1p
	oGa9isbudNyrLgvub19f7juWnYFyXX2ZlukGZmD2VNvbqiLC/urxxfMUZdzmjW1Y
	wk8tK5coPRYXmzPDmojyPdhwEf1W0d5i+GRnv7qgwfzS1hOEHB3SrSVodT1lwBbw
	Iz0WCAPUtyvzTsFb16XsZMvGN/mURd07G4NfdAbpxWBeyxUYlL1D6Jpqhg1yeOW0
	O7cEH9yNuIrFU1hT0L89HWACH9wmPM/k6ApIhE7BK7sjcY5kV1bv9F7USnlXdcZk
	0ma1tQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgys5rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:36:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88a10162189so2534434b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185789; x=1791790589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvE90PLb4SD4ZAizJF3vBu6QMBqFDMhNe9329Pa7vgc=;
        b=YXtUCStGoIFiuzDmiGh7ive+saqpGEjKCzftzyJ6URolC6RTpxJ7UnSfPp6gNPNle/
         kcjNaPB9nkCy02Ku9uuzVflNgPG90+LcTpTOVt7DPHXjfXOZ+r1EsxJpBRdC2Un3m72R
         5RI+/4MQZQGxfmbxUNflDh7L87Pk035la7dljHsVce4Ww4zeC05rfbFzShKnRzQFghgo
         KxjvMrefsN7yTtBW72FT0Z43XyINJnGACcvWb62rGHh8A+YuubVRUdGJppvPFPdCj1GB
         ExP7qNizVkAGiKZGoUcpaEkYAIc5tIj/cQNCgn3hFUS9dV2PcjFoXM7oldyaqcYfcq0x
         WgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185789; x=1791790589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvE90PLb4SD4ZAizJF3vBu6QMBqFDMhNe9329Pa7vgc=;
        b=YUZDKcuLh5eIg9yCnvROptYAkhKtslQH/zvothcv4ppV4c5P8md3oBVtz95Eh6gilz
         L6/MWLiAslrzpxzHnn9gPmZlENUmW8ljbV0S8HK2sAR3lLjiG78MFtye0gKjsqi6D0GP
         WSZ9v7oGfYswQqwsvfwBfAjWUOn+ioVCBrGT4IPmiypAvIGeP2vAWGvfRLxxoZqbNeqg
         A1wSx/70kCVyJ2m/iQ4Sk9Xcs+47JXUFhmYzigEjjl9eUA63WYcEQnzEQSRpJ3vKBy5f
         hVBzrvTbIpaIsdXKddbalY/QX+D0RqggNaUIzLlsoCsA9gnCZDLaytgbBetQ69Na4EK+
         iRrA==
X-Forwarded-Encrypted: i=1; AKwUvBy1PB0+0WfupVpwkrsINOVMEZWVVjiFTeGnZ59eL/x1Y0TUM/TIH41bf26xWkpaP2qd8GfbYzXLHqYVOic=@vger.kernel.org
X-Gm-Message-State: AFuF++kRTEtBHmwBAL4xn6n9AEpIMaC3qtht4InMwUAG4ovbmygS5XaA
	vg02DtHXN1m0Xw2lykkkAHmek7fAKsIyqZi9SXOevXsNGLfiDx1ZSen7pKY1Kyn6l/dQOEqSoLf
	jks4fyZOuF4ChSRZ37Rk/GvBw9C/YR71iSRAuJI7uzsu6o/vQoSH5Pu1eM3ZyzpS8eec=
X-Gm-Gg: AYBFou0xzz2dTy3b2ZbtvYGsREczEFzkJdVS38ywud7XVcfUOdthplETt55NRR8tPOk
	XWDOG5qxgGwIZT4RHecW9+iltpn6/BRKbx7PeivAD+3vvmrVq4Pi87ROf0o1M8ex9YSKu50S3Ue
	KUaAdTntLFfhZBFh2DEvoDR07qAD1jucr6IMqH8ghkPUw8JVeetNfT3oYhra/IoIkwlbGEQMXOs
	gVNMeHbvTHjK8B0rQA/lr8VTpdart8s2VyyM1GXM0wwoIqCDyZCg+DnIoqu99PV78lZ7s6wzXxO
	08jDLf4BiK7vd1I6oZRuik/d2+a63aYS3a52t2x0Ce+JrWRMwfgU41QIr/VQ1BsW30WeqI6g2E6
	LJjeS5wXnuHq/bQCPgZV8XTj9gsE=
X-Received: by 2002:a05:6a00:1251:b0:880:8fe8:a3ea with SMTP id d2e1a72fcca58-88c6492f52emr5380495b3a.45.1791185789186;
        Mon, 05 Oct 2026 00:36:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:1251:b0:880:8fe8:a3ea with SMTP id d2e1a72fcca58-88c6492f52emr5380480b3a.45.1791185788717;
        Mon, 05 Oct 2026 00:36:28 -0700 (PDT)
Received: from [10.92.214.69] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88cb27d93bdsm1759232b3a.30.2026.10.05.00.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 00:36:28 -0700 (PDT)
Message-ID: <53724835-33ff-4746-81a5-7017b84453a1@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 13:05:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Add WCN clock to wcn3988-pmu
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com
References: <20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com>
 <ar3LTBFtF_qqw7U2@zenbook>
 <0eef230f-1db5-4419-91f3-ba220891e577@oss.qualcomm.com>
 <284d1013-5bc7-4732-91c0-87a6c870a349@oss.qualcomm.com>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <284d1013-5bc7-4732-91c0-87a6c870a349@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2NckCOLh3hSNxvAyFcqxhc6NfcYlEucf
X-Proofpoint-ORIG-GUID: 2NckCOLh3hSNxvAyFcqxhc6NfcYlEucf
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac3537d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=J9omWgiKjRi8sk1810UA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzMCBTYWx0ZWRfX3ZOwbTU0PI6+
 5O3Twa/gUoC9dB4WT9ivg1a5s8+ddd3ATnK0l6E8+7z6J1NPLoQyLsZxzzoeqhmQtH2Io6BiPZg
 3lzi4SV5G7P8CUWTX/YSsSnEYM2vHcdBZ0P1s2eN4p6QXWzMCJKzq4du7mJYCrGyyD6zKnJgsF9
 QRjICPcwKX7ccoyhrtKsxZrKFL4aC8FQjWVLp1eE3abiV7zfJMecmr4J8Hkw+qifkV0nm/vyB8c
 jUbrPK2k9KtxTilNcCOwLFH2LFDuJN3Rj6fJAMlb65F8SEEIju8EuLMp4PC69K4I0XQTawtTOqV
 cW3o4MsyOloEhmcp6pYNIUdXLHAUUyYrIZWknnQPkF7X2OAeARI+CdCTgt0cj+UZBca9Mc+tu9w
 oBYGDs0+QXIOBCa7jd6EOm21H0d+5oTXCrly6dnJDvS1cOOrUDHLRwvERgJCWuMV6UhVUATZtdF
 14+U3FagHdmCMDS0kBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzMCBTYWx0ZWRfX0WH01M/vgYAG
 iAB8DJ/ODhBpgiAG9gIjO/1xjIImU9HU2UDLS8195xnGgTG2UncRWn3W2oSVvEZTSsTubnPnRLx
 OGPSCqq6pY2wKwtr3JhlHAKzxRZXy7Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050030



On 10/1/2026 12:59 PM, Konrad Dybcio wrote:
> On 10/1/26 7:12 AM, Yepuri Siddu wrote:
>>
>>
>> On 10/1/2026 8:28 AM, Bjorn Andersson wrote:
>>> On Tue, Sep 29, 2026 at 03:31:29PM +0530, Yepuri Siddu wrote:
>>>> With RPMCC proxy vote removal, the WCN clock must be explicitly declared
>>>> so the wcn3988-pmu driver can vote for it during WCN power on/off.
>>>>
>>>> Place the clock in the wcn3988-pmu node since the PMU driver owns the
>>>> WCN power sequencing. CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses
>>>> RPM_SMD_RF_CLK1, reflecting the WCN clock assignments on each board
>>>> variant.
>>>>
>>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>>> ---
>>>
>>> Why do you have one problem description above and a different one below?
>>>
>>> The information after "---" is not merged so the git history only
>>> contains the one above - and there's some interesting details in the
>>> description below. Perhaps this is the b4 "cover letter"?
>>
>> Yes, the detailed description was in the b4 cover letter body which
>> gets placed below "---" in the email automatically and does not make
>> it into git history.
> 
> FWIW you can simply ignore the "cover letter" for single-patch series
> and leave it empty (minus of course, the changelog)
> 
Thanks for the tip. Will drop the cover letter description in v4.

Thanks,
Siddu.

