Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558051;
	b=ovS138J5QRlUK2M1g1IBAsHWZ7NbxN8kKWPNQIOvNu2s20oUr3WlfqIC/dW/YNtvQVlk
	 6IwUPoRtKTZsKnDzjkwGSTTzmFozRXQXLqVuRchaD5d3AMNorYwojo/YF8LfDYzkqgFn2
	 d2QJlZyTESaVqdHdU96Ep3TUp1aYNoqCTT3v+ntupnyNrPX+8Zb3pURDOEAqJBpqNjQvL
	 bdIHcC0xQqpA46cxA+0vIc2cVbcmymAM27QXgKCJ3w4vost5ZVHAPNaBLKylcKow5R6E6
	 jmjLnCo2YRU5SaxzWyPYUOeF1YBWyzpPv35TQzoKgrhHkwBOyx3HjqaIJJG5qJhlJPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558051;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XFYXmBM3beK01ZGcVGJ0do2CSzGN1dZpDVgbJR1vAH4=;
	b=flLcBkhZhYFdFjvD7AIv5zWiysecAjpDwOei0zEHCOfkocZ6AjEznCDq8bePpxilxacy
	 AhVBSQXYMAMbs7BwWMlUixyaTmUT6W8koF+FkTw6XBlAKmx+eR7rfQ9E7/KBedvSnyCg4
	 ykG2iBfOaLGh7VNd2gb0qJ/lVRHzcF0eNCb0FpYGaOSjEYLyer0So3yzuHOwDM7jn/OJX
	 qBwyYlVsSxB/yJVDn3cHYTB1G/F0kOX5gun+3Gx1sFK8669b8JuUZpQdkxharCfswpmao
	 oMlFyATjxe9qEJpUD5ax7tCm1+cCLMHbMD0gFJzbQScS1pHzWLyppa7xqgJ+mVvoJZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQyGzo3d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CkkDEjcb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032C6606A8A5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 032C6606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQyGzo3d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CkkDEjcb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD577u73119869
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFYXmBM3beK01ZGcVGJ0do2CSzGN1dZpDVgbJR1vAH4=; b=SQyGzo3dFe+5zfog
	nN8OwwEbdkrzvoq46W7XpgwAL0bsXYvS65f7zMociduf17yGOxhIeiOzPrWsPMot
	X8dH+P704PuMZfFthXM5ba+tTp2hcmgq0v2e6UJdYCyltXfNqpl1egj2ns8rJS+0
	u4g4FR6X72+uHanZkPzv4dus8WaIAZuDuwS41hXQE1UbhLwMh+OMFy6TqQGb2+Rw
	orNcPgrwbz9zDr8WcAx9NRUfxEmFqxMJg8Zg61nN5Mn/UWny9ujQ8iVuB+BqztOp
	dPw7tDqQaJwsOcaMTVfKFtwJ8UoYiOmMpXNMtPJATEppmjO3xEjMbgJGmbnGtuoo
	uxhFzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwa5pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so139962285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:20:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558049; cv=none;
        d=google.com; s=arc-20260327;
        b=lhy+lM/9FFJMKhEUP+piD3Se2kTlqthCUMDvykqoYqPQPF1A5ik33aHWDAz0hVi5Kb
         pA+V0xgVT+eUpL8NsvDmiAKzv9gyNToIWq8gG1mIr9nCwygLwPu9OMI9qikt3Wpf4BTo
         2Q3XILMFP8jMQYySNp+pT23zXPTepLxZzCqCasBHxjXtpWtZ9Eb4sh9+5eJgIGwt57bY
         vvp7zFGNvgWId/SOsG9cKafq1TTGeQ2U3V2B+mxyl8gmHEhuRblUK9ZeGYiyVSHpGx8k
         58HZjMJIAWwRoGQqjExkV5dJRbLCi9hUc+Vy7NDDR2Wr5ia8rDVuo827Cby3/3MnSXFA
         loZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XFYXmBM3beK01ZGcVGJ0do2CSzGN1dZpDVgbJR1vAH4=;
        fh=jBZLVTq5Tx5TkjoEHJAk3Hp+GAevHnaNBlmnIsbp/+s=;
        b=nPedAQHQtZVVQxwg+Fm/uEbiYEKKEasYHVB7kHVJ9FyIqbDnC0hhatyNfYT3thm2rD
         8azQXv2ZAdNoACCXPJnnC68uRMy3KAWfWkYStrD84PNrwhjJlyhfjugx3HLqK5RldUBd
         CnPKp0zrUngdf6yoWl6J8yaD063bobvBfYnya5/ciU7bmiJZiAuwebdyYUP6aiNSkM6g
         FRA861AP0b5KL85U+bWUcF9NRTiYyLEQ7rsEB0deGqU5W7D9NEEOW1sBOQ/1opxxttxs
         sWasZ86qPi0onY742G5lH9Hh3a0rDcND864ZWqnLBLKC3Su4umJcyyIIb3qom+vkL8nr
         x1eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558049; x=1795162849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XFYXmBM3beK01ZGcVGJ0do2CSzGN1dZpDVgbJR1vAH4=;
        b=CkkDEjcbFzfOPn48T29E4XMUIGKvORKWucj04n6LZ43yvI+eScN2a88NLP08iS8MmL
         a31u4+2+/WFESSLgyn5EgJbQGtX1UFXPXzv8leAPkypkT8aDZz/O008Yo93LgQPZBlZ1
         M8kqMWkiGKXNOKmeMiJAMuyhmKFZIfFNV1LlBfsQl4uvirX3uvW+1+ZC38pRmvvpx+6c
         3rHpduFkKnCL/ANKcdqad4rnOE9bnJF3iZ88Q1XNPRd7SaCrGn/4T8ivsQwlV7rovGsq
         wGicfsabvmj3nFr4ZgRndT3kTld/XeEFUAp6AAWMTZhX4HhHlJt/4GOCckOva7zkGNdZ
         58YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558049; x=1795162849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFYXmBM3beK01ZGcVGJ0do2CSzGN1dZpDVgbJR1vAH4=;
        b=saWZOrSVLfLQhJEn/kFm+ga0SQM0BBJoBFuRVTeChop8LWZ8M9FlSA2BhsQuhsn5PD
         PiGjCRimnc5JTXyMBYT9K94opahG6b91GR5e8WI6oCZcvsHhI0UzojmxwKDcP951Bltc
         r2BYdpUoLQchISqfzhVoe/NYh2xgKUbibXeQwrRsHT5GpbFeLankW1HAsvhYRpbUvjUO
         7xjByGwhSxxPXh67XorxI0E+fVCQaFO9WkqLNUQobbqwXw4mttv5xLkeRgNR2yEfzeKM
         wMt4B6XyHL08h2rN52cNDsn8UYbK7pAZi3Me7EH6uYbV/NRFgyNFBA3Bv3D6GTdtX99+
         YjQQ==
X-Forwarded-Encrypted: i=1; AL+hErEiaXVYr3Uie4g65tiHwFXEHIFuq3dh95IzoPMyxHRwy0fVaGlcAn6lCsuznvrvjnm8kqgCjj/rB/lMB4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FSDWVD9Epj6FBnbX792cTfSO2T6IcbT9ZOu636jfKYbKE8uIj
	5HxQ7H3oXfMYJ92ScR3+X6Shw8K8pnXYOfVtp8dClGDS9P1GtvGz+P25QrfyUYgO/SH6uYKCduu
	n83BnLEY1fmXbwX1/mBFJMS6vaL23MWjRt+02ZUb8c9tDB94zM8clkA8cQhmhettqEzKdTkjoQP
	6ofNkGFighLX46skrwQHcq8v2rt/7PVjd7QaPhcxtdjw==
X-Gm-Gg: AYBFou3xNEbqQ02RGOU2b0lS0A0BB7WaZn5Rvbl0v7YwxpOzHxIweZTalwQ2dSX5wIn
	sJrqWA7swt58/IxSaAFBw280kEra4Pa1EPZJ3vxhl6SZ8f+JhBAtrOLF5eRCqvftRZ3ygL1+ITv
	NeM/75AUbQFRa7UJYFYkBIk+HOnVNo7VhV4qwG7BucmcrqlgatKgWFlefMIue7Qqe6jaLeUqj8c
	YG8xPXzUIc2OMO91U38siFolet2UBXqwDuTcOOA/qrDN56V6fFtEMMr7g1oRSeuxYq6O/rgbiZp
X-Received: by 2002:a05:620a:84c9:b0:93f:38c7:70f9 with SMTP id af79cd13be357-9494baf1d7cmr282457285a.14.1794558049074;
        Fri, 13 Nov 2026 00:20:49 -0800 (PST)
X-Received: by 2002:a05:620a:84c9:b0:93f:38c7:70f9 with SMTP id
 af79cd13be357-9494baf1d7cmr282454985a.14.1794558048627; Fri, 13 Nov 2026
 00:20:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112172216.31216-1-peter.hunt@opengear.com>
In-Reply-To: <20261112172216.31216-1-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:20:37 +0100
X-Gm-Features: AclHuK_VsT7MGcrjPSVsxGRM89wc3nUaQBJGo9bMnXSTTDtbrrI2RFJv_8YmQ3Q
Message-ID: <CAFEp6-1-CY=fwfR6bcg51Yp_LQS61Ugr2B1yik4s1=vpQvVO6w@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: wwan: mhi_wwan_ctrl: say the DTR drop
 flush is best effort
To: Peter Hunt <peter.hunt@opengear.com>
Cc: netdev@vger.kernel.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
        dnlplm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6c861 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=t2vznHeBAAAA:8 a=EUspDBNiAAAA:8
 a=jPX6BhtYR5YRs8dJ7DcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-ORIG-GUID: qSdL5rx0hyEJ3ixWKtlj5a6nb0204NlV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfXwvrT2TAF0Ifc
 3DrGJormKVm8D9wL/bPTFDNlQtRg6UzpHZ6luMDL2W+KPpHBlsLUu3xJheayheEYeMiapmMBKvK
 jewnZa0SM1cit8RGSpOy0GN1yUzfsgYs9JyCCfyaUvj89hPfGBs4mko5WhOZM9Crasg+B21UB+J
 BtX8A3lSvCgQixDiEAvLp4OfhqpIRxDmSmDy1qBznfZ3QN5Of2JQQc3WVQzsH4GNS5vmUknszmV
 iERTc86FFbvdQxqirPASCNbK+/qAuTLlAqHfMMVtdyhMQ/wWpN5oIgLw0VVgfzbcdCxRZbzsdsh
 06/zdl2Jqxqv11gqLadNiyC60b9442G6HSTZ02a4DwgvVzhAqPfvQJE8aWd9/IxjlKlja2ViPG6
 YO+YeNQE6z3FNgY7C0URrVs+TwX2HHdd2I2P2QDkqeC/VSPi1bNggbMgowKa7egk4ias15qn+Qc
 1XqYIUzkCUXGOS6WzAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX1xdGhWsY91Zg
 EDgmNYD26vtHFm9OdCceBABxHHAaRf9RtHQrnKPX8I27yGEDKC5/GBsj5I1bd6+u2YCN/KEUGZG
 bO2AbbjpygPUhuXDgDDdLEF28sElhUA=
X-Proofpoint-GUID: qSdL5rx0hyEJ3ixWKtlj5a6nb0204NlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130033

On Thu, Nov 12, 2026 at 6:22=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com=
> wrote:
>
> Four comments around the DTR/RTS work don't match the code since
> commit 10f51f4fb99d ("net: wwan: mhi_wwan_ctrl: send a DTR drop before
> it can be coalesced"):
>
> - the ->dtr_rts() comment says the drop is sent now, but a drop that
>   hits a full UL ring or a failed allocation is retried with whatever
>   state is latest by then,
> - the stop() comment says pending state is sent before the channel
>   stops, but the flush there makes one attempt as well, and a retry
>   goes out from dtr_work after the channel has stopped,
> - the dtr_mdmbits comment only describes coalescing,
> - the remove() comment says the removal drop gets one attempt, but the
>   drop and stop() paths now flush the work as well.
>
> Update them. No functional change.
>
> Link: https://lore.kernel.org/all/179340002701.3131.15535297427661129303@=
kernel.org/
> Signed-off-by: Peter Hunt <peter.hunt@opengear.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v2:
> - Also update the stop() comment, its flush makes one attempt too.
> - Name a failed allocation as well as a full UL ring as a retry cause.
> - v1: https://lore.kernel.org/all/20261109185731.182990-1-peter.hunt@open=
gear.com/
>
>  drivers/net/wwan/mhi_wwan_ctrl.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan=
_ctrl.c
> index 772319927867..387ab1bb0c41 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -68,7 +68,8 @@ struct mhi_wwan_dev {
>         unsigned int rx_budget;
>
>         /* Latest DTR/RTS state for the modem, sent from dtr_work so a bu=
rst of
> -        * changes is coalesced and only the final state has to get throu=
gh
> +        * changes is coalesced and only the final state has to get throu=
gh.
> +        * A DTR drop is flushed out on its own, see mhi_wwan_ctrl_dtr_rt=
s().
>          */
>         unsigned int dtr_mdmbits;
>         struct delayed_work dtr_work;
> @@ -216,7 +217,9 @@ static void mhi_wwan_ctrl_dtr_rts(struct wwan_port *p=
ort, unsigned int mdmbits)
>         schedule_delayed_work(&mhiwwan->dtr_work, 0);
>
>         /* A DTR drop matters on its own, e.g. to hang up a modem set to =
AT&D2,
> -        * so send it now rather than let a following raise coalesce it a=
way
> +        * so try to send it now rather than let a following raise coales=
ce it
> +        * away. This is best effort, a drop that hits a full UL ring or =
a failed
> +        * allocation is retried with whatever state is latest by then.
>          */
>         if (drop)
>                 flush_delayed_work(&mhiwwan->dtr_work);
> @@ -254,7 +257,10 @@ static void mhi_wwan_ctrl_stop(struct wwan_port *por=
t)
>
>         cancel_work_sync(&mhiwwan->rx_refill);
>
> -       /* Send any pending DTR/RTS state before the channel stops */
> +       /* Try to send any pending DTR/RTS state before the channel stops=
. This
> +        * is best effort too, a send that has to be retried goes out fro=
m
> +        * dtr_work after the channel has stopped.
> +        */
>         flush_delayed_work(&mhiwwan->dtr_work);
>
>         mhi_unprepare_from_transfer(mhiwwan->mhi_dev);
> @@ -376,7 +382,7 @@ static void mhi_wwan_ctrl_remove(struct mhi_device *m=
hi_dev)
>         struct mhi_wwan_dev *mhiwwan =3D dev_get_drvdata(&mhi_dev->dev);
>
>         wwan_remove_port(mhiwwan->wwan_port);
> -       /* Give the DTR/RTS drop from removal one attempt, then stop the =
work */
> +       /* Give any pending DTR/RTS state a last attempt, then stop the w=
ork */
>         flush_delayed_work(&mhiwwan->dtr_work);
>         disable_delayed_work_sync(&mhiwwan->dtr_work);
>         kfree(mhiwwan);
> --
> 2.43.0
>
