Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793559577;
	b=GDbDSqp45JNq2o7E4JYmFspDg787ZfbQtM1x8kQH5Egb8Upwm0BBeDzP9UieJ5nRFl+c
	 xH3Z1L3hGPAeF0EFTeQPLXeHZeNtaS3OEhDQ9fDA83GcDfIGy1MEV4m+HLwuZp4MejGjE
	 hj0f0TDT0fc4pcevj2gv28pD+EahCTLp8l+QtRcBgmfTj006K/eLakH8fEL/20M89lb3Q
	 D5mmmv1ijexTEZy8Nl48pMtRc91SWDhJGxl9lM3KmKUAYzzXHkwMbF6FXIjjT2+GBQ6R7
	 xD2W8gUMpH3UHRGDXdtMxiT5+3Ql1cC0MBmggm9AEXtK8+PbFZUO5BFBC9/cxA+CngQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8kTeAGzekm/MJUppeDHNBzSirJscu8UDoZqPjNsLkRE=;
	b=GVv1HJRcIpgNR+seGnvdYRTlFrHV8OfylK0JyrrRC3Ifu8BMPs75Ke8ukyC/CSBZ+xcd
	 pp+JX9jsIunu1rVHd53bMNi48uzbFZjmfzsdIaIl25eKrYW+khYNfp4x5Oya4bw0xp70Z
	 uaTYTW0O9Ho96qTzy9wsXo2wYyGgMMp4d5vnDzlOKxLkClwPmVW/wAX3PyPbyhumsGoCf
	 aaAqvaGDHva0G3PbTYfDTTnLvpE5bihjabc3PqhKs2HIvK7tjW1DIiPFFgFxU5Fi+r4bW
	 TnWhMqoU2sQ2tGsd6w12GILPqilxFAA8Lkirftnh55QqkawwsVfZ9ICl74VP32hWFSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SAmfCABj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SeKfTpZm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C343A606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C343A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SAmfCABj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SeKfTpZm
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQH0w2044125
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 18:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8kTeAGzekm/MJUppeDHNBzSirJscu8UDoZqPjNsLkRE=; b=SAmfCABjNQFoKphV
	DZwIecNBfi8PYDTr3vAhvoLFxDFDTtK47A4iihTcrhvOU6RUlIb75niU40uP4kKL
	SewEiMx8hh738FzyxDQwMVK9APwWL+sF9oIzi7Ahnq5qZy7Da4roq7XvouEn/Ai2
	EWxVEfOoeWZP8uWUIrNvMGtcjSVS6P4tuwO4wMSLY5bnS8rhg7E6Ylgx98IK1nvm
	zK639rkoUhB3I2K1F4r+PDX18499zzInxgGH+/RQxNzvIrF6TvwaKF+Mw958ltcp
	SXYwROjk2AFhTvuj3kQcM/Z55LwVA8e/80B6HFJMdSWa2M76OgnQuTU+8QUdIUXO
	Dnt4lQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxm133-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:59:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so470349785a.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:59:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793559575; cv=none;
        d=google.com; s=arc-20260327;
        b=MAmpmbyo8sJIFRhfHocERxEnS2oUHz3f2pjpNDxwHuY1NnLRisqU6tXy4X0+KPia+1
         iZ+XBHI1jJH0yOjFvieBf0q/Ih+EEkJaIWSK+ilUd79HrmXEu6Js52VXtq6dZgTSQ7Uf
         0xcpslpQFKvRWGE/v82TPkp5sroiJjRJXdEQoCyZFTMDijMuPYX3Ko1xwO/HxZTYPWfs
         HbaCGsAnw7HDVc32hfUV/SjuB/AhO2QcCaOBTDuaLWlw8ryEEg57T2SG70MTnTT5ezbU
         dJ4CMyv//dDCEVbTBPZvpcuaYjo8rrzxeVOcV/oNXJYmnfDGT+9FRpexJn23nIDVs/55
         xioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8kTeAGzekm/MJUppeDHNBzSirJscu8UDoZqPjNsLkRE=;
        fh=H03BnDrT/pFReXhcRulsMDeyLSEsD4DnCwdKnOWtJN0=;
        b=MGqgfUhSYAD234sPRspUrQsT7B4GDxfyg103xcAOhvlgiy46Dx65v1A1dH5H6SgZp4
         9BZ0jrSjdJRqMptxJ2rR6RMsPcnp5xSu4SG4/e71RTBNpRigftv2UrOhviTFLkFNnuyK
         YrQ4h2VJmLyuYv84LXWna3NTSw6FiJnlLy1h1vaROEN/ecah2LlBw5MDjYxeyL8XQs5i
         EF1s8YGKQ46At1XsZVT8g4zJiMjT4wwVX85wHvoml7zmkk5g3fx9u6h9JPFMSjZHdvah
         8pzajLQb7kRzIlbgsLcJHlSKbR84s8AYYiY9z1QntwAiZ/1LV57qQy17iEVxVeuqveQ+
         iEUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793559575; x=1794164375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8kTeAGzekm/MJUppeDHNBzSirJscu8UDoZqPjNsLkRE=;
        b=SeKfTpZmnD1EUY9d45HnJXozHdeS3MHwgJVNqo0+mfMtphR9H3dS5xC7G2yToLfrkk
         q6S49GXAvxmifL8AwYe5OM0yrnqErhZ5azVeVK3oMiUk2Vcoy5/HqpysLxbgGa4+Zb/r
         T4Fh52To1zPG0koVdcoIn9CUmSdut5wg9f6DTGio2g1SnUWvsYZSi/nC4F5or1IIXp8b
         GTh4Wqd4ZlakqqvuuagHqBqp7nHQux0g9i84Wc88cpwFYRqX4mW4ET0jzbotN/EYDJ5w
         YYsOOoqhVhU55myn30IRmnAZBZx6SoiRIw/eb80lNNk+1Cup3D6YPYOtKhFQGYZbndcH
         e+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559575; x=1794164375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8kTeAGzekm/MJUppeDHNBzSirJscu8UDoZqPjNsLkRE=;
        b=eTTXwc6C6/PxUXDLyCWqo63PXjndM8UDwMfPgnjkwf0xWeoYhKB6BT7EPqfj7ibjDR
         P7zDZ1PD0EfQerPMOcbg0kzxWb439PAPQGH4xow9u00jBqG64jLcbfdlOkLvBScD0Wf7
         6oPwKhq6LwOm+tTjFrke/PGK3Pe9quDZrbOycH5lw8t2iOt5Oux7kUCSEHTTBTAVrbjX
         FmgVLMkCwzhfBkVlHii2hxki/j/1sk4+ZIH2vO9Y8vwYuBbZUrABiVA3Ql6C9seUxAYg
         XbuGq5CsG0rL+zFMpGdo5m5Lz5K+DjQla/wVpapjizlpel8UxRlXF8mFETUt5jwzy1z6
         coCA==
X-Forwarded-Encrypted: i=1; AKwUvBzAG8YbM8z0ffn+M0xb056yzoAJfrVqPjnwPuYy0pvDFPYYf1fv+xMmsUa3w9p4X4+AG3WKjzH6SnJJYSg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7Eg+mZE19Aj5g7dJsjY5PZl3wqvEYW+h9bijZ55YRj67AqENp
	/+ztyafuOcR7etVE3+mmPqAG2NM/0qXtvj46I8oEt6lsFwjvxMZeMNV4T+V5TAKlg8WMlPpQhsT
	sqpndhx0u2jeV1efu8SouFGFCkPcDX2RZ8iDClYzJ0YTik6yVuKu57oM8RmlZD7CTEDweGheg4Q
	f3fz7ZbRM0OrCAEv8sro3bDYy6R8OuVOLqTiASuxi2fg==
X-Gm-Gg: AYBFou26Y4S4duDiw9AkP3nUoVkZpUAVmxlQtgQVmhzMi5KIDzRJb2beDwd9SPzAsB4
	Ra7NjXhPGbd5dN18r3SK4qvQAjmK0dqrCqq5QykfLI7gcPN4GmdqTLdUUKNxpO2WSN+w1faODQ5
	C2z0vqBM+pVgvCBySxM+rBUiGZI1yF1K7l4DM/NZRynJw9qLCOmNZoPbl/4iLSWe5XhWFGqe5pq
	ge7fEFRUCAZPMHPpms2rphsxEyMLL/OVS4cj3SzXOrkmtAJwdPziDQNdDFn2BM3fT0SCBLm7zKv
	Vmxj0waHx2VI5rum8rx9AZY5NmBr
X-Received: by 2002:a05:620a:808d:b0:93e:e531:b78d with SMTP id af79cd13be357-944214cb80amr1355910985a.7.1793559574832;
        Sun, 01 Nov 2026 10:59:34 -0800 (PST)
X-Received: by 2002:a05:620a:808d:b0:93e:e531:b78d with SMTP id
 af79cd13be357-944214cb80amr1355909085a.7.1793559574364; Sun, 01 Nov 2026
 10:59:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101030902.1387122-1-shengchao.guo@oss.qualcomm.com> <20261101173256.5ad42925@jic23-hlaptop>
In-Reply-To: <20261101173256.5ad42925@jic23-hlaptop>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 1 Nov 2026 19:59:23 +0100
X-Gm-Features: AclHuK_y-XxcZzWJ7IkifUD6NDu71IxST9CH5U17suAkwJv0PiDsP7l0eUD4YmM
Message-ID: <CAFEp6-27XLrb56XpnnSLxkRXzQzugvXPzsDt_OshR5EmhC8Kzw@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: qcom-spmi-adc5-gen3: Reuse IIO device ID for
 ADC_TM aux device
To: Jonathan Cameron <jic23@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: RE-Z1KSckVOli4BkA9Vk5weq3mACNEMR
X-Proofpoint-ORIG-GUID: RE-Z1KSckVOli4BkA9Vk5weq3mACNEMR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX6kLbGnoo3xGi
 geOyljKiRpRcFj+LxYDCLy9TasuYtdmrAulMT7setHF91DliSHzz5jqFgTeaKNkkwgO4qQJoOak
 gBrOB6erKTftNm7LbIqfnGSgDP3iSr8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX7BQPr06yHUSf
 nNE0/ejhreQcNf81Y4y7ul0MZi6xPoAh+mBj9P/Iqz1SkNUpDgLymYIlUqXsyL7ZswGhknUl2cO
 9tYg0oimBkKQRzcSqUEXj2qljWvAgDFfJcbYmwGHTHsRJ0dKzquA2ZtW6JRuQAuTxhjKfZwaQMm
 z7Aa5w1HSlkbMfF4gTkii9EFP2G+o5/zkGPuuHI80ijjiNdIPFupg5A2Z4+ucgG1I35f827Au5f
 V0IX8Z4gvkau66MqO+RqNAAQIbA0LejzE+BsDEH9cvUeOwxiybwrm1Og08O/zOk5r5mdgL9T9Y0
 KOY1Hcc7k0fEnR0AC4Ev1ipHUKVMpRYCuVrdUf+uHj0/uD0p9yBXwDNKWyViQ5R2fPPKY2upeFM
 +1BRFFth7jrKqiO40oi3O20dWOX56cpdvjjAjHKUBURNCOFwTkhb/HbZxYnMN4dfq9gGw5j0rr+
 tCxZcxCrOTtjXm+evdw==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae78c17 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hw_--xrD18hxE5MXGX4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010075

Hi Jonathan,

On Sun, Nov 1, 2026 at 6:33=E2=80=AFPM Jonathan Cameron <jic23@kernel.org> =
wrote:
>
> On Sun,  1 Nov 2026 11:09:02 +0800
> Shawn Guo <shengchao.guo@oss.qualcomm.com> wrote:
>
> > From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >
> > adc5_gen3_add_aux_tm_device() never sets the auxiliary device id, so
> > every ADC5 Gen3 instance with at least one qcom,adc-tm channel tries
> > to register the same device name. With ADC_TM channels on more than
> > one PMIC, the second instance to probe fails:
> >
> >   sysfs: cannot create duplicate filename '/bus/auxiliary/devices/qcom_=
spmi_adc5_gen3.adc5_tm_gen3.0'
> >   ...
> >   auxiliary qcom_spmi_adc5_gen3.adc5_tm_gen3.0: adding auxiliary device=
 failed!: -17
> >   qcom-spmi-adc5-gen3 c400000.spmi:pmic@8:adc@7200: error -EEXIST: Fail=
ed to add auxiliary TM device
> >
> > The ADC probe then fails as a whole, so that PMIC loses both its IIO
> > channels and its thermal zones. This shows up on Nord, which has
> > thermistor channels on two PMAU0102 PMICs.
> >
> > Each ADC instance already has a unique IIO device ID. Use it as the
> > auxiliary device id instead of allocating one from a separate driver-wi=
de
> > IDA, which removes the custom ID allocation and release handling. The
> > ADC_TM driver matches on the device name only, so the instance number
> > does not affect binding.
> >
> > Fixes: baff45179e90 ("iio: adc: Add support for QCOM PMIC5 Gen3 ADC")
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>
> Applied.  Given the slightly odd nature of this series, Loic can you conf=
irm
> you are fine with having the authorship + Sign off.   Given alternative
> would have been Shawn having that and Shawn sent this, the attribution
> seems fine to me - but best to check!

Yes I'm fine with this, thanks for the squash Shawn!

Regards,
Loic

>
> Thanks,
>
> Jonathan
>
> > ---
> > This is the squashed version as requsted by Jonathan at:
> > https://lore.kernel.org/all/20261101020047.66034613@jic23-hlaptop/
> >
> >  drivers/iio/adc/qcom-spmi-adc5-gen3.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qc=
om-spmi-adc5-gen3.c
> > index c68c6c5f6aca..a23eb5c9096d 100644
> > --- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> > +++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> > @@ -610,7 +610,7 @@ static void adc5_gen3_delete_aux(void *data)
> >
> >  static void adc5_gen3_aux_device_release(struct device *dev) {}
> >
> > -static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
> > +static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc, int id)
> >  {
> >       struct tm5_aux_dev_wrapper *aux_device;
> >       int i, ret, i_tm =3D 0;
> > @@ -620,6 +620,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_=
chip *adc)
> >               return -ENOMEM;
> >
> >       aux_device->aux_dev.name =3D "adc5_tm_gen3";
> > +     aux_device->aux_dev.id =3D id;
> >       aux_device->aux_dev.dev.parent =3D adc->dev;
> >       aux_device->aux_dev.dev.release =3D adc5_gen3_aux_device_release;
> >
> > @@ -799,7 +800,7 @@ static int adc5_gen3_probe(struct platform_device *=
pdev)
> >               return ret;
> >
> >       if (adc->n_tm_channels > 0) {
> > -             ret =3D adc5_gen3_add_aux_tm_device(adc);
> > +             ret =3D adc5_gen3_add_aux_tm_device(adc, iio_device_id(in=
dio_dev));
> >               if (ret)
> >                       dev_err_probe(dev, ret,
> >                                     "Failed to add auxiliary TM device\=
n");
>
