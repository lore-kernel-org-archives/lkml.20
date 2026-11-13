Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794561879;
	b=MTYKxKeCCqy41iKrkj6zvJC3mqxbHdQFpKWlfC7GP8d+KWzJojJd06VHamjOf6JW9Nw3
	 UK99FEKehzKrZkX2tCp/Gg12ntJ3LwI1B6dzlZDeCa3Hmdq93cbRTH3vpmeH/xPFkyPkS
	 SQuta9KBSlThwCBD6FCLZvU9cIFrFRAxNua6rXRMlbtYlTqa5pcCYaMDcARO3xdQLoao8
	 AkjjSQZncASO1JBJbwidlesF4v9/3Qc90Zlv/5O/TP2oNoCaFYxOyz6+QhhpDmq+yPA4r
	 dUYjOMS2IWQZKUCA4gezsTikoMy+co2NZgIxPxrcVN/sW047my7V+jHFG0CdkxoVjXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UhE6+E+dvkjePL1nvDRhX6rZF7d528b2tAmJD4DrfCI=;
	b=KHClQejVVirV9EKLPa18Pai82jfiIxoYulzz7mc2SJBvbLV+YD8Z2QvUGtXPBL+k8PJg
	 HKbv4wxlryffiCNfs93DVmNYPo8tA1BsgkA7j3LsZKBKDQQR/xUUY0JtXn0HbaWc0rNkd
	 uC/x32ar1dpLs4lhY/NcLyQwosWP+Z4tECtuMpucc9+sEWKm5WVBjdfZyf0Nek3H15Qr7
	 uge1UYFS86n8DCDMXmTxf/eO0Lfi40A/Wai3p4SoBICgZRcMXqSuWHTHtTdRSgcuUvzAL
	 I+r4VRc6YVxPeqOE7ePTxLkpHFNrDvJsid1tge2699+MrbMH+wcVg/xe/x7c+dDs56Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DjI6ZJsL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kR6hD5ZL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C28606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C28606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DjI6ZJsL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kR6hD5ZL
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VAeD3652891
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UhE6+E+dvkjePL1nvDRhX6rZF7d528b2tAmJD4DrfCI=; b=DjI6ZJsLLOmPKpml
	Rb1DgvhUiI94W2nkfauti9BsnAXDBY+UWxmDhxuHTH2klLdP5X+mM0sgRO2hmEzY
	ym/qDXRmJFsVmcL7ZoHdQvKPtJSKnt/ad65kPMYboYzQedXe1mII1HARw4Zj/YEh
	2WMe1hsgkbbcYIUdalaMSivcp2unoX1rag4T02RHO1U4Fcv72PWrFMODcUjVxxpU
	BNzEbPRlgWAp0YCJGQNZMssp4LzRxLTgH81yPKji7I3gV1vODycMr8ra6lQoRLwf
	kKdbFE7NkpTZMJj9FyN1JA+4epNu/VXRZY1dxqNijP7yofyNlI7y3EDprSB6xUIQ
	iBr2GA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwacmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:24:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91edde88d16so9197976d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:24:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794561877; cv=none;
        d=google.com; s=arc-20260327;
        b=VxFqupz7Okw0d2KwSFlzQFBgbZgMUjwY+hCgbgnY60cqp1Bf0n/aYJFL/QGKcZwEd2
         lKGdoJwikJtVtLDUpcAtwcJEhlfmWjWs4FLfuHmSZXVqRxSZ3MkKUXLGH8qkYu4pGUKx
         2R21BzLfV9At/pfPAsl/BWDeT3EzBujY8bptSbytqF0OLddoEq6uoeSQeWnr39NAzYCX
         nsV9fks2aWhHyDeVOEO/ziqJaaVG/e3DkgA9Fx40JhSNbgBgp3mzFsLBs0Tr6f9u5IJL
         vxVIP9QbUHfMUUN4qB8J4SzRXZFKANo2Z1V17NH99gfBa6fPWYN8o7XpV+JVAZ/90x4W
         x9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UhE6+E+dvkjePL1nvDRhX6rZF7d528b2tAmJD4DrfCI=;
        fh=npIJ62ydLOfUTYEtKk0l5VwPEYzzAX9LUHFUHh2Sqyc=;
        b=sGa6Ae+PfaoYVqDJdVSR6qcbW0aEmPEap5n1sXsudxt7svJZA7bCOzgYV4KyUtDO9a
         G+OtszvIoivecmT0iibMcvLuh9eqq9UG/b0x4ht0ei8reVaIA4UaXMRi21eqa7+u0P9N
         3amFjxH35gPxG95GZNOD7sTjW7GxiTJMhYfjpmbM4I84Gu77Gi3/g0aYif1ofghg5aGq
         j00QJA3IdMdowH9AR5sXvZbSBd+hdbzkpyJ2TzH1hhNIIDSQU+tvQEz8CDzformiesXH
         IS4ctUOa1EqBbowkXjTusmYnd4SYYXCnXOpPEOJJ5jdwUcdG40IMdfqyqtBstiSvJl30
         k0dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794561877; x=1795166677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UhE6+E+dvkjePL1nvDRhX6rZF7d528b2tAmJD4DrfCI=;
        b=kR6hD5ZLjQ8JNGeSOcjVJhiU6uar5g9npPqHI6kJPqng9hr0LyXRPSgfOkjHlQUCoj
         UJmIV9WB+BJD9EhdnE0Xu+oFND5G4qS9xdfS3+QTSQYjox2FfT0dJw4fZdRkRwFDRar6
         Wu0U+rqNfvM7jEmE2vba06Isd7beJftvWbSpaIuq0IF0B+Z71MY+ozOGVfJiXu+Gf2WU
         5BZX+yqPh8GaaK6Ezg25YzZNXRXJZYbPLETi+2LpWyxuyGLlq/QvJMcKP4nNXul17Km9
         oO3z/r0yHYIXdYz7Cb4q0Wv5PcLb4iiCjms5ThdQfQiFIU1huO9b0IW1i5XOWnF9Klbd
         fxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561877; x=1795166677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhE6+E+dvkjePL1nvDRhX6rZF7d528b2tAmJD4DrfCI=;
        b=Mg9+T7y8GACE17tRgw1TUDv2yJWkphBtxwLe9W+D2W3iaCS/X00AyqcVxbJYgQXzm9
         3cIsQScDGt9dAHH04DNUEkAd40Y9JJla3LUNHQwsehdi/C+z5vcGI93a6D2XjFsoFMwS
         zqO0t3ntVy+18ABDLoRCRwL/qDOACal9sN3WHdRQSpOjO0Tz5iM16eIW65249GdH25AK
         hEmueXdbUEsvIxQBfFpFq0CvEftxquhKNRw2UVQi5VyR6iWjWwInUP4wi8Oy9a+dTyzc
         Dku5IyobfAlZmakaOWc/BQ+wlGs/1Hig0ILRsAJfs6MArXxSr7qRVRhmRG7eu7Q3g7KW
         Ls0A==
X-Forwarded-Encrypted: i=1; AL+hErHkz+yzHTVO7d7NL/93jHjrmxn1IuVPSkSRTJ04vpyUt9pzLb8G3si2gQQYQA9gSfsnfFtfS/E91VyI8o4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b9nJvyqWOgdjc1rEFZVfVNLKJqC0sWKoDvT876PL9Gh2NOwqi
	6FGhEsQvvEVA7cSHF3Ev1dFwdzK6UMMcHHKja5kku3ecZ6gdn2hr98llFsCJd093esOIBKBMkCA
	aAbIz+YjauzBpegYORWy9AdkG8MuT2YS+NBByH/pe0DsiRSTdTmUKD0/ZzGttQhRgr+fXlkXUV8
	OYRWpNgxT/VumH5QS8Z8QGlZhCiu9htkV0YC8HjAL4DsG+oRRI6A==
X-Gm-Gg: AYBFou18yofUqfFVYj1VYqMz7TdWm/Vi/4pFDXvn/MjTBg6gRIh2vOis6BNv6bxzTlo
	u8NlFVqS8Z1vktTjE9xgUEMDxsV3xeqMoWbMKFeCUiwPb0pMnKrDwHLz0mDGu5LagK8sTvDR3tf
	NrlEY9aHrzqwjCoX/PNty4qmfQxPoUfs6eQ20NgvdkG6cfzNpZUTO9vfQ+MomOLUy+znPpiv9X2
	yiwbaouK4/juRahLqEHYFuQ1rtvk+t0nw2Rg6OersMxzY9zoJac77fn2JiVTOYFzsViIGJOQ9H7
X-Received: by 2002:a05:620a:4110:b0:93f:2cf4:e6dd with SMTP id af79cd13be357-9494bc2891bmr301535685a.51.1794561877100;
        Fri, 13 Nov 2026 01:24:37 -0800 (PST)
X-Received: by 2002:a05:620a:4110:b0:93f:2cf4:e6dd with SMTP id
 af79cd13be357-9494bc2891bmr301532785a.51.1794561876585; Fri, 13 Nov 2026
 01:24:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com> <20261112-10k-sdio-crash-v3-1-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-1-24f03f300bb2@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:24:25 +0100
X-Gm-Features: AclHuK_hWgvOcF4-vUl_u6aNROFwx2WEFwACIACntrI_XmAAh3LwfT2j2M9oizI
Message-ID: <CAFEp6-12bAc5YoP7BaP-GENQsNAifXVxehpdPUu2pi-X8hfC=Q@mail.gmail.com>
Subject: Re: [PATCH ath-next v3 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6d755 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=4gFQjZcglls1U0HB3AkA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: S3jI0WS66ZsHUFlrLi4aDK0PUdAVgsse
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNyBTYWx0ZWRfXxOuNGUuVjd6v
 YX7E66eATLJC7MGj5uIbcA+4uMpvn8YdN8zShxKrLD7+RfZMp2p8voJUVdNQEMg7iI4ba8jMCbr
 7AHGoKjQH4z0OfFqDU9OOvQ4yGowwnn/LjHoVC0vX8Ium5kCGn7gLCXgboXl47VDgxl2YRhm9J+
 jXvdGt2WW1Pnu3pocCAizhNMBoY91jrQ7cHUghIqG20rWAR06XiAJklqsqRIYUNIuhKWeKeaiv0
 AgwKedIfM4VLbPzsxPvcQiXBOIGhbQNJ+J/oZy7CoV4Qr3YKrIcKIMpE4w/J6osiXu/fydt6Yn/
 kyVEMumvVbgXjTIHFiij6HyhGuZotQn5jt7pWCIYoPQzpa8kzDnw9Eii8YGt9E2riCq4jJTZtQ5
 wCx26K/5FVX0wG9wzf3rJnIEEx7YUKoaWqQHiSbHountO9pllLUR6yvAZNGaio1gyqf6fgnBlPH
 hFgE21chzU+4QjyiOZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNyBTYWx0ZWRfX7TW30yMh8sPT
 9Dq9T3eqsfFLloCtc44XNMTekKGgluoKOZE6mN6UtjvMUoMvCaywL15NUZXxt9kR8uPle8wKSjX
 55SCvLkpRxaZam/jRYx1YqZG0ZiM1HU=
X-Proofpoint-GUID: S3jI0WS66ZsHUFlrLi4aDK0PUdAVgsse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130037

On Thu, Nov 12, 2026 at 12:26=E2=80=AFPM Kang Yang <kang.yang@oss.qualcomm.=
com> wrote:
>
> Recovery monitoring runs on workqueue_aux, which is also
> used by SDIO RX dispatch and WMI SERVICE_READY handling.
>
> A single firmware crash may generate multiple recovery
> triggers. Recovery detection currently handles each one by
> waiting for recovery completion on workqueue_aux. On SDIO,
> this blocks the same workqueue needed to deliver recovery
> traffic, preventing recovery from completing.
>
> As a result, otherwise recoverable firmware crashes fail
> with:
>   ctl_resp never came in (-110)
>
> Treat duplicate triggers as part of the same recovery attempt. Use an
> atomic compare-and-exchange on pending_recovery so only the first
> trigger starts restart_work.
>
> Convert the recovery monitor to self-rearming delayed work. While
> recovery remains pending, the monitor periodically checks its state
> without blocking workqueue_aux. Cancel the monitor when recovery
> succeeds or the device is stopped.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new =
work")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 71 +++++++++++++++++++---------=
------
>  drivers/net/wireless/ath/ath10k/core.h |  2 +-
>  drivers/net/wireless/ath/ath10k/mac.c  | 13 ++++++-
>  3 files changed, 53 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 7c2939cbde5f..82bb0bb72dc7 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2493,48 +2493,54 @@ static int ath10k_init_hw_params(struct ath10k *a=
r)
>
>  static void ath10k_core_recovery_check_work(struct work_struct *work)
>  {
> -       struct ath10k *ar =3D container_of(work, struct ath10k, recovery_=
check_work);
> -       long time_left;
> +       struct ath10k *ar =3D container_of(work, struct ath10k,
> +                                        recovery_check_work.work);
> +       int fail_count;
>
> -       /* Sometimes the recovery will fail and then the next all recover=
y fail,
> -        * so avoid infinite recovery.
> -        */
> -       if (atomic_read(&ar->fail_cont_count) >=3D ATH10K_RECOVERY_MAX_FA=
IL_COUNT) {
> -               ath10k_err(ar, "consecutive fail %d times, will shutdown =
driver!",
> -                          atomic_read(&ar->fail_cont_count));
> -               ar->state =3D ATH10K_STATE_WEDGED;
> +       if (ar->state =3D=3D ATH10K_STATE_WEDGED)
>                 return;
> -       }
> -
> -       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar-=
>recovery_count);
>
> -       if (atomic_read(&ar->pending_recovery)) {
> -               /* Sometimes it happened another recovery work before the=
 previous one
> -                * completed, then the second recovery work will destroy =
the previous
> -                * one, thus below is to avoid that.
> -                */
> -               time_left =3D wait_for_completion_timeout(&ar->driver_rec=
overy,
> -                                                       ATH10K_RECOVERY_T=
IMEOUT_HZ);
> -               if (time_left) {
> -                       ath10k_warn(ar, "previous recovery succeeded, ski=
p this!\n");
> -                       return;
> -               }
> +       /*
> +        * Pure monitor: only ath10k_core_start_recovery() starts a fresh
> +        * cycle. Bail if there is nothing in flight.
> +        */
> +       if (!atomic_read(&ar->pending_recovery))
> +               return;
>
> -               /* Record the continuous recovery fail count when recover=
y failed. */
> -               atomic_inc(&ar->fail_cont_count);
> +       /* Record the continuous recovery fail count when recovery is lat=
e. */
> +       fail_count =3D atomic_inc_return(&ar->fail_cont_count);

I don't understand why we need so much complication and the need to
count and restart this work again, why not simply scheduling the work
or a timer at the final expected timeout instead, then if we reach the
timeout the device is simply marked as wedged.


>
> -               /* Avoid having multiple recoveries at the same time. */
> +       if (fail_count >=3D ATH10K_RECOVERY_MAX_FAIL_COUNT) {
> +               ath10k_err(ar, "consecutive fail %d times, will shutdown =
driver!",
> +                          fail_count);
> +               ar->state =3D ATH10K_STATE_WEDGED;
>                 return;
>         }
>
> -       atomic_inc(&ar->pending_recovery);
> -       queue_work(ar->workqueue, &ar->restart_work);
> +       /* Recovery still in flight; check again later. */
> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
>  }
>
>  void ath10k_core_start_recovery(struct ath10k *ar)
>  {
> -       /* Use workqueue_aux to avoid blocking recovery tracking */
> -       queue_work(ar->workqueue_aux, &ar->recovery_check_work);
> +       if (ar->state =3D=3D ATH10K_STATE_WEDGED)
> +               return;
> +
> +       /*
> +        * SDIO raises several triggers within microseconds of one crash;
> +        * only the first winner starts a fresh cycle. Losers do nothing
> +        * while the owner runs recovery.
> +        */
> +       if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) !=3D 0)
> +               return;
> +       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
> +                  ++ar->recovery_count);
> +       /* Start a fresh failure budget; the last cycle may not have comp=
leted. */
> +       atomic_set(&ar->fail_cont_count, 0);
> +       queue_work(ar->workqueue, &ar->restart_work);
> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
>  }
>  EXPORT_SYMBOL(ath10k_core_start_recovery);
>
> @@ -3727,7 +3733,7 @@ struct ath10k *ath10k_core_create(size_t priv_size,=
 struct device *dev,
>
>         INIT_WORK(&ar->register_work, ath10k_core_register_work);
>         INIT_WORK(&ar->restart_work, ath10k_core_restart);
> -       INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_wo=
rk);
> +       INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_=
check_work);
>         INIT_WORK(&ar->set_coverage_class_work,
>                   ath10k_core_set_coverage_class_work);
>
> @@ -3764,6 +3770,9 @@ EXPORT_SYMBOL(ath10k_core_create);
>
>  void ath10k_core_destroy(struct ath10k *ar)
>  {
> +       cancel_work_sync(&ar->restart_work);
> +       cancel_delayed_work_sync(&ar->recovery_check_work);
> +
>         destroy_workqueue(ar->workqueue);
>
>         destroy_workqueue(ar->workqueue_aux);
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index dfee432615eb..e8fcbef38ca6 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -1207,7 +1207,7 @@ struct ath10k {
>
>         struct work_struct register_work;
>         struct work_struct restart_work;
> -       struct work_struct recovery_check_work;
> +       struct delayed_work recovery_check_work;
>         struct work_struct bundle_tx_work;
>         struct work_struct tx_complete_work;
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 8e604697d6c2..3c45e5483b60 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5427,7 +5427,15 @@ static void ath10k_stop(struct ieee80211_hw *hw, b=
ool suspend)
>         cancel_work_sync(&ar->set_coverage_class_work);
>         cancel_delayed_work_sync(&ar->scan.timeout);
>         cancel_work_sync(&ar->restart_work);
> -       cancel_work_sync(&ar->recovery_check_work);
> +       cancel_delayed_work_sync(&ar->recovery_check_work);
> +
> +       /* ath10k_stop() can race with an in-flight recovery. Clear the
> +        * recovery state after the works are cancelled so a later
> +        * ath10k_start() can start a fresh cycle instead of being blocke=
d
> +        * by a stale pending_recovery that nothing will clear.
> +        */
> +       atomic_set(&ar->fail_cont_count, 0);
> +       atomic_set(&ar->pending_recovery, 0);
>  }
>
>  static int ath10k_config_ps(struct ath10k *ar)
> @@ -8170,6 +8178,9 @@ static void ath10k_reconfig_complete(struct ieee802=
11_hw *hw,
>                 ar->state =3D ATH10K_STATE_ON;
>                 ieee80211_wake_queues(ar->hw);
>
> +               /* Cancel the monitor first so it cannot bump the count a=
fter reset. */
> +               cancel_delayed_work_sync(&ar->recovery_check_work);
> +
>                 /* Clear recovery state. */
>                 complete(&ar->driver_recovery);
>                 atomic_set(&ar->fail_cont_count, 0);
>
> --
> 2.34.1
>
