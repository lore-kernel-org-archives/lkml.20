Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A474C957B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728748; cv=none; b=dGCrc+zTSagQFqMkw3YdgA7KzxwAJ3nr/UYgKxpSa9lG0L/apKsB6RYDlevUIPZLWyEj1ILxZyeV54tzRzeHIt/DpOM4wSvCde1sMvae8+lAmUckEL/SniIBKcVWOsJsjJmNjrRKhE1RJiCf2Nr6hm/ZqEx0EvrW9E5aXFfkv1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728748; c=relaxed/simple;
	bh=KmN1ZuicIl3zQnKA23ZR6JOVKKX7TbTIEnZT1K3ikZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6q3DAL6MLHaY29UD9yHvfxsfh17r4W8MoCSposYwL46vAFwJwQI7GFdG4IXTvHcF+RMmWsS+5rAUYi4X538XY480gZb989xPvjFmBtHKJvfVsqgXQqjR3vQwwmEvFe//teyBzzeaDdvgYYX40Q0+ki/umvzrx6sockudOP6Kl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNyehHMm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFXxIIgT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNyehHMm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFXxIIgT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9eHbR522666
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmN1ZuicIl3zQnKA23ZR6JOVKKX7TbTIEnZT1K3ikZI=; b=LNyehHMmb+JfDwnk
	sBDEIrsc97u5Id9GEQVz82GsTG1DwAl5yduCOUaw0ROZDq2FkAyDN8aRnHadQMeg
	b2HH3DztU9KKK4bbVrUCTGdz/yjeHECsZvLwpQXp7LTGcIP7NJMAaao0B4ZsvzMH
	IIPC+RIYbULQlaQU17BNBAZKZmdBx3APYpoF5KrUX9p0CcNg6S6ECrxMbVEHUupz
	XAmkBPTjJa6N3xJvcBBWdyubmXmnenonutrStYGlbpLXX9mgpiJnt1A08ee7vqm4
	36Dwh7XZv80y4vjjbDI5dXxtn7gpC1zJ2XHfc5BPj40/w6KUAkju5YGuVeiX9kEA
	j/UpmA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqebhyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:52:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso798058a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789728744; x=1790333544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmN1ZuicIl3zQnKA23ZR6JOVKKX7TbTIEnZT1K3ikZI=;
        b=RFXxIIgT8TFnpVSk0DzhFS1+AVrzQ7GE4VLoPhFEYEDfOJx8WRN639hcxu8t+4eYRu
         K+507eV8d9Gbt3dl21NbG/DPtlwEFFm/PmIuhgbypF1V2VVzVaOX/5J2Qw9p14xp4+01
         DLYwN0n5Ax9gblx6ttsN1GA+vuDINyGEzlprOBV6+fXjaTs+xyhmVZ5rDPgiTSq70fTw
         cCLr1PIXgPw3bbyy/KPDhfq4TPCVuLc3JXnzZbYO6aoblLYfNEtFHnLIHVp7RnJLr4Xf
         HXe0N4kCumvVERXsnBXOhXdk6o32Mp8WMNhrV1QIrhJgRj7nlgUPZFJ4xzQ/yiI4X9rX
         G/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728744; x=1790333544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmN1ZuicIl3zQnKA23ZR6JOVKKX7TbTIEnZT1K3ikZI=;
        b=OyRBCDjTCk75+LQ/7iidfgRQqmZIqqNF5AUyLTTDrdQUQsL2L1hLzo9AfQMKXPSsKh
         Ra4VNV6fJ1lY5BSaKwnoKnXYBPwbLPfmmuwhPz4jWA3AhyAbSj29HYGHmEy8oEsFxNaR
         XwGIFCgAuAQTkjL+Z/w7zaNZm7KUp5230syCKXOHzK9HIvBXJnk+TUXlagm4mA+XEwC/
         983CHX+K3sQ4WyW6AOk3o89DfE1ZZk6zJeT44nPiqU8mIBlYbIaaU4xAJunYGdQwcBTN
         74It5bAEPc44TMoyr8lp7qm08qvJ38P1x9EMLe8UUaix1mVouZSjgiSB/IwlJmVmom0B
         vMLw==
X-Forwarded-Encrypted: i=1; AKwUvBzHup0GiuVMD4ZnYPPWDHGjPWMCNtT4ifR4PC+qab7Ikjg/YiYf6tYP2Rd5y/fNf2sfJ/jxhrWKefnCtks=@vger.kernel.org
X-Gm-Message-State: AFuF++mKTuPd5alczMlM6TS7CxeRQFxo9P8FSEc31CqVumKIO8xVTzN1
	AUj/z7xGFGrnakBk5j45rcsHkrHMTvd9ba7i5rGlwsS+KmCPoLF2tWusmsBZTuMAiJ97qn73vlG
	7AlBMa/hV13tA4VXpayA7X4k+Y/zJuGs1IoqkNHC3QIY9NmY23F1xnR1O50KsJiUN6W8=
X-Gm-Gg: AYBFou2svc4lI2gVlwKrFl5xU+rDxy+OE1iLh2u5q9HJihrYaIdVxqj2Bckphp3+e2r
	1f2G/wLyHqvjTQ1QFjy5USYouTzLftV68owqiaMHiedCCcua+Pl8elUcioQZv6ayKfc1UisBcXH
	xcwab00G1SmwRVAVMygqF4WZLp2/A69xxa+CSlUBq62/pZ7n0ge8u7LDqwO6t9f9QeQI57lYCS/
	kN/YSPfUGZg0nsBLWRCzSx5LjCFcUhWGcUFq96PJloTsG6IoRzf3E3if3VK9dlg+cE5nq98XQgA
	X+6FqQ9ojyhMlVXD2Bdl04BwqoTwT7ONgffBlRjW2o0FIzOrOT2cI/DYkVjpNncKxmjcUq9dzTt
	RcrX1gzsZo4At4fhOubryhyn1i2SdxZ6nQQ==
X-Received: by 2002:a05:6a20:6f09:b0:3d0:abdb:de03 with SMTP id adf61e73a8af0-3dd8c3f26a2mr4358674637.2.1789728743855;
        Fri, 18 Sep 2026 03:52:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f09:b0:3d0:abdb:de03 with SMTP id adf61e73a8af0-3dd8c3f26a2mr4358630637.2.1789728743466;
        Fri, 18 Sep 2026 03:52:23 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c287b023bsm4369596eec.23.2026.09.18.03.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:52:23 -0700 (PDT)
Message-ID: <6e314a3f-c73c-461b-86c7-472ef02e440a@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:22:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] bus: mhi: host: mhi_phc: Add support for PHC over
 MHI
To: Jakub Kicinski <kuba@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Vivek Pernamitta
 <vivek.pernamitta@oss.qualcomm.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
 <20260917074804.08818813@kernel.org>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260917074804.08818813@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F0XNNYrpoBdToEnsyUptF49BmISma8oU
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad17e8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=BgRFT2qS3vt3802lDrkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: F0XNNYrpoBdToEnsyUptF49BmISma8oU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE1MSBTYWx0ZWRfX958kc/TqpY8C
 Hka7F57hQSIl5xJ/1uohvs7KPH8RdtEBXhR++2EcUtgDLSR8NpNFhaBvOkTZIoXAwaDy1dXeLkb
 115+UMe2RTZBJe/RL3A1J5v8Dt2qnYmmBLcg+WwH5gnSVrdVdiGDcCxPhvdW651fvrR325rdJdc
 uDcA8XT+vJSo7/QnGnONpxkYUZyyi2ze73LSTcZeFsPhdi/rzDAXUJ8ZVaqhwg0g68Aq1J1x0jm
 3cG8dIi5SKJhYuGDMxff6FbplexZgMWHSIpEeDASYv+QCfyY5Re8p7/90CU77HJXddchryjcpIK
 kBKylD1NIriChyUmK1ir6qwSB1G24CdBjnhuMV6UuuYzgzlJ6AnIZlLWLdyOSc2NrwBybaQm9JP
 kQtPaxUJKF4tvk8bnI6eIdAqwELYp6UNqM0lfyERiPrip7p01kVR3wV3luQqhoS+a0ke+CcW6sO
 tFo07I/IWAdADD4sWSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE1MSBTYWx0ZWRfX4ZwITYJRfI8T
 ANpcFcWqkFDy/YEMBN7a6vZTlg/PVPNr+xCtsL0Is+GIqJUZmBcdoUiBz3Ly6W8ABj7pMCt2R3J
 ovwsR/xs7SSRIktcb53Kz47il1FKijQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180151



On 9/17/2026 8:18 PM, Jakub Kicinski wrote:
> On Thu, 17 Sep 2026 12:38:01 +0530 Krishna Chaitanya Chundru wrote:
>> Subject: [PATCH v3 0/6] bus: mhi: host: mhi_phc: Add support for PHC over MHI
> The MHI "bus" is the worst abstraction I've seen. You're turning it
> into "qualcomms corner of the kernel". The PHC drivers belong in
> drivers/ptp/
>
> Carry this until told otherwise:
>
> Nacked-by: Jakub Kicinski <kuba@kernel.org>
Thanks for the feedback.

We agree that the PHC driver does not belong under the MHI bus.
In the next revision, we'll move the PHC driver to drivers/ptp 

Since the concern raised by the NAK is being addressed by moving the
driver out of drivers/bus/mhi, I'll drop the Nacked-by tag in the next
revision.

- Krishna Chaitanya.

