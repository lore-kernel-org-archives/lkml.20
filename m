Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACAD45C6E4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556653; cv=none; b=as12IuLzAuiGWgT+dJ097nIGHKoIMsnuKXsi5nybR6U7juqUbh2ZYBI7wDAF5ozYX5ekNrFdYJfnXKdqWEYL9yAsj9qFV4+KHjasMNwZnwPVKuqv+T+bxGvO1NntjuwuahCixjJfiSVrxZBPAgVinNex083x4bL91awKXhGdmuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556653; c=relaxed/simple;
	bh=4Z/B13xeXzf4YPZIReMjXwn2fJtAzbXk6Calg/Vkz+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwi7+phb+LvIgQlreYhG0XHE5TaKJcvAJhIH8u5cXEvBFwU6S1Nb7eby+k57ByxrY6tJuVewlBvG+gldaPKkw21fuh3vwDVlE/LxHiLNy+7cqQSXDjnnEXq8GrRxmlAVHk+XVW9G8GgZrWuFG/+l7WggmbcBvKCceWG2zolgQ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGXWYehF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKP/hhMu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGXWYehF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKP/hhMu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DkphH511687
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 14:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZKS8ycvYM4Xi70sP59B/TTRP
	HMYkNwv2hxl45JH+Q9M=; b=HGXWYehF1iN+pqqSimfuU3NqI0PJvhAcJQcn9Lq1
	KSZgXEanez/fntA9HQ9CtYNjV20rBxmRA7R22IF3q3+i90vHXxbP0tpxmslKJEAC
	adpp6khJtia8ihobi6KvIIWsJgSR21okQ6Oo6+MeQ/h9RJQKo9z2cNq9uI8QXdu1
	fdZYaHJZ5WlDpQODUrJ0pszKzK20V2GMTi8jRNYEWF4jL02GxzMKHRjl23vs702x
	zmUEp3xIJf1qK7n4lVeAw88oBM/wvRq+tvPlOvN3wbr2bpkRKzmk8mAb/6mcaJQm
	QoixRQLtI5Sxrpksy7FvziBMNtGZst0Wbh+2NVBdfO03Ew==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h71f286uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:37:29 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28dafb8e1so9563172b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556649; x=1792161449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZKS8ycvYM4Xi70sP59B/TTRPHMYkNwv2hxl45JH+Q9M=;
        b=AKP/hhMu4R5TW3RIaXcfvnFbqwe1agZ0g+njgaNtIOH5HAF9JhkjnuYENhdMBmDfbK
         DCZnd+9HG5eZBeQvUfaX9gkr0EmnrEaNdD5Bbdj/LjXpg+apT5y+OhKqki8jmtGmxMU6
         TIGTAH0UBKnsas376WjTD00/C8pogfNcSflapviz/YMxwjvH8/4r7ELK3QtRfPSuiwm1
         Ldd+Zh2d/FxWrIyxdU67UXCmGXc9XY5WcpBwbo4Iqk5KEIy+oEHOgxCZ7g3ifui23aGa
         RFz20We2kWbPSqGTTFR70LRogq6yMhHFSrNEACh102HNZXzR0PHHmzmtTa8cPdWfuE4U
         0Cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556649; x=1792161449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKS8ycvYM4Xi70sP59B/TTRPHMYkNwv2hxl45JH+Q9M=;
        b=sRd8QkcxRttmiUuFrTNapXp92OQ9ybFVNlGA4M6IRVKlpIU1iNhq4tmu3SvqzZbwih
         /FPSXmFhplvnclyGAtNvshb5WDW2c2tWcZ4y2kXUHWd7PfKQRL5rFQqkmlHbHPEefJ/E
         NhdqDh/Uq57pRgwG2C7GH3FUKlKhPe52FdaF2NMf1yzCfXy0SiVe6EaZyNyIo+fjDxQA
         34v2r/vNRAVV5ngNBeiL2c8bk+NnNRPfZlyJ7OQp/KXmM3lCd27XTBzSBm4ykx5gfJA9
         k+xSs+5AXJ69Pa+gOlhxBc0NvWLvjYI+Bh5rvWoRtUQU3Rb1UvVn8mXc1rW1QC2vw8WB
         PuWQ==
X-Forwarded-Encrypted: i=1; AKwUvByJD/nyVpnPhPpJpJILVxeGrJeUgGLVFAHMTEiv02owH9KcybJ0ovyC5w4Zt6Pf5OkQGqDwF9PzNdjparw=@vger.kernel.org
X-Gm-Message-State: AFuF++nvjuqthDW3duz773w5U4yu4SPjP8Wm51Mxb6I5kEbuZlJ97nAB
	LX4Vs1QZjNQRCnc73CMTeBymWMbi2CZILsnF78yiuJUBVWfq9VX5NTxcSIomrsC+FgI56M+FIXf
	WHnALuUQjlg3MQO4fIMxABbAXMiUnZjX+4CGdqAFW6Cgqd9Nxn2yZmumbWhE9/wlcdr0=
X-Gm-Gg: AYBFou115p0W+AhHngGAOesSK2OwOrHgceBVZPLKP8g2PzivQPWWDbdFNUWH0RPStBU
	evSWQLPlgcM8aD/dklhruDmoglSn/WYaqpMwLU3E23ytOVVQWruwTqueZKLGT4fE0uVzVY3FZ5T
	fq4HQCZEhgI/eNJkfFoVaoLNC48ckoTiEaFe+ugFJmb/gGvhO/fEwMvFzfh+ju11YzBb4Qzja34
	eH4I1V+7Aet3zwKcsuuXHlMW+96aqaXbO9HrMuro6l6N7b8hIRqA22UaeF9qR2LWwxWl5YvMOsS
	H5Xj0n1VYuqF18oGrs9DsT/D2jAAL99YoHds+QKbK7WPEc/r1HnKrZb/lhidPO5mPrKXTSg1M30
	bdeONBmR1kD7oWZP1AM5REj3UVxA=
X-Received: by 2002:a05:6808:178f:b0:4fa:4b2b:5869 with SMTP id 5614622812f47-50c52a43b95mr1725330b6e.38.1791556648774;
        Fri, 09 Oct 2026 07:37:28 -0700 (PDT)
X-Received: by 2002:a05:6808:178f:b0:4fa:4b2b:5869 with SMTP id 5614622812f47-50c52a43b95mr1725309b6e.38.1791556648153;
        Fri, 09 Oct 2026 07:37:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50bfe56242bsm2101180b6e.0.2026.10.09.07.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:37:27 -0700 (PDT)
Date: Fri, 9 Oct 2026 20:07:20 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Pablo del Arco <pablodelarco1@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Add EL2 overlay for
 monaco-arduino-monza
Message-ID: <20261009143720.jk3556szgkwt57qe@hu-mojha-hyd.qualcomm.com>
References: <20261004101849.34191-1-pablodelarco1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004101849.34191-1-pablodelarco1@gmail.com>
X-Proofpoint-ORIG-GUID: k6zFI5HzkeGfcs32R1-GJ0hfYw5TmOs_
X-Authority-Analysis: v=2.4 cv=Nf5zRGD4 c=1 sm=1 tr=0 ts=6ac8fc29 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=05w5BP5Rb16C3YaoyMoA:9 a=CjuIK1q_8ugA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX6Nj7WMaR5sAS
 xCVgUiCK0mFQRahVxoYw7QcHQamdgEBBFD+tpkvUtnvA77dzCVNHREPJDbERXBq8OU2w4GfixFs
 /xATuuFE5+abZCfM2PatVl3nyy6Z5YY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX8cWtFuG140aZ
 aMo8xkMazWKReLvmD3H/HEa4u65aGfp3rLdo+HiRFnKee1A6jZ7BS3XQze6U4rfaL6AO1Ro2OHQ
 utWcw9F9vKZDUXw5DKJcpjRnnqyDVTyXnauRMPJme1hd3xBYcV7pVlzSKS9qt9cO4hzyaaQ4Uai
 vjjkPyujjgl9ahnlt88/+GzrQfxfCIQnEr211VmUFDDnkM5D4mMYAVAmhD57QYk/4jxZc8utfYf
 iipM7ZMHdeGnF+CL8HdUn/RBAlWR6lt3TxL02qosyz6/G8LtFejJUdWPtqsqyEJBSDoM4gV9KvW
 YYWtsZJCSiK3RLJXHsOaYqFsc6oDHgEiD6sS8t3SVwaYkXZLIxmcurpA2PkGV+s+4r22V/pOzi4
 QOURi2YD+xNQpCHprkSMjFSLERmf4DTUPI2ciXUIeyI3t6MiIGSeu3HC7ZHXR2wZloDu7I4UDRY
 DUjhK2SnvLq+9SRv9ZA==
X-Proofpoint-GUID: k6zFI5HzkeGfcs32R1-GJ0hfYw5TmOs_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090058

On Sun, Oct 04, 2026 at 12:18:49PM +0200, Pablo del Arco wrote:
> Build an EL2 combined DTB for the Arduino VENTUNO Q (monaco-arduino-monza)
> from the base DTB and monaco-el2.dtbo, as monaco-evk-el2.dtb already does
> for the Monaco EVK.
> 
> The board boots under Gunyah by default. This DTB lets it run Linux at EL2
> with KVM when the boot firmware is set up for that.
> 
> Signed-off-by: Pablo del Arco <pablodelarco1@gmail.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
