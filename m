Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793319508;
	b=nobTFzmXQcThxfk6Cw9Z7tZFe0kVMxpdsdPYDEghZaRcXTi6hExq+nXfk3M8WBUgyB8k
	 UcnHnGOcLPAXJwoBCY5YPANl5TUlBuYVjCOGBl2dhSPZdE+xI0+1rIfCcu3t0rknygHip
	 nf8XE7SyGQd5+4/iDEG6urEQXC8AKi77T6ygwbtLPlWttzWH+yikLJjV4C1jMzE7SlHzX
	 xj5zRmOB4/MeQantirQ7tnCkjSs898BrHswMm2wxX0L9tw0BkUuqiEcNNueuuF+bgomyh
	 tDHbqFiJhAcD+eWfA9SL0zuVX9shWOGExZynIMMDf3DF2HfS8MJ3ug794Ye3C8UZT1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793319508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S5DSU31pXzY2v2OdMcYxNjC9qvtcKKd9XcG8ttX3g2I=;
	b=uWnl5siTlDYlTeF2is6QgzAw3CK0Rr/d1yTQH8AJDjC/fcwsmvHdqRZTheMVV236MkTi
	 nEjQJEu+OkK1JsINBomeCVkXKqgWtLPyhsbuxcoeIKsDhturOIs53HTfDfvr4VOYRV9cf
	 pcBNKvjInmw5Oc7YMjPN0ym6r1w2FLAqXimDJKMilTZ2c/Lrkp9Yo+FH3tpPI7pc9Mrnn
	 6lhkfKa2w7pObIpGb8n0DeS1PP9qx2XhmFHIWR9drt4KtuXeEylWUZdqMVCzWQxNnRXG/
	 fzN/gwwgq7gwsBwAjvJyYc6R+MnjCZRk6+0cQkJ6QD44iiBXueFGM56e2K2E2qaeO1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=khdGFdjD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579E2606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 579E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=khdGFdjD
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so5430a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793319507; cv=none;
        d=google.com; s=arc-20260327;
        b=mo5RKrFkGnfbTNX9yai0APXpPpN4v25TpeB96YhBT7FjxIxYJaNbjP4vXUotpfvYEj
         NfG5RWnYAdn2qypG5kNYIAqwhGFCAWoh+ishY4AjgDUxcFzF1Yl1pI1yVDk0iFKTPSiO
         o7UeXiI04ly33dneizL1Fbj1uL4r43H1pWnRyribB0Ajd3XTvJZ/CdZBpsj0K+N+27mQ
         IAK8o4C1rn1KGGPblHEZzKA3GwhrRPABiTnMJFfszQ7n5HdZGfiH2YoauAjl9yyn/lxH
         UrZWCsnHmiZZ4GsgTtxhSHh9vQl61rodtMQsGfeqBMHYbmtqca/tKVf3RjNREc5Fj9Rm
         yDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S5DSU31pXzY2v2OdMcYxNjC9qvtcKKd9XcG8ttX3g2I=;
        fh=FW0xgKxZdG+32usUaE75lFv6RYUJt9kxkIRghMHlbfM=;
        b=Z/MjZuvgjTkihhogQA3clXiItAZ5aSj1/YrTCV4hgwo3dNtY1V4vbQlAKUSouctevo
         FheQ6dpQAxgHPgCMkkAX8UJWwXpKFgSu4aqt+pJqur3Xd6rtbY9oRwlxx4NwVp1VgMQi
         m4azvcgU2T931OW9TxJBHVUFGR0eSw67p3PcehK20t9KgauQf8o7b1WU2lCt+u6P+fCh
         tmxyXT9+rKaZaw8Knb8O/axFSc8jYGV2KYSyfsNFCBxcYWclUs0oGWCteiW149FqWtye
         FtEtjQcxOoaNL8c8Yxy8WWozBWntpHlRTICy/G7ekd346eANcPpFsYuPBJBiCeYVsgTC
         /jyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793319507; x=1793924307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S5DSU31pXzY2v2OdMcYxNjC9qvtcKKd9XcG8ttX3g2I=;
        b=khdGFdjDFpOqYC8MJ28K+ZFEyclaWMJe9IFj7hLEoAqBgyxPF2pcHZ6fgec1TCOwkB
         NkOxqBwqUK8iuT+O6pEu+Y1135bbQ10CQMfb/E0jCSMQqEmI2cM1DcyJkeTlleUMVzgM
         SU9cUzkwj/0K4CtbWW3w2X8QCCSGKzAWyG9q7kauVOzqmin2ACDIuBS/3tnkTF9ftEKM
         HVRnqucADVSX4zdAFio1SMY5b3fbLh8JhG9pr8vYwr6CxPe8Wpo/tI7ktMa5EKoroeQb
         2jcF6at+dqLOpNeWWniaEJv5na7Gc9fvJMYz2FnUZHJ42RR+gcLWnAFKXxzIfgq/JEzR
         lZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793319507; x=1793924307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S5DSU31pXzY2v2OdMcYxNjC9qvtcKKd9XcG8ttX3g2I=;
        b=FjjfAkafwk7h3GBkCfkQ2479yKC+8HEzqhLJH8p/I5HPCaRqKgAZDVSP+3r97YRUUD
         rpko8GKC86TnWwD805GbS4SN8D4ns40jr4Xn5DJzPr13QfCN7EL9Rq3DqEYPypM7Luzi
         JuJN0a8HNjPaf+78CnaECHNvzuVqOIR9cBfhGB6X5Oci0gU4ORpP0EI2i0aliieWCGup
         I+lShJf303rYG6a6xO2OL+Fu+p+ZDv2s4FxSXDd/80AqYiSzHED/gTjpkyc1RmuWdtuN
         hDLWZr+P8kREwMLYME1ihO7/HRzIGrq0FlJiP7kNtETeslVShxL9NHt9nmnK44WtZFJf
         W8pw==
X-Forwarded-Encrypted: i=1; AKwUvBy1EKDduyOXt2KbqkPTWY3KUZHz+RuQ7WtmcdhSUSfzNSN0Dnv+z+OWposSxOc6sYsgcGQzOjuNO0Qn7lo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzrbufIt6/E0DaXe8tpvAeDwEXJMmatJWm8z7uxjRf5iL/T97J
	fzw9UZB3O5mxRBKIt+R7RSs4igUXJK71n01speJiPgqHOBEoKfhpr9jpLryuJkwFFV2e58Y8ETT
	KPJ/C+cnWQQYfDf/1+sBYBG4Pq18O2javR8DXE3li
X-Gm-Gg: AYBFou2prY+hGjePYjC8pXPBBaMYnKsclTS4Hx+dhH31BpGMJh58cWd46P13Jnpfppq
	aqlOQcsFt8UBqL3Ks7GJPnffD4Vxyi2Di6OdFgDPtK4Xk6TkEMrQpRN6iC94miZ1d65ljwZwwru
	fTdTF1/qv+26BKPxfUcRw8tdqWbGMcM3xfEreFrXulyj5Vs50C4/qoQRKip612gkCmw9qTBqOj0
	av77WaeEeTVRwax3wuFEhFA7B++dyhJkzRIsMQq65BszvSHKKD1rTmOEpXhJM6buJd+iv+u0bYu
	BA071jZDeSNQ+nvwjhjtcH8uKfK6db12dsMSy/Av3XQBPJNMslgWGLv//lczmjQIEnoKTyPRUzt
	gp6iiTHmcrG8m7DKzy/faZMjwJOo7LGlCqdY=
X-Received: by 2002:a05:6402:a20c:20b0:6b4:2d6:cb9e with SMTP id
 4fb4d7f45d1cf-6b4b0e90adfmr140391a12.2.1793319506250; Thu, 29 Oct 2026
 17:18:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030001444.289973-1-omermetekaya0@gmail.com>
In-Reply-To: <20261030001444.289973-1-omermetekaya0@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 29 Oct 2026 17:18:14 -0700
X-Gm-Features: AclHuK89zkJqX9oz31JoSer2NQVqLZj3zAgbKT6NjSS1tQOfjKS1pGrNQOfrUC0
Message-ID: <CAHS8izOAYwGR_ukmXNq8V-wOVDxGu0TWET1tjGa_nXG99LFUmA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] netdevsim: reject port addition and clean up
 ports after a failed reload
To: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jiri Pirko <jiri@resnulli.us>, 
	syzbot+88435e204734072bf39a@syzkaller.appspotmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:15=E2=80=AFPM =C3=96mer Mete Kaya <omermetekaya0@=
gmail.com> wrote:
>
> nsim_drv_port_add() does not check devlink_is_reload_failed(), so ports
> can be added via new_port after a failed reload.  nsim_dev_reload_destroy=
()
> returns early in that state, leaving them behind.  nsim_drv_remove() then
> hits WARN_ON in bpf_offload_dev_destroy() and a subsequent use-after-free=
.
>
> Block port creation with -EIO when reload has failed, and delete any
> leftover ports on the early-return path as a safety net.
>
> Fixes: 75ba029f3c07 ("netdevsim: implement proper devlink reload")
> Reported-by: syzbot+88435e204734072bf39a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D88435e204734072bf39a
> Signed-off-by: =C3=96mer Mete Kaya <omermetekaya0@gmail.com>

I'm so sorry, I don't think I was clear. Currently net-next is closed.
I should have said wait until net-next re-opens and THEN send your
fix:

https://netdev.bots.linux.dev/net-next.html

And yes, normally fixes go to net, but the volume of fixes has been so
large that non-critcal fixes now go to net-next.

Let me try this:

pw-bot: defer


--=20
Thanks,
Mina
