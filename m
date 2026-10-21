Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597790;
	b=0EQeWOcImM3N+bdFwb+jRrkUwljz4QXBmUpp1kO3rNYdXPVlTAC//H6KtUuC+ED3YzGK
	 w9cpGhgMMmE5Cs9m7hN9DqfkIjAkmykJYazs3xurRHWsx6xlBiNSSNtBe/UIDfYdv03yk
	 f2Cpf+ESu1B/XwcWzCiwGzZwLpQazhk1ttA7Veto2MGc7y/NVgdx+2Gtdr2FhZ+dSbgXv
	 Vt+jFbdGNG8s4DWrHmPIYHtODXL6mjS5bYthcCP7HjJxTfiyYS46Ee+TtzGOW9KUyRcQP
	 WvjsoXWL85FEGvhld9+1xcG471M+Pzu9XD1dcIghlrPL5WQfQVYgw7CDy7ZYDMIT5rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597790;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=5i/dKlQItIVWlNQQt5TNx8F6ezv0iQQLPMD7DB2X0b8=;
	b=aYcl5WeCsjiyt+FFQTbvQYMOxSFAJP7AJqIIOSbEUN+MnYCTGuOWTIBw4OGe3zrrmdA1
	 LqZp+mbyZZE6QSqldXuht21ZznFeNeRw7YcTVNEGYVEWksZXLQ59PTzY6JJUQc+6G3OVq
	 KxwzRE1SfOHr9pBzBRYoOhxf9OGT51AqeWvvM0N9RCjhi7NxU/VxcS+yr4PEyyc/hdGLr
	 zxkAmi4daJ45sjLC8f9YZos8aUYEzM588aPEtiLe+v1ZSI9p9NhuV4uDXZPjtJ9CeJLm2
	 t3fuu+MtzLWYf7mgrDMNrtkujs/GkV3kqlbtW3jNZKHVmfHHsTNzzJaABP3MiDBhR1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5Df4mb8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71247606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5Df4mb8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E2B1F000C4
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792597790;
	bh=5i/dKlQItIVWlNQQt5TNx8F6ezv0iQQLPMD7DB2X0b8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F5Df4mb83F6U2s2se5pn0jy/Wo+RD8CTks0HWbOfFXQJREc5vx1G964WA6uOr7nnJ
	 Nte/t/rVqq5eLOn79vcnpmrsdOtldJFqvoAErT04KlOaqWHgEuz8hbeazUm6ZvpWRG
	 5IHCRgtb13iHxc/gI4xeCFC3hFz6PdzH/j23FeX7vgF5g8fKB4drwAl/4IcoBd4V8z
	 uaHAihXUr1VsxtSCXrvwv2kKrA7SDT+H/pK/oF9jpev+iGJn5JomCpetnEbpyYP0my
	 5/0DMZNpWOiAWx2uXuZPGjL72BJoqlyH2zZ3Jgfqu4F6MZsYmpEeZ+I4TkSmrJ4pZH
	 sDy00yEpGvwew==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so79495e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:49:49 -0700 (PDT)
X-Gm-Message-State: AFq9FYIVKxcF8rWtgAehEhZA7cI1ieC/txfgn8wRTkDc1m0TZeYnxlaV
	Zkh4EUjFBSGuCDOCvr1OCFBs6UvZeRL/F635i0nc0vZzayQwYet1GOKAtYDlrkZRXtSUQTce43j
	IAoemq66sIgn1Nzk0iNVQjyc5K+Hhbog=
X-Received: by 2002:a05:6512:ba4:b0:5bf:a678:d516 with SMTP id
 2adb3069b0e04-5bfa678d646mr92472e87.9.1792597788716; Wed, 21 Oct 2026
 08:49:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <52b8bfe4ee848aff8ace47752352de486171d45f.1792595507.git.mst@redhat.com>
In-Reply-To: <52b8bfe4ee848aff8ace47752352de486171d45f.1792595507.git.mst@redhat.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 21 Oct 2026 17:49:35 +0200
X-Gmail-Original-Message-ID: <CAL4Wiir3NTn8VdbzS=sV3tfz4XGoBXmSfjm96k9SBMTiYBBtjw@mail.gmail.com>
X-Gm-Features: AclHuK8ol3_rFLLxuCeAxv7ojvVgYmPnagcrD83eaOPiz7WOH39uKcf84ElayPE
Message-ID: <CAL4Wiir3NTn8VdbzS=sV3tfz4XGoBXmSfjm96k9SBMTiYBBtjw@mail.gmail.com>
Subject: Re: [PATCH net v3] net: gso: validate transport header before
 computing segment length
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Willem de Bruijn <willemb@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Max Krasnyansky <maxk@qualcomm.com>, 
	Rusty Russell <rusty@rustcorp.com.au>, netdev@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 21 oct. 2026 =C3=A0 17:13, Michael S. Tsirkin <mst@redhat.com> a =
=C3=A9crit :
>
> If a TSO packet is processed in the stack before a transport
> header was ever established, the TCP data offset is read through the
> unset header offset, far outside the packet.
>
> This was demonstrated by syzkaller, back when the input path did not
> dissect such packets: a virtio net header supplying a malformed
> network header was enough.  Qdisc length estimation has carried a
> guard against exactly this since
>
> commit a0dce8752193 ("net: Skip GSO length estimation if transport header=
 is not set");
>
> the GSO length validators never got one.
>
> We used to, but we no longer allow such packets in: since
>
> commit 44378d02c5aa ("net: always dissect GSO packets in __virtio_net_hdr=
_to_skb()")
>
> the virtio net input path dissects all GSO packets.
>
> But as a defence in depth measure

I do not think we want this.

The root cause was fixed at the source by 44378d02c5aa. This patch adds
code to skb_gso_validate_network_len(), which ip_finish_output_gso() and
ip6_finish_output_gso() call for every GSO packet, including locally
generated TCP, to guard against a state the stack no longer produces.

The Fixes: tag is misleading: by your own changelog, nothing reachable is
fixed, yet this would be routed to stable.

As for bpf_skb_adjust_room(): if it can leave an inconsistent transport
header, please send a fix for bpf_skb_adjust_room(). Note that what it
would leave behind is a stale offset inside skb->head, which this check
does not catch anyway. Drivers using skb_tcp_all_headers() would still
read it.

Turning a broken invariant into "does not fit" also has odd side effects
(ip_forward() sending ICMP FRAG_NEEDED with a bogus MTU, policers
applying their exceed action) and hides the producer instead of
exposing it. If you want coverage, a DEBUG_NET_WARN_ON_ONCE() as in
skb_network_header_len() is the right tool: free in production, and
syzbot will tell us who produced such a packet.
