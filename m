Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406935;
	b=kfhV9zYwpCSFewIeRGKvdOhNh6C+PeoRgqoko2QqTGB7CYSnNTg9VfROAfGs+6vnlSJZ
	 f5n5FLfqhSp8VgOxQqlzgAPQFjXpbeZA2PoX7NFSwW4aRuWQkmeyRLk5iQztJnjdLOsJM
	 GPV1CXjfctyuKf8LfjPuAir2IUeLO6x4Q1Fhttfe55gGjDSu6MhPY+6VGFPi7QTjf4G90
	 fNJtnrb2/Zus1gN+cYusDg/Tvo+rXUzrq+XEUuOqh40XEOIEz8HJUCeEx/DLSnMw6LSB5
	 8i6mZ63QwXs4L5v2DGDfSmO0zaFB/u7QPMssjdr6WhQj2PZThZTQhPN6goKz/PohOBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5vxRVg3BVpCwTSewYkaACukSmJoTpCO+UQbfXLbns6s=;
	b=mQvB88gzxfnWHVswAaGinotgBlB9S4NpDUiWnk4jQt8XrBiMDFM4gC0sYV2ragb0VsGw
	 GyXnHq90zJCTNikZbpZrL+1ou8UvJq15LfMQaILNC6ouQer/4+4wVyJ95Es7zsR3YFqo0
	 OzBosSeMkCoOUuK0z6rlrT3YEqrgx+hv7mAFoPiHffaMDKXrpOOoGniK+pTsIFfephawC
	 fuIXMdENa/sAXwwT3Kjr/b730nNu/gsS4YO8rUUyHrnE7NvU+yJgtnGIvsDimllQj83Dz
	 UwNNTiCpBXIVnH4GrDNm7YY8VZdp1qJiVAxZ7p2B53f8EesZGEhoJHJHYuUpt3gW9xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O8zZQdAf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KicE+FgC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E252A606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E252A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O8zZQdAf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KicE+FgC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEGwaG1573259
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5vxRVg3BVpCwTSewYkaACukS
	mJoTpCO+UQbfXLbns6s=; b=O8zZQdAf558lWfuKtUjSfXEXCDjb+g/Hw1jL+Og6
	LFn8nqrcCreO2Q5cOMI6GlRJJCFYdqNzmzhOWnik0VQ0CUQ9JLK1JHzyLzA6HKqD
	Sf7iLfN18wm/9b3bvEgP70WFNV69TfgGsfZZk+0ixsih/swZK7Wlfg8VE5lTvYIQ
	SkxvA7i+LxTwJVsYLptUbz17Jhp8ZsVeKupkLLsD+9kCBmKyfeDy8vzS4MlaX9Ht
	lT77MbdVPSkDpsTXMYbw0sdlIoiyOxm8O4EWxWgcLySaghIu3Xuv4UBPwLf1xIoJ
	V8cveGJGSPLyP4NxL9dbOeGOJfzVQYdX715XwMXZ65XCmQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7psm8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:22:14 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eacd2f2229so3622159e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406933; x=1795011733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5vxRVg3BVpCwTSewYkaACukSmJoTpCO+UQbfXLbns6s=;
        b=KicE+FgCMUk+U5/HlJZMcCTbbL5AI6f461/6erXjxCNjEB6RqTk5S119RUNRuaVHa8
         BPisPeQFb0klTtSpY9EnNyp4LHi9Rwy1B3rrE3boKdQXMSzXGUEwZgI4k6kWeYPHqNq8
         V9YPPNomRKrJgnfsWyLh4Ja2bkkRhKgY5Xo/1BimBbGEMPlayqULIb/S7Fmvij0qNMEX
         7DonSFDEsA/K3RlnsggZGjttToCB+epyFSt9UI0PlqS3Kv3jb5B31NoXxqz8/BN2QhVB
         SaAN9Etobs5vF7H4vMG2U+7CHC3bpn7a+pAdlBGqRNKHhkc7/ryP+8RvFVqQCpk9DQVe
         5O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406933; x=1795011733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vxRVg3BVpCwTSewYkaACukSmJoTpCO+UQbfXLbns6s=;
        b=PLQarWmKEuQn6ml5BS7qHA6TTVoDZZDJvXrNXh9xinWqI/mWuWvkubVB8q4O6kn5+h
         EDYw4GZ8XiHg9oESb4ZJ4I//lesCdBpRHjaz1s58gBUswgOy2UcBoI/DhSyK71Jn76oY
         wGwiVomJ/fkySTq+132ucabqyiilrjY++/Kh2FU4IBI+lgMusPjURQWj3+bfubd+KsxI
         e6w32CuCJy1Dm2r6EOojmD1uuitjzRKG6nkp/U/BCBro8/tXgB3o8BgjvGQLEntzP4pY
         2VY+kC1q30Sd4RYYNmuYdBPVFFxPnBboa77CpcloJtTZQaZnrr0Th2G7il93Wo01eHC5
         swWg==
X-Forwarded-Encrypted: i=1; AL+hErHLr5TzsLn3UUnSquXdpgtCMWnHT/FfmO41VOZpKMdPs0T/LWJcjgx20ks9oTsuE5huT59YFFjj9uampQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9OTuslmimVKZ3VCQPvLSt4ubbOn1nFkrLZedUAGXioMh6B4At
	lLVHRYB4ugzW70XlFjPSnEksUY3AYhFyTVQab/QpU7iy/6We5RP8fGuPdmQRekuTSXQNWJuP16P
	EhWn89NNd4u/mBsE6wNyS9sSzGCDmWjGpb255gbKkCvBiCApULvCzNqugd+bUl6G/8MY=
X-Gm-Gg: AYBFou3JIcR6+E+EsV5Mms3jptt8AEyY8a3jff+Cy/OaNTRpJ6plYIqlOcJNDiB1EE8
	TbweA4E8Qr1F9YMDzHwbMOKJCIlJQDaPv5UiVc1pfjTR8U2CY4xMAGUvHUEdGZT6jyapcjTPKNo
	kz4DtFHf7ONgq174gn5ylLT6MAunaoOOkCQpj+fh6axOCRR1bVsCqK0svpjV8+iNlHBMPH6JhF2
	3ZO+tjtC+Eh0mhOd5UTKY7br9qGV1sZ3bh5gGPWXUA0gKXZmVcFOjXk967AwW6we1e6pAy0xsCi
	2zbNyVX+gjcKVmagpDp7khczfvao04wd4sqeU7n+BwgD6azpVBg11guSRLDNPOn+H4K0s5jg4Qh
	A8D80e2FFf2nPr5oD3VFj2cLNNK+mw/kt1riGwueNw94+pV9xGzQ8vERhoctfnLcOsI32/IPRln
	OzUrj3Fsw2jUl4sEhqNwn9qROnx8ve5P0LW8lE1uHaqyacax6ixKg9kRr+6qMmcQ==
X-Received: by 2002:a05:6122:2224:b0:5ec:bdfa:8f56 with SMTP id 71dfb90a1353d-5ee1c3f41a2mr936989e0c.11.1794406932947;
        Wed, 11 Nov 2026 06:22:12 -0800 (PST)
X-Received: by 2002:a05:6122:2224:b0:5ec:bdfa:8f56 with SMTP id 71dfb90a1353d-5ee1c3f41a2mr936927e0c.11.1794406932097;
        Wed, 11 Nov 2026 06:22:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae11c1d591sm4895501fa.38.2026.11.11.06.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:22:10 -0800 (PST)
Date: Wed, 11 Nov 2026 16:22:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v7 08/35] drm/msm/dp: add support to send ACT packets for
 MST
Message-ID: <y446bfbdgsqqwuu3masamj33cvcksp2xdeltvaeojpolgga3fg@awtfd4bgpy7h>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-8-4b81473185e7@oss.qualcomm.com>
 <aolbmfnrk6qkfifib6bmhslaro5z2734ydfip4mnn3go4efpsy@2d4m6nnh7ogv>
 <3c28f89e-8b49-4937-b4c8-66da180a5706@oss.qualcomm.com>
 <fx5njelx53gciz6rguzjybxgbyxbfqweelsuy4j3aab2n5awrf@n27xvmre7ztu>
 <ebf962ad-6b55-4741-bbb3-783f56c1106f@oss.qualcomm.com>
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
In-Reply-To: <ebf962ad-6b55-4741-bbb3-783f56c1106f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NyBTYWx0ZWRfX/H2WEzCpGQKu
 jfzOBZxl+tSNi82J+6pPDA8WmV+OUjxFIkZqv/whub7PAbj7EbySScY2OpFOqI7b9heMQWx2JYW
 u5Y6UnHW4u9eVH5fUmt7Kn26IRng+Tk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NyBTYWx0ZWRfX6Wki/byhcQ5r
 np0nB8LCKkv3mLU+5em3wgvmdWhk5/LQs/bYS3/wmw1R9rWAUJcKWrbdVCA5qxc41oSIgpEjB5o
 IOBQhDh+dL1Nc3ppi5Z4WpJzboFY//EU717aCUCpM0JBW81orOZHACoMiq/tTjLs4NEeCGVOEy0
 QI2V+jBrTxtBwwiNsjUX7UlfqvodZVVtkUjPFRvfrbD8xAnObpjLQcDsFmZspIGtJbiYhbddNKD
 O5tT353Duff68MzhXI8h+VKK/BljMhC3eD6uEkJzEwCXHGYbEICRQNepdtkCAZ6iyYVH1u4f8Fe
 pOitRD6sJ8YHir0ZCSTo7YjG4LsBpcHjxq8tWO7NYGZW5lC/TtT+nDyUqqOG9m5SzPDpwlqZICX
 8lZa0KBukNPhiNYKV7kw9KfLTfBMGGtFlhkCN5Wl9Csv5lxJ3FOwXO+b2UOzZwTkTGkTWjaMpM0
 18i+kcsEAijNWOW1ayQ==
X-Proofpoint-GUID: 9m7jjiJXDeE_4tbuQ36UY5EDb8vM45Ez
X-Proofpoint-ORIG-GUID: 9m7jjiJXDeE_4tbuQ36UY5EDb8vM45Ez
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af47a16 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=oFVhhI-gopzdmxxvu7MA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110057

On Thu, Oct 15, 2026 at 06:28:52PM +0800, Yongxing Mou wrote:
> 
> 
> On 10/12/2026 8:23 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 12, 2026 at 04:44:06PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 10/1/2026 6:32 PM, Dmitry Baryshkov wrote:
> > > > On Tue, Sep 29, 2026 at 12:25:32PM +0800, Yongxing Mou wrote:
> > > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > 
> > > > > Whenever virtual channel slot allocation changes, the DP
> > > > > source must send the action control trigger sequence to notify
> > > > > the sink about the same. This would be applicable during the
> > > > > start and stop of the pixel stream. Add the infrastructure
> > > > > to be able to send ACT packets for the DP controller when
> > > > > operating in MST mode.
> > > > > 
> > > > > Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.
> > > > > 
> > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
> > > > >    drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
> > > > >    drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
> > > > >    drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> > > > >    drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
> > > > >    5 files changed, 51 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > index e1614bc49a7c..65d22505c2b6 100644
> > > > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
> > > > >    	bool core_clks_on;
> > > > >    	bool link_clks_on;
> > > > >    	bool stream_clks_on[DP_STREAM_MAX];
> > > > > +	bool mst_active;
> > > > 
> > > > I really don't like the idea of having this flag in two locations. Here
> > > > and in the msm_dp_display_private. Can we have it in one place only?
> > > > 
> > > These two fields are intended to represent different states with different
> > > lifetimes.
> > > 
> > > msm_dp::mst_active tracks whether the DP connection has an active MST
> > > session. The controller field records whether the current controller/link is
> > > operating in MST mode and remains valid until the link is shut down.
> > > 
> > > I agree that using mst_active for both fields makes them look like
> > > duplicated state. I propose renaming the controller field to mst_mode while
> > > keeping the display-side field as mst_active.
> > > 
> > > Would you agree with this change?
> > 
> > What is the difference between these two? I.e. what os the difference
> > between those two?
> > 
> The difference between these two states mainly shows up during unplug.
> mst_active is cleared when dp_display starts handling the unplug, while
> dp_ctrl needs to keep the MST state until all streams are disabled and the
> link is shut down.
> 
> So there is a period during teardown where these two states are different,
> which is expected.
> 
> My concern with keeping only one state is that we would need to pass the MST
> mode through multiple dp_ctrl APIs, which would make the code more
> complicated. Would it make sense to keep this state in dp_ctrl and rename it
> to mst_mode to make the distinction clearer?

Sorry for the delayed response. How would the driver behave while those
two disagree? What happens if the user unplugs the MST sink and then,
without stopping the display, plugs in the SST sink?


-- 
With best wishes
Dmitry
