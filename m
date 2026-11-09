Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794217791;
	b=KZuMQ58L1QuAnst3xGYYursiw2ZV4jR0HKhA4fmePEXWPhA/9B6h/tKgPzTCY7RdHgnj
	 5LpHLjcm0y+cQuVgz9uxOhQdDXHt3q4QDf1qTubHfenwAwMvXsijHcma1c2ZZ+1K1lRxB
	 z8xoPTNhsNMQUdzxuWPFg90ITlexkbmH1DKbf+ycsUYtgSyqWXfPeEpJqmC26Xp3VvUsl
	 K0hG4UVeEle+qt+J30GdrooR5ERjxhcrswIMPQlXSu3p+lrK4HxWbMgSHOqfE34vjNCLN
	 9NQ0qWx/ioOtzyHvteGrwdOP8TkRRYvuk0xs2kgXKmI7IQmEWP0zk01kwtCy/wh5AUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=;
	b=H+p3lOsxjYOVa9sfnYUxSPBp1J9rTuzdVt6GVGmnD9/iC06u8SV7yBlvKIW6vt01widW
	 x/1ZezSkf1O7pyLzfDoazn8o7ca/gLlY3I9OwhB/w+1ypLwEZc+qRSQJrzQ4RsZgeh5Bl
	 /FfOqScg2aQaEtHBMWZADzj92ATYpeZzXH1CBUsjxT0Yf5PBFyBGTOto+hd1PQ7UeQG6w
	 Uds2SwSuxsG5lZG3Lhl09cDktJtt66mpkEMZZaAdcUf4kyHJqVdRNt5urqOnmDXhc6ggJ
	 R0mjB1ejUhb7ZKuZp0G3OmM0EnT7n8LIrK99Bobobh7b3XxeO90Q6qxBCDl8/7+PiSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QbKCSmbc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="F9QP+O/y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E024B606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E024B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QbKCSmbc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F9QP+O/y
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A1Nk3298157
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=; b=QbKCSmbcHpe5rKjR
	rn3Xi+QvzRzQ2oF/FbmooC6A8nmvPTqEG7BQu7XTYi+KHxes482WuUVJMcyNkcb4
	eCARzrZYFPpXt04RhyY7s1FsCO8YVJ4h2pAtnWumCUhtjBdZ6kz5pVC13MAM9wTo
	K9u2Aqm9BXloz1Syerp2dztmAOr/Ts/awudO/PA6st/r0/ebvYAAS8xCkF+BK5Wc
	0NqWlM0622MT27w9vsypZDFSu/YQRXgR9F2rcHxOpw1BoNP0zGcJO01cUizPwGuQ
	ZPX/JvdTVW7H9qlkRFOkDENoE89Dxs9MgoiOeAUkopN9jB/rrfRzshT7nFXwBaal
	1n+yLQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagwtp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:49:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338ff2cf14so14490661cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:49:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794217789; cv=none;
        d=google.com; s=arc-20260327;
        b=C87fYIRRopCpuiKgn9gKn8kjwVw7DmgAjg0OyBLWCBjZfLubMl2nxQxZyAMEl+l4g3
         lVX9UpYnz/ajmfEYMz9urFhwPXxHEnoV6ZMElCT+AQISSmttxb5g4O+pcwc4OJW+GAoT
         MOQxBnmePcLursytVgAhmrRnrkPE20mPzKUlzkf4zwnwsYGsQUvMK8Yby3BjQTFrE++p
         8nDquLNhRa+U9isYMdt18aTnwr/9P0jxf0BR9Z+/tINSrFD6HEZlu45Lo7tiumOlYUmJ
         9yiS+U0mZyG8QYX3tEpyYWvow61h0ZAg/MuPlrh2iFut5oH1AS8GRjAtQ1aK5bI4uGNc
         QUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=;
        fh=CmhnOohECeDLazwzVxa5LvQ02XXkDh1spv6KC8UYK6s=;
        b=RyGO7BVPC9oyw4xRELjZY5xCDa5hnvGhhDsR5GxW4mWOt7QtjXPS6yAoAOPAfEOQjt
         a7GoK1ellQd6zGbdd07+YSolm9fDcfHNVwcuLhqAx9cVFH9/OaZyXM2ZpmXlrZ1KiZXn
         Ciq7Ar4wixaqkGT25BWyiHW2BwvVboI877liNTAW5g1qMHoC6/DCh0ZeamrRKE1p0qd7
         RVLczSbWu5bbEDcEHTFwzBSFM4pBlCsvr2YlKNGq+DWQXt7H45YkwAot3pcxMM/M7IDG
         wYwneR3mMtYI1zREVm8qvjNQ26gr1JTSORXJuOC0L4G7CWzsG2w6aKvadzvVLvYEC4eE
         7WUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794217789; x=1794822589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=;
        b=F9QP+O/yS9iVqZevv379hLgKHHKukW7Dpl2CZ0z6vCwnZV8C4tB2gZfhuXjvIgVO+6
         Lki271XuK+VVv/3gWDrIh29puxB/AiJitkgVjDq0qDPQB7xRI0QhlTG0nTQBYVY/VsUB
         JaheFo8XIgSeapbDZ6u2JfDKvrh6fFEdG25+egX6TJg1kRwTCZa4O1PDGdyl3r6aYLtr
         ddqA/hN9BS6fmeUnmBihSUhIgjt972iSxV4Dl03AIjW3jZ5OUmuDvGor3lpIK9L1k2Vi
         WhAvl+yZsDTIOtIC4AOYp2NHPpDjACdQVw1IQdvexI4xvddnzhwG6rcJeK60Yp0pEmhw
         ylGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217789; x=1794822589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A43LRLlfY1VoB7l3hvfT1w2+7RbYPuRRkaKzPxORuaA=;
        b=iAiEiZwdbq5L1OBhX76aNofo75TRgw1DyrYw9Kp+SzeUNloRSOPzGxPf7b5FRMlWgK
         VQ7ThFzb09E2J0E3xBIRnpW9KplBkKnR6wMjMfLlpNUYHu35hWcNhHCHi5d8nISzAQrK
         ezNS0GrS+h2/GHkGHy5DnAAeL5APGEp7oSyip/1ejCpIyI4hGQrPYuZceNu5WBu9UAD6
         Z4R6xYO4H1My1e1mqpOHIfpBNWh8G4lBoxBcFWobJ0HKIKw6tOjpK4Y0PCiJ2+jNvNvh
         FLqmKdgrbPZ+6jrA8NS/TnDOxCvJTlU4sJ2sDf4CISC1uC7sKTP0F8L9Hu9zw/34s73N
         NGFA==
X-Forwarded-Encrypted: i=1; AL+hErGzACB4taNr9MohH3hb3nUi/i3TxjI1qggPPPjdG7WaU0Waoh4PU16MffsNI5gtUvJcxMtSm4ZqR7v5PZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B93Dw+lms6NytC/PbAvdkllqdEqfSAwpVojaseiGYd8pzv8sw
	yAwueU13tbTXPqFNSFyRsweIBiWPNI9GYOfTSOTg+E3EMWy8fLp6XRR6LN0xv1UfoVCb3aP+oXB
	X+0kC7V4uhUjRaaLXjPkeyAfNoOw6i8MpBdZjHFmQ7DpJNs44tunMoATF/M5rE0ZJ5JNJ34JSkY
	ftSmGpW9WW7dBVe457Grgai/tylKMh2a72Tzi/EgbF0Q==
X-Gm-Gg: AYBFou1NQAIqbyTWBZoYTa4D2y5d2C6JVxzz7h1MbCccJkZph1HXT9Nsx8tIWGts7lA
	PJZOxbCft5vwNgGgD/hzKW6lMP7aFYCf9fgn8sixBg1aWfrr0wHoerYycq0VXrxEjCxaVJFJdJY
	0NBwxj3GPP/xCsY1Q/3BcD/GA+1s6TyU8QENcNuMJ1/hXDS/9DXhhmhw1K8nNGJyo4W0UiDY8a3
	hlocR26VHnJxXL5KrEqw/Uos3Pt2d/jKpXQVLrrgk3oHuwQxwqbFbwUzXxbJAO+WjuFGqPVfkU=
X-Received: by 2002:a05:620a:46a7:b0:93f:2bca:2cd8 with SMTP id af79cd13be357-947842757dcmr470394785a.57.1794217788938;
        Mon, 09 Nov 2026 01:49:48 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:93f:2bca:2cd8 with SMTP id
 af79cd13be357-947842757dcmr470392785a.57.1794217788415; Mon, 09 Nov 2026
 01:49:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org> <20261107-v4l2-frame-sync-v3-3-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-3-e5bf7073a35d@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:49:37 +0100
X-Gm-Features: AclHuK_y07fkzKo1YjXS7RBfNxjVDAed2Q4BKv9GuNKAjF7-rmkOWA5Yh4RIhYU
Message-ID: <CAFEp6-1tMwheRKaN=sEgF9abzNZOLS79OePq1GOwtm8JGXjSug@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] media: qcom: camss: Use SOF sequence tracking
 for vb.sequence
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX/6woa/eaHx1W
 9ipTkkw2HcnMNhzFuYwPiswGDP+Wx5JwampvPYzst+TFKyU1iWZOJUXsKbh0a9ENATDTup2n07I
 rSE2azx3rytUejKj2HNWbAv9/0GzVym8Acns2z2/hJWFCIsi02LNxtvuMjLkJlZhqyPD8NbaUEO
 elCt+wftuXO4mIi7X934kfc3kyoReQII3xjLSgfYEv6sVBdeRwy8/a9nHtcJQFcrgaept9qlKNC
 I/wohGLYBPkJLES/1wfsZus6EEOvnLC9DRnX18X9xCtXKBO6ui+SFE6X4Sy6+tz4Nr+4DKjzw1/
 Ifp450ZhVvepR3B/FSCvoukwJLPbBZb0xmc5yFLyG3KnW2DZvYb9YOE0RyIXQYccGtw26mpHNgi
 LT17BCDdu/uMDV15g1aVBSho7Xc1OTUi9eLfsM90Potl9ptz0YGOVvOIyuKadzT8TY303Wnchw7
 Gugv8szah0WkcXn9aTg==
X-Proofpoint-ORIG-GUID: GdHFxusA_ny528_aHodTzCfvJEy805RL
X-Proofpoint-GUID: GdHFxusA_ny528_aHodTzCfvJEy805RL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX5UOlO85LJWwt
 VvhPyUH+1OKNvVUhmbtECPjpZ9ljiC9mQsvYtaYejADRmnHJoz9THD/dgjGoOZ5E4F2PFXKRc3v
 9O1S0VtxISeytTeiHicoB8i8Q9NKg+M=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af1973d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=AFkX6LJAiSV6nzPqyhcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090038

Hi Bryan,

On Sat, Nov 7, 2026 at 2:02=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> We want to correlate statistics buffers with data-buffers. To do that we
> will need to have a sequence number driven by the SOF signal.
>
> Rather than incrementing vb.sequence when data arrives, we should increme=
nt
> when SOF happens.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c    | 14 ++++++++++++++
>  drivers/media/platform/qcom/camss/camss-csid.h    |  9 +++++++++
>  drivers/media/platform/qcom/camss/camss-vfe-17x.c |  5 ++++-
>  drivers/media/platform/qcom/camss/camss-vfe.c     |  9 ++++++++-
>  drivers/media/platform/qcom/camss/camss-vfe.h     |  1 +
>  5 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index 7f33fb81ca8cc..588122beec854 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1356,6 +1356,20 @@ static int csid_subscribe_event(struct v4l2_subdev=
 *sd, struct v4l2_fh *fh,
>         return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
>  }
>
> +atomic_t *csid_get_sof_seq(struct media_pad *pad)

I would go with a `const atomic_t *` to preserve explicit ownership
within the CSID.
This is also what atomic_read is using, so that should work.

> +{
> +       struct csid_device *csid;
> +
> +       if (!pad || pad->index < MSM_CSID_PAD_FIRST_SRC)
> +               return NULL;
> +
> +       csid =3D v4l2_get_subdevdata(media_entity_to_v4l2_subdev(pad->ent=
ity));
> +       if (!csid->res->frame_sync_en)
> +               return NULL;
> +
> +       return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
> +}
> +
>  void csid_sof_event(struct csid_device *csid, unsigned int id)
>  {
>         struct v4l2_event event =3D {
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index a9d88909d37fc..8edb258b0ae58 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -260,4 +260,13 @@ u32 csid_src_pad_code(struct csid_device *csid, u32 =
sink_code,
>   */
>  void csid_sof_event(struct csid_device *csid, unsigned int id);
>
> +/*
> + * csid_get_sof_seq - Get a pointer to the SOF frame sequence variable.
> + * @pad: Remote pad of a consumer's sink pad
> + *
> + * Return the counter or NULL if @pad isn't a CSID or the CSID doesn't s=
upport
> + * SOF tracking.
> + */
> +atomic_t *csid_get_sof_seq(struct media_pad *pad);
> +
>  #endif /* QC_MSM_CAMSS_CSID_H */
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/=
media/platform/qcom/camss/camss-vfe-17x.c
> index 62c2405359a06..4972d3ab65078 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -491,7 +491,10 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, =
u8 wm)
>         }
>
>         ready_buf->vb.vb2_buf.timestamp =3D ts;
> -       ready_buf->vb.sequence =3D output->sequence++;
> +       if (line->sof_seq)
> +               ready_buf->vb.sequence =3D atomic_read(line->sof_seq);
> +       else
> +               ready_buf->vb.sequence =3D output->sequence++;
>
>         index =3D 0;
>         output->buf[0] =3D output->buf[1];
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765f..da373024c847e 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -474,7 +474,10 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>         }
>
>         ready_buf->vb.vb2_buf.timestamp =3D ts;
> -       ready_buf->vb.sequence =3D output->sequence++;
> +       if (line->sof_seq)
> +               ready_buf->vb.sequence =3D atomic_read(line->sof_seq);
> +       else
> +               ready_buf->vb.sequence =3D output->sequence++;
>
>         index =3D 0;
>         output->buf[0] =3D output->buf[1];
> @@ -508,6 +511,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>         struct vfe_output *output =3D &line->output;
>         const struct vfe_hw_ops *ops =3D vfe->res->hw_ops;
>         struct media_pad *sensor_pad;
> +       struct media_pad *csid_pad;
>         unsigned long flags;
>         unsigned int frame_skip =3D 0;
>         unsigned int i;
> @@ -523,6 +527,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>                         frame_skip =3D VFE_FRAME_DROP_VAL - 1;
>         }
>
> +       csid_pad =3D media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_S=
INK]);
> +       line->sof_seq =3D csid_get_sof_seq(csid_pad);
> +
>         spin_lock_irqsave(&vfe->output_lock, flags);
>
>         ops->reg_update_clear(vfe, line->id);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/medi=
a/platform/qcom/camss/camss-vfe.h
> index ae9dad353a378..0e2dfa58421ad 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -94,6 +94,7 @@ struct vfe_line {
>         struct vfe_output output;
>         const struct camss_format_info *formats;
>         unsigned int nformats;
> +       atomic_t *sof_seq;
>  };
>
>  struct vfe_device;
>
> --
> 2.56.0
>
