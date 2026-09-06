Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98423D297
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788657639; cv=pass; b=j6IEqShbnwBsvCX4V93sAtg1o9tD6I0MO5PqgGlfPcHRejYdYTMYoOar+qhQHnErRjxSXVVP0Ndytw3v8HNjJ8NOjhWpmmULXIoQaxO8eQFpjLJxoQDVNoMiIt+dbEees6gOTiX6aK3REA6HbQ1+BCamKt08/C9jGibLnAtBAL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788657639; c=relaxed/simple;
	bh=VcpjacYfNfPXypVCdkfzz5uNjfBEJ1CeR+0zgePQPwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qm/fIdlULZVKz/ln6sWxdoMFfYtiSauL86vL1jhAENP+OTlA3q1mzct43QZhqISfoDEIxvAxXk0rJWlqhCYErxokAJrdjDIe5oiFsE/22eoZMKkhUa6p1HI3yrJeBIugBN8tTYrLG0DlUurVsC6/lgSmLGPaDmn2ZmpH2/kHl0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXzGTGI2; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXzGTGI2"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b19e291cc6so1936761eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 18:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788657636; cv=none;
        d=google.com; s=arc-20260327;
        b=dctu0vdFHsFz5SP3gQt+EH06V3+c+/cxUX6jgWooIgW7bcSpZSwOSR3Dc13m4yCmHl
         PSqtu/FJcF4uSle425If9dfr0XPq3GlkZwZpaaxp24HFJyrW4EnqHZ9W+PBAigKPUTA4
         9rqxiATafXMthUFBL361YnJdeR1ViNoblMB8UPxWM2h6AH9WVJyzvzdNKd6CvAd5jjsu
         xvR1qjarYKy1lOCSYjg9Igh/DJcgIZ4IzeNcxPVL1XQbQOnQBHTvwOv5VOgA128pueSy
         FmITBgByrG4DFciIzTQGPipZURRxj2YzBs3WeFJZbqeav+FA0xVwfESSgC10Tg5fVoFN
         Cngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vrbIhRjPzei1dtqxq+ZD3mi9kwyuQdOPberv3S+Q6ak=;
        fh=fHa9tifM0qXzAc0aZRywdVMsfvJ+BZth0okGeChS1KU=;
        b=TiVtaxKS/9d/sWIO13ptGO7x0E1FJ6yGZTddNlPQjstsDdQKob2N2BnbFKyjbPDDlL
         ezYVVb/PNXizQ2WpTD8P6YioEESRb2apiS847b7GsvNmgZINlPSGEjtTwdMzPDl/9A8Z
         Pcqms7eei8ZDYPx/YTQlcEexQHw578LOc86Cv1qHgWORdK0CEyRfmMhB/k2abGttmv4i
         KvuY1h/he7ln5eWOK6iY1p5krxxAVyuo7IMelV0zsp3rJKiyWvMeypm2CqyM6e6ubohQ
         c8aKhYErkyGw5UUVltFzrzOXEEGLGZCJKFjC0OEJa86PE0rh0lzV0CgFsNRdN8VZBAyI
         pyHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788657636; x=1789262436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vrbIhRjPzei1dtqxq+ZD3mi9kwyuQdOPberv3S+Q6ak=;
        b=sXzGTGI2TB3fZVYsMhUSBDxnXji72LlqgTByeqjUkFl04ltxHaU6m6qpJ+rSHXI0s+
         UWC8OtU4sGQQ7vO5WpHRT4iNnWengxXwtTAVoiGWD+zvnVPnnEGS3wxVjwoo2TayPZY6
         jHyZmE157KQajQFj8q/ppy73iToc6mxNrrkozsiqumnVZ3v31Bg1h+HPkiExFsYDRsMC
         HR34cN5DiHmrEWuOajA1lnZ6zh73eNRQeXzwUYfKHxOWPFycRbvMx0wHqmyzbd5vxMLh
         oO+CR8FIvzIvt5sZmDCm7BXSCAb2+q/f5WClmXEINRTtL4Sck9Bk4yUhToEY/OVDKTyF
         hi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788657636; x=1789262436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrbIhRjPzei1dtqxq+ZD3mi9kwyuQdOPberv3S+Q6ak=;
        b=fIAjGOYtIMhWlgjvGrd4hlq8j09JENsUn5oQVv+5ecuHDeakIkPCbs6GxUEjPo2a+f
         sCEk2VPi3+tMvJmCfwuD+wDnN9P0QlL+t7HdIQ6uBhUbKqFrDh1AStV8MqQ48Pc8D78B
         5iHLRBRb3CpkC/b7Cc8FByv0ussfe63VJmIsu9IQEMUHIT/yfYamh1m1O09PF+4tUqkY
         x0SPu8pTVfFHPAVzdqU9fra7eMM+EpXTcznf9yzCV2A050y5ZAKxBBMBVjxrIYv+0lLp
         QxkntgFIHHq1lOyqCdneWaQ7YOBlHbE+LG6mdF8ZJ6bCXKeHQ/xefJDTjeBvCNJQ0cmb
         Z63g==
X-Forwarded-Encrypted: i=1; AKwUvBy90TGapbBq5dNnkHlyK3OGrbgbfv2dIjDX3QWitpgDT16BQrJmd4gzaZCuW1OzH7GSL74j2IIBDbOticg=@vger.kernel.org
X-Gm-Message-State: AFuF++kWyMoHasexsNhO2VXsE7ZHIxmy+gQdKQ9kTZ1dmAs0yPb3+whW
	BuEDgkbcMSrACBlCC6gY2SBvSf8VSVfsSoFp1Ejn4VLGKtrO3eirXAi15gekf1ZEHZPsEWmO/1U
	CqADFJYsQ3cTn1EG7G80O+JgLQtLALrE=
X-Gm-Gg: AYBFou2qLm2Gq2vyuOqxuSPt9rq3nCHEp49lPV0I4CY9nXFCtLehIDS6ppBT8jGaNYV
	4jG/u6xQJCG8osU1KG/F07EsENemJ8IoiD6OWsVzuKNFjbS3u2pUcWqg5fcsdElnZwmbdQGy7da
	D5KWuejp/YZkGAvjir+heteSYokKNO7ILUCiIYemaQcBkeOHJ6LbeRNTzzI0OtT60f7Y3v7Tm1Z
	x0NBAJPw903vMtWBAjzLfkMlTDaUFcy8zhZuYMPSzA8gwBKHH7NQtAFLk1OJV47fvD2E+nk5xem
	GPtfsyxvTAA6vnWPdYuD/iqCvDhCechGW386AZ4rK38Zs3lR5pxvrXAz
X-Received: by 2002:a05:6820:a28c:20b0:6ba:2927:3661 with SMTP id
 006d021491bc7-6ba29273f2fmr202772eaf.18.1788657636529; Sat, 05 Sep 2026
 18:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org> <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
In-Reply-To: <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 5 Sep 2026 20:20:24 -0500
X-Gm-Features: AcwNN1W-1EM5u25I6sIYjSAHidxk9uQmu6rjm34oWnomns496rRML5lm1gN-HB8
Message-ID: <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Douglas Anderson <dianders@chromium.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Douglas,

On Tue, Jul 14, 2026 at 5:24=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
....
> +
> +/**
> + * goog_mba_handle_tx_interrupt() - Handle interrupt that remote Acked o=
ur msg.
> + * @goog_mbox: The mailbox info.
> + */
> +static void goog_mba_handle_tx_interrupt(struct goog_mbox_info *goog_mbo=
x)
> +{
> +       unsigned int reqs_completed;
> +       int i;
> +
> +       /*
> +        * ACK interrupt needs to be cleared before reading CLIENT_OUTSTA=
NDING_MSG.
> +        * Then if a "race" happens and another message gets Acked after =
we clear
> +        * but before we read CLIENT_OUTSTANDING_MSG then the worst that =
will
> +        * happen is we'll get a followup interrupt that will show 0 reqs=
_completed.
> +        */
> +       writel(CLIENT_IRQ_STATUS_ACK_INT, goog_mbox->iomem + CLIENT_IRQ_S=
TATUS_OFFSET);
> +
> +       if (goog_mbox->queue_mode) {
> +               u32 outstanding_msgs;
> +
> +               outstanding_msgs =3D readl(goog_mbox->iomem + CLIENT_OUTS=
TANDING_MSG);
> +               spin_lock(&goog_mbox->lock);
> +
> +               if (goog_mbox->outstanding_msgs >=3D outstanding_msgs) {
> +                       reqs_completed =3D goog_mbox->outstanding_msgs - =
outstanding_msgs;
> +               } else {
> +                       /*
> +                        * The hardware's track of outstanding messages s=
hould always
> +                        * be less than or equal to the number of message=
s we queued.
> +                        * If it thinks there are more messages outstandi=
ng than we
> +                        * queued, something is wrong. Assume nothing was=
 completed.
> +                        */
> +                       dev_warn_ratelimited(goog_mbox->mba->dev,
> +                                            "%pOFP: unexpected outstandi=
ng msgs: %u -> %u\n",
> +                                            goog_mbox->np, goog_mbox->ou=
tstanding_msgs,
> +                                            outstanding_msgs);
> +                       reqs_completed =3D 0;
> +               }
> +               goog_mbox->outstanding_msgs =3D outstanding_msgs;
> +               spin_unlock(&goog_mbox->lock);
> +
> +               trace_goog_mba_process_q_txdone(goog_mbox, reqs_completed=
, outstanding_msgs);
> +       } else {
> +               reqs_completed =3D 1;
> +               trace_goog_mba_process_nq_txdone(goog_mbox);
> +       }
> +
> +       for (i =3D 0; i < reqs_completed; i++)
> +               mbox_chan_txdone(&goog_mbox->chan, 0);

The patchset doesn't say much about the clients but if the platform
works like this, I have a strong feeling we can do without introducing
mbox_controller.has_queue.
Just use the msg_data[] ringbuffer -- we can avoid changing the core
internals and you will still get ACK for each message.
What are the clients going to be like?

Regards,
Jassi
