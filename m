Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268567;
	b=s/+CMhkgVzZUjQvg/q4vU+osC6ZWMI5TRjaPac9GzhWWi7bFWz25JlkO28+3otZCBz4s
	 Z3PoiVPVouzpm4UP2a7j1qA6n/xvOXJ5QVXP4b9Gj3WG/8DiudnY6ZE1RKouchgF+IZWx
	 EtWwXIl7JYURt1C4roUhZO42/4jwTSP/6DqeBjkapnbMuSgl/XiplTOAvBne3tRsv9LhP
	 OV6uYZsSuTsE6MunEzXqBJw893g1qnKNV9WX0wlgnueQ1e4pXj4p58KLJ3Zf2w0xF9nvX
	 glqxWYG8HWITmxatoSaWsjhVbDFJYY9ckwT6Qq9mloyODtS+6+CUgY5LK/Gn3kMzr+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:From:To:Cc:Subject:References:In-Reply-To;
	bh=nlqOFSAQ9H7dnLsW36/WDhDu5EY2v33GDHCwxLLecp0=;
	b=ZdHMxkpoLTjiKdU+Th+Kj6DHqzsSJT4f6w7IzH6qlLYy6OyfNdK6QL8VxRQES12+RTbZ
	 lySTq3Y3XzN2PThJjjdlugaa6/NDfwER7qgr1l9ZuJL0oLU5NithRXfZ2kVgsLQrrcf2z
	 sczjsJnTsARXCEJBIsGXxVKdzjQk0/Wa5AuJKMmcsSnhDIxzzZkr1C6AtGawZ60EeM9yn
	 wsNZxkpL0Bfmwu3kUuQw2Q7RgKF/W2Q6Fwdw/1OLNrO5ypPU82MJFTdYQ41IoU36kMyHh
	 ixrrDLJJDZ/62h2/qKASta1ff9W7tlHGQKnBTidnh7do7Ukiexg7+fpR96+/gJQLwoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=Qz1X22J3;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3DD606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA3DD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=Qz1X22J3
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91e7fc8265aso18167526d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1794268565; x=1794873365; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlqOFSAQ9H7dnLsW36/WDhDu5EY2v33GDHCwxLLecp0=;
        b=Qz1X22J308Z0pwN4ph/SpbaqCDLhrYfm2/s985T7MYAxMwFI6+WtTal8ogRpJXmDZc
         YizbP4AaoI7JqwqSum0kIuNYtmrj9bYTw2Z4ZqOUJEMWH8IxZPx8V600M1H4wTQzMG0n
         dBeqV+zBkY9z6aFUUiYf4j/EHTQUhnR4vW9XpyU5tFEPwjOYWSVYr5d9zhk8GaHU04IN
         kagJuSxM6qk+XMD87K/Pfrwb+4tZHOEClPvbMnUi+Tx1OoA3pYl5nNvkBfepcZArxHiz
         yYOoFFVg1IqBYd+IJerZXSrI8KZgtwv9AVnQbWhlmi/VwLbWbKLyLAtQSSaws5TqG/zS
         p2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268565; x=1794873365;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlqOFSAQ9H7dnLsW36/WDhDu5EY2v33GDHCwxLLecp0=;
        b=IWKq1O8hGbUBpNTniXJWmQIWoInjInSKzYljhyw5CW8D64DkcWAVkhT7H6NaNDUzxt
         94PhF0zCQo4nKOdt+Npqi6zLV8m4KFKUMWKPXJyRK+vGeAca/sOT3DCBieyT7o0Zp/r0
         2EXLW5Hg01GCYF9xfhR3n8BkCNB0u+jgmltz67qUBlW7MaNaXprYbTEwUjM/MwOeoi5A
         nLPxfd5zgk2SlbX3sQsSCBO3z0sKw7ZGn2oHl+jO65/xRgMoAgNt6CPi3SKXQ5pki6yA
         XTMVakubjslWF1JZRQ0e8dxK2O41OF2QtbXx3+fzLLEAnz4sl0RTLNim2l1VxybW+tkw
         oBrQ==
X-Forwarded-Encrypted: i=1; AL+hErHSBDE5lvF8mrtqhsN6nvtIGVzTpbAXJEkGJhhPZokWVxHkmqfbX9qv+1uh72/KafljdU/RqPlWUOlCPJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qwnqsO7JdxWbBJ3TUWK8MVlNW/ti/KXELqeQaGlZ1YZR/WGPA
	3da8H0y9mghFczdjQ7EjvJT3VC0NzrhPvgF/dpFTVN5GB0n2FqFDnS7AMoPXYAEsDQ==
X-Gm-Gg: AYBFou3Mx+TqK8UhTyOLSkszg34BHXy11dQjBCUssZrAjco1x1OSaJ9OXIWP8NFvfrD
	kZyeZ8x7YPggCXe1d/r0rGK9OfzLg4ut2pKu/NUbvTVhTG42RMHOFqOuqKRJEGYokTsDrEkfotC
	5+4YImBnOx/PIhEagLHv6TkkP7rSIKMqeoKnIjFWTZqGy7cPpVNoyQW6CkYBD2jJ6LqgHkuZZE2
	3IDe12DzKhCwokiCtCPz7yUX2ui8drhkcK5Lpa67oS60nfMM/MdTI/qnzAz/kci/H+qBFuYEi8V
	2bh0xhc+nPmD9xT343HVnhYY7MBkGDc30pAY+UxRVxHsDtGR6EgQf9JES5dFsPeDrNnDNsItwkJ
	N4BPSKNVVEsGRzbeDLuMclpYyA909bkwt+MMf0cDV2EeejkcqdhfyofJeuH3tJCf5rReSm+ZOP6
	Ko3EZJ+dAjziG/tXqLc8JTxWjY0WnjZLbvtTjUnFIFPuRmx9SZ0LJhRf+4x7jQIgouL4hvm9LvN
	rTyrQKXdUA2HCF50EPkpklPxj7PNVolsECrdl5jDhwbxTqSumvassz39epawBdX0nV/V/22Csuu
	7I97GD8L8C5lwFhy3w9JFRUnfDYIyde/goq99gN6ICIPn0ixi8Ik3teTZbOPmQI/cWLKFahkDDL
	C/ZBpBipvCLVDAnUNoIgomt2l7MkkdwQ=
X-Received: by 2002:a05:6214:54c8:b0:91b:5d39:e13c with SMTP id 6a1803df08f44-91eef8650e9mr21004816d6.49.1794268565495;
        Mon, 09 Nov 2026 15:56:05 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04ae351sm7869386d6.12.2026.11.09.15.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:56:04 -0800 (PST)
Date: Mon, 09 Nov 2026 18:56:04 -0500
Message-ID: <a8542108f56e8cac5c6e65977ee01ffd@paul-moore.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20261109_1829/pstg-lib:20261109_1442/pstg-pwork:20261109_1829
From: Paul Moore <paul@paul-moore.com>
To: Joas Antonio dos Santos <joasantonio108@gmail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Ondrej Mosnacek <omosnacek@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, selinux@vger.kernel.org, linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selinux: don't label bridged packets in  selinux_ip_forward()
References: <179216146138.25460.7866279004288174372@gmail.com>
In-Reply-To: <179216146138.25460.7866279004288174372@gmail.com>

On Oct 16, 2026 Joas Antonio dos Santos <joasantonio108@gmail.com> wrote:
> 
> With br_netfilter and bridge-nf-call-ip{,6}tables enabled, bridged IP
> packets go through the NF_INET_FORWARD hook, where selinux_ip_forward()
> calls selinux_netlbl_skbuff_setsid() and NetLabel may add or remove a
> CIPSO or CALIPSO option.  cipso_v4_skbuff_setattr(),
> calipso_skbuff_setattr() and calipso_skbuff_delattr() move the IP
> header and reset the network header, but the Ethernet header stays
> where it was; when the bridge pushes it back in front of the packet it
> picks up stale bytes and the frame goes out with a garbage destination
> MAC and EtherType.
> 
> Labeling a bridged packet based on its IP addresses is not what we want
> here anyway, so leave bridged packets alone.  Add a stub of
> nf_bridge_info_exists() for CONFIG_BRIDGE_NETFILTER=n.
> 
> Tested with QEMU, two veths enslaved to a bridge with br_netfilter in
> the middle, SELinux and a NetLabel DOI 16 configuration, 5 UDP packets
> per case:
> 
>   case                                        before        after
>   CALIPSO packet, unlabeled destination       MAC garbage   5/5
>   unlabeled IPv6, CALIPSO destination         MAC garbage   5/5
>   unlabeled IPv4, CIPSO destination           MAC garbage   5/5
> 
> Routed packets are still labeled (an unlabeled packet forwarded towards
> a CALIPSO destination gets the option, 5/5).
> 
> Fixes: 948bf85c1bc9 ("netlabel: Add functionality to set the security attributes of a packet")
> Link: https://lore.kernel.org/netdev/CAHC9VhS+bdL_YnLQtd0sPmKKfy9BvS-LWV_6EhAuu4qfUFe_mw@mail.gmail.com/
> Suggested-by: Paul Moore <paul@paul-moore.com>
> Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
> Assisted-by: Claude:claude-opus-5-5
> Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> ---
>  include/linux/netfilter_bridge.h |  5 +++++
>  security/selinux/hooks.c         | 13 ++++++++-----
>  2 files changed, 13 insertions(+), 5 deletions(-)

This looks good to me, thanks for all the work you put into this!  It's
been several weeks with no objections from the netdev folks about the
nf_bridge_info_exists() dummy function so I'm going to assume they are
okay with that; if that's not the case, please speak up soon :)

Merged into selinux/dev.

--
paul-moore.com
