Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7C7137750
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791733571; cv=pass; b=Xy2O2+Di9dRGr0vWIxr8S9FZ/TUBKIaDMPpQ4tUS0IlEj72wX0xoxvZbodbxIwUj89FuSobhCSYP5hFugs1dIJ2l3OH0Tk5WPRFXkxpLr2Ig/S2Tf0qY259k3sGjmYdofOrvD1bf5/YqY5Ky14l1SpH5ePHX/kL1j7YrdBvvllo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791733571; c=relaxed/simple;
	bh=rQXlRoSMdeeZu3l+07GtH5SZ02qfTqlKbUj7DiEyiPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXlMc2W7hee5fAx6jcUx2NiaFTq2Gevt+OnCjuaVZvTQtt+oUHw0hrGDVuE4bZ6SXfaL0m2XcpC5RChUym0NZAExrYagMy1PiJ1uXqmTw5a5rXC3ceclF4fyxQ9VfMQeT7ahOnyjjZOBJwbKs5IlRocM0Rv3UsfScdOvWwWTtH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bb1NoM/0; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bb1NoM/0"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso1887a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791733568; cv=none;
        d=google.com; s=arc-20260327;
        b=YRomflnaR/FfOXaXTihsKwn+JRYuWoclRe2G5WuW/u85JVNUbluTCTZy/gOfw5pY8h
         sNPKEmhcJacz1U6jztsuSYN4MfVWdLB6iNoOCIgcLo2bOKLYY/Wrz81HxTKYYTW3DA1I
         7uvZ7V5yd7qVEkcZqX11es8UHfVSrCO/VYq0AuSNW2+RXm7xbCFx1lHfoaBJYM+QythJ
         glLw9IQWjvGUrej3iCRTI1wXY7ST7EsjnGKMBetgDI1wpYwo2YvlRhIUyhus0TNw2l7u
         4k7/0hnVJGNcdUUvg78FoNe1e54QzFl3MJxg2TTl72eeCL4F5dSuygy6m0KeKwDtOT3w
         pS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NQ8Y8vCXDwvbwSecDA7aeQbHVXaWb6F8hoqdYyLqgk8=;
        fh=7/cGYOmjVIF0gUJW1bmDvR4N1IEwABE/MBpLa8eU8ek=;
        b=O4wU8d9hxX76CMmu0nlfxUmlzJP2paD21NWugE/8cnsAVFxECV1DtjYWeHMxXPRf9r
         lom8mcpRKOij4JpazpMdwYADNRnYBMyWbCH9+hE5aO23IHqj9DfsLuTR3zKASFFbZ0R7
         ObLenWHQguyA+Q44H8B5x0L49x9ekC62T9FcwdcDGUx9WbZySytGoVtMhWbqhbKT6JLh
         DZAJpCIZumsCLRfidU7Vt30GH1f2prvr1Ifroogqj4XgkAIroGmK63knD4WcAIskS4/f
         vsh1V+vcFyAJeynSpaX3gF4cRFUk0CSoNIfBrkE8154YyxJDDc79nCJyRmvomiSaDUnQ
         2ZrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791733568; x=1792338368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NQ8Y8vCXDwvbwSecDA7aeQbHVXaWb6F8hoqdYyLqgk8=;
        b=bb1NoM/0kjC3EZPLOADjfmsOI2AQCH2n6T6TghzdLY+guq/FGYIsanWSG3zffP5Xj7
         QHJBhV0q/EloM1S64F/m+qAu8lGthx3RptnqL42H3hy9acmGvXjiPpwM4eDDW/Iv6RcB
         QF1/LbVZ6WPPVBxOL1fyi30egNQFBSy9yOgEr8NJYG7QgIHkyjfQZQjmBKGr77WzoJo/
         vJwWm4Z9jAknTQkYPolPauhC4bdQz49uPFFMHkqSITo7EoBxDBjPv+Xv1P/O9ZoIYkQQ
         CTO5HNbIJ0klplJVmyWwbd8RLxXTU+ryvub5Q2RnVNrp/TMqqXNMCxa/ndYtRffV2Q1o
         TB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791733568; x=1792338368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQ8Y8vCXDwvbwSecDA7aeQbHVXaWb6F8hoqdYyLqgk8=;
        b=RdLPLqvhpnis8cn5ILgpvqsYQkiT5HOHdoLlfDiS8UcvOyt5AS/6KMC/yViXwVDDr3
         PKcG4xB5JQzdAfhLpTGDoa2T3TWbHeRk3EJRytCZ0lECuqddrG6QE1mzijPiYO6sOKS4
         lB/W2xDW4EX6LOY4+3V6mzKH4V/9v41nnzaMfqmbalS00pjkR+xu5z28kH6kEyymnqIT
         RWPZ1KHzGV80l/ekxlY4OLWNhOAXk++1yfqMA1wV1qTR5wxVh3B5K8LnRZ2l1kAO74L7
         E70I8u5tBdrmwpTCmYYtb/ow5kl9S7ZsI1mWCnTFWOO03FU4C9Ia97znn4etSXHOqOTi
         Vhhw==
X-Forwarded-Encrypted: i=1; AKwUvByNV1FP+LNgFKbvJbirbgN8zZ0tKVONdoW/XFy+982rQvhpTxhPzIssfLfVxm3jX49QDzoHWyN+TOlY1pk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVnl4c6LPwKTbnVnl3A37M0BVoFYlthRePowrTc4PLPMyXaoYx
	MpG3580aze7ijchwPz+jDIoY2vfE72R3WHFkDZCce/M4zNnS7cV1IO3xewzqw9a9Ct2mP5U/wX5
	fZUBOgjCzFFgj/d1pEyAVnI8FfNshSmXDRgXNCbze
X-Gm-Gg: AYBFou1bUc09as1gbe+ivT8FZRl376VpggyoeS6T+XI9m9u74rYHbMPDJDydiw74A/j
	HpdcKhHskxUtXs5eWRyC/nSlZtzIxlcssT3c/fGqQmj6qm0pXh8GEvr1eJuZVv+Oa/Dgb5gYej+
	bEM7k8gFCJlESRjnlh8Q7YIcKTR699PYV9GqSZJ5jNjklLlIUlH9e7K/en07BaxhJ2FWmCj/jrz
	7qY8dtlxBw2o8SSuZYPtsqDTHb6gLOuueXZmgu3PQiWBtt9YUqLHkN+hHJsk6C3AMUYrnS6h3Cs
	IiPsYUOurTFKv+sFCz3b6OV3r9KxsJUlIgrTHn0VQggRlJMG7MWr3dA23695VZNI
X-Received: by 2002:aa7:d38d:0:b0:6ae:1503:5a27 with SMTP id
 4fb4d7f45d1cf-6b1999f28d0mr32551a12.8.1791733567188; Sun, 11 Oct 2026
 08:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008034027.1403188-1-almasrymina@google.com> <179173083927.434549.6834667881612626912@kernel.org>
In-Reply-To: <179173083927.434549.6834667881612626912@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 11 Oct 2026 08:45:54 -0700
X-Gm-Features: AclHuK9Z8QuC4Ay-2rnhGygOdIrDTmHPITpI09OOb4gpQMofmnM8JDJaiIrsSis
Message-ID: <CAHS8izMARWs41xLX0gD+39qd=NPXA8QfUwXc8qKwqAUf1anS-w@mail.gmail.com>
Subject: Re: [PATCH net v1] net: devmem: prevent mixing fragments from
 different bindings
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, kaiyuanz@google.com, sdf@fomichev.me, 
	pabeni@redhat.com, linux-kernel@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, horms@kernel.org, 
	bobbyeshleman@meta.com, antonio@openvpn.net, asml.silence@gmail.com, 
	ralf@mandelbit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 8:00=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 (1) =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] This patch makes a valid devmem MSG_ZEROCOPY sendmsg() fail with
>   -EFAULT.
> - [High] The commit says it prevents mixing fragments from different
>   devmem bindings in one skb, but it only guards the=E2=80=A6
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but it undermines
>   the validation the patch hardens.
>

Both these issues seem valid. I could fix them in follow up patches
but it may be good to try to fix them now. Let me take a stab at it.

pw-bot: cr

--=20
Thanks,
Mina
