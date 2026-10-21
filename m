Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792590217;
	b=QPGB/qF+iPrmYSTa14m+7gtbtqP5SbTdMDkQwlDRciz7lKWTqE87ekfh9/dsKxjUJO4H
	 gij5vhZULXnlo8jvct5oHz8nRWWu8ucwMtQtjY8EmaxkQwYbUv3infa0RTS6fY+bE1kjw
	 Fh5EEVzP0A94PVyEYmRIsBA9faodLmuRJDQgEWF9x7fIS9W4KMekf8XEuv/wlTSgeH6fW
	 ZA++zK5uieAvQ4eABLP6QOHcfpR57lCtiXhLyTIvsOsK8MVEuZtSCN3+5iW/uZQ6mePom
	 9xKfesOq2rJbXs/ujnIgY9qz7n92tRTvn0zsXFWFiDHMdBwRTSUfm9vDNn2J3eXX/og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qUzcINOW4+vTzSj9EqdHh/10B+1ledKafSW+c2vSXlU=;
	b=A9Gk6tJLJtdPN3NMoCrfifSNXnwJeCMP9KONCP+XC31Mrxvbfx771P2AJblS+lkIv6cO
	 GoHQVYFdtSzg7puV7y8s2i8uJy7YSpxk9XCl+oK/7cQls6gFjYFomprtoIWyf7QJ5pZ8r
	 NynLr1kdImNLpb3xsd0AMjGLreX9BOySGXypsFlWkuAG1F3P5Kg3egP528f+oKBXxC7ex
	 oc83VAhBLk2ngFD46l5/opBIboI4efi9DSQA7QivEkfkgbc2XhKp3Z8rRK16fpVA+Iycv
	 e7O6xguLsWi9LBNDnomk/pTcskj3j5GXheZxVqKn16b8Gi5sKX1/zIvw9p6GsBFHdbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YURqYCE6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ukhrdi+3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD48606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD48606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YURqYCE6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ukhrdi+3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgt9N4168634
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUzcINOW4+vTzSj9EqdHh/10B+1ledKafSW+c2vSXlU=; b=YURqYCE6ackpOhgt
	Q4dmC4inkPlAj6q11OZt9J9E8juowMyGfttZC6P01O+cPJaOlSxrdw90bJ/BS8do
	LsOyXt0KL1ZAIVtX9q1/58nV7b6ZblI0bm19XNoG3qEfOEDm4ktz7lSwQX4XCblI
	3yJ4ihx8+V2TfZHQq7NcmcsA4VxB+6DhRb1sVa6IcjxIR6igwKCGRySbb3tNmoNv
	sCNPNXkTBtj/hVLJgGZmYoQnsI+nvH2JXuganjckTZ5pN7parSphiSjTm4xstfOr
	z+AtuePsy0ABC8yN5HsykReJ5h5jZ91/Oo4WPnXnd1sbIjaDK2Tqbd2fWdxoDTNC
	DpHwig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0m6kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:43:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso14420066d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792590215; cv=none;
        d=google.com; s=arc-20260327;
        b=Nimm0TPojGv+iZwcGvQi2rEhP+oyHboS+farUD3+BB0Ipk1cEdEdur/KuM1F8hB4RP
         whyNiLmNBHTs7zIFsYEFMKCpzH2Nxx3Be1oKzfvdar7GViT+jWH130toa/A+71OTbuJS
         4Lc/perBnckgRrN5xSJhhL7zJCXYSDOUtOTcfMOmnO3kBboywzd3srtdoTPchvICaOil
         eJdqz1J140usxCD6SrTwA6gP7P8c3v0w0XA3suzlJFfmbMRIIE3syGGvr8Py37Av4oRI
         5UQwhAxQdc+gF0I+92Q7DzkBSKSVbqmjgEpD29VRDFE/TTxC8JdhxetwHNxo6ht2v4jS
         Ykfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qUzcINOW4+vTzSj9EqdHh/10B+1ledKafSW+c2vSXlU=;
        fh=5fC4fAO4KJKPVjleSurBmbT3nKGhdQ8KDYOzhpsAA2U=;
        b=Q/5KU/t1p/OuKLnUrC3EiycpYxgmIuJ3MxDOZwotXWT2mjEms8rrb0zFfndQx33+rd
         5RToP7pZdGw/tJtUzehsg2wlFpF0nASCzWlFtVoFIkyzW6aTW70kJ4XDMkzqE5nMTDyH
         QIXqxIajJDCwLrRXyIuMhq0TTWb5QpDBtXGYaXA1CYc2Zdl/M7iF5fSitzL8Yflv3Lhd
         o5X82GlhIfL/fkyINN2dlQRCZPpo6HumePZefBib2NnMRlV9/4ISfpLUUJqeCCsad8LC
         qmv9CjeCW634YMKnb7yPqBfwpOjnjuMPy+6D0vJwLNqelQBuNWMhhRkQOqayePoi5OxT
         tWaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590215; x=1793195015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qUzcINOW4+vTzSj9EqdHh/10B+1ledKafSW+c2vSXlU=;
        b=Ukhrdi+3CDymJKBsr7qRxLyFmz65HQexmbOD4TMiKXQ6BVGD1vQ4SK+vVbziRv3yiB
         ePJdco2guvSVdFe0VnKvYhntm1Fo48vLm0MusTNq/Sk6RiLUs4AEC7MEcccS1rc2tsJX
         j0brdpjvwE3CY5W1XwsAEiVjb6mkokCWoU1+fEMiX6f73BQwd94G6tdhhnH3l/JfhFPP
         5TdBRm9z+/X3Bvg/kjAE1qekTAKbsf59wUIM3D0MpNYwJTV4ocn5/puWcRoMRdMNW4UO
         DeoIBvtQ0EFTcdzDKl0uGulfQtVkablX3KdqdvMKod8kppNRpU2gbx6CoogyxrPRUQql
         GMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590215; x=1793195015;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUzcINOW4+vTzSj9EqdHh/10B+1ledKafSW+c2vSXlU=;
        b=pGSR6pZww1TT96nVqIIJe2DaiVBHhBu+ezQHjCxGaknZi2oMMwgfOcDfqzdUo+KZ9/
         Ogdpc9BSMwM0xgm2ZiVDoAkt+khRVJ13ywX48QLjXgiYbaGxk+PCxc5RqZ5QBxVj0Wnw
         O4RQu2lZGQDj2mi/WXsTstLfd0y7hfasD0/p9mqUjxD4nNewVq+QiNIqnFmAnDUbn6gb
         aAvd1eKKywVYX3SG+/aBQrFdpTkRrOg7uPb2f1K9jt3sTT6Ik7Rc037NoWvV5z9ZrqzN
         Wpc0Y3ohm9QiqPrq2g0r/LaL+8K9O6RnGmvUlmMVWHvDVUsGLommbB9Gjp0lUHi8Ji5U
         7htA==
X-Forwarded-Encrypted: i=1; AKwUvBxZj2sUumQIiTDM4q+EIlXA8U3Vbi/v6YobXLavVWK1a9zrKJ4z9Rhm0SZMjY6TbbWCYLSZGBHRB/iVgG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYpbrzN6RUzr5I2czEtv8JkFCq+igF3CULqsVCYvd8DF6iEGOJ
	dQbuOVWiLGml2ZbGl1GjR1xpigLWiN0P8bmtG9w2iulOlMQYFTJ3uD/UQYn4PHMOHMyYktegDE0
	cmN3OOiuGHO41DFDvxB+fZhBFgTrEPqgdFFlrsU6allonYJuTpbjga2STxijnCduwUWh9AtihPp
	PY28bfL9vJLbIWmCb12YjMo2QR7/490tzlpvKUjWkmAg==
X-Gm-Gg: AYBFou2YA/NX/KO2UuO6ckxy3yY5wd8ZZAFXeCkZwZEqtZEmIlswgjsmykL+nPa1DsY
	wClt2XjoIw+K8GXxBCBtUk09+pGutEFnRTeNXYlrJrIThy0xWWsk7twdisbEzyRKHfEpY+KStcM
	yvqiOoBha1dgbqVMjyrf7kRW3lrEvSX7QbBtYNoWGdBOZyQhB+FxBZ3aQoSpqYa/6VodD8/Y73Y
	XtMolSUpfTnLVU8/AeVRN/D7V0S9gcGICRNbP8fc8gBS7W3YF+4TktRJmmf/sO5vsKij/Ml2eQ=
X-Received: by 2002:a05:620a:6011:b0:93f:11ee:ba1a with SMTP id af79cd13be357-93f57f91849mr395279785a.48.1792590214988;
        Wed, 21 Oct 2026 06:43:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6011:b0:93f:11ee:ba1a with SMTP id
 af79cd13be357-93f57f91849mr395274685a.48.1792590214318; Wed, 21 Oct 2026
 06:43:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com> <20261021-10k-sdio-crash-v2-3-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-3-5df80bf16e86@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:43:22 +0200
X-Gm-Features: AclHuK9bkKR-qO0jcN1FEgG42syrJGdmYfU_hxWhaF-M615PIzoLQ_M5jA6Oi34
Message-ID: <CAFEp6-2p3vFY2ARd5bftVAQj2FxweaTFvdXyJr4nWBZSRyUD8w@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 3/8] wifi: ath10k: also wake remaining blocked waiters
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX1icFypTg67JT
 JosH+qTycdbcG2Gc3SxVNlsDczxFtPE2Dzl7ZqKpj9UvNHuJNoAFwP4iHY/vAXAc9jjYbqkRkbZ
 BEnSWEJtzd8vi92sdWCBzmNocQzgTtEAjyOWVF58zWIlaKTNpXHJAx8htbfipNaSLpFAEsSNOXl
 F/R6e/pu31knVANpz9kgtz+mhtehu36/UOKV8I6wjnMWdNI0oQseyO1u+Wq2binaDidIgTMtmiY
 uWDeSeDDaUdwkntSwWQ/O8QdJtYvR+atuQReh1ISthxfOnnvkJd5WXzW3Y1tx9jHvhXx+xRQWgB
 8Q3S6uKkplC4CHJzuu+ZWUpip9R6eEzp9bhIV6EBFDMjUxzDl/a5fOX1Xh7S6zwHifqP1tUGj1p
 hkdHXyEn6NoCa+bM6hPTSTpzjtsL+vHqO3eKhMAAv602pd6suRAiHgOC1fZJ7PyK67ghcu6wgNC
 Fs8WBR9aYHdRJ3sK7Bg==
X-Proofpoint-ORIG-GUID: Kqdx3DlSEZ3ibybQyRnmrDynzv1w8WVu
X-Proofpoint-GUID: Kqdx3DlSEZ3ibybQyRnmrDynzv1w8WVu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfX+LFd8kqdRG39
 roaSwS0ECbuLPqZequQEJ6ACQRU6DMwZwC4TEviCyXtiIgIC31LJ4FoL8yrdnn722ywRjqw3ERK
 LQrTvrfHt2jZH3J+ZUMhy0ZMdL4WnYk=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8c188 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=ICYLl7Pk4l7hwN0V23EA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210054

On Wed, Oct 21, 2026 at 11:09=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.=
com> wrote:
>
> ath10k_core_wake_all_waiters() releases callers that would
> otherwise remain blocked after the driver has given up on the
> device.
>
> However, peer_delete_done, target_suspend, wow.wakeup_completed,
> peer_stats_info_complete and wmi.radar_confirm are not included
> in that list. Callers waiting on any of them continue sleeping
> until their individual timeouts expire, even though no further
> progress can be made. The WoW and suspend waiters are on the
> suspend/resume path, where these extra timeouts consume the
> watchdog budget.
>
> Add these completions to ath10k_core_wake_all_waiters() so
> blocked callers are released immediately instead of waiting
> for unnecessary timeout delays.
>
> peer_delete_done is the only one of these that is never
> reinitialized before its waiters run. A completion left over
> from a wake during recovery would make the next peer delete
> wait return immediately, so reinit it before each peer delete
> command is sent.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath10k/core.c | 5 +++++
>  drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 93140f1ffb7b..677e582b87e4 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2500,7 +2500,12 @@ static void ath10k_core_wake_all_waiters(struct at=
h10k *ar)
>         complete(&ar->install_key_done);
>         complete(&ar->vdev_setup_done);
>         complete(&ar->vdev_delete_done);
> +       complete(&ar->peer_delete_done);
> +       complete(&ar->target_suspend);
> +       complete(&ar->wow.wakeup_completed);
> +       complete(&ar->peer_stats_info_complete);
>         complete(&ar->thermal.wmi_sync);
> +       complete(&ar->wmi.radar_confirm);
>         complete(&ar->bss_survey_done);
>         wake_up(&ar->htt.empty_tx_wq);
>         wake_up(&ar->wmi.tx_credits_wq);
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 8e604697d6c2..45a3082d5a64 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 =
vdev_id, const u8 *addr)
>
>         lockdep_assert_held(&ar->conf_mutex);
>
> +       reinit_completion(&ar->peer_delete_done);
>         ret =3D ath10k_wmi_peer_delete(ar, vdev_id, addr);
>         if (ret)
>                 return ret;
> @@ -5890,6 +5891,7 @@ static int ath10k_add_interface(struct ieee80211_hw=
 *hw,
>  err_peer_delete:
>         if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_AP ||
>             arvif->vdev_type =3D=3D WMI_VDEV_TYPE_IBSS) {
> +               reinit_completion(&ar->peer_delete_done);
>                 ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
>                 ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
>                                                  vif->addr);
> @@ -5952,6 +5954,7 @@ static void ath10k_remove_interface(struct ieee8021=
1_hw *hw,
>
>         if (arvif->vdev_type =3D=3D WMI_VDEV_TYPE_AP ||
>             arvif->vdev_type =3D=3D WMI_VDEV_TYPE_IBSS) {
> +               reinit_completion(&ar->peer_delete_done);
>                 ret =3D ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
>                                              vif->addr);
>                 if (ret)
>
> --
> 2.34.1
>
