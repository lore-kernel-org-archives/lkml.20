Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794134053;
	b=MrzlVmqkrDRJ49jFEZ6zDl9D1I9VqIpouEit+9kWPiMuuhio6gBZgaDS3en01KIJTvLi
	 xdB+OZa9xVLUhSNQP/f+ygq3iOBzN1ZZz2MvJsnVVFpxltMbwSd6pK5eYZZiGHdp7xzju
	 tq6u8SoG+KTEs5LGE9mxFXSkEPocosBTqXZu51FnIitZl6kksecwrg4qVksAc6AxRX+as
	 Uz9umh83wfSnq6QSXPZyFBWWuovx85eorUaHd7SlwCBBYDf4das1JIQ3acNiKOPRaK62Z
	 6v8MgigqbEdloVdE/Rrm6TtG2dMS7SY74UkRmSFxOdYhOAbVf8tiQky5aFUq03r8VsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794134053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J/swShSxppBoSwbD3mZrd1ct4q59pujSagZCIzddS+E=;
	b=dNyzLqzfDpOF6l1HINpA6ziU98vBStzyjxMQp6nV4Oc6Cd9f1WWRxzIr6BfRM5VtmDRP
	 O2QaMLUprdvUppRzVKD9gRfqVdSmjROIn9lipO3p7ZJ8foP0Uw0JxEqDvqne3LhQhRRpp
	 ph7CRCyhSSmplAEq+09scCzvbSPzNseEF/0CMkq2+FLXMfs396Us23PzOOwqyM4YQoaP1
	 gwINy1aDkOJwLEOuNFr7KWrbsQCHvERRj/qLHyK/IzAatA3ky3jz9oXeZxrZxHn5tDUyI
	 PNPLP8CAFopCvx0ugSf2/rvXf9fvPanReXXi50OKR/pzeLwJQExZ1dC2bW4465UYpcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfGIe7Ed;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809EC606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfGIe7Ed
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4f55a53898cso147551b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 02:34:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794134052; cv=none;
        d=google.com; s=arc-20260327;
        b=BwkOXy18gQrHuxGYsOwNsGL86SHlD8Ryv8PxscbBYMBUMzGJkFfphJUOMNdmHd3lke
         Ql4px+F7PrYbfWdv7RXYwu0mbqpOq3foAmsCUvBrRP51ZdDgyK7cwrgwZGiQC0idolCN
         +BmhY2B0omyTNMQPsso197t4tcAoXiPyLV99M2PrAM3V3g1qhMx9zajz9sj28vKxJaew
         S3E5pmumG6qVxRJp+pWpXzmjNh9+Ue3QCui5hwZU8iFKjua2sN/74X5dYkp462g0lKni
         YpIBm8SeG0OepTbqZTXZkS0AapT2LGMdcF+uRqEE2usHacHphZfSn928emcAVXZn4Vm2
         73wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J/swShSxppBoSwbD3mZrd1ct4q59pujSagZCIzddS+E=;
        fh=Cfb4iZ9TttQa61QA+qYEDGlbAegbQp8NtWWE076YwMM=;
        b=n5rkQ/K1piE8I+I3U64GfzaneTJviLq3dsclD1iHd4M/0yhqA+qHJLuet4M1dHrg5O
         dg85nAtkPiRWuwAE+HNE4eU0SnXAH5GKZ0JsZqiMcouyT/KpqlJ42uECZsBfyqUXfFKb
         IMRaH1qWR8SkKeG8TaqYaQAsuwsfu8p79xiLnETX6NoqhEopAQzQ4bTNoh+nygv6vktC
         GSr+Y7CwdWJzXpXJ544/Cq9ij2P1weNO6Q1DSIeuxmWRMwkI7b0OzXan0qJzx92dg1MA
         V/xigzINOFNPw9OevpNkXr4YQpUACR9mLb4WTL53uazwA0onUXcF8AuR3jLWDxaFfwZv
         ukpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794134052; x=1794738852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J/swShSxppBoSwbD3mZrd1ct4q59pujSagZCIzddS+E=;
        b=IfGIe7Ed/KP/4fDSWDbP4YNUxgrsz9WWust+TrzHRSnSdh5d6aIc43gOJLnBQgrpM9
         ZTk48cOjHWoHvubblbSi0jDzoUgnehnzUAS8L0dRoLs29Cn13WmOo2sFC7S407ffHutE
         nfwgUu2NSIWozam8AGIZfDTI9Uv5Gn5Zkd5RtPcIS7x1pNE5Gx6IkVmaDzj018GXbynv
         EDLICJ83SIuVPOgcG853LWX2bAAlNozOzrexbB6RVhWO0ipBPP3uYEpyUlQtWmW2g6Lt
         u0MKClWmyMmnpgdN9bwpo/FNcRTiAUg2bpx3mVc+X6+ksrBgv5lEuZaIRNV1YLMCXx1z
         VViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794134052; x=1794738852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/swShSxppBoSwbD3mZrd1ct4q59pujSagZCIzddS+E=;
        b=URGVYkk2gq5yQ9H6a172hWNv+73KPENsnHHyntsWXJFiv3YaO61tjydcPCGn9muhxS
         HmK+qv6+e217dLKFm39Bzv5TiY4UzKrkVQeU9taVl4gALUwzzCo9/jUF+KEgI/6dBBKO
         BGWv8PWRM4Gat9tFHKTdNov9eWwOgBTawIS7QEUXku9zf/EqsCrXxXjHH6zcZN97jzFl
         0aaKc2NSfd+FsqoPDQ93on+sXr/6UnFslC+zJc9HipajlxgAscN+r7LHmoAKhpefw9Sq
         yDjFOzvh3AMAb/9ylihy70fmhX0v7z01gWla0yuIpaw8GJru1qyOrwdLSwcyP2ckpiF6
         f8aw==
X-Forwarded-Encrypted: i=1; AL+hErFD/QmycutsX/tyIO7SJ7Z24VM/ECRUi4V1k/cclrsScmOmVsMfOca8xtrNTsWbDIoaxFoP1PtKRbKMbJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sdGOihRU77eT4dZ9906C63S+OBVtd2nHGjGMk0WyghbjgOYUj
	gAIdFcuDwymFiVCPgDBpdbtlNbA4txB9Ywctr7DcB4OWxrejJzwMIpknnJoq2z95XhVESISCoHn
	j5TDsz7v/I7Kv2kjfBp2wQ1sHX14BD6eZDPVg
X-Gm-Gg: AYBFou3y2tOiZYJU62Gp4231QK/H2oaVDHKTTKfjBQM/jKOSqmya437fBnrOhtZmLAT
	FrG6D+TXRRIFVw8PQ2Qs6UBvCwcVz5z1h9XJ36xrbvNzs7BrrPe7n/6fifvFmY6yimBiiCDXvAN
	9vkd7/U8VeQZPwjvtthMRpAD5GMyQSVsqX3N2aUUb52PVl/Mk8CEmRy/AzKJ6ovg2v2szrBayLM
	B8NtFnfo9DKQU568fKUYga4ty2/rP21b/TO2oU2M6jFWfhd4DSU/m13+74La/xaOpz2y/WKleiD
	KYrAjYYoTd0JyBqOeXrhWKpcDMy4uaF2Z4aD+LaWLS/lOxI3IYe6uvcH5yjTUmSqZeVUQRpX5FO
	MepTqngmEqRNsPykG00GvrcUohKznexs+6bYGhQ7ijqeZmVFAh7VZl/7LZfsSTk7vhQ6YT906ww
	2ZtRcWd2dJQS0GuveD
X-Received: by 2002:a05:6808:4fd1:b0:557:308a:9e9a with SMTP id
 5614622812f47-5681446e786mr691736b6e.21.1794134052341; Sun, 08 Nov 2026
 02:34:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108101648.1308271-1-mmyangfl@gmail.com> <179413333835.488859.2320463860948262077@kernel.org>
In-Reply-To: <179413333835.488859.2320463860948262077@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Sun, 8 Nov 2026 18:33:35 +0800
X-Gm-Features: AclHuK8NWBEv8FOBbCUFazup_79-wSN-B8rdsbn3juo45PyflMowuN-N7e3LR50
Message-ID: <CAAXyoMOnuAY57Sk6Ehn_LEvA-mc31Fq2x8+2se5=BtAgC7PgaA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: motorcomm: Free the MIB block on port teardown
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 6:22=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

not a fix - explained in the message
