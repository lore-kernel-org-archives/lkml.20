Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D45D3793BF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562234; cv=pass; b=ALZQK1Dy44OQVo35XuhTeYDTd+5bvyKIMQ6ddltR8qVKdIPbo/wUBBij/fRCTNUT36xDZmBjotiD/4MLNXeXqg3kO6s6s+Dmg3DyfVEgKo5zcPSKL22RowWdPaKkGsMNBxCY4DYTH68SXGvX/a3MLmPnsJIMyWCyNipSSGT2Kgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562234; c=relaxed/simple;
	bh=l/2NvT8wAaZjhTPr/ZhLk8DKnV44dtAlDJhAZmm/nMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRvE4VIuaRW6ejZm5FJCxONuGfVCt4jC4kWKV0bUvaDTLrb4mfHjGRfY37c0v0XvxgVCVDLq8CTshtm4pdzEhZ04xjxgODxC/o6svSHXjidDoDDBbL6ptAJ/mobGIwU0dsE74iAeYAcPj2NWnVp7iqzdJNSrc/dW0usVyjbmhF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rnnKx1YM; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rnnKx1YM"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso12431a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791562231; cv=none;
        d=google.com; s=arc-20260327;
        b=AQxZ0gl3HcrVteiAIFk4AL26sbJ6QtnKsPCH7bm3xJ4a+AyV3Rmv2rDaKJvoW6NQLi
         ddeMPQrOPKCZ8xJ70wXeFu3rdfliqDwxlDg7D7qRi56RN3RYxm7dbDrXq1DigTxy8+HB
         EqabZ0yJeioMQvHBqpw16z4D2t/AjGMjiSG3jMON5toDiE55E27rzduatmsv3OcHlIYX
         TV6uojazfQA+NDe1IbiQJ9IChCRhtiRV1gTh+oRAjGQYGvQtGoI6WJTEFg8AMsI7GnRX
         QyOZR3KjzaRQMez5k9l1N7cUMpotHHSDlhv1p4RKNKCgchzNWSMzY9URgnWT7U6UDVhe
         VJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Shr7ewCDcxmR41j8pJezsmsxST+IY4eGTxrK4PfmAFg=;
        fh=bVUOiu3xVCHQ24L+WyQvLxF/xQq2YRWwV73iCtcYJJY=;
        b=DJy5r6/AhTLSxX1Wu8WhrwIxyHrhZ+Ecx5zspcT0plnakTB6nnFFEY7wChsTUGHUZU
         sJh5oSpCuYzNwDGOkWlvfcBLoeBuTYS9xG8t9UVFcF2dpDAoFJqvBC9BffmyJVjqE+1H
         Wc4wKe93lBzj/QXIe9DtR4KjZXu1wfFAKSt+TM3eAVlrwTqthEyUYW0uw5CRqgOQ1pLP
         a/tP1iT+FWyETD0V5NgmOcsx0rJdzZoe8Le/nm5B3rZV+KzJHOATozmyEcZb2gAUx0nv
         CUaXzkAcXpPc7qDJ3GuRXG5njUOzo6RdjJAjoPM+C+gTLr9KCAOmTobVCbsjZ+q62gZH
         agzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791562231; x=1792167031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Shr7ewCDcxmR41j8pJezsmsxST+IY4eGTxrK4PfmAFg=;
        b=rnnKx1YMGVv6LcMJI3ni0RBJ05j7UP7eLxF05QYbTCPY68PYu3RkbGwhfVwUP+tUvT
         J4ENfjUQ+uk/qDOkoVAJRD8pZE2r8wnE6egJBWtXyph5GL0iP8hfeePVnoFehAnNRdB0
         83CR/klE+scGAMTSJlNxV/ChReMXOFomQoKlcsYhypiSR+BxJkNYpJokIhlvnF8sKqzT
         W1bJIvvgQwgYo0pL82adLeuASsykp1cSogmisXOR0bmlzYhI7hi0X4jzXflkmGCCz8VK
         Ox+0lh3rObmzoGPJ+0S745nRmAvA+cGeEHIj3FGU0ayWU4H11nyBan1Boky+fZf6/s0/
         ReXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562231; x=1792167031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Shr7ewCDcxmR41j8pJezsmsxST+IY4eGTxrK4PfmAFg=;
        b=Ez46AcyJd6CTdT2QvAKu6Qdy04VNJfS2//WYlkLl/9rV296A6EETte0pUA4OZfbF6X
         9IiGSkqZ9M0Fb+RU9rR480wfT7IX+4fejJE/xM4xzXihjVUDmo11fv3P8IekngA98g8v
         9a3+qPCgwKfywrT72niGKt+qsPhSetk1dvjcbqcx20rLVMkDYJVuAU4Ukp12eLhYoIe6
         4ZsvnICUusg8kow4kbQ53Bc37VuFq1ftVlODurNLw9s6b6OLHcAxlmXl2sM/fmr3BW79
         p8X3KAPk1NnuIefkKcJFVpu4TqaS11Xcs0ga/sbVzE5N/zKcnIaYPRYsVMubBz1a1dNo
         btCw==
X-Forwarded-Encrypted: i=1; AKwUvByQ2cpHcBE+65m+KWtyr1IobpnjKWuoI65N8yRWxF2LgT0pwrR4FpHrOFNvREus2LEc5ESz7/wF5bdqQAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+Va5gUBAxuQvTJ5HEJKj3Ec9TuImz2FSQDMJRoB1eTaN0RZSa
	6y+YOse823cScPhtzoCI9NnHZdxFzWr2Wa6oJx+GjEReJ5wFJd544TgdNtbLsYB6hzt2y64PfHl
	HV6k9TnshFYjkilPUZR4DrtRNakTu8qMQy7ytGac5
X-Gm-Gg: AYBFou2w2zPF6AjyC7ozrZLSVrKHHq/yomsV9mga04o1RG+8efqk1JcQOtaAiemHX0A
	UkY/sHzaecQtftpOJl5jJAOuO/hJi0Q6IO9NaQLNPJukKG1iwlzDPrO/OflG8Oa7jbViFnmRIw2
	iQjce0njp6C4SzXcuhByC5jeI2QkZGinCcm7BF3t+iAf9K3L8HjSkkS/23othx5ziTEPPCqTFZi
	yE5yLohrdVU0PFzLrkDrP032jpWn4VlQM3W7U846QtBZXkEV4QCpFzBhV129/vfQSg3TI4KOl9g
	dUXcF+Xy3jOpuIxUwSvjArcDJJapJnv8MLmZq89K4+AGsfySVPknmQ==
X-Received: by 2002:aa7:d743:0:b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b17b963117mr42270a12.15.1791562230138; Fri, 09 Oct 2026
 09:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com> <20261006-b4-skbuff-bug-on-v1-3-1b4434c5357c@toxicpanda.com>
In-Reply-To: <20261006-b4-skbuff-bug-on-v1-3-1b4434c5357c@toxicpanda.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 9 Oct 2026 09:10:18 -0700
X-Gm-Features: AclHuK--6z6-8oIyC9Y_LYzNmkmzq3sx298S05qv9PBQ53pFLOBymcY5H1fz2x8
Message-ID: <CAHS8izMK_RDcYBZq3AZEDcxnRHWRt3ctOkPMvoA40XUmCs7swQ@mail.gmail.com>
Subject: Re: [PATCH net-next 3/9] net: skbuff: don't BUG() on a bad frag_list
 layout in skb_segment()
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
> skb_segment()'s frag_list walk assumes the GRO-shaped layout it expects
> and BUG()s when the layout doesn't match.  Anybody who can get a
> malformed GSO skb to a segmentation point gets to crash the box.  Most
> recently commit d5dc1e69fd72 ("inet: frags: strip GSO state from
> fragments before reassembly") fixed one that an unprivileged user could
> trigger with two writes to a tap device in their own user namespace.
> commit 3382a1ed7f77 ("net: fix udp gso skb_segment after pull from
> frag_list") fixed another.
>
> skb_segment() already has an error path for a bad layout: the
> too-many-frags check sets -EINVAL and frees the partial segment list.
> Warn once and take that path for the four layout checks.  The packet
> gets dropped, which is what should happen to a packet we can't segment.
>
> The one check that runs after skb_clone() and before the clone is
> linked into the segment list frees the clone itself.
>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>
