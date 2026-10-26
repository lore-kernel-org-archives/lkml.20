Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793018682;
	b=dDsUXV9X1p/e3yhEptu4vVbMhUh8InqmmyXvJMMR8TaqZ24G75cO6vjonS1nGvM5j9aO
	 2Idd64xxyC3RlGNt6U62lm9kcqJLp3lKxuNaqcs209Hku6ArdLJXPHHTLBQDvHk9bTas/
	 uE9ciqZkRRYIjEyqGHUfw7atRRUG8YbzIkSTDyf8iuFRL9XSDwxlyXtPxKtDz4mykkoot
	 BFC8o4GbNulIpN7Ftrj0bKmgNrUchFJEtFbjjOP9P+PUMDndNhtVD3ayHBa0MMaqPKos5
	 IDAlJ0811zHTNifD+uyzzorgqBGF48SjfiOF30JiJx4o4IVjCplI+aiDgga3StodUrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
	b=05FNaEmVHK3zjc9n2s2HJ7V1fORjIvV3lVNUqeG7oWJiOKFL7L267XYrgN5PzyX/+guJ
	 MrDFoFqtbzwGCNqJgV+6cBG/dXXwfxoAE50hvhb3JFvWSZY31rjgTrE6SGbajkZ672G4J
	 xyJ1iWWCq8D1tMzHI8jk7DjKAo+qnefperffEb2MGjgzZpOAHFx2G8XaXu+u5vYb36HJn
	 DDDMC229za91uc5F0SwaxqztXa3N3CJ4veR/ON35cn00r4eRXHBaUeNmYjO51jeWVWtW/
	 nIoBeR1AIe6oP45P+VsbtcBFFvIfIztqaq//4rXEwwZzRGGuCjLVTAYis58uIZCqYcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E6qRV9x/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP85lmLh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40222606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40222606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E6qRV9x/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP85lmLh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtYmv1547975
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=; b=E6qRV9x/eE2Fi0yy
	1OvFNuN0nUHooQFKkiHdYWd1HhCrRBTAdNZlnrcnnzwFMSO0mnuQpIC/FLlbBcgS
	ZiQ8JcY9IXyFjEqNFO7uiP8e4/q+561D8FWB2C6xSPifbDVrhTfe1uk4zm5v+9Ea
	Q17yIQMoSgcfpPjEJlzL5Xr8JMkoz/0rir0KE6NdAuVXdFuvcAiuy07D6UpsFxqE
	AYjneMm382JNDfQuIkRx8vJNB355Tu8EkmBe/Oc1WzR39DGb5yRL+BuED416RUek
	/ouIuEOLFWiwHXLS0Ko1gOyp34m2aItPD5JU35mlVIu4SZBNAZGVo401vknqCtm/
	a/xagQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgstfdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:44:41 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso743796e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793018680; cv=none;
        d=google.com; s=arc-20260327;
        b=KvmbyLMwfC5hAtcv9z/LWprlHts+0twzz8kZMcXcnUug2j7IKEdRyPblk1/v0HURM1
         zIXkbFsCyeI3ccy3lpvPM2S/7EwzyKHNoYnEZS0Kj1C6GiE/xNWowfJ+ESvzmBNdcTI3
         OxkKFrs7d2PRqchQ1jiJhKi5FMUjTzDE4JYefn+ltExP47s3AuRgbLBAEm40OI8B36Hw
         7QZK3oixnvZp143bqZOr2Av4+RtNaKLKuISxTxhRF9f+RJ/lP54Qn/+jglx7wuu8C4kx
         fGLJB7VGt6KkY7LoY7svYLscIPg+gX9d4S1BXaQG7P3ofZp91UvjOnVPaG/BhI3q9qHW
         aXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
        fh=b3ESpeI2UD/0mvM8DLNY7hGbOOZADkauBEHyb63waOM=;
        b=srNwYpLXsuXC8JoCyOFJlDhBEyJvSg8h0DiU3s3YfnuRHzOb6Ec77dqojGUlo7VeQ8
         N+PW/mL4WLdfgfBRjX0XRBorQw8X9/xYgH6V7AI4X4mkr61Gg6lMASyFLeMckMtJt9Jq
         BjSMVOUdsppJN8lG6J2qN/h3y1QyaZizv7yJltjLXorFATo9Ru0NNxQSCgkT4j7Zh3Tm
         Ne6rAlj/YLk3YNNn7w35wxSxeJ4Zev2o9ABWEyw/D87C/z0togBRf/crJ7Qj4tazmSIh
         ELm9jKjAogdVg9RkF2S5WqDhBUV8DyE06b/+Llgqjqjd+1pejRPo3csD6I89VdqpqlR4
         FIGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018680; x=1793623480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
        b=NP85lmLhzodp3skdsw4qqH7atrNatpbJ94hZ2Wgw4OWFykzsv5hfHpuyabNNt0U6Ln
         H1w5xbZyxr9oq10Okv68X32AIRDnWYETW1b9JudVoSMjKWZgiZqM844RdlPo3fZJ/IL4
         jOm8kLcqaQU5wAWEjZNWhfnuUhm2qM7htVtbaX5E9VnagQqwZzkgvSIvT0M46kI1+PM4
         vbwZQm0WNmw5Y2oHbfOTKKj+MXNxiCSbxumNyal5gnqM8AjA7p5uFe5Vl2jWwIqZYnZW
         68X/xLabakWLP/Ocs4ZX7t3TgSguREeeQWo1CUvu9o7qOGDtg0ibndYa0B7NwSi+Av8a
         Kb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018680; x=1793623480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
        b=kwmpGF9uD6264BbRSUXI4lOSWGIe6/JeekMv9oRBk+e5zthg3e+CcX5YM1NTqCPr+t
         sTH0857esrTnJaK8QSpmvtldn7gO2HbrZtlfsDkwObb/KvNcARiComm3B54/TptkR5ni
         Fo7OMRzNcAHguPksWuEIQg0dA2Ndxyvit9KUhEJBUQvH7owoC+cut1do0YPcvgNsja1y
         E2NrPahvQHWp8OFZfwFlfYEy4S3N1sLq5/rk9HS027PHEdQyhNyDyNhwhyY7/hllHu2h
         ddNDtWwAAujDx28eAidJmpGJFsWNe/pQ5c8wwtISnIVzdgicLMkvstfzHTs0Q1Edai/g
         6Olw==
X-Forwarded-Encrypted: i=1; AKwUvBxwBmrwb7PhRbGmKvCDkEXjt9NPEMcO+iLc6IP+cDnXTia3Ks8rU8KpE/cMFMxer+V4pf5Vc9Z1gtILdWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQfzog0BTF2Z5Us2Iknhd82UX3Ysj5DkkRv1W7HB5PFUy2eU1E
	MBLhLA9Q4bkqUERdf8h1aF8LRnffKfms1EO/N2+eQQ9OS69oz12IPW1GiA32piVXsM0ZvfpJ6IY
	7mf/Sc+iUaBNLiiifSzjbzfdGr/X0O8szuyEaIa/atoG+7mNDA98KDeTsQF+6wMVNV0/oI3wRnb
	Dk/M1FZ7ZwKy9UWrJNtd5bgaTpWY20c8EvrW/AK5rZ3Q==
X-Gm-Gg: AYBFou1PMUBXfltU2ysaMLTAe3h0So8D6gMY6SORGjKKpn2EWYV4wXRKO12pyfjN8/S
	hkRYgu0NjoE3QLxans/UVyEsSKWbBAqYeLNp3mhtdmMaL3c+s1u33nrblc3aoQJBkrGWz8mDMu4
	2zKplFXGE2z6Rn7Nx/HOkbwCIjGPdSOwbbWCB30xTMh3vjIUtK01Qu+p74BrRZvrSfl9lJotGos
	3MFY6hJeDvWhVKepg==
X-Received: by 2002:a05:6122:78c:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ec232ff8abmr2049990e0c.20.1793018680315;
        Mon, 26 Oct 2026 05:44:40 -0700 (PDT)
X-Received: by 2002:a05:6122:78c:b0:5ea:9218:eac1 with SMTP id
 71dfb90a1353d-5ec232ff8abmr2049976e0c.20.1793018679853; Mon, 26 Oct 2026
 05:44:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-8-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-3kJA+yct3GbWzs+NG=xFv_OGZj6OgToOnfcPkb9H=BuA@mail.gmail.com>
In-Reply-To: <CAFEp6-3kJA+yct3GbWzs+NG=xFv_OGZj6OgToOnfcPkb9H=BuA@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 20:44:28 +0800
X-Gm-Features: AclHuK_vZzSvUBbKv5qcRkDMeSvQ89XyxhHhnpT2JBNskNEMoXl_hPb8JdddQ0U
Message-ID: <CACbMrhoE2fcqGL-CSYPzacftuT=x+pVWAkkVvBXnkHuN+HzcBA@mail.gmail.com>
Subject: Re: [PATCH v22 08/14] media: qcom: camss: csid: Add support for CSID 1080
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX/MF02XUQ9HAt
 ocGKlwvtbnOU4oaheyyg8ImAN9ZG2hp8cvQRiGQIro6Q1JmeUvtIVfHyYmo6w4Hpn6cW+lXKO0C
 rnsm3K0UKO7E4Brr1PrUIqvOuz3PNLI=
X-Proofpoint-GUID: ZzrYDpxUPsBniDuclkRpmjx7uFIMqE_t
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf4b39 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yJPWxEu-MHjwpVTia4UA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: ZzrYDpxUPsBniDuclkRpmjx7uFIMqE_t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX6F+jZ8h2A7/K
 RfG9EPDgsQEuT+HE0GWnDzwy2vcYrDoog0J2pUhmbpoH0tnOGYp3Dkkmjf/nP7/sZtQP0ko33AI
 nmV4UGEbC5hOkvZ4q0MRJGlpZ4Bh6IFqAwj66hfxdrQdz42CX+T8vnfVsujsUOgkR6KAy0D038O
 NPDq70qmNP4fbUTyADcX0v89mq4Oz6tkEqTUCv6RXokUmK4TIb3zy/PUVbcCmc70Gpcb8cAOxmb
 pZvxGkAeJ1zVBXTYz6qLTAcFuAJbZGR2I7PBGagJsEUio3SazgJ1Qdv6aZ9JPOBrVV3XgPUh7Az
 gxiRvwVhg5x69qIftarOuPcBRFs8/d41EEb0h/3PnpemPl0ooOxRJwn0KbrQI2lrRfbFNEBhqPj
 C5KvpkhWFCDOWhR5kQhnZAPxQbm6sWQ+h4AhXvh3iyTsvWQ2n91RyOSvQ75daL50R8+vTcz/c9V
 KEQ2WSG3q/M1H0PQNNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260050

On 10/26/2026 6:49 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add support for the CSID 1080 hardware found on the Kaanapali SoC.
>>
[...]>> +static void csid_configure_stream(struct csid_device *csid, u8
enable)
>> +{
>> +       u8 i, k;
>> +
>> +       __csid_configure_rx(csid, &csid->phy);
>> +
>> +       for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
>> +               if (csid->phy.en_vc & BIT(i)) {
>> +                       __csid_configure_rdi_stream(csid, enable, i, 0);
>> +                       __csid_configure_rx_vc(csid, 0);
>> +
>> +                       for (k =3D 0; k < CAMSS_INIT_BUF_COUNT; k++)
>> +                               __csid_addr_update(csid, i);
>
> Do we really need to trigger the same AUP several times (one per
> buffer in the FIFO)? could we have a small comment on why?
> Isn't this already done from the vfe_enable_output helper?
>
Yes, this is required. In v2 we hit an AUP-related issue where one
buffer was missed and capture got stuck on the last frame of the stream.
Vijay explained the details in this thread:

<https://lore.kernel.org/all/662a21a3-de8b-406f-a15d-b8a572aa79ab@oss.qualc=
omm.com/>

In short, since the split design was introduced on the 980 platform, the
CSID has to be configured after the VFE. Otherwise, rup_done or buf_done
IRQs can be missed. Also, each buffer queued in the FIFO needs its own
AUP. If only one AUP is triggered, the last buffer is never processed,
and the pipeline stalls waiting for a buf_done that never arrives.

That is the underlying story of the 04/14 patch and explains why it is
introduced to handle the platform hardware differences. Thanks.

<https://lore.kernel.org/all/20261024-kaanapali-camss-v22-4-7da3ea49c8a1@os=
s.qualcomm.com/>

[...]
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/me=
dia/platform/qcom/camss/camss-csid.h
>> index 2f7e593defed..603621c16315 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -162,7 +162,13 @@ struct csid_device {
>>          void __iomem *base;
>>          u32 irq;
>>          char irq_name[30];
>> -       u32 reg_update;
>> +       union {
>> +               u32 reg_update;
>> +               struct {
>> +                       u32 rup_update;
>> +                       u32 aup_update;
>
> I would say keep it simple and just add addr_update field after reg_updat=
e.
>
>
Ack. Thanks.

---
Best Regards,
Hangxiang
