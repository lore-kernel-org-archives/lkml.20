Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689920;
	b=z9ctGvsCl/XOXMD3Wom/CuUwnEGb6Z9Nz4C+UsIpUGjMYYWGeQG7miAx23mP2eN3D/Sk
	 O6S8qi9c96gUkMF7xcPBxRX7HzczxXNmjl90C0jSYOECP/AKh4fDr7MRcNbk1fBZcCs9D
	 k+RTpqJFfyuWh84hrTu5Eok8nj9tOlrF7BLTdy9AZas5Qax67ECjopo7cJ8k2BOEboHbJ
	 fiJNlDFcgkp6FO6vLO95QaX1Toi74HFAM7xZoiXEgogELgLqKPA6+xuJ/glYvWfGSbTft
	 DAxlYznOB3u1vAtD0h9n3gHC1tHIXvWJmmNUXj9qexyecIyvF+hVZ7QOUM/1Sdcw0AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689920;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9bVxGrizvHlWGyxEpUOac+ynB7o3GHBfw8lkl6I6YiI=;
	b=myZBuFvUeLtN9HE6wTI/1vJQveM4b1wuO+5vQRq6NeqBdNJ+a4IwMqqHHP2IducIPGnw
	 z4eAs/cganUWlYkIcR19000mwkS4Ft1VdMIJSJWwbkzjqwa47PfR9GLXnnYe0Ym8Os4BU
	 bOpEbQRYU1cuV/6g45qVaK7j8JtrcPbeUyK1rch25YcOeM3z3cd2AkKmS/l+d8wgiqhpB
	 KeCRpHC39x/MGelrjaM+vFsyavsLqAtHoKQgFKwaXa935riA8DEevV8gOnn9h0Aw5P3XF
	 5FnD6ImQ8nOgKJPQ1TV0Tv5P+vIXWrsRC6v9fkortYLoTQeqtmxiaYMAhEXUcYXzTbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=INxS16Gi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j4HWwA6W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB48606A334
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB48606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=INxS16Gi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j4HWwA6W
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A352kSf2449009
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 07:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9bVxGrizvHlWGyxEpUOac+ynB7o3GHBfw8lkl6I6YiI=; b=INxS16GihLdD4J9o
	bT7Yu94iDwUURcwfD+2AVZ1tXp6IEprcYRoDsSXVKEE4go1YO+Uiy8Z0BndMZ7Rw
	qYq6zfg4pq9y8PTy+pJsbyD4QSBqHOPpWbpn05EWaJ4WEIqX2KjG1HZ3+6EnV5cP
	/ZJZQeYQyIE61k1RovTU4qiF6aqrTZAwX9BNpHj+WSio1NmYXF6u5D7+xQE35DdQ
	Z2WGcIl/BDK5P7eWWKYgbsO6B5FGfINE7lSlxmobMyRacnkO0Xz1cGEuMjBw62qe
	BVt2FvHk2aIjP1ZDws5p76wqdl4Wb0JFCO+wkZ/hvvAdPIKtn69VoAr0HKi5PnYK
	sVFTAg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cren5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:11:59 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc694cb4adso739501137.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793689918; x=1794294718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bVxGrizvHlWGyxEpUOac+ynB7o3GHBfw8lkl6I6YiI=;
        b=j4HWwA6WxyHGqDh6hwlWiV9Tnm2WsiJZchl/rFMbZzJWC9gMWjLOcerdXPNY0hR+BT
         Yu4VEFNCp4IaoMC3yXETSptE5mkROjZ3A3jTjFUHQpieg3AAYowsXQtnU3aYlxRX62b/
         vapOe4E5IHfvbAmOWI4sQkTLNJJTjg57Xk6tWRKWgPJpwy0jXsMNxAFD+wxxGXgD6GlV
         L965v3hpSPeShhZymKQKUm5MaDqhSzEuuvP/7I0Q9nR8eL8gzIURc3vE+bhImJz06XQC
         TG1MxFyyF8qSS9E/7FOq5xA5hGOPt0KB/0wJIWniscsuDY3X5BRc0xvdM9VmxlKukP08
         ABJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793689918; x=1794294718;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bVxGrizvHlWGyxEpUOac+ynB7o3GHBfw8lkl6I6YiI=;
        b=ul3qLU/BYDKPAU1jIi7MRMTD+PZghIlDZMe/ZvzJvMP1iCVwu4uSR7f1u5yoCGFCPd
         NXnpscoUHwb4Vdq260Pw45A2erZt2qyBShFfDuniuSxe/Yvgi5Q9wdrrN6Q8YLtKtxu9
         4pespE8uPn8g/0lKkXyv4A6CjqIEMB4uAi+j6Rrk0XYZjf2wyb9K0+wgxxuJg/bAUSU8
         bUPYSZGHSLtoN/oqOam3o7gmtz0dhplZ0up88WepnyNrd/ukFgQKr+rkxn/ecHLEi9T2
         73J2G+N7ctJxMbPioUVtXAqNKhf4hHGHV3PWFsT87jD8LqUJ8B/lRp+hQjt2Vvil6iMA
         3bjw==
X-Forwarded-Encrypted: i=1; AKwUvBxH5YLyNLgB5X/7mXQZReApJdY4BvJgXyHgO2f6N605sJGbOrwRwNxhYXeRifmsV2V4zIJGavlW8IeJ0IQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z918D1N9uZ/32sGeUyg06iDcloS+1152E6TFdZb7WZGfgVDEslS
	2JFyZA8WEnW5sysHNim2fe+iwht8o1kl1gB+Nr/WrbBlj/8tTXm88IP2SC9Goh/h09Fkm0Zks/h
	/6WVkoydDzksnDcX+aXbMhhqGrQOJGHaQXVOTYxuIqWXQYr1hnVNV3VcxZC+KwsW+8wwSQHVT22
	s=
X-Gm-Gg: AYBFou39EuBxmPek9rNYPzz5ObTldKYBxv0L+WZHfi7PJ6GT7r2lH6ND3UBJAqPiod8
	HiEE4UZh92cnlTMSuFfDOZz5GlO5aIG9RM9OHQaFXOoTFGjfWYYQ3uY/NblVkw+GN0S/iwfbsUl
	A9cB/w81FiIRcWVcfwYacZjrxw8jeLcuXpNY6DlcCGVktK3kz0C9mGBHjeTRu0iCxpFqx7s6Fgr
	aR3+sDzhvMfLEwGwjsxVppk/LWDxdhoQkb8kKzvsrtyD8dP0KZ4WiuAN6EJ5KFo1DMjYoqkKTEw
	kVCzMjRIBn1g0BNtKMx84Pl96YSXB/6WtZQ3BrgH5y9k2q4Q/d6kl/ozTOgsl2VV7KySjix4nqz
	it6+5F1kJy40tnOir4YKxFjMn+mPto8E2fB5QBczlyAnvvzCI0NPKg7ePCFOHZf4O2VnS9jHcrP
	k1DtaqDVXko49m
X-Received: by 2002:a05:6102:6058:b0:7cc:95ed:30c9 with SMTP id ada2fe7eead31-7d0726402e2mr3286561137.29.1793689918474;
        Mon, 02 Nov 2026 23:11:58 -0800 (PST)
X-Received: by 2002:a05:6102:6058:b0:7cc:95ed:30c9 with SMTP id ada2fe7eead31-7d0726402e2mr3286556137.29.1793689917887;
        Mon, 02 Nov 2026 23:11:57 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm26289556f8f.31.2026.11.02.23.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:11:56 -0800 (PST)
Message-ID: <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:11:55 +0200
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
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence
 tracking
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9893f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=Mm-NeIu6uG9qZOItl_EA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4619C4lfRtvyMV-t_7VnbDwFaNV993jV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyOCBTYWx0ZWRfXw3VjMPGD2UVR
 o9zhMCgOFlYjexEQXMmZd7rLdoXb1aovulnjGXcYl8BApn2cy/YNjvUVF8yVfLo4Gxz/J9Pu5TM
 XtWalPwD5vZm4MZc2aJgQYh0vxeTWrrDLPqNT6wf4Q2wbryYycIV7qrGRgxw/AyoQuNLcRaNOI8
 dlNUPz0eeDw7qyPs2o7VVCAkb2YCh6+AeiJlh+jYH/N/3PGoHOdQ0oZ3SQCKNu2pTwLQo/V8rbO
 znmv/CbkMDD/C46wh+yTFTLnbfj5eanJzsKb/MWpbRa3eJapk6Gu0hgJ90BG50hY/9BATMVSV22
 cQO4J8bWpihEljVI/PwrWZCO/StzFEP5rbHZXWv71ga2BN3JGT7YiEdzVEYbxdeNwHhRxJMW4sH
 WzAAoiUH0/7tjB1IOYFNGtZcYDn9QI27/9EHXs4UeILjdMqUQcIDNKwhlDtNlKFsjo3cNZ8pV1C
 Ru/M9axiUJ+8prQxbZg==
X-Proofpoint-GUID: 4619C4lfRtvyMV-t_7VnbDwFaNV993jV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyOCBTYWx0ZWRfX1xrGFZcj05PL
 0f8O9spiQ6avrY8FHNHyM7xbqqnJa/xCTB9i9Dz9qJjol84M5xqnITP5CXpokCVZhWvrinkVoG2
 cp9RgR+gPTP3DaWGwpH/eQmihEPVWsM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030028

Hi Bryan,

On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> In order to communicate to user-space CSI2 SOF events we will need to hook
> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
> implementations of FRAME_SYNC have CSI decoders which support the event
> always generate it in our case if and only if an atomic user count
> indicates it should be so.
> 
> A flag in the CSID descriptor indicates if frame_sync_en is supported so
> for each SoC that supports it this flag should be true. Since bool is false
> by default no negative enumeration of existing or in-flight CSID is
> required.
> 
> Subsequent patches will enable on a per-CSID basis.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 54 +++++++++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
>  2 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index a00791b00feb7..e9b399fcb9c7a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct csid_device *csid = v4l2_get_subdevdata(sd);
> +	unsigned int i;
>  	int ret;
>  
>  	if (enable) {
> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>  	}
>  
>  	if (csid->phy.need_vc_update) {
> +		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +			atomic_set(&csid->sof_seq[i], -1);
> +
>  		csid->res->hw_ops->configure_stream(csid, enable);
>  		csid->phy.need_vc_update = false;
>  	}
> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *entity,
>  	return 0;
>  }
>  
> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsigned int elems)
> +{
> +	struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
> +
> +	atomic_inc(&csid->frame_sync_users[sev->id]);
> +
> +	return 0;
> +}
> +
> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> +{
> +	struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
> +
> +	atomic_dec(&csid->frame_sync_users[sev->id]);
> +}
> +
> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops = {
> +	.add = csid_frame_sync_add,
> +	.del = csid_frame_sync_del,
> +};
> +
> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
> +				struct v4l2_event_subscription *sub)
> +{
> +	struct csid_device *csid = v4l2_get_subdevdata(sd);
> +
> +	if (sub->type != V4L2_EVENT_FRAME_SYNC)
> +		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> +
> +	if (sub->id >= MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sync_en)
> +		return -EINVAL;
> +
> +	return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> +}
> +
> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> +{
> +	struct v4l2_event event = {
> +		.type = V4L2_EVENT_FRAME_SYNC,
> +		.id = id,
> +		.u.frame_sync.frame_sequence =
> +			atomic_inc_return(&csid->sof_seq[id]),
> +	};

On first look this was looking strange because the id is used for the
control id events not for frame sync. But on second thought it may make 
sense, but the question is how the userspace should interpret those ids?
As of today userspace does not have any info for the VC and csid internal
pipelines (so called lines). So with the current state of the code
the id is VC which makes sense becouse the SOF/EOF packets are recieved
based on VC. So i am thinking of two options:

1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
   and will be well known to userspace for which line is reported.

2. Add and propose extension of videodev2 documentation that
   id of frame_sync event types represents SOF per virtual channel.

Personally i votoe for (1) because it will well fit with stream-api 
support and usespace will have clear understanding of the SOF to which
stream belongs.

Given this in mind it will be good to open discussion with Laurent, Sakari
regarding SOF event with stream api and GMSL cameras.

Regards,
~Gjorgji
 

