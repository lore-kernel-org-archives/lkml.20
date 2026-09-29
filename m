Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA834FDE47
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698294; cv=pass; b=pv4Dl1cdSNFL8QtE7BYitIeUI1p4PrreCPoNJoqn5Na6o0MW0NRMxETJxIGUS8oxAxmO/brK5iwyoneSXW2K+UDdzX747Xkm1Wt+q1DRjJPj1oM2K0sp+URE2hiHkccw2cza0PfXkGo/a7L6lXRl4MTjn2lPs9d/wMdbUKY6r4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698294; c=relaxed/simple;
	bh=zphWntJMoTU0hz4UI+cFhP2BQarVUJCuS+q6K7szyuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ncQXzxRgx+TUxRjE7ui74P+at+DydAHyMq2MPh2SAxEcahmYyR/TRUf99hHad7xdYbxh5LdzqQsvXM8G7GB9GGLJUrqNwpDubhvlNchNyayOd7PJjQW3CQx0ipthxgVkE130M1Um/AT8GPM3XVctJKpf7Mi9tWgC42u3fV0yR74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aj2nl+y8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WDUgTWGn; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aj2nl+y8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WDUgTWGn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE67jS1649672
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJy0ahWd0XaGUEphe2afeC6dCP3o9esmii2MCwrad+M=; b=Aj2nl+y8KxtWdZE8
	+qdWDHad+Yi+SRNY2tyW37v7NRHV40tbQ4W6w29fTc8h2v0ACAVrfb7Nkvf+d0rN
	j1iq7IHb46ANIldXzXrKNalw9oGs6MqP6TGQ9SJpy4HRTZgtVNiF+BFS0lwSob2I
	T78u3XDpUIc3+9BFL4M4WETWd6XvJGf1e5rTP/sARa+ic8ty7ykoJ/b2BrbOryP+
	GmqDDItZtcRwItmz+bNX0xsTHiC83eW6gjT2djkivcdMeFBeTwXr11J4Njtci3oe
	raysUqpFEJfjB2uDyXUFckw2igIoBcK4qQxw+GVaX2wb74JSWsGJmMSMbXGRXOUD
	WLFDEQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0et28kas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:11:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313b1501a0aso732594eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:11:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790698291; cv=none;
        d=google.com; s=arc-20260327;
        b=LPwW9CHVGNgCzgzBfmJRJ+Cne7ZDo5OVz+ZllTI4S4KbOZvfGcp3h14sNNCodvQEch
         oRe0dwqsFsPZ6nUDveJUhkMJ5bgRArw/+LC7aceGGAMFweix/v0dw9Xvw7eJgeTpA3EJ
         EE8clYyAI5NeL3qPkUEGCWumQtK5S1ZSOW87nc7Hy8yeJVdk7Njr2EvEIznSoLrw7BBl
         o3Wd/ThIf8jqDbvtVk9bgRPVuvyr7h31iCW5tOGZ2a1G3mDUQ+dbV7eXeHbUDK8KT36c
         fu9q2Cy/guR9Crtqaf76zDsAC4fAzwh4IFpCdMBS0+Oagn6rwIaJts0Wb7AS+3j5xiTt
         InFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qJy0ahWd0XaGUEphe2afeC6dCP3o9esmii2MCwrad+M=;
        fh=+A+x5Z9t4h6yUUv+r6yPM8deU+FrR8q3dHwoKBlCmiI=;
        b=jKZGlUHcV/9lkgeVllumDj3MuKbP8DxeK9YVduoaJfWtovvwkFo07RUWS6sDz0XBhb
         wMSOpuwc8OUWVC9H91GxedSHjCYS2ZNYNuiNViMAuwR4rvHgb/rIyBwCDEKy7Np5ksFr
         lwgbntMDFijxCeD7rYP6Am+2vX+pDbe/AeDZNcGtnU96SriKgZJjpCKnBRCe3xXmJuyS
         S9cC2LLIb0BXgkTlmHr/F3QrLbinftLl8HSoz8BmeU6WKxfGUIYkm6MTGtyKq6vSaURC
         U6fagqfBchlDu0ib/PGFp7rxeZyCWiWQ3jYsxEunrTidqkGSmHAoiEkdDOawGYJ5+i3d
         ONVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790698291; x=1791303091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qJy0ahWd0XaGUEphe2afeC6dCP3o9esmii2MCwrad+M=;
        b=WDUgTWGncZKGIi0XyESF95x2Es3BVPniBp3XNB0PbX23IX/oYoa0kxbCgjDzEsLDro
         O5jguxe0Sh4H07jtrTifORwtd3K3kCalGzT7Cre+fwybaVDMp3YKBijBjUH6Qodkup2Z
         thZ0Bzr77egItfsiQKyec8tRPi+4JuG6MgAJV2CWV0uHDGlYi1ZJefLgYZQsmH9C0lMC
         D7iUNT29qilajbk/dpGjPXFqviHMVj/oxWfrLTHAeCdlY+AcBjVDRhs4RMS6x4BCSr5h
         UQttLqg/5tCcW8cv3InLaCFAjatAQ/6upH9/Q90pHn9YEYPU1NhBNWeqU5kdY7jfSK7p
         pMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698291; x=1791303091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qJy0ahWd0XaGUEphe2afeC6dCP3o9esmii2MCwrad+M=;
        b=2Z3EBiPZOGNao6zxGY97VI5g5JF5zzcs/TyFirCBRgRQ02vCsZEa24T4jfz1rE1OHb
         OjgFmaw8ZQRsFxmswDjF+54D+8fXDJk77kxyKqQ5kew7DArLHxsJQUxDQsqT0G1y9qO7
         /MtME/I3VuBq2uWneVehgdnE89UGd6R4L6ZCoUpuxJ/Wi26b3wO97pxG9HCC+4mG+YN+
         eOyXCaqeLCxLXsvoq0JwWo2RnAqWYVQ5PmODMS58/WQVafEHs7f/fhxNx5KLNI0BpBAX
         Xh3DWBpAhW721CkSG2frbY5kj0ZztjYlodMCzd3/gy9Qo32qlsgBG1iIeHVwiUYYW6LF
         EHXQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5JJ8dBRYpN3wKu/kHlM30fiqKZlCeH6uKWgWXK5wCktlLmtRHXfOz5RoLNtBQk75vVv9mQTNuc1Ch2u4=@vger.kernel.org
X-Gm-Message-State: AFuF++mVNtSJR1BwKpO5gihnZtxX300c7oRUDRWJBQgwAjj5x5ks00vk
	x0vBOY7Bew7Kn/Js3pUa3VpRkC/6eq1buE4v2LJvbOrBJjV5cZcVsPW8VUTK6Q9uAeGdGRK0dUX
	kC/cXPissMLo35hmelt3HWin9D2rApWLyetrj5dhV6eEDihp1FQzciDF972tc2ERhD5XzIaTTSZ
	iAQxKFb9QG9XT9EgIcU7IoiGWXQ9Vxv1AbvOddqPtqqg==
X-Gm-Gg: AYBFou2FK7GT0nDo/wegeaI0NUkKXRaUOwvrwMlCnC7H7Jf7qk10jGFY03k6wqZADW3
	CAIcmx5m9/qcWzorHf/U5Xe1DWBrJtvXCSve3vGLKXsALXYbU6HaTc8DCfd1g+s+PYk5OoY5bS2
	GMSFk+GxXLcIlMK7gD38IVR14blVnmyRxpYJYn0BG71xJuJjHKAJQjmaYtIsFNjCnENi6Eziz5D
	pGu/oN4OiRKhDHZG+o=
X-Received: by 2002:a05:701b:4542:20b0:139:81c6:67a1 with SMTP id a92af1059eb24-146cf7ee6efmr21646726c88.1.1790698291250;
        Tue, 29 Sep 2026 09:11:31 -0700 (PDT)
X-Received: by 2002:a05:701b:4542:20b0:139:81c6:67a1 with SMTP id
 a92af1059eb24-146cf7ee6efmr21646648c88.1.1790698290460; Tue, 29 Sep 2026
 09:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908135319.754140-1-julius@bairaktaris.de> <20260908135319.754140-8-julius@bairaktaris.de>
In-Reply-To: <20260908135319.754140-8-julius@bairaktaris.de>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 21:41:19 +0530
X-Gm-Features: AclHuK8I2Y8Z38X2skQxxlHpAPaU8tbrT2ff2ker0EVsU01MrqsPdyvez8x7uGI
Message-ID: <CABkEBKa0pEB9cL1+yoOF0OQSkYb7T1ji36oJ3sVYYV+Nc-_dcg@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 7/9] wifi: ath11k: charge received airtime to
 the station deficit
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, toke@toke.dk,
        sven@narfation.org, quic_vthiagar@quicinc.com, john@phrozen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ggm3AzS6YuVTljXeM2H-XcDrO83aWiXM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX5AGwoB+HRuKo
 PwT6O6IxmaFl88QTEmirp4B1Tnjr3zcgSzYEv1cEl0m5IRj66BRaquoooYp2oC+9zYpJmy0JclF
 7s9I6Hi1tEl1Ufo5TMSUG9DiqfUVAdWX4sGzES9tnZw8Pzz11Wgq4kbpqKtq/1cTnmSNhfxKuRt
 dSg3Mu5N6KU7sR3+muNVuD8ZOrzD0EuzKewFMK68T1GsbGvHZhzJj9AKV2LKDDrh68un/+jBbmR
 yi/4ZN17aOVC/Ji3VcQP6Kf1EXO6lytmkeunVbHQP2QCvKIfuwvtqakIIz2kxuU4kLJcntj8f9F
 w8aF7u7fmfrfAEVhwq2FOtBcaoh7IWkN8zr7fLNPuDqGXpqpdA5QN/evyZFiTKPyeoNz8in7+Gm
 hMQezj0IGPuoK/PoUS2aU3Ge3O5JPFyfsCcE/lRq0tY4N3GYFKaA/Llk3kl9U/xtoIY+NCggSwh
 lRdx/5QKmzJKunFn5Ag==
X-Authority-Analysis: v=2.4 cv=cokOAF4i c=1 sm=1 tr=0 ts=6abbe334 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=ISQwfr-Fe-Q9zp4uqk8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: ggm3AzS6YuVTljXeM2H-XcDrO83aWiXM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfX85bhuRWM73Bl
 heI7GwiGHYB0afwAyzOqK1uApZuG4zNDZhzgDOpGzL9ZmkfAeG8wp5KZJkR7hzPp8d/YOtmrqeH
 Rx8l2eoLJaOLHhxHpe/EQZ4/uT8uY7o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290064

On Tue, Sep 8, 2026 at 7:23=E2=80=AFPM Julius Bairaktaris <julius@bairaktar=
is.de> wrote:
>
> mac80211's airtime scheduler is configured to account both directions:
> local->airtime_flags is AIRTIME_USE_TX | AIRTIME_USE_RX, and
> ieee80211_sta_register_airtime() adds the received airtime to the same
> deficit the transmit side subtracts from. ath11k passes zero for it, so
> an access point serving a station that mostly uploads charges that
> station nothing for the medium it occupies, and the deficit that decides
> whose queue is served next describes half the traffic.
>
> Register the duration the hardware reports for each received PPDU. It
> arrives in the RXPCU PPDU end TLV on the monitor status ring, which is
> subscribed for every radio, and ath11k already accumulates it as the
> station's rx_duration. Charging it once per PPDU matches what the
> transmit side registers, whereas an estimate rebuilt per MSDU counts the
> preamble and the interframe space once for every subframe of an
> aggregate.
>
> The PPDU end user stats TLV that names the TID is not in the default
> monitor status filter, so the airtime is charged to best effort, the
> access category the deficit arbitrates the bulk of the traffic in. The

This means the resulting fairness accounting is only an approximation
and can leave VO/VI deficits
uncharged while accumulating all received airtime against BE

> call is made after ab->base_lock is dropped, under the rcu read lock the
> loop holds, as the tx completion path does; base_lock is contended by
> every tx completion. A PPDU from a peer with no station entry is not
> charged to anyone.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wirele=
ss/ath/ath11k/dp_rx.c
> index 68472e1e748a..a7b9bb295728 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -5270,6 +5270,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_b=
ase *ab, int mac_id,
>         struct sk_buff_head skb_list;
>         struct ath11k_peer *peer;
>         struct ath11k_sta *arsta;
> +       struct ieee80211_sta *sta;
>         int num_buffs_reaped =3D 0;
>         u32 rx_buf_sz;
>         u16 log_type;
> @@ -5324,6 +5325,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_b=
ase *ab, int mac_id,
>                         continue;
>                 }
>
> +               sta =3D NULL;
>                 rcu_read_lock();
>                 spin_lock_bh(&ab->base_lock);
>                 peer =3D ath11k_peer_find_by_id(ab, ppdu_info->peer_id);
> @@ -5337,12 +5339,25 @@ int ath11k_dp_rx_process_mon_status(struct ath11k=
_base *ab, int mac_id,
>
>                 arsta =3D ath11k_sta_to_arsta(peer->sta);
>                 ath11k_dp_rx_update_peer_stats(arsta, ppdu_info);
> +               sta =3D peer->sta;
>
>                 if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
>                         trace_ath11k_htt_rxdesc(ar, skb->data, log_type, =
rx_buf_sz);
>
>  next_skb:
>                 spin_unlock_bh(&ab->base_lock);
> +
> +               /* The airtime a station spends transmitting is taken fro=
m
> +                * the others, so its deficit is charged for it too, with=
 the
> +                * duration the hardware measured for the whole PPDU, as =
on
> +                * the transmit side. The TLV that names the TID is not i=
n
> +                * the default monitor status filter, so the charge goes =
to
> +                * BE. Outside base_lock, which tx completion contends fo=
r;
> +                * sta is held by the rcu read lock.
> +                */
> +               if (sta && ppdu_info->rx_duration)
> +                       ieee80211_sta_register_airtime(sta, 0, 0,
> +                                                      ppdu_info->rx_dura=
tion);
>                 rcu_read_unlock();
>
>                 dev_kfree_skb_any(skb);
> --
> 2.53.0
>
>


--=20
- Tamizh.
