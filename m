Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672720;
	b=iOlYpeiP+aeldhroMjXJO/4sjFivWl/9VGI0JcoQ1f/flYSjjN4+vkdtQrPmIS3xbj+B
	 Ko10mWYoqklIE2e2p/+B14xnN5RiDA+kSCscOQf6tjWjSZsni5y5ghf2ryjQpGXfzmBkK
	 l6bOnO/TE8XL7b98KCaH505o5dVD8xwxazHrZkQFhE45DbuiTm0IJ17BWpFwJ3JDgkOSG
	 Sqj4iQSxl+StFfSVJw27xPcXh2UW3owx5mXvSsB3K3nhMnOUQd3phNeApE0D+FZ9zJjvV
	 jBUM8iuUb6YvxpgRtiG8mn91KbTw90CmiOV2thFbe9XkyHJoJHcdv9AVBsg08HiOl4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rAXOsiY7dgF8E9nvWQfWLqo1mF0hHpyBG3jPK7/IHMQ=;
	b=YGQnBGPg8NLNmcQpK7WQwGteQgUXrJC4syJjGzVkMVfDHj1dxj7DeL5pk+c6tB6/6qeG
	 Wp2KD2J4Sq8FVNJZMyPNGFHL7HT1E3EHYLYtgnm8dJrWu/vQYlP9nSVHUl9kTDZ1ST3Vx
	 xFFeRfmLEIPZ4a/uLYAGIxXM/SlDmeAxk7JTn3vpxmbGgKF1WMn8TxOCZ/Ktc7vUZNb4e
	 gQO+CgKCjc4Sp3YN1G3ngR8bIjYn/g/o/k1zWtNaC/G3uxx4TelsRdtv7pdySaLEcZ+0A
	 uJwMCLKkmLo1i88bEIVOBhEpfiQXluDB3Q0KucTEleFqPpRf7BIVG1FfegXO64xM6qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bCmLBMrs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C74606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79C74606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bCmLBMrs
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-55c7445cf85so114581cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:11:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672718; cv=none;
        d=google.com; s=arc-20260327;
        b=Wr0yo+qe5rVSbbIeVuM9fm0kunv3yr6Wmdh6IN3HZM4PqUoG1ERfZKy/QwieAoRiLd
         2gjVfszXOI+OcWAvyG550k+jjOui9LPeU0fvOJvEino8cWKr/jebNP2oHlg/3oopuP8A
         sIhDs1/od2vugtu0ReX4ovZen78HwrQCvFJrjpXZzo2OyHf9QN0nIZ8viRjLYmrHpVgF
         ESceNmh9lDZ29P4+dxKAZXP5s/+tHx7dAoASALmCGNzTPjl8PfBa0y3FE7YaQ0jHoG0N
         qs4TMC3qbcVpvbvDyC7hZT8K8IxlJpnhpsBm/MJd2FMlwQhO66hspNT7m7BHv9FDMw6U
         bQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rAXOsiY7dgF8E9nvWQfWLqo1mF0hHpyBG3jPK7/IHMQ=;
        fh=kZIP6oT63m3KwzQC0/X3z/mmtoJCxnDN5X7PaBJ5qY4=;
        b=YPVzmwvq+iu6+tpPmQGzlJ9pkVQxo5ggk1pyTsD7NQxew4BonNQ2zUX8jtsrZquAE0
         y03oGN6NsJQq41rsSx72i1kTdKtKDofst3M0Nbvssa+h3ULF5AwycQYgyT5cn4oaouCU
         FwhQRR8jRkHSza1KjkN6H22VdwamKkuKBZDTiTsoGyaqxTdDmexYXMJiwy4pZf9Rx0/0
         +WAXFtJ8oPOZepz555RK4kfcK9VguVxWslHk3tO9cVjBkUvCel3aEMfW9j8osHaGdt+s
         W4KjEEA0oKOit7sUR/VK7ni5oeGovnmDNq6U9HdhvoQ4BYYsnZ5viFu+0//W2CMbHlqR
         bvSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672718; x=1795277518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rAXOsiY7dgF8E9nvWQfWLqo1mF0hHpyBG3jPK7/IHMQ=;
        b=bCmLBMrsoS+E3FJJS14wew7hWIzp/cpZA9aiKnclbK84765KkPFQee3u3wA/T/u+/e
         Bo+/LU+J7yY8R5ef1Nk0gTxuxnjUT3vuIwzINP7WEWgIvcBUSnN3GuU9dvzsUq2dGtks
         jfWz63UG9DdqOtOTHwd6lGqOm4Z6zzPdtdOY8pJtf3Knv3LM3yUHrl2mjfZ0HAlH83Hn
         iQt9L5+xs99sc4ist1nJ0zfTFqgYoaM/OBm4uKtKqkM3oKRhTX8oc3YgJ2p7w/TYVTBy
         FjZ+qy2L1c+ZWy9ooKdoCo7qlx3z2rkDAbdEeK+OYnBqX4vOqo7PRBjSocymbAgDnw0R
         B07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672718; x=1795277518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAXOsiY7dgF8E9nvWQfWLqo1mF0hHpyBG3jPK7/IHMQ=;
        b=FNKTu8ziEtUWNQWtPQlYr7J3r+LA70dTtEqhyMLgHZ+xvzg+mN3TYAfbVipOPZdCug
         rCIk7q4vZnCGA1in42jX8XV2bBF+tLlG7aEWv6kA3UtDmJpb18LfDAcmPTOkVO8rCARQ
         Eks3a+9WFAh3L5IGL7BPQZFyWWTsVawEHZ81/8V4+BEu4/OjF5KlbxZCClTJoBKExEdQ
         t3KWyVE0mQLrzdMpu6K7TYZ9LCDiT4oIiX1m99QCWsJW8ZgHaRqHRPKVdj2q0psAynWj
         nIlyRmu90ZX6UEIqTjFCxVIhC3NSmiYPvwvncRJGauDLdaTMw1RAWdf7jmOFCmhjlMCW
         e5hw==
X-Forwarded-Encrypted: i=1; AL+hErFk4JEuUOMyy7p1a12IauWkEkUvCvrHwe24TEv6lbI9loKiWhLvHnUrrFC/JcFc4U4BJ8A050nTG4NIU/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ASAoBKjDSHQ1mZ2jLbJxFMlXQ/5uF8dPGv8M7ZFU+wetTTqq1
	MbUuNkJF0UM0AasJR8AchwSOAZc/o4u/dAkkKfzLSZzCvgMSUxxlFgyq4iG2L1DFQ8a8Ss4IiBr
	ZUYrY/uOj9CMOIvtGcAIrYYODuRgWP4JHhgRDF4Lr
X-Gm-Gg: AYBFou1fCrPJmNKywY8sFdx6gLO/SFKYxyFnxf1o82jatiZIsbLJtEYlC/tDGI/N955
	+w2cNLlMMr7XjY6sZguouFEPBHe3u8ccOY3xP2QJWcFcYVfr0OrhV2XcP/Mli4YCeKsIobUtPdC
	o/DyuC6MZT+CVryvLj7BVj937zs6bbZDZQ3KtrLtzbTruvRZ9VhqyVfRJ4oKamGH+sAhfkiNe+5
	rSkKWTwLG6mDIZRo07rejMnpgt7kBy25y2BGCBJl7//x7gTu8yYOKPQ+o8XxtJELMSs4czcXivc
	wv0418HPgAPYFjMbrbKrrMKa9UcvIIcVHnVs44RpAnN0V+kl0OBBh4IQ8NuEvYWVXzS8l1AnHQ2
	UsSg4eQsTu7KAiNMTeG+W/kyVRvugpfr1rn71Oxsil8LA69gnvLDF+7iqgiu7ljo9jTsta6cA5B
	75pk5rng1LinRHbisFigyUpAYlWSo=
X-Received: by 2002:a05:622a:1f13:b0:536:353e:8d2a with SMTP id
 d75a77b69052e-55c420acbb5mr16403621cf.1.1794672717702; Sat, 14 Nov 2026
 08:11:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-1-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-1-6f2e484ca8ea@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 14 Nov 2026 11:11:39 -0500
X-Gm-Features: AclHuK_-nV7pf1PB8PO4ykYtxVbAD9myD3UdJz53eZ7VZY4ZOzGRrnnpG944peE
Message-ID: <CADVnQymNTE-Etw4hhAgCAz9B86qzpFye9vZPkE_W62c2hY4Q8A@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/4] tcp: initialize MTU probing before
 syncing MSS at connection setup
To: echoowall@gmail.com
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, kuniyu@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:46=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> With tcp_mtu_probing=3D2, a passive connection starts at the full MSS
> rather than tcp_base_mss. The IPv4 and IPv6 syn_recv_sock() paths
> call tcp_sync_mss() before tcp_init_transfer() enables MTU probing.
> With tcp_base_mss=3D1024, the first successful probe can therefore lower
> the MSS from 1460 to 1242. On a black hole path, the first reduction
> skips 1024 and goes straight to 512.
>
> The issue surfaced while developing packetdrill coverage for MTU
> probing and comparing the initial send MSS on active and passive
> IPv4 connections.
>
> Commit 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> removed tcp_mtup_init() from the passive setup paths.
> Commit 27204aaa9dc6
> ("tcp: uniform the set up of sockets after successful connection")
> later moved MTU probing initialization into tcp_init_transfer(),
> away from tcp_sync_mss().
>
> Initialize MTU probing immediately before the existing tcp_sync_mss()
> calls in the IPv4 and IPv6 passive setup paths and when processing
> a SYN-ACK for an active connection. Remove the late initialization
> from tcp_init_transfer(). This lets tcp_sync_mss() apply tcp_base_mss
> without adding another MSS calculation to connection setup. The
> crossed-SYN path already uses this order.
>
> Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Suggested-by: Neal Cardwell <ncardwell@google.com>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> ---

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal
