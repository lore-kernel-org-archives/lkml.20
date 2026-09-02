Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC93E47F786
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366389; cv=none; b=Z7QSxwfJPkMDSvYbTJRQAGVYmJxFcwH4G4xXc0KOppKARyP+RmITTS8ICYWZ1kHNNxfsvcvYEBLqXdBaMLTqH7WT/IBujqXVDSqmpjPjHxynQG/CQChZxCLpr5Xrpq3abrtsh9Xtg9CQeioJuPJTBal3Oe07MxWRrfMALnICZzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366389; c=relaxed/simple;
	bh=XoDcH9GORxw+oEU26TAT7hJCzBtymOFWgvnwiz8EQo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXD7QUlJtSeqhHxH9+KAlM6PF/DuprKdeCTLX+K0ljPplbHegWii6cu34NxevjuAMrKTk7uiTwR0GvvVW96048pPGWWvlryq+edqTYAxSyMIKCVpZG8N2dAVgwLchPy0dvY8eKOhxS96Q22P3N/9JBbeo36tcM2fvRn1Zcvad/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIjQqgle; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QljyopoR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIjQqgle";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QljyopoR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZ0Y03071147
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 16:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WuJzOTfvaK85LztVWbIA45wnK/E/NL5hkjKQ4u/8tys=; b=TIjQqgle6O4guCDE
	auFxEP3DJckesT2YGbS3JONg42uoqIU8IUiRQcYNjxU6hjAJC+LTHphwXW60/PdM
	C7zrUWr72yuBeHxkoCv/uuotiyDtxyItQPDZadi4SlTDWj+h3vixa6RoU0krFbPj
	w6wsxZLEfqGO8oqG4ji+RlD3yURmyiFXc0gB0cmmEfTBQAAoxSnJNKGOfxpC9EAw
	ilxNG0uEtnl63HzFSf9NKtvNDwRTQ099s+PrljWcr3Ec3pXspvuYhOTKYrVY/h8k
	xxwhMwF/cOE27mJZZJnNrFv1FmIywqVp9qrs9H485Mbmtx5+4v8pf116nnsZJJtC
	3uqauA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrngdmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:26:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390890ae83so31929185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366384; x=1788971184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WuJzOTfvaK85LztVWbIA45wnK/E/NL5hkjKQ4u/8tys=;
        b=QljyopoRigdPF0Ta94Qyt5BiUIwuMLnIBLHK7TLuHz5+ai+2eXMENx4y8/o3COybHa
         gdB0kJ8Li/RYJS7VhEwSreV3aLoSFl7XEA2hL6grI1GmYV34xjSrgTZbms6wC2v/z19i
         8wsjI0g7irmAL71Ar8MfeWXnRoiSj0rbarMe5W86jXLAlIlcAGZWRLRjkENENQvcL5Lj
         hQMIRv0uXeI03u3jhozHj4rQ5lEBI2zw+huPrNNFMCSWwWHloYPfThXWKfwkRC47mDT3
         DVXSdQSNxopx7T+i8cpJWaao1NFX6V4sC3bITusyXbq8RQJRtnkx5ZeCiiDdHvHiCZMA
         Ox6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366384; x=1788971184;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuJzOTfvaK85LztVWbIA45wnK/E/NL5hkjKQ4u/8tys=;
        b=B/lcXBvXf9oEfBetxVhN63V10WycViW1tkYwZAC3ZTFmibxNcbIGcUNRwiFfmqmlyQ
         p0s7H9pBY5vNItQ4W8kFx5c0GZKh+U9NBAmWu6pLwTTYo4oVucATd9ZDa5E/+FdoTXa4
         miMKZyPXOhv3TTHx/D74020sOpLtt84mOtFu1c6rADiXiW/qATdbJH8MHGQWhc2Nd7Bp
         oR9LWbhi1Y1af1vV84O/EwovxdlP9FIwJGlYKtL4uA4YAJH65wZGR30lC+E/gw7a5DsM
         yHvRMdyNNcPHX5vLxB6e5gjnsuXrjjhweZLr9jiIGFFiRzfIqDE7B2/pUXN+TavSbclT
         LQRg==
X-Forwarded-Encrypted: i=1; AHgh+RpGOSpVmsyRtIFucMKdj3sY2O0tGAFCsLPHHSV2rwpOlhAzvLtqwHrJGBeu3yVWJJVJlZYEoDPln63TuIE=@vger.kernel.org
X-Gm-Message-State: AFuF++mOrd7uj5RTqC2b/iIFGWAMpqB6/ObgpIIO6+X6oE3GNBM7YFBb
	8hERFMqcTrjBzq+KUF1hgdGapYYbE005lj9ID6dvluuw5021fAIKxjPX+krwZ6xXOTMD0yhpYd7
	1GggKGjFnhdfaliI19xD2W3qDK8IrHXQEzRu4U4yazR+QyvNpBlhlmzfI1HfPzEEYmFI=
X-Gm-Gg: AR+sD113pg2x57gdah2qtAxB0l1Sej5IqXlSlrfOm8eCmKB9uCM9NL3z9kdxgeeqHPp
	piDDnhvE8IFFsDolORpwMI6Gv+Q1AhJQeqvyH1dk834vSdCMiZVYOMIw/9EE/rYTJkrPPUqvIVI
	T21uUFUWiaqGi/f3mq3FpJEb644QgrriYu+PziUUiYlrRMuNhzzrS+HES43I/dSQy51WvmcuVfH
	nW1teiorHlZ5VfVfbBKlbVKe35YYoVeHMz2qn6rJ19/x0JlVmOYrLgpGBta2lcNclmP4eIdY37P
	kBU45fd5qhzVd7xCYLkFBhSQYjg5oU1EGDOHAHPCZhcSMxguEit2QhK8c9ZoQBjjecSWQFHCbbE
	e5jAY6BZUp9NttLB1Bw34Ew==
X-Received: by 2002:a05:620a:459e:b0:934:95d9:85fe with SMTP id af79cd13be357-93960faa235mr438364485a.3.1788366383757;
        Wed, 02 Sep 2026 09:26:23 -0700 (PDT)
X-Received: by 2002:a05:620a:459e:b0:934:95d9:85fe with SMTP id af79cd13be357-93960faa235mr438358085a.3.1788366383062;
        Wed, 02 Sep 2026 09:26:23 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d041ab9esm160010866b.53.2026.09.02.09.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:26:22 -0700 (PDT)
Message-ID: <d705aa10-0729-459a-aaee-574bd40168dd@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:26:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
 <20260826112456.482982-2-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826112456.482982-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OVhRKCcV1vXKO9dMoeawlKdDKw-cnWfH
X-Proofpoint-ORIG-GUID: OVhRKCcV1vXKO9dMoeawlKdDKw-cnWfH
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a984e30 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=foJT35fSmds2pDCHF_0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfX4qBeayfeSxi6
 V4iOWPEBDUmkw1h/mYUiU+OR2x/Hg1NU69uR1CyHGpYoAB9chQ2klCnskb8Q8Z3L0Lr5YpBS+aD
 RyPeycvYbzUaVe6ba2vN3PIi0sdaR8frOpgbL5+1efn+8+nV9W9s6YK+JfQan5jAk7SLCapgZdE
 QCtKAQgpYsPz+7iqZUGvouyPFd5nE28CCrUl2YwApWUok2aZq+GtdKD55MZMRRbbdgg4YBlSstI
 VCOkX97FR6/CFALtAyZlRBWE/CfR3/hNeVSSikl2VgYJhAv+OndlTL0f7MUSYvNTcgKxQA1W+QR
 MWEDUX2CpaHjzC9+s8HoCM1TAHzlp2U4kaoiwZMSWYXCSFEq9m6lN5NQaThTQGnfH7VZn7F0kH8
 OCuQPWH4ipej/+GJliWgHeYw/wRN0R+v6vcguuv0fWNVm46NUZbhr+N7SeFAEL9+zi062m3xCZO
 2V3u2K+vJNCtrLOfAUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfX0dWXJdivVsbp
 lvkv4djY1TcPfQ95iGCoK8vPhk0easYbY6KqRwOPXDq9CBCqwYSDNJeUAQJkhmDU9scWo0HLGgG
 +5RFOEwZ6jv1Qtej643mI0iHPgHo3sk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020144

On 8/26/26 1:24 PM, Monish Chunara wrote:
> The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
> the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
> and conflicts with SD card operation.
> 
> Remove 'supports-cqe' from the SoC device tree to ensure compatibility
> with SD cards. Simultaneously, add the property explicitly to the
> qcs8300-ride and monaco-monza-som board device tree, as this board uses
> the controller in eMMC mode.
> 
> This ensures the SoC definition remains generic while enabling features
> correctly at the board level.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
