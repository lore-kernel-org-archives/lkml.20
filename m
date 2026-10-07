Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD24DD3BE
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396814; cv=pass; b=QoVlsUEbB6eAkq0cllEP6sss9IHMPn4PgCITmciy89vy6j/68fXHQy7OZpBcd3qxl9+fl2yXcGC+Pp6p/i8WPJecwYmreswy2Jk/b/T4jIKTFmjnm+EB89kAsTEdcrJMTf7sDR6iE3P2r8qSphTbtY31x99eHhsOV1gyQsNe6Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396814; c=relaxed/simple;
	bh=0wykPVPExtMfhxKcAfrp0hErspx+nh4RqrQTL2Nlv20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XO+SDeQo30uUCLwnNWx1FoJqu2lpl1qV+48OwPKU8MKapHYFxHLdBugn7HacPm1GwK0exvC/la2kgo4z4akE0R27V/t0d1xmrrm118rcGA8kAZgRQ/8TgIpCP+RBv8/0cdb+x0Y313dqBd+l87iqF6ER4YmCh62Dqq+s2hXoQX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qI63g4X0; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qI63g4X0"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso1409a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791396811; cv=none;
        d=google.com; s=arc-20260327;
        b=ThOrvBtAjBVhH4ByJS3+hoEMEXRFtu+7iZrDX87tBtrWJyUcC/uEEUi1Kgpm5CItjQ
         5PST/fTxefYZts3gw23NPA1pfd6OTi+SN8fSSpHBPDffI+/U3kmOIYGEMt/G6fRzGe/t
         rMY2wefyLuJn/npmr425E1XEgrBnM5i5e0ve47DOJvgNDEuUENQHiRp9lNkM/LeXnK+y
         9bHJUrMIwenlLmMleQtyoFvAIRtsyzAzQKFyl3519HxGribsMLBe1IYIEKgYG/FK3bRc
         L6qyU+lUQBZ/9Emk/QvF8tQf6MR90YHOzLLbEXmKDqVYayu7Hq8WNuFRoXO1wuYAQnQs
         lG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WxmdSGUkA1DO3egL6WOHUvJBsfcKWsZyIgmusUzN/4E=;
        fh=sDgtXl7smkBXLgId97V27+7gLBjw74u3vScRZJUQk2M=;
        b=P1XIoRiraMqDxx7DDP9ZBLvPtd/kBh5vj7ZuZ7SKARxET9Vqj5gRMZVX6TxHPJXM/Q
         jCqIe5YYMvQuSSE/E4B6vEEYHvp8Z+up+YliF6DrGlcpSvcCB/Vd+uksZHtWM+rz6i9R
         SFhRLjHWUcWw0UjdtujfUZHn8qmSYLHL7fT4w8He6u2k0u2AMafy81gZnaYGUD5bN1rA
         Yr/75d7cloMUil8xFGA3JZ98RXMRFGYF+h088rmeO0YzKg7F89O1UCJ4k15cp6zl2UoX
         wiro+xnUeDTKV0Vpsb3fA3FK/IDcxoyaPxDc8zx15Ayt95mVu2w/bqV/cf/1kw6lBqWp
         fx+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791396811; x=1792001611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WxmdSGUkA1DO3egL6WOHUvJBsfcKWsZyIgmusUzN/4E=;
        b=qI63g4X02xZmzfuK56jJO3gVELnPNwY9BOz6Ihn9TOyI9AFwgoQpwvzlDVvUiTwqsR
         AmObwXOxqTNnE5VY2JJ3rydhVx4IznQ2Sjuaq3D6MJ1xyntwKriG0DDL/EB0tnwEA/X4
         qb5gBrTars9FqNksC5PdJHCjyQ8+heR5SIZrrFTno6yMEi8WJ2UbYRuAwqmRBkDFVDaH
         5ABPrkvOyauYd0aHCygF7I0CcghUbtcdIBKoYUWe+nWfd6lsnbGpUNbajMDnkOUxOeS+
         cUM5DbhQJQ2deHOs4ppxIxLEEPnjJZQAB93gyUda/bjyROXErAFAj4bc/vW9i/osz03P
         QuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396811; x=1792001611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WxmdSGUkA1DO3egL6WOHUvJBsfcKWsZyIgmusUzN/4E=;
        b=DTm/9PDJv0o02oFGWEHGOSPU6h9n05mbryuSgv7fX7deyDlLoZTZlou1Q8gF65ldJv
         zIAo66k51qE65zrjAnR+J2W8KI4MWC/WsoaYWtgbmtkuICdeNuCWh8+IGwaFcCcNUQxr
         k0XkQXWgu7tTa8KLRorXdFauYv3fTte/OQeQecI8u/1RHusTHdSyFDuU6E4Oycb0YyhR
         yW0zKdCW87cW7DDOULJ2OGhfIoXPbT7FRz45FaG94Yy9IjI7Ocs9exENAR3HlwMrADXe
         YagEfPQaFBO6U36YVajWZhh8aaHFcqJ1z21cJcgTzUQE3V21f3Q6dR9NV0n43R5iJmVV
         L7ww==
X-Forwarded-Encrypted: i=1; AKwUvBwNa7cEzn3A/hSJO8WPbQCcmu8eyIqr562ZnO3FcpFwPLo42YIQ+tXJPEBCHbI3uXmh3w0AgkNNHeTtJss=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9cX7osjNKZEWo4ArLPO47SMlEvrCGXd+DvwKpYJ/fsr58RCxs
	NBm0mned5JdflH2pwIwqDPSohPpMtVh3Ni5ZRWSnJqhfvkeO/7DYFuWvXmhx6g/boyeYxpcr00T
	dslWTKvUI7Z0dma6XJK0YY3Lx3rsy4Hl29Q2RqaGn
X-Gm-Gg: AYBFou1lUhDtv5iSAz/JLyEeh07dUV+v0rw/D75vyWHuu0V/BkLNQhC/fzrKpFIIxMD
	5WanULa8N01F4gOgQBgoW3Yd1R8jQCqT4v4rOMrNs1ycD7TC/rAMvuzJMvJa/M68DfFMzIBJ9rq
	108t8zrk0MNXjFVpWRc1NR4ZdldyPWpdxJXU9iAnAgqsW82lnOfL8iR8DpGeV6XUxzg+tIgh3q+
	riUaGbQZcth5CWzAhDRbLxI+ur48g8yTzsY0QIpLRqxhsulVzLo5W4C3SIaL7/ZVdnKe0rTSMvE
	mpPtupziQryow2llmRjluYIN1odUEPcB/1t7UJZhtAoZMgXcvPxFjA==
X-Received: by 2002:aa7:c38f:0:b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6afdca6dbcbmr143558a12.15.1791396810631; Wed, 07 Oct 2026
 11:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-b4-skb-copy-csum-stale-bytes-v1-1-adbbde033fb3@toxicpanda.com>
In-Reply-To: <20261007-b4-skb-copy-csum-stale-bytes-v1-1-adbbde033fb3@toxicpanda.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 7 Oct 2026 11:13:17 -0700
X-Gm-Features: AclHuK-_n_A8xp8YB-RDEaIVKPCVRrxiagUfshfsGewdeFBoQIHEykC2h8UN_Ns
Message-ID: <CAHS8izNHr1o922jw05y5wmFr-Ac3+VxfybX-LMOng6cXeP8Yrw@mail.gmail.com>
Subject: Re: [PATCH net] net: skbuff: don't leave stale bytes in skb_copy_and_csum_bits()
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 10:29=E2=80=AFAM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> When skb_copy_and_csum_bits() reaches unreadable frags it returns 0
> after copying only the linear part, and the rest of the caller's buffer
> is left as it was.  The callers copy into a buffer that is about to go
> out on the wire: an ICMP error quoting the offending packet, or a
> driver's TX bounce buffer in skb_copy_and_csum_dev().  Neither buffer
> is zeroed beforehand, so whatever was in memory there gets sent.
>
> Zero the part of the buffer we didn't fill.  The checksum usually
> won't match the data any more, so the receiver will usually drop the
> packet, but either way it no longer carries anything it shouldn't.
> Only zero for a positive @len, a negative one from a broken caller must
> not turn into a huge memset().
>
> Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>

We probably need some better csum handling with unreadable skbs
eventually. I took a shortcut in the initial implementation and
returned an invalid csum because there was no way to return error from
the csum functions. With LLMs now this is probably easier to fix.

--=20
Thanks,
Mina
