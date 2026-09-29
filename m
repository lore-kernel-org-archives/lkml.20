Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DE447C0FA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677521; cv=pass; b=coe1pyw4dvWEWLu0C0b6x2YFzBtIDMwfrss3aQO0BPWdnjmy6TTTEyllnYpPZL9dnmHgxTvCQqTjgTEJN/pL4dISOcz72TyXi7MSpqTR58KMlGgGffSm/oYZldt6/OnhrCbwicAdou7+MZAYsKoo1Tea8kw+xDV926kN2fTeVJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677521; c=relaxed/simple;
	bh=xgfkl4zyeC8RuLq+GN4w/BY563W6yJYYNI4/dPhH/BQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9nJ5iw4P04BmSbjAoLqimef04HLGMfV4/y9hWXAEmU4eX59s1kUjlu8aot885GztqlPxAVcsdr+YIw8YCYMWWADCCcBs3ZywGE7MXTJPSrE/NJ2XOkEMMQLNwJBbvfSvpn9Cc43gK4V3fFbqpTMXgQwmrQ9ovUuffFVS7QSAbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LjblXC5W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1LaOrfh; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LjblXC5W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1LaOrfh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Ttxu3684743
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4iTwSNVL2vSXyi0y8I31DfIwsKabNOEbE1ug4XUhBI=; b=LjblXC5Wq5spxTll
	iV1cW0RqiNpWKU5ovTt1P4wkg4mmFgutgPxDhgPsNlWjxzipu6M0Zn+EqVXw3XP9
	G1pztpNf8sRjoh3X72BkyrZFBzXZ5QLlCNYQpL/ABGILhUner7Q1p23AlV8P3d7t
	XGDSeLTYnuoZSq/qOO1jozs81YJz26xsBakkz7gV/DQy31UqHl2cjCVM8r2aBuX+
	8dx+92idnJnKH2Z6SN582mjqzMvsC8BTrIzFEG70vcYXSjIoIieoXp7+L/StU6AP
	eQgf91qGhu64FlGPE5cZZTyaJEvk/segIU220R74zPst3eg0QKfQCKFWBBWcLGEt
	L1lbFw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144tepa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:25:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b6416441eso7118106a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:25:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790677504; cv=none;
        d=google.com; s=arc-20260327;
        b=V/mUI1uXSiatJSRvn1rHJIPzSExKdN6APJLJUpcI8q03BLXICOfZgvd0IihpIZhMBI
         7AHC0/FET4ylaLoIfHVsi5RMP2STMmF4fI1l39VIMan6MuQ+aff7iPZIPufoshm+QknD
         zx5w31OPvDkSM+jujyd3RHA+FEevg2iOyEeZBYUk2rjGFPmXxjCyRLhe782za0aQcsD7
         PcZ6uipuwfcW0xlxqM6AG0ASimPKH7Xn0nPlrocy6lsWYuZa5ghD65seIHTtt8WYX5iv
         2zn00JX7u7iY6fmbrLhQIaLxK6MJc1aIgyPUXLnQ6rMWQMmApKHSpYP7HF1dsqWnxNal
         aZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s4iTwSNVL2vSXyi0y8I31DfIwsKabNOEbE1ug4XUhBI=;
        fh=JItwl/AaIiiFjmJz8KL+B/kbO4s0wuMEj5zgfXDhtVM=;
        b=XagHxdOUeIlZ7I3NPpa558V0q3SASQ5W6ReCUhRhNw2aI4fpy6IhCbzOOM1m7+fDCp
         LV2VIY2UQ16s6ylA5eZa2MQ5enYY2X0x+AAGJh0+bpNFiZGDTrpuag8GpsUNKphlxS5y
         nkscC1xh+Lr66etuqps5gPjTjwMIBbP4PBiOMNSW9SkWmg08ishkxpO5i5us1mPWv7nC
         N5iYaH+hJGj6K4MzfP2mcAG+ZKhuGfYzQcQtxrblO3BCVhaVKRnhYPwiBb5lcW8LKHZ7
         b5srkVPV4wUEQ2Sf73uKmooCIVECUQ3Ll/VLZCPFsZH2u1qqU0URFLrorUeJtPRNOT3g
         fr1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790677504; x=1791282304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4iTwSNVL2vSXyi0y8I31DfIwsKabNOEbE1ug4XUhBI=;
        b=a1LaOrfhavWHzi8VXU804Mb4UTLS0VKwQFa+BW9AiuFLX3NzjjXMlRCIBkkju2w01X
         CYnZCMkY6HK0DjSaazrA8W3JH7TAsRAGyNVHsgkFGgErisj7EEf8ervcmErEmmAmMo0A
         O+QIfB6CqHhxjRSFQIxkUIff83UqD+GxYD20rBcnr8KhhvUfS35fvLsefUJ6OAxXyTiR
         rdE1/6xSGD7UGktuY01YsNtqgHEgqxS977GTLEdgW45l8m7/Nv6+scf6U8WMDWznF7W/
         gt0vVtssGwoBjMynkMtNqhGMzy6hc5iupvmKY/Y39TzCCZmJoSpV8PaCcKqzw2XPSU1q
         J1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677504; x=1791282304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4iTwSNVL2vSXyi0y8I31DfIwsKabNOEbE1ug4XUhBI=;
        b=AbgyV9OXzh0jc1tl2pM2cTsI4anqBfSfiEDvbwsTocPaRY4l9j9yK14AACG+HnBvaA
         WjwBV4AASl3vqo2tJEGfBKQyk80t0iMPflzS8541rjh3CqJv7HqgiwgLdJJd3m3rz5k3
         erADL4T4GY1wryiQrpGaGLJc4gSTeyXKNAktEa3Rzllq4Rt3gxZDqRYXhXwm4EizTRGQ
         Rx2OknF7+di/718y2SDcLk2osHayvU8cAZu63EmEoJ/Wc0bi9BPzxV9CT7BxsrdY8OVq
         g8BUxT8rZCEL8iaT4bu+Z/vRqChPlLY42OFDZrd2rnAwcTgWETsXKWsqkhxXMm1jOKDs
         fUOw==
X-Forwarded-Encrypted: i=1; AKwUvBxb8+Jlo7z5eb3zXEkD5CzODMJZHaiTVCWxYI+HoyhOW/U2m5IOTjXjplL/DIJBfvCFGqBuJBRcDs+hsbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhWcvx3JA4JdgZcDYlxW91rePVMwQFYCcR3CH28UvlVoCptKTm
	jR/t+20gT7TP5cGfkvRexT48GdnePNYGfsgWV0FC6YkxbBgSvGOwcIzMkmyRJvN4952HD4KLjGM
	z6wrHEVMC3hQ/18cKz9ml9aLLrK8j3wXFahQF8C/SJVLvIqotCNsHW62YbFMu5hK8VCNiBUuMwj
	hTQlvK+seHD4xPiMlvJHqCJwSwGyH86byNL4W7iWsZ1w==
X-Gm-Gg: AYBFou24OWYHRykiX6X9++D6eMeGGahePFR09AYqyZabXnyZUCEr7mTcKkJ+9K9BkDH
	iAIRbDJ1WsL0VjaaPJ7sbZDNIScL4l3oTfwGxNcypck81v/8oiL07hxKv8/cjBAhWO0q9039RIn
	u5jfXZlhkDax6TeD3eIwTHhNhIUFLDn4N3v7H9U/gmRVppeL+BZYCnSWe7CQ==
X-Received: by 2002:a17:90b:4c42:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-3a098e5897amr14850063a91.61.1790677504026;
        Tue, 29 Sep 2026 03:25:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4c42:b0:39e:6c68:c787 with SMTP id
 98e67ed59e1d1-3a098e5897amr14850040a91.61.1790677503429; Tue, 29 Sep 2026
 03:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919100408.113979-1-ngocthang2710.1999@gmail.com>
In-Reply-To: <20260919100408.113979-1-ngocthang2710.1999@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:24:51 +0200
X-Gm-Features: AclHuK-ioFY03K2yBE6RpDgYHkyETT-slCthEuTAZuN6jBDlBpFjIurlN2EUv9Q
Message-ID: <CAPx+jO-JBBLNCUrnB0UaMSPu7ajwsrEQMPJ1SfH2PccCR5VnCA@mail.gmail.com>
Subject: Re: [PATCH] memstick: core: reclaim the request before freeing a
 timed-out card
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX4vBXmGy4Zymw
 to6RQgPHK4yB8J97Cz5h3syS3iFn8sk7OHS8AossmrBHgTAHcbj8lWvPYvlhmJlH73b7NDwh6yU
 6j68HiWZVdhEYdAKZ6lNCKHA4xIpGsoQ/JMnAnzhrGyAnpy5liaaqo0Zlhuh32aoL6iDY4YU716
 CMRztpLSOyLw5+mj+nVDi1FwCPXHWN4cMUhIVmalm9oJPKLuKInn+ue99n+yQDJQv2elQuqyhDV
 CirwpQNGg5uBP9z3XloVmVlhEPgwszcxjSAxWsBQp+C3/BqpTyROMG522iDEzZpBPRV/Tpc08G6
 mmo/+Iey6cDYFT654pJAtt8RvQy4wS1pKtLwni+3bldDxJ7iJ0kkVHAMRVVZ31zFXFtOzOpTTJz
 qxJl2a8NKu0Ks3xKksUce5w0SDL7zhMbHmDGD1yTjAfptNL4pAlJUMZeKGmhy7od3NFvH56KLi9
 8cOM28XNI1Vx3eGJFyQ==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb9201 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=edf1wS77AAAA:8 a=pGLkceISAAAA:8 a=hSkVLCK3AAAA:8
 a=j9i9EbPp1eeP6bqsIwMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
X-Proofpoint-ORIG-GUID: Amu45-b2KSWyR-ouG28QZk-mK3yccHnp
X-Proofpoint-GUID: Amu45-b2KSWyR-ouG28QZk-mK3yccHnp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfXzTzNQroZSoY+
 q8WLG9dZzogcstejc+vkuk5rMWz9ltsSnQvAauEMuRzhW8KlaUSFR5LUcvaaoCvo4PG7GJlj0rR
 KPYv8+fK4A0B5bl+8go7BQqnXLRLEZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290041

On Sat, Sep 19, 2026 at 12:06=E2=80=AFPM Nguyen Ngoc Thang
<ngocthang2710.1999@gmail.com> wrote:
>
> memstick_alloc_card() hands card->current_mrq to the host and waits 500 m=
s
> for it. If the host is still busy, the wait times out, the card is freed,
> but the host keeps its pointer to the freed request.
>
> rtsx_usb_ms hits this easily: its handle_req work can block in USB
> transfers for seconds. When it returns, it reads and writes the freed
> request, including the retry path in memstick_next_req():
>
>   BUG: KASAN: slab-use-after-free in rtsx_usb_ms_handle_req+0x17ff/0x1a00
>   Read of size 1 by task kworker/1:3
>   Workqueue: events rtsx_usb_ms_handle_req
>   Allocated by task 1656:
>    memstick_alloc_card
>    memstick_check
>   Freed by task 1656:
>    memstick_alloc_card
>    memstick_check
>
> Add an optional host->cancel() hook that stops the host from using the
> current request, and call it from a common wait helper on timeout, before
> the request's owner can go away. rtsx_usb_ms implements it by draining it=
s
> work item. The helper also covers memstick_set_rw_addr() and both waits i=
n
> memstick_alloc_card().
>
> Reported-by: syzbot+3ee5da0319ca17ef1f4e@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D3ee5da0319ca17ef1f4e
> Fixes: 99451dceeb5f ("memstick: Add realtek USB memstick host driver")
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---
> Testing: no hardware. A raw-gadget emulation of an RTS5129 (0bda:0129) on
> dummy_hcd delays every bulk-IN reply by 550 ms (above the core's 500 ms w=
ait,
> below the driver's 600 ms USB timeout). On a KASAN kernel the unpatched t=
ree
> reproduces the report (same offset and alloc/free stacks); the patched tr=
ee
> takes the timeout+cancel path (~0.6 s) with no KASAN.
>
> I first considered a second unbounded wait_for_completion() instead of a =
hook,
> but rtsx_usb_ms_request() skips scheduling once host->eject is set and
> memstick_remove_host() flushes the workqueue, so that can deadlock.
>
> Known limit: cancel waits for the worker's remaining retries (a few secon=
ds
> with a device that never answers) while memstick_check() holds host->lock=
.
> Other hosts leave ->cancel NULL, so their behaviour is unchanged.
>
>  drivers/memstick/core/memstick.c    | 22 ++++++++++++++++------
>  drivers/memstick/host/rtsx_usb_ms.c |  8 ++++++++
>  include/linux/memstick.h            |  2 ++
>  3 files changed, 26 insertions(+), 6 deletions(-)

May I suggest that you split this into separate patches. For the core
and for the rtsx_usb driver. Other than that, this seems reasonable to
me.

In fact, we should probably have something similar for mmc, as
currently it's the mmc host driver responsibility to manage this
timeout itself.

Kind regards
Uffe

>
> diff --git a/drivers/memstick/core/memstick.c b/drivers/memstick/core/mem=
stick.c
> index e03989c4e99e..ea09a63286bb 100644
> --- a/drivers/memstick/core/memstick.c
> +++ b/drivers/memstick/core/memstick.c
> @@ -359,6 +359,20 @@ static int h_memstick_set_rw_addr(struct memstick_de=
v *card,
>         }
>  }
>
> +/* On timeout the host may still hold current_mrq; make it let go first.=
 */
> +static void memstick_wait_req(struct memstick_dev *card)
> +{
> +       struct memstick_host *host =3D card->host;
> +
> +       if (wait_for_completion_timeout(&card->mrq_complete,
> +                                       msecs_to_jiffies(500)))
> +               return;
> +
> +       if (host->cancel)
> +               host->cancel(host);
> +       card->current_mrq.error =3D -ETIMEDOUT;
> +}
> +
>  /**
>   * memstick_set_rw_addr - issue SET_RW_REG_ADDR request and wait for it =
to
>   *                        complete
> @@ -370,9 +384,7 @@ int memstick_set_rw_addr(struct memstick_dev *card)
>  {
>         card->next_request =3D h_memstick_set_rw_addr;
>         memstick_new_req(card->host);
> -       if (!wait_for_completion_timeout(&card->mrq_complete,
> -                       msecs_to_jiffies(500)))
> -               card->current_mrq.error =3D -ETIMEDOUT;
> +       memstick_wait_req(card);
>
>         return card->current_mrq.error;
>  }
> @@ -405,9 +417,7 @@ static struct memstick_dev *memstick_alloc_card(struc=
t memstick_host *host)
>
>                 card->next_request =3D h_memstick_read_dev_id;
>                 memstick_new_req(host);
> -               if (!wait_for_completion_timeout(&card->mrq_complete,
> -                               msecs_to_jiffies(500)))
> -                       card->current_mrq.error =3D -ETIMEDOUT;
> +               memstick_wait_req(card);
>
>                 if (card->current_mrq.error)
>                         goto err_out;
> diff --git a/drivers/memstick/host/rtsx_usb_ms.c b/drivers/memstick/host/=
rtsx_usb_ms.c
> index beadc389f15f..403144a39a53 100644
> --- a/drivers/memstick/host/rtsx_usb_ms.c
> +++ b/drivers/memstick/host/rtsx_usb_ms.c
> @@ -551,6 +551,13 @@ static void rtsx_usb_ms_request(struct memstick_host=
 *msh)
>                 schedule_work(&host->handle_req);
>  }
>
> +static void rtsx_usb_ms_cancel(struct memstick_host *msh)
> +{
> +       struct rtsx_usb_ms *host =3D memstick_priv(msh);
> +
> +       cancel_work_sync(&host->handle_req);
> +}
> +
>  static int rtsx_usb_ms_set_param(struct memstick_host *msh,
>                 enum memstick_param param, int value)
>  {
> @@ -787,6 +794,7 @@ static int rtsx_usb_ms_drv_probe(struct platform_devi=
ce *pdev)
>         INIT_DELAYED_WORK(&host->poll_card, rtsx_usb_ms_poll_card);
>
>         msh->request =3D rtsx_usb_ms_request;
> +       msh->cancel =3D rtsx_usb_ms_cancel;
>         msh->set_param =3D rtsx_usb_ms_set_param;
>         msh->caps =3D MEMSTICK_CAP_PAR4;
>
> diff --git a/include/linux/memstick.h b/include/linux/memstick.h
> index 107bdcbedf79..e86f7f6e3e4b 100644
> --- a/include/linux/memstick.h
> +++ b/include/linux/memstick.h
> @@ -285,6 +285,8 @@ struct memstick_host {
>
>         /* Notify the host that some requests are pending. */
>         void                (*request)(struct memstick_host *host);
> +       /* Stop using the current request; may sleep until the host is id=
le. */
> +       void                (*cancel)(struct memstick_host *host);
>         /* Set host IO parameters (power, clock, etc).     */
>         int                 (*set_param)(struct memstick_host *host,
>                                          enum memstick_param param,
> --
> 2.43.0
>
