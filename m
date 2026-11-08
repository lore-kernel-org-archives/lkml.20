Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794166030;
	b=Fkc4HwliqDtNHLw0R1TSCQlHlhVSzR9Uas9qKkKV3e91fFN5Ml1BMjZaXCtSvR9hRpwX
	 /hY7lBlYh0aYqtr5Kkj/RP5AWLulMTnRW45pUdi8V/8oxTBIZJmu0gBMC5ZFNXnbB9UzB
	 SHbONw89HAbxpFJ4k4SSnjxgbHtkoC+Yo3MPkN/q0Qmfst1xvn1GdeMJnP7lMpxed9V5s
	 K2mXG+6hi+RudjXRG/ySxgIqF7URUzRf6g4yGys+z0C2/JnJXYBX0Kok6YCfTDSQzj9VM
	 CegQcenaiDUI6/LX44FcSbyrMpwdjRyhgtI84ICixzpbM43RBIYIeBLM91LXJd7iEkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BO37IMunpFsRap9NM4xeqnXFrjMV86qXDOv6LcF5YHA=;
	b=RLJbFBP3u7JRWVAZ7FIJZawO7MY4b2ofeEdkhP4jn6FgHaY9+p+Y50/UFzhW4q8dni7E
	 VF55Cm7oJcN0zTOEjoZZB0JZxp+gjOII2P335k/31C/Sc38Lsp6Cg47nf/HQ01r+64TkO
	 N3ODKc2EmbpYuAOrR5lKFQCW1QlkK4h4GNADESYHOKk0W92hqubTcydxJpxrsncMimF5J
	 dakK7yyKI2ITIuzCqlrMJqqJv10Ecn2l9UeKNpeSZMxcYRDmasA3UkU/OBOGBn1LtIL1m
	 XibeSOMshnVya0FsrvDsUrcLfHEIiWYMGLT+V7xjRZShHmMPiE6puIYq3cnsxaPMnTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="czutAw/j";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F42606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F42606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=czutAw/j
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5383c97c8cfso49041cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794166029; cv=none;
        d=google.com; s=arc-20260327;
        b=dz+IBSOEgnzjm23qgXo16L7EipGX5iqS3vZk2jpTV6oG84Cr1iuuMJohPteF/x2NVB
         YfRLhWgbmplKaTpMCB4cacp2ZPKGkzSp2GwEyn7dlXtaKN5vU+byR9MDPzxsEfW8gPFO
         K2AeSJPy3pvfezTx2hZza3uEk1CKRSUU2LqgFgCvZ7ICkKwos6TgHa4YOmPZyD0N4oaK
         BaVwSpWqmJVIJN3aL+yBGeVNr4J2fijzaK7+/h4s2LmfjZiTqDi/SVrQN3cQJwI2RT53
         EVqExaEg/0qyeINVeYZK7OsmzoDS6ZBazh9Wkn9R8jJOaAqtiJJ5AJ7+2vL2TRzeAz29
         ZSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BO37IMunpFsRap9NM4xeqnXFrjMV86qXDOv6LcF5YHA=;
        fh=Qb8WU6z8RSW4gKjaSSHDIpObnyI5MNjA7YZ6ujPQkNg=;
        b=QU4ruqKTkFAn78F8kxX2gJSB9Lvh74GEaEAKT0YAPj1sVpGttZFnd16uEv8NCzj1HW
         grwzwOVsF8GMcIgdl0n/LMklTXXJGf+MNajXBcO4I/Ds6ugt7TTXDYuJBFPM4Go5pz/r
         1RROc5fWSygJh06f5Ew3euf6XMB+pnItcXJImNnHaLpBLeOc44Rx1nnr6ecvrG99HA1J
         Lw/PifKcebJV7Vp+aMWgtWdXHbJujBar0Bwm7W6hpyEUIznDJv6huWQUL/pM8Tl1c5q9
         vzT+qojMgvo7Udsx6truhe/3yjuze0Uv81RZOC79Xhsze//eltn4WD/lteIRuphA+Iua
         thIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794166029; x=1794770829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BO37IMunpFsRap9NM4xeqnXFrjMV86qXDOv6LcF5YHA=;
        b=czutAw/jdxttlNeAE5hjzfXJT8dJ0d3urmQJnKzcfRWAZR2oa9LY5teW/l9LiV+5zp
         iGm/vKnvU5qbpNbkDdDMfyiwuwBO9nSK+xNSNQhqcg1ACm3PLri0AtSCurgN/awEoVBg
         z5uj+II6zPHXH9ub9Unwa8ZMPEcpvuT1WmrJaxEoPk3MJ1GI3X/wy8JX6Y0FctFzRTpf
         dzg3KqZnmzLlkTSaM6HYMBQSczmEgITk4eq9lUSsPrjDG8TGbgZGi9zBgPQaeU1mWxsv
         hyHu3Xr1zxy+YZGMFFP8jBmBpSvyzT2WfIOMtXxuEtE6N5WV73zUdRCvT+8BKfGJs2+E
         86WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166029; x=1794770829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BO37IMunpFsRap9NM4xeqnXFrjMV86qXDOv6LcF5YHA=;
        b=qBPqpWYb3WUxj02tI5P2tjbKsmj1VqrU0wU3l7qRXux4efTHjFqCBOUiCGxLvcOHJ1
         KEUVJRAFx2+aqK+2CiOkTwYNMq6Y+YlBQT4gwaS7i50i4GmjXUj3vUaQ2LcIxPYcf0ml
         PxqMRljaQrromtV2Os+H7qsZYWdNQIvfQA60+HVL1yyUd3oWw6FeBzoXDryqRqkgYsRf
         V7JCsAEmvNv2QFRmHk5H0CSz4WTHogD+YKHjQA5xivx/0CzoiraEYPLbj2TBvN9IAPZd
         ik3/rggT7+P6a65CC5JUtlbtTnPMCa/2D8XKxsgkNUGPy4moQk0DmDtfZBZiLZmQwhXA
         LTRQ==
X-Forwarded-Encrypted: i=1; AL+hErFiA2ONOj5KoHBT8d/RRDKZxb9ZwCIFOusBx/XxWbBewSLa3ElFhLiHmtOUkOkkICKxVOmufzOp8msGV6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NOGlhJczpCbiw9kC/mXDtTKLavWTCvz+GOuwA7C7aU8XCJuru
	tKenpfb4U8YWpHTDmHpsmiqUAHH+7bznk0RX/FZG0I9/lZjZ9/tzolPl113pmgqCqxPblIyTNJl
	gVVQZ2i0VIfdsK6xmwIw5Vqs+OKlWArQJ6s8JS3w6
X-Gm-Gg: AYBFou00240e6YiKgDM2n8KMYpCpz/ukgtHyV9WzXJwd5qZaDPrSMat9JuTPxELez+v
	anGijg68WESgreAQBizPshxgKINM5dTRFCSRfUu+V3Nmjhp42MDUnY4861K9CIuP7ua2iRWgsVZ
	66zrzPFC4zyZwgzPLrFdrMK+Yphrp3hi2Mxbhaem/au2m0grf5LC+4wQZH/CspIerfpJA78XDS7
	yoJ2vnlKO+uIsf3XxJafuo/J/daRXGbZ1z/lSPiBSV+i43r74GsPA+5qsZtpZRp8p/WlS+3Tpl3
	pdS+K601wwxLi+uy3bkYL3KdrjOjtZQcSa16raxM+j9Lcjx6jG/tfzh3X0Xc01lcyzSraJN8YR/
	PqidkTCLyG1EiapxTRWaErvaLBGI2HUYJri4EhZkaYjhDH6jZ6VWUNZHwDr0Bqk7ZUlihFok865
	hgmWNvxGmg6ETP96bM9A8c7xr7iA==
X-Received: by 2002:a05:622a:4a8a:b0:542:fc60:fe23 with SMTP id
 d75a77b69052e-54fa22f2df9mr26125631cf.3.1794166028049; Sun, 08 Nov 2026
 11:27:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com> <20261108-mtu-probing-series-v2-4-355d6490c3db@gmail.com>
In-Reply-To: <20261108-mtu-probing-series-v2-4-355d6490c3db@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sun, 8 Nov 2026 14:26:48 -0500
X-Gm-Features: AclHuK8zDFeFkG1trZEMSppYXF-uzQmF3qY-1kqhwEX4JZnkZedZbD6YsibKJOI
Message-ID: <CADVnQykAX6Fw8_86emqtTUDWgFzRd_jXTZKdDJLb0s8AUmfUaw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/4] selftests/net: packetdrill: add TCP MTU
 probing test
To: echoowall@gmail.com
Cc: davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, kuba@kernel.org, 
	kuniyu@google.com, shuah@kernel.org, edumazet@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	panweiping3@gmail.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 9:39=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> Packetization layer path MTU discovery (net.ipv4.tcp_mtu_probing=3D2) has
> no selftest coverage.
>
> Add a test for an active connection. Check that it starts at
> tcp_base_mss, that it sends the first probe half way between
> tcp_base_mss and the peer's MSS once cwnd allows it, and that an
> acknowledged probe raises the MSS and leads to a larger probe.
>
> Disable TCP timestamps since the MTU search range is computed before the
> timestamp option is negotiated, which would otherwise make the MSS
> depend on the header length at connect time.

AFAICT with patch 1/4 of this v2 applied, that is no longer true:
active connections now call tcp_mtup_init() in
tcp_rcv_synsent_state_process() after the timestamp option has been
negotiated.

So I would suggest removing this paragraph from the commit description.

> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---
>  .../net/packetdrill/tcp_mtu_probing_search.pkt     | 43 ++++++++++++++++=
++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_sear=
ch.pkt b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_search.pkt
> new file mode 100644
> index 000000000..65e466fbf
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_search.pkt
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Test packetization layer path MTU discovery with tcp_mtu_probing=3D2:=
 an
> +// active connection starts at tcp_base_mss and raises its MSS by binary=
 search
> +// as probes are acknowledged.
> +
> +`./defaults.sh
> +sysctl -q net.ipv4.tcp_mtu_probing=3D2
> +sysctl -q net.ipv4.tcp_base_mss=3D1024
> +sysctl -q net.ipv4.tcp_timestamps=3D0`

AFAICT if we drop the tcp_timestamps=3D0 line here (so our SYN offers
timestamps and the scripted SYN-ACK declines them), the script should
pass unchanged with patch 1/4, and fail without it (2072-byte rather
than 2048-byte TSO packets, i.e. 2 x 1036 bytes). So I'd suggest
dropping that tcp_timestamps=3D0 line. That way this test also covers
the active-side part of patch 1/4.

neal
