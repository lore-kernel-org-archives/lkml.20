Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B196543CED8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493433; cv=pass; b=s5A9BtrxibptcLYKIO2X22uOnE4O/yjGWdsGFJKXV6RF0uixjcHx3+LNtL2JgAGsooqUpdUqcY7WlHLsTpGZWbNQVMLPpczMzemBMzEfrL+v7OCYGTm2OfrWC/IuPTJ6X/i0fIzy0tcONGbK6F8DsYSYI5o+pDRzAxa7MtWYM1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493433; c=relaxed/simple;
	bh=vl6P2d7bzS5ltJJCjjguAr4o4FboZty4KMxvPMf44as=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikomK0MYjcKUm0i8Jx3T71b3VurCEGn9xQjNATC7a7eoFJunE8Vj/D5TrBePixQcvj3OKRXIDqVVcPHoTEnZEBn4ZGGftFlFyjncBCdzSwDxvnQ7qFr1G9BnzALVA5Oytu/4Ghy2hTJO08QQW9111LuM/eSSqJ8/v6Io8jWpvqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXb/7leP; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXb/7leP"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-675676afc3cso4064205d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791493425; cv=none;
        d=google.com; s=arc-20260327;
        b=bSb1BsmBEcIXlYdGjpCVcel74oND4YgYkSnCBNUucouXfFjKqOsMgZIIRnC42PHuKN
         P04OJh7MQXAm9AxbcEg5acgnXSYFiJAPaBRTukGtMXtK4nOf8b/rsFp4tZJDn4kjKw6c
         EUTjWQR1LFi74MwQeOPNBgwE5Afwj0BEHz3ou6eBPJ5eZQ0P/eug1hNWQ+tXLt+PVoMf
         2FChe2qhY+2izoTzt31xAPJEeCvXjOw/grmozfvVjqg2hxUvySKkU8wI9ai8GqiKP9xd
         UcEVA/gA9pBYrY0ATZjUCFP8nOyCMxt/LThYlGLbXn4JqkTTNpl6go6H7M2oKJnrCacj
         X4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vl6P2d7bzS5ltJJCjjguAr4o4FboZty4KMxvPMf44as=;
        fh=tcCALMGQMHC3yUC117o0QGCtsFMp0BXB6pcd1WotzfM=;
        b=Edl91WK/H6Kv2c0GqJfTZvpY4vY5XwIv8Q7oa2U+vNbB7sCcQS3iCg5CSwUdqWmGPn
         VGTbdTF7GZ+BG7KP9/sMpxTbdWlmvk5kgr3iH7GgwewNaibgKIP/OTHFntypeIkPC+jV
         QVPWZPqEXTKvBgJx4HUg2WMN+uCNSQkqhN2xsGJHBz5bj0I01Oncv13IEqim2gCT5mlA
         lappA80CCjqlZsEvv7C0QfvvQC1fMYHI5YvWdZ4O8h0U0G21oa8ycK0TqK80PQFgnZEH
         tAVfsBiOwz6ZmtGGEOlWsABSngTYZHvaovt3End3SzdHFLheXENB9Lmnti1CTiu2oBNV
         E2Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791493425; x=1792098225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vl6P2d7bzS5ltJJCjjguAr4o4FboZty4KMxvPMf44as=;
        b=UXb/7leP6TGNYUifCSK0ZJavuFWdrwXthwZiI6/dWlDhkOz4RHlfPFOujRweRjd/ks
         OiWVTAmZK3nO0GggLSZfwN8B2gWdsKQnsSA10Ke8dGWQcFCYicp3IP29KG+cTVlhft1w
         MqB6+615PiU0qCOGJw3Q6YbiFMFan84RlyjV7Yza1ad85M2NkQJjvLH25YMwb4W7MkWm
         YhFIrndChRBySsVyrWboOrEPjUSAZ5+X4aSujD0WUKIkNPX7+GH6Z6rbyigdR49T1uSW
         qp6t7DKOC3r4nvc8GB5W9LGamVawPCFTigLsreM+nINugjPbXlzsMQ41BFDXrMOH6PHD
         SCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493425; x=1792098225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vl6P2d7bzS5ltJJCjjguAr4o4FboZty4KMxvPMf44as=;
        b=TZUWDvv++kW/hwgbMyMub3gncn0xa06Wc7jbHg8WoOjHGiq+/mhhJ4I5obE+Z6FYwz
         Reh8FYnYlQafpeYNShVmDWZcy1VuddLE1LABHDHZpfjVCv7Koq5uMeesrspDh4gaw/Ee
         nk9ivmu8FttRkpkDWklX4bSTdYPa61Ai3B7CAJMhtt9kbqo2H0XpDh5YlOvenELNQPjV
         xC0vf8U8O107RtDufHdAyLNSoEIPZYZK4zs/DLnIF4TPQGREnHAionz7VLZc4KKyZkkh
         yYc093RDGZ6WVwi0+LJIPj+GV3adEbXOjagSlEO+E63ekBuio+2pDvzGAJc9ENPsHhg5
         OI7w==
X-Forwarded-Encrypted: i=1; AKwUvBwuqgoYWdrkSJ5z7hGofsAW2Db2KwnFl8888EGBTLBT+3Bejkk60/K/NHDIvCpog3FMiCHMxx3sRwjcCxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwI0OfHZUJOPDyn+T5RjagpByg3oSCTprQLobYsu/wGhzoh3A0
	JP4QV0M+CtWwQ0hvgokHsknOIVdx30kQwIrLM+I1ZXxaCaB8D2JIiBFBOwsHm5oDde5jpFkSkB7
	mDszSCG8viNy2vW6gAotWmA7cLVCDIFI=
X-Gm-Gg: AYBFou0mZ0yxGcfvpi6ch7Z16F+xXGkLunZp6m3AGdVyFlpiRB+ZizN5EeJGh4GedHo
	tZIk1RgIHAU+a4Or9eSZPscWuQX81WhIq0ooDtLnrv9zPkQkZ3krnHej17XkPbzIslmup+VWdu/
	HfbptCJbJxVmlP1AR/+Y3QwuuzGos1jLSAI78Ylf7m8kLWBpdISzCrY3EKp2F6V+fZUqx/YsiTk
	BbVTQmn1VrLQwfDvHpUqdfagvhZa7d40GyUsNu48Df4suMRw/ZfKknL8ax2mODabNSsXRREbnEG
	ZBUw8LzmSlEz2uEZkl6q+xpM2hE4l02bxxpUlxc3y/ni56DNIMkstPSYM1UiYy2e+XtpHUx9V/h
	hdQz4weLmYrEO3YQGBPRuZJy8B4zYqFLEP+stLQa3DWLv9x5uMuNJ
X-Received: by 2002:a05:690e:11cd:b0:674:1e05:9b81 with SMTP id
 956f58d0204a3-6793628e483mr25302d50.91.1791493425421; Thu, 08 Oct 2026
 14:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008124106.665014-1-Jason@zx2c4.com> <willemdebruijn.kernel.cf8fec88827c@gmail.com>
 <CAHmME9r+O=3i4JP94P0-gFwghfWtD=vLa1g3KB-LvW+xFbJWHA@mail.gmail.com>
In-Reply-To: <CAHmME9r+O=3i4JP94P0-gFwghfWtD=vLa1g3KB-LvW+xFbJWHA@mail.gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Thu, 8 Oct 2026 17:03:06 -0400
X-Gm-Features: AclHuK_qKmc6ZKE8_x2MdYae4trfNS2WogXUatNfjY-lv9_2jJsmiBMEjOiQbLM
Message-ID: <CAF=yD-LO0u5z8SU_Aktu0-0aeM-1UknYsGc+rCpD3y9bpwxtwg@mail.gmail.com>
Subject: Re: [PATCH net] udp_tunnel: drop packets when hibernating
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: rafael@kernel.org, lenb@kernel.org, pavel@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, linux-pm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	=?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <jeremy.jean@oss.cyber.gouv.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 3:58=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com>=
 wrote:
>
> Hi Willem,
>
> On Thu, Oct 8, 2026 at 8:37=E2=80=AFPM Willem de Bruijn
> <willemdebruijn.kernel@gmail.com> wrote:
> > Jason A. Donenfeld wrote:
> > > The kernel's various networking applications keep churning away after
> > > userspace is frozen during hibernation, even as a memory snapshot is
> > > being made. This can lead many network applications to an inconsisten=
t
> > > state, replaying packets and cryptographic state changes. For example=
,
> > > on wireguard, there's the possibility of this sequence:
> > >
> > > 1) hibernating begins
> > > 2) handshake state cleared
> > > 3) keypairs cleared
> > > 4) new handshake round trip completes
> > > 5) machine memory is snapshotted
> > > 6) packet is sent using new keypair
> > > 7) machine is restored to state (5)
> > > 8) packet is sent using new keypair
> > >
> > > The idea is to prevent (6) from happening, especially if (6) and (8)
> > > contain different data, but the same key and nonce. Presumably the sa=
me
> > > issue applies to other users of udp_tunnel too.
> > >
> > > Fix this by just dropping sending and receiving packets during the
> > > hibernation sequence.
> >
> > A few high level questions:
> >
> > If the issue is reuse of key + nonce during send, why include receive
> > side functions? Specifically tunnel (encap_rcv) functions.
>
> Because I suppose (4) probably shouldn't be possible after (1). I
> explicitly clear the result of (4) in a PM notifier. It seems wrong
> for that to then be violated after. Similarly, userspace doesn't get
> packets after that point either.

Since this is an issue specific with security protocols and reuse of
their state across freeze and restore, is that the more suitable
location for this check? Drop transmit of packets with that risk
(unique for that connection nonce) only, if freezing.

> > Is this a problem specific to UDP tunnels?
>
> The stateless nature makes it more poignant there.

udp_queue_rcv_one_skb is the UDP hot path. Since it touches all
packets, the last resort for adding checks that are relevant too only
a small subset of packets.
