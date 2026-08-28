Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0167348C66
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787902423; cv=pass; b=mxWdszYc+DwvBvkv9YO8CcRdNG9mRPuzSkr/R6Tc5EvxstboVz6WiFn7qE41ej+NHZQADj4EBt6TEdDRc31qS2+3R0gwnEcbdX/VTcLGc6Ge9Ig5VQnnoD9DYCD09Qmo/SfG1Y9ZPMLBhVdgWu9KNcmmLr38jR6mKMbga/yeHfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787902423; c=relaxed/simple;
	bh=YBA6hTBM2zJKMcOv5B6eXA7s0EUOJ3bOStZg17l1SVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pj9mbEJvK+YcSW8nl7geR6KLFNLQ0S570yKCU4augg/m3M9wq2gpWZJM/rwPO7wiYp+rmijqRp0Q9D5mIpIjM0xp3sxr94/1YD3jWhz5G/p4DAjA/ercytFsgZuoQ8qZCuOdf3sfKsdMqTIa3XRB4JE+gu0KralQePTUvpDbi3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rr98YIHm; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rr98YIHm"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-936e8bd9caaso58496385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787902419; cv=none;
        d=google.com; s=arc-20260327;
        b=hoBZoLjM0L1wdLGZHj6PAJZode5w4oOZRXcYGMiZb0gjUe0He+zMXrqN4hrXTIae4X
         Oaz1WxkpVBQgqMD1ZpRlXzwIIPNKE6fpU8i1zYdxKUebcKWqLXSVNvPDZnFwZ+lDjYU3
         OhedmHdvRKr7j0en6tWYvRjbth0qMYuH25smORik0UvVW5zeiHohsG5Xuai6cb99niP/
         RHz7h2erU93/O0kr92E6zr/qu3Wiek03oahRS9fK8iVkCEvgbhVI1Iob3sDECp2E5iCo
         7ixj75VQwUsQjC2bPQ3d0HR9WrlVzoq3yjXoL/7L/RJGkLJzkUXg8/BGWDZvhMfEaipa
         vcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MaXt8bgzgCbl3MVunftubpe4nSjxrU+2s/qgfZJp7gc=;
        fh=Sl9sIQv1Xebkup7JhPDGWEX8IGdlDL2MdChMsyHji4M=;
        b=j6o2w+x+7nzZerrMXwI8AGyRaDKp8z8rgx7MHqV9aOafloJ46HEhOIeP6V+B7FMao0
         u+m59YVSuMLdnxhz/DhwtkJou5/SwmZTZyI815MxpnCZkPX9YaN01U7HuyrF1ggmH26U
         HPT1nPDCTNmvmD9hv4Xf2w53SUPAvyYnignnvqDoFb3SPYLJ5tqZwbTs9eUnbvUMtXTE
         aoEkS9KtZv9PVeVoVKxCKUDEhoo5l5zL9XKEL5+m70aLFOtXhJ4nnAaoONE9I1a9DAeN
         ib8gsSC0SvZ1+s19I+1jRIxgv3v+8QS72Jw7pgInQe8uIPYbQopqw279OB7MV3bJMWXW
         H94g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787902419; x=1788507219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MaXt8bgzgCbl3MVunftubpe4nSjxrU+2s/qgfZJp7gc=;
        b=rr98YIHmIvdYQBvxdtfM9wI+6XhcIxjTJwNrT2UEnrL+6yn5X0RpVeXpCOx4RLhg5M
         TpEITtxitzrShxM/Z5Wte2gmkdXqDrkCIXEt/xgY7T5dh5L8YpNeVvVLi+e8HRlJqv6d
         RlJisXMOzueTLBkJKzCgCKBxVjLaIVOK8zEoH/UNAnqlHmMvQ/NQ3vWUO6wunNJrwo3d
         O2Qpsbu1Ae3gi1Q5XToXQCZyMnT0Jh0Ple4a+QubeOwgjnoxi5cq2lFmeboKgCWaSaWH
         JxO8HN4qKexPd1OVIjNE/3jaaHgNp/9JBuxOSWsvBrH//s2ve7ccm/Dct60jTv2vg+Rl
         W0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787902419; x=1788507219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MaXt8bgzgCbl3MVunftubpe4nSjxrU+2s/qgfZJp7gc=;
        b=LInAbtpR6VeXsjMT6/NnRJBs7xUTdHPkO9Xt9SbTOw76/sB+vaP0enUVugJZpfxsZw
         7oy7HLiIdIWgCb2v5ga/B2dXPFTFebsdH/lYbjCBSVFQvZ1Mh4Lf7QhBaQhRSHsRYS7n
         1h5CXwptGfqQQH1ZH7gnDvzJw8ulasKfaBaWmspWuDSS7HMGnAyxHhlgNNVfMVP7ftjA
         3oGIeOFgsEdoQHBgHkiQfWbi6flqj25UlYsKx2bQ9HmtEEOxFRERtuRcj38JcsgVxvWC
         K4DJHTdyk0RwuJ642/bZ+IpHWJmgkptEmLp9oBwv6CGDYKXQNUHe+wudwNML8bAuy92w
         NYEA==
X-Forwarded-Encrypted: i=1; AHgh+RpEap79Bjp0AIpAOsSOJ/Y/6tvRVJC1b5KdjHFz6d5EfEBGu3RiYu7erxHFJOWxj1wvmnn5Mh94rv/zIRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mAhLr+nevGXSwxSzxA2cf2vqNd0cy+I2/+3rRt1XDmpWUxs/40
	DJE5taKDCodZUjI5otPBXKRK15r5HLIM1XJnPRUnzOCxmTguIAcrAIEBpnCmjEAIQ5Flxm+SIgV
	iuQAaj/jnXPuxGj2YIQ7jQMzA8f7hDeRGpJxlsAXbKZnNd9Vq10/thjsuhtA=
X-Gm-Gg: AR+sD11ft27AXMiDperLbsLrLsTFmwd9zfw4nNMIbbUKJhKLhde+kJnjHxyMkavhNn8
	X3YTZYSMD45YbVJ/fhzjEy1wTMlsy9dWrrP91NaMaVtQFuLzWkpjhLOmx+OgMHV7JRYWaLLmAx7
	x1Zh7p8T+D0Mv3T3rF7sNdDcG0tkLZsGhpRoP5N9d0FYmWk4/iGYxK89oWSVJxNh3wLSNw03EMI
	Z4zxkOtMBnbFzws4DM54EpA8LwgkUcgvuUmr0Svuq3KWgRGsimG6jM897zEuvFYdA5SpGj/bOdH
	wwPUVv5e0oDPLlEbz7iNLToX5Zi8RaDvPjhCz7o9f9PSllXgpLv+I65d0B2fm5BQQZ9v0MpNUnv
	qj38t5teJr6c0yFrKheoIndsKI701krbbrQtvcZoO/c9BRT8U69/vnfqs5gs=
X-Received: by 2002:a05:620a:2852:b0:938:fd59:cf9c with SMTP id
 af79cd13be357-93913904373mr529822085a.24.1787902418813; Fri, 28 Aug 2026
 00:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787854085.git.zihanx@nebusec.ai> <a31c6fb1ab9846c85e245fcf34948ac2bc27e521.1787854085.git.zihanx@nebusec.ai>
In-Reply-To: <a31c6fb1ab9846c85e245fcf34948ac2bc27e521.1787854085.git.zihanx@nebusec.ai>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 28 Aug 2026 09:33:27 +0200
X-Gm-Features: AcwNN1Xwt8ZkRbVLESHeyULoFgOkxvi-Dh5BUkpOANwSgHRWFFlEenhIbtckd90
Message-ID: <CANn89i+1xLiL=nZOwoSH+OwX1+8io_Cd2_5b4s-_NcN+kBh+8A@mail.gmail.com>
Subject: Re: [PATCH net 1/1] ipmr: restore a limit for unresolved cache entries
To: Zihan Xi <zihanx@nebusec.ai>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, stable@vger.kernel.org, Vega <vega@nebusec.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 8:52=E2=80=AFAM Zihan Xi <zihanx@nebusec.ai> wrote:
>
> Unresolved multicast cache entries retain up to four received skbs while
> waiting for userspace to install an MFC route.  The cache entry count was
> tracked but no longer bounded, so a stream of distinct source and group
> pairs could retain packet memory until the system ran out of memory.
>
> Restore the unresolved-entry limit for both IPv4 and IPv6 multicast
> routing.  Reject new cache entries once the limit is reached while keepin=
g
> existing entries available for normal route resolution.
>
> Fixes: 0079ad8e8dc3 ("ipmr: remove hard code cache_resolve_queue_len limi=
t")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Assisted-by: Codex:gpt-5.4
> Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
> ---
>  include/linux/mroute_base.h | 3 +++
>  net/ipv4/ipmr.c             | 6 ++++++
>  net/ipv6/ip6mr.c            | 5 +++++
>  3 files changed, 14 insertions(+)
>
> diff --git a/include/linux/mroute_base.h b/include/linux/mroute_base.h
> index 4d55827e9705..af9247bb3f4d 100644
> --- a/include/linux/mroute_base.h
> +++ b/include/linux/mroute_base.h
> @@ -224,6 +224,9 @@ struct mr_table_ops {
>         void *cmparg_any;
>  };
>
> +/* Bound unresolved MFC entries and their queued skbs. */
> +#define MFC_UNRES_QUEUE_LEN_MAX        10

Wasn't this very very very small limit a reported problem in the past?

Nothing will prevent an OOM to happen, even if you set the limit to 1

If panic_on_oom is set, it seems to me that this is working as intended.

If we want to silence the OOM, just change ipmr_cache_alloc_unres()
to add a __GFP_NOWARN?
