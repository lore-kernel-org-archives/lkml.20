Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5994B27E1DC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458242; cv=none; b=Pb2/DE4HNBkYz1tGBdZpkFqBohACs6REa/3AlGQ0b0O1UzGskB2OZVl9vyUOEpKwmXdv2tS8FItgExCizA3bleWINoLcJC7D/IiV1e7WTlv1AJFbR5RPpH63zM5+CzqJMbEgAJlaKtcu2xwG49U2rL8RoKyeEEWIbxOn1i9z/68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458242; c=relaxed/simple;
	bh=9C8+ZBMnV6Yz5GoGuKBSlxmoHu/hfL+vCD9irsj3M0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I06F5lt7zW4hC7EfhkShuKNsGM9gH0Bc29tqldHtEQd/6sqbifScGkEsMOoUjVp+G9q/CsxRMPL2lZ7uRev+WKpSCMSta8obkuYG7LNdQDBOLQEtnwwP00SzHKNVH4ULowUj6RbKAClMtYTZ74BudpiDYl4jArlePZ/hGkXrMEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KqbBOjPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWb7BgV4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqbBOjPg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWb7BgV4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbM023129076
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ab8smPxfVHeAoXkdhyV8/oNcR4yYT14zH2lqJ8jcrU=; b=KqbBOjPgXmySGfNY
	FTT+q1V6oBwlsFKArtbtr4IbwCFgW1WYNgbKDTWAjpQ3+eGjo4X9RG4KFtELpffm
	SXxDPOPh4nDcb+Je25/2Rqd62mfZuYyxU8UUdhocBCwke/G40j9+hpMGnA1SR6V6
	BhAj/424gX9iBzcTDhtIJWhH+Ym3H0xqfLGsuxgynmL2uyOmPsZOe9E/kr3wZDJ4
	e9X5vHuUm5uJfxhO4YrNrJUZfvmA267H41mDuPLp/m4RRmrKQXWVlEiGke1vFGWN
	bJZs5I2rwaHLWLgsHnHcNbj6gzahZPTuLX3u6HfJNS3ABhtQSVZU+JOek6yluL/E
	p/aHTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe42nbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:17:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so190139485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458238; x=1792063038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ab8smPxfVHeAoXkdhyV8/oNcR4yYT14zH2lqJ8jcrU=;
        b=XWb7BgV4hxNsHpQJ9s4A6g5qTtg+JNmh01axC7kgpC/lljPL6M4zYWPYA4huDV9St+
         JhR3wrbdkCLztpcIWMFgsOBm+uBvkq/2mfHPPuXHdgELIwX8QVX093veRTxei9771RZD
         YTfLLjckGgvwvMcsOcX/f1rs0gVsXVMYH/ucSX7MB4QNYZwDgM6g5jVFfhIZf+HRz2oP
         HBmKfdwxcln1wuf+cCmAYOgEt1OkFtxK5A5R3UV62pU0WfhODp5teKRepYRm73Uj37sP
         aqT6S1Vr/MyFkBsam0i1H2Ede+ReYJ5iUapEl0EPe7UJK571ID0BU8xMhh4Zv4h+S75Q
         4iaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458238; x=1792063038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ab8smPxfVHeAoXkdhyV8/oNcR4yYT14zH2lqJ8jcrU=;
        b=Kh6lLmjGUKZR4mR+bv0TXZFwDjEynet+utmqntFRc0AFUXrfU+0xvtGs2jD7FsWvwd
         l4sjMlIdqHE3xJmRFTC0Lyl1HBXsqkVnwI4B7p8DVoU0vAjYbNfsvxjfNnRjbKUPHudp
         aIRyAKzvhUuLSCNWyomoSe18cdw7q0ZB8FRPDzM+xRWw6PrnpRjyMeElO8tl+LAZei+v
         q9c6C5GjYN9i3b89OB6jPteIh60QKYnuBZe4XzS/MiV/V0SwQJFozsCZnkG/M+p8F5WN
         /lDybBhhdtZj8kqV/xvvyl60BWWoz9T6Jam/cGhG5ie1dubU9a8sPI/EE3IJoe0zQqyF
         85KQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCT2AXY3UtdTbv7LQ61GNiMCAak9ic+rVQOTMoaeLTRGMCsxxGd8pWaZpv1SGPqMjXYS2fXxF2cvqKlJE=@vger.kernel.org
X-Gm-Message-State: AFuF++lOYIdARXrV8EQ9RLYbvcMx7NnG1U6BSQqT9ePZbIzvT1w7Ru1Q
	m+UHjLYh8BOHQbw8yJjhuM3tkDKRGF4EpUh90UVLl3+oFEqNTKn5i95CjTw03EGy2A05gwjL8uS
	SSPMNHfStwwqfbEEIoybLl1BxAyU3ZzGkhWrpk8KrwLDRew7FOfVHFBC6o223mghUAGubdRqH6V
	E=
X-Gm-Gg: AYBFou1MAjPyux55Wpp2W21AcSwNqG4PsFKhFwo/VYIB7fgLdP3Fn3ACvYwbqyrMQzL
	GG6Ua1oWT2X9DuDaBEPKZ6NSdfgYLSDaGoCJYK/54PJdKuBjhCksraP8y4HWg9GRMVdPbBdk/7w
	jafVmEe+olTgySsSEdeohVjRca9XTAV4POcdTeeLv0h85briO1df4qRDFBCz18RTPpV/l+je/SR
	o8WAEf18e7lK/8R1oc6FaMtbRDOv1KvM1Ldafoi3lsKPwAZfj/UOVtwwHCwmNXNUI9RG5QJ7Vvp
	x+6VES5RBOr6N4ghd9DjIn+IzV2a3onLMC/GBj0dOjpm/4OtXQTqyWf6NNj26ARpBx32sA2qxhs
	0XUy8OMKgCUrkEv1RIqMlma7lIQb2MN37mKmw54ay
X-Received: by 2002:a05:620a:171e:b0:93c:ba9f:1165 with SMTP id af79cd13be357-93eab0de0b9mr365514485a.21.1791458237934;
        Thu, 08 Oct 2026 04:17:17 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:93c:ba9f:1165 with SMTP id af79cd13be357-93eab0de0b9mr365507985a.21.1791458237362;
        Thu, 08 Oct 2026 04:17:17 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71bd7690sm10824675f8f.2.2026.10.08.04.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:17:16 -0700 (PDT)
Message-ID: <f3a4b60b-f992-4a0d-af9e-dd0fe7ae1ac8@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:17:14 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 66/74] media: qcom: camss: vfe-780: Produce the AEC Bayer
 histogram statistics
To: bod@kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-66-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-66-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D1JyPZ8n3_qpeOIq7UcHsxCQp0hOncqA
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac77bbf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=9HLjchaWZDWxLujXepYA:9
 a=_XCuZJuDE0Lb3mBl:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfXzWoUG6FAP65v
 4rtz3zBc/l/NoPD8s2goTXxk9D6cvj6NO91Jgb89fIBdO9m2vx2pSa+M4NE424we6bImLsBLuV2
 xfznxlXU6mCoxLRo82OcNKSM6zJxUUI=
X-Proofpoint-ORIG-GUID: D1JyPZ8n3_qpeOIq7UcHsxCQp0hOncqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX3nsoeNetX1vv
 8Vy5Fc+k0syoyO8shw6rnr0Qh7TzCGL06qsKC7h9hVJpdWs7knj7HzW2erABUL4f+MdMy36nKTa
 i1QfDX5Tcp9/secj+FVFiL75/Py0yRPlpT22TCR2wqGOlh+Y3+pgCM8yQYa2B4lbLztGZpyNXaj
 6N2MiRv0+LxqDR+fx+LyJ4TQzQsJ7Do9ZCqlRU/e9W2UKU8A6e9aYbSDol2ob6qDvCevYfXcUvX
 cKegixysxU83T2zbzNwBGPQgPKFT/kpOhpX8r6y8uNJlQLcEtL1uEO+2pmNLgcuibArlPAItjXh
 6TwucqQ7ym1eygZuVtQEXKxGsf6V0sQCxQpOQvL7paIQGy0SG4Gd6dGiicF/RpEwQZp99kqvBfv
 asVoBGB5cfa1KMCjPV7KkNgu2lyoUk/mtcJe8Im5iwjBrQ1MYOJyFiYxYvtFCM2V99lbhdx0WXE
 w7vqP3mYF95fx2OmyjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044

Hi Bryan,

On 10/5/2026 8:14 PM, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Stream the AEC Bayer histogram on the pixel line's statistics node, as
> the V4L2_META_FMT_QCOM_ISP_STATS block CAMSS_STATS_AEC_BHIST.
> 
> The AEC BHIST write master is frame based, PLAIN64, in completion group
> 4. Write master addresses are 256 byte aligned and the v4l2-isp block
> payloads are not, so the write master fills a kernel buffer and the
> completion of group 4 serialises it into the next queued statistics
> buffer with v4l2_isp_stats_init_buffer() and
> v4l2_isp_stats_init_block(). The copy runs a frame before the write
> master writes the kernel buffer again.
> 
> As with image buffers, each frame consumes one programmed write master
> address, so the write master is handed the kernel buffer once per queued
> statistics buffer. Without a queued buffer it has no address and the
> frame's statistics are dropped; the sequence numbers show the gap.
> 
> The statistics output runs when msm_vfeN_stats is streaming as the
> image node starts. The node may stop and start again while the line
> runs: vfe_flush_buffers() now forgets the buffers it returns.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe-780.c | 64 +++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.c     | 68 +++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.h     |  9 +++
>  3 files changed, 141 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> index 1d00a3656d7c3..7642d9d4500de 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> @@ -114,8 +114,49 @@ static void vfe_wm_start_pix(struct vfe_device *vfe, struct vfe_line *line)
>  	}
>  }
>  
> +static struct vfe_output *vfe_stats_output(struct vfe_line *line, u8 wm)
> +{
> +	unsigned int o;
> +
> +	if (!line->is_pix)
> +		return NULL;
> +
> +	for (o = 1; o < line->num_outputs; o++)
> +		if (line->output[o].pad == MSM_VFE_PAD_SRC_STATS &&
> +		    line->output[o].wm_num &&
> +		    line->output[o].wm[0].bus_client == wm)
> +			return &line->output[o];
> +
> +	return NULL;
> +}
> +
> +/* Statistics write masters are frame based and fill the output's kernel buffer */
> +static void vfe_wm_start_stats(struct vfe_device *vfe, struct vfe_output *output)
> +{
> +	u8 wm = output->wm[0].bus_client;
> +
> +	writel(0, vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
> +	writel(0, vfe->base + VFE_BUS_WM_IMAGE_CFG_1(wm));
> +	writel(1, vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
> +	writel(VFE_BUS_WM_PACKER_FMT_V3_PLAIN_64,
> +	       vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
> +
> +	/* no dropped frames, one irq per frame */
> +	writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
> +	writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
> +	writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
> +	writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
> +
> +	writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
> +	writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
> +
> +	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
> +}
> +
>  static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>  {
> +	struct vfe_output *stats = vfe_stats_output(line, wm);
> +
>  	struct v4l2_pix_format_mplane *pix =
>  		&line->output[0].video_out.active_fmt.fmt.pix_mp;
>  
> @@ -126,6 +167,11 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>  
>  	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
>  
> +	if (stats) {
> +		vfe_wm_start_stats(vfe, stats);
> +		return;
> +	}
> +
>  	if (line->is_pix) {
>  		vfe_wm_start_pix(vfe, line);
>  		return;
> @@ -157,6 +203,11 @@ static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>  	struct vfe_output *output = &line->output[0];
>  	unsigned int i;
>  
> +	if (vfe_stats_output(line, wm)) {
> +		writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
> +		return;
> +	}
> +
>  	for (i = 0; i < output->wm_num; i++)
>  		writel(0, vfe->base + VFE_BUS_WM_CFG(output->wm[i].bus_client));
>  }
> @@ -165,8 +216,19 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *bu
>  			  struct vfe_line *line)
>  {
>  	struct vfe_output *output = &line->output[0];
> +	struct vfe_output *stats;
>  	unsigned int i;
>  
> +	/*
> +	 * Each frame consumes one programmed address, as for images: hand the
> +	 * write master the output's kernel buffer once per queued buffer.
> +	 */
> +	stats = vfe_stats_output(line, wm);
> +	if (stats) {
> +		writel(stats->dma_addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +		return;
> +	}
> +
>  	/* camss-video sets addr[1] = addr[0] + bytesperline * height for NV12 */
>  	for (i = 0; i < output->wm_num; i++) {
>  		u32 addr = buffer->addr[output->wm[i].plane];
> @@ -237,6 +299,8 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
>  	vfe_add_ds(&pix->output[1], MSM_VFE_PAD_SRC_DS4, VFE_WM_VIDEO_DS_4, VFE_V3_COMP_GRP_0);
>  	vfe_add_ds(&pix->output[2], MSM_VFE_PAD_SRC_DS16, VFE_WM_VIDEO_DS_16, VFE_V3_COMP_GRP_0);
>  	vfe_add_stats(&pix->output[3], VFE_WM_STATS_AEC_BHIST, VFE_V3_COMP_GRP_4);
> +	if (vfe_alloc_stats(vfe, &pix->output[3]))
> +		pix->output[3].wm_num = 0;	/* no statistics without their buffer */
>  	vfe_add_params(&pix->output[4], VFE_V3_COMP_GRP_0);
>  
>  	/* PIX mode */
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index b90b538c1aaaf..1522f1046d8dd 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -623,6 +623,63 @@ u32 vfe_hw_version(struct vfe_device *vfe)
>   * @vfe: VFE Device
>   * @wm: Write master id
>   */
> +static const struct v4l2_isp_stats_block_type_info vfe_stats_block_info[] = {
> +	[CAMSS_STATS_AEC_BHIST] = { .size = sizeof(struct camss_stats_bhist) },
> +};
> +
> +/*
> + * vfe_alloc_stats - Allocate the write master target of a statistics output
> + * @vfe: VFE device
> + * @output: statistics output
> + *
> + * Write master addresses are 256 byte aligned and the v4l2-isp block payloads
> + * are not, so statistics are written to a kernel buffer and copied into the
> + * userspace buffer when their completion group fires.
> + *
> + * Return 0 on success or -ENOMEM
> + */
> +int vfe_alloc_stats(struct vfe_device *vfe, struct vfe_output *output)
> +{
> +	output->dma_size = sizeof_field(struct camss_stats_bhist, bins);
> +	output->dma_vaddr = dmam_alloc_coherent(vfe->camss->dev,
> +						output->dma_size,
> +						&output->dma_addr, GFP_KERNEL);
> +
> +	return output->dma_vaddr ? 0 : -ENOMEM;
> +}
> +
> +/*
> + * vfe_stats_fill - Serialise a frame's statistics into a userspace buffer
> + * @vfe: VFE device
> + * @output: statistics output
> + * @buf: buffer to fill
> + *
> + * Runs from the completion of the statistics group, a frame before the write
> + * master writes the kernel buffer again.
> + */
> +static void vfe_stats_fill(struct vfe_device *vfe, struct vfe_output *output,
> +			   struct camss_buffer *buf)
> +{
> +	struct v4l2_isp_buffer *stats = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +	struct v4l2_isp_block_header *block;
> +	struct camss_stats_bhist *bhist;
> +
> +	v4l2_isp_stats_init_buffer(stats, V4L2_ISP_VERSION_V1);
> +
> +	block = v4l2_isp_stats_init_block(vfe->camss->dev, stats,
> +					  vfe_stats_block_info,
> +					  ARRAY_SIZE(vfe_stats_block_info),
> +					  CAMSS_STATS_AEC_BHIST,
> +					  CAMSS_STATS_MAX_PAYLOAD);
> +	if (!IS_ERR(block)) {
> +		bhist = container_of(block, struct camss_stats_bhist, header);
> +		memcpy(bhist->bins, output->dma_vaddr, sizeof(bhist->bins));
> +	}

According to my understanding, the v4l2-isp documentation explains that parameters
are copied to prevent userspace from updating and potentially corrupting the engine
configuration, which could pose a security risk
(though I don't think this concern applies to lookup tables like gamma/lsc).
That's a separate discussion anyway.

What I don't understand is why statistics are being copied. They should work the same way as
image buffers—from the engine's perspective, they're just buffers containing data, and from
userspace's perspective, they should be identical.
I may have missed an earlier discussion about this, but copying one or more statistics on
every frame (and there will be more in the future) doesn't seem right.

~Gjorgji

