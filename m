Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05052282F17
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768975; cv=pass; b=XDIQ7flgmbgoV7mEWRN3i3QKxBQSm+YXG0vGFJMZj7UVra5gja/cmYusUuQ3BSeA/IdEG22KvtUYh5eO1XU5L6Ta7qwBzOPynD/O3gzX5rnvzVjveaKmd77EP7B09BKBz3zSbkFDHkXz6UOK9N4zUNNKryYJg3sYicW8/7Tko7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768975; c=relaxed/simple;
	bh=ljdQEShiOOPAwoOVt2hU51AqAKYjVmOAfF1W+KHoDbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNHEiqybsSW2k3dR7LhH/2Au9ZNm8zDZFAmN1f5L1CJHl2a+Q9G/1L0860Z3krvKE2CQgPLW6noXMKu9CwrV8Na/PgcFsSH/V0g+djbk0P7b0GY+XCH/xhEMlVnWaYrzNAXl2MX/MixhI2maI7TcWRGpq3Sqh00xmrWXLE1ghzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTKuXld/; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTKuXld/"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c20ce3c118aso79253366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768972; cv=none;
        d=google.com; s=arc-20260327;
        b=RxWR/pHZfBV9B4vI4vpW/B6cNyrWPv7EjyQ74jjoqy1m5RRQNTslBZLxULck9PYYkq
         KyaOK8qlfYmUTOCs3nqx6x6Fh+cAGyKXYfG6iaSFxQ1s7M9lUSkqiE3t0nRrmebY0pT8
         7TwEJVdEgdvGHgBLd4JVKQ72NqaXBLWbnGqhbTCzEOPTUdgzo1wXhOP1yzwsL6YIvDOw
         9snf9gCDuLoLYQ9euF1un8IGF+zSCTVlOIo7emOglD/jNNnpnXAbOOkAXTRTP8y/JVp9
         RpTxHM5XKmzK0nULD2VRgJDKX0HFUcGTeofETSKjSPks9GC0Q3NKK45NZgS3SQTgagXa
         pnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pRJzm3jHrj/ruI7adqKm9pQj0ydMWP7SFKiDw7dmzpQ=;
        fh=SFoZIu3loKb0p88X6Nm2jcjO8NjSos7X0LR0soZJLts=;
        b=q74FXFrh5uwy0v6gReZXlgJLa0UAoJifGqfz/6d5GxgyRYXVXvjJZtWQkVaSG5NbX1
         WI+peHmyM7k4JxAWI/k8wscfCJsEq67u7lTzwaAjcF3o7olnzR3RLX27SxpUHY5aJOWg
         b6M0/gXSp2ppQCVVC/i0FnGtvwgyVr8XGwtfhDAvVgXDUmjB9+/uRkrefTMIBO54PD7X
         9w9ocIq6dMVmPZ/vJLaYpgPxl69z6pQ97SHyQVo+nzncfVRvOIHFB9N0MmU4A7d2xrWq
         zTzw85Cf47kxXZ4z/7er0fRs6R6W168mrDKSes+lCKowqg96Woc0+CT+9+UmFmVJTOla
         OaGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768972; x=1792373772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pRJzm3jHrj/ruI7adqKm9pQj0ydMWP7SFKiDw7dmzpQ=;
        b=oTKuXld/DxFjSjT9BygcAvSfzel1vRme8z/npCS6w1r9xByOHpVn4dI4NDKurDUu0Z
         tvh06AMYfBMxmtYtgVoYEt6VPUKbsyKXjUKfOEfF4nc2q2/6n5VMTTW7bbQhm2scj3EA
         7wdJEfUCP9creWtBIeG2KcrvMY/Q48ZitiZHB7JDqiWuysIDIr3K6wrGccT3lFc1UTVp
         Tyw5M8EdBkk/eyMr4/iXZZG/qpEBufDoGIhTljWxM+4QVoJuhOaks5ZKBuVkOm454ZyY
         68wuzsRbWKyo2FyN5QzaTvygQQgOL/BiAxXVBac9mfzyEGmvkdmJmwcJ9sOxYjzsTR9o
         uMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768972; x=1792373772;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRJzm3jHrj/ruI7adqKm9pQj0ydMWP7SFKiDw7dmzpQ=;
        b=Pzeo63euyUAXR8P9uOk4oPTFuvMABFo9foL3celG24Q7+FYUwdPZlIXMUzrbcIg2Qd
         fS8VTTHZWrNAcYNT0vYKwlWm6UjNKtBdpRVkn8yBgh+KIzPZQGXnoeOFSOFNJuoVB7lf
         Dy1ny4E7IBUIKq3zJKq3r7aArH0gxhaXOby8vQJEeMg3slyVhwIOyZiaJetWPI16mk+O
         YoTTDwN2PZOehc35A8W7FhRNSNUrkFbTu92HZL2BakzcLRp10aAw5eniRuwfiPWF5GHl
         33zjlq7ZjeVD4QFG3E2Gr2GDOa1LeuQtqjgwp57Th0bMWo2W8GKXMVIoT0pB8E4IBCw2
         oxFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWkzmzGXcLzA35d1AHctw5JNM6kEySJ0wEyuFxVHqG9M2mKszo1hyUTTnuOkhpYkFVjgRkuDjttKpVaBI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2PUraxe40HFM+QfBQ+kkJCtz7Itd2mnKoMrHkKaRmZ8c65HBi
	ckePabIEe7ED7gEBlX7VddX4c6v2hqWK/U/nhKEWfx5/AZdWYgRFe7G1uBVogn+FHo5uvmIM2fy
	TEnjb04z9kzELN64keG1uk0xuHMWLTis=
X-Gm-Gg: AYBFou09/5vaOU/5YvsySEVIj4bzkWo1r65naa5H/AG1nd2l4jkK8KLFKBhcCc2nSpM
	HQWNzq5gCjQSCuOCRxm1p/9D4IkB51pQNGjjCtkKh39Pt+kxVBkuiXqSoCkcnO5eO+zs8lqN/k7
	3CSTCEGOSI7Ra5qmfI8XTQWAeQIsnFR8067ORujc7o9xye8NW8zs9tvm4wFopbe+b+jFSax+haT
	M+3LRQV69Mo7ub17D7EZg0T2EWQcGUQtMV5csnLJyxRuan3HUDT2ErnInaWFP1j/bbVNzpzy6ec
	9T4+1xA1/T9nnmXnUIbWm1zhArs1ReTuk661dg2vx1AAed9ObHywq5kRWFzFDsR3WTA=
X-Received: by 2002:a17:906:f59d:b0:c2a:b008:8cc0 with SMTP id
 a640c23a62f3a-c31a70e5566mr895411366b.28.1791768972219; Sun, 11 Oct 2026
 18:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825191619.2326087-1-danesh.petigara@broadcom.com>
In-Reply-To: <20260825191619.2326087-1-danesh.petigara@broadcom.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:35:59 -0500
X-Gm-Features: AclHuK-jmGcB6_gt3zARFl7Qv6jk6y3pW7z7G2xY6_LMJwZ-HcWR-1b9JgRQ8VI
Message-ID: <CABb+yY0mdSPB+rvtmttUu0R11=4u-Zepmwkfd8ALCT5cPr0AYw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: bcm74110: Cap rx_svc_init_list growth to prevent
 PMC-induced OOM
To: Danesh Petigara <danesh.petigara@broadcom.com>
Cc: justin.chen@broadcom.com, florian.fainelli@broadcom.com, 
	james.quinlan@broadcom.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 2:16=E2=80=AFPM Danesh Petigara
<danesh.petigara@broadcom.com> wrote:
>
> From: Florian Fainelli <florian.fainelli@broadcom.com>
>
> bcm74110_rx_push_init_msg() allocates a GFP_ATOMIC struct for every
> BCM_MSG_SVC_INIT word received from the PMC co-processor and appends it
> to rx_svc_init_list with no cap on list length.  The only consumers of
> this list (bcm74110_rx_pop_init_msg_block / bcm74110_rx_flush_msg) are
> called only during probe and at shutdown respectively; after probe
> completes, PMC firmware can continuously inject BCM_MSG_SVC_INIT words,
> exhausting GFP_ATOMIC reserves and causing a whole-device denial of
> service.
>
> Add BCM74110_INIT_MSG_MAX (16 entries) as the maximum list depth.
> bcm74110_rx_push_init_msg() now checks the count under the existing
> rx_svc_list_lock before allocating; if the cap is reached the message is
> dropped and a rate-limited warning is emitted.  The new rx_svc_init_count
> field is decremented by bcm74110_rx_pop_init_msg() on successful dequeue
> and reset to zero by bcm74110_rx_flush_msg() on shutdown.
>
> Fixes: 52436007b862 ("mailbox: Add support for bcm74110")
> Cc: stable@vger.kernel.org
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Assisted-by: Anthropic:claude-sonnet-4.6 cursor
> Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>
> ---
>  drivers/mailbox/bcm74110-mailbox.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/mailbox/bcm74110-mailbox.c b/drivers/mailbox/bcm7411=
0-mailbox.c
> index c8709d509912..bec138d76914 100644
> --- a/drivers/mailbox/bcm74110-mailbox.c
> +++ b/drivers/mailbox/bcm74110-mailbox.c
> @@ -97,6 +97,8 @@ struct bcm74110_mbox_chan {
>         int                             type;
>  };
>
> +#define BCM74110_INIT_MSG_MAX          16
> +
>  struct bcm74110_mbox {
>         struct platform_device          *pdev;
>         void __iomem                    *base;
> @@ -105,6 +107,7 @@ struct bcm74110_mbox {
>         int                             rx_chan;
>         int                             rx_irq;
>         struct list_head                rx_svc_init_list;
> +       unsigned int                    rx_svc_init_count;
>         spinlock_t                      rx_svc_list_lock;
>
>         struct mbox_controller          controller;
> @@ -148,7 +151,15 @@ static void bcm74110_rx_push_init_msg(struct bcm7411=
0_mbox *mbox, u32 val)
>         msg->msg =3D val;
>
>         spin_lock(&mbox->rx_svc_list_lock);
> +       if (mbox->rx_svc_init_count >=3D BCM74110_INIT_MSG_MAX) {
> +               spin_unlock(&mbox->rx_svc_list_lock);
> +               kfree(msg);
> +               dev_warn_ratelimited(&mbox->pdev->dev,
> +                                    "PMC INIT msg list full, dropping me=
ssage\n");
> +               return;
> +       }
>         list_add_tail(&msg->list_entry, &mbox->rx_svc_init_list);
> +       mbox->rx_svc_init_count++;
>         spin_unlock(&mbox->rx_svc_list_lock);
>  }
>
> @@ -225,6 +236,7 @@ static int bcm74110_rx_pop_init_msg(struct bcm74110_m=
box *mbox, u32 func_type,
>                                  list_entry) {
>                 if (BCM_MSG_GET_FIELD(msg->msg, FUNC) =3D=3D func_type) {
>                         list_del(&msg->list_entry);
> +                       mbox->rx_svc_init_count--;
>                         found =3D true;
>                         break;
>                 }
> @@ -248,6 +260,7 @@ static void bcm74110_rx_flush_msg(struct bcm74110_mbo=
x *mbox)
>
>         spin_lock_irqsave(&mbox->rx_svc_list_lock, flags);
>         list_splice_init(&mbox->rx_svc_init_list, &list_temp);
> +       mbox->rx_svc_init_count =3D 0;
>         spin_unlock_irqrestore(&mbox->rx_svc_list_lock, flags);
>
>         list_for_each_entry_safe(msg, msg_tmp, &list_temp, list_entry) {
> --
> 2.54.0
>
Applied to mailbox/for-next

Thanks
Jassi
