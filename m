Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793631318;
	b=dD2GETAzq9NZYeNitu89s9Q5LgoJZ3LPyszGo+VMPDwZRm4SOAiRYrhyWmpDFPhn/at6
	 YvUltKJYx5qzBXP+GN3f6JPx+CYsAdGVJjqyFy8/ZTih2HvSKFRnRkacxsBpgm2RxIZT2
	 Vz2aD4VDwi1wj+J5v+wU6fKCfrSXGcyh3O0BoZxOaSxQLPtPwDxj3dRJ+XFWk+W9rddZ+
	 FpdT9p038+zZLLtWwzQ4DyXeOjECZMHrX2TUDo0no5HIHzo3JZteRr/wxgcSEIKW63vok
	 1KxL+zCG+e0YZn+NmWetp1QcuzzdTQH5ExFWd9tLmAzKlnf9KrnGcS+JBlJVhLWWvFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631318;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Oy537ZWjKxyQhEB86KvZocPds1AfNsAqi07sU3ki/9A=;
	b=5SWK5rAPoJMgGWIaXiIpumy0ACx7KVR4u72nzAwVkXqFsjhESkfU0XF3flaHzg7EbZR/
	 5/zdWFngaWheGKyr8+VkSoSdWiZWwHsGglV7Um/7hz55pJhX3zOLHEw/N2t7ON8uYSUv3
	 IBtnZU0Zr9FOWEv0dnOTx3LMM9Dwy74n6e9dG23xwAfq3EadECW6tcoAfWSFd2+K90b+K
	 AOlYQks7BxdlReDHbYXwek5H07MW7HLjwo8rUwDFF3Zrf1hwj0B5AFwF/7HqhYDACYHiB
	 SZtMv7MN5sFIADi+whhxJS6/HfjSjCcM3QV5R0/1Cqi55+icOw2Dqa/7QYpWRUoaaxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mjiWjOLd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EkH6xV6N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8170606E011
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8170606E011
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mjiWjOLd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EkH6xV6N
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpI1S2991827
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oy537ZWjKxyQhEB86KvZocPds1AfNsAqi07sU3ki/9A=; b=mjiWjOLdqgJzvvTI
	sTYSKgl/P7FHPZgCO767uXHR48wyo7XlfIg+dvnYmQd/smRMftkFN7yC+TrNamEH
	SqBdfEnruGd8uUaMtKbypytcjUzYXG2K8WfsFxQtXFrhYCEl5bqfjTl+5oxQ+794
	bP2nD5KkTTYzSZxcYoekfzJXi1avbIiwhpX6ZXnMn4hMnhMfoU0ozQUT84XsPZeR
	CKAitaqh+yn8UOZBstVLOyV+AlYVy5MYDqqHYBJJtqeam0cxiCFkpyHuVu3QpDRx
	bJhGOHNkrRVejfL8bQu7GsTHKFFdrsEscLvTsHw3EF94b8TpoiXEeAHPXiD5XJGy
	LPtmtQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgv8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:55:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-945b0154705so229550485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793631316; cv=none;
        d=google.com; s=arc-20260327;
        b=F+mHpFJ9XAHXWFVceY2uFD0CFRGumlTroXp3SwVxvBz4PNxupkW3hGwfltiZMvWiBD
         Eu/S0S7LuOZksmZUtA/ky1VNECnEq66UQpjzKmgFz+hJuzQtZ6oBljZZryIyEL4L1u/E
         LKSlgwhTwLnv/oF+n6QaDE764hlhTIz4mAkpbgoGFyc3psH0xbb7skNcUtCdVXCqAHGO
         AJDGTdEGvn3boZq6ngTQ004jsSdWsxIrsRVi3Zh6l7OFw1NeXhbI+2RWuK1IEY547yKu
         3M3rN9z8s4OLzTuWVthMUimdQgHxuhX5/dBvzCZYIyaLNcUcZwgyAJfgbgFSW9f0i3l3
         bsWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oy537ZWjKxyQhEB86KvZocPds1AfNsAqi07sU3ki/9A=;
        fh=g8X2cBml90FcDT9jo02VmrmbFcA3KGOhzEG2D9yVRpY=;
        b=Jeo9T5rtPH80RHJtl1U7f1K8i7cz+O6Rp8wa1WFo7EZWvBCjdgLjfGQi7nsh1Sn8n2
         bLyswaclqlxYf8p+GLMSp+7sRke8HKxclZhi4ZiTexZnvnV8Ld9x+8ZC9K0kHHFoyx0M
         rriZQQxc82dYaj7R0vpYNb42U/KIjEQo7wALTiaGRriBiuBCCSgxeuAeIEA9p91HDdax
         hUBLevJnr83nhcLUoMuCrifeb3R1jn/Zan8WI0ODy4XkwM9/UoeydRU1MQ1Pfc04uxOH
         1zJpIfQwMKj7HU8qm8xKfCEek5oB0zPAgALsaX26TWzSDnLYq1bGkiDe4pdjDk6xDkN5
         E8Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631316; x=1794236116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oy537ZWjKxyQhEB86KvZocPds1AfNsAqi07sU3ki/9A=;
        b=EkH6xV6NsHfq39FbdgS1t61EBukHOxQCap0Z1EAZajhlT71dxHeeFeyLEeQ7PEzfMV
         CF/uUwKtRtHCxTE9AFXfvNnohJyQ5z9PdM4Vtpl1OZx8+0WO13TSGTILTjNlzb+BlgL1
         fI835XMMTV6Fk4LjRiS1ArM+Cl+a72bjYV4SC/7VxeRgHQZLb5sYXAhJ1NHDa032w2Jn
         zYtdsU0ApoLzCo+9vYBozYGdJ9x+qJMEts+thHSHj6k+ZXP3R4B1o24PMbJU+RjUp3mW
         kUJkTbDiUujJGxv1jLT1GZZITDRgGU/tudpQubYLGug0daogwFtnsg2ygY+oevNOwnqi
         1wzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631316; x=1794236116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oy537ZWjKxyQhEB86KvZocPds1AfNsAqi07sU3ki/9A=;
        b=nFpwI08orc7oKXMYkBrlLk9XcMdZcVry2gdaQT+mMb4KXWSXdR3XCuAKZzh/n4e+Zc
         jihJorooI80ayIUoilXOd+EYRpN7T5x62bw7jXedix6EKQRaOJoE9lqQ1PHz/WoVcZsT
         r1E2AbmgumSiXzONutvU78WOYbTkQpjWyr5jdW6aNe/2I51SMDzqVPNKrED20hdT7afk
         G4ixJFa8IPXSLnZkyfdrlMOHj1OMXgqpqZupRsAAwWSQMRixDplz6eNWB31jA3il3Dbt
         TWlgM1qDo3VoFuaVjzFYhlKGP1u0OOOlH+tKvr7z7k708JHq4Thtrbo2iWPO/OGdXWIo
         zaAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsN6QI8/tHrA9cCtr7a7w4qayXNbYwnhXkL37DcmuaYbDrG1ac9qTnq7E0barYN/jp+9+NqvL79KGJ7fc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXqceHsIQrpQgj0y/RdSDsBMTdebEZtJxx02Kd/4n0K0RjeOhk
	Of5mrWChIuI8A/tULbMA8beQGYfJiGNZj607YNNNLZTfIhg8tPdVqWRDExo2gLSuQS55R9o3Cgh
	tghEt003vl/znO3XP5rQ8qJXoYf16/9fN4PH+1Qg5PwwlwaIkMtJf/P682PimI3Sw9ztDRiNwDc
	U+AwHwCREsR6d5Uq0xOWgLBSq8Ne1tnZ4iCaAldFS2ow==
X-Gm-Gg: AYBFou2J4dmGamJ17e19a4IR0MN6+x/R0MfoWnOBRoB0kp+10TbPmHOTlPQBFiuRTfC
	WdFWf64d1MzQLkav1KK7HTnXFID+N9p32cwyMifjWqkPEuGT1w6huOVp0RlQfKVFgTB/tg0OrEn
	ZraUQxXLAV2CP84rZIwCm3ZFKULgtHW0ofOk+Wy/JpA3HkKUPmKPUykPKRsmg/NOKXMK+Lshvzh
	1BBwE9dU6ym5NRfbejHTs0+aFscV3uaDNYHKM/IjZO0uWwPw4GW/I3DOQ4xFbYlo62tzIo3VBo=
X-Received: by 2002:a05:620a:319e:b0:93e:c12c:f12f with SMTP id af79cd13be357-944217fe8ebmr1649071185a.74.1793631315747;
        Mon, 02 Nov 2026 06:55:15 -0800 (PST)
X-Received: by 2002:a05:620a:319e:b0:93e:c12c:f12f with SMTP id
 af79cd13be357-944217fe8ebmr1649066785a.74.1793631315185; Mon, 02 Nov 2026
 06:55:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-3-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-3-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:55:03 +0100
X-Gm-Features: AclHuK8uFpGqrSlwL_Gla-8nt7_yo10ghy7RgxQA3de9eH4udglYpVnEJ8mIXEI
Message-ID: <CAFEp6-0Gu_Exs9mQnDvBP0BSNcwdRak56PxFHJwfponbGoFxTA@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] media: qcom: camss: Use SOF sequence tracking for vb.sequence
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX5fPNvFW14JGI
 Aco6GAmjdvTNmWQ4O5kVjXpclTbJNunT+MRHnJ1R8EM3FECIBLijE/uCBIJ4EgZAxIxb02WbSxW
 upnAwgwf3HGa+DIKdFIVJHni3bzyS8SfSJyuZxwW0pa5qW4JIJa5MX8uwzXBl6PHNrK1ACIXcjG
 F3f0qfkVrjuHYlMdczwZSGVFfsx1yaw1sLzXD4h8ycz4iriQ5Yg84E4wzXF4XLjR19dhPucbcur
 ZVR5BFS/N32UD3kp8+gIn2zCvYmu8XJiSyTDv4La0OIYTTvM7i3PQnAersJSAVz/EryqyPBftEQ
 DkzV+emvKYAUOIywNmUxRcv32uF6s1vw8hPMQboTCT5uU0dg8lENzkriowrvE6+sByifD+GwPVJ
 IwdGLLYRNvWR5J9nHuHTkZFoHcpDXcgxNBM8bOxzKXO7sgWujO5VoOT+BDu0i38Zgcs1V6pnf2O
 Kg+lNs4Qfgc8cQpxm1A==
X-Proofpoint-GUID: vNvyODxgdJsjjViJg85aOrJN7R5hC9Kw
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8a454 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=uhjY8jlQ0jKR33dU9vQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX1k/hm86sdgIP
 B7KDeVlapcmiZgAcW/Qxl2oMJcPmDCnB+OdVaY6oyMv4eQP60rS+hTy/IguRFW/gTNkcewiQZDC
 E6uqLbT8ZX/Y97TBPJ668jYMyAKz+gI=
X-Proofpoint-ORIG-GUID: vNvyODxgdJsjjViJg85aOrJN7R5hC9Kw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
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

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

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
> index e9b399fcb9c7a..4f4ed4fa46aac 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1355,6 +1355,20 @@ static int csid_subscribe_event(struct v4l2_subdev=
 *sd, struct v4l2_fh *fh,
>         return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
>  }
>
> +atomic_t *csid_get_sof_seq(struct media_pad *pad)
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
> index 2e48b08b93592..f3199579e3442 100644
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
