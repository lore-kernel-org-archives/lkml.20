Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC55F45C70F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194305; cv=none; b=FKNyV+7cLMagt6K8s789tmP/42HxBemPrNCn/jpQm87LSBOTyIYFWS1mbXB1Y2BqXzKvAsEaO4xrppDS/td9+/O6RQ7fGE08rtriIeoZvgiB4uH1GPEH52OERxOWALwMoydqyx6c2yUUCmcbRmt7KzX2qjELtw9zBNds+ur7tS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194305; c=relaxed/simple;
	bh=Ex6nOVVvmGAaran5IIX8Up3FAAKN9ayJOTZR1L631sI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqHRypByhcFCs6XV5swi5ApYpVCJRUDHWKUAe9DbV4rBJvtYjfkUVxyI8q586m3WSrqpaItQ9OHbqR0p5o8bgZx7sN9A7+zv1uPHCRVJZ3vNw3fR/FUihWKlQH21xi8dqOI4oxucncuJpL/VSbWbbkXH6xqk+G+tuAicW2xDyp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+hBaZhM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHbOtpuI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+hBaZhM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHbOtpuI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xSMc646111
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 09:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/u+UehkU+tretpq4sz6osKKH5NHRrZvK6AoqRR3sDcA=; b=U+hBaZhMN0rqvtdT
	IHPuYhZnnyXGIttWg+y58jOEU9N7sI3NYlaRT/1FXe8Q+C9xNWrjpm0yvAAXGDRv
	b3NuhkR1X4yXbq5yaekFq6MdIwZyoIUlPy2+ao592WRDnGp/fJh9dDgLGCLOWowb
	nZSfigJApwA4ewGzmEHmwHbduJT092xW9ddBcxsSL4S2QEIjvbx01QL2vtfVjaRU
	EfBFihutqJVQdj4ri+hhhi5ANdmCkdGCoT5HFlr6wsH6oaCZKVFIMZ8IsQ/S7X+D
	MGCEjfg3biYACDdRWC3X6CUftF6kwHftNsWXJORGjaewNcnoy6+YbMDx6urloh8K
	D3FyFQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08n83e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:58:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1886104a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791194302; x=1791799102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/u+UehkU+tretpq4sz6osKKH5NHRrZvK6AoqRR3sDcA=;
        b=jHbOtpuIliG5L1Wm4MxUGQ1vXXAyU5SiNJCZXmHfU4/yhVypRJA3xUZG5KBCz7I0m+
         2dvrhiD6OjCsrgtA6YS+oThRhWWzIA8bMHMSNm24wIE2lXCwcq8OsgVtPqXQfUynvuqy
         TxZOkE5w7s7X0+5SydpK8aKjAV72jbnjvk5iq7ICaglxED0DLo0j/e0R0iiHcimjGa7G
         vcya6mKRqh94Ia5yVHscI16MOrhytbHCOdY0ybkW1SNiPjNsd0fX1MlyjnxdGLl8rGqa
         wx5Kk8+Zuj8z7sSAG01V5k5qC0KlJSPc1uVMiZ6Fd4LW93A0BweduihjY2hTyY+7nD1j
         VOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194302; x=1791799102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/u+UehkU+tretpq4sz6osKKH5NHRrZvK6AoqRR3sDcA=;
        b=lCu0g2tqsGvxZCLOoyb1vtGb4z1hCTX7q4Ma23yAX+ZQ9NNu8OBMWgdfNibu7TGP1H
         LBOsnlIfOvHPQpyuzEXRWj0zldXvyxznEXGumzDFFGEloOuVcCtO4JC/39yJ9GZDHZO0
         FlGSpTYmYazjMv0sCVTksgPAJ2D32otiAfM7m1MxkuFSuMVCvKP/2N1pkvH0J36VILDw
         bpKO8PozzDx9G8IgBuxC00srTAZ96X5fy+rTbxPI+6UmaxMWeP2C6osXppAYq9mB/Yfp
         oxnmuY3H4EBNZsvKCOxFh/JbLRL+uwGlU43M4WkgTFMKwD9DfPUwvl/9A9wYMpP/I2l3
         MIzg==
X-Forwarded-Encrypted: i=1; AKwUvBzS+IAkslkD68gq2H88bdhj2bvgSaUwpXGKKY5F8p5ahIiUmakDsFMaRLGw6Swa8HSXU4f3zhFDhi7ESUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFzd3l+inltZcsIxV7tItyhnKlF26sjwNzguJ6pKUzigyrqfNu
	G+FHXNLE7SYNjiIDXitFq68n1fBfXXB/PCl+gweseHm+pGohFP2GhFbD4Ry4Z7LzjetTXriEgka
	1rQh4p9GMLZgtsTp/c93vilJhuhjKst+Fk97IyWBjt9iHCXTXbADB3xPnRRtsIPLwDTA=
X-Gm-Gg: AYBFou0S9hF4iwLdnGiNd5uat7lSjMQ1LkLWEQkwz5JcaOGFYSNamD6hxx1v7AytZkK
	cgZ8eVfn6UI0SH2JklvVYqlWJA6LWWJYVFk6fwkdfDjwqSN7/BqMDihGnKuLu8tvc4Cz44ucDaW
	Yx0krdxR489JTjg7Moedvm9fCIsLnvLvRsRLflBjQUvUPl824pc04/qn0hwyrNiEPPBbunRz0xa
	0B63GL6jmtCviCc5sd0/7QjqMGq5N1ioC55iwKHwHfU71SRz2xhuqQjbYMHkPMTyFlwYEl8vT2S
	rq84zH6LzFeWsm3OOGxRO+B31KlOJneu//VbMds8kEm36ceBe62QsUkZcS8KPpkavRAmUv6WvbN
	ptaX4R3fjOgp/2/U0OoGM9wtUV/9eCi4hMLLGsPto39MHIlc1h4bYSy+OaZFZy5b/BBMLfIRqDB
	IiBbqfyuR97laGbEDcjw==
X-Received: by 2002:a17:90b:35d1:b0:3a0:8050:2ed4 with SMTP id 98e67ed59e1d1-3a78717db25mr5767126a91.17.1791194302130;
        Mon, 05 Oct 2026 02:58:22 -0700 (PDT)
X-Received: by 2002:a17:90b:35d1:b0:3a0:8050:2ed4 with SMTP id 98e67ed59e1d1-3a78717db25mr5767105a91.17.1791194301633;
        Mon, 05 Oct 2026 02:58:21 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d7cd47csm10690344a91.17.2026.10.05.02.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:58:21 -0700 (PDT)
Message-ID: <4df14aca-eef0-497a-871f-bea4700c74d8@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:28:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a host
 with wakeup
To: fabricioakio@gmail.com, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mvDrBtK1kVOZSz1ro1rWFCYzBwHFDSUT
X-Proofpoint-GUID: mvDrBtK1kVOZSz1ro1rWFCYzBwHFDSUT
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac374be cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=QFNGBFAix9GFkXGs:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Yc3q67t5xzoVBN05MFIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfXw5UB44mHZ3Ow
 beqsfxesgFjvMVbKEG0K5FviH746DDIeSoltxU7pHXkcRig7CyWiSKrkV8vKBtj+Vy8fDydU/Ri
 3xCmywKcW+75upOWRxS4AFksUKhIa/k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX2AxREriQ5V78
 5rxNiSKVuc7+/Na/xeRExPZH4kA/o1xlxv38nu0aEV1dngiyl+8mubKdiKJNciAtuzevq7UjEZt
 C88fV601u9fl7+n4KEDsFCXq7CzcKNbmOYCvCQASfSMhOZ2bEG03EAOBwd8adYoSuAwTSUw0+S2
 /mcPP8nkwGe5ylA26PLufywR4qhyMc0OpkbVlEtf80efyixuR1Ixe4asra5iC3FaoU6sKaVi8sX
 mOVE9aN3zILwN5B6e0LRVqivfyfpEeJEp15UfX9B0wmOggb2StijR6bx4MbtZnew+5M+FklzqQ5
 C8xUZ0fLUB20lrGbtPFUsbdrFN2HNliaA+X1SWUNB+fgfgIniESkJhGXTtckN3wPecaVRv9yJwD
 qTkQhmbQ4VlmdTJwXmHsjTWyWryTxIR+I1glIsmBrq9MJJ/8sBAl8j0ScWOwEErjkagWDIjJ2Gn
 e/xdQaYtLqCYfhw+1Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050039

On 9/28/2026 11:46 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> In peripheral mode the core disconnects and powers the PHY off before
> the glue suspends, so the link never enters L2 and every system
> suspend logs "HS-PHY not in L2". Check only for a host with wakeup,
> the one case that parks the PHY in L2.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on a Motorola Moto X4 (XT1900-6, SDM630) with the sdm660-mainline
> 7.2.3 tree, in peripheral mode with the cable attached: the "HS-PHY not
> in L2" message appears on every system suspend without this patch, and
> not over three consecutive cycles with it. Host mode is untested, since
> this board runs the controller in peripheral mode. The board binds
> dwc3-qcom-legacy, so the same change in dwc3-qcom.c is build-tested
> only. Applies unchanged to next-20260928.
> ---
Tested on Glymur-CRD
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

[...]
