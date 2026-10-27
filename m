Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077275;
	b=ZoOvmq1s7vPkLY5jXL7Q+S4SD63lLCVcirE2WoXZAgR2Yy3rjP4PYsDkb6DbI4zcngMM
	 EQcXjPZiCleW9kTf51xxck6i0iOI1IRwyhiThDt+l4okPEafHI5yERK/CDiVAI4I+CYTa
	 aPNhzl6KMJTExuhNp9vXjhspxs/JB/GvCYffYJGflANy+7nZ3ihaG+wJ9145111CxHctv
	 A2+dpCXmFvXPy1xTk3qORP0xehuWH6cHHYHxKw8D/SMLUpIZuQ6H21+ZF2GjIdsqeetY+
	 XT8V7k602juGfCJnYnZeOzAaJ+7ISK096pce2+ZL5FBw5U/1Zqjd99k05ep6UUxDoQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CNVazNkHHRfKjH0wJMdsqtIhNk3xkQdWkKNi3Ii+PBo=;
	b=W2mXUN707k82AUH2QHGYdoxy5hmYqTLN8TGONbTU2+V7oi/EpSWlxYXn17e7WUUwRY28
	 ugSJ9n6rxYO1kij5t8opwdahErTO4WIq6wXB7ss+/TeGrUCFSG6g05TnO5WbA/zq7sdpN
	 e08Im58uWLR+BKDED1mvw5rFHFumFNvLJTxrx+KGIOl6xXrS3IaaOyBTqh7nemcpE8kU3
	 TDLaU8rwiKQLoiTOdKEFSLn9/gp0ScedP3Cd6vyaB+Uze3gbxSqKk2hYfdWmsJ1KajLjd
	 VhCNci3i1/xKhR5zkHnQya+H3m0G01Wa+TUC/0isZivZRY59pk9tkvAix4t5XVG6J/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e7D1ZRG+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UTgGJxnc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E1C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E1C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e7D1ZRG+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UTgGJxnc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2G5gw4156282
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CNVazNkHHRfKjH0wJMdsqtIhNk3xkQdWkKNi3Ii+PBo=; b=e7D1ZRG+pPsHx+ak
	8nq/yggaKNcYmzTdzKHtDn8VvTWqlVWZK3Q8YaYnrbFtUnXtsVURq7yqeLHbIGrk
	dJIbP77yGJ7dhDHXkoWfoSdEZ+u8jUTw6qTHo8eqsc6N7TPZtTUrxDrOi0OhQDnq
	p3KRhdbl1AdmmXTWD3YiJc71aGPxBq5cqKL7M3sT4RceUDC/Rl+hjRoKe9x3OH0B
	mrhL8rySkmj8WdBjEv6DutyRLOrNYPgfmH9sNuOLARhw0PPwok96vq2BwkBLedeA
	hreYCGwIZyjZS0jogoPMGgUBEjmf5Efzl8a76Z7824sIarfoiiZShW4myq0IJlLs
	Cf1Q1g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u641mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:01:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a073778890so2774350b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793077273; x=1793682073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNVazNkHHRfKjH0wJMdsqtIhNk3xkQdWkKNi3Ii+PBo=;
        b=UTgGJxnctTPKkdhrbF3T0geupgfNhUrb958yzPquP4CBrPxOUoEayU7HZB8urs0MJU
         644dHYevdjKJ5iHur/X1fnGsaHbeO23MsfPHCrjLLYbYcPEDldAGJYD22vEHF4D3I1IY
         MOsvTeeE3IX0+LJyfQJ1e45GiUE6B5OnT7AeplEenmY+0EnH6QTYTyb5g7cXOTvh6Jp8
         ZHBsJzb0ovdDqYFoO3a9AiyIRwfEuFKTL5HvB3wn/inm7wcSbpbUAdfih2bQRMD2/8c3
         Qeh6a4D2p3z1ssunrU2TTpHJCV4Qk25yPRkidehibLKFeO2QDWI4nGCrXSJQImFgy2xO
         /vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793077273; x=1793682073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNVazNkHHRfKjH0wJMdsqtIhNk3xkQdWkKNi3Ii+PBo=;
        b=TRhYxlMD34cgAdIIJ4qnRXDD6kQlfrUb5JWGN0cI0/dbvvGG8zmIxKH7VGpQk6dpuN
         hYIR3ULo+/j5H5T15+rLH2l3Tfv2Fe+y9zhLf8yusZ8/w/VSScAQSEWx1gHh1Gi+ULjk
         UKB/S/2ncOAHA42KtsxcALsNmF5l8h2vLjg8wHt/FZVICfHxoc5D3WaRct8sgQHWGiZ6
         agmsOAGLYS4IwXzwpiCCcujOnqM8mmZ1PlCiDHrOF7dXskYahjNPU3q7WkOKZTW9ICWs
         KXu07L93NexYy1eGX2smCL47h9vkkBk5mBFRL3WQZZpeVvW5103qa/ZNOjPJSoptFbgQ
         XCCg==
X-Forwarded-Encrypted: i=1; AKwUvBz9GwRFzTK/wxSwRBAbZJ3Ih8ZwwdezwIHZBNpNJIpnRat1e5zs2Wz1qwXvidtBdgcxgYYfAXQhNyIaTdE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7NNnBjo6P9J1PR2IUF5v8KBJmPHxsmEIY7zRqplhl3qGmyWr6
	su58xLWOJxehZCkVM2Tyy42fQGNdk3Cxd0COlAC4UsYlwuVhN+AOeL3jabsB8NsO+cQpuOi2l0r
	nN5+yiGmHcNlwkpOlU51qiqh6nLynpZ/rCooCA2D380z87Ut2Pf3kSPRSd95rlydiCRY=
X-Gm-Gg: AYBFou0OZaSXYYQa5GYQ9uLoMkkHownh7+2klMOeko0kqAaaVYvi6hDZEpfNLJ0lyaS
	UGFd8SOkgRsIjAw/pvydayuT5fWH+sUyLXhYJl2qRMrVDdxv0TtvVoPP+1LfevUyoI4kZ8jQAsi
	C9BJHILT8lMC7zjFGYF9qxYqETw0d/hoqoAB3Mhe8QONUhKqnCepMGsHWj8ZrG6gNETy65y+tKa
	jOaMQIaQjFipGEulhbKtnSFoNNZ5pwmD/ATvcygkkByvA2N27wiEU4oXCzx0Bvp9Y26i6b1fMYW
	+2HasHy+UOguQBRBUdaVlc1zSL0tWoEchw6IT+OvgZ6x4adMzHV9qDeWCe952TPY7r8SrAv4wjK
	xoHKMneVJBrwPMA1L44ufKdAXS3mr
X-Received: by 2002:a05:6a00:3a1c:b0:899:465d:c8ef with SMTP id d2e1a72fcca58-8a367a36a4cmr6659100b3a.14.1793077272482;
        Mon, 26 Oct 2026 22:01:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a1c:b0:899:465d:c8ef with SMTP id d2e1a72fcca58-8a367a36a4cmr6659079b3a.14.1793077271734;
        Mon, 26 Oct 2026 22:01:11 -0700 (PDT)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1841090b3a.44.2026.10.26.22.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 22:01:11 -0700 (PDT)
Message-ID: <19ad3b05-bec5-4376-9f90-b233d1e1b2c4@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 10:31:06 +0530
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
Subject: Re: [PATCH] usb: dwc3: qcom: Restore UTMI PIPE clock on resume
To: Filippo Falezza <effeffe99@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r2-SLtPnas9_AyGsDgGwecbTULNt08Pj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxOSBTYWx0ZWRfX5piffFLURwb+
 3OYOZuuTKRTJf67xhIYdqWJKLSh609PZvdFmD6bKKUEO9aJk9uSmAnaTvjLIENogbKnU/GyOLLx
 sPde7/+OFo2YCGTZAPPjJ8GvXsqm55ou6Du5IqVB67kIQKBaxs4Zax7ZzNwRUu7kM0uR0bo/p2T
 lyd2lu2Rjxtbnq/MIZjSiuzBj12T5+pEsl5RHToOXivbo0LQTQpyaQCuQsh5+k9Onhm7ZOs6oHn
 +ntu1/k741cObrlZN6FaE9bI1WbE3/rzxx3lyCOrcNNdZbYBOp8ZZ0wzsVOaHffq7SSMEeheTyG
 WRP5YTgv9mkYORaxFxZtyDKUnb/I8AmD72RZ9mpQ47UJw6RHIg4Eg8pQrjDlAAy3gGeWK+KEKgt
 iOuXH9dpYdOCsez+eTgqil9VYc8D4h4VdSMZ9DKirs2H9oU6ubMOR88hJFrB5IFioC4vBZf2kat
 45ys8qTKjroY+BmX9Nw==
X-Proofpoint-ORIG-GUID: r2-SLtPnas9_AyGsDgGwecbTULNt08Pj
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6ae03019 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=Fk9T1Wms1UAi6vkAl3UA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAxOSBTYWx0ZWRfX9CH1HaIDNZyN
 sNtEcUmVbhzPjrVOxk9O5iuM0NbmhHh1WzuAiIBXgIb4OXeRhYDqfeoI11diWmN8KftI83pfNba
 JRXHP3e8fZ1YaWbfi24azgTRYWHweQg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270019



On 10/27/2026 6:51 AM, Filippo Falezza wrote:
> Boards whose controller has no SuperSpeed PHY set
> qcom,select-utmi-as-pipe-clk, and the glue then programs QSCRATCH
> GENERAL_CFG so that the core's PIPE clock domain runs from the UTMI
> clock. This is only done at probe.
> 
> When the SoC reaches its deepest state in suspend-to-idle (CX power
> collapse), the QSCRATCH registers lose their contents. On resume the
> core is reinitialised with its PIPE domain unclocked, and the gadget
> does not come back:
> 
>   dwc3-qcom a600000.usb: failed to enable ep0out
> 
> The link stays down until the driver is unbound and bound again.
> 
> Remember the property at probe and select the UTMI clock again in
> dwc3_qcom_resume(), after the clocks and interconnect paths are enabled
> and before the core is resumed. Move dwc3_qcom_select_utmi_clk() up so
> that it is defined before its new caller.
> 
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
> ---
> Hello there,
> 
> this fixes USB peripheral mode after suspend on a Motorola Moto G 5G
> Plus (SM7250), a phone with a USB 2.0-only port that I'm bringing up on
> mainline. Its controller needs qcom,select-utmi-as-pipe-clk. The first
> s2idle that reached CX power collapse broke the gadget: "failed to
> enable ep0out" on resume, and USB networking stayed down until I
> rebound dwc3-qcom by hand. Rebinding works because probe programs
> GENERAL_CFG again, which is what this patch does in the resume path.
> 
> With the patch, the gadget (NCM plus ACM) reconnects after s2idle, and
> the SSH session over the cable that I use for testing survives
> suspend; the phone has run with it on linux-next since 11 October.
> The other boards that use
> qcom,select-utmi-as-pipe-clk should benefit as well, but I have only
> tested this one, in peripheral mode. The legacy glue driver
> (dwc3-qcom-legacy.c) has the same probe-only programming; I left it
> alone because I can't test it.
> 
> The patch is on top of usb-linus (6b4b543fa187) and builds with W=1 for
> arm64.
> 
> I wrote this patch and drafted this note with the help of an AI coding
> assistant (Claude Code). The testing above is on the phone.
> 

The patch looks good to me, did you test this with host mode and RT
suspend/resume?

> Thanks,
> Filippo
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 45 +++++++++++++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56..6334ca7ba30f 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -81,6 +81,7 @@ struct dwc3_qcom {
>  	enum usb_dr_mode	mode;
>  	bool			is_suspended;
>  	bool			pm_suspended;
> +	bool			utmi_as_pipe_clk;
>  	struct icc_path		*icc_path_ddr;
>  	struct icc_path		*icc_path_apps;
>  
> @@ -335,6 +336,23 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
>  }
>  
> +static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
> +{
> +	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
> +	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
> +			  PIPE_UTMI_CLK_DIS);
> +
> +	usleep_range(100, 1000);
> +
> +	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
> +			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
> +
> +	usleep_range(100, 1000);
> +
> +	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
> +			  PIPE_UTMI_CLK_DIS);
> +}
> +
>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>  {
>  	u32 val;
> @@ -388,6 +406,15 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>  	if (ret)
>  		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
>  
> +	/*
> +	 * The QSCRATCH registers lose their state when the controller's power
> +	 * domain is collapsed during system suspend: select the UTMI clock
> +	 * for the PIPE domain again, or the core can't run without a PIPE
> +	 * clock ("failed to enable ep0out").
> +	 */
> +	if (qcom->utmi_as_pipe_clk)
> +		dwc3_qcom_select_utmi_clk(qcom);
> +
>  	/* Clear existing events from PHY related to L2 in/out */
>  	for (i = 0; i < qcom->num_ports; i++) {
>  		dwc3_qcom_setbits(qcom->qscratch_base,
> @@ -419,23 +446,6 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
> -{
> -	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
> -	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
> -			  PIPE_UTMI_CLK_DIS);
> -
> -	usleep_range(100, 1000);
> -
> -	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
> -			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
> -
> -	usleep_range(100, 1000);
> -
> -	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
> -			  PIPE_UTMI_CLK_DIS);
> -}
> -
>  static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
>  				 const char *name)
>  {
> @@ -680,6 +690,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	 */
>  	ignore_pipe_clk = device_property_read_bool(dev,
>  				"qcom,select-utmi-as-pipe-clk");

Minor nit, You can use directly qcom->utmi_as_pipe_clk instead of
ignore_pipe_clk.

> +	qcom->utmi_as_pipe_clk = ignore_pipe_clk;
>  	if (ignore_pipe_clk)
>  		dwc3_qcom_select_utmi_clk(qcom);
>  
> 
> ---
> base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
> change-id: 20261027-dwc3-utmi-resume-5ff551b1ed1d
> 
> Best regards,
> --  
> Filippo Falezza <effeffe99@gmail.com>

