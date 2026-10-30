Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793358008;
	b=Je+u8DEULaX8clA5s7b4PvXQxPOl0S3l+mqBgJHTF2L77uBQHBmIQQu9O5ZUtH05g2Jx
	 DT+7gdhILKI0Pn2TI4FsuhllIV6nppg6IFejMAuymkmyDWI/eLvnFB2/i7l7/naj8fSAw
	 5EzQ6CX7AMkAqvHhnTiS6Q0BmjqrEX9LvI3iOUobaDU0yRshg3S3fTyG8042d5OLjoB6O
	 R/4NfqqbgKDfLrpF8SUKlz9uoErHIqBAne1waX3L1MENQMhOMQfig49IJKmihM7hBSDXg
	 ns18tu1n+QMi+OgOaKxGgkdb/rcFQSufSKuM//U0w3vvJEHjJuudTX+7XLOaBV46y6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358008;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PIuOCX0AHVQZHCW56MurqyskT5/roJv4n8HNkBO1lr4=;
	b=dt0a/5hRVBs/TxHZg/5IlyYhA/vIrKV97lAedfDnbWVfKKRcEEecZOzHwC4H1kex973Y
	 ziN5gqlSM/OWoZDgrf8Z1T1HDDJJT3VW/7jFmZv6zB0cSvta0UBvgsmxWVNzhZCowl9dj
	 O+ySnRC6bplnHv05StsT+6B4UMOgSNkATtYkyEFyfPSPinMQq1+HIqHMEh+siWGozbCaF
	 XoKPQPwRy8oJIwDcGV/37Hlh9AuOUJSEtNUBIfbIxhLWmsI3S6qpmm2eIpAjQy2rC31Kn
	 4Vw10A573J/TawsObB2uWHqHTnMp9uMaXD9P4r1PQgiinR92bHlsf4H+WPgAUgYRgfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTzOVivM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LmluDg78;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF7E606C6D6
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDF7E606C6D6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTzOVivM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LmluDg78
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FC763709484
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PIuOCX0AHVQZHCW56MurqyskT5/roJv4n8HNkBO1lr4=; b=aTzOVivMPp0yWKdU
	9LGLEv6Ecdv5Kov+N1E3GZC9BjPJVT9lzoQmm5SLp4p1w7SbyzWmSKKV9ZdI6vGV
	MvBhZveSuOzvdzRSWF1fiSEXOw+zp0rE+dXiWlR9aYBJqvkHlUPtpSZx8tfnTRT7
	WOTpxYWBMbhmqqcSVIMnabloXlQqW+b0bpkWRBztpaJEQGt6PaZPtg5mR0jYpPJx
	FmOAqUW/84QlIfhRZAQMPNy5MEnaABH786sBNXj2c4es1H+sYf89OXA/h40VgajG
	v7h9/zjWQIsHZwBEXPSIM/4Ht3+PlxxZd1EccLcPKF8omnZWfDobgWIL1gSkj1V3
	zM97OA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rjnh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:00:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9501034c4so10176685ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358006; cv=none;
        d=google.com; s=arc-20260327;
        b=odjh9xOXdkQEXF6dIGy7kwqApieFEzIRdcaxbCSvsSv+McYdZizXIf14fL3ajSeQIr
         VaMbcd4V30OA963jZ91PEp/FEtWZhp8lUJ3diyzHJuCj4hsTWXReeolTekENHyprcOp5
         MLtvJt5cJ//5Gdhi0X02lLwrDdlrgq6K1SJUWCplTLp+eoTzSHdvwocc1aCmde26wi+I
         JoJMLiMMBoltlGGKcIxtoptU9JzGERg9rrIIMpMsv2a4QoTifUoxNc3sMoKQDous2dUw
         C0H88+BfEUiHPU23kiwPX1ifOGxrKsMpSuzT6xAOnPMzCsphTv6GxPvfHgErA2rp8bXK
         1hag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PIuOCX0AHVQZHCW56MurqyskT5/roJv4n8HNkBO1lr4=;
        fh=AWaXJ+5dc91iDt4wGsmI6NhyWt09cHTUDTbHx3zwm5M=;
        b=nD+0BCTzQPowRxBNwBh80ApXd/QXrNyK1YlhyYLrTbZCGmzccf+ikD0o91hmk8KXS5
         n4A8qmoKbwBeWxFEsz6XptkzYUMnorUHvfNpkN7dmqMB98b5kMdM6uk7ehAz4DHpn22N
         +AuxwYzpexzX5xvEeNVkwJ7Ki0bSsxzvzbq/G7cg/RImyfKAR6AcRn/LAgrzl/M/dz14
         vpB8+flQNDSs01JwPZdi0E/BSMthZWAE67hCLeFoiu93tzdy/5nPGps8g9eWTpoVylDD
         AKGP5bwNbD4HEPTLcCWCDOQEq5EW00wYx2coQBjz5Xi1sBwSvFrLgdK8ZASF3UIWn4AO
         cJew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793358006; x=1793962806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PIuOCX0AHVQZHCW56MurqyskT5/roJv4n8HNkBO1lr4=;
        b=LmluDg78lOffrPR30CLZKM7PkpMEWJtTgCh8w4/4Kn0PDP6S0BllKRt6R68To9+vSO
         wxzwkly0y9TMLqGeTKKrHfTG5h0ovfVGTiEzFvHqsLU1Jr91uUJQrmmZ3+vKEIykf3Q7
         vKWLSz+XLXeVXhvnWTB9he0sEAMc1m+OKOlUMWs49rr2aTCjDYq/W+4GuibP3Et/ZKv/
         DoN6ZK8mymkSIDiOcS9WgqiHZb6uFIsumCHUoUk7HWRzezbZwKKYERogfZt6mAujo7ID
         8DbeyGVqhNSQLrUkkZd2TTRr6WyQK29vO2J2eWKATLZg+fkNJ47BdRbu4TqhbON2l4e0
         mt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358006; x=1793962806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIuOCX0AHVQZHCW56MurqyskT5/roJv4n8HNkBO1lr4=;
        b=vbtheaCxBkePBv+tJLzkQtZXqz3hClut8zhQHK4loEuALvfplbdcAf3MOUkSFk+xI6
         wLMkLZJf7Y84zbqZaqv8tx6ulK14xoltIF9MnHAWO6jHXfynvIjMeEn2LNj5sVadIC7C
         VJPX9OqHc4Byt2oJiDAFKGTa96n2H98pA1ELHA6m0Q01wzl1F4zXfKRRKJ9KTYolR9Ye
         2EQ97KASfOR21Gb+sPcQWA63GOz8A8+MOcq3yCiP2wZZs1pTTyM8Jninv91RTrvlFEck
         Dig3Owey1PKtOrJ5nCRsYHez45XdH5qlt4SWMTCCaLqOVFHhlkByZRoHReVC0szoKCHY
         kgYA==
X-Forwarded-Encrypted: i=1; AKwUvBy19dmMHm7TMRMIzHTx2Kq6elO/EOpa0HioZ6br6hyBFKGKm8TJEo1rOwWbqJPPQVEj1+TWh4HuMK0vAQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcjGlE5u4N/PuD/c+0hmIvQqNwvQ4Rkrg9OPBm4bmC8YOLODfE
	AfTotc9wu/VNzyOhpSpRKDMDROA7VQoapON5LwLcaLX/MoEwLahB6VvoBDMS8NeWCMpUZsRUwnD
	5QXi03+/0JzO8jsUqe4w0qMutiJ/7Dmta1q1bEFIEF/fy9FG+jKlGr4VfaoBuZw0Mxze3rdSUq4
	Cx+i74QfAKTVXmzgCbDXSWTqTHw5nRHg3lY1EtkySTqw==
X-Gm-Gg: AYBFou17uYltlswtBp4UwiLz/tNZCXxRFP9w7uLHeHvbW0YOu8RK0FAwcISxMR+mz82
	brA2DcFuMxz6B1RPcCdX1sNVbg7VK+GNRwaDSmcEhk/DHVUg3KRbZWVaQD78LETrGO6HsVEKHpO
	/xnaD/ibO9Lv56MiFF249Co4Xkw9TUdMaVj+CDgGV+Py8OTBMEy1GQuOJ81w==
X-Received: by 2002:a17:902:f785:b0:2ea:238c:4451 with SMTP id d9443c01a7336-2eb364b499amr21193615ad.30.1793358006462;
        Fri, 30 Oct 2026 04:00:06 -0700 (PDT)
X-Received: by 2002:a17:902:f785:b0:2ea:238c:4451 with SMTP id
 d9443c01a7336-2eb364b499amr21193275ad.30.1793358006004; Fri, 30 Oct 2026
 04:00:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016163707.3508-1-anferneemelokc5@gmail.com>
In-Reply-To: <20261016163707.3508-1-anferneemelokc5@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:59:52 +0100
X-Gm-Features: AclHuK-BvDlghJYUIO9TuDP8Rn85PebL2VkhT0kLOMXOR76evk5RCctsK-_4c1g
Message-ID: <CAPx+jO_FV4Cfms7HmfxGxhtNuME6NJ8Vgov1P+AT+4UtJOsqAQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmci: fix DMA channel leak when mmc_add_host() fails
To: Anfernee Cao <anferneemelokc5@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulfh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: b_c525D_NM7OAwjgEll9cSfU2QsTINOG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfXxZovjnuxrQ/c
 QHGtrfWd7ZGlUXo5N1y0aRmnmttBcUKAaIeeNTac6sbUju2Y1XEYvNvimakjZoKIgM/YLGB+SgU
 yub/0676MrnEHMbIxVkioFW2FYzyHm8=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae478b7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=rFPXIUPvEMN7u70KbzcA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfXw8NXjGV2R68e
 jcpCw4lBqwyvUuSc8Lf9HyFt7HcL9x6NFiPcUZ7Pu5rsNKrWXjGbGVGIKB8ausQ22hQvnFiVyK5
 i7jLn8jl2IvperAV6HB4CVDo7EYWWOpr0tgG5GgeZ/VQO9qj+nDYeeTK7C6X7XFEY4Ovo8njNf2
 WaT7CnvJScIa2rzkGRAk+EkygqP4mKnmStECtoluKi97lqjm6DOq8hCx8IbV0BiUA9I4vGdAy6A
 /tsTXPHC1EBTIJRcJyNRPGM26z9kdHjTKCw0aqdN9ARHqzooO4rhlfT59DMafQfcYtyR5JkuydW
 pTiiVSCuVJNf01O27pjAQEseu/VnrNFIXVLQhvCaYrwACMrk1oD4cjhiU2S37PBh6WemJE8ZafZ
 u1I3LflwIH1cGwOBpBXPwRUzIpUIrO6sC2RtuOrK6pcVQcHv+TEOu9myYy7YUuypZ1tApGLdRL5
 YhCafYh97P7QMWPNtCw==
X-Proofpoint-GUID: b_c525D_NM7OAwjgEll9cSfU2QsTINOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043

On Fri, Oct 16, 2026 at 6:37=E2=80=AFPM Anfernee Cao <anferneemelokc5@gmail=
.com> wrote:
>
> mmci_probe() calls mmci_dma_setup(), which acquires the RX and TX DMA
> channels via dma_request_chan(). These channels are not managed by
> devres, and are released only by mmci_dma_release().
>
> If the following mmc_add_host() fails, probe jumps to the clk_disable
> label, which only disables the clock. As probe then fails,
> mmci_remove() is never called, so both DMA channels are leaked.
>
> Release them by adding a dedicated unwind label, reached only after
> mmci_dma_setup().
>
> This issue was found by manual code inspection.
>
> Fixes: b38a20f29a49 ("mmc: mmci: fix return value check of mmc_add_host()=
")
> Cc: stable@vger.kernel.org # v6.2+
> Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 416bdb184ed4..4db5c55b2700 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -2477,11 +2477,13 @@ static int mmci_probe(struct amba_device *dev,
>
>         ret =3D mmc_add_host(mmc);
>         if (ret)
> -               goto clk_disable;
> +               goto dma_release;
>
>         pm_runtime_put(&dev->dev);
>         return 0;
>
> +dma_release:
> +       mmci_dma_release(host);
>   clk_disable:
>         clk_disable_unprepare(host->clk);
>         return ret;
> --
> 2.54.0.windows.1
>
