Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794319427;
	b=oGKvA0njLIhRI3p0jyk/GBLnaV0/THGk06VH8jG58q6Pe+2cGtrOe90HDekSFp2FP8nu
	 DpkAOZuxrY4nhRtIzJjtI8zhNqtxzPCSgK6603ngK0fUMj2kiJTlXTsJX38fiKrPT7748
	 vf5H36uZMWr9jqZ0z/5pdrmz30wB7pNaABLmbG8xY8l3mWb6X1cUFzqwuVEEzlNWljgIX
	 sEwLdIuPA6yqLpHcCFAkqpzdu2cCSR4vTsLXrc2+VOKyNZgpw2UtJsd6wwXOOmG8rLxKT
	 s81JPR20s5YB7keYVoy3U4iODaWryZG+GRzxLcv8e7TPoemSeDDDa/T2YOCPXJbZI+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319427;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eW9QgbtxpFenb2Xuio+Mho8kGDi784dpzPo+qW0Dkgs=;
	b=tkTcFMjLB1gEoyhcrFs49004sCLsgx1NJbzUNu8Izzl1YMvxZNhMdTUQTz6LbOZhuLre
	 RsV9qWz0h1dijE9QgBRS/CatznZ/YYq+hxGEfmBz1qOUokRTi8/BFrwctroAXEc8VFryZ
	 GYd4zBpuuCSIcLojBye5BZ5gAVyEaspmYjo1yQZE4TAByulBZ0Dl9JO72Qyf8FhX1jQOE
	 7MQ+n88LvWxEtI3FVWp72yePfhAbChjNAY0Hs+966kKXNJvAMJuG3ZAO0Fe2RdXVVMHDU
	 L0SL5S9Re6GyfKyfjP1+plih/EakgEN3/7AFnNpy7RnCZe98bJSPwjwzaiPWTdw5q6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ONv70fdY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bfNyTjGP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464F6606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 464F6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ONv70fdY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bfNyTjGP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABASxk2688392
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eW9QgbtxpFenb2Xuio+Mho8kGDi784dpzPo+qW0Dkgs=; b=ONv70fdYmuwC7gLe
	hNGvG3biTSsv6ZNCz5FeNbhrYsOPClHdBTFNxoA4dvjBhlu3DwkbHje9BXZInOZJ
	FPb/6qAWUlxEY/VkuSGcNdPR6mxc9kCPu0lvPLLIMdSlmBdyGcXuG/8Yh8ORLDET
	86jCatsfz7GbNfu+A81gcXJeeK1FkDBHac6RcW9TRVJTU2ypgcFhPT6tGhA0nLaV
	zyfY4KpETbEJK3kqwo53zlU6PjQcmgTW0d7Qb8yJ7hgr/OGPinle4xRBpRi2J8dk
	VAhXhDbaHrlHkpGlFrRI+krx8yFzUlkAP5s+3M18UUg9KU8Z1KGSDHXCv7+TOiMa
	QX3lIQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp27s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:03:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a079256596so1606076b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:03:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794319426; cv=none;
        d=google.com; s=arc-20260327;
        b=ftIipRjPI7rIMjeW12J6VEHWtIbFVrZa5zG0igTVeqPxRedPSMXyYzanedEqLby7ia
         AIFTEvnFBLzxGZAqP/hV9Bxq4MY/rE0rUmEmW0T6uJMuLPO5K1HzZarc7jhbBg/h0aWk
         8INXn9BeHvpaAniCxN4jJP4Wz3k35r7MBDe0QM1XDsna3Js3ZsyYPtT2BsAwZt6Z9h3R
         iJ/pcBFqNHJAYbuPMhRm8Wkte+ZI0807U97rmlX2nnhoV4vJlONSZ30gDDhPi16YYqEL
         fa9okYhjP07zC9jBW1v4W5boh6+O0dGqQI9Glv3a9qM+pd4CEX//kfP+mbdLyFhCuDFz
         1z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eW9QgbtxpFenb2Xuio+Mho8kGDi784dpzPo+qW0Dkgs=;
        fh=iN9lNMSdk4VrwmvidwfP2SWst/DuoA8bfP2D+63hTL4=;
        b=ekiqokaY7T+7ewmqLIryz5mYkKFzChp6uLBYq+BmHeqTsuuHD9zDRYqwHOqpmr+FFJ
         j82zuFF/4aD1CHX9Cv2CJuAD6pxUk9GCLXWfkFdjnGo/lpNyNNySa8rKCqHkabz9Y8JD
         JSwiRQX+6eQNpDb4/7Eha1AzOGr5Cbv6bCaUEC1xBCuwe514hrdRCNYl04B99pxopK29
         n2ISXcvm+eTlHBKepJDmlJZkn0urpgwBo5h47jVN9mWAGsupW1tOEZUP8NgReFQqOt7B
         D6O6WDMGMZZsfYB1mP6E8vJJVbYhCQEfHn10qmnXbjT1lSaIFh+ZbLogN9NE/adwOy9Q
         h4SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319426; x=1794924226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eW9QgbtxpFenb2Xuio+Mho8kGDi784dpzPo+qW0Dkgs=;
        b=bfNyTjGP7FGkSolDQAJsFftk6oUly4Kj0/gvV976Zs7Gnn+X4Ucgf6kxkgWhKozd6T
         EG5YW2p3MMOXOG97QajQdIBT7o8U/dfzINvWNF9W6HsQHHWsctayadAf6LlHpXw2eAsS
         PbtVE76Ysdg58/T3q+KZ6uoHFnSAnIkWmds+EuevRYP307U9wZuu1wC8D7gos3tchlUU
         LhP1KOkQlHmaLHRshjpZb66oxLYRPBc1ow5QCEjGEff9/BTgzlIpkFPvS69yBHAZJWyY
         eZi2dQx9k83QbJDaJ8Ppwn0gov+JqpRkFtxi9S9ezwzMwFgyX9CSWb0RTg10YnSkENeK
         zZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319426; x=1794924226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eW9QgbtxpFenb2Xuio+Mho8kGDi784dpzPo+qW0Dkgs=;
        b=BcSu1JtJhebPAsGyAqAdTH2rj95D3/UoXguYb6jQUWGD/4KHxkXXWTi8RuIYVlmqR7
         m+zFp2ahjF8Z27CySmTW72Bjk4dD97HTkqFNPRNTvIFihjnEU3VnvZgq3s9dGQx7NXhe
         VVO0rGbrRC4MLjSkqvxK+RJkM4BBVsWScjDXIXapwI9pYbb44anuPgf9mcwXEym2vDe0
         i3KzUtbpTjdYc0iSr42K2V9s3X3qIDE7NRLEC3+/d8Q7birkf5IiQHSKyUXTMjPbcl6G
         LJgFbbjvjQAg3/2yIzI1yL5BfAuHoK1EObN9hNNCp3HvJ6Ud+Bqd/sGnVVTFnj0F6NNA
         EWbQ==
X-Forwarded-Encrypted: i=1; AL+hErGmazBKASI5e93TlSbJ5fTgPVuRPsxdN+xVUu9SokAcQ2TnX2+gDP5ODqw1WV+oLxOMv1uOsExQRJXaO5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yGgwlyyGAkAekE+kA2zTlTEaBep27z3JUczPysVq8iZe5n2os
	QQK5wdTb1LFhEEoONd7g7j/lZ3PJTaD6ednpFFVb1E1MMaCODx4qS8cqM3SIFslf+kUWAmGPXhY
	3XVt49j08FhZuKpIAoU32ZL/iDcEtwh4WUaUWWcL46MM5Kc2QcwlgMAVUbq+bj68qcAtesssj2q
	80dxvyHr22K3OVjvMoK8JE0mOFsZOppcD7kXYWQQ6X1w==
X-Gm-Gg: AYBFou10EcI5w26Vwt/N0Il907Bnnu5jiT8a6E8p9Y0OG47VVd5+7ppe8yiDn0N0UGg
	PIVP89j4XNvt5cACBc3W70ICEh2C1WHFO7dAubIGsIftkMEHrL53AbzYzKdwLQvX8Zq6oPVuHPb
	nkMxLI2TSDQX9vmQTKkXV6YVJ3VKwk5QxLyiuLwyw5Fh7W3R03DzyhC/UEIA==
X-Received: by 2002:a05:6a00:6ca1:b0:8b6:d2f:72ae with SMTP id d2e1a72fcca58-8ba85beb73cmr3272959b3a.18.1794319425526;
        Tue, 10 Nov 2026 06:03:45 -0800 (PST)
X-Received: by 2002:a05:6a00:6ca1:b0:8b6:d2f:72ae with SMTP id
 d2e1a72fcca58-8ba85beb73cmr3272926b3a.18.1794319425035; Tue, 10 Nov 2026
 06:03:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101063719.88570-1-0xbeac@gmail.com> <20261102022924.51343-1-0xbeac@gmail.com>
 <20261102022924.51343-3-0xbeac@gmail.com>
In-Reply-To: <20261102022924.51343-3-0xbeac@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:03:34 +0100
X-Gm-Features: AclHuK-5L0KYD9ovBXGAlqHD1kaxFR6Mtt13RCglbut20l15QL3duMatRWXB27c
Message-ID: <CAPx+jO-PqVt4+16K+djf6G90g3WCg0apXMFUWRMHq3o5xxqvfw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] mmc: dw_mmc: cancel the watchdog timer on remove
To: BeaCox <0xbeac@gmail.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
        Shawn Lin <shawn.lin@rock-chips.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: NC4F4yneE7T-4Dh_iOSOQc5y2AR-0e9e
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af32442 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=ECCTn69UPDZ9SOPRO4wA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX/ZkczNN0Kg/k
 WKRmeVarLtZENMQpkPDIsYUYGOr9xJctDDH07hqIMCZzV6pHBvDGq6pAUz/c1v/0cEWvEOjmK6h
 /ChVqgHkcxqfxfV/WDkcenJMrP1SXAeMdYualUgf4srtT3VRiTBmiUUJ657mWnjJHgKeJxxkXPf
 BiasxHOpttTezwVPUf/YFEGUQI8XEG8bDd9yBUQZOxWSfdXtjIO9lfAo0RhpP9JoVlPFMuvn3VG
 SDOpXdkM+Kyj5DSCxN6fL7AuJ864thyJfRHBihNT62+UgCbaan+N1yOPkYYY+BcL2kpLMQpFfkk
 xfqE6CoNj+nohSammQ0F83LIrM+Rl0Y1U0fiq1S6G0LUbUFpIxdrQABfQGvFGZn+HPPq5+ASsEQ
 oS0Q9uvyxCv4U2YJZdR2svoUMzBz8CUzTtUC8zTPL8W7wyLXJYd1ZXK4xnG4iG2CjkCF3pZdMo8
 rayMFoxs9o14IYriaRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX0aPtDBk67adr
 RKsE+k/2YcohabEtGSorWcOBkiNiY8wMF25Q2mwGWGbHEaFQJgfmPHeKwHfJ+c1AmQrDjOFySTO
 ndB9/XJDN94fRLnBPfE6LzsUhngL4b8=
X-Proofpoint-GUID: NC4F4yneE7T-4Dh_iOSOQc5y2AR-0e9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100055

On Mon, Nov 2, 2026 at 3:29=E2=80=AFAM BeaCox <0xbeac@gmail.com> wrote:
>
> The central watchdog added for command and data timeout handling is
> armed while a request is in flight and is only stopped when the
> completion is delivered.  If the host is removed with a request still
> in flight, the timer can expire after the controller has been disabled
> and its callback reads the controller registers and the host state.
>
> Cancel the timer after bh_work has been disabled, so that a work item
> that is still running cannot rearm it after the cancellation.
>
> Fixes: ce0043b9a302 ("mmc: dw_mmc: add central watchdog and convert CTO o=
nto it")
> Signed-off-by: BeaCox <0xbeac@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 5b47643..dc3beab 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -3410,6 +3410,7 @@ void dw_mci_remove(struct dw_mci *host)
>         /* Stop the work before the timer that it can rearm. */
>         disable_work_sync(&host->bh_work);
>         dw_mci_stop_fault_timer(host);
> +       hrtimer_cancel(&host->wd_timer);
>
>         /* disable clock to CIU */
>         mci_writel(host, CLKENA, 0);
> --
> 2.43.0
>
