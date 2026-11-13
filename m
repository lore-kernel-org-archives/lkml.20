Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794586821;
	b=zna97h5Y32H2BXU01KQmDIAkoZ04qn5tYsspVgWZVXrdBvcIDljqvTGJQa28PVnHfQX9
	 kueVf5IBkm8iicbbbMyYAqi79GEjfzayn/MZlZ+voU9Vym4dQo1EMdCHutQ4W7Yco19lV
	 B2pRZFOWjKXtFvOkq86BFqm6zfFSMQXDeDQ+L25KHfm7kcuEaPmlZNSg0AYsPtqce/oc0
	 75xjdhOe1o0AfFWoGnLzh4BhIaXxIzIQ9wPMFOS7P2iSz/8CyleOf48MX0nOJi5yb62NU
	 DrLxlEs2sc2W8UCzK0XQqlRjkAvDrgT5qD18bs3gukluXkKc4RG/OE1JUl9Lfui7HMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rs57aFHSLHSUAFs+0WsV/q2cp4cjoBZs6jGJ6bwsupA=;
	b=eWQvLngKnDcZn7cThMY/CqQZehC2qsLgw26zmzfiHaUydzCHGB9507KRA1kLjMH3mcE1
	 bhYRsUefFuBCoOmaHTuF5JsPP0TZqHJXGvFP6J9ZWNzbxgd0rvuqhdLkbglcJWrTTr8qp
	 VGTgG6JQNT15H0wB1Myff+Vd5Er3S9bdXJuqGA5AVJUvLRTy6entLn+phWBPS9XKD9QU+
	 1Nmp+RVswgpjJdJ6AMU9PX/75qS+Kk+LwlW08Ba0HFHvdWbDlo+bhuoRU8LGQ9YMAIWr5
	 LVnqq3b86RD5R7pfeqYE6cJiQm+ryxQJcF2KR4X9AmNdYfVZ9T8TgfYZVROaonvhY1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=fJ7Oyko7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0246D606A88B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0246D606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=fJ7Oyko7
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso2267591a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794586816; cv=none;
        d=google.com; s=arc-20260327;
        b=XPwAUk1kfFKPQuHodNCtXAu3DChugvVQPyKUNqVqkG/0nogU/ktfG3BllRsObAPTrB
         i0LSEA7WcVHXF4L6aQI2P/VQNWkWfuDjNNJjHXii9O8xaz7u/pq2p3OYtUR4ppiH1NA4
         wTP2tLetsT29c4OQN+zDGqjwY3oNUiXQUsj/EVIUOZJcatZpC/2Mg+YNZPWdr5yVmBc/
         egqnTonINj0zqHUNc9kcgXBjR0J9n/Nf3RTgh6zGdrEnj8UPCV+Fmxk4bOntusnD/tZO
         MJK+jmjrCAGxQsE1bJGdi3BCOkjN+ztX/qMox4yIcvzuwR9RbG0u3Yas7rfTFDJja2td
         vpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rs57aFHSLHSUAFs+0WsV/q2cp4cjoBZs6jGJ6bwsupA=;
        fh=utCd2SJlcJwDQRqLax4u3n4UNm0Qqubh/M7D9wIMUyA=;
        b=JIgGmEK9RJhzWG4z78RRYOUDwXZZ/ie0p+GMclH77X/kgZIkCFLnGZ58bme5oaRxSI
         us50C5E8vXdpt99b3rP9QptrKl88hF/S4iTv39eeOc1+kX0vwpQbHkLJaYE6+sPtarAj
         H+hR3hRhurg2y7aRUX/HPCR7u5NHj2mqYOzbSzuVthuXAukw/O6va7Sd0HSgUgtZhKiH
         XlRMe0g8OzglX+p7pHbewR8WvapcFp3Zqfj3RXBJM/nEQ/bvSYfFy7YnlBPeg6oKz7PX
         jao1LAkej3TqyNGlhURh2T5CH0aimTf9UIn6/QgA86LQHBbwQ1qtm26Gebwt9aPDqZqt
         /9SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794586816; x=1795191616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rs57aFHSLHSUAFs+0WsV/q2cp4cjoBZs6jGJ6bwsupA=;
        b=fJ7Oyko7KcY5wx8V2s/iRHd9jQVk779wiNC/UfuVisZ0D5rApyJzsWTizduOKncaBz
         EB+US33PbXH+DZ2FxhIbeBzKXCreHpBEw9kGsZRwt9IbSDeshddnG/XCAK+gYEB4jfUk
         +GtmXyMYSrDt+j6bdK88W07FqBLElP6dBI2XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586816; x=1795191616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rs57aFHSLHSUAFs+0WsV/q2cp4cjoBZs6jGJ6bwsupA=;
        b=k2ADEBRh/00VYQTPdFelYz6MjIDW+jeSkqRNjRVzifMhQpJNNXi8ZcaAhIEr/TGvqp
         /HFE1t4GF/X+Z7KtEdpZ3qDFc4rtblmZiizr0oj38kNg4qcAmaSQ+ts1u0+URyx3ABCt
         qSod5Oy1qeFNRxklhhnshstRnq+FYkxOMb/Nwc2893jtDnzwePdqqWXe3xZbnIyyNCG5
         2ojkzBZFUkyUFBYE7c0wHWBxH2WE3RFwHhM3uWZ6AkLEoa5lbR7gPN9Ab5vMU4p09dpn
         yd8q2fWlSDW5HeuAXmPYH36utHXB8eB9XmZUsj5nN3nC7xY0MKfbIPLUTYL4sl8WxEJh
         RT2g==
X-Forwarded-Encrypted: i=1; AL+hErGB+5dhKnAPECnosiDvLTjDlrKSerImV7u0bmvGAKC4OzIdVp5xp1Wo13KhYW7WjKDCB6c4Gcdb5STsu8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z05kPYRFPgiDIf5nRtLvCLsq4FyTVNmWBZx2TdnOMjC4pLC0s
	0MYgcaqX0C4/6IKOPy+PhMe467wanEcMN4Fjj0z1jxat2WpXC7OBJKn+ncbMxiqdWaLeWlml6As
	zUiDvDcfJoNVBP/Ttu44CQRx8dFkSLEukFmUyNj1ZhNA1hyQvtrcCnU893g==
X-Gm-Gg: AYBFou1+YWeWgsSC6NrOC3+eBjGLQ65NosqptwkaDRyI4B+oPlnUXjD4kIAJ7oiVQqC
	X61FH19NasHCy5lvr9iNw4Qi7xpRlo5ibRX0YWEP3ex3OxRe32EjqdYTExgXlU63yrL6BDfwYVM
	cfQgK/O0lkjJI5LZh2N8amyVuWBFXReSNoCMy5bVGhqu/bTgTy6SLhcCfOE4p8fi2PU4aRH9/dV
	XxD9yZz8w1F/TXCtY7UL6WBE+eXT8bLvDlT3L0kjtq48kyJ3FBwPXUCHXEfa/OETJ0ucmdfRcLl
	HIu0KXuoeZYHUJmyYI3S83/OQX2Aix1wW7PdPCeqKKHd4xffb3tQYVjdgPKz98hc09QDwH0uNDR
	ti7+62XkwTgIkcGgEJ8wpr/u2BBxSppc6LapUrck+kh7YTKRJlSeH9w3KlqDe7Ui9xDN+Htnn5s
	bKaNGQWYFggKVdrZZV4ZCT/IukN9aB2M0rY2JTuRwWoMt4WK59jeWT9cWE
X-Received: by 2002:a05:6402:a513:10b0:6b7:186:e60b with SMTP id
 4fb4d7f45d1cf-6b7c0891425mr2148520a12.5.1794586816028; Fri, 13 Nov 2026
 08:20:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112173812.18696-1-piyus@iiitd.ac.in> <20261112173812.18696-2-piyus@iiitd.ac.in>
 <CABBYNZK4akYzoWc97v8FTXc77+godNTHASn8ZnfNji=jPd2oiw@mail.gmail.com>
In-Reply-To: <CABBYNZK4akYzoWc97v8FTXc77+godNTHASn8ZnfNji=jPd2oiw@mail.gmail.com>
From: Piyus Kedia <piyus@iiitd.ac.in>
Date: Fri, 13 Nov 2026 21:50:05 +0530
X-Gm-Features: AclHuK8Y2aJOf6NICKKz0NjUj8c7M4thSlj8B0Zs0E2HfOG44IobNFhltf5c2gg
Message-ID: <CADq=QSz7GMXXjsykU87=6yCcWL1QX3NVOpxjQpJD3T2KG-nssw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: L2CAP: clear the SDU before the receive callback
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kapil Vaswani <kapil@presceralabs.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luiz,

Thanks for sharing this!

On the double free: that free isn't new. The block this patch replaces
already did it,

failed:
  if (err) {
      kfree_skb(skb);
      kfree_skb(chan->sdu);

with skb NULL by then, and l2cap_reassemble_sdu() has the same block.
So if a shared skb can reach the callback, the existing code
double-frees in exactly the same way - this patch neither adds that
nor fixes it. What it fixes is the use-after-free on chan->sdu.

As far as we can tell, it can't be shared here: skb_share_check() only
acts when skb->users !=3D 1, and nothing on the ACL receive path takes a
reference - the only two skb_get() calls in net/bluetooth are req_skb
in hci_core.c and req_rsp in hci_sync.c, both on the HCI command path,
and
append_skb_frag() doesn't touch skb->users. We may be wrong about
that, and if we are, the fix belongs in recv_pkt() rather than in each
caller - it frees the caller's skb on one drop path and leaves it on
the others. Happy to send a patch for that separately.

You're also right that "frees the skb outright" was wrong: recv_pkt()
consumes the skb on its success paths and leaves it to the caller on
most of the drop paths. I have a v2 ready with that sentence fixed,
but the diff is unchanged from v1. Please let us know if you want it
posted.

Best,
Piyus Kedia
Kapil Vaswani


On Fri, Nov 13, 2026 at 1:24=E2=80=AFAM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Piyus,
>
> On Thu, Nov 12, 2026 at 12:38=E2=80=AFPM Piyus Kedia <piyus@iiitd.ac.in> =
wrote:
> >
> > l2cap_ecred_data_rcv() completes a reassembled SDU by calling
> > l2cap_ecred_recv() with chan->sdu still set, and only clears the
> > reassembly state after it returns:
> >
> >         if (chan->sdu->len =3D=3D chan->sdu_len) {
> >                 err =3D l2cap_ecred_recv(chan, chan->sdu);
> >                 if (!err) {
> >                         chan->sdu =3D NULL;
> >                         ...
> >
> > l2cap_ecred_recv() hands the SDU to the channel's receive callback,
> > which takes ownership of it on success, and then updates the credits:
> >
> >         err =3D chan->ops->recv(chan, skb);
> >         ...
> >         l2cap_chan_le_send_credits(chan);
> >
> > l2cap_chan_le_send_credits() calls l2cap_le_rx_credits(), which reads
> >
> >         size_t sdu_len =3D chan->sdu ? chan->sdu->len : 0;
> >
> > so between the callback consuming the skb and the assignment above,
> > chan->sdu is a dangling pointer that is dereferenced.
> >
> > For the 6LoWPAN channel the callback frees the skb outright -
> > chan_recv_cb() -> recv_pkt() ends in consume_skb(skb) and returns
>
> Looks like this comment doesn't hold:
>
> https://sashiko.dev/#/patchset/20261112173812.18696-2-piyus%40iiitd.ac.in
>
> The 6LoWPAN does actually free on error as well.
>
> > NET_RX_SUCCESS - so the read is a straightforward use-after-free that
> > KASAN reports:
> >
> >   BUG: KASAN: slab-use-after-free in l2cap_le_rx_credits
> >        net/bluetooth/l2cap_core.c:576 [inline]
> >   BUG: KASAN: slab-use-after-free in l2cap_chan_le_send_credits+0xa8/0x=
3e0
> >        net/bluetooth/l2cap_core.c:6811
> >   Read of size 4 at addr ffff88800e134070 by task kworker/u21:2/11352
> >   Workqueue: hci0 hci_rx_work
> >    l2cap_le_rx_credits net/bluetooth/l2cap_core.c:576 [inline]
> >    l2cap_chan_le_send_credits+0xa8/0x3e0 net/bluetooth/l2cap_core.c:681=
1
> >    l2cap_ecred_recv+0x63/0x120 net/bluetooth/l2cap_core.c:6873
> >    l2cap_ecred_data_rcv net/bluetooth/l2cap_core.c:6976 [inline]
> >    l2cap_data_channel net/bluetooth/l2cap_core.c:7028 [inline]
> >    l2cap_recv_frame+0x6c3c/0x9650 net/bluetooth/l2cap_core.c:7162
> >    l2cap_recv_acldata+0x6fd/0xe60 net/bluetooth/l2cap_core.c:7902
> >    hci_acldata_packet net/bluetooth/hci_core.c:3865 [inline]
> >    hci_rx_work+0x3c0/0xbe0 net/bluetooth/hci_core.c:4092
> >   Freed by task 11352:
> >    recv_pkt net/bluetooth/6lowpan.c
> >    chan_recv_cb+0x88/0x150 net/bluetooth/6lowpan.c:367
> >    l2cap_ecred_recv+0x61/0x160 net/bluetooth/l2cap_core.c:6864
> >   The buggy address belongs to the object at ffff88800e134000
> >    which belongs to the cache skbuff_head_cache of size 240
> >   The buggy address is located 112 bytes inside of
> >    freed 240-byte region
> >
> > Offset 112 is sk_buff.len.
> >
> > Only a multi-frame SDU is affected: the single-frame path already calls
> > l2cap_ecred_recv() with chan->sdu NULL, so l2cap_le_rx_credits() reads =
a
> > zero sdu_len there.
> >
> > l2cap_reassemble_sdu() completes a segmented SDU the same way and has t=
he
> > same defect.  On an ERTM or streaming channel l2cap_sock_recv_cb() call=
s
> > l2cap_publish_rx_avail(), which reaches l2cap_chan_le_send_credits()
> > through l2cap_chan_rx_avail(), and that function evaluates
> >
> >         u16 return_credits =3D l2cap_le_rx_credits(chan);
> >
> > in its initializer - before the mode test that makes the rest of it a
> > no-op for a non-LE channel.  So chan->sdu is dereferenced on that path
> > too, and the result is discarded.  What makes it a use-after-free rathe=
r
> > than a stale read is a consumer that frees the skb from another thread:
> > BNEP's session kthread takes it off the socket with a lockless
> > skb_dequeue() (net/bluetooth/bnep/core.c:530, freed at :533) and never
> > takes the socket lock, so lock_sock() is no defence.
> >
> > Fix both sites.
> >
> > Clear the reassembly state before handing the SDU to the callback, whic=
h
> > makes the fragmented path behave like the single-frame one, and free th=
e
> > SDU on the spot if the callback refused it - the error path's
> > kfree_skb(chan->sdu) used to do that, and the callbacks leave the skb t=
o
> > the caller when they fail.
> >
> > Clearing it first is also the arithmetically correct input, not merely =
a
> > safe one.  l2cap_le_rx_credits() subtracts sdu_len from chan->rx_avail
> > because a partially reassembled SDU will claim that much receive buffer
> > once it completes:
> >
> >         if (chan->rx_avail <=3D sdu_len)
> >                 return 0;
> >
> >         return DIV_ROUND_UP(chan->rx_avail - sdu_len, chan->mps);
> >
> > A completed SDU is no longer waiting for that space.  If the callback
> > queued it, l2cap_sock_recv_cb() has already called
> > l2cap_publish_rx_avail(), which recomputes rx_avail from
> > sk_rcvbuf - sk_rmem_alloc with that skb included in sk_rmem_alloc; if t=
he
> > callback consumed it, as the 6LoWPAN one does, it occupies nothing at
> > all.  Either way the reassembly buffer is empty, so zero is the right
> > sdu_len, and a NULL chan->sdu is how l2cap_le_rx_credits() expresses
> > that - the same value l2cap_le_flowctl_init() depends on when it seeds
> > chan->rx_credits on an idle channel.  Carrying the old length into the
> > calculation instead would subtract the SDU a second time and under-gran=
t
> > credits on every delivery, and once rx_avail fell to the size of one SD=
U
> > the channel would be granted none at all.
> >
> > Per Documentation/process/generated-content.rst: the use-after-free was
> > found by an AI-driven fuzzing harness built on syzkaller, developed
> > jointly by Kapil Vaswani and myself, which drove a virtual HCI
> > controller and a 6LoWPAN channel under KASAN on x86_64.  The root-cause
> > analysis, this changelog and the patch were written with the assistance
> > of a large language model over an extended session, and reviewed by
> > hand; the before/after testing below the --- was run by us.
> >
> > Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
> > Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
> > ---
> >
> > Tested on net/main itself, before and after.  The kernel was built from
> > a2fd526d6442 with x86_64 defconfig plus KASAN and the Bluetooth, 6LoWPA=
N,
> > vhci and configfs options the test needs, gcc, no instrumentation, and
> > booted by hand under qemu against the same unmodified rootfs each time
> > (-snapshot, so the image is never written).  The only difference betwee=
n the
> > two kernels is this patch:
> >
> >   unpatched  7.4.0-rc1-ga2fd526d6442   KASAN on every run (4 runs today=
)
> >   patched    7.4.0-rc1-g63fe746a609a   no report (2 runs)
> >
> > WHICH SITE THAT COVERS, because the patch changes two.  The reproducer
> > drives the ECRED path, so l2cap_ecred_data_rcv() is the hunk those runs
> > exercise.  For the l2cap_reassemble_sdu() hunk, the same patched commit=
 was
> > rebuilt with CONFIG_BT_BNEP=3Dy and driven with a segmented SDU on an E=
RTM
> > channel with a BNEP session attached, under two kprobes:
> >
> >   l2cap_reassemble_sdu   14 hits
> >   l2cap_sock_recv_cb      6 hits
> >   interleaved rr-C rr-C: two entries into the reassembly function per
> >   callback, which is a START frame installing chan->sdu followed by an =
END
> >   frame completing it - the branch this patch changes - and not the
> >   unsegmented path, which would call back on every entry
> >
> > with no KASAN report.  So the changed line runs and reassembly still
> > completes.  What that run does NOT do is reproduce the use-after-free o=
n
> > that path: it needs the freeing thread to win, and the harness that fou=
nd
> > this bug did win it with BNEP's lockless skb_dequeue(), where we did no=
t.
> > The argument for why that site is affected is the ordering one above, f=
rom
> > the source.
> >
> > The clean runs are not setup failures: on both kernels the reproducer
> > reported the same L2CAP LE channel and the same frames -
> >
> >   SUMMARY mtu=3D1280 mps=3D1017 credits=3D2 scid=3D64 chan_gone=3D0
> >
> > - and exited 0.  Only the report differs.  On the unpatched kernel the
> > console shows the program's own marker immediately before the trace:
> >
> >   [   45.878309] LOWRUN sdu
> >   [   46.063560] BUG: KASAN: slab-use-after-free in
> >                  l2cap_chan_le_send_credits+0x86/0x1d0
> >   [   46.063711] Read of size 4 at addr ffff88800c9a82f0 by task
> >                  kworker/u21:0/353
> >   [   46.063838] Workqueue: hci0 hci_rx_work
> >
> > Offset 112 of the freed 240-byte skbuff_head_cache object is sk_buff.le=
n.
> > On the patched kernel the same marker is printed and nothing follows it=
.
> >
> > The same reproducer also faults on an unmodified 7.3.1 kernel, and the
> > harness hit the signature 19 times over eight hours on a third kernel.
> >
> > No Fixes: tag: our clone is shallow, only 27 commits of l2cap_core.c hi=
story
> > are reachable and git blame lands on the shallow boundary, so we cannot=
 name
> > the introducing commit.  The code is byte-identical in net/main at
> > a2fd526d6442, in mainline at 79eb6679ef6a and in the 7.3.1 tree this wa=
s
> > found on, and is present in every v7.3-rc tag available to us.  Please =
add
> > the tag if you can resolve it against full history.
> >
> > Reproducer: not included here.  This bug was found with AI assistance, =
which
> > Documentation/process/security-bugs.rst says to treat as public; the sa=
me
> > paragraph says not to post the reproducer publicly.  It is one C progra=
m
> > needing no Bluetooth hardware, it is tested, and we will send it on req=
uest.
> >
> > What bounds the scope: the channel's receive callback has to be one tha=
t
> > frees the skb, which is the 6LoWPAN one, and the SDU has to arrive in m=
ore
> > than one frame.  An administrator enables 6LoWPAN through debugfs; afte=
r
> > that bt_6lowpan_listen() listens on L2CAP_PSM_IPSP and a connected LE p=
eer
> > reaches this with an ordinary fragmented SDU, needing no local privileg=
e.
> >
> >  net/bluetooth/l2cap_core.c | 53 ++++++++++++++++++++++++++++----------
> >  1 file changed, 39 insertions(+), 14 deletions(-)
> >
> > diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> > index 7dcb0586a10b..fb965e4d75f2 100644
> > --- a/net/bluetooth/l2cap_core.c
> > +++ b/net/bluetooth/l2cap_core.c
> > @@ -6186,6 +6186,7 @@ static void append_skb_frag(struct sk_buff *skb, =
struct sk_buff *new_frag,
> >  static int l2cap_reassemble_sdu(struct l2cap_chan *chan, struct sk_buf=
f *skb,
> >                                 struct l2cap_ctrl *control)
> >  {
> > +       struct sk_buff *sdu;
> >         int err =3D -EINVAL;
> >
> >         switch (control->sar) {
> > @@ -6246,15 +6247,25 @@ static int l2cap_reassemble_sdu(struct l2cap_ch=
an *chan, struct sk_buff *skb,
> >                 if (chan->sdu->len !=3D chan->sdu_len)
> >                         break;
> >
> > -               err =3D chan->ops->recv(chan, chan->sdu);
> > +               /* Reassembly complete.  Hand the SDU over before the
> > +                * callback, for the reason given in l2cap_ecred_data_r=
cv():
> > +                * the callback takes ownership and may free it, while
> > +                * l2cap_chan_rx_avail() -> l2cap_chan_le_send_credits(=
) reads
> > +                * chan->sdu->len on the way out - it does so before th=
e mode
> > +                * test that makes the rest of that function a no-op he=
re.
> > +                * Return directly, since the state this leaves is what=
 the
> > +                * trailing error block would otherwise set again.
> > +                */
> > +               sdu =3D chan->sdu;
> > +               chan->sdu =3D NULL;
> > +               chan->sdu_last_frag =3D NULL;
> > +               chan->sdu_len =3D 0;
> >
> > -               if (!err) {
> > -                       /* Reassembly complete */
> > -                       chan->sdu =3D NULL;
> > -                       chan->sdu_last_frag =3D NULL;
> > -                       chan->sdu_len =3D 0;
> > -               }
> > -               break;
> > +               err =3D chan->ops->recv(chan, sdu);
> > +               if (err)
> > +                       kfree_skb(sdu);
> > +
> > +               return err;
> >         }
> >
> >         if (err) {
> > @@ -7245,12 +7256,26 @@ static int l2cap_ecred_data_rcv(struct l2cap_ch=
an *chan, struct sk_buff *skb)
> >         skb =3D NULL;
> >
> >         if (chan->sdu->len =3D=3D chan->sdu_len) {
> > -               err =3D l2cap_ecred_recv(chan, chan->sdu);
> > -               if (!err) {
> > -                       chan->sdu =3D NULL;
> > -                       chan->sdu_last_frag =3D NULL;
> > -                       chan->sdu_len =3D 0;
> > -               }
> > +               struct sk_buff *sdu =3D chan->sdu;
> > +
> > +               /* The receive callback takes ownership of a reassemble=
d SDU and
> > +                * may free it, while l2cap_ecred_recv() goes on to upd=
ate the
> > +                * credits - which reads chan->sdu->len.  Drop the reas=
sembly
> > +                * state before handing the SDU over, and release it he=
re if the
> > +                * callback refused it, so that it is still freed exact=
ly once.
> > +                * The reassembly state is already clear at that point,=
 so
> > +                * return instead of falling into the failed: block, wh=
ose
> > +                * kfree_skb(chan->sdu) would have nothing left to free=
.
> > +                */
> > +               chan->sdu =3D NULL;
> > +               chan->sdu_last_frag =3D NULL;
> > +               chan->sdu_len =3D 0;
> > +
> > +               err =3D l2cap_ecred_recv(chan, sdu);
> > +               if (err)
> > +                       kfree_skb(sdu);
> > +
> > +               return 0;
> >         }
> >
> >  failed:
> >
> > base-commit: a2fd526d644233d6a892c28173f07c61e21e4c93
> > --
> > 2.34.1
> >
>
>
> --
> Luiz Augusto von Dentz
