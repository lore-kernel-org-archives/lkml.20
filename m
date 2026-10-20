Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792526477;
	b=j64SGDf+oP0sW0BLCLimJxX4qHDWdvE7OPPHSwYCe8YMIVdjoyl3J2sul84MSMTwLlDp
	 g+1hpquLsytGP+zMxtcfRfN8ZjghmF8Jd0VN5xRTBTAiaj2TmtRoCFN9FD/DlYe4C7KOz
	 LfRkL4qrZysQ7kXchue/rKNh9ULyxbu9f2krmH37GBHAdwiOEUGB69hnuOLlY9JBXJbVY
	 I1e5+odHx5bjJ/G9NAWktC+o5qpKTsN3MJH23uYmFt2Qp9JQZGnCzTMFf1D19fzdBn0h3
	 I/mWGwDmpQ75urCsaEqBfCXooC06v+aNKuCnSS9jxiGQbPLeM4+3Qieh7i43zWpHpxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792526477;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zI4sbiHutLhUzts3GNlZ8BZlCgpCPi+nYzjoB3+wLIE=;
	b=ryH74IUWxLl4MOEzJ00tCrkM8fqam9xwz9N3p5Auq/wwr1M5AjDusfTZwszm7Gr+TlQw
	 vITo2WkzEZV5Km60f8ohFV7CGlPKQMqw77iNChRvbtT6kdzh0JW3yzyJKH+OqlqSWiEm9
	 R8g/rwkiSLvC6QM5UOZeapztWqLKParut0+JNMCeHp5qHd2CFLtokrHv6YCGW7UWVmsw2
	 TWiDD5N7ZionOv4gEfXioRsgmbccHSr3Xo1k9rGf8sTj3HpLvl4+r6Fi5+Pfnkx80iaIg
	 v5vO0025AVB0CyrZ+U9uYvYTguwnw9k6Xk+OCkdrte8lUG90nsuTAxnWJIEK7eqcX5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E5VdsOPX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RxSvZcvo;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC23F606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC23F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E5VdsOPX;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RxSvZcvo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792526475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zI4sbiHutLhUzts3GNlZ8BZlCgpCPi+nYzjoB3+wLIE=;
	b=E5VdsOPXqa4xsqxi/sxSxdZgQoS6+fASz3elMJV4F0NE1tZnfU/C5wT1CjmIh61As2KirW
	e68ybuFvXA3WHVtH3bpqETZis6rQVadouIQs6o1l32Rj2XLLAHzxplgmTPqkqNfaP0w3+j
	ob4KXKPrRFezzCxmtb7dJwgwCWqCo9c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-QiBb8gKVPcSV2lf2E9tjrQ-1; Tue, 20 Oct 2026 16:01:14 -0400
X-MC-Unique: QiBb8gKVPcSV2lf2E9tjrQ-1
X-Mimecast-MFC-AGG-ID: QiBb8gKVPcSV2lf2E9tjrQ_1792526473
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49953abe51fso27717485e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792526473; x=1793131273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zI4sbiHutLhUzts3GNlZ8BZlCgpCPi+nYzjoB3+wLIE=;
        b=RxSvZcvo6lyk1Ci+d7Q/KJ19r5bvX39NJhNNsXMBrcK7mnCLaQJ08daYrsO48hN0Fs
         hWbEwVdhG30/LsEmE5uFmzdvi2OYfQhFxT3vxoLatZbIWhRSrSuPMvOJBDg+Q4AZBm8g
         IxN6/F/y3VMBL+q8kofMTUasIB5h4oAsNU8DzbkTCuNlDp6mwmpMow7NVKpiMDcMW1js
         +sUAyl7DyHH6cBfhLqHDBojwgOCsZ6k5rlU7Mblz6FNhsu48mpM6LcHFgV6GX6I/2YPv
         efqwno/aTCqFF93leqmSfRMfzzQ5S6ZSd+H1mETSpTE7fx5xJnGCogwEDmpLX3OOny5C
         JEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792526473; x=1793131273;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zI4sbiHutLhUzts3GNlZ8BZlCgpCPi+nYzjoB3+wLIE=;
        b=qO4zUg7Hwj75eMK1fe9akkG+NWhvXvPLway6Q8+U8ESIvOLHlD2ctW4mTQKmo+iwJ4
         +VDhCRbyaOU9pLfNDgAPxkvvP8hYFsIyChhwUaRdAesQjoPGm7RnZHn2eSglAAeGMEWZ
         FSnvRlSyWgDHO+/pcHoxGaNXESVLhfIttJepcoKVaEo4+QKiIChz27nHY+xUdWaArSTS
         STWDKqG18dOgMty5K3SSMBtDXgjoY+2M63aO7CBfSjHtw6pHgZmE1Svb1sCL3ki64mjG
         oymLoQb7A1puUizv/wPbpddu5Q/KcVzdr6IWuUtjN6Ql8UAHml7qfYR9XjIvhrHRTw7E
         amUw==
X-Gm-Message-State: AFq9FYIxje17NMV/G7ALswaPWPZcNZ7sBWkIe4JVhvFDWzX30fK7H2+h
	QKhvTvBe/NhDVaUM/W7ZIuAIjUokzfRy6uDu+STVVgOqapyRI4cvJj3TRZwmzDS3bJN3v7RDvTd
	oKfFEBcEPIkRFzz190GwR3nQepfKBaxnwueLW7GD53z+b68v+lMDlU/02SwZwbwG/kQ==
X-Gm-Gg: AYBFou0BYlbfqXSFX7EHwzcR+071iqOT3RxlID06pm1J7kH5DC4jL45CqBbJgE3JIgG
	SUBDpfdP1XPaQJ2SVHHp3oqSzvmFu3Jkia4nOcakbBSJ+xLfnsZC2l2XdryMAx6G0KX2B0Gjb/z
	09QbSIOCSYQTqr3E0lA6BZ3uSK04b0gCD8cVAgfMbLc18of01jB5k2ExahLLYzvez1BuEb0FWDV
	PLs72CzmbxBQpaVQrrZluLBnsYvnUa18AFk27oKPOFB5F3Wu13s1wZ3JEAaoShmGHI/pK25cw2m
	PH3KmpvUCB0ZrBXX3/xlx2lyMCCbkKKaGbR1a0ZHSNCkmv4c/ZS4jKaUvuJXZRg56xqyBA==
X-Received: by 2002:a05:600c:8010:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4a1fbf8577emr14172725e9.33.1792526472942;
        Tue, 20 Oct 2026 13:01:12 -0700 (PDT)
X-Received: by 2002:a05:600c:8010:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4a1fbf8577emr14172305e9.33.1792526472489;
        Tue, 20 Oct 2026 13:01:12 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb96bc7dsm22498245e9.15.2026.10.20.13.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:01:11 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:01:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, Chris Arges <carges@cloudflare.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH net v3 6/8] net: add a sysctl to opt out of virtio net
 hdr checksum validation
Message-ID: <20261020155917-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <6f23c55c6eba3e3ec6b2c7e3a80728a326ed58af.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.187d58ff2bce5@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.187d58ff2bce5@gmail.com>

On Tue, Oct 20, 2026 at 03:54:23PM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > The ingress validation as implemented by the previous
> > patch is stricter than what it replaced: GSO
> > packets whose checksum metadata matches no transport header are
> > dropped, and non-GSO ones get their checksum completed in place.
> > Such packets used to pass with the metadata unvalidated,
> > and with no overhead.
> > 
> > I judge that this should not affect any deployments, but there is still
> > some risk that it does.  In case a deployment depends on them anyway,
> > provide a per-netns switch to get the old behavior back:
> > 
> > echo 0 > /proc/sys/net/core/virtio_net_hdr_csum_check
> > 
> > The default is validating.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  Documentation/admin-guide/sysctl/net.rst | 19 ++++++++
> >  include/linux/virtio_net.h               | 23 +++++++++
> >  include/net/netns/core.h                 |  1 +
> >  net/core/dev.c                           |  6 +++
> >  net/core/net_namespace.c                 |  1 +
> >  net/core/sysctl_net_core.c               | 60 ++++++++++++++++++++++++
> >  6 files changed, 110 insertions(+)
> > 
> > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > index e586e17fc7a5..b1a1c4714b22 100644
> > --- a/Documentation/admin-guide/sysctl/net.rst
> > +++ b/Documentation/admin-guide/sysctl/net.rst
> > @@ -246,6 +246,25 @@ processes are dropped unless socket option SOF_TIMESTAMPING_OPT_TSONLY is set.
> >  Default: 1 (on)
> >  
> >  
> > +virtio_net_hdr_csum_check
> > +-------------------------
> 
> virtio_net_hdr_validate? In case we do have to add more validation
> later.

If you insist. My worry would be what if that validation is again
user-visible somehow and we need to distinguish users who want
to disable that future thing and users who want to disable
just this current thing.

Hard to predict the future. But I will go with your intuition.

Will check the rest.

