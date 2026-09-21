Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570BB492188
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991607; cv=none; b=hF6Djn2ZjmYTYgYOD8PF7YRc3MPkvE8x1uOfGu4qmS9xTEmTFY2eNoFHnKL5YWasz4LVALQL6TIeb5RbIYMkn8r1XWDymTz9JOoJAs6GLK0SU62Vst4/po+xzMybqQaRSkjp4v4rCTkdFC0S1EkCwNNvBb0XEp0izKZuHVrqCVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991607; c=relaxed/simple;
	bh=JyhmWSnBfU3PiXqwlkMuewi362rVO8uquV/qWmME4qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7nUgNzj7cMaUv7kvRPi5s4mpsoHO2mjDc37IYiPQVhMmwCT4PlZfuf+NPYjb1egOHNQXHy5c2dzoRTpeL1I7MC+sTTMTuMitK9lQv+X6Vzo4NbVIpEuoA+Ys+uubITDPf5XB/K3uoQXiCek6EYsv239nmZ9/AaIfnOUg3iV9tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQ90gUYG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQR8Q1TU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQ90gUYG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQR8Q1TU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe2SL934401
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tEMjD4QABtsqcKKWJSSUlZeC
	K+qOD0w5nqpSa9w3MOQ=; b=SQ90gUYGFPYclcUdbC/XZkbNnW/4Op5voV5izajI
	Tf0f+7EidkucBFZbHM87YD6n61hJYHPf1DwTzCPPYVo8eIXZH5atog8gxJCSvovG
	jKx/fe9a7H3me6LGHCLb5qWdOjJGDiWPNEMI77+zIKs8iiicGt6q5kBcYymcM5ws
	66U611gmAJFl2zA5JP+3WuePGB0fGDc8+zGOOUWRprqp/bXTWS+tp15jxY6eEJQp
	1/gY3HmMFp1Skoc+vvkAwmBre6Fczus9DrbTQgzS2LL18C9Jcov6rRFqWUgGaWqj
	Oj6Up9qkqe1W7FLe9Efc38vdEPvvrNDcjmC6kkL8nP6TKw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8baf38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:53:25 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82fe2ba8aso3691549e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991604; x=1790596404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tEMjD4QABtsqcKKWJSSUlZeCK+qOD0w5nqpSa9w3MOQ=;
        b=aQR8Q1TUJu3tckaBg/6xgiLj/hCnr7pNS0T9jNYSWH4n4xs/QIMG6v7QHuXKAFyvJN
         GTsq9TKygouLmuIrFImkU5mg/FAYsFxaO2Tr3VDswAkr2Z3vbTPfdgyll+lzDlKeUZzG
         nz5lgKsvdIS9zyBTkS5GuSzWHVsLZdbidvJ4PkzjRHjVqIr3aQGuWBce1XVo8XF/d86n
         TkeRG750A7w4qCPTBW4RKVPW/1e4s8e0zYDw89JXzzCx3xwRuhDgmxgf6CSXM17W07lx
         KlWrkmGauAsuDrxjSmHyTJbsCHqGyNI7hAwKTAxyp89rlI2P1WnaSq3YF/Y0fDP+WO6t
         dzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991604; x=1790596404;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEMjD4QABtsqcKKWJSSUlZeCK+qOD0w5nqpSa9w3MOQ=;
        b=D8O0QUAynwJ0uI1zr43Z0oxPnBrhxETd7pudSEUjtZiYLbgxlQH3ifrbvAgyV3G/0X
         tjJ8lXJkcrlb/ZSEeZtnXGvaBwqp+R5nE7fc96YoHYJRR6oh/YjoDO+J5XYdVWI5y7cy
         8RixIICMVIcw7nFVvkcV4P/Dgpy1RCSDOJSZ9xFpJt0TRSQRmkcWKJYSnBTtXwcIVFWJ
         /wryx96O3yhRrOtvXPpAawWKmpPe2K1HCjf36EIZ9SVQ8Dim6XrXoBw1BW1B936gntfx
         fNydyVHUr2J8HvQvBumU9Pi9eMoxseB+wJ18U5FYgTWJqdVBqwakLNRTKwro0dXBPHXa
         aVmQ==
X-Forwarded-Encrypted: i=1; AKwUvByI8uhGyfPgyAzfmYZzJhgdTrJ6DA+PmbF/ebITxphs9KqhZxKxb2gz50geOVDhSEZAhlU2k7fClDheeJo=@vger.kernel.org
X-Gm-Message-State: AFuF++kOM3kCGe8Z+vU9Ta0medXmHBPSbCmSq8s+vsPeAdVyQ8OqFFNx
	qMMotReTFt93AW4M1IaYgqK4KXi864ox0DCn6Ol3atyGRdWW8dhNQvLc2JdNNLyakaRn6/es+9T
	gQLRaDmdoDZ/9/VL0YtJJZuHyBo88skANIjpcWaje84QiDkKc9EjG/A59ZseVIg5sYRn97DQTPA
	A=
X-Gm-Gg: AYBFou2BgFarwHwmq2yLSKVS3lzD1/pkfSsGc1N35Ny82sqgIVEUPCBDetgvHwy4hmQ
	ytS7I/iIwmTiVVA/Wp8uJXmnnSSZfHLXokc5nYGxLaFYMbMCpUTY6CXysH0/vUxIATrX5a1+i/W
	CE8vwAGyfA21xMVvuuMuPszYIZQQ1kJGq4TyIVpPZWYrxZ0ScTUZqqBVO2oN/lywEAaYaBmidp2
	c97OjlcRYL2gTudJa7gHsDG6v2q1qCC4BXt91rzYHHLWKOXzQKipph8WlPxnpOCD95iwui821ie
	0a/6AiObwzn6FkZm/Xjz5fWoHa9nU8nxXHY9ueP5Kyr477STCLY5BNnd4N1d0k7ZbStT1iczb1l
	h2BrPie8OOzO3pbs=
X-Received: by 2002:a05:6122:d8e:b0:5c9:a60b:e59f with SMTP id 71dfb90a1353d-5c9b597ec34mr5069600e0c.10.1789991604533;
        Mon, 21 Sep 2026 04:53:24 -0700 (PDT)
X-Received: by 2002:a05:6122:d8e:b0:5c9:a60b:e59f with SMTP id 71dfb90a1353d-5c9b597ec34mr5069584e0c.10.1789991603944;
        Mon, 21 Sep 2026 04:53:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460753sm23129187f8f.10.2026.09.21.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:53:20 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:53:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: angelogioacchino.delregno@collabora.com, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
        nfraprado@collabora.com, sboyd@kernel.org
Subject: Re: [PATCH] spmi: mtk-pmif: Fix clock reference leak in
 mtk_spmi_bus_probe()
Message-ID: <wqj654zd7zqr2uyoivfypt3qioqitciwakxxhb6eslu3q3sawn@jy7nsjxmgozh>
References: <20260917155037.2161027-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917155037.2161027-1-vulab@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MSBTYWx0ZWRfX836aw18HSKMF
 K1nzuL3mfIld3kOEDiTlgvFYzrrMc/us6O+fTWlVVTNOhCPEj0PEj7dE1Uw1S6648z8asTiW+j8
 PXRryc60BKAyymeind53sSr/OYkpXfWKpJeBZ393THcg5KJoGGw70iCYzzhq3Nkfc70Wf/YUF5/
 1gumKz18U+xVOcatTUB/CP5//o+W2vQsmllEihLTP2NJI3YxkB4e0pdnFehoWUbbDuUxjVlPbXc
 GgtKw3LxDv7tiV2Am6QOxWoYVyBlx4/kA611hABvBvevEaYgNjd8wQEy0soUhH94l5DUJkI0v5T
 Eimmdo5RiegJ5Fdegc6JVGLLaQcDGo0rFkj41+giv/PKji8MmrxC0WILy7ESCi2jpVhl9Coxb85
 x8HxuazxBDAxx4KcOFj/qkMRn0xBD+r0RWT8CiBgbtsqGzhukFJkg2OiWAI38XmwIGjtWuEbIs9
 Nv/JgjH1mTMzUasyQUg==
X-Proofpoint-GUID: Flp4HgkgqHHwfEXzuhMJdEtyX-3W2CB0
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab11ab5 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OgdZ-FXbkxQzFk8FBkAA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: Flp4HgkgqHHwfEXzuhMJdEtyX-3W2CB0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MSBTYWx0ZWRfX6H+MGVX3sTPI
 9mwrRZeNVy1P1rOSCJ9ShcQ7PpUFxk/dLAHJP8sk02Cw8zb81DXyIDmN+SHr2UpfM1lc7ExmqrJ
 F6I5ybAOGowqghyDXU5e1k8Va1qE++U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210171

On 26-09-17 15:50:37, Wentao Liang wrote:
> of_clk_get_by_name() returns a reference that must be released with
> clk_put(). If the lookup of a later clock fails, the function returns
> without releasing the clocks that were already obtained. Put those
> clocks before returning.
> 
> Fixes: 078117963b2c ("spmi: mtk-pmif: Add multi-bus support for SPMI 2.0")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
