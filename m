Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352555;
	b=xsPKCgHIiU8CXhCVx7/y7Dd4zLKAzc/mtelq40vig+gUNBPRLCU+QH3OFQ54lxbgnl8c
	 ilD7YsHGj3DfVXVEXdM+2AfiKiiRvLvAeuPcfMVEoMljg8G1jtVYd9iTzA8rV+ZdnJDZJ
	 br50K6u/BP4CAWtghSH4B3ivsfdLX5/YAYCVzwnWNUNUVJ3QP3n55hivXQyNP/rI/C9je
	 G6RRaLC8ntkKhVqALC+Tx0PxKjdZEH5AOsZ+Lbu1ybE4Z13do2Co6IuTGWb/Pvc3vA2nA
	 umRVCu7pfnciok5j1Iy5uUe24agWTGqnmpSC9R+sTEPawXzTXkZjmLMkvVGzYmQtKTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wXZHQUfqjVTSYiMFo0bGuwr+L4meMVtULMlFeF9aVzc=;
	b=RpUQG35jguWMCJ2j9yAcMZKdWC2c/OSEqx6clIUXsDWIDFRsVF9nr63vlrzxyU2D5H9q
	 MpjRukUNDNV0AkKRHS6+pTcKKReoZHJf8SoutTB5I/xT7DXKzzG4iB8iOLQ86E8ogkGeu
	 xqJz5/h40LA8wKXCctaFxs1NPMkdQEmRU5Ce0cLSgd+czU7Mn9xPFRUHCf4+5wx6EopCE
	 DQbxMhw7ig93V2OBvx4BejdvMblemT0pZGXqoIgrrVZekUdabRKqxki5SL0S5z1b8Iqzl
	 D9fBiu3QB92lZz9c1SRVjAAqEV1VOb7+Y6wYz28VHYKoD9mAJkBjeEOvputwdZSMhVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6rAJI8M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SkO87YOD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DFB606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DFB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6rAJI8M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SkO87YOD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F2Qe2134509
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wXZHQUfqjVTSYiMFo0bGuwr+
	L4meMVtULMlFeF9aVzc=; b=j6rAJI8M/Zb2q2sFnpAsacQx5LVbo5FrtFKZcNLa
	fcmVOMPkXIJ95L5dua4UstTqzDE8ZHXDCYWFc5dOUIbvTw2dRnCTbiRvZhP+Bsdm
	jFC0bRu+cTLWEheX7rRHWO2F+eMDBMsTrLL/MpvtRIL7Y6FXxGdDdqB0i8V5Bq4Z
	u2EWBfEYJ7w883hhqiJXHIH4SCbvoIDmOlTw8Fy00gzSqiPLc8egN3vwvfQDhahs
	G9R6kAJm2IUdQm79On+nKKO6gkbCTilJlJxq3Q7K2DmzS4lfn/pWfoiQ2ywZKoGO
	/ylo/dioaTXDpmTxDurB3Sf4AuNHK0uVJ9e/zd1D1aa1jQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj75e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:29:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso766657eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793352552; x=1793957352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wXZHQUfqjVTSYiMFo0bGuwr+L4meMVtULMlFeF9aVzc=;
        b=SkO87YODdByZeqj4Cqd0XXDoyP6dx20+5qNS9w0J9lBULhqrFPW2RfRbOuJlWQ/Z/H
         5Hnbn916TzGJpwmwqAx1rsixJ2BblduNfT8Jb90nloOySKn2AHDqARrdf+MsmRK6EDmL
         okJQk9UOJ5PBI33SPW7Xi47QApgc+i7fyEGD31Ae1jWix77LAUHACro9yObYhevC3sST
         UhkUmgtuqT/uW/R2OKpaaPGNYTq1PToL8JsCCNA7kMXJcqrSLs06yKUJb7TAEOPrLEl7
         V9nOAuUnTV5YOm4Sk1od2NJt7XkqbI3nst6enFjWOYHoYEJ8kFBdD3eFAeEjggCM0Zux
         QQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793352552; x=1793957352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXZHQUfqjVTSYiMFo0bGuwr+L4meMVtULMlFeF9aVzc=;
        b=TGSGxX57aKWJuI8LG7DfSSOUMzh6xdkrdatp9Ex+nPYNm8DheHHmYlN/enKqy1C3iV
         29se9W3eJvmnsGUJC/Mi5cILu87y7DYD8cwwMZAB5LLyaPFNMfTQBPvAU23/iXlg/VCh
         k4b14maVks+HNvIkGJ9QQokv/fYb3afG/GjmmJJYt4NJyfttxpcHRBU5hSAvJiuUcyy2
         hUBDmGN6y6oPsizNDpWdTzVwse9rA3mse3WHFvBHSyBMEh0SEunVTag61dSC6y4OuejA
         tQNq3a/yhCCFrXKHv69PCNMnVMt9ZkN/5BQoa5FY0i2F+m6gQhZdxTvCXLWmt1ZutNAG
         pcQg==
X-Forwarded-Encrypted: i=1; AKwUvBzS/tG+QVX2HpGtHyfdyqgE6ce1T+TwIMliq5ja72TZ+WtWFr47IdjGVO6hmb+zpgEFVPVmN5Z6uYiN5lU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIBhNmudESSYiwQ0MdvsjOGF8VyjGN80z+zt8E1iiYZC19tde6
	TP8P0u7MIxwcUfml03lI8eUvA8smXmUIleRuX73nhPguLKn1OCIhWImZBup82zbikUl6Uows99T
	55fBFfBlX3cEvmamK0d+O/XOc8+dlAXD74UNo6XOa0oP0S2++2pVNp+vedrvgeOGmlHA=
X-Gm-Gg: AYBFou0wSjc7t2atV9FI5jLmRxS6AvlJuH5LqsUT23VvG3vhTXVUhLdZTBggHXIFLCq
	ck8QrUYGig3fhfWyFwT9vNPan2Mk/eQt9xePMkta6YECm53soPfqz02a2zdD3OttJV6gPshKuxr
	33H1VCHQVSeL+uKl7rEuQKg7874yXk2ZIWsTil3K3Z1fMK3PTsZIU2PIdEqmcCopMLppmP2rYVP
	y0VzHphZD46NlvBvvL7LHzP/R10lawh2EG9T8EpmEwz2SSwz0DOSisxKcP5pbJGwOk1G2fcshq3
	sEdM4sFATI/Q2rxYFPOD1/CwK2ivNV2sCrkxJeBBBlGpo7qHf303zFMijNBz9KQQ4rRUb8FCOIN
	dIFF6wFxpzDyeZinFIZFCu0/dJPT2KKCpYAUac5sSxIRIiBlTNqoHekMWhMO9tYUuorPNRc0HYK
	6eZOI1WAhwBxtz90hvfx+MIQ==
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr2726552eec.13.1793352552501;
        Fri, 30 Oct 2026 02:29:12 -0700 (PDT)
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr2726526eec.13.1793352551752;
        Fri, 30 Oct 2026 02:29:11 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm7970406eec.16.2026.10.30.02.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:29:10 -0700 (PDT)
Date: Fri, 30 Oct 2026 02:29:08 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] usb: host: xhci-plat: Support
 XHCI_RESET_ON_RESUME via device property
Message-ID: <auRjZCbhL-7aubN6@hu-petche-lv.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <6499d6761ba6f338544fc8a90b4a96e55b5b4b12.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <6499d6761ba6f338544fc8a90b4a96e55b5b4b12.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfX82NelsMGwNlp
 ajXY+Pm+MX3mPOYYRkEKwCumcpDgm8ElelUrHmfZZNrA2gVTFzMayEK1b3hjoq1QAMqTUtqO9zp
 YPH7cPfDjXNKr4P8vGFliVyMVfpX64LjxB6lUl5o7zdupyaxwGsRZgXmLPlM/n3FDUdsqe0wRmU
 AfkMdtinAPdFyP5U584eXckzmAiJRCMQJslI8Y9yfN5ClOIJFotfSau7LX+ZBNWMslib4g1z2AV
 Wgn0UPLrH9IFcS20wy9ynrfYZBE8Ui9i+k83zvxbE4UUpCA+Ym0KzlYySX16gvOsTpbWvTXbe4M
 U0niJs5/1wdknyn2iYNDzbzKrdZ9Cg6TEgl5pyp2GVyQ+WbwTmK7ZhfJd4w3lfvzqUqjqfX/F8w
 zwWyAv4XZIlzfZLc8BIKR3iRorB88oNJTsBT/A4AJ2WZ93ZaZReIyQALktVnwmIOHC1YCf0rN+Y
 p9z9XS0YSB2o+b7XowA==
X-Proofpoint-GUID: SBjXlWqIMF37dT1wGJIO75qz5auFldgJ
X-Proofpoint-ORIG-GUID: SBjXlWqIMF37dT1wGJIO75qz5auFldgJ
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae46369 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=456oqEKErFOAmiHxQ1AA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfX3R37DE7v24L8
 AA0nW/pzu1QE9QUV/7Uf3nRuZ1xC2UGYl1DtuXyU1aeCaeC5FiyCdrdtpIykqluxL7oeOLfILtJ
 CRKbVORFDcH3aDXJpFjm5hqt+ZR8AlM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300037

On 26-10-29 00:29:34, Faisal Hassan wrote:
> When the USB controller loses power during PM suspend (as occurs
> on targets like SA8255P that fully power off the controller),
> it generates a Host Controller Error (HCE) on resume requiring
> full reinitialization. This is handled by the XHCI_RESET_ON_RESUME
> quirk (introduced upstream in 8b328f8002bc).
> 
> Read the "xhci-reset-on-resume-quirk" device property to set
> XHCI_RESET_ON_RESUME. This allows parent drivers (e.g., dwc3)
> to enable the quirk via software nodes.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/host/xhci-plat.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 6fd595f81a30..0093ed24ac3f 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>  		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
>  			xhci->quirks |= XHCI_SKIP_PHY_INIT;
>  
> +		if (device_property_read_bool(tmpdev, "xhci-reset-on-resume-quirk"))
> +			xhci->quirks |= XHCI_RESET_ON_RESUME;
> +
>  		device_property_read_u32(tmpdev, "imod-interval-ns",
>  					 &xhci->imod_interval);
>  		device_property_read_u16(tmpdev, "num-hc-interrupters",
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen
