Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794493160;
	b=Gnqkrd2Posyt8+xRbM/cYC7T3za7n/TeXB+AgJrztykmWAK+VOPoQh1PM/wiPW6+wNzI
	 VWZIG7MEtaadMkB8m2PDOw4ujIoJ92FB+cOVYI+EFTl/X1f4l2bqgrPg049wn8jzCuWct
	 FaH5jzaxGK1MNJ52YPeP/IfaTaRGw2cJxdT8y0kOZ1JbHx4CHzkAKtpwHeW3v+ZyGNb/2
	 CvPy46LcOtiK2GaKqJQmRUNMLYOtuckfDl3AWi4YZcd/XiGmXs6u9mXaXGdzrR4yabIZ+
	 rT3Dj5Be3y7sFUW4ZjuxmaTgpgkoNNZZ0tdC3DDaKfBT5v+ChP9J1PfwnHDkvqxp+qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kd+/Nlp8ommBqhSffMOJg7lXCNoL6VMsRA3sgFnMf+Q=;
	b=wyFPkPkFinLasOpOHj0F0aiWpqzcelpSMQtBIKt0s9+ytRvkyUVaQ68L/UP1Zovr9Pj+
	 lz1OR1mvxQSRuTSZhs3qBpeUH2hbSzMPFdorI7DSMKrqNjXtzga4HQujNAF+vzLfwh2kV
	 PfrS6t8UcsKRr2l9/I7HTd0YrC7bJA6iAXcsY03QML97t3xT2nRd0ZLngZFaJMWCcQzBv
	 FrXexSXf0MNLx2h7u3i069XiWOmKDJel3G7r8VMDLOIyVPD0a6g+Ped1NKheTHbBm1oB6
	 nWlT9UD9l9Om01POIWN/tPjDGCZuF9EUxts/D+/WTuJ8sTwi963H5G4DRsx9SRdhscA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n740z2IW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232F4606F907
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 232F4606F907
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n740z2IW
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-475920b9ca2so1447534fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:19:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794493158; cv=none;
        d=google.com; s=arc-20260327;
        b=btIkTCWkWV+nRYPt+RcFfYqLcOrXNsuhHbh/98av0XrSIfMz3lXAHYr+d4CM8qpo9Z
         FC3tZXXkAJk7+e3StVIeet7iiYbVeMYwJJn86F6n6OLpUgfwzcNadMiB/2dVUW0f6Rs1
         mRSdhDtjuNpO9M2o26rtjq3sibO8CX+J+7RzFYYyGUzzkp6doYXgpfa/Jtg7n+iRIIkj
         9qeJc+JNUqySoTJy80wSefxmKlRrlfsjoTdmL7N8UIk0nzh6noPBKXH+QJ4yZSg0mSUW
         OEg0GsXcOfnyQnpxNUw1f+ZJTpNtSlYyufyo9tq0vNMCP3Jj840R5fPATtZlw1R2blcv
         6AMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kd+/Nlp8ommBqhSffMOJg7lXCNoL6VMsRA3sgFnMf+Q=;
        fh=m9G1JvBm2kb2uA0BAhOVb39+p7B+pcEQ454ndGGyjhY=;
        b=o+JVWXmECjeQi4YtR6ONTN9XlT7VikJ4m55fYZgSd4ERIj3Ha4ez2+3UJ+cZEjK088
         zGm/e7Y04TsCbZRF2MIy5NlqJAAUjLC3Iy4z3Sd90IDFVINAwxsNflOJ9lxQOOqL4PTG
         fX+LmA29i3SgjKZsaW2XPNG2vjA9sdjZjPjlp9GOgAptrEkLfpNbDDeTfvUTeGEIJBvy
         GMuZEBUjZpjrNdjCidEVmZEukZQqQrtUDBglb0L+Zmvb3PPCavqQDGlP/sYhMAPHD+Yp
         vydaZ9+JU7D7z1XBt7bdqQNjpfTxiiGjNA8lMW3QnvE1cpVmJhWD5D2XCldGuVxr+cEq
         d8bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794493158; x=1795097958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kd+/Nlp8ommBqhSffMOJg7lXCNoL6VMsRA3sgFnMf+Q=;
        b=n740z2IWYCmLBpYIgW448OkK5o3ft2gBxMpiTJ48LxTVxlMv+7UQabzWl8F6WGKYQa
         XOfd8zRj83llakPGeaGvKqWA1+fkHDUv6vc50OyrXLWCPWh6/t8U6bdPN9+S3G1DjowB
         lj02JtRwQz4UnVKEsAv+Apof0XrKarU3AkD0puPyB+s2T18f7BeAZe/GWMdgaSvY4NLa
         mpjbtSeIuZPbTZJz+aluoECSmzpKAziUUS83YuZBggqNkBcaBQ9Ob+mKPtJP5/y3xtWK
         Yboa6/x23UgnFTTfsxFTFIRiSHJ3qlAt+HzWqjptrbJHXV601r5hfhzHbCGQR7h3YTJ6
         L2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493158; x=1795097958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kd+/Nlp8ommBqhSffMOJg7lXCNoL6VMsRA3sgFnMf+Q=;
        b=e55RCGcIIxQ3RUcFlwaz3Uc1/VRgU/oWNc4Pci0WoZZB53bSattoGuPKn/iOJECP3p
         P6K3nfdsBGwN1GymiL4kAyFaTvAfkZYLVhPWQ6xIUMTOlwRHXRWFcMUyAssPH5mf6bRW
         UC1VE7m/K9bJPVE96Fsfpam2dTIx4mGOfA3+dop4y44R3DBELlCFrKsYexTrH1eSpaiY
         EfDrpYRsIewGC7Z5JwsZFqRwfE+kKeRGWqFcrULOHRcViknAZEqS4+D1iW+m0yjK2IzX
         VheOOtdeRdk1RpRW5tXjnUcIue0FYLk0CNwI4spzio17TReV5p2JIaT+wRs03J8J5Fb9
         FP0w==
X-Forwarded-Encrypted: i=1; AL+hErHCfFVBE833wZejha0SD2BLBBWjIsIjxcfjC0qfmx4+qOyh+MBYKdFI2YJCBXZSN/SSZnfvFoABWR+3pLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3r4sKiYM8sfSW5vn2LqBdooWBu2AIiO5Yktc9dlf5a6n4T14X
	KWGDUkPZf1TfxLXFDoffZvVlVlrYKtd6bKSmp3sNZMSRT5Sc+2wVwFRAA6CiiyUow4qu/BcXzOr
	2vz+n/cI9mdysY8y647ia3rzcojaP22I=
X-Gm-Gg: AYBFou2i8agjTwSp9wtl8cpufQfwVgzfaEv7VkO5xXgnLwsjSTuFxHPE1TE3dV3BmCS
	Zf1awOT/cTf6k19JnihjqnR0bK2YgeXcuL/sL26j8Urv7vHQct4PwQYpSg+VMsjCVlJyVjB9tmT
	CeW/aLXC3/Eog5oW8gB/aYeqn+rARcN5nd20kSGKpnQDBda2y17+5hIhY1CTCn1HXih2XztGi82
	JfBKz0PuJWAIIotl3SWi2DAZk+X8mOgY4gUmE/z1U0cJBguX8y1Olwo/Ae+krhkieuLLnqdH5nX
	U87OYIjI/k2fupymjP67DTlGSUmy0dMNamTB/KTn+L41ZEpC4YSIXzhSi/w/qL40gdBxbtSq9Ps
	DHVjtGT5jtmaL52b06CsKGrBTIQJEMe+/3zpb+ORkiRE4dLJ0GDTErj6wHwRwp5Bj2Loc
X-Received: by 2002:a05:6870:8186:b0:4ad:8800:b277 with SMTP id
 586e51a60fabf-4ae46b9f2famr4644533fac.24.1794493157905; Thu, 12 Nov 2026
 06:19:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112091451.22969-1-amaan.cheval@gmail.com> <179447532371.2168702.1261444176228225499@kernel.org>
In-Reply-To: <179447532371.2168702.1261444176228225499@kernel.org>
From: Amaan Cheval <amaan.cheval@gmail.com>
Date: Thu, 12 Nov 2026 19:49:06 +0530
X-Gm-Features: AclHuK-8r8_CUyAx0z3-RpELzn7MRNMdR_7wvQomD_xLmxRhfmXb6fT2JGFsk1A
Message-ID: <CAG+wEg0k_VuhZ5Y4zPyUvaTmK-erV6=A6TDmFS5E9Ycu5B1Rcw@mail.gmail.com>
Subject: Re: [PATCH net v6 0/2] gve: fix RX page refcount overflow with the
 pagecnt bias
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, joshwash@google.com, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, bcf@google.com, jordanrhee@google.com, 
	przemyslaw.kitszel@intel.com, maciej.fijalkowski@intel.com, 
	pkaligineedi@google.com, maolson@google.com, csully@google.com, 
	willemb@google.com, yangchun@google.com, npl@google.com, 
	awogbemila@google.com, shailend@google.com, nktgrg@google.com, 
	maxyuan@google.com, bpf@vger.kernel.org, john.fastabend@gmail.com, 
	hawk@kernel.org, sdf@fomichev.me, daniel@iogearbox.net, ast@kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 2:52=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>

Patch 2's bug was triggered at runtime; patch 1's was not.

Patch 2 (the refcount overflow) was reproduced on gVNIC with the splice(2)
relay proxy described in its commit message, on GQI-QPL (n2-standard-8,
6.12.113 and v7.3 mainline) and on DQO-RDA (c3-standard-4, 6.12.113,
where DQO-RDA still used the bias). On the stock driver ~78 of 100
downloads through the proxy failed with EIO on GQI-QPL and ~39 of 100
on DQO-RDA, and tee() of the pipe failed with EFAULT; with the patch 100
of 100 completed. Harshitha also ran the reproducer on an N4 VM in
DQO-QPL mode, the one format I could not test myself, and gave a
Tested-by on v2:
https://lore.kernel.org/netdev/CAEAWyHfCM_ZesnChP71AQvxjM4MASwukesgzuWCYECt=
s7jiNhA@mail.gmail.com/

Kernel messages on the stock driver:

  WARNING: CPU: 5 PID: 1198138 at net/core/skbuff.c:7324
skb_splice_from_iter+0x118/0x300
  RDX: 0000000080000000 RSI: ff34c0bcc1881c00 RDI: ff89153145163c60

RDX is the page's refcount at the sendpage_ok() check: INT_MAX + 1.
With tee():

  WARNING: CPU: 7 PID: 3008617 at include/linux/mm.h:1456
generic_pipe_buf_get+0x51/0x60

And on GQI, once the pinned page comes back around the ring:

  Pagecount should never be less than the bias.
  WARNING: CPU: 0 ... gve_rx.c:507 gve_rx_can_recycle_buffer+0x58/0x70 [gve=
]
   gve_rx_poll ... gve_napi_poll ... __napi_poll ... net_rx_action
  gve 0000:00:04.0: Performing reset

The reset recovered on its own within 1-10 s each time and recurred for
as long as the pinning workload ran. The reproducer, full traces and the
kprobe measurements of the refcounts are at the Link in patch 2:
https://github.com/AmaanC/kernel-bias

Patch 1 (refuse XDP on DQO-QPL and GQI-RDA) is from code reading, not
from a crash. The DQO-QPL use-after-free on an XDP_REDIRECT to a copy-mode
AF_XDP socket was raised by Sashiko on an earlier version and I confirmed
the path through gve_xdp_done_dqo(), xdp_do_redirect() and xsk_rcv(); the
GQI-RDA NULL write came from Sashiko's review of v5 and the FIFO
allocation in gve_tx_alloc_ring_gqi(). I have not run XDP traffic on
either format and have not reproduced either crash. Patch 1 is in the
series because patch 2 makes that path matter: with the bias at
USHRT_MAX the driver hands its last reference to the consumer once every
65535 handoffs instead of once every INT_MAX, so a copy-mode AF_XDP
redirect on DQO-QPL would free a page still mapped in the QPL within
seconds rather than, in practice, never.

What I did confirm is the attach itself: on an n4-standard-4 whose gVNIC
runs in DQO-QPL (queue format 4), Debian's 7.2.11 kernel accepts a
native XDP attach once HW-GRO is off, Rx buffers are 2048 bytes and the
queues are 2/2 to get past the driver's other checks, which is what
patch 1 closes.

Thanks,
Amaan

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
