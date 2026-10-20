Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792537980;
	b=L/m2cVkkyDj8Qv6PansqFP9NKtey/UA4KkssUAKbLugv40OqrFS8qBEnRYoqAYLgugHm
	 TYtL3Jq0eS+/+Z52V2Jpvyzwd31ZpPGxMq/6aInbVKuJegMfAuMlpnIGSB9m4TLIancIZ
	 xbD6M+Zje8FyFzKwEUuv755d4ruEwtXxI2bvWKHdcQXwHUcQEXPPAEPE+Atnpkirq5QbY
	 B03c2C7IPZgBfZRL4UbDUTkI3XKwflwIyPwdoyAm2AYNrZoLg6WmmpiL3N6Qf7nQAih6H
	 y0/DC8VLONdiOSkIRfkCCQVbdAERBAqMWtjl19elHXrBcKfLxRhsyFOf4w7vbKz6XZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=V4dEpVJ6+z1cOz8lzxIgY22zi/dH+CU6Y8aHuWhhhWA=;
	b=favlX32/fSPrhxxxt2xNoc/lEyY1YYJMvwjTfEDVynMendvpzit78TXTA4ATC9rzo2xu
	 cdef7C0jId/+BAgeAMWRCeclBRe20cDsGhCxkj+YaPRJ9mQSB162iL0AUGfHFQkaKemaV
	 lcCWa5lrYvDWoJgpa+F3jLTUSFgAgoc6BzIxlh+Rp9E32pTkuTULbOCzNqBBG90d1khLe
	 kPd7rFJfPZt4ePLCy3/D4klQ7fxyktkIOCn3KIGGjlN11imoHrJDafJnxaC7p+2+N5nTz
	 eSPvMBHh287i6hiXLP74W+3yWV8ozILwqg79vaSYdLnYjcmUKwgOKL94r65QBw830Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Bff/zOrQ";
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59945606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59945606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bff/zOrQ
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc2bb73cd9so47815137.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792537979; x=1793142779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V4dEpVJ6+z1cOz8lzxIgY22zi/dH+CU6Y8aHuWhhhWA=;
        b=Bff/zOrQS58D8lWXqbV5dgpvEkhMpH+A+e56BI4NZxfEzq1YHbf1gpbKVbSvCRUk2u
         PZ93UxEymZJRDkSwSxJH8vl4sCT44pwR5XyFRCpa6iUm4G60dyJi2m6wJvoutjeYgApC
         1hMF5ffNK2zBSavYm0J8dFI+9wDpqFWfMhBZLkBePQuHeRC4DlrbNCDvSJnmHSEzV1yz
         F0hDmgJ7I/Fus9OhFHtI9ItSQueyGrEwc9fydxPQKw3A3z5UzFEEKoFo/h2Z0Yf6ISc+
         wOCGVPS7mpH3kXX7QGtqwe8IL+5DyZcEXP1DokQPO5Dzty/rqLxL6HwMtbEFm3mxSpav
         Miww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792537979; x=1793142779;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4dEpVJ6+z1cOz8lzxIgY22zi/dH+CU6Y8aHuWhhhWA=;
        b=VmhuwgEkqyE1kj9alu/6NepuV1+Qx/n8COYrKwKiyzBRhTRBU09OZ6+KyKinqhfAq0
         709c3yWdvOdWM7Yulh3O5dPIm6+n+Hg703if9zBGM73IjpOkczZx9OiAVudpyleqUysF
         MJc93lXETLvFAk7PqFqLBVwU3iDOrdJWXr2+IOJ539flsdE6ysPh7/PQZsU6JnQwgkzi
         YDFi2J6kgxxtjVveUqTzCaTbd3pvUehr3NcpfIeb+12VFoBR2kjPOFBnnJYnlMXzkKIN
         rTo2t2LUZqzGHHe6CyihgVkW3YoZ6EUHoV7EQ6xEw79sd+UFA3FH1tR3mlfmby6Nwakf
         BZzw==
X-Gm-Message-State: AFq9FYK16c6etSMilXVzLs1Xwy5v0Qg/XK+/1Jncj7sWbC4JXntp6cKM
	k9vd0nAa2Dv1btyBR6WjOA1wxHvrpf8vyGf0uQB6za6l2ZcuJLY2bvCx
X-Gm-Gg: AYBFou3fK2+AxANEtHcrklYX+0yCy6VYs6ZZJEbIiKKkP7s55EiAyO4zorNRLY6qgXf
	zg1uawVCceuE77VTsyaWRIempKfw9tRJ1vZe6+gWPtOTJq4cHClp/zu6cZze34aLitiGMuPc8rW
	wi+t+vJ9EijMZQqYj7MaXwOROZWjPPy/JcHVWm/Ky++vOALoYFfBDv0gs0UNDzSEy54zGwGZMyN
	vPHo6sCcnzpVPNid1pPpm6mDMQlOne/ogHIPT4WDIKjasfzff13TNO8oZH1PmMavLDFd499FmWE
	ONFL6qopJgFzvIClnhN0J0s2WLSNDDBfPBlAVFV/zBBvam28CWB9iZe42CD8p39wPrKOc09A06U
	Wylku9icXsHrZrjkXTmckwkToUSvf8o/g9MxI0FDH/y/e3RkCHmZLGBbdxvnIGJQURIx/Jy45YB
	Mz8bMq46FyPxfb7JwogtGE4maAKRwvIS25AsE7Mp8ihr9aPhNBREyST2Ld22YRbU44cqxJ8VgRz
	bj5fNSdAzlqs/99MtVIJo9D/FTRJiUKCXTsCVZ9k3xKFGpBikzp2YbxM+M/Taox/LmqrxtjTanx
	1EpP/sShBiWAoYGpfxtrcpvulCv8TqxpVDRuvg==
X-Received: by 2002:a05:6102:a145:b0:7cc:95ed:3147 with SMTP id ada2fe7eead31-7cc95edaf07mr37812137.34.1792537978890;
        Tue, 20 Oct 2026 16:12:58 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d108ff73sm1235667241.7.2026.10.20.16.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:12:58 -0700 (PDT)
Date: Tue, 20 Oct 2026 19:12:57 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
 Chris Arges <carges@cloudflare.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Phil Sutter <phil@nwl.cc>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Simon Horman <horms@kernel.org>, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.2eabbddbe6528@gmail.com>
In-Reply-To: <20261020162048-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <6f23c55c6eba3e3ec6b2c7e3a80728a326ed58af.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.187d58ff2bce5@gmail.com>
 <20261020155917-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.2c9decc16892@gmail.com>
 <20261020162048-mutt-send-email-mst@kernel.org>
Subject: Re: [PATCH net v3 6/8] net: add a sysctl to opt out of virtio net hdr
 checksum validation
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Michael S. Tsirkin wrote:
> On Tue, Oct 20, 2026 at 04:19:41PM -0400, Willem de Bruijn wrote:
> > Michael S. Tsirkin wrote:
> > > On Tue, Oct 20, 2026 at 03:54:23PM -0400, Willem de Bruijn wrote:
> > > > Michael S. Tsirkin wrote:
> > > > > The ingress validation as implemented by the previous
> > > > > patch is stricter than what it replaced: GSO
> > > > > packets whose checksum metadata matches no transport header are
> > > > > dropped, and non-GSO ones get their checksum completed in place.
> > > > > Such packets used to pass with the metadata unvalidated,
> > > > > and with no overhead.
> > > > > 
> > > > > I judge that this should not affect any deployments, but there is still
> > > > > some risk that it does.  In case a deployment depends on them anyway,
> > > > > provide a per-netns switch to get the old behavior back:
> > > > > 
> > > > > echo 0 > /proc/sys/net/core/virtio_net_hdr_csum_check
> > > > > 
> > > > > The default is validating.
> > > > > 
> > > > > Assisted-by: LLM
> > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > ---
> > > > >  Documentation/admin-guide/sysctl/net.rst | 19 ++++++++
> > > > >  include/linux/virtio_net.h               | 23 +++++++++
> > > > >  include/net/netns/core.h                 |  1 +
> > > > >  net/core/dev.c                           |  6 +++
> > > > >  net/core/net_namespace.c                 |  1 +
> > > > >  net/core/sysctl_net_core.c               | 60 ++++++++++++++++++++++++
> > > > >  6 files changed, 110 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > > > > index e586e17fc7a5..b1a1c4714b22 100644
> > > > > --- a/Documentation/admin-guide/sysctl/net.rst
> > > > > +++ b/Documentation/admin-guide/sysctl/net.rst
> > > > > @@ -246,6 +246,25 @@ processes are dropped unless socket option SOF_TIMESTAMPING_OPT_TSONLY is set.
> > > > >  Default: 1 (on)
> > > > >  
> > > > >  
> > > > > +virtio_net_hdr_csum_check
> > > > > +-------------------------
> > > > 
> > > > virtio_net_hdr_validate? In case we do have to add more validation
> > > > later.
> > > 
> > > If you insist. My worry would be what if that validation is again
> > > user-visible somehow and we need to distinguish users who want
> > > to disable that future thing and users who want to disable
> > > just this current thing.
> > > 
> > > Hard to predict the future. But I will go with your intuition.
> > 
> > Thanks, but definitely feel free to ignore my suggestions.
> > 
> > My intuition would be to define as
> > 
> > 0: off
> > 1: everything one
> > 2+: sadly needed fudge values because we keep having to tighten,
> >     but some crazy workloads need to opt-out to avoid breakage.
> 
> yes you said i just do not get how it will work for userspace,
> maybe u can explain?
> 
> and what specifically is needed right now, while we
> just have 1.

Right now the sysctl is boolean.

If we define it as a narrow, very precisely defined sysctl, then its
exact behavior is set in stone.

If we then add additional validation later, that can similarly have
unintended breakage of weird users, we need to add another sysctl.

And if that validation is not entirely independent, i.e., builds on
this, you get a weird set of interdependent sysctls.

While in general systems will run with all validation enabled, unless
they do something weird that gets hit by validation.

A single broadly defined sysctl ("validate input at the source") can
be refined over time, including to expand to validation of other
virtio_net_hdr fields or protocol combinations.

Even if defining it more broadly we can still leave it a boolean:
all validation on or off.

Or, optionally, we can also define additional validation levels,
e.g, 0:off, 1:everything-on, 2:validate-csum-only.




