Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794887295;
	b=exUjngJb7gHxI08yEhtGD5LuKseHnwvgTiMvu+z8u/qEO/B0tQJ6v/ysnG1zTd2JlfvN
	 esWc36g5xHzrhPAOX/AXNAosVwDVM1PD7dWdE5Fxu02Lrh2kAykOydMx/aaehKo9SLutH
	 XsO09TI15WLK74i7S43aEa9u/rw0YiEETug0ErCx8+UP+/sFGeRSkE9OUjpYx6CAj3bi6
	 9meaN3+055240ZYTsp6Y0XUiHza8Jh7Qrl7ooa6Ka+G2MhhlvTp4qaaTERFFdGY9k1llb
	 4AR3YCVyoabmhTeDNmXTcL00Bqq4PGPM3SJC3EzgqKeyZSBGX8R5lKxUUE4pVWaDQhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DLcMcTvPOEnravF7dNaq+o45VUDBU7Q6BawTdgCmL8M=;
	b=QtlgCuiRuNlfFnNnzsnHb7CHvLyTiB+u8S/1VP1fxW3Dyu54QGbI0hsHjyXyCXeb5Da5
	 UXID1CZu/dzK82ywT2oahFjsyknGS95YF5zlIiLBIn/Bu2kiZN4boQTJHq4gwgTOL4N2E
	 7GzSs6qZ84ytp60bTxb0yGLtc0J8nfuflaVJ3KqLYrNZpuZAdiY7Tuh1yPKhrF5Lkrlmv
	 qgETreM3MTwNflmG7RGG78Ic1T1NmJhJaCeJcoHYD7pNHC9Z8wV2YJYJgCs36xh3TpMKp
	 wpTeYFDb3DN56KdPv7BpEA5gzEe+KzbTSVosPqp9BRXHk3865K4m3Smoh4Xnwa0E8xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4KJSdYv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119D6606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 119D6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q4KJSdYv
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso6422768a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:48:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794887292; cv=none;
        d=google.com; s=arc-20260327;
        b=fLnAeChgzQG2yiN1r019+S/WSkNK7ED5pD3okEs0PtcrjLkCn4Yz8Fqv7fp3LHdZew
         9dpqOxB8JeDosJ3xA6WbO9Qp40a/lS5RJmv9ImWdL5pu8qpZ/y9zoxlT/tsswXeFOf53
         W2dwPijjI6aoWEuj80217PRR1XpCqlNz+gAeV6TVVczPrqlqw03cg8hc9mJFtFnb8X9s
         yxVGo1WzDYGZKYKlD9BH/OYL15DSyjGqhsRU06vTsopuJ8m//bw0Q+vbGN8MTn5YvsmU
         6BBBhDGxoCJKZ6MAb8tNojle2Q3iSNfNmZKkIhcYZjg0jD4tbJ2j8ZG0qfYQJ88KquwQ
         mYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DLcMcTvPOEnravF7dNaq+o45VUDBU7Q6BawTdgCmL8M=;
        fh=RS4Aq4n2nZPYNFZaC8rVa7YNrYZobitmTkR9XZ2uA/c=;
        b=Rxrjl07StvlfQRt616un1Fu2XMgitwqVhLgu/UEQgv3x0g8fngAZpaeE7J3XCfqhgI
         7qbRC85J+qj+biXlypxGe5JrrXc8WnCXQnFZCbAvYQfsgkPXwUA4HH26f6GQiAHDx001
         KSGJOYdHMMKE99KpCngjJKS0fbymed6vJn0/NJNDl6pAk05G4gcy6FmikHF+iWH4IegQ
         ze3R+E8qKON9IoI/gNhUf2fHrl3GWJYCrSJUF7Tp00XRLocQYC6cevaFAblBFJt3H9uj
         asm36VQ8MqEu+BcVi2q1ADlEjF2B7Pnz/GGQIhdu+35y8kgIPEGWMzjnKuN/DJuXSyUU
         c2tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794887292; x=1795492092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DLcMcTvPOEnravF7dNaq+o45VUDBU7Q6BawTdgCmL8M=;
        b=q4KJSdYvaGm9wq4tovsDH2XavwAq0R6m6bkAywHa4lJjiwbn/FI8oLVh/KdujrUgxV
         Cx/D4s15L3ISNRCLBUj2jRzjn6PJw6PkLsj3rHFmpdMvyB1PpFKA39bbycKl4B8JkDFy
         jOPWa6Xn6hmz64pe2p84AVNOzuiO0TyHFgJUPEc7gynks+pF+Mne2ozJ328r3dhhIrNr
         2hZbp+SAD2mF+7m+Nqibej3GpuzulzQvtJBvlvgv7im5rxP9hgOkjTrQB8q+RKOVnrB6
         egNeUTBTJy9uJq93oUiGGFGwdA3a26gt2DWK2ywAyQAWfCytfoWn89F3oxmJpY8vXoK2
         ts+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887292; x=1795492092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLcMcTvPOEnravF7dNaq+o45VUDBU7Q6BawTdgCmL8M=;
        b=YO8Vi1MuLvGBHkem8J59fyT07nBZJJCzKYm50NBF9pdrC7odVbN4fam2md7uryW6fp
         Fr/DK7tNuOh3RqZOrZd/oai2aL2VP1EjOUBvIZ0KkhQnufmRcyyuL33t5kM/PqDlVI5b
         2pUZaS6lZ3IEIU9QAPGUo5vY1TihHeA6hhHhFAsNxMGXO7Fk4hHSgU/oxKfCasP6r5D6
         5/1CW4NViNFj0HF+DVLWJOqYeGKevqJJpeFv1/E54IyKbblETCOKmF7JocBOciEuy/lb
         rtqU1oO6Lkpd0WhNi8Kkxwc8w6H2sZQFHgf6TAczXxdGOUo7+7Jg9iuHhSiv2HkoqW02
         q9TA==
X-Forwarded-Encrypted: i=1; AL+hErEbde2q6jGVi2vSg0ouHie3jL7oVujnIVhn0FKph+ADd0dbBBJtRWIx6F9/QKnk8iE5zanFIlvjKLAI4AY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VdJXxShx1bsFwQma6K8+aW+qU4Y22RYvYyCCvF9mJNf9SJ1ih
	zKCWopR3VLtreFCCRwQWeA2+myB7/6Q+2SlpeeMMy/UHuqeO3w0t1TOHmyy+nfhK4GQuCvmsa9R
	a7bgY5CgpotzaYouN+6Y1ZDcszdw6TiY=
X-Gm-Gg: AYBFou1ZDvS6G0CB5Xt/P1J5KSk9hjeu27zZxBLyMIzJgqi5VNCYVQVYqrBRNGBgC8L
	mF6mYba4KC+vXKkP97jg8usLjj5s4kiuEzbAHaD0EA/FijJWDrXI5gEWguGq6gTeAAc/x0VXjxV
	2xznGfFF+69xI42sMYCKYyazAX40p+Z5yJ91r5E3/K/iX8kFF0iBVZV4LHpEC345Ob8qiry+1I6
	DYsV+OWoLsgrNpkNTO32f80rC3UwExBRZYiFYRhuGpWeREmrCLyD271GGqFiVkZ0qIHY0KrDIO9
	+DVbo3HhZPzP8dPqrG4GSH124eDFVWTp61cAsa65HMiycgJdXqnlbn/3ct4zuvPipQHwwsJrpPY
	nijNJmqLGwZ7SBYSYdi/JvM+gJG4TyfaLGubylyDoVwtmZi6p91WCo9bJl+GNwWpYJZkDjMr3yN
	DfM0Nx/dgpCYwEhao=
X-Received: by 2002:a05:6402:516f:b0:6b7:df0c:18d0 with SMTP id
 4fb4d7f45d1cf-6b7df0c1ccfmr4938103a12.11.1794887292347; Mon, 16 Nov 2026
 19:48:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112064624.15245-1-juanagusnicco@gmail.com> <avuhR7Epvtgu--iT@google.com>
In-Reply-To: <avuhR7Epvtgu--iT@google.com>
From: =?UTF-8?Q?Juan_Agust=C3=ADn_Nicco?= <juanagusnicco@gmail.com>
Date: Mon, 16 Nov 2026 22:47:59 -0500
X-Gm-Features: AclHuK_gyo-l2I-E19IhRjvW3CZh8tP53SY2qJsWKfnOF4zx0gzCiSIv7CmIDlA
Message-ID: <CACQ4Acg7wPaOgJ0Xx-ejsBz-k1uyuDPUDWLWs45B_w1b753ETA@mail.gmail.com>
Subject: Re: [PATCH net] tcp_metrics: hash the destination address with SipHash
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:36=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
>
> On Thu, 12 Nov 2026 01:46:24 -0500, Juan Agustin Niccolini wrote:
> > The tcp_metrics bucket is derived from a fold of the peer address.
> > For IPv4 the fold is ipv4_addr_hash(), which returns the address
> > unchanged. For IPv6 it is ipv6_addr_hash(), which XORs the four
> > 32-bit words of the address. net_hash_mix() is only XORed in after
> > that fold, so two addresses of either family with the same fold share
> > a bucket in every netns.
> >
> > A host owning an IPv6 /64 can thus compute, without knowing
> > net_hash_mix(), addresses that collide with a chosen IPv4 or IPv6 peer:
> >
> >   w3 =3D w2 ^ p0 ^ p1 ^ target    /* p0, p1: prefix, w2: free */
> >
> > A bucket holds six entries and the seventh insert replaces the oldest.
> > An off-path host can fill a peer's bucket with its own entries and
> > later tell whether one was evicted, because tcp_init_metrics() seeds
> > the initial RTO from the cached RTT. This reveals whether that peer,
> > or another address in the same bucket, connected in the meantime.
> > XOR and multiply is not a PRF, so net_hash_mix() can be recovered the
> > same way, after which evictions leak about 14 bits of any client's
> > address, depending on the number of buckets.
> >
> > Hash the address with SipHash and a random key instead, as commit
> > 2ee66e948717 ("inetpeer: randomize RB-tree node comparison using SipHas=
h")
> > did for inet_peer. net_hash_mix() and hash_32() are kept, to separate
> > namespaces and to reduce the result to the table size.
> >
> > Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
> > ---
> > This can be exploited remotely to recover a client's IPv4 address.
> > A single host narrows the address to about 262 thousand candidates,
> > and because each netns keys the hash differently, intersecting buckets
> > extracted from multiple hosts converges quickly into one candidate;
> > 3-5 are enough. The net_hash_mix() value only needs to be extracted
> > once per boot per host.
> >
> > Many common cases facilitate this. For instance, a browser loading
> > one page connects to several hosts within the same second. That
> > supplies the buckets needed to converge, and the shared timing shows
> > they belong to the same client.
> >
> > I reproduced the bug on a QEMU guest running mainline (2a500a04d6f9) an=
d
> > against Ubuntu 24.04 over the internet. With the patch applied, the
> > reproducer no longer finds addresses that share a bucket. The
> > reproducer is available on request.
> >
> > For stable: 5.10 and 5.15 lack siphash_aligned_key_t;
> > "static siphash_key_t tcpm_hash_key __read_mostly __aligned(16);" can
> > be used there.
> >
> > This bug was discovered during an LLM-based code review.
> >
> >  net/ipv4/tcp_metrics.c | 32 +++++++++++++++++++++++++-------
> >  1 file changed, 25 insertions(+), 7 deletions(-)
> >
> > --- a/net/ipv4/tcp_metrics.c
> > +++ b/net/ipv4/tcp_metrics.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/init.h>
> >  #include <linux/tcp.h>
> >  #include <linux/hash.h>
> > +#include <linux/siphash.h>
> >  #include <linux/tcp_metrics.h>
> >  #include <linux/vmalloc.h>
> >
> > @@ -94,6 +95,23 @@
> >
> >  static DEFINE_SPINLOCK(tcp_metrics_lock);
> >  static DEFINE_SEQLOCK(fastopen_seqlock);
> > +
> > +static siphash_aligned_key_t tcpm_hash_key __read_mostly;
> > +
> > +static u32 tcpm_addr_hash(const struct inetpeer_addr *a)
> > +{
> > +     net_get_random_once(&tcpm_hash_key, sizeof(tcpm_hash_key));
> > +
> > +     if (a->family =3D=3D AF_INET)
> > +             return siphash_2u32((__force u32)a->a4.addr, a->a4.vif,
>
> Isn't a->a4.vif always zero ?

Yes. tcp_metrics only builds its keys with inetpeer_set_addr_v4(),
which sets vif to 0. I carried it over from inetpeer's hash, where the
vif can be set.

I will hash the address alone with siphash_1u32() in v2.

Thanks for the review.

pw-bot: cr
