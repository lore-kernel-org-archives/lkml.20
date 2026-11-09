Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794222016;
	b=Uj7jbAM7qvrb3cpMWthnObu+SgSuwWlUu9UtTVhAq/2EFJk/CxH86eVbIh1iAzTHSEeH
	 4HHA9aKZiNpec4+Cb7fRTErTbOitJQYH2aEdUa0Tf+I17MEJzoi2zRutiNFH0kua4aXZ+
	 8FEL2GZvAAqpojT6uFkCNWUHhA2acbe5s9UFSjGvO5tRiQNIzYItVdT1aeq3l9phHwVhu
	 YwKa8LyVQU4+NQLXKzEDUX+KOhhlZ1CN1gCNpjjOJPIvoKDC6rvD5mBFcj3BbYhtAOpUM
	 X9QMwbBOap95Ah966MbI0mDb5Jb6aiy6AuWpNdzBRXtdvkxWx08ng2Uwl6IRLoEBDjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QmWofXbWMdEdzs5zr41CSz786HngxOkg4TFJTbqETls=;
	b=ZWKtOsw/6fBjim8e+yU7gSihEZnQnKnUEuGAtGwdDBAt0OoTriURVD6jROKuQMjvVSx0
	 zdrHdlRr4ubdE+MfQLmB8/isRybqJlm0x7j2sV65y3oKRiFLL6K7/eqvjb0SSDxgERa40
	 BMsJsyAhJaVVMpwnpw9JHg0CFkN4JxGD4g+LFit7FCFe1yDk9waze4ge8o/U8kLRvl6am
	 ttowUGLXNR4HhzREVt7P0g/XTxv2Brs63TuBLvpO3aPqsUwM7LODki81CcVxDAvoMSFrM
	 ZoK+Ax5Q+M3iecrmD8xZG6JlBtiUOrC4n7er4LKw/mzRv/fOwdifCoCw31inv1UrQVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwMTt8Rc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6911C606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6911C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwMTt8Rc
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3712b6d9843so355730eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:00:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794222015; cv=none;
        d=google.com; s=arc-20260327;
        b=heuMcCdFPbioQyAAvmJ7DZAKfgbTFw87kyaivGby74hsYMOvsfJXeM0Kzad6KhlIIg
         Lo0lMpNiq5IHdaN+N6wf/8EzRIbpOA5jjgicTpfTCn0BidXP8chxe97IYbWMkRh8R2DN
         ltyqk+50VPPEjaOpQPgwvOKSwXm0lO6Dq/qPdxskpxTPRJ84N/7NfAh/tjH6vAh05PD/
         DObpAxAOww4J8k9bwoJkdnZESwHsmnYRcJQDmAVPWcK5CBr4nhlCI1GwXuH9N0iQOIPH
         BTTZO7G/JuHRnZXJZJRh1BRFlR4z2RC77BIqtOpjqsQdQGGNTMSVl5+/RNETbKPWPDv+
         s1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QmWofXbWMdEdzs5zr41CSz786HngxOkg4TFJTbqETls=;
        fh=lt3ZwDApGg6rF5Gsf07jVIkvJyTx8ooIaT6VkjHKDxY=;
        b=nXw6fNK7GZvxeIWtIOjwEbRSp2SV5yi6MRNxHqS4tM5HqzxbQB/CjKZO8y99t7D8e6
         nboBSPt+xuwxRdZsljSQgnHw9Qo9EouKYiARJHsWLkC65srh/d3XLL72Bzj7FZjLcRnW
         cSEqXsXjoL6urTkQHTuylPKiFcTyYN1x77NdqjmTTNfDgQl2RpZb2RrNKUoKWIlLPM8k
         jkek6iA0lqvQIXUUAbESTrwiug43/bDcVZiX2xWILogNmvB/cTrPSnMPqGF14Oxcc9SZ
         mnC7qy6y2MhLxTE/Z1atoSXuKzdC6eol8gqdqAIE9KIkJv9k2HdqCEsHjEeK5lqgY/9S
         hfPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794222015; x=1794826815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmWofXbWMdEdzs5zr41CSz786HngxOkg4TFJTbqETls=;
        b=mwMTt8RcMPtSk7wFcmjmnnpmUqobz8k4ncIEnvNn4Blb/UjCaftrN1j2PLwFWQhtCQ
         oN+kCcKhfA2HTM+B3aiUPBdoPV+PHgQaZDmssSA+z9efn1dFAmE6tBuQZVLMBi0okHQ1
         BJoMXdmjg2Mq6YleFkDgAThdWHwyKR3zdWfAT0XOoRodHcYxqxSd6vc9r1UT/IU6zfti
         t7EsZZVlzafPPjl664uMbYY+I+d5OLuU2XsRxeN7bLgFyN7vVhRENS1GGDsigjv5t2km
         DtLJLZUmA0ffPtJzhrwGodWvBUsSMOYb2tVOHPnpUt96/l9XYEv/fE5j1ATrprd0zzGH
         OYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222015; x=1794826815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmWofXbWMdEdzs5zr41CSz786HngxOkg4TFJTbqETls=;
        b=jqCWO8YnsHFGqKGeuly40vyRyHW1One9G+TSs38IJn44afR0Pm8B7ycvwht/1WuH4D
         KrrWAUMFCN2nJiAMKhOAzn3RroL9rV93dKY76C20nlNCiRj17X1vE5CEwcE59SkPoxK0
         BUBrx5EXCcdkCeOQ5MsD878BYTXiyEa9q72i/lI5CQsAZg2hhvVBfwgHkOzA+5X8SpxL
         ajNOMsgqQflc0dNVFH5zYX4yo9asGmyroCG4SPcJspHY8maY6Zs8tAfl0QK/QKaBCdu7
         xqceDIQtz1nIGpLkjvVfq2xKGdAPBh24vXJkf0mJUQyPyKrRw9vcK/K+7DwS0gPb6yVX
         lYmA==
X-Forwarded-Encrypted: i=1; AL+hErGRF0owB4yaClCuZJFB94dIuASclINm3kY2wGSR2Y4AexE7DS46jdMhH4NSl4OS5/lKhfUWN4CXCrvNmEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z+FfMWSnZtWVlUTCx5cuAUmJwUlyuLAO6CxYDodvbz3oa/QrS
	rslja82I0lLYYsDSzhXfGQqpHjtP0lbnDtsX1j1wdvTKvIrWdFhO4o5pFdbTDaZDhWeFCE4nPtI
	vrA8tSrLg/wSw0cJ08pwciJVDD+/8dpc=
X-Gm-Gg: AYBFou2NqVUUci6Rn0/iLFjegV0/YN56Y3CjZlDePIpZIwhr/iiL/mliceMxQyi2MF/
	N2P1euXXlDt8MbrtKqH4UVvdyOPrPqPNmofKA3d7AxLCWXjQpqLqviNhLAX45CWPS4x9jZjmLXu
	S87tMazKDMuDexdxh/eVUm6G0iZLePLOkBh+3OuV9jF4G4y+9gEJLxkQosdrvtsbBId3qr/6Wj1
	SzHi7yoi/1PI0lPZtxqRmipiT8h2Gqsny5OKx1gRvtYmLHR+5KMbzEpX9Wo/8G5B25i2EImKL2r
	MKpDz7NFuYrXYECtvNXVczt1nbYuwQLnJstUFm2N7oRho+8F5aqrF2nOTxK11xCzXtt2ZBscYFP
	GI934+qny4kmbk/K8K3pgNnGkiaQj5QpOzRNIa0cFubMlC7LNPxrX44XrWPpWvCgotmK7
X-Received: by 2002:a05:7300:ce01:b0:36d:1b8b:617b with SMTP id
 5a478bee46e88-37254d9a78cmr5220410eec.9.1794222015114; Mon, 09 Nov 2026
 03:00:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105103903.1440114-1-hj351016@gmail.com> <179422158699.994134.3116496415821822388@kernel.org>
In-Reply-To: <179422158699.994134.3116496415821822388@kernel.org>
From: khj <hj351016@gmail.com>
Date: Mon, 9 Nov 2026 20:00:03 +0900
X-Gm-Features: AclHuK_uWIXsQR62vATDyynpAjlDWywwUTgf0eo8NsCNXBCpdKDDQledVx3Gusw
Message-ID: <CAGr5VtNzVq0xYfX6_zSjk8fWncgsw=3CmUY3THXeBg7UvTXg4g@mail.gmail.com>
Subject: Re: [PATCH] nfc: pn533: validate response length before parsing DEP ATR_RES
To: netdev-bot+sashiko@kernel.org
Cc: david@ixit.cz, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kuba@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Thanks -- the [High] is correct and important. v1 put the length
check before the status read, so a no-peer/timeout reply (resp->len =3D=3D
1) returned -EINVAL and skipped the "turn radio off, re-arm polling"
path, stalling the DEP poll loop. v2 moves the check onto the success
path (after the status check) in all three ATR_RES handlers, so the
short failure reply keeps its existing handling and only a short
success reply (which would over-read the fixed header) is rejected.

 v2 also adds the Fixes: tags, guards the third parser
(pn533_activate_target_nfcdep), and drops the inaccurate sentence that
claimed the other handlers already length-check resp->len (only
pn533_init_target_complete() does).

 pw-bot: cr

2026=EB=85=84 11=EC=9B=94 9=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 7:53, <=
netdev-bot+sashiko@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] In pn533_poll_dep_complete() (drivers/nfc/pn533/pn533.c, new
>   check at line 1313) and pn533_in_dep_link_up_complete() (line 1936),=E2=
=80=A6
> - [Low] The commit message says 'pn533_rf_complete()-style handlers in
>   this file already length-check resp->len before use'.
> - [Low] pn533_activate_target_nfcdep() (drivers/nfc/pn533/pn533.c:1777)
>   parses the InATR ATR_RES (struct pn533_cmd_activate_response, 16-byte=
=E2=80=A6
> - [Low] The patch says it fixes an out-of-bounds read whose bytes reach
>   userspace through netlink (nfc_targets_found() ->=E2=80=A6
>
> --
>
> nfc: pn533: validate response length before parsing DEP ATR_RES
>
> This commit adds a check that resp->len is at least
> sizeof(struct pn533_cmd_jump_dep_response) to pn533_poll_dep_complete()
> and pn533_in_dep_link_up_complete(). The check runs before the response
> status is read. It is meant to stop the handlers from reading the fixed
> 17-byte ATR_RES header, including nfcid3t[], past the end of a short
> response.
>
> > A valid ATR_RES always carries the full 17-byte fixed header (the
> > general bytes, if present, start at offset 17), so reject any response
> > shorter than sizeof(*rsp) before parsing it. pn533_rf_complete()-style
> > handlers in this file already length-check resp->len before use (e.g.
> > the ATR_REQ_GB_OFFSET check in pn533_init_target_complete()).
>
> [Severity: Low]
> Is this description of the other handlers accurate? pn533_rf_complete()
> only checks IS_ERR(resp), then queues poll_work and frees the skb. It
> never looks at resp->len or resp->data:
>
> drivers/nfc/pn533/pn533.c:pn533_rf_complete() {
>         ...
>         if (IS_ERR(resp)) {
>                 ...
>                 return rc;
>         }
>
>         queue_delayed_work(dev->wq, &dev->poll_work,
>                            msecs_to_jiffies(PN533_POLL_INTERVAL));
>
>         dev_kfree_skb(resp);
>         ...
> }
>
> pn533_start_poll_complete() also reads the response without checking its
> length:
>
>         nbtg =3D resp->data[0];
>         tg =3D resp->data[1];
>         tgdata =3D &resp->data[2];
>         tgdata_len =3D resp->len - 2;  /* nbtg + tg */
>
> pn533_autopoll_complete() also walks the response without bounds checks.
> Of the handlers mentioned, only pn533_init_target_complete() checks the
> length.
>
> Could this sentence be reworded so it doesn't suggest the rest of the
> file already has these checks?
>
> > Found by code review; not reproduced.
> >
> > Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
>
> [Severity: Low]
> The commit message describes an over-read whose bytes reach userspace
> through nfc_targets_found(). Should the patch carry Fixes: tags so the
> fix reaches stable kernels? The unchecked parsing in
> pn533_in_dep_link_up_complete() and pn533_poll_dep_complete() appears to
> come from these commits:
>
> Fixes: 361f3cb7f9cf ("NFC: DEP link hook implementation for pn533")
> Fixes: 673088fb42d0 ("NFC: pn533: Send ATR_REQ directly for active device=
 detection")
>
> > diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
> > index f5a6a7c20d5af..63b6032692184 100644
> > --- a/drivers/nfc/pn533/pn533.c
> > +++ b/drivers/nfc/pn533/pn533.c
> > @@ -1310,6 +1310,11 @@ static int pn533_poll_dep_complete(struct pn533 =
*dev, void *arg,
> >
> >       rsp =3D (struct pn533_cmd_jump_dep_response *)resp->data;
> >
> > +     if (resp->len < sizeof(*rsp)) {
> > +             rc =3D -EINVAL;
> > +             goto error;
> > +     }
> > +
> >       rc =3D rsp->status & PN533_CMD_RET_MASK;
> >       if (rc !=3D PN533_CMD_RET_SUCCESS) {
> >               /* Not target found, turn radio off */
>
> [Severity: High]
> Can this check stop NFC polling whenever no DEP peer is in the field?
>
> As far as I can tell, a PN53x returns the ATR_RES fields (Tg, NFCID3t,
> DIDt, BSt, BRt, TO, PPt, Gt) only after a successful InJumpForDEP. If no
> ATR_RES arrives, for example on a timeout, the chip replies with
> D5 57 <Status> and nothing more. After pn533_send_async_complete() strips
> TFI and CC, resp->len is 1.
>
> The old code handled this case by reading only rsp->status. With the new
> check, 1 < 17 jumps to error and returns -EINVAL, so this branch never
> runs:
>
>         if (rc !=3D PN533_CMD_RET_SUCCESS) {
>                 /* Not target found, turn radio off */
>                 queue_work(dev->wq, &dev->rf_work);
>
> pn533_wq_rf() sends RFConfiguration. Its completion, pn533_rf_complete(),
> is the only place that re-arms poll_work after a DEP attempt.
> pn533_wq_cmd_complete() ignores the -EINVAL:
>
>         rc =3D pn533_send_async_complete(dev);
>         if (rc !=3D -EINPROGRESS)
>                 queue_work(dev->wq, &dev->cmd_work);
>
> So nothing restarts the poll loop. poll_mod_count and nfc_dev->polling
> still report that polling is active.
>
> Since commit 673088fb42d0 ("NFC: pn533: Send ATR_REQ directly for active
> device detection"), pn533_send_poll_frame() sends a DEP poll between
> passive cycles whenever NFC_DEP is requested:
>
>         if ((dev->poll_protocols & NFC_PROTO_NFC_DEP_MASK) && dev->poll_d=
ep)  {
>                 dev->poll_dep =3D 0;
>                 return pn533_poll_dep(dev->nfc_dev);
>         }
>
> So any poll that includes NFC_DEP and finds nothing on its first passive
> cycle would stall after the first DEP attempt. It stays stalled until
> userspace stops and restarts polling, and then it stalls again the same
> way.
>
> pn533_in_dep_link_up_complete() gets the same status-only reply and now
> returns -EINVAL without logging anything. The "Bringing DEP link up
> failed (error 0x%x)" message with the chip's status code is never
> printed.
>
> The commit message says "A valid ATR_RES always carries the full 17-byte
> fixed header", but that seems to hold only for successful replies.
>
> Would it work to check resp->len >=3D 1 before reading the status, keep t=
he
> existing failure handling, and require resp->len >=3D sizeof(*rsp) only o=
n
> the success path, before nfcid3t is copied and target_gt_len is computed?
>
> > @@ -1928,6 +1933,11 @@ static int pn533_in_dep_link_up_complete(struct =
pn533 *dev, void *arg,
> >
> >       rsp =3D (struct pn533_cmd_jump_dep_response *)resp->data;
> >
> > +     if (resp->len < sizeof(*rsp)) {
> > +             rc =3D -EINVAL;
> > +             goto error;
> > +     }
> > +
> >       rc =3D rsp->status & PN533_CMD_RET_MASK;
> >       if (rc !=3D PN533_CMD_RET_SUCCESS) {
> >               nfc_err(dev->dev,
>
> [Severity: Low]
> pn533_activate_target_nfcdep() parses the InATR ATR_RES (struct
> pn533_cmd_activate_response, which has a 16-byte fixed header) the same
> way, and this patch leaves it unchanged:
>
> drivers/nfc/pn533/pn533.c:pn533_activate_target_nfcdep() {
>         ...
>         rsp =3D (struct pn533_cmd_activate_response *)resp->data;
>         rc =3D rsp->status & PN533_CMD_RET_MASK;
>         ...
>         /* ATR_RES general bytes are located at offset 16 */
>         gt_len =3D resp->len - 16;
>         rc =3D nfc_set_remote_general_bytes(dev->nfc_dev, rsp->gt, gt_len=
);
>         ...
> }
>
> rsp->status is read without checking that resp->len is at least 1. If the
> reply carries only TFI and CC (resp->len =3D=3D 0), the trimmed checksum =
byte
> is read as the status.
>
> The gt_len underflow is rejected later in nfc_llcp_set_remote_gb(). That
> is the same mitigation the commit message describes for target_gt_len.
>
> Should this third ATR_RES parser get the same status length check as the
> other two?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261105103903.1440114-1-hj351016%40gmail.com
