Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065F7369972
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883831; cv=pass; b=ook5NDkcJHOU2m0TK6syoQvsnYh4mXdaCqvV+jkQxkCnhzBcIA21m44QK0fQWiO4OvJdLZO14TEa8JDAJv7yopjIywVnjnJJb/KllCpSEDiFE1/VpHHqBH7vkaetJP+w82csIU3Gpbke1SE08MFL4aVYhdvz25PBxbeJwiWj5NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883831; c=relaxed/simple;
	bh=WjCczMzq7v2DMLMClL76SWWp3Z7LjHwb7cMCKyxrJCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNoult2cWqq9sED0L4w79iyY3umAvSDpqcBco5cThtD6ioqEnvA4WRRGkGEuOihDsCdfBPeZqw5bSoNukhsElP9UuvvnxVZ0+O0u3fNSULspTOutGCrWf4Onph59FHCEs1apFImUHDnDhFs/fw1nzuFXPfHGE41yDGk7ghnK/+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFW0de9n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVEtJois; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFW0de9n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVEtJois"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdZhp3964232
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 16:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gIptT6ebDKpfRTnQEYKVwnIudW38JeoR/b0x6LGj/2s=; b=hFW0de9na3S3aphS
	KMdpo/gpsWf6jTo8uGntP21Jl0kKTvtZSarFzZPOQl9KIzgkPdHmbsqDrLtxGD0w
	fghngdgPHdCm4GIs3bI5qm+xH00rGqe8hRWjvnQ2S0QOhxNPGryvxM5sorneBYkI
	0tpPrXPIoL5jYBFmuAf65IUcNre/SDyPHajBSIamTv+74dBlJvzn/02JBPeEuHYl
	RdU4Z05NVNCvSKSrNBRIol5e3w/UFETcVaT8c57qw0ushGQCSiujPnEmyUZkWi9W
	NZjT5JZsp0yUsN4YEJKUMBsVDp+ci+WsYUOo14Lc+w/jLJjZeuSk/4pLQoYJqA0z
	4XYeyw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp49qjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 16:10:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6c166bafcso66524555ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883827; cv=none;
        d=google.com; s=arc-20260327;
        b=AMxa4wiXZaWg5cUEP8UV5Tk1j4cBt0GaDBPPiFLmkVsOWC+FUxGny+oWWG7NkTHZVf
         H2QzV7EDt0hDgPqmpEhCPuub9DG5L3Zqb0Y6rDZkb3AyD1pKebZHOrrib58qMyF4Dtv7
         jnC4/VcgMx3Q4rtECQmHEvzYmSNOjUovyHxJKPfpE0uRmeiiaQiebwLeZ3dwnWFH7ks0
         K8bReHW6h89J6lHZKLoE0KNIYVMutBW4cKOePXsEkeLb+UDdQSFaIpuc3QsiZoZ1DW3Q
         gRYEsE7NwaWDMdDv+XmAMkv4WMYlLoLua7n9rK8XeLEtwhNjJh+sZkylYbPqRdO9zP2u
         W+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gIptT6ebDKpfRTnQEYKVwnIudW38JeoR/b0x6LGj/2s=;
        fh=AC55KVeAnf5AxmZi9Q/Qg2tkoLknS3J8Cjk2b1nPYEU=;
        b=BHkVjbqBndfdgNSsOWEfsbz2bM9OOwojNmg1aR7c7Gu/PSkLHF080uX8pwJYHQuz4K
         41m/rqdbdKk3xhQksz0KnxcdLbFqzRq8VyXe9lQSq72T1QGxjOQSWgjr4w/xSAhDpvd3
         wk6EMmZLmgVYDf+iNGcXmKNhaSDHJMK3+dlHMyZ3iGQXwNFV4Et+Kyy5NNfbyD9feFa5
         7TE65xVKfKOqAa7ZkGJeNr1R8xtMwR+MbilGB/5xa5fiSXCSLb1urkNrNdmVizfbhiXs
         dqsyjXNYahYmci22c3EB8AJvAboPlOgSRV0cI1MfimixRjGglbSlBDHG+yqt+8LURSNX
         +6OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788883827; x=1789488627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gIptT6ebDKpfRTnQEYKVwnIudW38JeoR/b0x6LGj/2s=;
        b=KVEtJoisMPMFUwnND5nDw7qFcPAotVoJgDlXPWsWVdOd0y1REVJsbUtD6+GBjwlloQ
         y8vjF2p3lGvVgYoZR1xBYXNfDh7yC3lVGjwfwd1tw9csFuWDl1auVsdCx3tuogG1DK5m
         ZwtPOjFmHttmlm+y3XA46uEtq6RU8qiYol4MtVBbSFZ81IpUm7N4ukVs4V4lgnptoPto
         OD7cqh5KniwL0J5XAtl3WUAfr87+Fet07MUi/HiYYDz7MnN8BopnR/fzOmK9trx+aGZj
         +KQHCC26efmCehfircR3ik8R4WjQ1GJ5QJoSw04WmUXjRh7GXDapCmxNHIUEVhov7Gtc
         fO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883827; x=1789488627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gIptT6ebDKpfRTnQEYKVwnIudW38JeoR/b0x6LGj/2s=;
        b=Ba9OD5t3DkFL0/mn7zGy+CQ8qnHJ64Ezwk5zg3Fvu1+OfBtXqd2jhM7mIopl6xInnS
         RnmsIozxuFbEu0JT7ZWg5fZRVhhgKCfUGupvVh8QXY2VbPX3YErCDP9AQY0YZFvq/NbM
         8rz9bkGhK3kBaAptoOJEMtFWPb+97HI7dbpZ48lCJxpkr3LzKq6GFuM5KKHlz6/Uuw1O
         nAFe5IqP1YVucYB1USwEXtaHAQfyELJnzGbu6e2MPPVuOs0ZJtYtYVfMIYdhjtXUk7s3
         sN/HnK+wVXQJZRvmAl0aSRc9uEj58Jn1E3V7WXs8VOxHjrFc/8PT5cWqtfV4LKWL/9aS
         A4jQ==
X-Forwarded-Encrypted: i=1; AKwUvByp2Cp8yknjLsrtEEc2RAPB1RDAwpfR2eNKYGoWISTdE29Cx6itH1afcOXmr7vrCSMvqDnHXZOTKmR6kZE=@vger.kernel.org
X-Gm-Message-State: AFuF++lGSAvcI4gZJ0pqasCbutgQAitirW0LQMtRucS4nAEFFabjN7Fb
	TPf30H+ZAkV7VWiYxFdGdzYJMvZn6Gpnv0W3qvVYWgCrICKv1hS6S0ZLLwFA3/ceYxcvZcoxM3p
	Uvw6HkJ2caGnNFmfw44be9/+aoXZ6qXMqPpWQLJvqdDXWKBTytkdAFPJSjkW8CipLACoiUk+O+v
	iIj9icWqify4bu3eCRavUUGrxKFw/WaZqu9czd+un8Iw==
X-Gm-Gg: AYBFou3+O+JnEvGwLVd9RxFMzn4i0kicbd6fIiORJiETIqf/DcOIgwNYHBnRcCwXKDm
	dRV0jEDR+5iFUvxFpeXLAFGdKFERpujVVQxd6UOsb81i4w5OTxPFndV/bEAUTjdti/aSG5kUCM1
	Ai/zLcMlFO73B22RUzv4btByC7K/HTk+zoXJqdY2VTY7VzmvdpIhvdUjSPcQ==
X-Received: by 2002:a05:6a21:648f:b0:3d1:5c01:e6cc with SMTP id adf61e73a8af0-3da39f7bf83mr45855676637.10.1788883826565;
        Tue, 08 Sep 2026 09:10:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:648f:b0:3d1:5c01:e6cc with SMTP id
 adf61e73a8af0-3da39f7bf83mr45855537637.10.1788883825825; Tue, 08 Sep 2026
 09:10:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CD1C18732FB187DE+20260818113153.3521044-1-raoxu@uniontech.com>
In-Reply-To: <CD1C18732FB187DE+20260818113153.3521044-1-raoxu@uniontech.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 18:10:12 +0200
X-Gm-Features: AcwNN1Vap-n-hNxpqf0uBnt7qV4BRywFtHrgMgkW8s4z4JbnZUCZDoemIXHPZM0
Message-ID: <CAPx+jO9BF2ZjPsL9MJE_dTT8pmO4WqRmQEWF=MWNR8VtsOM9WQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: spi: reset bytes_xfered before retrying CRC failures
To: raoxu <raoxu@uniontech.com>
Cc: ulfh@kernel.org, error27@gmail.com, rex.chen_1@nxp.com, kees@kernel.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa03373 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=iHwBjlyiAAAA:8 a=VwQbUJbxAAAA:8
 a=8VdVo41s6FPOG_PhRFkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-ORIG-GUID: YPMCzHlFQwuh7G0e0NjIOKL9SE0XtUUI
X-Proofpoint-GUID: YPMCzHlFQwuh7G0e0NjIOKL9SE0XtUUI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfX9TjZTHk+BoFU
 foi63GGuIMWBqkWoD2C4Yq3CJW6/WW8yhyzjD7IDHryH9zNyxE9ZbchDMnYAob51ocIzCnPH1H9
 ZSFKh3gXIOjKyq4dL9S3MhwhOKJg8qipUC653nt/8tzlKIQ21pxFb1PNOqi6FJO1gUuISNG+XFI
 PET4KZs6rFQk0Z++iZ2iBLljz4vG1Y7fKuPr41zFId9VutvXEvNbCjT3iYL+QqW8l0dI5Vpe01c
 ZKxp/VhTR3Jk5gqWHwXzK82SGeedHBgXcpVhF9apRO7+/zFi7VUmreazhViyYWT2JtNSEGJkGrH
 Uo6nLwCcVFmcTtdSZeEjOAx9x5Z4Nt9ykyi+PsrcZitLgxJ5PhtnuOakEpNTsc0Z8ZkRGtToD2R
 QUsWMJMm2h+FJKX/KpX9F7HYyoOFxjVQWqG5rAhIcPuK6xwheMi64zeNEX5tI24NxWzxMNUpITU
 NsS2bba6YFWMP0APo0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfX5A9YbP2wfJK8
 61gC3S5T+ULt+LF6/FKdSgWuGtBIFqGBq6zq45j4utpTu+jbPIeUPE6p28+FP/DZDo3Jgfu0M3q
 lBABFM+hRtMZRVuXy9mX987qBlo3kNs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080174

On Tue, Aug 18, 2026 at 1:32=E2=80=AFPM raoxu <raoxu@uniontech.com> wrote:
>
> From: Xu Rao <raoxu@uniontech.com>
>
> mmc_spi_data_do() updates data->bytes_xfered after each block has been
> transferred successfully.  If a later block in the same data request
> fails with a CRC error, data->bytes_xfered may therefore contain the
> number of bytes completed before the failing block.
>
> mmc_spi_request() has a private recovery path for such CRC failures.  It
> sends STOP_TRANSMISSION, clears data->error and jumps back to
> crc_recover to issue the same command and data request again.  However,
> it does not clear data->bytes_xfered before the retry.
>
> If the retry succeeds, the request is completed with the bytes from the
> failed attempt still included in data->bytes_xfered.  For a multi-block
> request this can make the completed request report more bytes than were
> transferred by the successful retry, and can even exceed the request size
> when most blocks completed before the CRC error.
>
> This is most likely to be observed on MMC-over-SPI systems where long
> multi-block transfers occasionally hit a data CRC error but the
> mmc_spi-internal retry succeeds.  The data itself is retried, but the
> completion accounting is not.
>
> Clear data->bytes_xfered together with data->error before repeating the
> request so the final completion reports only the bytes transferred by the
> successful attempt.
>
> Fixes: 061c6c847eeb ("mmc_spi: Recover from CRC errors for r/w operation =
over SPI.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmc_spi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/mmc_spi.c b/drivers/mmc/host/mmc_spi.c
> index b471a7795b4d..5217d713c826 100644
> --- a/drivers/mmc/host/mmc_spi.c
> +++ b/drivers/mmc/host/mmc_spi.c
> @@ -952,6 +952,7 @@ static void mmc_spi_request(struct mmc_host *mmc, str=
uct mmc_request *mrq)
>                         status =3D mmc_spi_command_send(host, mrq, &stop,=
 0);
>                         crc_retry--;
>                         mrq->data->error =3D 0;
> +                       mrq->data->bytes_xfered =3D 0;
>                         goto crc_recover;
>                 }
>
> --
> 2.50.1
>
