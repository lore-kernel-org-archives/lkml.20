Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A488A4E01FA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791843; cv=pass; b=VSxYPw/ucRhDSG+I2UwVcu9D2BZcWfemJpkfIBobbMsAFM/EhS7T+F7z3r4NZl3AKjUNkkeW95vXNW0mCzOqKj+evjpkgPCyKyIm/HoyLWriYCJ4t8bF4TigKOxIl4hi+laWv58sOYfjmKEI7j0kDZ/xL4KCPFdB8w4ClzIdD5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791843; c=relaxed/simple;
	bh=IAF9rQ3F4twH9diAhxEPNqxyfLHNSPaVCmmIYi0LgmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t07UF4ti0AUaz5RwxxVCLNpoCJftUZ9WmAMytTMC0iimZhIGFwf0jatRVXCnFMfOUzkIhFIIDnYKANrk++KCugwzGtdL6wOGObQ7sjCaiX/hCikM0m8AK2M4BfPoHetfLATHSqzt9K8jtv9YaSbVZa+t0CcHrxiwcDIt3tmyZCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ek7VBR/x; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ek7VBR/x"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae14e9982bso194598a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790791840; cv=none;
        d=google.com; s=arc-20260327;
        b=RUR2/rXaijpMXp3+fwh2Uz3TA9zjc4R9B+559UtFzABMQQHevNReQd/wRMjQR2UxPa
         VYwRkOZ8UZ4ConGNTX7ihOl/z5RAK5/kmxP95F+tNFT3OgNYFw9I9yNlFQ+Nl8Gep0PV
         JHQIOBnQklNUTB1DtrHTHdGA0bI/TPOa2vSW+PrXsS3SIH1sKAo6/Rz2VG+l7fjjwdQW
         UR4jPFrNxZi9DjRpDXy2axk3G/4pVbHgYsLuyfvrsVJBGad8xmtUFIkZppd9eYEMf45L
         uCHqopx9SdNGTGfNpsxapJYWMabCO5VmOuVhapIEqyBxy05mKP0JgpnFVjY9ibbVQEA9
         CkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XsAeTJI3+nuFUQ7aBRpF568Y0nyKQPNERKkT7Ysunxs=;
        fh=VwpTtPAdkFWscvyvt59hccw0RSrANSHlyPFU5fHVkLM=;
        b=HrckM/mk9bkNYDFN3BZNoBTJJZ1XiH0SdH7ThpkUrSuXmpQDIAnicquVGlyu5JdTWC
         bdNyywHhz6DQQQF7AP//imAO8sHBYwXMIn6pAb2U5sPvNLHWyxkYqwkFIjFPt7yOd1u2
         ddFTJX6+oGC7gmQghRv2bW9wuUwpzpZbrD+Yc2qDhrAm9AjZeK8b6b3edJPg34C8+uji
         Vdebok/jbr0x9P2ALvPGfB5t5Ah6pttsSCHs8wTNG+zQv5AFylVpJo/VCzukKhfmLK+2
         vblHtEKrEWUwAKyhK+W9AqR2zwpX9FmeTWUjKtaDHwbfEHA5tRWpo+mhkeG8PElvV77S
         Hn2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790791840; x=1791396640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XsAeTJI3+nuFUQ7aBRpF568Y0nyKQPNERKkT7Ysunxs=;
        b=ek7VBR/xG44bGh/TPoxNfYR+DvwI3XpTPMEldlg/ik5gEXfzfPKMr3vmqzYcFGVfcu
         /ZEZqOXuryVTL3kYcqQn2aTP5LXa7S0iIBNerFCib1SjW3K+aTRQ+GOZdFMXdG7Po9bv
         Fx/Cnv4Y26heoWU0IUhn8pDAMzR4pugUKikcQGvAvDiXRikYw8nYjIBslLAGJWZL58cL
         ti2aM2Qj8jk7C2iU21fD1umuk7RAyHF6Tw2/7X3Ju0FBiGsoG21oE8xM61FDqmFM4cfI
         iRy0M8AUPaBH69S51ZRY0SVUNe3DRLiM1RirEwHKN7JwZO5ki4juBZGde2fpJ7d1LKqQ
         egqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790791840; x=1791396640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsAeTJI3+nuFUQ7aBRpF568Y0nyKQPNERKkT7Ysunxs=;
        b=Z3KKK5RDON3mIEGZdXHPDKJVlfE+GK/smpz9slKPK9hOpBrcargL2CKeoYxRNLH7U/
         luJikNBn86BfvTCDI9irHGw3rRbHz9R8TZBDNMjvvdHACwR2WZTD+EcWBWn0FQItCSE4
         hCU68XeNnWfc906p9wJ772IoIhSEGR50UaiD5dBGcZyR5sfoukSDkx9nqrcxPCDglMvQ
         eXhKRYeKr6T31wFB6sY76d+I6qvP2ZTmkvPRT9d6k1rG6ZdPrmEE8hK33EH4wCrcvwT/
         IbLyZK3azf+ULcJUWEkQvUdqdpXWusPgYPklgp74O2AsPjekids2+5QHXApHL23dCkHP
         Hjew==
X-Forwarded-Encrypted: i=1; AKwUvByq0iqlgY1wok+tSuCaE0GySAICEMgpgWsxzEYv1eMVLKCtCCQxfmaufBOSLXLOj7ClVSJ4c1tE1KsHH1M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg2kMzAGYBW+u1CK/FMEhnSezrENVUJ8pEYjANixLkunjWsbag
	ehhAc7KUS9SGUXbWU1lbRluPgLAYQK/rwqECrFgmPOI9Mq8LrufFJVY9A2x8Wwv9EnJ3RTGBoNZ
	UdCVXGhbSnlu1eBVJKI+N19qIWEeZVFY=
X-Gm-Gg: AYBFou0FHFZdNJftA4weeNwgSzs4G6bwAZ6G4YcYQquBl7ba/4KZ6opS2eNrdbuzQNT
	FaHo6geClJlQgFrD99NN1kWjRDT+HuCRQT+wKcRIYd4i9cabO1+E7D9+sNuyNar/TFPC3/UdbI6
	qEKQxOToyFn3g71mJb9s7bf0piAePKzK9VECQlYkHQ/tgWcES/+SFm+VsDDpyywl6JQZyeYLtpR
	EA80arOTg7PDp39fdGAPJuvETeb6fKjT4Xsc0yMiLS1OQiYa4wzL/l9WESjQESPyXKZKTxLZWil
	mYbAF7wk6EfUbC+tf963eTsCzJ9DIJRiPFd7xTJ9vk4+5Iy9svQR5Mm4x5TNVw+kv7RPJaCKRWV
	DtonBoNUA0BirrJUwZrcqEQ==
X-Received: by 2002:a05:6402:320d:b0:6a9:b062:f0c4 with SMTP id
 4fb4d7f45d1cf-6ae198b82dcmr2131622a12.2.1790791839680; Wed, 30 Sep 2026
 11:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926173315.2452612-1-nicoyip.dev@gmail.com>
 <arty-oqohbGiefgS@kwain> <CANn89iLzwsrka1MUS64RKxx9TbKxGdwzB63nzs6v9endCwUahQ@mail.gmail.com>
In-Reply-To: <CANn89iLzwsrka1MUS64RKxx9TbKxGdwzB63nzs6v9endCwUahQ@mail.gmail.com>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Thu, 1 Oct 2026 02:10:27 +0800
X-Gm-Features: AclHuK9FyLMCIwx5kr8OOKxcEPry1zVrMYH2FfXqBJhPscfcAGTrJCKmhfdp0Wc
Message-ID: <CAAo+4rUaPQA_+hAsTYv+fdMnM-5KFZa5RTQxyL+N_gSMgd13Cg@mail.gmail.com>
Subject: Re: [PATCH net] net-sysfs: release the TX queue tracker before
 allowing reuse
To: Eric Dumazet <edumazet@google.com>, Antoine Tenart <atenart@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks all for your reviews.

On Tue, Sep 29, 2026 at 5:28=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Tue, Sep 29, 2026 at 10:13=E2=80=AFAM Antoine Tenart <atenart@kernel.o=
rg> wrote:
> >
> > On Sun, Sep 27, 2026 at 01:33:15AM +0800, Chengfeng Ye wrote:
> > > An interrupted sysfs_rtnl_lock() can drop the last kobject reference =
to a
> > > removed TX queue without holding RTNL. netdev_queue_release() clears =
the
> > > kobject before releasing queue->dev_tracker, allowing the queue to be
> > > re-added while the old release still needs the shared tracker slot:
> > >
> > >   CPU 0                               CPU 1
> > >   netdev_queue_release()
> > >     memset(kobj, 0, sizeof(*kobj))
> > >                                       netdev_queue_add_kobject()
> > >                                         state_initialized is clear
> > >                                         netdev_hold() installs new tr=
acker
> > >     netdev_put() releases the new tracker
> > >
> > > With CONFIG_NET_DEV_REFCNT_TRACKER enabled, the old tracker is leaked=
 and
> > > the new lifetime's tracker is released prematurely. A later queue rel=
ease
> > > then reports a double release. The numeric device references remain
> > > balanced.
> > >
> > > The kernel reported:
> > >
> > >   ref_tracker: reference already released.
> > >   ref_tracker: allocated in:
> > >    netdev_queue_update_kobjects+0x23d/0x5c0
> > >    netif_set_real_num_tx_queues+0x111/0x820
> > >    veth_set_channels+0x327/0x930
> > >    ethtool_set_channels+0x3ee/0x490
> > >   ref_tracker: freed in:
> > >    netdev_queue_release+0xbd/0x130
> > >    kobject_put+0x1f9/0x280
> > >    sysfs_rtnl_lock+0x18b/0x1f0
> > >    xps_rxqs_show+0xad/0x250
> > >   WARNING: lib/ref_tracker.c:322 at ref_tracker_free+0x49e/0x6d0
> > >   Call Trace:
> > >    netdev_queue_release+0xbd/0x130
> > >    kobject_put+0x1f9/0x280
> > >    netdev_queue_update_kobjects+0x3f9/0x5c0
> > >    netif_set_real_num_tx_queues+0x111/0x820
> > >    veth_set_channels+0x327/0x930
> > >    ethtool_set_channels+0x3ee/0x490
> > >
> > > Release the tracker before clearing the kobject. Use a full memory ba=
rrier
> > > to order the tracker access before clearing state_initialized, paired=
 with
> > > the control dependency from that check to the new tracker allocation.
> > > Keep the device reference until after the reset so that the queue sto=
rage
> > > remains alive throughout the callback's accesses.
> > >
> > > Fixes: b0b6fcfa6ad8 ("net-sysfs: remove rtnl_trylock from queue attri=
butes")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> > > ---
> > >  net/core/net-sysfs.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
> > > index 352173df7578..b9aadc4c000c 100644
> > > --- a/net/core/net-sysfs.c
> > > +++ b/net/core/net-sysfs.c
> > > @@ -1906,8 +1906,11 @@ static void netdev_queue_release(struct kobjec=
t *kobj)
> > >  {
> > >       struct netdev_queue *queue =3D to_netdev_queue(kobj);
> > >
> > > +     netdev_tracker_free(queue->dev, &queue->dev_tracker);
> > > +     /* Finish using the tracker before allowing the queue to be re-=
added. */
> > > +     smp_mb();
> >
> > Can't you use smp_wmb() instead as it's used to order two stores?
>
> I do not think smp_wmb() would be enough: ref_tracker_free() only reads
> queue->dev_tracker, it never writes to it. We need to order a load
> before a store; smp_wmb() only orders stores.
>
> But what does this smp_mb() pair with in netdev_queue_add_kobject()?
>
> The changelog mentions a control dependency, but netdev_hold() is not
> inside the if () clause, and state_initialized is a bitfield, so
> READ_ONCE() is not possible. This works thanks to the early return,
> but it is implicit and fragile.
>
> Please add an explicit smp_mb() in netdev_queue_add_kobject() after
> the state_initialized check, with a comment pointing to
> netdev_queue_release(). This is not a fast path, and will help code
> review/understanding.
>
> if (unlikely(kobj->state_initialized)) {
>         netdev_warn_once(dev, "Cannot re-add tx queues before their
> removal completed");
>         return -EAGAIN;
> }
> /* Pairs with smp_mb() in netdev_queue_release(): the previous
> * lifetime must be done with queue->dev_tracker before we reuse it.
> */
> smp_mb();
>
> Also change ( /* Finish using the tracker before allowing the queue to
> be re-added. */)
> to the symmetric one (pairs with smp_mb() in  in netdev_queue_add_kobject=
()...)

No problem, I added an explicit smp_mb() after the state_initialized
check in netdev_queue_add_kobject() and made the comments on both
sides symmetric in v2.

The sashiko report on the rx_queue_release() sibling path looks to be
possible. I have applied the same ordering and barrier pair to the RX
path in v2, although I have not reproduced that race.

> pw-bot: cr

Best regards,
Chengfeng
