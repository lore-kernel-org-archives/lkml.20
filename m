Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437256;
	b=TDlowBMBtHeCqEECc5cN7txOe6zkfrkdVHxH4jGDu67AYqTSOxgBm2+OYuG8nsgQi7Wg
	 sLA/08epsvFCtK/XVSPS2SIii759MuPhzoQnE3JmDOHEj6QMaFy0yZsSMxcCW557s4RBg
	 GzQov1YVb5NySxcTLhi6ai0cSaaH+d6pqKn7xZgAvrJN011ed6RBOIIDdtVucbNdCXqk2
	 Ev5ar9+5l/hDL7pys2ZUnW1fO4lr/cYcVncp3qK5VnKJsjc1QeWcoat8GrdmlNOhbqZVL
	 DR82BX91zN5lH5212sGNW+PCDwgvL1zIIcBSuTXL9osaom9JZaj/HUT/FAU7Kyg2UGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hEBW3LH4sOgJCtCxVxcQeurZ55QVpzO3dxYT1b7yId4=;
	b=lhiHAsDErtMY6pXNaz2oLb6QYGy6tdxXyRSTKHxwD0k8rTl0jpNUTs3uwmF/f7JPIHjW
	 eE+A/+sj3/no3ak64mxJSHOBEYb7AM81qnfNJI3TNjlkyQ6A0itWq1EcYOzQo+CdiP1jI
	 5slWiJGuRl8qvXTGrQa7nNKmYD5Ns8F5ZFKHGLToImCQ70iEN/2PjZIDZ2D+0QQUlYMj0
	 ZUrM3xU5MZW/c7+o44+FhAYV4TNXX9R/rHdB7uWJwbUTK+2Dr/e7wwTvJMLiqCeFE4MWf
	 +Ye9djxJfpwzY2+6JexSAJ5Vgmda3EvNIapNqfTv4EXOQUdZnH2ZvxhMSNWQSgnBJYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pTEaXROH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LE92xQ/w";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D032C606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D032C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pTEaXROH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LE92xQ/w
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4aHJj2142766
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hEBW3LH4sOgJCtCxVxcQeurZ
	55QVpzO3dxYT1b7yId4=; b=pTEaXROHxaEJuVLIa8+QCUI9rfTd001z1ZdX+N7q
	GsbISwdcTtepdCjg1lb946VR6cl/Ilqpcf+XyN+eIBGgEqcFDCg56brsi7dpLh0K
	iGnkdiTq1k16T51BJCgUCUKtHQEeaZVtJ/5utoTVSbdNPc0YIkdCyjFwDoWPBCLd
	76u7QTLCycONR6dWlS4Kbk6ELMMHrm5eSPmNWumt8WTIOvvj9QCpnrZyHDymyXMJ
	z50wJcNfnJL+zcu+Ui2kCIcNoVHsAtcOUU5JbZYiTsAZiIQkzcyZfsLl+RFYQVBo
	ueeC5/Dm+/qMssHNYS8J0yWfip6a0X8TUdSxjX3VUar2Bg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fs1we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:00:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a223755e4so6006373eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793437249; x=1794042049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hEBW3LH4sOgJCtCxVxcQeurZ55QVpzO3dxYT1b7yId4=;
        b=LE92xQ/w18R1PWG3hE5olTjWIpG9qa2JlaGU39E5BlRmixusUGK/lV+B/l5Xw2qB2U
         jR/xe+dRZ5tEqxfioR1HLt9VR/nffboe5HIvthkAhJiW92mARQX9xxIQwNzJvA3/YR7H
         GZd93CL0WlsThiyhAiK//hoyUPHDdzQfmBSZqDIrCwQhosdaDJduGIOtOB5igmNP1I3J
         yQoepOORu3Yxc76ip3sxiGwzCkvNlb6En19WS74cT9hTK5nG3CIDlhcyit8rVKt4e0pn
         7vjmck7mvZpBWDNYGrCqZeaz1Mxn2DvDvE5XuW3mpVaW7QmGmw/c0Au7JOZGrf5ZB5eQ
         0JVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437249; x=1794042049;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEBW3LH4sOgJCtCxVxcQeurZ55QVpzO3dxYT1b7yId4=;
        b=xMK18dLpaH+SYEphViDMWxL+P6P4FtAYjZAqIHB6Dm3ZFA8+rim9EeeOaphBv56xMv
         LwwTgzeOwUZMGRJVpgdTie6RudD4lWxfXbZzCnaEfHnWTxT+ihz0KX0ys1RWnP/rVcSC
         qVOmB0h1PXjPmISmrkCqLIvGrlBK9RH4xDXcF3MActqo2Al2IqufnOVBBoyhhWmKI7H4
         qRla/XzkqSsUTXplbn/Dk9kxkoqV3bEb34OyfZqXAWBoQrfsLB29jbNwWTCmibHZuxmi
         PSc4Rqd22prUw5jCU2EjKUo5pXbOnI83JXr+VKb68ZN1y6zbGfWeP8FVo0JjUrBA8WHy
         KwpA==
X-Forwarded-Encrypted: i=1; AKwUvBxZb1oZCh+T5B/WSIWwoYkX3GKnKoU5Xg3PM8NZ/ZlPnmBIaJo7Gp9uRCVFKb54PUJ6s0CmGCd530t1HRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNBwQso5ckzJ36ABh05PpZP8CTjYvdU81HBSB5nU66Esg26xTa
	41oR/Uqzs6UpSWHAvRzEFTu9sHLae9/ChbWQNJKHK2q+xSY/tflAYdKUWI3d1wKBcWCFktCVF0y
	DcVMBbnq3qXJx1DHqlDX+tlMTfuKoi6JicESP4rbHly8nvAzhXMnM5sa4Ptyy1CNA90E=
X-Gm-Gg: AYBFou110TR8/Q8VM4aw4y4aHRIUgYOQD8F2Vb03Ez1gs6EXPhwRsiAeBknDJgqBq7h
	DNvjwcRsN5cW8ZVdbJBU6ak5n+WVcNXqPKvxOU4Kw24MQ0sYqxLJOI3Bl5JT/DRnk8BmJ2+TdkZ
	rzN4h7PSX7kTLn0N63RUk6uBoP91GrU92mT4OWKM/I2C/IHUnLraiEVdHY6fwKvi6/F3epAULnG
	BeypE5FJjZv40CmbSj9LW0+cKkWNDjCTULIurQNhIRhzNAcGzXdUwKQTX+HiYf88PshZC1mQbVZ
	pwiwbIhqDBrI5dVKKteELXUVal5pV9ULiOYOVXBK0wehjPZZJJqUVO7HF/rgKsm7hxZQZZ5gu+y
	DCGAUgdG0JwiNEIvmJl9NWUyOwDFDIk3eudSSixJab5VeomQ9AAFDTlVg+hoA6T31YRLIVcWki5
	AVhXXmDDwGUq4moRE=
X-Received: by 2002:a05:7300:a945:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-36a423b3556mr11293412eec.21.1793437249087;
        Sat, 31 Oct 2026 02:00:49 -0700 (PDT)
X-Received: by 2002:a05:7300:a945:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-36a423b3556mr11293357eec.21.1793437248425;
        Sat, 31 Oct 2026 02:00:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm14573186eec.6.2026.10.31.02.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:00:48 -0700 (PDT)
Date: Sat, 31 Oct 2026 17:00:42 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
Message-ID: <auWuOmzGjuT9Zjmd@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
 <302ff5ea-cd47-4703-8b29-125d5f91ccc2@oss.qualcomm.com>
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
In-Reply-To: <302ff5ea-cd47-4703-8b29-125d5f91ccc2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfX0ixv6S+74Jbi
 ea7eXYW0pWC4N855bBLjyFeRHpYxfwanEZgMbuCR0khEptiQsuRDor/hxuQPue7qFNEK9fShzHd
 qMC+m5lkS7aBgu6Bc9w3b+5GIEjw1MA=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae5ae42 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ht1BiLNV8k9JpZ-vTNMA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: gNMbFcDkNrDlSlrCjkRRVfgLIXKE1W0W
X-Proofpoint-ORIG-GUID: gNMbFcDkNrDlSlrCjkRRVfgLIXKE1W0W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfXycQ7c5hOywre
 CFJ8dROnk9OowQD4oTO0zxPShwn91mUCiTNUIVepQTLSnuIfTWhpr2LN1KPT1mPCJXBA//vhKX2
 4ux+8LRsxlroqh9SfV++GDgy+/kU1lu3bnOdXBYvUiLp3W4x6OKPvZeqskPB89HoSOl82obwKW5
 rZvRONkLHu5OjE0sgVBRVhxd7TbIEDQMQWi4Jry07iCCQaYa5RgaO3l4OD8LXs4Q5YNGyy8vvcg
 Flua6HhcLMlG6tU4LaFZn8H8ZYTiixRQ1FA3GRW2kbfYSVIt+xUxzASKswjdqgp9c2pUd6eSDCe
 vgPi4ZGIHk9z5J6gvwoBMfVTA5sY5CAKxfaV843V7qihp55vmIUBC+rZJT5HRUx5BBqPMJRFJi3
 /MJ5lplmpHwwLeOFeL/3hL3/FFiIcCd7hFDe+mqZwS2n9ACLX9b4b3oDip8mnII1ASozoVsXCl8
 Ch7QqrjXyC8P9MLrzcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310035

On Tue, Oct 20, 2026 at 02:14:46PM +0200, Konrad Dybcio wrote:
> On 10/15/26 4:37 AM, Shawn Guo wrote:
> > Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> > firmware to configure platform resources such as clocks, interconnects
> > and TLMM.
> > Device drivers request these resources through the SCMI power, reset and
> > performance protocols.  Assign each device driver a dedicated SCMI
> > channel and Tx/Rx doorbells to support parallel resource requests and
> > aggregation in the SCMI platform server.  Operate the SCMI server stack
> > in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> > communication.
> 
> [...]
> 
> > +&firmware {
> > +	scm {
> > +		memory-region = <&tz_ffi_mem>;
> > +	};
> 
> SCM should have its own label since it's an existing node
> 
> [...]
> 
> > +&qupv3_id_0 {
> > +	compatible = "qcom,sa8255p-geni-se-qup";
> > +
> > +	i2c0: i2c@980000 {
> 
> Likewise all of these

Yes, I should have done it like what we did on Nord.

> 
> [...]
> 
> > +	cma: linux,cma {
> > +		compatible = "shared-dma-pool";
> > +		alloc-ranges = <0x0 0x00000000 0x0 0xdfffffff>;
> > +		reusable;
> > +		alignment = <0x0 0x400000>;
> > +		size = <0x0 0x2000000>;
> > +		linux,cma-default;
> 
> What's the nonobvious reason for this?

I will drop it.

Shawn
