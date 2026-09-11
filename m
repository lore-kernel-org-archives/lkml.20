Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0111842E421
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122306; cv=pass; b=Kfpejikd2SrbITE7D3sUk/CKTcbRGKj59MX1aWGmDUumVvJch64nQvbzKmjx8cTynLUwIoNP9Jq/zP7A/zPTAsOUsSRrakI08CPYFmalJc1sf2dvP6vXQhghIZtqkFLe4+NAQJjaWGqBO5Zg8diSIQmiW23IgVXs0fHw+ug+l/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122306; c=relaxed/simple;
	bh=82a1CIjVaIoEp8Z3hlY+sGoH6EwyGXuwBgU9dhpGj2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HAkL3QRT7E2qref2zUOcPQTO2BYV1u8SWyq4loxjoMU/+ld052cmDe9wg9t+HADjJ85jrc47hd8f3LuNDFaXai5Tm5czGFrjOrtnoM3JWQ4o8wTLnuUccwGqw8dC3nhQ+fsbXV17mSy5aND2aV5MPJdloCOquo0Nr+BnN+0K9Fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odGhfVEA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AavK6pzz; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odGhfVEA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AavK6pzz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kbba3686775
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	78LESa0xW9NBZFerb3MMp2ADRFT+Jxefko8V+gPB56Q=; b=odGhfVEArhT3oTpa
	UNv+g79x1DkOPctvaXy3KEOs2HMRh3DrAY41VjHuQi+DpdBe2UVJV/JUmNMPTXuJ
	oytpwkY5BJLf0NfjAK8oD+M/2C3OIKib2rWeYBX9sFdxPGnBOkuwMm/jvaBEDN+1
	huGkwpugBvGLBe5MSiFI496DPm6OmyszblEHo1vJKTc/197Qc2QosQble3BqW4Yl
	eC7e1C9hhsbvQThhev8tFgvZLcdH+297yMY0guLDgSG5FCBgtNr3B8lVqtRSmT+S
	ipvcQ/qbaCc+ycxFAyM+K0X2foagbU9tGfF5X80V1FUgD/hwreZecdTDdPgg6/Ii
	gcvksg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg1b4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:25:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso9957815ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789122303; cv=none;
        d=google.com; s=arc-20260327;
        b=MXfYjVdRa+G4gPF6kcTajSVKg6pxckBtspXPCX50HCBX64wbDCGFC0enJmksCdLE0W
         QR4LpDrurlroTrLRn6K4VAiLqt+brVxuPdbaEs5gR3sCytOzKjmrHEVMl0sDGzzs8SAZ
         1+FkRNPIDbPt6rWNvBnkM6zy/7LP7YoMGPx6Qn6g0zW/ZMTBIK7F9jD3UwaKgtVd8QSn
         WCxA2qSFCb8MtakpwygQfbzxeox/YQoQkcTYD2I6B6kXgq8NRNKcd37WunfzFn2FuU7U
         emofPrqsTo1rm+aRxDyU7WYxJG41UcRRubzhMVQCpE3VhiNxraZOXoesqJTVaWDAiYXM
         e9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=78LESa0xW9NBZFerb3MMp2ADRFT+Jxefko8V+gPB56Q=;
        fh=mD/FiUy39MnuGdpiKz25FEFZ8KwXrjgdfMV9kHpYmKc=;
        b=gDRMtNS1lgOnyE3BPszm/Owb8h+STYzPhE0519gfvBC2S36pZIucZxEcRjygwnBkep
         DX5SgzxX7XrkzmUB+M94MAbn8ckS9pRM0fECNMH7LF4fY7hConf+xkskgxHBPRvwCD8L
         YhS5bW4C9DmjM3dDOGhmqmj/izFKYbqRbQHOFZZnfje/yJcpFj5amsRtpjOcwvI1jkDF
         t/EAxkCqTPpFj4YAS4Bq2ccn7EQOaKn4wtXj9ABpMMvURwx/GWWgHNYlpC2efpgtUrjC
         uncnNEBBH0UctgdxZNrU3WBtwHjT6xIzLikbk3qD7QkDM2X1+4F0+R8+bljUDj/i0hC5
         ts/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122303; x=1789727103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=78LESa0xW9NBZFerb3MMp2ADRFT+Jxefko8V+gPB56Q=;
        b=AavK6pzzb/+EtWhbcPeF25eA4BeXcv7jjBuGEW6VZ18GNX9Y1ztZ7FBIN+hPV01tGV
         b0iT0My14JAuUxVdLA/qpxfn7Ns+ibliNeOY7uhVf05Wl5jJJpTjEULWpvjwRnnZ01Mp
         y89Z/5siom8Dv1GbxdgicLOrSgsk2pCn9I4foTUiJn0EBagMJUwT/j2vQPrz5u5ZDwg+
         dtORApbs7IZyqUcwB15FYqMbzwogXhI0z5sKPhsv2DKJjd6cv57FzKBqgt/UtvQ/alBf
         O+ARLyihONYWnasttkxaZvOvc4RgE2cenL3VSfnMZLcWyR3I4xIU4lpqaLZBtPzI97Cp
         hC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122303; x=1789727103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78LESa0xW9NBZFerb3MMp2ADRFT+Jxefko8V+gPB56Q=;
        b=iJ7lMHV9n3BULz1rRNnQocMnAQ4c0IOapAdRWiTdWMkLqcM7iUqrlePdf7EpI9liCC
         JyqX7fBBZc8gVBGUSoCqmJV+8nQHPCAcPyQtKFOvLNbi97xtCEO5rxvsE7dxe+hdpnhy
         q5A9lQOW3G05mRaH3qF9p850cfZu2zQNQgYDdjQgFVGbYmyjPdj7qckkS8fRUSFHj4Qi
         /aUFhYhIJNQyjGYUB29f45WIVZ176Vzb8NtxqIVQtmz85EnwhmN4bVS7ZNbhZLzqLEjN
         Y6sZisngW8xhXIh2Qs9apLl91cEX0pJeRQ4jJ6embDy5hTIKMHKWE+p53kwI1hkQaoRe
         muEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLjXCMwR84ZGZwYinX/JYyu9peJRi6cUjKpFUIPdeBrmWBn+/hWPorsxmOoTzEv7lu5PNdkW/Wg3X/ccY=@vger.kernel.org
X-Gm-Message-State: AFuF++mzsUccFKYYE7/JRt/kBBHLzFzaZcOvAd2r+oO9ej6lxThHQyuG
	rPS08YRyTh52xTNf6YMVAJ5XI/i9b4UgxvW6nHbvMwnTLq24apfirAeOYqe1jUVCOsUXVJE/fWM
	jvsvcCWYod5YrNoaL/XoU8vY/SjUvY8zVGiI4Zhf4BzVViUIfrrbCekweoNfjtc4+3B2vNRJGL6
	oFWt6+5Nz7VOom+pVT6vzPwKJgud8WllFotdnNRUQIkg==
X-Gm-Gg: AYBFou0iegLGAKiwav1F6+hshFu1aCC5M2j2Pu1VjuYmL3TMj/uoPGEiDqu3za344q5
	lnIXUaZ7jR2U8tckcNauXc7HDMK467Bc4DwBBLDh16xvlw1US9vyw610YCo2t7Yyw9EVzUVJvJw
	9P6A/Rz4i4ksCeFHmKXaZjmhgnLlsGTrrOEKZUErnWquPNC3sXPu++/rszEw==
X-Received: by 2002:a17:902:ce10:b0:2db:3729:22de with SMTP id d9443c01a7336-2dd29e0ecddmr78785525ad.0.1789122302669;
        Fri, 11 Sep 2026 03:25:02 -0700 (PDT)
X-Received: by 2002:a17:902:ce10:b0:2db:3729:22de with SMTP id
 d9443c01a7336-2dd29e0ecddmr78784975ad.0.1789122302247; Fri, 11 Sep 2026
 03:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828034413.26115-1-vulab@iscas.ac.cn>
In-Reply-To: <20260828034413.26115-1-vulab@iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:24:51 +0200
X-Gm-Features: AcwNN1XuNmS6ZmC3zC50AvK74TcgQGnHr3WRdBGIk1rjeJOFMseQergQI0Iq6fc
Message-ID: <CAPx+jO9v5rD57kjhnNnzUOVu8Li+zjpnKBO_UksGET1nURJmJg@mail.gmail.com>
Subject: Re: [PATCH] memstick: ms_block: Fix memcmp() size in msb_resume card validation
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: maximlevitsky@gmail.com, oakad@yahoo.com, ulf.hansson@linaro.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: jBmHC3Qzp8WMpVNFfUrUUpZJ1ZgXbsnN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NSBTYWx0ZWRfX/8XBX+uvbYVt
 SflM+lkmlpGQeoUAmKGAKj6p7ghwSK0jHvGeY4inTA4t1C4E+juWy1Y2EkHXuFholkVBdddpXk/
 9zf/fNL/ZeQay7tf37xCZtfiRnUkaxU=
X-Proofpoint-GUID: jBmHC3Qzp8WMpVNFfUrUUpZJ1ZgXbsnN
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3d6ff cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=65QBhM1G5XyreR3ueWYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NSBTYWx0ZWRfX9wq1x5utaEEY
 sHToO/2NrZLJnqda4bJ6v3HBz8fYGb6GP/mifZ5BnjuyukTm6uutIMHBPNnga0LfDtX3LsLhXDf
 xVdm87M8ScUAujt1RijtLS4Y/H6RmuzSAep41lskP96m8VI8nQ5r197wLkm1eRUAO8bZmAPUcjd
 3WaqGE0dNB4JOa1igcEPYKwtDWkNH+gPEiNHHhBEIK+x7FV3uoGnuDw/tjNvNdjxu5NyhInG7tG
 RFb2pjWlz0lmnMKPrM/CWpq/cLeLtAzgY21+NP7eUIw3CCTzOtxOZyG/AEsic9Fhbx3R36Ki9kA
 VJ1gZPcIsAonbNVO1b5pZUp855U4d12GkZDTMFZuF4I+wizKYf5geIE5FWcdiRyEGHAbUeAjoI0
 c73hXOtinos4ochiknGDj1SplUL7M6XzXoLoVrr0nSE/W7xZ1cMo8X7br1RnLVZrRKs186yVPU/
 Blv/UhOKn/Jj6ihnP7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110145

On Fri, Aug 28, 2026 at 5:44=E2=80=AFAM Haotian Zhang <vulab@iscas.ac.cn> w=
rote:
>
> In msb_resume(), the LBA-to-PBA table comparison passes
> the entry count msb->logical_block_count directly to memcmp().
> Since msb->lba_to_pba_table is an array of u16, only half
> of the table is compared, so a replaced or changed card whose
> mapping differs only in the latter entries can be wrongly
> treated as the same card, keeping stale cache/FTL state.
>
> Change the memcmp() size argument to msb->logical_block_count *
> sizeof(*msb->lba_to_pba_table) so that the full table
> is compared.

I don't have the sony memory stick spec at hand, but could it be that
the comparison deliberately is done like it is?

Kind regards
Uffe

>
> Fixes: 0ab30494bc4f ("memstick: add support for legacy memorysticks")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/memstick/core/ms_block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_=
block.c
> index 1af157ce0a63..589ee2eb1a60 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -2246,7 +2246,7 @@ static int msb_resume(struct memstick_dev *card)
>
>         if (msb->logical_block_count !=3D new_msb->logical_block_count ||
>                 memcmp(msb->lba_to_pba_table, new_msb->lba_to_pba_table,
> -                                               msb->logical_block_count)=
)
> +                       msb->logical_block_count * sizeof(*msb->lba_to_pb=
a_table)))
>                 goto out;
>
>         if (msb->block_count !=3D new_msb->block_count ||
> --
> 2.43.0
