Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A61399354
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563318; cv=pass; b=aEqWbSBjwQlQRKh9lAYc3j9023qJKpWA7nWkG78e/leU+texywAEuKMAQ7ptMDBev/xQNXRBwS9hxMqLz/yDxsLPWZC8ed0Dn6tsZlocOLCt1S9qODrLrjxRgroGeyv6LYAPQJa28sxWknIdcj7yf6K3+IXu6Nv8Ng4RJ6VlJvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563318; c=relaxed/simple;
	bh=aEEZOJq1YQBCl+EBhhXBbW8ir1k7qWPCFd9LKrrdcJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUIuMV3bvRr77AuxnGUXhOTK8SpLB5+DluoVRAISghG7ARvx+VLv+Vkp1OOsZvK11IdxyBEjO4owqGHjin1PwYdlODcCo8fnMZaENFoSOHGA1LMNlm6bfAXW+np57jsb2WXlmuceDE5oBympJHMoUDOQadPMIBFeffChViFAVX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o+35tXEh; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o+35tXEh"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-150ef97e790so6253c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791563317; cv=none;
        d=google.com; s=arc-20260327;
        b=fD7eQ42cdmIgKKMPBBEMVlCFJ9LAs8s+DhqXPCVU7Gwi8zhaF7fw8FVerfScT/EHFF
         AhYCDSvU7PBBmuIA7caobgccclU14RX9H0Jf9C2LotEjaZnW16XOvTW2qahv7oFzkqx6
         549/RsYtuBSWK8/aXJMA4EMeyYtWWcedx9Ba0ODk4RHMwiiRyoaL5eb0MNQlVvXzq1Vd
         AQRXplAnSQHyxuSshzFJGVdx7i44U8xLS9pf/leKxHmkMIzkupQbrVcKKuPojX6f/9Lv
         vlkP+Tl59h+SvST1A1blUteezT2s+jcp6Kakq1I/1v1VO925UusD+wulIj8KRwO9dSyg
         vaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gEeyzzUSwXoU/QlTHcalzbT11R3NUJQd27RQiZ05uEw=;
        fh=iPTORDBwbCHgdiFcZGZZIowtJQW6lPC7i3T64X3Zh5A=;
        b=llB/Qm/wT5q6wzmvFQ3C4h1AkPIZmCWZYqzI7Wq06I7T5LdwLp8pB5PpGhCeS2P2Rt
         aJy4s4FzxgMhEv/ixPsz+fwv7031AuLwUi5oHxKItue9STxwYbkhvJXqmAmQSed3q9GJ
         zXYF+bhbxqtBVre+P3X3TO34WljuU0oFAkwhevSwTIxDrHecODcBEuwSz+YyEoHq9AH7
         7xe7lJ4VOLcUrsMFnBWDS4csG0EhkNFDI6yWAyFpQVqLEARCB6bwCxQJiyHEWE54cAES
         tZtZCYCC1bILjE3PSmfLm4i7rjU/jYXA58Mr18VolWpFLCvlykLkxNng8nrwfSUoCr5L
         ELtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791563317; x=1792168117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gEeyzzUSwXoU/QlTHcalzbT11R3NUJQd27RQiZ05uEw=;
        b=o+35tXEhoUP055stHe450elM8Pde7XjT9r6mpXr9QUNVD5DEHxovL/+mbE9yLffc7u
         AelCVfSrubGoxQlCuqas9iv0BdB7BiXlqTICakIwKQTEOp+LpHLYTVhJPUfPURrslp8h
         Y9VCy3LBTHSB1LavwadSPIutBsxXhMd0X/7XzE/4FVSxCfGwwmHU57mq8xGKAobKpGmf
         p4lu+rQq9rVx9H8lzoJndqGjBHiYgs7QEdTEvPApfMfw7JvbuCLtUFhvYI+CG6UOxe9x
         4sBR+o2tFi8kFuvD5Vk1lWwm/XADmEEGxbpNG/6sCB4jF2yOtp6Gc5finCtz1csUig9s
         FGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563317; x=1792168117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEeyzzUSwXoU/QlTHcalzbT11R3NUJQd27RQiZ05uEw=;
        b=cNqd3Qk8IJS0CPGdRhMkSkKlqaojSZTBgrtjkQnmwfwBJ6VFE8qHc7wqSEF97M3LOS
         mvdNeB42LO/o6z7Sg2D1t+6hy26HHEJkL+Qeo1Qi8GQmgeRJa7tzB1bI+qbWLH6LsYza
         xH9BHThokDo9gRKsYN2is6whjubZaAGYxP6fNDgTk7T0ZnLQWoLQydS2uWn5tgSqOO+x
         DMGTdOGZFMsb+1khCmsnEAi3zo/kek5Eymv70ae/E+P1f7wnNp9chvZpChQiO7cZd4AK
         cJy86S8CJwEl9F6qR2bGmD8Ce5slRmCPTEUGyTSG41C1JlDI2i5ZIVlt2nf6dDx1SWpS
         B6kg==
X-Forwarded-Encrypted: i=1; AKwUvBzTTZOEX/6zeUR86ayog88ILjg0PsVBh6km2FNBAX5XnlyXih/6L0ddOXkoLDzM8+vOwJrpLwcbOifndqQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mmDhQ1OSyytboqvk7Cn78bAGns5waH6yw/5J+krVBwVh9fxNAt
	UYEjbuaAuoyq2McRlqgtJUbLNsKwYS5X3ykAMBQw8+AiavYH1jdDKHncNP+lLiKsvNq5r+eV+AI
	tIfOQU/I37k0m/6P4evXkVQ1w0l9kQTXej13VFWR7
X-Gm-Gg: AYBFou1j0a5RIJQMvNvfoD4WyYSeaNwmWuUrp9QQeJiNSN1eo/wiAVRAaTDnYWrb/Pi
	ehfNKkHpJme5v6eq+PzItDEBzzz9dmq3GYH5Gge38D5vnpNCuQ3TFHqZdlIzUX7ITHh5z1pJnVl
	dQpBQkrD/SePgRmm1KB80Mn0Lw0yASfVGgnLb6zr+RUe5L/2OHhJHTz/cwTN6OOlLXRcUpt7HkF
	daPSOl2nTx8lDGvi6RzHchVNsQrZGSTqVz9O58QjKoGwsEDuv/etRsmuvQxctbviEvkhqtRVkHl
	e8QnuP1NPCujD5fbgFVdKN7xDuUjU7ORP8hCxEL95ScWadbxUtCizw1U3+pHrDy3bg==
X-Received: by 2002:a05:7022:1506:b0:12b:ff98:1ed9 with SMTP id
 a92af1059eb24-16a4d57c474mr309609c88.12.1791563255822; Fri, 09 Oct 2026
 09:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com> <20261006-b4-skbuff-bug-on-v1-5-1b4434c5357c@toxicpanda.com>
In-Reply-To: <20261006-b4-skbuff-bug-on-v1-5-1b4434c5357c@toxicpanda.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 9 Oct 2026 09:27:14 -0700
X-Gm-Features: AclHuK81ahTE51wC2Bp7FXQn_Jc8YWHqO5IFJUkY7wkhMiw-xblsjCBwxgAMBh4
Message-ID: <CAHS8izPj0JCi=-tjNBTYH3=-ak_VLCeKeWxTrwAt7vs8LDgn5Q@mail.gmail.com>
Subject: Re: [PATCH net-next 5/9] net: skbuff: don't BUG() on leftover length
 in skb_checksum() and friends
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 10:10=E2=80=AFAM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> skb_checksum(), skb_crc32c() and __skb_to_sgvec() walk the head, frags
> and frag_list and BUG() if they run out of skb before they run out of
> @len.  By then nothing has been read past the end of the skb.  The walk
> stopped at the end of the data, and the check only tells us the caller
> asked for a range the skb doesn't have.  commit 06a0afcfe2f5 ("xfrm: do
> pskb_pull properly in __xfrm_transport_prep") fixed one such caller that
> crashed in __skb_to_sgvec().
>
> Warn once and return what each function already returns when it can't
> do the work:
>
>  - __skb_to_sgvec() returns -EINVAL.  Every skb_to_sgvec() caller has
>    checked for a negative return since it learned to return -EMSGSIZE.
>  - skb_checksum() and skb_crc32c() return 0, as they already do for
>    unreadable frags.  The resulting checksum is wrong, so the packet
>    fails verification on receive or goes out with a bad checksum on
>    transmit, rather than taking the machine down.
>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>


Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
