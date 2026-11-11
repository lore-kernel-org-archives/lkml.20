Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434468;
	b=R9K4clj4MRera1U9Uj4iM9/B0PUVZBrg5wOsC4i+FkQWhOQFgUp9vcAIUarlvbZuX1uk
	 oUO8a4Wrviuptq3hi9flNqFQgcLlbO0k75foVYTTlAE808+vZzjr6+4k6I+VAZV9Ek3ob
	 b0YXORmNDtoo0J/rQTaaXous3zk6BUDqOLRM0EMtU0FA7XutTUhFs5EFvH2IbUbsquc2s
	 8wovjPum46ui8rUdlSysMWVx8oJHuSXS58ShDlmkvVcuFif5HwPPbVvyks5pYnmEVDsN/
	 LuCaodl9jnzOuW1UpaojcT+fkEMmYHWSNSnYQG7BSZuV2X3SQKr2qtihrIpHgRpITFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Zvla0mu+gfalLGz1DoaFw8Zr1EDQonu9YPsE9DkMK38=;
	b=CevifB1x+TCr0/98fRjEKdsO3t/MQ4dQw/Go6HfqCpTtnduJaeewviCsnp8XkCPsVONh
	 WUl3izUW+J/jrP8xz72XUefgj3Ez7h6MwuFw2oeqisQLNpWA7s3y08PGPc75ivBszMzr+
	 fRUCHeKzz49GTsNlFbE7+Xrkt5XezFYnGN/JITohcL3lGFh8efue2UWtOPCxm4UrrMfTZ
	 WZvwRe1xKD7EMt0UByK6+tOMiYt13x/bv41Etbkce5SVJXI+RhjahMd7qLtW/8vwBgcl2
	 QDLyJ6r4H4lrsOyQ4n2MarEFBibZ4wKdKEMY5P2MDlzwR2F7ReROKIiZqHJrGwgs10g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cg8I5xL;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C280D606A8BE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C280D606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cg8I5xL
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so4312060eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434467; x=1795039267; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zvla0mu+gfalLGz1DoaFw8Zr1EDQonu9YPsE9DkMK38=;
        b=0cg8I5xLzPahs75tG8wMvhSu37KYhsedNAv7DqZGaIcZgMM8lIFxc2xuOfqhTuTYNs
         O/WlNCgGu3/ZIDKniCHFeZSOTwhFSnjZ1oFS+FI1EmXuwe1Epk2qo2k5/wJkwvPQC3iF
         zAB0S/5M9vns5/aPBB6rXDh/+e/1cl38jTW+NglzoTOorCqH+HQDB4SnXYoJ/h74kQsF
         H3bPCteWd2jd4F8HZeDuwchIn0vxQ9uAx2Y+i9aYRJgBQTkge84ghgEYT+9TSgT5T9OW
         JCrBfnA0ZbtuB6jOY7FSBTIKriH3xZ9khvD4RqXyWKporOzqv7A8iX9TH/NhK7sqauS/
         6y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434467; x=1795039267;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zvla0mu+gfalLGz1DoaFw8Zr1EDQonu9YPsE9DkMK38=;
        b=YnkU+frNdZIBgAjxyC0SiPRyhfz5bqSH6QKLgk4lw8yjcmmrCTW3Hh9QBlhfqQbNTi
         hY6FzZCG8LDo8U+KweRJhAhRBUTe/QzbhLpSwFcF1nOFO/ScIqdtxBiBzioNqyXJ7nuL
         qUFYclzyyXHDT3SPm1liqbqcfSJHeGne3Ht6FS3PdZoGMa+e5e0kPRunwYD5EPNeO4tA
         GN18Bk+Llg1rhKXGTxKViwn7lsLZaJ09TVXlBbJVEGIrXM+h1xeOyxA/17DV/6AEDEmd
         MlyZzI3oPfWJNG0wzVbV7bFCKuPWLR2lmuwabc8X+JRKCWuEdqwK/i9meXKJLRBzxSw5
         KHNw==
X-Forwarded-Encrypted: i=1; AL+hErF+F6JSU6tnR5oE0f1u531/YBAaKuiG/hvHlJ4g0e3FCmYQWCiPCEAvKceCh+RQ+UwdGVu6PPeq+JSucV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vZ9/rTYuiTgBYZ7+UvEN3nmeDq/aZY1uV3ZZV7CPrRJSStMkH
	RxTLSrd1Xzwsb7OEhR/a7eI5xxyM8fDZWlLoHBeX/GCpmwXa254BSwWMkSFSyPRrUuE=
X-Gm-Gg: AYBFou3P7+UHBnr7KM6MkOvde3/TFtXNFwOx44QgrdM8LIaAXAE8SbeTtTPymL/zuR0
	kraZ0sHfViSoKr0YcqP2KwM1CJ2RXG6UFyVsgTlaxiNSxbPyjQHc0CzZWRqHjOb1dAG5UKYLapx
	GGwz1WHA0pfMnKUcCVkKITHcefWjXDa6O3X2q60/ldu6LWQ7btRJh8BpQYPe8m+F2Mvjt3qwreR
	7U1LOObBJpw4T2qRMuXJLSbZhOIDXOF7ZN6U43AwONcOYrXde5Jg/9yryKwtD+U9G+MPr+qlKHA
	O6juKam5CpOwc9e5ik06auXC+nvpdMVWcU3SW6Bgle1WWLQo2nObyvZ65/oeb0FAn+rwoVfAk7f
	aTaAsCi0ifr6kKOX7Vg5UNa6s6R8479ZMqK6LOte7rQfZ7NsdhGOJ/tf7AWza7I6vefngY24WC2
	+AWX0tR4I3AT08YT4SVKiDm7ErxRAciCSNH0+QIiBmRSh2FAMrGgwjApnlzyy7a6HT8QV+G2HpF
	ICJnUo50bZ7KKaNuKYLw6PWSwHp3hrlOrHUe1Yl5kSWP6y/JMI8PeOX2QHYSXpgkNbwHn/sGG7x
	lKWn0WCmLXQCAwBaZaTRcyc=
X-Received: by 2002:a05:7022:e21:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b3c02f09e4mr4677986c88.12.1794434466726;
        Wed, 11 Nov 2026 14:01:06 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:62::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm20535169eec.27.2026.11.11.14.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:01:06 -0800 (PST)
Date: Wed, 11 Nov 2026 14:01:01 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	linux-kernel@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH net-next v4 2/2] net: prevent mixing frags from different
 memory providers or bindings
Message-ID: <avTkuRVZcOuYlu9T@devvm16445.scu0.facebook.com>
References: <20261108013838.1454450-1-almasrymina@google.com>
 <20261108013838.1454450-3-almasrymina@google.com>
 <avIRJ3vdIj6Jr9zJ@devvm16445.scu0.facebook.com>
 <CAHS8izOxvUxCND3R18_HfZhB=2RS4_RNfAmx7S=Ex6b5z_CQuA@mail.gmail.com>
 <CAHS8izNodRM1Bx+FT7okpdeDfCeyJVP5QoyxhSMJWXpGuwyL4A@mail.gmail.com>
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
In-Reply-To: <CAHS8izNodRM1Bx+FT7okpdeDfCeyJVP5QoyxhSMJWXpGuwyL4A@mail.gmail.com>

On 11/11, Mina Almasry wrote:
> On Tue, Nov 10, 2026 at 7:54 PM Mina Almasry <almasrymina@google.com> wrote:
> >
> > On Mon, Nov 9, 2026 at 10:33 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> > > > --- a/net/ipv4/tcp_output.c
> > > > +++ b/net/ipv4/tcp_output.c
> > > > @@ -2692,8 +2692,9 @@ static int tcp_clone_payload(struct sock *sk, struct sk_buff *to,
> > > >                                    probe_size - len);
> > > >                       len += todo;
> > > >                       skb_shinfo(to)->flags |= skb_shinfo(skb)->flags & SKBFL_SHARED_FRAG;
> > > > +                     to->unreadable |= skb->unreadable;
> > > >                       if (lastfrag &&
> > > > -                         skb_frag_page(fragfrom) == skb_frag_page(lastfrag) &&
> > > > +                         skb_frag_netmem(fragfrom) == skb_frag_netmem(lastfrag) &&
> > > >                           skb_frag_off(fragfrom) == skb_frag_off(lastfrag) +
> > > >                                                     skb_frag_size(lastfrag)) {
> > > >                               skb_frag_size_add(lastfrag, todo);
> > >
> > > From [0]:
> > >
> > > Maybe easier to not merge niovs here? Add '&& !skb_frag_is_net_iov' to
> > > that 'if (lastfrag' check? (or your new skb_has_net_iovs)
> > >
> > > Looks like it is tcp_mtu_probe path, not sure we care about merging there?
> >
> > I'm guessing this is not an issue with pages because they're
> > PAGE_SIZE? But, seems maybe a bit lazy to just hammer all possible
> > net-iov coalescing? Is there a slightly cleaner and more generic check
> > ( && skb_frag_size < PAGE_SIZE or something) so that we don't add
> > net-iov tech debt? Technically this will be an issue for hugepages in
> > the tx path or large folios or something.
> >
> > Also I think it belongs in your patch series maybe. That's the one
> > adding the large niovs :P
> >
> 
> Actually, this comment made me realize: is the optimization that you
> did with net-iovs here (that's showing so much better cpu) also
> already implemented for pages? If not, is it possible? I don't see in
> theory why the userpsace can't pass in a contingious 2MB page to
> sendmsg() and the stack could keep it intact in 1 frag up to what the
> driver tx supports, no? Is it worth it making your feature generic and
> apply to pages too?

Based on [0] I'm thinking that I'll drop all per-frag enforcement
and will not add any special handing to tcp_mtu_probes. Looks like
the drivers are expected to handle large frags (if they advertise
large tso) or have a [1]-like segmentation fallback signal to the stack..

And yes, regular msg_zerocopy path already merges pages so this is
not niov specific.

0: https://lore.kernel.org/netdev/20261105222058.944293-1-sdf@fomichev.me/T/#m169832053b43604b0c5df7f7b1d04e9d4f390cbc
1: https://lore.kernel.org/netdev/20261105222058.944293-1-sdf@fomichev.me/T/#mb6e882ab1aecd6c15552773653301cc235b987d8
