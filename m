Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58273D7D69
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320478; cv=pass; b=EMxbDtJTQXSUjmxS7aYJc1T/vjMeVqnj1QU6+Dv9WqsnVKVDrU525cLIqEZ6ihkw75XOOid67+h4nj1vWmWPKe5g38wghtHZ2HmLihps5C3tN1YW8B7AuVotAlW0q3Z4fA7UnttIQfUXs9yOpCgigGHjIDbMJ4hxSqUAZ3x0ZHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320478; c=relaxed/simple;
	bh=rvn56DACMqIo8M7FLWexOcrrS6MTPfzmNmybcvNwiS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnHHTpz3RUvEKbOjyM7UwurYeNdYq8AA3bF3qxo1ImJx9syHblQ/EkN75Ee2mUvmUPGw5OdXG6asIiekUnOGl+4wIaIwTCU9/Ye7qwzY6ocJQIR3mJPMIVW45H6ZFzIK/0JevtQDkoPayiKlel/uS5YsotrDL8S0OynXyElvhQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YG2Cx45W; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YG2Cx45W"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so842614a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792320477; cv=none;
        d=google.com; s=arc-20260327;
        b=F+VkL8SGdYD/qDw2ciyV8D0QAqE4Zp95eA+3VLX8m1q9zJ6aimAT+xui7+0BOJFTdl
         q2xXs3IBtTtTbtF67Z4Jclkld1+pnRd8Szz14wGCGED3KBvj/iFVICZNCJGT44jySulJ
         Pe6yuwI1Sx1YrwTYuFr/UGGr/HyZfvpJj8UcuGc7VR5K/zsGgN3SFPk+CynZRcj8GW11
         DRu/1My7P7mv9Od+OZEOk8xlON0pnt8EED84bu/aHZU4ZpIfhDedEb/StXVdxp6YxWUu
         Z1iumeiviBxu6kUshoGS4E0p1YNc0QbgcvXezbakQgC/XOXhwGgG1YoTElpUcEBo9jSK
         /Jlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ycigQtHDdSm8L+VPTdesboZLPpIJ02aiy7LDnRARo9M=;
        fh=WTGZdRU37FjVgPWL8yTufcdQewhLALaRAdKXTcTap88=;
        b=HBSAHLxUB1WoRnPzYEuCbi4cqZd5zQ6h6lvlznclEnGpUbpZfp/8PrqujHHlUr46ky
         a7j5x8JAWtAALCWslSmrgdj3Xu6A6OhwKhX0K8HTzbT9za1H9yrm7kc8deoq1z5IjxZT
         juF6VHJAOwjwaA14Ekv+K4DNf45bY5M2afjODN36/Hg9e9gic3poMWFe/I6MNvq9pvta
         AVy7+I+nkuaCljP9VjaovhA715rzjxTrSXbnhQnzSP65iK9F8uzCkJizoY6GyXAhRWqq
         BdtSNn1JOyYDH97rAflF2lQu5I7Zb5riZyQPiTqMxvX5fv/UOavq3F4iNtz9146FooRp
         YDOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792320477; x=1792925277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ycigQtHDdSm8L+VPTdesboZLPpIJ02aiy7LDnRARo9M=;
        b=YG2Cx45WhVggVCXdKY4RWB7nw0nX1BUWRmxwntYfLvOJBOX4vH6f0Xz50tnL6mqOMn
         dmGxHtH5ho5MC//2QxPcyoogM+RFu+d9goDUYTJ+ybGXCArixibsQwSGKhaDtg/I+S4P
         Yq6wBmIRNAqTHjFp/GS/fkACkxGyrWtI1PXIMqP5p3eHpoWG67130ni6kqUCyQkl9TwX
         1X80+pk9/aZupyP/0yOK5wRrjou6p/exWs5keVcBMK9RleXuB36ZCJeIjceSeeSwqBzM
         alCMTTeNe/iZY++Bd7wjxwxy207LPIm82tlCqTzpgR8kXC/F3AkqLBqBF6uKfAcOpP8L
         aFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320477; x=1792925277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycigQtHDdSm8L+VPTdesboZLPpIJ02aiy7LDnRARo9M=;
        b=c6lVdM67h1VjrQu/vFuY51h2FmTFw+gCK9k/RSZb62eQBUFZfk/GR4fiNmawTG+v+S
         S2eGNP/9cMBmHnof1RvOzlS2TspTOzeVBdeLyISnpAShe5m7+8qmFZpOoRSX+dXB1e2u
         vMdF9Wa7vw6Q8Y/vB7FnjP+gtrMdBqxZF/0IUPe6U7M9Yg483IzWpdlwF38Qw7kSs6la
         SDihocbSrT1jAgp3V3jFtcacRL6S1tygt4cjPI6q9glhGVTsAqiSHJorswJls5lF6qp1
         weioa3I860sLHWM90NSkhxV+HCz6Gi3vR7m7JWLu6XNFbq1WhJRn4+eTRFrSRnL54CJg
         p3Jg==
X-Forwarded-Encrypted: i=1; AKwUvBwe1Ey72PmyW8SQfW7JFWHbYWiwa+FYHgMz6DFkcOUK1RDHe6jk6ZJrSqtK+hAwrxisqArgOC4sWuYlYZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcVubxw+K4FdzBQJ9fd3OEnyeWozUWXAI1JoW5gR2r6xoAEdUm
	IuhS0WFlksVla5oejq3WWBp/ee7cHVpCWGo+c0ZIlA5JP8mohcP4LKKju+hlePV3SONDooq87AR
	JALnjXG+7BA4o2jp0jY6EmzTsQp2z2bk=
X-Gm-Gg: AYBFou0w5sLGaFIyr8ogwFzGeXvFd5X2UKM6pdttPxT4vovMPp3CXCPKkWVexjzajoq
	JQ3rfB15pxFjdxrrgqsdYHSN2bK0DlPbOrWnlP2kkWM8lpXkBNCrm6X411NfGzJjUgMS9KSjzz2
	EyvPs004Kadyxgsjj9J6Q5GOuKGDx5imXHkO8Aic4MTdAuJtAUN5X8SCuwLniFuULzC8b8XNezo
	Q/dJ9jS2771rBXv6gBOyS8+R+YeOllg6jp/Z8XmJcCK1Jd0KlU4aE7L0F+g4ktlE9VejM3CRjDP
	9qVfBOQRQT9TrlVIezpOrGy/+/acivcKyAoqDCTQt7+CwPWBiUlT3BjupFrZytWOGubG/IwmG6/
	QqMC+PPBzG8d35hREzYDPHGKVqnfaCa9czhsz3MF32ht5
X-Received: by 2002:a17:90b:2e45:b0:39d:e445:1d44 with SMTP id
 98e67ed59e1d1-3acbb8e8f6cmr5919915a91.31.1792320477003; Sun, 18 Oct 2026
 03:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003021147.7461-1-kartikey406@gmail.com>
In-Reply-To: <20261003021147.7461-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 18 Oct 2026 16:17:43 +0530
X-Gm-Features: AclHuK-LRWf_G2BiEQ3NqCsZ_mjE4ZKFwitU4ANfQ1Y-g1uQXxMxATjLN8cVQGY
Message-ID: <CADhLXY6MVuBnfKaTiLUXcsaT4xnarVYj7uAzJSqngWdJ4aRKJw@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath9k: stop WMI event tasklet from rescheduling
 itself on probe failure
To: toke@toke.dk, jeff.johnson@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 7:41=E2=80=AFAM Deepanshu Kartikey <kartikey406@gmai=
l.com> wrote:
>
> Since the init guards were consolidated, ath9k_wmi_event_tasklet()
> reschedules itself until priv->initialized is set. If
> ath9k_init_device() fails, initialized is never set, so the tasklet
> keeps rescheduling itself while the probe error path calls
> ath9k_destroy_wmi() and frees struct wmi. tasklet_action_common() then
> touches the freed tasklet, causing a slab-use-after-free.
>
> Make the tasklet drop its queued events and stop rescheduling once
> wmi->stopped is set, and call tasklet_kill() before freeing wmi in
> ath9k_destroy_wmi(). The probe error path already sets stopped and
> kills the RX URBs first, so the tasklet cannot be re-armed afterwards.
>
> Fixes: 1af8dc9ca726 ("wifi: ath9k: Clean up device initialisation guards"=
)
> Reported-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3De91dc13b1b37759b3d9f
> Tested-by: syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/net/wireless/ath/ath9k/wmi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath9k/wmi.c b/drivers/net/wireless/=
ath/ath9k/wmi.c
> index 4a08babb6d9d..f8b174b0f209 100644
> --- a/drivers/net/wireless/ath/ath9k/wmi.c
> +++ b/drivers/net/wireless/ath/ath9k/wmi.c
> @@ -122,6 +122,10 @@ void ath9k_stop_wmi(struct ath9k_htc_priv *priv)
>
>  void ath9k_destroy_wmi(struct ath9k_htc_priv *priv)
>  {
> +       struct wmi *wmi =3D priv->wmi;
> +
> +       tasklet_kill(&wmi->wmi_event_tasklet);
> +       skb_queue_purge(&wmi->wmi_event_queue);
>         kfree(priv->wmi);
>  }
>
> @@ -148,6 +152,10 @@ void ath9k_wmi_event_tasklet(struct tasklet_struct *=
t)
>
>         /* Check if ath9k_init_device() completed. */
>         if (!smp_load_acquire(&priv->initialized)) {
> +               if (READ_ONCE(wmi->stopped)) {
> +                       skb_queue_purge(&wmi->wmi_event_queue);
> +                       return;
> +               }
>                 tasklet_schedule(t);
>                 return;
>         }
> --
> 2.43.0
>

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
