Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792590880;
	b=0/ELd7wDh6Ak6BG4FpucM7H4Me6S4M8pqOzxzj8muthl8y0TtWikxGVbS5FFG/cL4E1h
	 PEMMQDdS38d8hWJvrH4Jr5nski9VYfvajrAqBjkbvckMoEmt+uYVQk17W4rupTXKdgSpS
	 4pX80fxgLxR+DhMhlrMJtdQfbIhgu3uPHag1SKAV9sBTSCd8IaOzXLhfsTQEI8gM5prQv
	 HV3oocPeCfPya77XGBAYk0FA6vzZkTau+baxl2E9guciD377FuA+YmgXGQf7WYu/CvjfZ
	 MNLHFDDDboRMXh5wbbZdiu6WYNv6zMJv+gVtfQ03jqpXDeoStkyZ/GfgsZWuTGpLQZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t41uoanVR+TXtC4gloJCUo97Lt9PNgCNxsrVHBM9JuY=;
	b=QGNnk87+b3KqhSd1rvAUQj9kkYkEReiVUH49n9WW9zdGmINj/01MJWQVa47HCwbs5ioI
	 YBlcUOqFFLlOtjfFXrf5WKKiqu5RME0gY4uqwV/yPuy4xs/0kUFbIhk2XhL0Tkm4wt7Hd
	 l6hTwEud7PLKObW5X7+7Ynaqegt4PTOWa9SRvOFffq3moY6WknXcXxnrylJkHZpggv9eH
	 TEqc1ss9n4Y4nELBtOFWVnwP8KhhWkicYWa4YhLd13y88cwIIhICD8CKzTmqqSHqvHhOK
	 NIlcQvFlcm/UCFkZBxkHCMzat26NAzoVvFfsTaYHgePe/RQRiLiLLnGrBiMjHEcEnAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHV23s4v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FlXzhpeW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD4F606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD4F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHV23s4v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FlXzhpeW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDKs4f704812
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t41uoanVR+TXtC4gloJCUo97Lt9PNgCNxsrVHBM9JuY=; b=CHV23s4vIghmqWbv
	3OTLp80UMjT0y9JoE3lNnRy7kqp7gqFxzRI1UwO5nNP14DtZiRzQoqWQsH663p7x
	DaJoYsdKakE2Vwgo0KLALU28mpFqAEQihoHyRFLhEc9kerwPSsZg1bdn2mLrvdxT
	mnyNsZKYNAvFECMV/cu4CA+EvKC4SJHC/w1xAiZqRQRzIGthFEdnhdGtuurIDRKq
	hFT5yxuAgxspQylAOe6y3C/A/iXxFjTQCfQn5maeNNX4ya4js+zsfmpYl7wLrX3O
	9hvEnMQLbY2Elb/eiphFd16IBofjwBOlLUD+tOJZNUSe5/T/hHODWNR6gJwf9pVR
	WiAZNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r39un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:54:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so165133485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792590873; cv=none;
        d=google.com; s=arc-20260327;
        b=i6MfblFjKTSySSUhlxtBbbmWNJBzl6fwfIu0IA6G0H1rLH/PX4j/n35u0QJulRYQY7
         EN9Wg5D7TqVlRhuWYGo9vtIBfN6xp1crXkVUomjB9Y7gKcrMZqC9TEeslR1nG874fUQz
         qZQXBnA2ukz+O2qbGqovEFU9mbnflq+8s/xMzEm/I5asvULP+Abc8ATBvX5SwroPoYNs
         widxscsqzsAzJ0OY7a+AZnwprZelf7dMnutl2fkcJIHI2M0/5UIWEALGJQn9A8VM/ZYA
         bE9dgb90qhGGbdm9KN0Gu4oSdzDw5YFz1U9P7/6rrNg8vx/KEI+YBj+k/3xt2DbwsIOZ
         fveg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t41uoanVR+TXtC4gloJCUo97Lt9PNgCNxsrVHBM9JuY=;
        fh=ykkzWFd9I4xLF/RGZLgsG4T3U4KUJkoHir+/YS+15Fo=;
        b=LlXMoqQMwFwQ1E6WT8HXyJpfq/K6jCFYUaBJLT3YbrAgEDexRkIdVzmmP6543jQOIf
         nc1Pw4ANigT74Qw/8EPhFvo4Za6zQzwyUEU7IYcpI8VHaNhcDCaLZWNvPEwaCwQcqY6o
         SO9470fw1WPPJgJzZEplV3zscIVJvqvAGLxtb1l5VFhuwXfKbEmoRlszEqX6yGmSsXAD
         461fWKOK6LoL2Q1xK3FTCtBeYdC323t+eggVScRN8FTw/ClZCSMnoq6NYhOaO3EeO865
         y4LxP5QMoPOxJ3uejk1ZYb8xxASFBxjToTSTRRmu1ayqfXHtu2R4vPeolj7TZgHsIh88
         /r4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590873; x=1793195673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t41uoanVR+TXtC4gloJCUo97Lt9PNgCNxsrVHBM9JuY=;
        b=FlXzhpeWQhmQEhsU5bLH5faG3dpxqLj//t9P+tCifn+UiDHBwOai6M9MdK7ZRoWK/K
         +VNf4vnloSn9vEoXB0mgSe1ncPXbAqQ2d0v37SMB8nrG5kVSy4iSF1sZhpzjV/+iJybU
         jNJjvjCrlRoP3K4AwrDGOIflY8PM4SR+r+4v+Lrk9ejLUxiHVlC4a5KiBp97xbiPCLcI
         cga2BqJT43npaTw93Qe+O68yWiqJvbI0ZkoDn9bJ9e1VA3dS9w+0SmOcFOKkyBugPGVd
         1pnp/U5irKiwzolFjLdQBQk8SrNBlY39Fyy1QncAHtdYo3sLxHb5b/lr1vsep9cJjA7A
         NGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590873; x=1793195673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t41uoanVR+TXtC4gloJCUo97Lt9PNgCNxsrVHBM9JuY=;
        b=cp8sYJsQHYARrwjyVOan6CwDYtaVWCGbUiB8z1jN2SGSuUob3EwFL0BcnGLhqezvvo
         Wt0Vix31ACJCmxcha+/QdMw/SDP70hH4vVwI98vpN8AaJlZhekLis6HzwT4/RKXNIdPU
         +ymkfrg/7LX4WVALP6ftRisnNFFAE6CeikmAExrrFQQ1CrxmVaxZzJsuyFfzCnbx/Sl5
         QmspBdjvr07P3D+Ht/wVTp/U9N5/24j/Cgi4EfODMj6RpjXs6oXID1e03FoskmZ5zpHp
         F5dev5YA5yc4AMj5p+tisXzPgLT4MfCkbvIsADpvWc+LakogA74XxryfFFrjaANDK0kb
         Au0A==
X-Forwarded-Encrypted: i=1; AKwUvBwSwFquSDnSwkIJNdX6nNauzSzi17VaVL7Q+wCsvggPq+0l5mvU1B94yxgbTfV9hMFpXVgOFeW7ykyhw3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXH/EQxG62tbyL0ci09sQjLwSZ4V8oHOWwxoRrQVJQGiQZ5bR1
	Of0Fg5bUPsE4SM3BLU51DVj54KXjB0KU6OYfWV/MH8/H0PHHEigQRhDbtv7EeqCHcm7xTZQ1BLw
	DspEoNv2eiwZcRwizs/64n45iXYGuBbjOyOElBfw+n8pGY7ul1D7x1/8v3tnwPoBQ3iJrqklHyW
	K/GZwijJbI8tvcjM9/hZSwiXw4ypHPB/MNYeckDpq+ig==
X-Gm-Gg: AYBFou3wh0anzlYEG+oxMHPoHFd6JJ+mV3ixed7G/mAVIKGSPzZoIJmodbXSxrkFq8q
	cJHDAxwPX277/Q9rkg5S0RVinILgw88XOrSeTz9/BSFEEypqAhFfafO5X2VWOrwBOIGpDfypCQS
	IVM1PNaiZki2C1Cx1FmUysqWVkG77Vqdges61cNUgVC9cH12ME3zkUHPoajBj+sbzryLDLI/ko7
	zziBLk2Ily1W+2b9zDbQJm9VLuIWZeouqOnn7cpaEgsDMWJyjSh/ezG0BNHnFTZKUmEx35y11A=
X-Received: by 2002:a05:620a:4398:b0:93e:c12c:f137 with SMTP id af79cd13be357-93f5803fd22mr421250485a.82.1792590873070;
        Wed, 21 Oct 2026 06:54:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4398:b0:93e:c12c:f137 with SMTP id
 af79cd13be357-93f5803fd22mr421240085a.82.1792590871734; Wed, 21 Oct 2026
 06:54:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com> <20261021-10k-sdio-crash-v2-6-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-6-5df80bf16e86@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:54:20 +0200
X-Gm-Features: AclHuK9frjvxrPgqG79PX0brsm6qD44pye3rZNMkfk_0YWYp84LDbfiNcLFomHE
Message-ID: <CAFEp6-0WLtOCGQbhybo21WWX_ZbE6_nRVQLq-Hqddc-+Vvvafw@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 6/8] wifi: ath10k: hard-block the radio when
 entering WEDGED state
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8c41e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=d_Mx3J29_csdZ0INFZkA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: W-PIty3rHcWa3eUn7vMDk23PZ2gC8INe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfXxfWG8aGho6JZ
 wGUnHU3qx9ivWFLlc98dCbkQWUN77RNvINt1FrJ7h9BfQGx4J2/gKsHRfh+gjQfh10jJ9pc+YyN
 0ENcDz6rN1Trjg8NULh7MJhOEMe0dcLH2bSlVEOp4AYk79sbk+4dM8n8MWqaqdbB1plLGaZ0bFc
 P0tBaM9Ma0FSK/Oem0mMyOw54E4Xk3OWhz3QMEYPifSUz4cYsxVcszTSl4AVMLJM6bDGd2U4Z53
 W4xKJQoxUAl6O7F2HS7Lx6khCu48UfE9rmZ2rCcMhxZ3dEjaDCKNB/TpyhRyE+fl4ioAiPpXOj6
 LeDj4dWo7cBQ1wEEW4aCbEOL411Rj+0eZxCbFZXX8d9Fqx+1BgaFGI73f39GjkCiGq3E7F5ej97
 c5ZWmtN/SN1gXztYLNtsm0MlJIFpSWi2s+PG8SqQ0fuQ6to7dkPlz8uWRlsuwoYnvdzYhflmGwj
 lojtSxY6yhwhkeb8x3g==
X-Proofpoint-GUID: W-PIty3rHcWa3eUn7vMDk23PZ2gC8INe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX9cHKIHais2dr
 Qt1zwxkwluWz88d97GdTEo3z92MLyd9oIuS2MZtVFS21FSvWl4LimlDNNGtEewm8HoBtk4jk3+f
 /DdLQumuZk1eFbEUZXKNJBcneSFHeeA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On Wed, Oct 21, 2026 at 11:10=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.=
com> wrote:
>
> Once ath10k reaches ATH10K_STATE_WEDGED, the device can no
> longer recover and remains unusable until the driver is
> reloaded.
>
> Userspace daemons may continue issuing scan and connect
> requests, which the driver can only reject individually.
>
> Mark the radio as hardware-blocked through rfkill when
> entering the WEDGED state so userspace stops retrying
> operations against a device that can no longer operate.
>
> Both WEDGED transitions already route through
> ath10k_core_enter_wedged(), so adding the call there is
> enough to cover them consistently.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 6b6b80242cd1..66585cfa6d96 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2521,6 +2521,14 @@ static void ath10k_core_enter_wedged(struct ath10k=
 *ar)
>
>         ieee80211_stop_queues(ar->hw);
>         ath10k_core_wake_all_waiters(ar);
> +
> +       /*
> +        * Signal the radio as hard-blocked so userspace (e.g.
> +        * wpa_supplicant, NetworkManager) stops looping scan and connect
> +        * requests at a device the driver has already given up on. The
> +        * state is cleared only when the driver is reloaded.
> +        */
> +       wiphy_rfkill_set_hw_state(ar->hw->wiphy, true);

Using rfkill to signal the wedged state feels like an abuse of the
interface. Have you seen similar handling in other wireless drivers?
Wouldn't wiphy_unregister() be more appropriate here?

>  }
>
>  static void ath10k_core_recovery_check_work(struct work_struct *work)
>
> --
> 2.34.1
>
