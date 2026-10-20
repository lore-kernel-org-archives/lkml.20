Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527584;
	b=ssovPeWFe2Hr638WZdnAWzQKf1KhIoTnU1EsjFltxcvselvjCJFgjmF6kT4eqVw1+s1Q
	 VYo1sTh3AHQTq63Z9gGNPzH5AGziSJAh65Al8/D2jA82CLxJcOw9XzQMweA6SwtrEe/UK
	 SNsvt/zZVOE7cXbyQAT9TokIblvll16Bp/r/h0lFdOEnPc/IrJzneg40KXYLaLJPTnxrF
	 yVmBcWiBrq8hnZydyR7O/G0QWCDNTDG6U/OOvxMT0maNIij6DqzONr0d79l+VnOo8tWZp
	 vwYDJl5F3s1kGPMz9sSgPfs3XtWGMifxW+vtbWSGkXfSxGK+HAt35StFzito4F0LiKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mSISClxN0AquiYKdkApngEQlUAzth9oYRTtKq3bxFPE=;
	b=xPjdJnewSqjArUknkCxs6CjzeMmAQC4oNGUokNZ/H5gqq3fxJgT25IRSQ0JHri1wAjH/
	 Zu7T9XeZfBUV4EwCE+lpTriOHd0AOGRE0iib/CFmbXUtpx9f0PmM+nA79WhpvxuNPIgl2
	 NDuxQaBj97Bxz3SBZLcxTG144/62mxAMTVhwnlhmoGbhL7HEqOlGq3qWTsSfWZ5Lyyd4P
	 KG+0T0GhK4M2Lh5jpJmO0i5f1YyPmNYcmJESzruY77J7aOkWOlkMBUvkNdA+uwVCcYFKm
	 Z9YcjheKMgHlRuDcip13aB6d4ryXTRCr2bzMy1ajPpLpmv7+l+EdWRvMFSC9B2+v/Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FfAkulI9;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F302606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F302606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FfAkulI9
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eac9db5905so966008e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792527582; x=1793132382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mSISClxN0AquiYKdkApngEQlUAzth9oYRTtKq3bxFPE=;
        b=FfAkulI9Bq9jgjuKbpc2WTxKrxx5qvuqmeib+YNWdNmtOnNCEb53aPjdhTqp8g/ypU
         bEATnZMrnnX9VXxhghW6c1iQjancMVRR+cbDqpZzhgisRRXw96qCnXr0cQ93InHBqn1h
         mWqkn9vB2+FbuU1J0vWLw7Zi73HtehU9Zby1eUbidAb4TXc0m7Z3uHgn+10K89TW9UEp
         Wq30omMyfxPtRXYMrM49K1jZOAKe3fzLxSzOBzsiNUYVU2+9D8BKlfDqnDSugiaInGSs
         7zVgoLliVBJOTQpvFoJ4HqYoLiPthGxdngPMJjLEkpApX1g0WITKKvPie6TgX2XxhPJA
         ckfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792527582; x=1793132382;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSISClxN0AquiYKdkApngEQlUAzth9oYRTtKq3bxFPE=;
        b=2XoVL9I9WOCIg51Qa2n5xyDe7GvVxHE0b9MXECNvT37YrsLxjuLw3DKWCclGOAd12K
         379NpmcodUHB6J7AkFgIMJbQawtNV4Gzoj7Vk3mAgIEBylxAfFAlnV/RNNce7xffxHs4
         mTssZdKbv5L4kvh2NaRnJc9CDuax7pUXGWOaZYWGXiLyCPrgHsWPwDYM+Gc/S3gropN5
         D0DFdVIOiYt8jZlgEAPRucA4qmdThDtyFyBkf+IhLyvdiNNkSGU8jn7oCnAtYun9zmzO
         OqknKBqjvPEjfkp6q/Szhz5brRki/VTtszpvJ3eH6JnsTfYRL31t77Sx7dOxyVDD54wE
         oZOQ==
X-Gm-Message-State: AFq9FYLuFj4v+Kxq8OwZ+yOPe1BvKPwMavREPhELpb+02AuWtqcXhfxh
	9XQ1T7f6Mz3hVvhOGyO+1SC9eIhTflT1UzhtQVWqpD++ykaPSd0NBVL4
X-Gm-Gg: AYBFou0cmISbMVWGzJ0oHG2XtOZBIcWS07fxjAVAOl4UOK30Yd/dn1hSzzYdgEhAZeM
	7NEdBdqPGUF7ONmH9nN859WdK1MCQX1Gn0uC6WlD12HGA5nlb4k8WV9a5X+BV/O9ZTVlCBOIIfc
	/BL6xLKc/qwWwjX+lY4kRZDdyl38Cx77+K9SSO0MjAvPztMD3EJQB0eY/COuAbfvkxQukGkuGQ3
	eD4m4RdpvKI6WBOu6kRb68U1E9uMlSk9o2sDtLA4/59tqinD82zJrl3nk0UpzrbALSr13GoK3GB
	45exavmQM19cnO/KMECegorUOBdzT28fO3N2lNAUb9I8VJMl3rXmM2K4ZNMsPjNmoqts+vrHBn0
	9rrhSdU6E+KZDWMi+JCSSP2mbWalIikKLdsyGk4ASuOqvJiG4c31FznG4VT3dflkKRQJHhjSrqB
	7OtrhueEfZ/TUE8BDrn6klmSqV4TDaKpzo0+8GDLf/90EH/Qan3nGizCSXFcWWVVuOOz5JimTwJ
	VewSy/wxB+U+RY6SGRnAaTj+jeTkkuzN2UtWDGqjExbXaOPuqZxpPqUSuA0PhJN5nHpMg0r9fCo
	RCcxFgV7AcM798fh6twFl6N32lrVT4WSSji4TQ==
X-Received: by 2002:ac5:c00e:0:20b0:5ea:389c:520b with SMTP id 71dfb90a1353d-5eaaa3a4e95mr3071748e0c.8.1792527581939;
        Tue, 20 Oct 2026 13:19:41 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae983efe8sm587906e0c.17.2026.10.20.13.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:19:41 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:19:41 -0400
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
Message-ID: <willemdebruijn.kernel.2c9decc16892@gmail.com>
In-Reply-To: <20261020155917-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <6f23c55c6eba3e3ec6b2c7e3a80728a326ed58af.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.187d58ff2bce5@gmail.com>
 <20261020155917-mutt-send-email-mst@kernel.org>
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
> On Tue, Oct 20, 2026 at 03:54:23PM -0400, Willem de Bruijn wrote:
> > Michael S. Tsirkin wrote:
> > > The ingress validation as implemented by the previous
> > > patch is stricter than what it replaced: GSO
> > > packets whose checksum metadata matches no transport header are
> > > dropped, and non-GSO ones get their checksum completed in place.
> > > Such packets used to pass with the metadata unvalidated,
> > > and with no overhead.
> > > 
> > > I judge that this should not affect any deployments, but there is still
> > > some risk that it does.  In case a deployment depends on them anyway,
> > > provide a per-netns switch to get the old behavior back:
> > > 
> > > echo 0 > /proc/sys/net/core/virtio_net_hdr_csum_check
> > > 
> > > The default is validating.
> > > 
> > > Assisted-by: LLM
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  Documentation/admin-guide/sysctl/net.rst | 19 ++++++++
> > >  include/linux/virtio_net.h               | 23 +++++++++
> > >  include/net/netns/core.h                 |  1 +
> > >  net/core/dev.c                           |  6 +++
> > >  net/core/net_namespace.c                 |  1 +
> > >  net/core/sysctl_net_core.c               | 60 ++++++++++++++++++++++++
> > >  6 files changed, 110 insertions(+)
> > > 
> > > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > > index e586e17fc7a5..b1a1c4714b22 100644
> > > --- a/Documentation/admin-guide/sysctl/net.rst
> > > +++ b/Documentation/admin-guide/sysctl/net.rst
> > > @@ -246,6 +246,25 @@ processes are dropped unless socket option SOF_TIMESTAMPING_OPT_TSONLY is set.
> > >  Default: 1 (on)
> > >  
> > >  
> > > +virtio_net_hdr_csum_check
> > > +-------------------------
> > 
> > virtio_net_hdr_validate? In case we do have to add more validation
> > later.
> 
> If you insist. My worry would be what if that validation is again
> user-visible somehow and we need to distinguish users who want
> to disable that future thing and users who want to disable
> just this current thing.
> 
> Hard to predict the future. But I will go with your intuition.

Thanks, but definitely feel free to ignore my suggestions.

My intuition would be to define as

0: off
1: everything one
2+: sadly needed fudge values because we keep having to tighten,
    but some crazy workloads need to opt-out to avoid breakage.

