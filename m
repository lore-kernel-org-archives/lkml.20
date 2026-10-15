Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2B252ED5D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092110; cv=none; b=iXPNerG0C2YBgMcSE9TjIX/W6Q/sJmcfqPYusuYbexcx9xxVbvjSVlcPQoyKasjFu7WyNo5e4mgzWvAWsTNL5dLKV2b3Zm4M5BwR+5llirugUpTqTEpiGy+Ahmglhm756I4wwq6Z+oJQufxg0CyjEFVlMFCY0cg5taNRRTIaRZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092110; c=relaxed/simple;
	bh=bWDcTUXKRCpKArq8mJguYgOf7WaUeTmsb/woHD2+h/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T57utGqyw3/8B6LKDAqf3EFsbo3jYUf53/17DE0q/xWZACWw7DeLQaCvK4fRF1ploRhVMErBbXkRpG1KN6txihubsDthuRpFXNs/H+kcw8gSLUpHe3CEfzr1+8yF+jtZL1ZXaF7rc9sDip98kgL/Pfxy02OaO4ZfhtWy5vkk/w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=R976MYoS; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="R976MYoS"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-82478760557so1798589a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1792092106; x=1792696906; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rbjX2NuExPWvz07RGXa2HRp0BDpTUBaueEzzQnIB3cM=;
        b=R976MYoSBsU2ZTHb/0FFqHIkzzltEoEbRYGElE615llxI5BXRJ5t6mznkTKQk2POVx
         VXnYCPmdg9vGs4U9x+QhOZWhNYw+FnYsiRMD0THqHRyDI6TrXrXWOFF7gjSsBaCnPjMg
         ABFHB3clEbkKfg2kiHoYKZs9OoVeGMks7rx8WT75qPK2AyEx4L/wBZ8X+SVxcfncsZVv
         ffQRqJpU035r+/TKFCZxa5ugZ4RR0CzUdu8wamZn/TpkoQ08HIcvRiNlH3+7y1Oe28UN
         tLSq/2wyZRarvnyy4/Yzk+IxkR+V7mN/IAhOsgK93g1mECf6fVqn0HCXPtVkIbf3d7Wu
         IuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092106; x=1792696906;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rbjX2NuExPWvz07RGXa2HRp0BDpTUBaueEzzQnIB3cM=;
        b=mjPh6urwE1MwH9o5ubyaB4ZONEnfrZ+xHcafEC6slnYgUCOZZDwLlNpsmLEhZfrOMT
         TYKGT9kNjrLkU1e1IbkqR5B65NWdA9uhXo0iOD4jmnUqW+5Z0rBcxy14xmSrKghmG3NB
         DTj/d3jLvy5LIlbLmgQMJmg6y1BmI/ZjHwCvSg1Qt2qAkG3JkUPadBW6l+ZZUjwCNJ1G
         ztu4cre8mJQvNIDmaChwrgTp39toxRv+ZQxLigfwywEH7GZc31OP7LeC2iSZWgfBRPdm
         Oyef13JuNJ0Uls9diIVTiRP/A9KabP3eKE5nJc8GE6hIpPxMsc/17gOnOhizLgQtUDkk
         9OTw==
X-Gm-Message-State: AFq9FYIxXIDM5GQADNS11SfwBWRbcdbMCyRsMTTtvhhzI5LQEgVr2U9R
	chYCccUTenWbJPfxAnvT7arMjgxiLlQA8Y+h1NqyNnq2l+OvD9Mi5vbuR0Lt4RWys24=
X-Gm-Gg: AYBFou0UnAksI2G0lNXSysR+02yVfrFdzZ4NsfUAUgJZ//3LPQaR2CH2YHX4S9Ed7hj
	WAKK4CIt7g019QMmhE4xfUMEQtO0K9zqRC87/q2C/UeuwYKtJUCYnho36kqaD2rLBlLoBFZXx+q
	rI5e4lH7N6V1Gbrzg0VlFAP8Vnz3p7GnEAsNx3XDPUFP5smGkwVDHCFo5xPORfuqXIN8BiVGEbT
	CdoLFLC8tCLwNM4bqC3Na8ffwhbITbitJ3P6/8lMv5PbX/Pc+e/uWepOsDDL/0rjKnWlCML7Iyy
	FmyzD7eAj5GD9HkFCo6EcY7kuc52HTz5V0XEG2ndVcMPqPXFWUKKxQhDwH6HrFWtBQfyvSGcEjY
	JsNKs8hgYLvdsXuzJ8biLDtRyVBhDX55534RvmGidd0IqgpOPr4IJkG1gvOv5SrnJPSXJBUNIsX
	uhxtVzWKqVHcBJSIePcHkIjbg3uoVI1GPkDp3QYb4oSHHxAxSdAO4tWg==
X-Received: by 2002:a05:6808:3204:b0:4d6:9153:2962 with SMTP id 5614622812f47-50c58bd58abmr17672455b6e.51.1792092106515;
        Thu, 15 Oct 2026 12:21:46 -0700 (PDT)
Received: from 20HS2G4 ([2a09:bac6:bf21:3737::580:5a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-537b247b19asm295516b6e.3.2026.10.15.12.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:21:45 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:21:40 -0500
From: Chris Arges <carges@cloudflare.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>
Subject: Re: [PATCH net-next v2 0/7] more virtio-net csum hardening
Message-ID: <atEnxBYUQNkjUXfA@20HS2G4>
References: <cover.1792067836.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1792067836.git.mst@redhat.com>

On 2026-10-15 08:41:12, Michael S. Tsirkin wrote:
> 
> As reported first by Paulos Yibelo <habte.yibelo@gmail.com> (after which
> others, credited below, found more ways the bug can affect users):
> 
> allowing untrusted hardware to specify csum start/offset for
> CHECKSUM_PARTIAL was not a good idea, because, if it edits the packet
> outside the actual checksum, and depending on the setup, the networking
> stack could be looking at the packet both before and after the edit, and
> seeing different results.
> 
> Previously, commit 6785011f8b16 ("ipv4: validate checksum_start before
> completing checksum") validated all known instances where this
> causes the most grief, but the real fix is to make sure
> that either only actual checksum fields are ever edited,
> or the checksum is completed before the net stack looks at it,
> so it is always consistent.
> 
> 
> This basically goes back to
> what we did before f43798c27684 ("tun: Allow GSO using virtio_net_hdr"),
> except in a narrow list of specified known good cases.
> 
> 
> Summary of the patchset:
>   net: account for ingress-resolved virtio net hdr state
> 	- accounting, not the fix itself, dependency of the next one
>   net: resolve uncommon partial checksums at ingress
> 	- fix itself
>   net: add a sysctl to opt out of virtio net hdr checksum validation
> 	- reducing risk of the fix by adding a sysctl to disable it
>   net: add ip4_parse()
>   virtio_net: cleanup protocol calculation
> 	- cleanup resulting code duplication
> 	 (kept separate to simplify backporting)
> 
> Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> 
> Changes since v1:
> 	- reorder patches to fix bisectability, addressing
> 	  a comment by Björn Töpel.
> 	- code refactoring, different patch splitup,
> 	  a sysctl knob to disable as suggested by Willem de Bruijn.
> 	- fix a bunch of minor issues spotted by LLMs
> 
> 
> Michael S. Tsirkin (7):
>   net: account for ingress-resolved virtio net hdr state
>   um: vector: honor virtio net hdr conversion failures
>   um: vector: trim skbs before verifying the header
>   net: resolve uncommon partial checksums at ingress
>   net: add a sysctl to opt out of virtio net hdr checksum validation
>   net: add ip4_parse()
>   virtio_net: cleanup protocol calculation
> 
>  Documentation/admin-guide/sysctl/net.rst |  15 ++
>  arch/um/drivers/vector_kern.c            |   6 +-
>  arch/um/drivers/vector_transports.c      |   4 +-
>  drivers/net/tap.c                        |   4 +-
>  drivers/net/tun.c                        |  41 +++-
>  drivers/net/virtio_net.c                 |   2 +-
>  include/linux/ip.h                       |  24 +++
>  include/linux/virtio_net.h               | 249 ++++++++++++++++++++++-
>  include/net/netns/core.h                 |   1 +
>  net/bridge/br_netfilter_hooks.c          |  15 +-
>  net/core/dev.c                           |   6 +
>  net/core/net_namespace.c                 |   1 +
>  net/core/sysctl_net_core.c               |  54 +++++
>  net/ipv4/ip_input.c                      |  13 +-
>  net/ipv4/netfilter/nf_reject_ipv4.c      |  13 +-
>  net/packet/af_packet.c                   |   4 +-
>  16 files changed, 404 insertions(+), 48 deletions(-)
> 
> -- 
> MST
>

Aside from the KASAN issue described in the other thread, I was able to
test this series and it fixes my local testcases.

Tested-by: Chris Arges <carges@cloudflare.com>
