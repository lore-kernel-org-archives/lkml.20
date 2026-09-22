Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F894BB269
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110780; cv=pass; b=XdKu8lMsuxy13xTIqMq3b+Jy44cuX3EMNDzy5LMkDFhzYbdTRMY4AITc6jCpBdEMqCWd49AUtn4Q6u+f/MEJ6SYCCAZA7PisQ2rDBItCpKq8FtgWRN0ORtW2zX4+s4JZCacKb42wkwEb1PAvEo7dWX7XcBGjnqQZJeDOCKtFl38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110780; c=relaxed/simple;
	bh=wIRXXuVsUSpgf3xCZFrSJzI8xByKVKMD+dC+JD/lknA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9KZtA8/PEtaqIZU91KrvvGwyUYW4qk1MWf3bYZewq9b8GCFXWVOoR3Q7DJsXkOJGWeoo11V55k7abDkrHzl2eorNSWM98imABRmLoZB0GYSRUJ0Nbp0dI/aSSl/Gqj/0QSLM9Fu2jzkZeZVwsrsi2CbOKkib2HZSNCVDxWOHPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ957hYx; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ957hYx"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4bf3dedf3so242295b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790110774; cv=none;
        d=google.com; s=arc-20260327;
        b=lVJdpV2g4BlQns0pxyEX6fkV5lD9sThHvI+OMncGkogwhC8Xtig61qS8e5xtWfCCYG
         eV4UqZPBgBJnB+WWS2vfVIOtqSw7R9+8bm8EQ2XQRITkUUYirb/DwVJWsIHSrW/to2BZ
         3qxmN9xGcOeN+Y62jSqiue6bLVMRX5MdTr6j1JtjetyccJ/WhSQIxh94Yvb1rl9RLeTq
         GqdbWKGICE0ty87D1WbtsH+fh6jVGzFQXUlaQhmB86Mi3zYCm/KXuw7Bw7CbKt0+wo8A
         i6IPYp+Rz2BZPNH2hPdmMoLKPqLmHEfc/1EaWb5df07xozGMyU6e4UsOd1dlz7wj85q8
         3cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=btBRPiBOdcnMWIsPdftA9/JWuQ65VWOKgdruB6cHU6E=;
        fh=iRM0ZOZJg3Z5l+IcuKtZFWk9a7LNBlx2+joDtFhRkIU=;
        b=iLiMHNccUKS1bQVGEc3ZaMG4oVr5la5CP/zt6/BTQabKFsQVTpqFvy/DYz8yHyMdeS
         MGl0f3b7SSB4lCTzG9duQMf0xo107Y+xNIhjJTqTaaXq9zXdt/Yyf6lyaBauhM2dDyU/
         vG4thruCqj2ZXKXtIHorK53aFnjGSuJoH+sgmlZOYllt02SRoS/iRADn+63lrvBYRf6y
         CxMkPonRkRmwmQvR8FChIADRUDU0EXrLr8yizW2wojrTVQ+2HTgvMaPPcgi34wFutoKk
         QICSiZVBZUXYIgbWwtYst3m2enu/ZZ7qjWCCckJPOg8gxQ6tZzoYi8+yiuJG8j79kA76
         2ikw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790110774; x=1790715574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btBRPiBOdcnMWIsPdftA9/JWuQ65VWOKgdruB6cHU6E=;
        b=XQ957hYxO0xTPlSDJ03IKx+MxcfN9kAIo219ZRQnIdxUHeHjn60pEZfNyWpmDD1Qoo
         2SOyxkkyc8URH3VVGoabUl79PMYw3AW2OgD7gGK2gD3Ov9T90wgi/0AgqSvQ+kFeOC65
         H9BaC0QWkuyu+iaCcafG39ntqttCf8NkDsXsvDHs55OM9MRz75ZjJpPJl2TFeDZMPZ1Z
         k3y4f7P+61kq6pn0Cy/RGnhx/PSkJHCaRBg/bR8T+xWUJb6N/Yy1oqoeoFnFdcONj2Fo
         NKnqtBfMJrTmWao4y45iz/7DPlaK2bIQJKrtXExH+N+9yElj39tE9nMNfCsgvWmBQ47W
         jfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110774; x=1790715574;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btBRPiBOdcnMWIsPdftA9/JWuQ65VWOKgdruB6cHU6E=;
        b=Nz1SB6FtkT6olr1WXIwIesy06SK4inOLHd8bFx+ERkXpaO6P3ndKWD9kPaLVkbRG1H
         Jxkq1jWlx8ok64iRtoNKKR+C0iYtFKcZmfYbq9VtOmaluq6E/+imGvzKdQDHwh3zk27+
         MszdRXPVmTIOA92y7Yav26iq8LZ/pqWgOvDFE73Z7azg44pvSI6fn5dHi6tJUGUrXXtj
         p3n1DN+aGEbTaMrGcMLnPI4wH7CXyOjCaqJm+SmXEXC9QalMZUqXIxaWE34mnnjDbfkm
         osIHuM3YQeIq7GmUkLhbi+yPYyIDrp+EWsUzyz/g5/KLqIgebmFdCHa/MDmiLDvHIA7h
         kmjA==
X-Forwarded-Encrypted: i=1; AKwUvBze8WOrL+NlbJSO5LncHXjTtUldsOlB/ixzIk+QWHE1gsUtTW16c/JVoGTCMKdmlXG8UsE84U12QD96ihk=@vger.kernel.org
X-Gm-Message-State: AFuF++mhTKMuxDmdD7Qy3MoUwnrtgp+siZo77NbrwE/o2fCgfLgM8+uP
	NkNJMEQl8BDSfY6VCSASXChFbc/G5Z4K8P69GfOru98kYQYZdMjJoSqO1W5E34OhiIEbTIo29g7
	5enz0bloA+9kEjCWZXtwtx0dsnkvZFzM=
X-Gm-Gg: AYBFou3B34TZGbhHNRa8/IKssjFeeGsJQIAWKEUNDIdE0mWjD4Ll2cX6d9/fYEaAFkT
	04d7FguoxV8d2+sX7tpdCrMj5vY3v+XxNqXli02aj9Tk4Stp0Y2bc9/RMQYutlLTO3J4JoUB0MR
	35WvP5URTWQGIaXXIpX3Roqnyf6PjTjAfn64MQenhznv3xsi/A3zdmmr4+88G2pFCm4JiAyjFXV
	otHCD3t2WYxCgxhEBXf5RXZfCMk9tty3gRGgWVxO+ULRvHK+HLDt4iWOcXSWTMRt8n8543oiI8l
	11eZTHMGLQCcyq1/pZCyCjiCUSEQtiIlWCKFYTyFSaQLdyZLNec5PCl/dxAOZ+gWKYorTIQvkTR
	RtZYJuoecOQ==
X-Received: by 2002:a4a:e911:0:b0:6b4:5cfd:f381 with SMTP id
 006d021491bc7-6d2d0836a4cmr577159eaf.25.1790110774153; Tue, 22 Sep 2026
 13:59:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-net-next-mptcp-msg_errqueue-v1-1-dd77e1738248@kernel.org>
 <179001595171.2160803.3670624686905872378@kernel.org> <d6cdbc83-86a6-4c2a-ad99-29cdb83566dd@redhat.com>
In-Reply-To: <d6cdbc83-86a6-4c2a-ad99-29cdb83566dd@redhat.com>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 22 Sep 2026 21:59:22 +0100
X-Gm-Features: AcwNN1VUII6uOcsfxfr-62vUKq7jiIrNoNXoOzhNQ-DW9bOGJNbIJXNMHXPivns
Message-ID: <CA+XhMqyGNBrd=Kt71gk2M+PC3bZxfPt7ujswBGe3pRAFiuz0PA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/4] mptcp: support MSG_ERRQUEUE on the parent socket
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, matttbe@kernel.org, martineau@kernel.org, 
	geliang@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	horms@kernel.org, netdev@vger.kernel.org, mptcp@lists.linux.dev, 
	linux-kernel@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Sept 2026 at 14:30, Paolo Abeni <pabeni@redhat.com> wrote:
>
> On 9/21/26 20:39, netdev-bot+sashiko@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 0
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
> >
> > - [Medium] The new error-queue splice is dead code for MPTCP-native dat=
a:
> >    its only accepted input (SO_EE_ORIGIN_TIMESTAMPING skbs on a subflow=
=E2=80=A6
> > - [Medium] Forwarded TX timestamps expose per-subflow identifiers inste=
ad
> >    of parent-socket byte-stream identifiers, breaking the=E2=80=A6
> Sashiko comments look relevant to me. Basically this work makes sense
> if proper support for mptcp-level tx timestamping is enabled and the
> and sk_tskey is resolved at the msk level.
>
> I underlook at the above during reviews on the mptcp ML.
>
> IDK if someone is currently working on the missing work/bits.
>
> /P
>

Agreed, nothing arms tx timestamps on the msk today. Let's drop the
series for now.

I can look into it.

pw-bot: cr
