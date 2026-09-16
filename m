Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD203C279B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561126; cv=pass; b=oXo1NJR3XjPMWa9dPYAVoG/gVD2l4FmeG0+Mhj8FW7K0Bj1WOH3UDdfBxqB9sVTor6i3Eq+aWwmJK8ven6lujwvQv/P1QAgvuhGyGSu3BNI3EeLOwWBk6W1jWygRFp9tN6IEOvbGz2oCBog7pdAZTcYVy+lxUJXe/7g/fhPa9n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561126; c=relaxed/simple;
	bh=cFuJnI/gnjp4xLrzIqNiRkV0rShV5E0vA0XrCKp3Nm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFexxBHrigweBD0sO+3kYtSnXK/5j7qwDkDxLHVfpa+PBvvlFKBUPJAwLsjuxHcKPrzebNG+mdV+npwj5QApPMr9uZ1tnRLqiTAzQY093/dtV+ojmaibUx8UCfjLQqI6453/PTd7xf19KQKuulxslW40WXDJDfauH3SbaagQskM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9V8GFXW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rzwis56F; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9V8GFXW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rzwis56F"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93Aqr2658312
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=SZBupEoFPUauIn4/x4mdIDMsjjahDV5vgXK9nZDkKoc=; b=k9
	V8GFXWHIdnHp6Y4RnNpVLDr67AHxIWYMsbp2wmPOzH94cRlXMQtwXV7xIZ+9BXR0
	0nR/078w0RDY5npb796BNWhMuXLAAqG6YK8dtpYEurKNfXq7Fa/7aD8tX3wFdkE0
	6OHdaRuZIiumN1U6y20TE8eyAsSsgbwWzLMle0j74mNUcOwU9w13bLZnbHclBNtu
	moDljfiHU5n5r9RW2PtAkTPiqmbehLJGMTTfkBwrO4AQzmgh35DJCUDpox7iqzDr
	mGAcBB8eoI1ibcz/V3z+ZnEVL93hmW3Yer9TFDNbRPMORE3IkU6KVJOQnmPVv+Jg
	lOWWtHO7wLNgrboDzF0g==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujrku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:18:44 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8848dc67d24so63341757b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789561124; cv=none;
        d=google.com; s=arc-20260327;
        b=Zj1L3tg3/UI5YpHF7c3lRDWgZXDog+T8YQLkf0TXrpomqab6uB9p1vRGG4PNFnxRtm
         0aiJGV5sD6CtqaXwJEh41/uhDg9gdxR53VXk+QsraaBtovevo+f/9gK57sUAGBIeYTbe
         2cG5eYzqKplmrdBITU8svunIpw6VUf/iYf8lmZBYQ+nv3WzuaIN0sw+XC95SCAjUpNf2
         sD+5qAlR8g51ogwPZNVhUYt7S3SVrq8WYsH2lZ7a12yVkRXLb1KbQ6StqwQ/nTmUnj5X
         V1nnJkrMlGhXZxdV4Ulq0wjiafNxoENl52yPnN1Sa+KuqKV2BdtUuag7y9GOwDaZLQ+t
         w9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=SZBupEoFPUauIn4/x4mdIDMsjjahDV5vgXK9nZDkKoc=;
        fh=EMMZjkhyx+UGcQVzb8JnduSCxH4HeUO2xmjhMxaL2lY=;
        b=aummnZdANchMWmY2mMI4y+y6VOcT6/vPLCgaHR+v8JNmYTb1R4wBXO2wQbThITu5u1
         2qvOckLHGhjrDenek8RB8NhwizFdgLoKOxAfyeqXUXXvS9y0hIwKpMZoP2vD0aROxLDL
         c6i5ZhLyWQO2ZYFNJ6iuYHvy2/Q8HWSB68xTzlkOLpOcIv1ubQjazRhuAVuSD3PSRcAN
         SyPVqojBJd8OR4Xd3HYKCknFC5RZ3tFqjV5/6jusm+t0H5tI87JtuhDeuaGf7sdU/2c0
         1xfiYVz6V9SuA5wRHFNZNEEMD9yusqgPo5fuqhHjeBIleQ/FVa1z5yVlrnOdC1KW2HqH
         alVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789561124; x=1790165924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SZBupEoFPUauIn4/x4mdIDMsjjahDV5vgXK9nZDkKoc=;
        b=Rzwis56FgaH8sujtwXImMu/XGDRDKeezaqOXX4/gVotf/qrkyG4CIbW2IM9Kry41r6
         6wUAlNTVMUqlmGopM9lUQWEEEH1FxKkIG+8KR+LsKvMSOObSC7YXPjAaEUdVDQrNktOd
         gXKUOE41/eJ0Gky14BIgtCO6Hl3TQGcnmhssPJ8/MKCs4FE307bGqFmUIlkiw7LUJ6Tr
         frcxBfFLytAv98EbiTO9xyFx3nky7jwPIJRBlZRCA0oQjei1vc3E8i28MPqp0askr0EU
         7nieIxT8E5bhcUn+DXSSl35qBmaTpGOnzc8N+3Qhuaop4ioJnaF99VXiUiRwTtmHrbRf
         /FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561124; x=1790165924;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZBupEoFPUauIn4/x4mdIDMsjjahDV5vgXK9nZDkKoc=;
        b=K2iYdcxxQwsvCM9tciCwU+lQSjyoerS/EYL3R+B8fE76Ck2R+YkoH3oWH0XHs4twWV
         e7QPs1F8oG5KSqRvRsCG0VpfccXIDE9JgMsv7Y81qRSgqqR0l7qWmgQiuFkKS3HXpax7
         oBKQ9Gu0CIvJDdAHqlFCK/vaLFZKRR3xx9A9zUYixrzvBM3kxvRqtEnQfJ4sKCGENwjI
         dOEujPabbBeVFY4LxEBHFvlCh/AjaShm4mwlJnMLJPNrouqo3x/0pbciTH2Gu3EIBRpk
         U5ZwShKKWkDV/ritW5zEtNVXMSfc+/oIPJMiEeRRU+bETWXlZxBU9p8ukY9BHgslpBMM
         J2xg==
X-Forwarded-Encrypted: i=1; AKwUvBysNeKoXGBKUkX3x7DAQBaGMHGJZwh0sdh15hzS5pe3o047+jIuFyXxMJfmMa0S5o0Tx8LeT+KsIc+jph0=@vger.kernel.org
X-Gm-Message-State: AFuF++mVdN6w41R2aFj0+Dw/+yCtVb/nVSI88d5so31jSKCNaFsKDaMa
	TssJpB4r93JR8e5Ndma9l9/KNUI2C4jLSVbm0wTiZx4XIUXtPR0MedeE4g8dgKaGaN/Auzl0BCB
	WmGcbh6/KZSh/7GR9Fh4flhFIMEh39K9ojthA6i0rZX1N5ZUZS/Mdz26qudEUUWkJSWuT4Vj/J/
	xJVRKMEcrt51Nh9JsUvYdNslCe789zlvSdXVVF38P3cw==
X-Gm-Gg: AYBFou02zIQDjQH0B4plEL4UM+kY8CXfHJeb/ibX85S471pfTMPKWcoxLPXcrOD4R30
	ZaM88B7076mFwEOM4SegHGyv2BUkrPdNuzcnBxSoi3mNHYbb15bk/GZxoz9ZlBqtkuMoDKgK6PQ
	5bKfGP/Q2YjhuS4IJDoZZkHb7StTbdG2H7CzKbkaziEZWgjoRfZ/eKalTOQsQ=
X-Received: by 2002:a05:690c:34c9:b0:873:5bb2:6c12 with SMTP id 00721157ae682-892265e7601mr6043607b3.60.1789561123674;
        Wed, 16 Sep 2026 05:18:43 -0700 (PDT)
X-Received: by 2002:a05:690c:34c9:b0:873:5bb2:6c12 with SMTP id
 00721157ae682-892265e7601mr6043477b3.60.1789561123293; Wed, 16 Sep 2026
 05:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916112545.887461-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20260916112545.887461-1-xiangwencheng@lanxincomputing.com>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:48:31 +0530
X-Gm-Features: AcwNN1W_xPwCRH9HhXLAxBaZmSSff5vjkIMgObB2TpK3jfnwJHHIzxaUu74RxEQ
Message-ID: <CAB19ukHfFXmuPEaWdNPvFRkvMGpDQfVEpCHfqsHL20tpBytQRA@mail.gmail.com>
Subject: Re: [PATCH] riscv: iommu: ask for ACS to be enabled
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: sunilvl@ventanamicro.com, rafael@kernel.org, lenb@kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, tjeznach@rivosinc.com,
        luxu.kernel@bytedance.com, guoren@linux.alibaba.com, jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2MiBTYWx0ZWRfX6RdtEo19UpvH
 hjJA3jZ+GY16WpALySYa92hp3pZPSelVQnPb3laI5EpiJMveP2DRW/f1jDmanfTxH3tMKGb2j+1
 qN1Tv3waRJrrAs+pX/zO2GLWae/CalWAHoWi+x/F9opZSl+M0vz8vXC8+XLvCJtICi5OqYn0v1C
 +0SkScPcyVOHsAGI1kZO2/ygNyWT4iRDGP/R6onchkhahGCdz2rf+O9DwV26TU1OX3teyFn0afq
 n5RwybvAH72NlFBvCjWnt0EV74cRWOfs/+SSBKQoWmZxpSVhhq7r+OtSRx/D7deA/859OOhgWqg
 yLsWPjufvFurtqmMCUsxOWWxAQAdvw4fyVRHvKkD981KFissTyCtylxDnIXk3yxtxQAVZt0jXKK
 /tFhY/hSHH9iuW3Zi65MaJd3a8V6fjlrRc4hA34byNfKjQYE22TsQl+/txR00PUW9glj/xciedl
 hj8LJ7tw+UTpl5sFnAg==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa8924 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=D19gQVrFAAAA:8 a=4BKX8IsyAAAA:8
 a=RP7urAqO3HFMDD4ElOsA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
 a=W4TVW4IDbPiebHqcZpNg:22 a=bflBWynC2lygM3eL1Mvi:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2MiBTYWx0ZWRfX4XKE945Z4nR5
 pyhF2N3svL0F95BEDs1ryRl2/RN+vBDOgiBWVxXndLLRY0TngoQ8kJHDPqAIVIHIAZGTaMXy128
 JNh+LZvdGaD9GDuDJneGElEXLSj7vl4=
X-Proofpoint-GUID: jltVpXSpC5KCH5A7-UwBqYfjrrUQqQMB
X-Proofpoint-ORIG-GUID: jltVpXSpC5KCH5A7-UwBqYfjrrUQqQMB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160162

On Wed, Sep 16, 2026 at 5:15=E2=80=AFPM BillXiang
<xiangwencheng@lanxincomputing.com> wrote:
>
> Make sure ACS will be enabled during PCI probe
>
> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
> ---
>  drivers/acpi/riscv/rimt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/acpi/riscv/rimt.c b/drivers/acpi/riscv/rimt.c
> index e4538fa6c2c8..30d2d0211d5e 100644
> --- a/drivers/acpi/riscv/rimt.c
> +++ b/drivers/acpi/riscv/rimt.c
> @@ -525,4 +525,5 @@ void __init riscv_acpi_rimt_init(void)
>
>                 return;
>         }
> +       pci_request_acs();
>  }
>
There is already a patch in the mailing list for this.

https://lkml.org/lkml/2026/9/3/1930

Thanks,
Sunil
