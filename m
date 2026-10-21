Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792589654;
	b=ZPy0pAFlT9Ml4suPacc5QiGfZmPE5dlhPcUzj9WNPV7Miwarmqrw9awEbWJd8r22zk5e
	 k/QVLH7JYpzeiWNj1NyVWdESg0I+UHmnbxb5AkuTAqEFKNZHqVPyzvpednbxCMdKFt6Nb
	 Kf1+GRIQVwLMV5aU5n5WwpftQLoBS8dQnuWk/H+u8VIVv1X92YL86Q96/MC8cHF05pB4Z
	 pKwc9HG6jBBEz2RSgTtWimK++uc5jaicwSXFtQIsaWZxjbw3TmHapv3xWSZCo38HGimga
	 K5KL4CKbKaYMAvcxAgPq4Bz7XL+ZAGPfbwhF7VO5PrTPLwJ+i/PVlo6txuBXpaJam1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7aZJKBBBY7f354SWHV6eS9T5ynw5oI00kTa3Xc48uE0=;
	b=48G85Uzt1b/OiKoV5+rUf2lOjBhvT4RsktKgtxBpP1MpAv/HcwrP55AncOr1xHZj41ih
	 PZg6V0/ByQANsM/FJ4HjSrJvae66hrjtJAnbqWAxYUFm4CJYQqjj7x5pGWgl+Oz8COZCt
	 aVquGunPrV5SQce9DmoOHmFH1zowRs0smguxhYMJI63D4vmdsOqJOGjzt2D2q+k2Kqx4+
	 z8HsX6ju8jgZUTCSc0Rjx2il2zEPkFAYEYt1bfAtODkWJEXQDqQZtpdQSdtn/7oz7CCBK
	 AgAzQW4zV3KG0ITmidNWAbVWyy8/2r1XkEkcjKJReW9DlRveXSBDZmjqjVF0naMMvlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehaHJTA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kOq/RWwY";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6A9606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6A9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehaHJTA+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kOq/RWwY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDIOCT3869190
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7aZJKBBBY7f354SWHV6eS9T5ynw5oI00kTa3Xc48uE0=; b=ehaHJTA+w+NuNV5s
	4mGLRcLLchz4wx3FPm4+pwJ3zKOYbbHwwy0t012GZBEP0JzJF+epATo8AKQyHGRA
	1sdwBnJeXvabaHxUQxK//WsjJYPd5yvDeODGrXDwlGYZJvkn+rm0WJCRuJKoMIvv
	Zw1LeTuPRXWymc15QIg/ApZBHfncfeiBvh/moLXnEj2WvVLamEi3D+1UGGtAwGaK
	jGF/d7KQcTYWhEiYYU13npdtgOqQ/O+WfCV/ubDduDd+AW4OdD4fbLH1F2Nf8Vdb
	b4vCk+41mmtLj9CqFbavJUhag2LkDrxo1g9IbIRuHDg9lyIZzCpq/bOmpwgU4e8/
	z/6Erg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q82k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:34:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so243027485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:34:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792589651; cv=none;
        d=google.com; s=arc-20260327;
        b=MCxc6UJN7HZlRpAQ/NcP8JSUu6Zjam2/9ciocUxYnCKTEp1N+UnoVn/1H0oqnH4jkM
         zONBh7/FKp3aiP917H6nVkP0T5ZIP3L6Q651zcs9zBCdEZEcqbWIIezjz9WDw+GAfQQZ
         wsLkdJ3tWfKjM+F4SUFcE9s61nGYQyyM3lrbo9SrVpvUbmEHox/4bdmrs3cpGjDyLHRp
         c3ZFZTJz90CqflVbVhQmyU6GJtnib5QLZ/w8X3bDUwsg1h4XK4HX8JDHSHtBSKBQPTKp
         l66IhbeZjk6bPgInsytaqpuDSzcyB6P7aqDdjPiKvnN+HoVBhtH0x17nXdWHiD5v5CWk
         5zpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7aZJKBBBY7f354SWHV6eS9T5ynw5oI00kTa3Xc48uE0=;
        fh=NpCiofaH75XBpIJ8c/YLwK2rLPO4tvuWVKCaY3/z0ls=;
        b=ofAKWofr+t3wMDcRisx8u3Y2D98olkQHe/zqBHSnnip2mg91F3v/AF9VlZNCujGGQB
         GAoHOvYTMcPHU7RC20l1ZBeqxw9lvUhYxrOl8MNj2aQFyBC3/6gi+j3qEOUOnicEaVu0
         fWwNivO/JE7KnBDvUfTH8T8+KKd9B538MHoBZ3bXhidNA34xXSqfmegxGDS5ZpJN5Yrc
         9NJ3XDg5O011TH706AwdABe7975W5SaOP8frQd1EgQiM8fXT9/KyPi5+D/ewrmhHzGmz
         9SKDihGjA9HtU7XpMuRurZOCy+xej+qUnLwrPv60ecb1RCUp6e4UKdfLl460DSRcaJiL
         jxaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792589651; x=1793194451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7aZJKBBBY7f354SWHV6eS9T5ynw5oI00kTa3Xc48uE0=;
        b=kOq/RWwYHt3hsEtbu/JiyadZgKs64wNlnWC6LrxpgT5VrWgH3oPfXpBi9fVKP8iVoL
         9+PVK6qBAx3mtNjtZb5Ey6QT8nexMDBATjDBk38WNOxySBlTIUkZmIFoG8h7omi6xpEq
         pd+xhOkIUOeNYIhj6iqA7ZMZu4cuKWIkpCNix4yloRGTsWTHV7wk8mAsZ4md4fK21Rr9
         xRe6yGuhiyaxLNG+yOLtXJnHa0su3NjbibHAjx1j5opKTvPJL2bW4m1gYgiJkYKuMdJF
         55olQrk/H9+S/n5rlUV99Rv1ihD1dPynPMtFlXADgRd7vMlulaFJGghSUmyIukMUIE7A
         3gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589651; x=1793194451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aZJKBBBY7f354SWHV6eS9T5ynw5oI00kTa3Xc48uE0=;
        b=Kv43IRU0ATPQeCSXNMNVn7CNLK0sge3UdEmCtfERJktSrK088+mJkVpWtcuGUR/mv6
         mHsejIs/TYG5pfb41rGcUWwFDjJix33S8RfJ4Wdcmgb1AsMSGUT6hp4YphPzdNJi9XRw
         OGJeWxyJLNcqhp7aN0cuHryB4T1aSIoSgf0vqDdXcsmXSliVlP69ltVpzWzrh48LXKRn
         P5+Hcip2CW2I5hcgbOv1HrIDQIkpkpzmBS85gWdZFE9RU++gcuZ1nmbv8QNqVOw7JiBZ
         fik2F9OsYdZNIDQ7bm7S3wqj/WCi3DdOsTySMVDhv775QKMXXbkvnIQGVvieC13KUR0h
         YF+g==
X-Forwarded-Encrypted: i=1; AKwUvBwvjQ1WEmGc0yN0qCe2JLyqy87vJKCoHV70IrcNdsIaR6g5qdDKdRV1BzMUT0CfglgUOsP6bjCF375EJWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmReOnxd8IDCUpL8a0SZ+OwRK/IjKkMUtDZ92oz7GDknNmTkX/
	hOFcUZEnmog2kb/2Eel7fwxRNpezPzFLHVT6ciw3amWV0kScmEBBbwzf5D5lsdiaw+bRtuywLw7
	QMHay9HRFM9U6RdTeeDbOT04H3gfQA56CvbXZdTGNX/NNpnxqHkbuLMUJefsjgcmQRXgfZxc9Kh
	SZHCNQBgER8LyJqSkAr+gVrePg7KSZjFvG4OEImNwYAA==
X-Gm-Gg: AYBFou0cf3mCgRqNOUJfFiTQP25oCUQJZ5oNy6TCpbGfe+IxiAnOhpUXdN+C78uIbNy
	S3XYVs+n9JxU4mvlQLJCvvCnHax9L5GSPgiSbslm3PYYt/LwuK/NxW2j+Uvx+2JxXX3xCtZi/Gg
	nqCrRkTraWukaJfV0YEOOCSXNrEHMITb7F4Oa+FbdUQYVuO+7HEXU2MQUQX+LXZTv25mVXcwb+H
	I/AiVpGEcXzCFrV5Dt9KbwtMPj4poRJzPu5g6XcUaOxdALAhZB7OvKlc5I85DavTcDPbTl+458=
X-Received: by 2002:a05:620a:2788:b0:93f:3576:d43c with SMTP id af79cd13be357-93f57f1efc9mr420299985a.19.1792589651256;
        Wed, 21 Oct 2026 06:34:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:93f:3576:d43c with SMTP id
 af79cd13be357-93f57f1efc9mr420291985a.19.1792589650530; Wed, 21 Oct 2026
 06:34:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com> <20261021-10k-sdio-crash-v2-1-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-1-5df80bf16e86@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:33:59 +0200
X-Gm-Features: AclHuK8a62c-CwhTvVQDCilzI1eRkbIH_HPXo0xCOe3rMO-oFX0aKFEfCQjnEyI
Message-ID: <CAFEp6-3UB=U16NkQNM_H4gUA71XWvYLcmcO_mJhFpX=9yC=HiQ@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 1/8] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MiBTYWx0ZWRfX9yFrzK6r4GPI
 GKESNxzYTLn9DIlkdbj35Xlg8bwUggnrCkH7FYTUhhW2Wond+aBxOeEb/4ruSTEmE5latWqEN/w
 SFHv0igkWe/mahI+eV+1FcC4ZSEFtuc=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8bf54 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=HbN7EbVxkcm7v0jztH4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zuOiuLCDMLky71HRBTB1kdgX01V8pXdR
X-Proofpoint-ORIG-GUID: zuOiuLCDMLky71HRBTB1kdgX01V8pXdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MiBTYWx0ZWRfXyije/oj27Dd6
 LyunOfmUQdfikIWTBYibUj/dphWu9rJHQ0HseKCmM2CZ5mqWltPIcPLmXBiBja/ORr6bpwFlRXj
 oQmY0a9lUTO1/Sf+q2Z1L5q437vOM6mb936c+Xt2gQ8pDcCfaeRXy6RfxZci18/PlBYUHNVquFg
 9rUTU51EM4PafyUnkRUBYK+VrH2rs7zYawUYnWjVlfLpVRKr8ZoCoFSI3wbIGEqyGb0yJnpy9GB
 cfb2mGm5RJ2432MaS7l2IbuM/yBvIsiVwyVsf1S1bR+UsyZrHFCCRIZJWTC/o6qGIMHOZsUa9ET
 zkTrHE9BD9QOFVzJA8/TdnV+pW6GslAPDIvUDz6ZfTNFFWwt5p/Lt/a2iJeEplhHencqXKA3ugz
 B2Kc/rN65o4EZ2i9QBGlr6P8a+i5VPj/PnIVqRAC5CxFPpnPaBJ5NySWX3CSz+DPRktP8OyjMZ9
 u/2iH9Ly2vCLg+zZJVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210052

On Wed, Oct 21, 2026 at 11:09=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.=
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
> Treat duplicate recovery triggers as part of a single
> recovery attempt by gating recovery startup in
> ath10k_core_start_recovery() with an atomic_cmpxchg() on
> pending_recovery, and by making the monitor path check the
> elapsed time since the attempt started instead of blocking
> on a completion.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new =
work")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 64 +++++++++++++++++++---------=
------
>  drivers/net/wireless/ath/ath10k/core.h |  2 ++
>  2 files changed, 37 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 7c2939cbde5f..07beefa06c4c 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2494,46 +2494,52 @@ static int ath10k_init_hw_params(struct ath10k *a=
r)
>  static void ath10k_core_recovery_check_work(struct work_struct *work)
>  {
>         struct ath10k *ar =3D container_of(work, struct ath10k, recovery_=
check_work);
> -       long time_left;
> +       unsigned long recovery_start =3D READ_ONCE(ar->recovery_start_jif=
fies);
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
>
> -       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar-=
>recovery_count);
> +       /*
> +        * Pure monitor: only ath10k_core_start_recovery() starts a fresh
> +        * cycle. Bail if there is nothing in flight.
> +        */
> +       if (!atomic_read(&ar->pending_recovery))
> +               return;
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
> +       if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT=
_HZ))

You can use time_is_after_jiffies() for this.

> +               return;
>
> -               /* Record the continuous recovery fail count when recover=
y failed. */
> -               atomic_inc(&ar->fail_cont_count);
> +       /* Record the continuous recovery fail count when recovery is lat=
e. */
> +       fail_count =3D atomic_inc_return(&ar->fail_cont_count);
>
> -               /* Avoid having multiple recoveries at the same time. */
> -               return;
> +       if (fail_count >=3D ATH10K_RECOVERY_MAX_FAIL_COUNT) {
> +               ath10k_err(ar, "consecutive fail %d times, will shutdown =
driver!",
> +                          fail_count);
> +               ar->state =3D ATH10K_STATE_WEDGED;
>         }
> -
> -       atomic_inc(&ar->pending_recovery);
> -       queue_work(ar->workqueue, &ar->restart_work);

So we are not re-arming anymore for additional tries? or I miss something.

>  }
>
>  void ath10k_core_start_recovery(struct ath10k *ar)
>  {
> -       /* Use workqueue_aux to avoid blocking recovery tracking */
> +       if (ar->state =3D=3D ATH10K_STATE_WEDGED)
> +               return;
> +
> +       /*
> +        * SDIO raises several triggers within microseconds of one crash;
> +        * only the first winner starts a fresh cycle and stamps the
> +        * deadline. Losers do nothing while the owner runs recovery.
> +        */
> +       if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) !=3D 0)
> +               return;
> +       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
> +                  ++ar->recovery_count);
> +       /* Start a fresh failure budget; the last cycle may not have comp=
leted. */
> +       atomic_set(&ar->fail_cont_count, 0);
> +       WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
> +       queue_work(ar->workqueue, &ar->restart_work);
> +
> +       /* Start monitoring after publishing the recovery timestamp. */
>         queue_work(ar->workqueue_aux, &ar->recovery_check_work);

So now that the recovery check is no longer blocking, it seems to me
that this could be implemented as a simple timer (alternatively, a
delayed work) as it would avoid having to perform the timeout
calculation...

>  }
>  EXPORT_SYMBOL(ath10k_core_start_recovery);
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireles=
s/ath/ath10k/core.h
> index dfee432615eb..c739fbadc8bb 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -1215,6 +1215,8 @@ struct ath10k {
>         unsigned int recovery_count;
>         /* continuous recovery fail count */
>         atomic_t fail_cont_count;
> +       /* jiffies when the current recovery attempt started */
> +       unsigned long recovery_start_jiffies;
>
>         /* cycle count is reported twice for each visited channel during =
scan.
>          * access protected by data_lock
>
> --
> 2.34.1
>
