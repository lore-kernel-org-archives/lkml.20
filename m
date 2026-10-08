Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBE53DCD99
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453717; cv=none; b=MzuA6ZIGFF5IKU8U0VM4HgX/d6vAypNsrJlgPoTjunk/F+LMOAlJivf0+0hMUqjrYYSVTwejYpFyeTZ5O/fOGTZVj4ols/n/yc9r4s30TuApEwj0grOXlYpDzepQHhCbcwCaI8iDSNz2bJiN6Kn3xs2Mk2zlB4PZG7tQigWMqes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453717; c=relaxed/simple;
	bh=qFCsdSQW397R9Ktz9vdlbi1oo/pS+Wpq4m2m9dcs11U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5sv6kmd5992TjFIbe09Y7b5EZX3DAp+NLbNh2HolmPT5DVeZmKjJaOiEqUGGztr9tEdiAbRUm/KVl8ZLzVyKuWc1vptObhIvXxIVSQZGyE4FsWd73ZAS1P3cAX7r6LFEhb/x3Pwe7B7nkTpRGxurRtJ3AUPUcvjNm9MOg/Whho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QsOkRHdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aV3n0fmy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QsOkRHdD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aV3n0fmy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KOlX1846063
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9KbmkSGdngHtw/bOKu8ijK6m2A/Y7thMIbIc1Jwfzms=; b=QsOkRHdDPkA+Y5nS
	siVFpuFDnoXKuViRwbpRTcGfcmiX3oAcjLCz6WOhUbH5vhAo20a6EShgJWIk+XZL
	3xIFt7LtCeDosJOpXH1Rv0l/2H+06m4A6t8nc0DCKHm3zE0tbe0SKS6qhpUUqyGm
	8TC5EEo58Oj6QkEKO+s5a/OEgBarEhEpkd62B0elOvS+FtzUGqYhwTlpEL5yteq3
	r6f40tq7wIouESC4PRyWDTz/VOr9MOu+7HWVskTAnaQDPGf4OORJRTRu7q/rTOoa
	yjkU3RQpyxqaJoxcgEwU9mkgmvZ2VJEpqWLFsiBA3GLh8fD/VXplFBndJxSdIgvz
	6qrmuQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jed0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:01:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so3683036a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791453714; x=1792058514; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9KbmkSGdngHtw/bOKu8ijK6m2A/Y7thMIbIc1Jwfzms=;
        b=aV3n0fmyaTfB2+8b6baFdvWvyBQLJ3c0r5ivJW+8M7NsR7BQ+ca9ZL8hd68JJ2Ok7D
         1HNcLaJb/78m1PQ1tIFNph1IUDUFTh0XSUqdNgAQ2pUvTnmOtyDyY4Cyxlwd+iBRtf/y
         Ozh8Tul9Ba1Bw5MkEvzib0iABs61K7eELv4ax0MZUzLHrfwFwq6+W+xdTMx7XH1iaYqv
         AR/bBRp6rIDbWSzQg2Q9ORds5ER88pXRIqRKKwkTHvKDKPXULEj7YNYUb2cQalC9waXi
         myHzzdFRdhVbdBB7BJL1zLXwhLIBMO/3fJOyn3LG8gx6OGcf+atwAQd0Ns9Q5hZQd1IV
         MiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453714; x=1792058514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9KbmkSGdngHtw/bOKu8ijK6m2A/Y7thMIbIc1Jwfzms=;
        b=sjQw7yqGOEMkHR5tbJw7stTeXLDMPwj4eHNDW3UbHRXrHGg6Ms34+NjhoAM5KwSLeO
         OwwV3CBDc9QcSSuNJQF6RcPyVyG2knQUHloanUiLNKhcrTLL73kiEw13AAB30HtMkSol
         GZmqLr5D6vX7XZOAEjo+FU1/t8l7qZGR8BHi5odkY9A9++N0h8DkJUbRupHAX/XmZ52/
         sR+rMnunzvYU8TbisgRDBU0/pxZwnr96Sh8BY/WBiX5REE3uXZmu+rsSSbPjD8dFheee
         hXBVR2+KTMOC0TJyX3Erz+AhOzEYU10NHEVPvDohOoc3nVKcP2e8vNIdVhfJ/8M+Vfq5
         u//w==
X-Forwarded-Encrypted: i=1; AKwUvBzGoT5GBXQxmSXw1D90PzlB9kduOCBC+hwE4oU6ekU/2VEUsVWmYcoXbGRjdZ8lBnaKK7tAimJmQCwLOP8=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ2uhxFZ8xEFmM8GuAPKZVyDTYC5Aa2Q8VdsdhU1Mwrqlp0mjN
	GdsvtSZi64k7z4qfwoG5dhvK5Vh+oLZqCk21DhmL19n+TaxqvbIJ8h4zoXnmxwyoEan0NAO6xnZ
	UjABW6+qo/6oZzeJ98oi6rBW2/HDp+/Wq2zfG7Ha05KsNW/+7jlD17E8SZU8CQIUy2C8=
X-Gm-Gg: AYBFou2ilnaPeLwQVzQda93CXpV/N56ZNpq0KCB3BD55b/T5QK6oEjv8miRS+zB5nqa
	wp1wUioBwkrUGn9COLh87ssYoJqTSqutp+uo7mKVL5jNgVi8+Cy3auTW2VIeIExQNS0CLCTiXKJ
	DDsnw+RCU7jlgVBzb5fcXcX7eYabFIhIOIA42fHztqbfkC1bwwN41IqxKvcHSb1ELkWQziZROkC
	MQUh3lGEhuR1X8mnHLoRFdH2sZXQs0P2vcW9qqAEZOROYVFVOCPcXpus9iT+3jnjLPZ4f2Jk+1C
	0eU0tZh7FXxnD5PrJ/j7RoBBGOLyA4cane+uv9gCntnPGpVzOhpFnXnxddRNWrcouWe4owSWE6B
	uhfXgE7hae3PsGp3h0gFYsM3l+pm+
X-Received: by 2002:a05:6a21:1fc8:b0:3e0:da23:874e with SMTP id adf61e73a8af0-3e13402bfddmr4304755637.21.1791453714303;
        Thu, 08 Oct 2026 03:01:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:1fc8:b0:3e0:da23:874e with SMTP id adf61e73a8af0-3e13402bfddmr4304723637.21.1791453713795;
        Thu, 08 Oct 2026 03:01:53 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a572b40asm2767231a12.4.2026.10.08.03.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:01:53 -0700 (PDT)
Date: Thu, 8 Oct 2026 15:31:46 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Add off timing constraints
 for vreg_l8a
Message-ID: <sd5bnurq3dkbljmuqtchnyeh2c2l7yh44yqfzwcdo2zxmzpy77@gst6dma3lzet>
References: <20261001-regulator-off-on-delay-monaco-v1-1-db0fdd69c262@oss.qualcomm.com>
 <finz2yjis56dh6ymk5vhqlndssxu52c3jt3ercvg5el2ynznkl@d3bsf5uo6jcl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <finz2yjis56dh6ymk5vhqlndssxu52c3jt3ercvg5el2ynznkl@d3bsf5uo6jcl>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX0523ODYf3r+y
 wX6EdjKrRQG7pVhS3QVs5q7YDlvyQ/NR8LZ64Ly6xKG7hJHIgjuW6RXx8R7AMa5OfN4uHCPK29s
 35MENua7/17huYmAqjdEZQDgB1Qm4WQ=
X-Proofpoint-ORIG-GUID: 3f07sRvbvtJ3fB1LN_bpmPLkmEWJPlUI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX8mGhUJa2uJas
 7DwQ+p6HXDPNizi2ZStiIIub06aEBMvmufUMjFQDVW59ua+5mKordV7GPBTlalCoh7zhFTdn58r
 2ByOFUPu/8EoX25QIzH38pZ9e1VcdR8ac3LdFzGSrzOKu5UHY9oC4JlaAPr71ouG1qfF4dFsmPK
 Z9ZwddkvQdVbfT4VCV6Q5STCT0xLb5gAxJOuh6HXLC5ZqAvJdpIFqN+TZsj7JANYmXcPXO3dXZl
 MnC9uyyW1W7rfMv22U/yKXuOKX5dAMRl6HgomK2fdcsh3Fw1oKNrylXif/9il+WkcdbxUVwMrC4
 ehjGNSi3J85tAF4femBUAwPBZ64gCIiZ0nb1Xb6BDeoczB/YvSWgca94XtOlbdGF3eUUrEgg3SN
 Ax+LI2tmzpf4t/fPmSGCHrziL1wo0LHd8r1+g0CF9rCSXhgFPAqGlxRP8NskGhdauB6JKuio5vO
 CJtQxJpdVU+2cSA+dww==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac76a13 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=PunQk5y5dTRi1mTC4k4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 3f07sRvbvtJ3fB1LN_bpmPLkmEWJPlUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080039

On Wed, Oct 07, 2026 at 11:36:00AM +0200, Manivannan Sadhasivam wrote:
> On Thu, Oct 01, 2026 at 06:37:53PM +0530, Jishnu Prakash wrote:
> > UFS on the Monaco EVK can fail to initialize after probe deferral when
> > vreg_l8a is re-enabled before the supply has fully stabilized. This is
> > caused by the increased discharge and recharge time introduced by
> > additional board-level capacitance in the shared power supply design.
> > 
> > Add the hardware-required off-on-delay and enable-ramp-delay for
> > vreg_l8a to ensure proper power sequencing and reliable UFS
> > initialization across re-probe scenarios.
> > 
> > Additionally, set qcom,regulator-off-debounce-delay-us so that quick
> > disable/enable bounces across probe-defer retries don't power-cycle
> > the rail in hardware at all, rather than needing to wait out the full
> > off-on delay on every retry.
> > 
> 
> This last sentence gives me the impression that we only need
> 'qcom,regulator-off-debounce-delay-us' and not the other two delays.

We will need the other two as well, for the case where the reprobe happens just
after the debounce time has expired and regulator framework has applied OFF,
and now if the request for ON comes even before 10ms, it will be applied
immediately.

eg - UFS driver requested regulator off at t=0ms, the OFF request will not be
applied till t=15ms, however, if the re-probe happens at t=16ms, there will be
only 1ms between the application of the OFF (t=15ms) and ON (t=16ms). So we
need all the 3 properties, the `qcom,regulator-off-debounce-delay-us` just
ensures that we avoid frequent off/on.

Regards,
Kamal

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
