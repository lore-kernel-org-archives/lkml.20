Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868825;
	b=mX0b+ud5JyaEmUSGgPsbtX4rvzhmlRaNC42Y8md9gcdIXBKMDh9RZ3aLmmf5i8OkAFW9
	 YKH7MB4IGHvfxIG/WR3Re88Wraxj6rL8Fe0Ds7MkGo6onym54QfuW+6vuDW8lUS9EwmK2
	 4pFvbrqGBkmgNAthqHY/GLX35XNirDfJGytMzEaA2PObaXFw6LHfOTJpD6Q0u46Ti9LP0
	 0lgTsv/Jk1lRuh2+EEbLPrC4Ny4o02e2hXpjLaOqZ75bUO1tD6MY1ADhMqmEoCq+XlXjM
	 B7hzPiHyLAXSoB+U3WG82okGZHuzJyjXjbVqvW8p5zQSpvqcgjEyfK93+WZxvAxekTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=MlaZKxfYPwkH9fsdHQHyPucWoX+jhcmqEFHwzgVgYs0=;
	b=ikZKN+u9CzezQxnsc8HgIdQxkc3aSx92dXUdX/yBCGOpUEmGVbzOAyayLPXbees3KpfW
	 M98ZuJafPwrasSlOM3Io9OVCMx56ia1QxanYYMzQ6kfS6Bwm0E+0Ct2eAfhFkzGCrnogx
	 5bQtP9GFXQhj4k4qK+wuBWK58OxW7K91K79brxsnwsVSb6hA3CYAKkYWEDt3bRpRUxLyc
	 +b3Mr+UMjN1Lvz4IejXUZGP5Cz52RjjW6RoAiZTHeIULMV1ylZ1Yao7+G4g2qDMRzVNUq
	 +cuBhFP67za14SA2uS6pu67UQRckVSsjvGHs/9cny9qLT1mjeFCc/2ayupYxbITXofA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nBCDoZ2l;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7759606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7759606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nBCDoZ2l
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-377f12217c7so3763571eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794868824; x=1795473624; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlaZKxfYPwkH9fsdHQHyPucWoX+jhcmqEFHwzgVgYs0=;
        b=nBCDoZ2l64CCHSBu4EslIrbhzZNhp7ts0LRXo3nFNyddPceFoW8i8Dx4PwTqK2zuXC
         kanOuApwf+7QIAS0cf/kNuiqcAkI/m0YmHRAp1whLHK5/YB7whYpt/3KlN3qIaWepik5
         8+pmn28OZ2OxMNmFGSPEftBf0NAmmaL6dOmudmujM72UbVMqNEnbmgr2OesxZv8os3Js
         cDPAseSAfakb6k9WDAn0xxhoQ1LzWKAqyc0rVtRAkUF/u1fG3wRCI6iHJIluyBkFn8KX
         R0LN6JPo7ClpkTS28TtWqlrMutDGBrN3/eI7FR7vs+TUwYE65w/sPksqQOHpXxBD4PmW
         kzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868824; x=1795473624;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MlaZKxfYPwkH9fsdHQHyPucWoX+jhcmqEFHwzgVgYs0=;
        b=PwZQXzd+vKD6lCoXEdQz9bZpR7U6JaLclPgbRUFfkhcgGNdzjuRwnz2r1Oe16Aaqpl
         hTc+YNU5b5qVctqZvWEZSxpb0ila9ElF0EjcOGHfz2MblJ9JQWB6q/5PQSQuhMcIcxp2
         GRwdRt3FkWLMVYY1MbIWDtAiiThPmXAnVKsC9aU+zffHGILgnNbFdECFFaydUBqSumNs
         blp2R+Uoiaurg6HsrSPTXuHSP3+RO2XvVLB9WL4Dh6Pw5pb3WyGszHf7dSFxc25BOGts
         q9H0RWwrWUyFKGel6snnssw9quDvZEAfwTRLqhxWZdOneJOJfV1hIZYalfNJceF3iygN
         HUfA==
X-Forwarded-Encrypted: i=1; AL+hErFM356Edj8WTzpaxEZu+rWqrfxl9aZTK9DERkaHe7Fzk/4rVMC61rxz/oceQtcZmQHRuvYkOEeov8U4EIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JE+e3a9KMlGS0VZ/fyhQJPZDlg7SoLov+LWsNqfrd+971HQnZ
	17QUCHeHYnGcxEXwYeltAupiopCA316WriaILVKQ/7sngIq9pCk6cpsk
X-Gm-Gg: AZFdTZcr3qNm4QMZptcxFSD0zdAs8uTi4+m2ltbFZguDK+1jBt0Y+L5CzM34TxMfQtS
	MkOt8XXr+VrKxIxSH/l/ipWb8mGyteRg/7b7b0HGGgBSQhpIV3ch99oQql95ACn2FR5sH9dEyJ8
	hLe7BwNNf1hRWfq4g1snP/ppZuF5HV4gqS7IUAoEp9X+iRwwN5hbQvI+fWSmJ4ml+l83ocDisfa
	v3yftvhys0Mzs1Wkfk4OW09PRcLv90G6uFFTZqxoLgunXjrSvGavUp5eXUfFwzPbx+l9aEkV2vK
	Z3EXAddBPMidSe8tZN/bb4LsWXAjLuXxcIUz+u8BM+dzKy+JOsI8iZL2Wxwv/osMgSf6C68tRX3
	8zl0j6RKwyr3jHyB860H5ygnT2tCIoKzgTRGNfCLaxJAtUbb0dR0S4XcQ7L7rw1L6beBozz1Hii
	X1EHKSxcie45uGmGSh4J+DzvDb0Jw4CuJCUlij3SfV2cIyO0CZnoWnRaZl9qKIi1gm2l5ExgDhD
	h/wSGSx1O4vhsZ5dIBNcSlhSIxc0a68jTUV0uLUoJgIImTFfJv5QagRAVXTl2YkwoCyiblWi7Y5
	C3Y73FRQyCVO+b2U+1xsZzg=
X-Received: by 2002:a05:693c:620c:b0:374:e25e:a533 with SMTP id 5a478bee46e88-37967cdd715mr14494631eec.35.1794868823847;
        Mon, 16 Nov 2026 14:40:23 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:73::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm38247655eec.2.2026.11.16.14.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:40:23 -0800 (PST)
Date: Mon, 16 Nov 2026 14:38:23 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pavel Begunkov <asml.silence@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH net-next v5 2/3] net: prevent mixing frags from different
 memory providers or bindings
Message-ID: <avuEsJPG0oUsKh6p@devvm16445.scu0.facebook.com>
References: <20261115004003.3695475-1-almasrymina@google.com>
 <20261115004003.3695475-3-almasrymina@google.com>
 <avtRYLif2GvfuAmu@devvm16445.scu0.facebook.com>
 <CAHS8izN4eCMub+douN8P29KstidvsxVmpvDKhjZ4JDH9yXAJ9w@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izN4eCMub+douN8P29KstidvsxVmpvDKhjZ4JDH9yXAJ9w@mail.gmail.com>

On 11/16, Mina Almasry wrote:
> On Mon, Nov 16, 2026 at 11:05 AM Stanislav Fomichev
> <sdf.kernel@gmail.com> wrote:
> >
> > On 11/15, Mina Almasry wrote:
> > > Prevent coalescing, shifting, or appending skb fragments from
> > > incompatible memory providers or different devmem bindings.
> > >
> > > Add skb_net_iov_provider(), skb_mem_provider_compat(), and
> > > skb_frags_can_coalesce() to check readability and fragment provider
> > > compatibility (net_iov_owner(niov) for devmem, niov->desc.pp for other
> > > net_iov providers such as io_uring zcrx, and NULL for page-backed skbs)
> > > across skb_try_coalesce(), skb_shift(), skb_gro_receive(),
> > > skb_gro_receive_list(), tcp_skb_can_collapse(), and
> > > tcp_skb_can_collapse_rx().
> > >
> > > Also add net_devmem_skb_binding() and use it in tcp_sendmsg_locked(),
> > > zerocopy_fill_skb_from_devmem(), and validate_xmit_unreadable_skb() so
> > > TX skbs cannot mix different devmem bindings or transmit non-devmem
> > > unreadable frags on DMA TX devices. Reject converting linear head_frag
> > > payloads into page frags on unreadable skbs in skb_try_coalesce() and
> > > skb_gro_receive(), and propagate skb->unreadable and compare
> > > skb_frag_netmem() in tcp_clone_payload().
> > >
> > > Update netmem_ref_test_net_iov and netmem_ref_test_try_coalesce so their
> > > target skbs carry a compatible unreadable net_iov frag before shifting
> > > or coalescing.
> > >
> > > This issue was found by manual code inspection and LLM review; it was
> > > not triggered in production. Verified with the net_core KUnit test
> > > suite; not tested on real hardware.
> > >
> > > Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
> > > Fixes: bd61848900bf ("net: devmem: Implement TX path")
> > > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > > ---
> > >  include/linux/skbuff.h | 55 ++++++++++++++++++++++++++++++++++++++++++
> > >  include/net/tcp.h      |  5 ++--
> > >  net/core/datagram.c    |  4 +--
> > >  net/core/dev.c         | 14 ++++-------
> > >  net/core/devmem.h      | 22 +++++++++++++++++
> > >  net/core/gro.c         | 16 ++++--------
> > >  net/core/net_test.c    | 42 +++++++++++++++++++++++++++-----
> > >  net/core/skbuff.c      | 24 +++++++-----------
> > >  net/ipv4/tcp.c         |  3 ++-
> > >  net/ipv4/tcp_output.c  |  4 ++-
> > >  10 files changed, 142 insertions(+), 47 deletions(-)
> > >
> > > diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> > > index 1d6832878930..867e3ab17c17 100644
> > > --- a/include/linux/skbuff.h
> > > +++ b/include/linux/skbuff.h
> > > @@ -3770,6 +3770,61 @@ static inline void *skb_frag_address(const skb_frag_t *frag)
> > >       return page_address(skb_frag_page(frag)) + skb_frag_off(frag);
> > >  }
> > >
> > > +/* Return an opaque pointer identifying the memory provider instance of @skb's
> > > + * net_iov fragments:
> > > + * - For devmem (NET_IOV_DMABUF), net_iov_owner(niov) (&binding->area, 1:1 with
> > > + *   the binding across RX queues and TX).
> > > + * - For other net_iov providers (e.g., io_uring zcrx), niov->desc.pp (shared
> > > + *   across all areas of an io_zcrx_ifq).
> > > + */
> > > +static inline void *skb_net_iov_provider(const struct sk_buff *skb)
> > > +{
> > > +     struct net_iov *niov;
> > > +
> > > +     if (skb_frags_readable(skb) || !skb_shinfo(skb)->nr_frags)
> > > +             return NULL;
> > > +
> > > +     niov = skb_frag_net_iov(&skb_shinfo(skb)->frags[0]);
> > > +     if (!niov)
> > > +             return NULL;
> > > +
> > > +     if (net_is_devmem_iov(niov))
> > > +             return net_iov_owner(niov);
> > > +
> > > +     return niov->desc.pp;
> > > +}
> > > +
> > > +/* Return true if the memory providers of @skb1 and @skb2 are compatible
> > > + * for coalescing. For any struct page-backed provider (the buddy allocator
> > > + * or a future provider handing out struct pages), coalescing is assumed
> > > + * feasible. For net_iov-backed providers, the provider instance pointer
> > > + * must match.
> > > + */
> > > +static inline bool skb_mem_provider_compat(const struct sk_buff *skb1,
> > > +                                        const struct sk_buff *skb2)
> > > +{
> > > +     /* Check skb_frags_readable() first to reject readable/unreadable
> > > +      * mismatches and avoid chasing frags[0] and struct net_iov when
> > > +      * only one skb has unreadable frags.
> > > +      */
> > > +     if (skb_frags_readable(skb1) != skb_frags_readable(skb2))
> > > +             return false;
> > > +
> > > +     return skb_net_iov_provider(skb1) == skb_net_iov_provider(skb2);
> > > +}
> > > +
> > > +static inline bool skb_frags_can_coalesce(struct sk_buff *to,
> > > +                                       struct sk_buff *from)
> > > +{
> > > +     if (to->pp_recycle != from->pp_recycle)
> > > +             return false;
> > > +
> > > +     if (skb_zcopy(to) || skb_zcopy(from))
> > > +             return false;
> > > +
> > > +     return skb_mem_provider_compat(to, from);
> > > +}
> > > +
> > >  /**
> > >   * skb_frag_address_safe - gets the address of the data contained in a paged fragment
> > >   * @frag: the paged fragment buffer
> > > diff --git a/include/net/tcp.h b/include/net/tcp.h
> > > index 25d11fab1b03..bf5f28e52fca 100644
> > > --- a/include/net/tcp.h
> > > +++ b/include/net/tcp.h
> > > @@ -1275,14 +1275,15 @@ static inline bool tcp_skb_can_collapse(const struct sk_buff *to,
> > >                     mptcp_skb_can_collapse(to, from) &&
> > >                     !skb_cmp_decrypted(to, from) &&
> > >                     skb_pure_zcopy_same(to, from) &&
> > > -                   skb_frags_readable(to) == skb_frags_readable(from));
> > > +                   skb_mem_provider_compat(to, from));
> > >  }
> > >
> > >  static inline bool tcp_skb_can_collapse_rx(const struct sk_buff *to,
> > >                                          const struct sk_buff *from)
> > >  {
> > >       return likely(mptcp_skb_can_collapse(to, from) &&
> > > -                   !skb_cmp_decrypted(to, from));
> > > +                   !skb_cmp_decrypted(to, from) &&
> > > +                   skb_mem_provider_compat(to, from));
> > >  }
> > >
> > >  /* Events passed to congestion control interface */
> > > diff --git a/net/core/datagram.c b/net/core/datagram.c
> > > index ecc30a6f8302..88cc0a6c62f6 100644
> > > --- a/net/core/datagram.c
> > > +++ b/net/core/datagram.c
> > > @@ -712,8 +712,8 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
> > >       size_t virt_addr, size, off;
> > >       struct net_iov *niov;
> > >
> > > -     if (i && skb_frags_readable(skb))
> > > -             return -EFAULT;
> > > +     if (i && net_devmem_skb_binding(skb) != binding)
> > > +             return -EMSGSIZE;
> > >
> > >       /* Devmem filling works by taking an IOVEC from the user where the
> > >        * iov_addrs are interpreted as an offset in bytes into the dma-buf to
> > > diff --git a/net/core/dev.c b/net/core/dev.c
> > > index a230ecce9327..51f5e4800eee 100644
> > > --- a/net/core/dev.c
> > > +++ b/net/core/dev.c
> >
> > [..]
> >
> > > @@ -4175,8 +4175,7 @@ static struct sk_buff *sk_validate_xmit_skb(struct sk_buff *skb,
> > >  static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
> > >                                                   struct net_device *dev)
> > >  {
> > > -     struct skb_shared_info *shinfo;
> > > -     struct net_iov *niov;
> > > +     struct net_devmem_dmabuf_binding *binding;
> > >
> > >       if (likely(skb_frags_readable(skb) ||
> > >                  dev->netmem_tx == NETMEM_TX_NO_DMA))
> > > @@ -4185,14 +4184,11 @@ static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
> > >       if (dev->netmem_tx == NETMEM_TX_NONE)
> > >               goto out_free;
> > >
> > > -     shinfo = skb_shinfo(skb);
> > > -
> > >       /* All net_iovs in an unreadable skb share the same binding. */
> > > -     if (shinfo->nr_frags > 0) {
> > > -             niov = netmem_to_net_iov(skb_frag_netmem(&shinfo->frags[0]));
> > > -             if (net_is_devmem_iov(niov) &&
> > > -                 (net_devmem_iov_binding(niov)->direction != DMA_TO_DEVICE ||
> > > -                  READ_ONCE(net_devmem_iov_binding(niov)->dev) != dev))
> > > +     if (skb_shinfo(skb)->nr_frags > 0) {
> > > +             binding = net_devmem_skb_binding(skb);
> > > +             if (!binding || binding->direction != DMA_TO_DEVICE ||
> > > +                 READ_ONCE(binding->dev) != dev)
> > >                       goto out_free;
> > >       }
> > >
> >
> > Should we limit this patch to the real fixes only? This part does
> > not look essential. validate_xmit_unreadable_skb already does skb_frags_readable
> > check above, it already does nr_frags > 0 check here...
> > so why go through the same stuff again via net_devmem_skb_binding?
> >
> 
> So this is a real fix actually, although I agree it's kinda clobbered
> into a patch with an unrelated fix. The existing checks do not catch
> io_uring zcrx RX packets that have been received and the stack is
> trying to forward them over a netdev where the memory is not mapped,
> and this patch fixes that.
> 
> > If you want, maybe move this to a separate patch at least? And do
> > something like:
> >
> > binding = net_devmem_skb_binding(skb);
> > /* I hope likely() below properly unwraps net_devmem_skb_binding similar
> >  * to existing likely(skb_frags_readable) case... */
> > if (likely(!binding)) goto out;
> > if (dev->netmem_tx == NETMEM_TX_NO_DMA) goto out;
> > if (dev->netmem_tx == NETMEM_TX_NONE) goto out_free;
> > if (READ_ONCE(binding->dev) != dev) goto out_free;
> > return skb;
> >
> > And call it cleanup with no fixes tags.
> 
> I could break it into a separate patch and reduce some of the
> duplicated checks, but it's still a fix. It may be good as-is once you
> realize it's a necessary change?

I see, so that desc.pp part is missing currently :-/

Acked-by: Stanislav Fomichev <sdf@fomichev.me>

If you happen to repost, I'd remove unrelated `struct skb_shared_info *shinfo`
removal/etc to make it more clear.
