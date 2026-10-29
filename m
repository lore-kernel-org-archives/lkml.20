Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793288646;
	b=e7DohNZ8r2NzKoE1jGczYY/6L7uN0acmxFp/D8ElorwZ/x42IaKC22CJMxoA0cVMI/XW
	 Jie8VA4FTkO4SYMW9W3gl8Riv3N87l1FnuYs/sB7nJAYZfQU9DHOqKgn3s1oI+k6q6b5I
	 mzh1F4cnSmv43Isa4mNwUH67oKtU0szI0Ah7U2Ze6CMI06yLrNtcm/qlVxA4kRX1MvrOm
	 5/EL6djJuO1Pz8KgWHCEdJIcdqLwwdwBFBmsuSIOzWdhO+a1CM+avxHn9zNc3NAIH8NZN
	 ihkWPKix/0RiRIJ+iTTvs2+tar2G9G6WdBhWbEOEH8WQjC1QIi0lWVpM+8j2jnH3y7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=;
	b=dxAuaDqybppuhWRIp66DdPQwVMzMUkTvDRMrHbDaBwgRE93mWRSZDkIP6aLRrU77IlEj
	 x8V2v0mAZjQCO2YxpfUvFtcg/6qMDU/u+tQ5Hz71Anob9SxmfLwpddoVDlHzlJB8Nz9zt
	 gY39O8S5eY2Jc3/z872FFmn7zaefw6z6+reCRoVMJVL+lDlJ7Sj47V5o0zOd47tVguBHQ
	 sCGltDJXiwI049i8V3JMyDyTD6/68V3lGoYqJbR5ycNdHkAw+oomZT3ShHucrF2phxlrr
	 /aLjHVSfUCdRK23ljo1xX/ol91xYjnY+PvNeA1rJvMuHI9wvn/t/uY+xnFQpgo/G7PA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L0sJSXE9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CKbGRPoD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E19606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E19606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L0sJSXE9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CKbGRPoD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe2DJ3768196
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=; b=L0sJSXE934S1b5Q7
	4WWQgqoR2Vqai6mvLXVRqTP2hf7Y5fgh0epPFI7WRP4hb0OR/tXwD9NZi7lxXxpa
	MAyKrq9Lk8ja5g8meTTEzPcJh2iOXvrfxn7QzTJ1Zrv5R8XXxLCMtSbRLMqFmeA+
	TvE1nr0KRq4kS7HXH4q/U9p0/e0a3hiFODZv/uejPlF/2E6ifrAQ6XGGjXrWeBVN
	c9QUvJwW/9vIuw+iw/tmzHz4k805gZwvxkGk2tJ35aIp5uN+jtFbq4A+rtRuUg0x
	I1ABIkmTGB4kGoy9tgmZMSSRFYsbawz/lvWbVJCH/krpJn5FZl/mR9beosYnuDpp
	iMoCXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3nbt1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:44:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f322ef7d3so460420685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793288644; cv=none;
        d=google.com; s=arc-20260327;
        b=SUFiEJ/KunRLXJaqm4UWHxvrj4tenBwQ2aSno7rPg+a8RjS9KoaZqlWRDIIqiZZRB1
         ebLhThJIi/WiW0oWSvw8jAWqQDJIdHKAk9c2hJvz66jm3QDOhhHxrkBo0LVBWS5UVkdJ
         cvyRZ6Mu3oMS9dK6nMI+Jd87LVQk0ls23/QLURrmoObz5W/RbXADL7K8YBsbGLnEvjry
         Ikc7Ej5XJpRrzIynnGoLn6F2Rg1qo/3aqjdv7tj0JOGNlbNQi1qnUFFBZaVB41lvzoTD
         o7kTxdplUHDoftOJcGjnk3jQuG+n+838qCOFH+0rxhM6qXdea1YYTT/ZKFNyR5KwCM85
         Ej+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=;
        fh=690+os5H1Q1bZXQ2StPZIvQuqt1p81jaeN9evQ3LwcU=;
        b=AtA6AijASyvGKt0q7ZXD2F5pKX/BBUx8UMBNQK2zVG9BLueINOB5T52U44jHErSctj
         eb87CJItvqtPhKgMAZnxMidFbcnDVrY09XuYNJtOjpMRybQ/w2GT40sb1XTiuho5yZWd
         66uUmhz2AocqJ9649ikIiTDL6vWYe0oIxw6z6q4iYmVdZmC1xQx3clxT51gp806h4i5h
         Tov9fdvrOELBhkv4HgqLlDxUgP4jmoC4xsCDCAwzxfWSWxRgpfMD+HRCZ2gbhQpTAbYU
         VbPnihO0GwzfBsoGsKHEzGA0D3pB2YuD9xmTF/97/RY3QzK6ZIeeWikwn4mBvBSPxvRt
         pkew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793288644; x=1793893444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=;
        b=CKbGRPoDHFs5KdTOKD9KY8k00fesNObZr8GlbxFSr2HWiKtJQwki38kesekBCNUPGR
         g6gCqTaKln0464b8Th3LyxRCd6iRT2an+EJrWedvRpL954aIXj3oYEIBAGodPHOr6i1H
         1XMkd4uYu+h56dxZKw1SWIAt9Yj/UizJ76NuZDw9MNjqKnyxHhjNNNsJ4ZBNViRiRwVD
         beoWsD93cOzApWsZgpljYJhBVwauR/EB9Ayrvmx9s2cdl+fEW9pmsDQYezB3mPuxiEBN
         z8d3yoaigtzyehR+j7a1DNwa8F9Pj6KHFMwwXI1M3a4I7sL20n4/DhAQWNwWB08eJgqb
         CyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288644; x=1793893444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+2r/9PfTubZjd4lLMkfZfAHyJrC3B//dU+UHnZewOk=;
        b=Eft/3/zcP+MlLTG5d9E3tu3Ne10hJh4bIUP3ethP8RkM2A5/ZEVunELkjGYfPJVYoO
         alyGSKKhve1AQ48/syXfmoeuqiUNzBC2x743FOD1OOr67RwGKtmvqdfAj12lD3X1ZSaU
         o47F349ve7lOIK3LlplaD3rPb3ya4bI450VVh2Ye4uqVx8lWiJzTof+EOxtATKpzJMhX
         9yKljEiop9OFeBN78Kjgo7J6bPtJVVx9N3odL2zp+x+ksQlFZbU9fT0Hcf1+de0H/slB
         jNtX5DIFiH6PD5DQzLtVLTUxCg4OYGQFLfetCLs6WY++0XekwHvxrt/QEmRK3e7S+aKG
         f/1g==
X-Forwarded-Encrypted: i=1; AKwUvBzp5HxxxXIvKtDznAPPxz4WLc58apGPUTwexJiNfRBMKr4R/O9OPeumRH+gs44CPn01nGtiaq4z9zrQRfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOTkU0MTV7/qqU53ZFfhQSpV0J2MnLNeQRZmnCfL083zot9RHw
	QYOOSjmzpZ6edPbLmNx+AHt61M2Lb+bLc7di8zLvUirFA/SjJLCB/7VJSLFJPT5wmiTYWke23dw
	2u83soOSivA4pJFCsCtZUI3lftGgeDSL8Nw3y71bJ38BX7qH1bA4vjlSc3ew4NWVZ/OBMXrPKqN
	NB+iXaRJ0pJ+apbcTrD8G7k3bhQQiAh/OoVEKTUPnK8Q==
X-Gm-Gg: AYBFou312/ge15tZrj9zjAUwTuFQpeD+/0CFby9FxySdCn2KTxvHWiAxuUuHbHHIvNX
	DAF9o2Bv6nGi9RttIELZWYHf6bNKRczfpErJQX/P8ro63Lz+JB/D9ttoHbitp6PnxWrMS4fAnNC
	Hc/p/5WfWbh/Hk6ElVXLfrDpvAis9HY7qi1GfvgWzssqH8oGcVA5NQc0t/9HSXC9tXJ1PDWIzZg
	F7TgXGsn9D+WXL3Hc5D0rvoRvNJTnmNBMIIXLStV1D5kU825tS+Ie/prFIt7i1J3bIzbScvqh1d
X-Received: by 2002:a05:620a:17a9:b0:93e:94f2:ada9 with SMTP id af79cd13be357-94408cf77dbmr902384485a.58.1793288643980;
        Thu, 29 Oct 2026 08:44:03 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:93e:94f2:ada9 with SMTP id
 af79cd13be357-94408cf77dbmr902378885a.58.1793288643316; Thu, 29 Oct 2026
 08:44:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org> <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:43:50 +0100
X-Gm-Features: AclHuK9NubgRSXuctoCBUtKUfM90zobYJmwFx0BidUU7P_UDH-kzWoIpGwxYW38
Message-ID: <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF driving
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: uLBhDLKqZ8bXQWFQY_oXnKVSLL1HN5Sf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfX1FIEh6eztFWD
 L0jUpf/4Qp9LdI7XJQ6nKSCS8PXVVodC00uF0UbVEFQ+y53VthPxVOcpau5qB9si8Y45XAMxIp+
 tGMUM5vydOX75P2hQOgTTuZA52MKMjnD2Y6wc4rHcvHYNTQwyK3qwIHqsuyu/YCcpZSAs3Wqfd+
 4T+SltrG3DGvSo3jgrtZ57PPc7/5Sd/ea80+uj0PgcMW0T8npVSeD0LxyOjpPMGVDgYP7S03Z3m
 PSpkkz2Kkiz+75kVtPetE0qDip3Okhs6Il3faNoFM4Qy/cHFhCG3qHiVDPE3bgX1JjVJFbqtfHV
 KmrXjbR2prcyZKtl+vRsKmydCDy/ElXQzNWo5M0vDQGNq1KGVrLByL586OPziobHUYPEz/MR0MX
 yq0TP6mU4DW0tEWhJMrcgknpyxnbNH8nWPmKitEz0bUneY5E1D8Y8f1I4iFKsRggX+VMxq0eDRg
 b+M0OzOrgRXoN3rlSuw==
X-Proofpoint-GUID: uLBhDLKqZ8bXQWFQY_oXnKVSLL1HN5Sf
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae369c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=1sShYwCD-S9XEYFb0O0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfX3neUO/c0gmx7
 kDxjJPpZiTA/oPYIP4XoXNWEtIl+Dh0JVD4cew+5V1GBlCDwxsCvxpWFd9QZRyztXfwJhmgt5oX
 oL8uzCef1Syj+uD6vuwbwglWRWvWk7E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290061

On Thu, Oct 29, 2026 at 10:55=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote=
:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Add in silicon enabling code to generate SOF and trigger the routine whic=
h
> produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 ++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index 0fdbf75fb27db..6a538d825f78b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -34,6 +34,7 @@
>  #define                CSID_RUP_AUP_RDI(rdi)           ((BIT(4) | BIT(20=
)) << (rdi))
>
>  #define CSID_TOP_IRQ_STATUS            0x7C
> +#define                TOP_IRQ_RDI(rdi)                BIT(8 + (rdi))
>  #define                 TOP_IRQ_STATUS_RESET_DONE      BIT(0)
>
>  #define CSID_TOP_IRQ_MASK              0x80
> @@ -58,6 +59,9 @@
>  #define CSID_CSI2_RDIN_IRQ_STATUS(rdi) (0xEC + 0x10 * (rdi))
>  #define                RUP_DONE_IRQ_STATUS             BIT(23)
>
> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)   (0xF0 + 0x10 * (rdi))
> +#define                INFO_INPUT_SOF_IRQ              BIT(12)
> +
>  #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)  (0xF4 + 0x10 * (rdi))
>  #define CSID_CSI2_RDIN_IRQ_SET(rdi)    (0xF8 + 0x10 * (rdi))
>
> @@ -219,6 +223,25 @@ static void __csid_configure_rdi_stream(struct csid_=
device *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable=
, u8 rdi)
> +{
> +       u32 val =3D 0;
> +
> +       if (enable)
> +               val =3D INFO_INPUT_SOF_IRQ;
> +
> +       writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +
> +       val =3D readl(csid->base + CSID_TOP_IRQ_MASK);
> +
> +       if (enable)
> +               val |=3D TOP_IRQ_RDI(rdi);
> +       else
> +               val &=3D ~TOP_IRQ_RDI(rdi);
> +
> +       writel(val, csid->base + CSID_TOP_IRQ_MASK);
> +}
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         u8 i;
> @@ -230,6 +253,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       __csid_configure_rdi_irq(csid, enable, i);

Is this something that should also be tied to frame_sync_en?

Also, just thinking out loud, are there cases where we'd want to
toggle this dynamically at runtime based on any V4L2 configuration or
pipeline path? For example, should it be enabled for the pixel path
but disabled for RDI?

I'm asking because one of the appreciated strengths of CAMSS is its
relatively low-latency and lightweight capture path. As we add more
features, it may be worth preserving that characteristic where
possible. Not saying this particular feature has a meaningful latency
or compute cost, but more as a general design consideration.

Regards,
Loic

>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
> @@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
>                         val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_STA=
TUS(i));
>                         writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR=
(i));
>
> +                       if (val & INFO_INPUT_SOF_IRQ)
> +                               csid_sof_event(csid, i);
> +
>                         if (val & RUP_DONE_IRQ_STATUS)
>                                 /* clear the reg update bit */
>                                 csid_subdev_reg_update(csid, i, true);
>
> --
> 2.56.0
>
