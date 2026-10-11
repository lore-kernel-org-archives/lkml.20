Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA12E223DE5
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791684085; cv=none; b=grfy5G58OsOUbYc5BoKXeiiArRfd7Bo1l/a7qfgGAPlx9YhdKE23G0nIcIhFTy7QgzP/TUOEwHKY992oGfm+bnYJVtRsd39ZvhWkJAEeyM8NDF+CPzK9NS1k+n7jwpmEoKHRHPlECK4d8dDAEzH85O+1a6J9cvjq3gxCMUvm2tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791684085; c=relaxed/simple;
	bh=UD71A0qOkEaKp36ksgqi2k3XzO1+0Q5TsgJYsNPi/3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbpE3srHOB4Zg8yFyjMK0kAcvaC7XRI0usT8fiTcDOGeO4PQTwMUhSmrH2Ld//OF7cjASWiByHnMLRZUB1gFseBpSA+Rc+BhkvjroYYtIpw6Qk15UtydShX9e8jFnj8p4gDHK+IuFtQrKIdFaq/lpzqbQVFaA5TyYtLRsEW69mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcZz5aLl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8EuDquN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcZz5aLl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8EuDquN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B1pxxL1365942
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rz1OS5kFrXmC0lPX/csl8x0BPgSnSFBP6Ac0hEOz3mE=; b=mcZz5aLlEDLS6W1r
	oqIGWAJX/NkzDk7nfPaKwyy0x5czTuUAI31XXam0Amtrgbwlc2UnjIki938ddRlO
	teutc4Ke49MMBPS0uybJpOh5PKSi/Wya7yGXmDpP91VqBUMSdkff13zGn4JUNdLk
	iA25W7ZjB2HfoHR6GSvYbMjH3i93wDTozdJNG9Xc18Baoh26EDNBncXGlTbflkSY
	JSYvWOtK8olVebd5iqEIIBaVTMii/yu0YyY7o2zRFjohr4Sz5LbZQvMiMCfXa3Gf
	GBjvbsRU22VYpQDVSaypd3W1gSgJoAHmHWZL4hPD+rcePZBQgkRt5jK/oK6HC7uT
	jy3pWA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9t05p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:01:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34ef0362d95so2571332eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791684077; x=1792288877; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rz1OS5kFrXmC0lPX/csl8x0BPgSnSFBP6Ac0hEOz3mE=;
        b=K8EuDquNvJN7869VxGtgQDm4Iwm0ZLhbopnokwWtAi2XsmOCiPz8DKwYDikHfBfVqR
         DW39/6hMDRGbLx4++7ppIX+WiQXxQU+mkd88SXCVXPOv+BlCd6OpMRVSrRN/Mj98kMSv
         98wyC/I59ZvE84A9R6o3VZFjSJMGNLOCMDv4Hbe6QfjFRwixI4lvT2frdT4J6Xc9Jgcw
         98xoAuI7iRZBFxMKOwf4daT/OT89YAVsi3+HmQxhrgZX1YcXRCkGm7jkMe/KxfAd99hU
         14oKpKEx67RfTqUxYZH8RQc/BYWu0+Yerjx8Ad7bT0w3J3uVfCzNvSS3xrMBEITh/Sde
         criA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791684077; x=1792288877;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rz1OS5kFrXmC0lPX/csl8x0BPgSnSFBP6Ac0hEOz3mE=;
        b=c09YpgC+npWiuYlPTzTNedWvK6zVBzSa7hMm7tGJlVDtz1Jq5JbdBuya8T/2ErB+jr
         Wa9qZD4BY1zlOpPOIjoJ+W592S49ZswByFDzhx26oZh7O94AhUQkpAD0vVerH5NcrvR3
         rwHsMF//rM3AUgs4x1kQ2fVcSRbM90YZE4UUuXSiWsn3I1mG+FlS9BOKKBCILRo9ZXy4
         UATw6zsNrQ2cK7jA/YAsZcpgDacoK0Puz9RfrTCbMIv2FWupPndHqHLKlOQdLGLEqiy5
         K1O8U6ZYJE4VdfRiK1URKhNAZ3m1rai/3q+mFnNFNv2NqSKPtMizEp7VpotV8vLHthfu
         89IA==
X-Forwarded-Encrypted: i=1; AKwUvBzWqrhYav/MNn6pIkc1JMfY74EeMJB00lnFUjRjYcehCoCy3tSsuooHqCqeSP4UFWBcctuhujRNvpcT6Zo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzrybiMQ70r4aB3uCnUr0zEU9AbVBo1lCIo7N73UgyUVb09MoX
	lAOQA2qtLwsTFG/+opXFXtQH53cZx+KSNoWah3d/RP2qSUvMRTGmSNGxI3YTe1ssDB1pDIzIPGS
	cgLPtIVayPC5JiatdPoJgh/WQxKOBNa8aU+WHF9BTpGyHdLlmlJHrHvCjaxniuNGmccM=
X-Gm-Gg: AYBFou23r1e1ywavcT1sG7LY2HFWVB+vD5Rb/XeQlqyOmlMmIhKbC9Kh1hdLTWwpl9t
	ITn6uqR2XSWZ1w8lrkXtH4Q9fFpXpfpnZi0PLeEjFUtt8G9DleJ+rwj4gud7+b2JWls3L1BJotQ
	WR7jdN657H5ZPELiq4nZqVGSYIt60dMvGquQtznVW8eq5a1x3nSF73Hkm8Qv1ze2T9gjBnYUfcH
	FtSNBnaW8yGgw8BZCz35FOGuX+v6G6m6cFTDCc9uSLK189z3SYCOwgs9FUMCEUDrvK0udFhEffH
	ZDBqRdhlUZ2BGLNX4wuWBLVXCKTl1B+NgQ5mKcA4TOfjekJnzhnVIA5JcokznKiHD7sU88LSQ0+
	GsGhEgsD76BBpX2nXCNXTP7A/q4I81sxroGKgZKPoGg==
X-Received: by 2002:a05:7300:87:b0:354:76f8:300f with SMTP id 5a478bee46e88-35476f831efmr7669661eec.27.1791684076526;
        Sat, 10 Oct 2026 19:01:16 -0700 (PDT)
X-Received: by 2002:a05:7300:87:b0:354:76f8:300f with SMTP id 5a478bee46e88-35476f831efmr7669608eec.27.1791684075530;
        Sat, 10 Oct 2026 19:01:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3593b8b2ec7sm4014102eec.4.2026.10.10.19.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:01:15 -0700 (PDT)
Date: Sun, 11 Oct 2026 10:01:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom: pas: Decide early_boot attach at
 probe time
Message-ID: <asrt5u2v53E1h-Vk@QCOM-aGQu4IUr3Y>
References: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
 <20261006033550.2726451-2-shengchao.guo@oss.qualcomm.com>
 <asj4Sgsjw5xNXNLb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asj4Sgsjw5xNXNLb@linaro.org>
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acaeded cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ziUAhxxM_TC6nQI1M-sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NIizAA8usNOr4XfhAIuWojl_z5dAxWql
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAwNyBTYWx0ZWRfX0T1RgrAMG4rs
 OhuSAsEpotAnymFUA/Vi9Nj+/jjC96vJJwPN9PBO6LpQy4p085jWQGALZRPP+SRYD38QtX3YlZ7
 XTkFnx1rCkIdJwKkKCPfthzELT3ujNr2/79WooG1CZ3DZtZ80Hfv0X6DN9FlqRspo3WhGrOy6FP
 D+0jbhHEbPhlcdR4s5C6cZHIbJOLQ1ZvT4iM0vD8q4ZJP2zZGLvnL6RMf/sMYmBCzQ9I3mWb61/
 f3r+ytHClCoZGPEKJTrR7Is3/ixwKczs+q/Vw3p2K/CNo6LaMlqTtnQAs4Ps1Il/tOKUJ7PB03g
 OsgwHPebsll5N7YrYfsmbKf8b/u80TNEqCKFF5VIL3+m09bs8rMbYLo9ezO5Z4Ezxnjz2dWancH
 dyZmGAEmHzhKpFr+FJXWBtsTry+fDrRfElMRBSSf+ofFpPqotgH0NpNfLRXBI6+1Nyh8sXVUYBo
 BbQonfT9MT/aCU/aA2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAwNyBTYWx0ZWRfX06oZ8O4D3hwU
 vOTs7uyihvk94Y1NvUK+1ts9r1vb9Fms2J6/TDJgJQdiPimK8r5+qLteha7u5oJDgD2wIQiQc5N
 wNRov/wagWbA+niRZ1a5fxT4F1+ulV4=
X-Proofpoint-ORIG-GUID: NIizAA8usNOr4XfhAIuWojl_z5dAxWql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110007

On Fri, Oct 09, 2026 at 04:20:58PM +0200, Stephan Gerhold wrote:
> On Tue, Oct 06, 2026 at 11:35:49AM +0800, Shawn Guo wrote:
> > For early_boot subsystems, probe unconditionally marks the rproc
> > RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
> > bootloader actually started the remote. If it did not, attach sets the
> > state back to RPROC_OFFLINE and fails, expecting the core to boot the
> > firmware instead. The core does not do that: rproc_boot() treats the
> > attach failure as fatal and the remote is never started.
> > 
> > This is hit on Nord with firmware where XBL no longer brings ADSP out
> > of reset. The remote never publishes its inbound SMP2P entries, so the
> > very first state read fails (debug print below) and the ADSP stays down:
> > 
> >   qcom_q6v5_pas 4c00000.remoteproc: Failed to get fatal_irq state: -19
> >   remoteproc remoteproc0: can't attach to rproc adsp: -19
> > 
> > The ready, stop-ack and sysmon shutdown-ack signals cannot change while
> > Linux has not yet interacted with the remote, so there is no reason to
> > defer the decision to attach time. Check them in probe and only mark
> > the rproc RPROC_DETACHED when the remote is up and has not been asked
> > to stop; otherwise leave it RPROC_OFFLINE so the regular firmware boot
> > path is taken. The ready state is read first so that a missing SMP2P
> > entry -ENODEV is treated as "not running" before sysmon is queried.
> > 
> > qcom_pas_attach() keeps only the fatal check, since that is the one
> > signal that has to be acted upon once the rproc is attached.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 64 +++++++++++++++---------------
> >  1 file changed, 33 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 2e1e39826ffa..8f3d45c604c9 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -550,9 +550,7 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
> >  static int qcom_pas_attach(struct rproc *rproc)
> >  {
> >  	struct qcom_pas *pas = rproc->priv;
> > -	bool ready_state;
> >  	bool crash_state;
> > -	bool stop_state;
> >  	int ret;
> >  
> >  	pas->q6v5.handover_issued = true;
> > @@ -570,42 +568,46 @@ static int qcom_pas_attach(struct rproc *rproc)
> >  		goto disable_running;
> >  	}
> >  
> > -	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
> > -				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
> > -	if (ret)
> > -		goto disable_running;
> > -
> > -	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
> > -		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
> > -		goto unroll_attach;
> > -	}
> > -
> > -	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> > -				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> > -	if (ret)
> > -		goto disable_running;
> > -
> > -	if (unlikely(!ready_state)) {
> > -		/*
> > -		 * The bootloader may not support early boot, mark the state as
> > -		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
> > -		 * start the remoteproc.
> > -		 */
> > -		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
> > -		goto unroll_attach;
> > -	}
> > -
> >  	return 0;
> >  
> > -unroll_attach:
> > -	pas->rproc->state = RPROC_OFFLINE;
> > -	ret = -EINVAL;
> >  disable_running:
> >  	pas->q6v5.running = false;
> >  
> >  	return ret;
> >  }
> >  
> > +/*
> > + * The bootloader may or may not have started the subsystem. Inspect the
> > + * SMP2P state, which is static until Linux interacts with the remote, to
> > + * decide whether to attach or to load and start the firmware.
> > + */
> > +static bool qcom_pas_is_running(struct qcom_pas *pas)
> > +{
> > +	bool ready_state;
> > +	bool stop_state;
> > +	int ret;
> > +
> > +	/*
> > +	 * Check ready first: if the remote never published its SMP2P
> > +	 * entries the state read fails with -ENODEV.
> > +	 */
> > +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> > +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> > +	if (ret || !ready_state) {
> > +		dev_info(pas->dev, "Subsystem not running. Falling back to start.\n");
> > +		return false;
> > +	}
> > +
> > +	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
> > +				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
> > +	if (ret || stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
> > +		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
> > +		return false;
> > +	}
> 
> Nitpick: Both of these messages are a bit imprecise. desc->early_boot
> does not necessarily imply desc->auto_boot, so they may just be marked
> as offline and not automatically started.
> 
> But you just moved this code and I don't think it's worth resending just
> to polish these messages a bit more. :-)

Since I need to send v2 to address your comments on patch 2/2, I will
change both messages to "…, not attaching".

> 
> In any case:
> 
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thank you, Stephan!

Shawn
