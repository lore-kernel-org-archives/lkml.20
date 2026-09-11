Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABD9313E00
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789089427; cv=pass; b=ULiqOkE+vql8qVYikkfEeWxmZWcNZSRrmKHQJRpc9cTa+fYpbMB277oaTtYkPQEOC+yUkSk2wecVnfFB97U50/XxJItqnMBQC7EiCSNB00oSGrbwaAOZIgKMlM+WWDT8Yq8boG3DO0FgCgFrzU7Rp5Wu6d7HZu+bah56M+Kf+jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789089427; c=relaxed/simple;
	bh=5q+iL/R4cDrY1TpT6uISBmPsAgAumboJPqFJbP2vER4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrevwsB+FMMdngQymduP5dJVPxxuSRslKTfB1m4OJw6+gUGttR52OcWM0VKArXKGEelVg7uICDejccc8wAMEeOzIACbc0B2yvKDqoZKzz1Abm9aBKGnbOTC95nIre+qzX7Ypt2dvy6GG6mh8Xa8gcxHWkQzevqa+8y34PQwY64c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HijGppF3; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HijGppF3"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb766bfd8so5424831cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789089424; cv=none;
        d=google.com; s=arc-20260327;
        b=rQwfzhRXd8w6A0kTbc/M+yi4zUjamO6ZWOTMfDD7RQWOzCgMVKg53bcUyT2JUD2IYj
         g8IEo3BFLZOPeUg4h0p78n0LPpTw/9zu1cV4nSBhhkfnAcLGkqjBOyiaU94tQfGmF2dC
         2QWwfXuY2zsXcYCB8ZMwkpttFSBBrgcXYTxouEteewQMxEBN1pZoY5dsZ4YX5abJ8YOX
         0lZ61LsCyTuDL537WlbIxgZcOstT67eJg0PZm9Papl7pULVL0pWLlGzn4ad3I2AiWrte
         gfJVVz0zK7Dz0tq+2rAA5BEKT+Y8sqTwhI5VNdrTZ8qwnBVf+aTy2lHjDHEKLb+8QKLF
         CP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d5p9NQgPpyH0j9JiAgxiWq3LurVs8yYrQVoiE1QcZUw=;
        fh=YNFbkQvqT0WkCdEODASIBqNjn92LpfAdkeXxbxd3uNM=;
        b=mVakOXICbg6adxiBj8vxrnQZ6MG+OPeWPnc9lu61KK2Jko026OBKzNykckBRb4/39h
         aZg2Gwn4DiC+lJpnZn9u0v8/O8E91hK5KgLLSReOaLL19lOBlln1HNqSECAKD2VtxGAe
         /tYihzdtBeAljZEKwyJB7wO03CFBoCyvyf5AjeNxjNovWY4wyIYc8rMeD+mogjY57Tc8
         DkyDnuvq1R6i2Vq1aODVM/CLKaqq9kKV+d62s0Sr+ll/YpbssvFOwHVoODKTFy0L7Rqz
         nFAv8roudV7QjrOA0WUmyN9r1DKdSBfdxP4yXt2f4TMBOpDyKvWySTSbLXggiCq0vYOS
         17eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789089424; x=1789694224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d5p9NQgPpyH0j9JiAgxiWq3LurVs8yYrQVoiE1QcZUw=;
        b=HijGppF3YqI7mjQm+WRnchhbkLIGAn7xuY3LCkZo8iMrhJ1aQ4elSuEjtahnX4xhaZ
         1o4PGE3JPPQNog2RSzhnr0ZeP+TeGRBy0b8igJr+EByUjDl1S5u5jMiNK/07KSEAYWJ0
         A3W+cGhtl42Z54+D0OEYIvUPwO5VGMTWxyDkC4JasInYOJPE8gJy1TyFw+z8KWkBc2Xr
         gmfEWAG4rDDUKOCGHafU8aql42Fqx+lZ6w50GGKHOD285WXr/mOVPJ0XKWG2AHhSHoXv
         2id6kA0htS1/G1IfTxmv2m3LlCDlhSHd9eeRfJq2YzbXV2TRPYvaGE4MJyZaPMChHPsL
         OWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789089424; x=1789694224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d5p9NQgPpyH0j9JiAgxiWq3LurVs8yYrQVoiE1QcZUw=;
        b=YAsJu9mzEgXsUP0dAk+DbssqPvzCW+4QGWqGDeMXeLAqQhaF0LVeJjlNlS5ba7ZPjE
         JQWbw/HCnUR76G8CC7usLc15EMyaidYuCPA4V+Gi0j0HiSYvn/XIoQ9Uc+R8B6YW/Un5
         wR3xrovqs0Mr4QINhr3rcTfB+iKPBYNrJPlV3e0IEuxp48XgXoGbh/WCSIQY9KR3IC4B
         10BKQszqc7MPS3GPajKb0JClbf/UBloRf/PJNWKL382zjfA5UdV+sQI13v7/0vnVjTxs
         QNlWlUj/befM1cZXs20p3dCRgLxLMVjsqtDMWyfpu2RvT61jIMn5IHAOBNa2j/nS6Hk5
         QIGA==
X-Forwarded-Encrypted: i=1; AKwUvByDAiN42RDlbsqJGHMkaOTIA4UbthoX5M7Z3Op4Fjfu70OtBPwkp2GhlGdbbEY4ap2GJA58E6f2+97mKYE=@vger.kernel.org
X-Gm-Message-State: AFuF++mqOSZ1QBhG79geirvDzqzNejB8/okXi4arAUpIMbIpmJJIiCW4
	eS7nxqk/nym8ywgkZv+aROF/CmoGiLF3Ao9StkKKjbw1S1ADdsNz2fKkJStv1bsryfld5KH5SMU
	Ha+CIlhYXFDGgszyc8pcQcADRqVkVhCGZ3xtbDzBm
X-Gm-Gg: AYBFou3GOeFBP8s1Rbf2Cv9U7VVXtm9eunfJnVu9dd02NP1XnwhzfCddNzv1yq+151s
	3JbFvPTmxrkPbeE5OqWm8CFJx9UT/gm1g1eS8OdCKnG+P5pzd3L++MkaHYtR6sMdRwlow2xQFJX
	7zhg7exZRUrP54M4+f/VUdNBt2Fn9CiUrNudabZCqWKWwz7UBQZlB4GujFyKLZO1pB1SZ8n8TN9
	9j6rGLNXe6Ve7/0ID+lgcOto2GK6QeUYDuDPn+nk7cjhhDGv/fjAI54L3jVQTjijwkvonm/WKEN
	FhbOD3LwcuAG9gSCxGJEHDQ4UFNimxWglOufHwSQjARThx3E7p9f1c361/LhUdag0XxKwFawdKt
	rgyvuqscHzwnWeB3gg5zBiQXJx305w1OCxB0NU+KRACbg0tQh9fsMK+5HvJdrbUaqPsrlvNRmlw
	xsmeJG6SNTFR787C276ZhI0zX4MOpFyQ==
X-Received: by 2002:ac8:6f11:0:b0:52f:64c4:8094 with SMTP id
 d75a77b69052e-530c87226a9mr49908141cf.39.1789089423282; Thu, 10 Sep 2026
 18:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovCgMrVBnn+0d198i0th0bcr0EAwNZ=0juh1ug8DdJX5mPw@mail.gmail.com>
In-Reply-To: <CA+0ovCgMrVBnn+0d198i0th0bcr0EAwNZ=0juh1ug8DdJX5mPw@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 10 Sep 2026 18:16:52 -0700
X-Gm-Features: AcwNN1VGil1vFMyCvGxTO0Uen3SBrfMM4J1yekoBWYuH_50vYwcqY9LxSE-7cx4
Message-ID: <CANn89iJg-10Xy_N_h3Et3wTasS_7RMkwxsz3XKmzYc7mLhKa-Q@mail.gmail.com>
Subject: Re: [PATCH] 6lowpan: do not compress headers that are not fully present
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Alexander Aring <alex.aring@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, falemi@asu.edu, 
	Simon Horman <horms@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-bluetooth@vger.kernel.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 1:31=E2=80=AFPM Farhad Alemi <farhad.alemi@berkeley=
.edu> wrote:
>
> lowpan_header_compress() pays for the IPHC header it pushes by first
> calling skb_pull(skb, sizeof(struct ipv6hdr)), but that pull is a no-op
> when skb->len is shorter than an IPv6 header, so the unpaid skb_push() ca=
n
> drive skb->data below skb->head and into skb_under_panic().
> lowpan_nhc_check_compression() has the same missing length check,
> committing to the next-header compression path without requiring the
> nhc->nexthdrlen transport bytes that nhc->compress() reads and
> lowpan_nhc_do_compression() then pulls.  Return -EINVAL from
> lowpan_header_compress() when pskb_may_pull() cannot produce a full IPv6
> header, and return -ENOENT from lowpan_nhc_check_compression() unless the
> IPv6 header plus nhc->nexthdrlen bytes are present, so that the nexthdr
> falls back to its inline encoding.
>
> Closes: https://lore.kernel.org/all/CA+0ovCjTsygN76s2o=3DTZqPqW8v2gBhmRnz=
+q6G-NaB3Cq-YPqQ@mail.gmail.com/
> Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>

Notes in a semi random order.

1) You forgot to tag the net tree in your patch.

2) You forgot the Fixes: tag

Please look at Documentation/process/maintainer-netdev.rst for more details=
.

3) In net/6lowpan/nhc.c, calling pskb_may_pull() inside
lowpan_nhc_check_compression() can reallocate skb->head (via
pskb_expand_head()).
When this happens, the 'hdr' pointer in lowpan_header_compress()
becomes dangling. lowpan_header_compress() continues to dereference
hdr throughout the rest of the function (hdr->nexthdr, hdr->hop_limit,
hdr->saddr, hdr->daddr), leading to a use-after-free.

4) Callers of lowpan_header_compress() do not check its return value.
In net/bluetooth/6lowpan.c (setup_header()) and
net/ieee802154/6lowpan/tx.c (lowpan_header()), the return code of
lowpan_header_compress() is completely ignored. If it returns -EINVAL,
they proceed to transmit the malformed/uncompressed skb anyway.

5) In net/bluetooth/6lowpan.c:setup_header(), there is already an
out-of-bounds read before lowpan_header_compress() is even called:
hdr =3D ipv6_hdr(skb);
...
memcpy(&ipv6_daddr, &hdr->daddr, sizeof(ipv6_daddr));

If skb->len is less than sizeof(struct ipv6hdr), reading hdr->daddr
is already out of bounds. The driver's transmit path (bt_xmit /
setup_header) needs to validate skb length / pskb_may_pull before
touching the IPv6 header, and must check the return value of
lowpan_header_compress().

Thanks.
