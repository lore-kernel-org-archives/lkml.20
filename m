Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794415531;
	b=2NdujrmM8ta2/xyhY7XuDVm2YWET0YIXexoWvuQA2opHghO0ILvlhYYSk5wjLNhYq4fu
	 x8vZ/hgEFGmzpiun8uJJb2LpTPBojxArv5Auz8mi5AIriRRdD5p4gf8OKihqayB4oWDEn
	 KBa5+pfLYuMq/EW+K3pzPhi+1x4Zugmk57SaJ9IfELFlAJvxNZZFm6Ecf8cK37OnAYyE0
	 EZvFGmxCJ31KHMrMR2bG2zwB5P7e4D4j444eUznY7WXRkMeFNKkwUIZMSDqtrOUb7g0OH
	 +x1cf0fc8iHz61P3TCsVDoP7yZSwev6sOcnw0/IJD9rqMCXq8JQY6+tThCFwTUYtTiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NYfQE24rcCL3ET4V0w0obYmaTrEBQ7wONKSMJ15jXBQ=;
	b=H1TiM3NJK9vYDrkt0RIx87TVIe3yAhRJeOGZokiPeJCF1X6jh8Na3VPlCziUEkNHA4fY
	 E1iL5U+QUqhCD7ebxSoWKyHi8FSit/1RZf0FwDNcJwwu38XosJhs0A+t4H83uQhkRA2GE
	 0oFIHWrmMZC4cTiBUFDax1COZ8Dbv37PhU0oLiOMPf7eYLLWXSrZxoY61T/2uyfhrHzzT
	 zZHR2N66OPVXxMGHcqI1kiSLX/w12bcRTyku6XS1OaC1rwrtAHQgYH0G6b+/QMkFxCEDk
	 /QP5eI0e/V0909hpM7w+MhPIS4tY283PuWXGIyKD2U2oEAmrdCrjc3+oZo/tw8UsiDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIZH3DQY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C1C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08C1C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIZH3DQY
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6aa9606ddadso1940069eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:45:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794415530; cv=none;
        d=google.com; s=arc-20260327;
        b=gXa7mp0qH50ohnEPIVgSXbysiYdViub3Gv6JZaAcjhdtK0E7MyfXlbRKARezAsz9Is
         TEzXiwNwppo5fCyHY/8S2MupleROYz7I/SFu5SSK/PPNNelBAqk9E1Ctp3EZG9zFarF4
         GW3hbmEYJ8TXCeFIF7UdgVM5l/0mGUbt3hujx4xStmMe7Z1stYPpefettAs/rSiTg5rS
         cUXmg4G02BA8yQaSWRLyyqBTxON868P9rXUiffsLK6Oi67LYdUUSYJ5rCfmsF4LWRNXz
         NcJ6IajkZcCrRNGl3zjZOA/0eTG2ed93dFyPyJeIgT28pI5OTY6hxYfX7IJ+v63qqC+9
         SKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NYfQE24rcCL3ET4V0w0obYmaTrEBQ7wONKSMJ15jXBQ=;
        fh=efieAJZtoLZ/yV+RD/9VYY6x+BhoiBVkABBRIV7DFHs=;
        b=gvL2lkfht5DIYjNkz5UVl/RPO3QwwuLneTHitPHlnS65MdqPtx2rjuvJxtB4gKQ7MZ
         /QLANnN+9Zxg3FB0kYN3cR7aklHj1hxwZB44jOtnhpns6viXymcqsGFbF2C7wzMkvjs3
         N7F66gBmknicwC/hkKEC4WdITF5+HUqLgyCUR7VWRoocfcy3pPOUoahqGHSFakPkUGpg
         RqAda6XGv3CGAVhChafRCGxHA5ujSRqNoV6mcMaokOp83Km5o0X9CPlnz5c5vN8n15Uh
         gecC+lRcBhURdKWCrpOV//ZicRDjvHQ28I46U0RB+OWPu9Y99iHdDKghPugr3RZp2FWb
         VoAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415530; x=1795020330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NYfQE24rcCL3ET4V0w0obYmaTrEBQ7wONKSMJ15jXBQ=;
        b=eIZH3DQYvWCLFcN6b0w6H/jQlcOtH69HbdfA5AKWKoj+GEuH3pSVkFT6/4bDSCqiZh
         S3HyDCED/cNpqq6pgpSPimiopfytOJ4Pve0hPfFmyMtyifMNrHKxOblqWMj4az49i1L6
         zyqMfXaFNHYNfeoL4sp42w4z60VvvD01/S1Iz6/wbhyy6tdr0+5meIhlvdKesTaa5/HC
         5jO7Y+5Nl7sTYQjthFE/pqP9xNqK3U3RU8e3Jk1Ix5GtQB9vcIo0JI89+j5MgiRgsE8t
         LdPsR3jRT+0YWV7fE8X+K0v+zA42O/eQQknE1sqQt2j0URdlzr9sTYGSiEe3AK7nv1Md
         kb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415530; x=1795020330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYfQE24rcCL3ET4V0w0obYmaTrEBQ7wONKSMJ15jXBQ=;
        b=1+3eAPMt5tp0AI+U0HLZBrlye9yhNyg7U1JFtXlCUD2I95A+tAQZNwG2++Oglk+lxe
         0WlTfi73ehQ78KuNVPv4h+TPUJ8iXD9IDQGNxEaKGxVrlh0YT959YSH1iCoFfTnyQ//N
         2wqOrle8gP4dxIBaJJ82Z52od17gbviMYQIH9O9B0NY6HNd/3l1vPlZvcF9N6M/FddFf
         jDJ+XlIlossoWVwi1F+tIHKs9TkMn7krwhULwYpo57ZOgcxvdSqbFWaU0Q/PJC5El/rx
         04cKGvV8Vdg+iJsE83B6y2W7stbQE9vDKf1wtfO4QDoPg5nTWHDVBGOcsdr6S3fdZWWB
         CU/w==
X-Forwarded-Encrypted: i=1; AL+hErEvwo7KcQ+4jECucHUO+EaXZFsr8w4oXf3fgOpaeouZcOtqQf36dFkFtWADZvtz3G0RZaeZTVQx93sD7IU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ondO8lIfR5XcXr7/nb2s1mZhN4PYcQAUtmWGJpvg2m+sokPf4
	2NT7QDcrcwzJsTMg34TIIj2Q7pPHM5+CWSXDv1NKYLEhlftldC+24eRCjnNYa141BfeuNN+jYmt
	PiS2qGYEK0av6WkxD/slcVWZVnCWbnhQ=
X-Gm-Gg: AYBFou36yL++4L5Y2PDT55Fa1eecXKznmfP0Lo4mTEcdcNjCgkJ/ZWHk7vIz0YNXA6A
	eM6UJaT6ByhKs3h/8tNrQ+QUmPeWctURwS64JJs7v3xkKD7yqrMgzRvASZTKTZdvYlpLBGCj1Qh
	MDMBwA2OnEty5kwHBmfNkZkT61fZUkORHBPDu06SKdsR9X8ftP9buVMWQk//ytjJZXAfp3Oa/3I
	PrUSTjKR5cNNUVKgrYQlrA6rFEYQEU8R3xlXVExAZhIo+LjkUkci/NNadLZY14K+7CHPISY2gUx
	IyqW8qlCeJLQwSv56pWlJwJnMe8Mxwdr+gWJqUNUyiaDLYU8IxWFKHCmniR2bulODNdw1+OEiA3
	HPwGWOCIxBTQbWYRC7zQkDkF7G9+tkApvukbt3t3QkGMigJp/AXRmWLH3+HTEdP72ERGPoh9hqc
	ZIw6bXJZUjiMziHm8=
X-Received: by 2002:a05:6808:4442:b0:4b9:e5fa:8903 with SMTP id
 5614622812f47-56b961943a4mr2467100b6e.22.1794415529378; Wed, 11 Nov 2026
 08:45:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109153407.1761032-1-mmyangfl@gmail.com> <179441151084.2199510.11035302452325241587@kernel.org>
In-Reply-To: <179441151084.2199510.11035302452325241587@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Thu, 12 Nov 2026 00:44:53 +0800
X-Gm-Features: AclHuK9SuMIDImvwgyuePoaTCeasdPT2EycqKe2EK8Pk9ehfERFg1PA81NN2qcw
Message-ID: <CAAXyoMP5hQC8Jgg9LgY-X59ftAGThOMXVf3jTCmRzUPjvC+Qrg@mail.gmail.com>
Subject: Re: [PATCH net] net: dsa: motorcomm: Do not inherit ports from
 dynamic FDB entries
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:38=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] This patch replaces the egress port mask in yt921x_fdb_join()
>   (drivers/net/dsa/motorcomm/chip.c) only when the existing hardware=E2=
=80=A6

Looks like a pre-existing issue.
