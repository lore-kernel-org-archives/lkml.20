Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794189255;
	b=o79s59dcRKW9Kgs98XTIEiK1YUfpbyFjjouchuHx7IcyTik73I+FE2Qc2OodiMGJVwIU
	 PKigF+eo/z8U5MlK5zCfFORh5nmjuBisJCXgQ6ol1DG6elKU/OItpc4LdReTq9Py6zmq/
	 xoZi9KbDEMHUMBd20J47SeAiYRgmle7NC61zAhnBass5EVlpFv1SDWUA8q1lEw7she6rh
	 mjeeCQFqrprCgZoo/SvOEhY4RFHdPLbFEnyb2sdsi0QxK49H0pzHU824DbKXNH1w6C4JA
	 6C5TWbDHvS1EN4GLl2kBxfHtVbDIE/w0NxN6L7oiyMBqMILzTGYviWffTM93WxTnwoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HHqibTCR5wIYV/KIN13s6UP28CbCL+8jKFmB5ThhWLk=;
	b=VfeuaYQvD4mMtuyeuQEmtKpcVDKIxZh9FuIkYL+BiF+rBq0g0fGPsZ0LNZNTsey3QKzY
	 vveKGixKIJfHiR/YXL9PCfgOzxqmzT59AIuS3Sid7dnhhS7QeMOxBzoGV/1b7vGXSOqmC
	 Ho+V2fuWi15dhSsarUPTsHS2VmFfw3DZKXD4a+pg2Vs+ImJxgaMI80qWQpfagpaUtDJHI
	 oWKLiUucovUItsns/9QvJcjqro1jcBSyI8qxqBls4App2esqK9fLfmNsOYq5aK8Wa2KEP
	 sK8Hywcs3iOGQpbhRHw6eXXUOzt1B6Iym1jjfJv3GtWf8noWWpWxa32rLdzIDrrEf6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IsQ/XDT9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620D5606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 620D5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsQ/XDT9
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-833e671ee9fso393151a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:54:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794189254; cv=none;
        d=google.com; s=arc-20260327;
        b=q0vA+ubdqSd9HrI2dg1EmHxQZnL+VhprAnOCAdmLdIDJz/oBixSMXU2vPJjRZNTLII
         +QHzIQqa95dvF1zptQwJ27IPszxRnsvzfwMuA2mCg/jxPPYpKoWTjkF8O4iAWWThK/Cj
         LNZfb4xYWeDI1cSYVoh2WVlCsDl9eI6c3AVsOoRyA/MFdnCwVlwYFIFTBcD7YEa1m1Er
         aTB8yR7VgbB5HRgjaStFSaMoi+UXnApyxKRqpnAUFbsIQODkMzG9IMUaWI6u0TYdVoFj
         iYichRmIkgJLlJa8PerObu/dYlFfHyzm+VMOUKdhdfnpX1FeYO3SQsCiq+X2lKb4BKIx
         b1TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HHqibTCR5wIYV/KIN13s6UP28CbCL+8jKFmB5ThhWLk=;
        fh=wVFoy+X1uoMDkLDwK6trmE4yH5EqOZ3yEniLhBeJnKY=;
        b=Y1OMqu2K8oLjzHxJkupwpDyL41LZFk4MomoIExGbLs/av91SGEXaziHsH3zJRcfMIa
         sZ2ef/iAcZvjfhGccJoHdSjeRmdwSfi9nCD0rRwfA1UeqUjz4ghkHDsdxcfZWbQnAYRv
         y0ttyuzTUCCcKUPxnLNrRy8tc/oykGT+zsnED1Yff7HFOlFfS50GHKHDDl+0Q3wyvh6W
         AeNVGHZvlJ4TCkgSeJNgZO68zcv+Av2L/t/2Ql1KMu9adivHXPwQj4BMCfUNw+dPmlcO
         JLmJ26hGjSOwSCxCIL+D0Ho4kDFDK+8JWiGUkSoGPeoYlAU2CdFSsuolaSVm/et4Xwg6
         TiIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794189254; x=1794794054; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHqibTCR5wIYV/KIN13s6UP28CbCL+8jKFmB5ThhWLk=;
        b=IsQ/XDT9i/AwgbBrEU5Ic0at//FpqdtsuFmjeJ3b51SEhgN7283yobP6GYKLRL2Nh8
         bkZ/zTIz2R2XyajRzUKvWwS+fr0wrrmZsGuAFIwxiz3JyPnHwXQrDM45ynQHE37mIKYZ
         WKXgH0ZGkYWNf94DhpBt+CTl/uRKTbxRD09FtyWNwUg0UyZWPbsIzPKuLDndCBY36nd1
         9DiLfUmSaDO8trl49w3iCHwKXVqGFwNHHPxHSaTdkGMS86y6mfpBzwt1gA/vFKSMb2WI
         Qw7gpNA/95m26aYzlhmr8GlFpAJKTVkoWFCZtRnB2geKXGB/4HLoDbWtxd4/PymBU6Bl
         8ipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794189254; x=1794794054;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HHqibTCR5wIYV/KIN13s6UP28CbCL+8jKFmB5ThhWLk=;
        b=bLxS4bqiv14gg9tgHZVki+q17mQa/xInzWHIJiSJb49WYIvI1v+KbVwsDioEQlEZdZ
         1MFmHRww6g4UEMs3Nz0C9aUJQOj0BHIU994UmDrDrXHp/EOsAjBUuRfdLUmlDWO7c8mc
         UQ6ZhN+aj3kPcABc9hUAtxl6Dd9qMJx6vYoKnLkF6Co8KdylMRaF4tsoBK+5eteIL+tI
         1KKYQERrP6rvsT+eKnLRHHbsSMmf69hxrJR7dllaEnwpNEt8KTps1w2IMbEt3l7NSPpv
         KzrsBtkoXcSf7H3jfQ3soM+WuUFLqYuTa1KcrDpO8LTnx/9LSyKILThg3Qkvdt2zAZLV
         S/xQ==
X-Forwarded-Encrypted: i=1; AL+hErFVD64UYDqJV+Hk2CApYgLuN1junwpOU+nZh4hQoRdGDjVf3KJidaRS0Ycaf/AHvDk4vLsI5pFcNt3xBeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GXtEJbudoV1rDjhVFZA+NUpU8W6e7NpnT1Ibf0PSaVlJ4Oy6g
	JsNimCy1Ai7l2L7eh5jJiA8jJL9aCgUiFhuHG39FoKo0TA7+iOpsNPNSyqHf5aGa/T7GL440aYd
	iFiu86iQGz4ZKbMRT4zOn4BEgAP5UvKo=
X-Gm-Gg: AYBFou3mj7rUmYVOZjM7YdXtEWltDs+KTdSAWszterKTzfp7IK8MO3jIDBmEGAzCCAG
	SjDUFDsmR1CjCpLrervWALBXtEpjsdwBAFnfrVM8YDvo9JqpC3pQpqTlEelBaO85mWepNpw59yS
	UDvlhvDUULicbrogmfoi6l2Fj83JI2pvFKbGZ1zi3IL3e7AzwM8ynbd4cuKnSRjZaXlp7X1OTXW
	MYwvwBwK3EFtR0Sg7JucKp2xKGqt1r2t5VhjplCv28oqDVozFhctIoJDPz0xYSz0XM24svKFtRN
	/YgigL0pJnW4K3w6kMWFs9zZXCeC+ww8kS7vz9Y2BuBOsHhc4/KqssrqAam3xUBWLX6tOcwI3o/
	gT0QR/A48tj+fVivK3otTva1/rmXre8sOYy4JAxBx+r4gAsPL50GQNukGpebh4BoSoNZk
X-Received: by 2002:a05:6820:83c7:10b0:6b6:c0bc:365c with SMTP id
 006d021491bc7-7170f2b844cmr994551eaf.22.1794189254232; Sun, 08 Nov 2026
 17:54:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103095256.949327-1-hjf3108@gmail.com> <20261103095256.949327-5-hjf3108@gmail.com>
 <e826d25ce74e4d839f2719509494c129@realtek.com>
In-Reply-To: <e826d25ce74e4d839f2719509494c129@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 9 Nov 2026 08:53:37 +0700
X-Gm-Features: AclHuK9Kg-B18Wze4SmrNfYZu_MVp6DLqT-Zh7gXPblkHjY1rijIvegMp2DIiys
Message-ID: <CABOQOSXX=3ZPfGmXBLfHPcGK11dqMRZ8vAC05OtstQtWS7Un6A@mail.gmail.com>
Subject: Re: [PATCH rtw-next 4/5] wifi: rtlwifi: rtl8192du: enable USB RX aggregation
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 08:44, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Ho Jie Feng <hjf3108@gmail.com> wrote:
> > Allow RX aggregation of up to 48 pages of 128 bytes or 24 with two MACs.
>
> You can describe a little bit how you build separate skb, especially
> the last one.
>
> >
> > Test results (2.4 GHz):
> >    before after
> > TX 5.2    6.4
> > RX 27.1   32.0
> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
>
> Acked-by is given, but some minor comments.
>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>
>
> > +void rtl92du_rx_segregate_hdl(struct ieee80211_hw *hw, struct sk_buff *skb,
> > +                             struct sk_buff_head *queue)
> > +{
> > +       struct rtl_priv *rtlpriv = rtl_priv(hw);
> > +       unsigned int offset = 0, pkt_size;
> > +       struct sk_buff *new_skb;
> > +       __le32 *rxdesc;
> > +
> > +       while (skb->len - offset >= RTL_RX_DESC_SIZE) {
> > +               rxdesc = (__le32 *)(skb->data + offset);
> > +               pkt_size = RTL_RX_DESC_SIZE +
> > +                          get_rx_desc_drv_info_size(rxdesc) *
> > +                          RX_DRV_INFO_SIZE_UNIT +
> > +                          get_rx_desc_shift(rxdesc) +
> > +                          get_rx_desc_pkt_len(rxdesc);
> > +
> > +               if (get_rx_desc_pkt_len(rxdesc) == 0 ||
> > +                   pkt_size > skb->len - offset) {
> > +                       rtl_dbg(rtlpriv, COMP_RECV, DBG_WARNING,
> > +                               "bad frame at %u of %u, size %u\n",
> > +                               offset, skb->len, pkt_size);
> > +                       break;
> > +               }
> > +
> > +               /* The last frame keeps the original skb. */
> > +               if (ALIGN(pkt_size, RTL92DU_RX_AGG_ALIGN) >= skb->len - offset) {
> > +                       skb_pull(skb, offset);
> > +                       skb_trim(skb, pkt_size);
> > +                       __skb_queue_tail(queue, skb);
> > +                       return;
> > +               }
> > +
> > +               new_skb = dev_alloc_skb(pkt_size + RTL92DU_RX_HEADROOM);
>
> What is the purpose of RTL92DU_RX_HEADROOM ?
This is for the radiotap header, like in usb.c.

I could drop it, or add comments or a commit description to describe it?

https://github.com/pkshih/rtw/blob/rtw-next/drivers/net/wireless/realtek/rtlwifi/usb.c#L582
> > +               if (!new_skb)
> > +                       break;
> > +               skb_reserve(new_skb, RTL92DU_RX_HEADROOM);
> > +               skb_put_data(new_skb, rxdesc, pkt_size);
> > +               __skb_queue_tail(queue, new_skb);
> > +
> > +               offset += ALIGN(pkt_size, RTL92DU_RX_AGG_ALIGN);
> > +       }
> > +
> > +       dev_kfree_skb_any(skb);
> > +}
> > +
>
>
