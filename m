Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793475881;
	b=fFy60yEk7A5bwjdm3WRTEAr+jTCcNXmb4IzSyBr20+2HpMTuOM6IHp2ZNlKo8l3URmuN
	 e6cBjTXXSliyfd0Lh+jcq1v8FNw6Se2egy0ihTNc1uI+An5DDgOLXSiDWEamh9VVT1C8r
	 Q6sRvfP1nf1Yd7kISiBGw+h6rVTikJkn3YCjlWBrXHwCF6vsDcEM8GoytqYY9ZJl4dyME
	 6NFLPTJJPnQr+4K8s/itPcZ1LZd5nGokyOu9ylYmvnwB1WYoXYX9C2fiZbM3WjlnG+NgA
	 sbSsZc+4sLT2C4rrSX1ICTVGrfhnjk4JoNxJ9LTkmf5MgeLLmLYVDyaUaNeneIDP1pQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793475881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qUontYmEH2HkYdY4QrR0ZkisJx/DKWqA4/3BYHd78Hc=;
	b=TGC8ug9Oke1Wl+42ljzIBmmOtOvyV5hVXoROpGxEKuAW+lJkmAXVMFhy27RLa4vIoB2t
	 t1Be7SMQD0k7BfBhpsdYqiscWuFKVB5kWsC/Qi5XR1YoNwrnXkX2qoAMW979sQ2M+VrLx
	 G/qlJfGg9hOZ+N2QDdLqclwX++2y7SlQafcumNgiO6z3mUo1qdYxmV63lciY9wsK6jJip
	 rdDeNERdBCWCiMciyTr74/r2eiRo5LQH5E+niy6j+3kM89s9vKB6eAjYtplhaqxn42rNa
	 gcV1OOnEAAJS4BDj2sz3eFjdKcyYCa3gcwk9eHbMUhVd7gh5L8tgaqtvFrUHLF1xdIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0yBFGP40;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D85606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D85606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0yBFGP40
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so2426304eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793475879; cv=none;
        d=google.com; s=arc-20260327;
        b=F9ltRdlIC2WJsWse5WB2QNqKu4ocXB7qV6VnT7eP1LMMKe04Db5AIypUPxrit0qLR4
         V3pTzNQPfnzO4jKCmWiEeJZX70XPh/DdIBdz921uu0BpP/DnipEPHDg/lfr4LG7DC0rt
         phZfXZ4s4SwU8Oa/jfj1sQpGNmzqtFp0h/fjqXsrZCGMr2Bjicvlk2watJZkcXqHnKA6
         zpLKypXNAVZkH9ee1xqv8vgJ62i9ok0kQfHHK4QLzUL9TvwzMk43J/2+mK971v/O3jkR
         8K+tPwZloHZxkmAsPW9Bnfub/xkIyag+29hYity2NlTgeka0MCxIOr/3a5R47l/8e6/9
         FOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qUontYmEH2HkYdY4QrR0ZkisJx/DKWqA4/3BYHd78Hc=;
        fh=C9B2RSIuB5cSI0iayqvvCk9xRZidjffPdfLdB8LBLCM=;
        b=NFTtWhaawfpOv90gULRDt4j0tHbZSxfQmvnIEebn+qZfV++gi/q1nnVe1Zb1LgYmj8
         X6y6VLV3q3yERNHdwjtch7moxOtFr+rGhgF2KlIcyoQcHvQHZmqY3F4dnyYo1ZBXlMwq
         uYpebirkMfV8T80VlLXwRVnJQdMFxXFHIUb7R3fKbHN8HIcUO7KuayYcWYTXGpY/Kss0
         ZKCMUzzwo7Dx6kl+6vf92GHRk7C4KtKq9aukEjMAOpX27sE/+pNHOMved4F4YtVfinO8
         nCjUZ05AAT19XwUSp1xU882VOO261zd3gW96hEAd/P+Dd0mjje4IkHT4+d2x7aj8suqc
         u2fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793475879; x=1794080679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qUontYmEH2HkYdY4QrR0ZkisJx/DKWqA4/3BYHd78Hc=;
        b=0yBFGP40/fs3Qp4W4JTnkd3nrZzw2re3NnE7MvKeJspxHh/24BQnRSSmb9GAL4QUwJ
         PGypocn2Z8RyqbI5LN5AFC60xB+WchFfPt8NYcXTuXOJDe712QfpvnqZQ5eBf4icqvr6
         7GJzR28V28Wgehz1ymo8NHqm4DUoTqVlK/HCGsmAwnwjG00UQu1B+q/M+1jTGnAplYDv
         Sl7CgqYiLhm1Wc3fXHcTS78pRIkN2ZktomvR0yjS5+4O5D+DUh1tfOYBvuxtouCn3hnA
         vqj71Z/vd32Rp9yFATgqpo9J2sswaIvbMfCbtbTLpDMHgnqvsYKGwXKljOX8yhbRYJqy
         23KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793475879; x=1794080679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUontYmEH2HkYdY4QrR0ZkisJx/DKWqA4/3BYHd78Hc=;
        b=ROkiQy49Nz1lPwPjSDRElAYV6FvXAobPh7yaoigQ9uWlq/0gYqquPRb1oLEz4fjWtX
         Iupl3oNVs/9cuoGVcchdwunGZJq7sAx09rsP5PLDqLSNxsVJEfrKd3xgC0ErW+iEJlgI
         vdHT8baJaSJoEeyuio6qzUtCn4DLt+olZ3L45loOnaMMF6CB9EZDiGO4O2gP9bgBIkCR
         dAwVayQhncVE5EekTKdkBzRkcPwUGJ6ioMV4qzaN6WP3I/qfertDJ0YfwXgpMsB4tMKo
         rEkB/iR8hEuRbIE96u0XejrNqwM7CrgjWsoP2nVDrjokXb6kmjHDZrwd6mfn/v3wG+NV
         0o8g==
X-Forwarded-Encrypted: i=1; AKwUvBwhRW7iQlTOO2c6zGUMa9r9TxT0rbE/pW+5eR7ZONCKKnKoQSzi34+SSG3/FGORKkF4ZgeuW1JJBzkZIZ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnypEUY/S8tuhQQlZGTrYpnSY2Y5qQiD7bmfxgDc+wXaVCI8+7
	uDFUJC93J3vyyKKd2cieEc/Po93rnxFDrZstdAtXE2PGVu0WUvgQ2jERo0C6a5N3OaUt6W+LH1B
	Y0GJ5+B7KDhvpL9hLiY9r7IEiuJhcpeY=
X-Gm-Gg: AYBFou1hkPKigrsRRqZPoT5g+oIFa4+XOiN9lJO0JsDacWGWcp0Jjd/ug8ZJG6kU8LR
	xnJd1zBRjOzS0aA6K33BxfVNrzUqNu3z8vnPcuoWhyqCewoUfaDADgEUcsEOVDiqxP7Ft9DziM2
	ZPuZQYXVXoWiGndMMxFFUgQg9jASKq3NQ6iLlQb0CEQB32MwxIdks6BOkTFLSgJV5QuYqEv8OX6
	74rkjb3SaU0HRw48c+5bO0P8p/ykmWAv3S7n9sU+MXQmA6T7PMN6bY1pdbWD2VRhDvHcKz5cFNF
	qrAuS9OMhEOXzVdX1YSA1zk9rjVt1ukq5U4e3Gix/Xpe+VIXfgLN4SMqbB/OOKkQj591YKDiKmZ
	HMr6L7qOinS/cIm4+ghGN5chjpEWD4oRV86SAjjxfGqc1yvL/uhnaOOfoVDHLbaFYwwK7HYJuYW
	0soLhCjKnAtbw4JaOQOUBwrp54TA==
X-Received: by 2002:a05:7301:78ce:b0:34b:5ab2:e200 with SMTP id
 5a478bee46e88-36a4242b0e7mr8813452eec.14.1793475879351; Sat, 31 Oct 2026
 12:44:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179332800288.52644.8728400883396719965@gmail.com> <20261031182504.GW257209@horms.kernel.org>
In-Reply-To: <20261031182504.GW257209@horms.kernel.org>
From: Joas Antonio <joasantonio108@gmail.com>
Date: Sat, 31 Oct 2026 16:44:28 -0300
X-Gm-Features: AclHuK_Fu75K3pHZyCLZnNrGfVI3B-Q92FTwNO4d_lhymgzg_U-H8wZBqLodiJQ
Message-ID: <CAOCBhwGBrPxLPukgH7UAoy--sOXyoWL5XsC6CmUroy0T2xujXA@mail.gmail.com>
Subject: Re: [PATCH net] nfc: st21nfca: complete a pending SE APDU request
 only once
To: Simon Horman <horms@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Fan Wu <fanwu01@zju.edu.cn>, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

Thanks, you're right.

The two completion paths are serialised against each other:
st21nfca_apdu_reader_event_received() does timer_delete_sync() and
cancel_work_sync() before it looks at bwi_active, and the timer is only
re-armed from the same HCI rx work (EVT_WTX_REQUEST). But
st21nfca_hci_se_io() runs from the netlink path under device_lock()
only (nfc_se_io() in net/nfc/netlink.c), which neither the rx work nor
the timeout work takes. So:

- bwi_active, cb and cb_context are plain fields written by
  st21nfca_hci_se_io() while the rx work or the timeout work may be
  reading them;
- a second SE_IO issued while one is pending overwrites cb and
  cb_context, so a completion running at the same time can pair one
  request's callback with the other's context, and the first context is
  never completed. That is not new with this patch, but the bwi_active
  check does not cover it either;
- st21nfca_hci_se_io() sets bwi_active only after mod_timer().

For v2 I plan to add a spinlock to se_info that covers bwi_active, cb
and cb_context: st21nfca_hci_se_io() fails with -EBUSY (freeing
cb_context, as on the existing error path) if a request is already
pending, otherwise records it and sets bwi_active before arming the
timer; the timeout work and the EVT_TRANSMIT_DATA handler take the
pending request out under the lock (test and clear bwi_active, copy cb
and cb_context) and call the callback after dropping it, so exactly one
of them completes it.

Does that sound reasonable? I'll rerun the emulator tests on it before
sending.

Thanks,
Joas

Em s=C3=A1b., 31 de out. de 2026 =C3=A0s 15:25, Simon Horman <horms@kernel.=
org> escreveu:
>
> On Thu, Oct 29, 2026 at 11:40:02PM -0300, Joas Antonio dos Santos wrote:
> > st21nfca_hci_se_io() stores the netlink callback and its context in
> > info->se_info and arms the BWI timer.  The request is then completed
> > either by st21nfca_se_wt_work(), when the timer expires, or by an
> > EVT_TRANSMIT_DATA event on the APDU reader gate.  Neither checks that a
> > request is still pending, and the callback, se_io_cb(), frees its
> > context every time it is called.
> >
> > So when the secure element answers after the timeout, the response
> > calls se_io_cb() again on the context the timeout already freed, and
> > frees it a second time.  The same happens if the controller sends two
> > EVT_TRANSMIT_DATA events for one request.  An EVT_TRANSMIT_DATA, or a
> > timer armed by EVT_WTX_REQUEST, with no request pending calls the
> > callback on the context of an earlier, already completed request, or
> > calls a NULL callback if there never was one.
> >
> > With st21nfca on a virtual phy and an emulated controller answering an
> > NFC_CMD_SE_IO request 4 s after it was sent (the default timeout is
> > 3.2 s):
> >
> >   BUG: KASAN: slab-use-after-free in se_io_cb+0x2ec/0x334
> >   Read of size 4 at addr fff00000c5277da0 by task kworker/3:1/59
> >   Workqueue: events nfc_hci_msg_rx_work
> >   Call trace:
> >    se_io_cb+0x2ec/0x334
> >    st21nfca_apdu_reader_event_received+0x1ec/0x248
> >    st21nfca_hci_event_received+0xb0/0x300
> >    nfc_hci_event_received+0xb8/0x30c
> >    ...
> >   Freed by task 59:
> >    kfree+0x214/0x498
> >    se_io_cb+0x2bc/0x334
> >    st21nfca_se_wt_work+0x14c/0x1d4
> >
> > and for an EVT_TRANSMIT_DATA without a request:
> >
> >   Unable to handle kernel NULL pointer dereference at virtual address 0=
000000000000000
> >   pc : 0x0
> >   lr : st21nfca_apdu_reader_event_received+0x1ec/0x248
> >
> > Use bwi_active, which st21nfca_hci_se_io() sets, to tell whether a
> > request is pending, and clear it in whichever of the two paths
> > completes the request first.  The event handler already stops the timer
> > and waits for the timeout work before looking at it.  Also complete the
> > request with the error if sending EVT_SE_END_OF_APDU_TRANSFER fails
> > rather than never calling the callback, which leaked the context.
> >
> > Fixes: 2130fb97fecf ("NFC: st21nfca: Adding support for secure element"=
)
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
> > Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
> > ---
> > Tested on arm64 QEMU with KASAN, with a test-only module that registers
> > st21nfca through st21nfca_hci_probe() on a virtual phy (LLC nop) and a
> > userspace controller emulator (DEV_UP, ENABLE_SE, SE_IO over netlink).
> > Without the patch: slab-use-after-free in se_io_cb() for a late and for
> > a duplicated EVT_TRANSMIT_DATA, NULL pointer call for an unsolicited on=
e.
> > With it all three are quiet and a normal SE_IO exchange still works.
> > Not tested on hardware.
> >
> > st-nci has the same pattern; Fan Wu's pending "nfc: st-nci: drain SE
> > timers before NCI teardown" v2 already makes bwi_active an ownership
> > token there, so this only touches st21nfca.
> >
> >  drivers/nfc/st21nfca/se.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
> > index 7154bc1d6..4261ed1d9 100644
> > --- a/drivers/nfc/st21nfca/se.c
> > +++ b/drivers/nfc/st21nfca/se.c
> > @@ -264,6 +264,12 @@ static void st21nfca_se_wt_work(struct work_struct=
 *work)
> >                                               struct st21nfca_hci_info,
> >                                               se_info.timeout_work);
> >
> > +     /* The timer can also be armed by EVT_WTX_REQUEST while no
> > +      * st21nfca_hci_se_io() is pending.
> > +      */
> > +     if (!info->se_info.bwi_active)
> > +             return;
> > +
> >       info->se_info.bwi_active =3D false;
>
> Hi Joas,
>
> I'm unsure if it effects the correctness of this fix.
> But I am concerned that the use of bwi_active is racy.
>
> >
> >       if (!info->se_info.xch_error) {
> > @@ -383,11 +389,20 @@ int st21nfca_apdu_reader_event_received(struct nf=
c_hci_dev *hdev,
> >       case ST21NFCA_EVT_TRANSMIT_DATA:
> >               timer_delete_sync(&info->se_info.bwi_timer);
> >               cancel_work_sync(&info->se_info.timeout_work);
> > +             /* Only complete a pending st21nfca_hci_se_io(), and only=
 once:
> > +              * the timeout work may already have completed it, and th=
e
> > +              * callback frees its context.
> > +              */
> > +             if (!info->se_info.bwi_active)
> > +                     break;
> > +
> >               info->se_info.bwi_active =3D false;
> >               r =3D nfc_hci_send_event(hdev, ST21NFCA_DEVICE_MGNT_GATE,
> >                               ST21NFCA_EVT_SE_END_OF_APDU_TRANSFER, NUL=
L, 0);
> > -             if (r < 0)
> > +             if (r < 0) {
> > +                     info->se_info.cb(info->se_info.cb_context, NULL, =
0, r);
> >                       goto exit;
> > +             }
> >
> >               info->se_info.cb(info->se_info.cb_context,
> >                       skb->data, skb->len, 0);
> > --
> > 2.43.0
> >



--=20
Joas Antonio dos Santos
Cyber Security Specialist and Ethical Hacker
joasantonio108@gmail.com
LinkedIn
