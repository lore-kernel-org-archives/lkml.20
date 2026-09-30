Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C104A3F0D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790811029; cv=pass; b=CDtaE1KHogqmP7xSoDMwN8ItaBtDfd7bb/56C8vq8AFMNfbk/Ysz+7XGzRZBP/oJm815rQMynXjYh2jDhw2VDrMHmUkDtzpg50DA8ZmXwoSLTIGs8nm8Op1rJ6bK46YH7fHi1mO/OToFEomQ/fcy1WtimYH7VCZ7j+pGAPyFa9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790811029; c=relaxed/simple;
	bh=QRhdhkTWAMq6v8F3o09AfM5+4TNnCKpQ5ExWjqlmZM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4X9JG7arVIB+a7HBIu6WlUIl2CWTLWtlGyU8eqX/5B/jQ7h6qot49cYY/SaUeqjf4L96UTRfl+kf/8LVBmQ+V3tPp0op8pWKQDsyKH9EMzFpqJcs1oGs4Y7NFP0rA08P6lfJz9zDHcBtoadHMV74uDBzONKQhJ6/4JN2hK3YCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SofLuX+q; arc=pass smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SofLuX+q"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93c5b7f5bfaso23564185a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790811025; cv=none;
        d=google.com; s=arc-20260327;
        b=M0nH3vYJNOGIOHvCcy8viGaRRPS353lN4ydIFKRlxXkl1ft9Mv4EIDRe4rPPYfXbUk
         kz0jHc9Cbxf8IxgUNucHQJTpFxoLfkofynXROlmrGSt6ECsZYXgsC4+vwu4cL4jOu1XF
         dc3/FrqD9fuJjNXFMDIGmZmuQuiMWplsQ0KwelcBKg12G2uWYpv9rykgdWh+DGe55DSc
         2i3kN5uQz+GFiPJpvlp6TIVWv18sEg5Gnzjy2K9cYnf9pvqyxlpE1duPVIgaWv4jMwAp
         pfmtmf7it3Zxk/9wh+O0Rdw9DL3i8q3cYOBSbPVjs43OJp6b9q8yv9uPtLUi9mZESvjC
         7MXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F74ktHoo59KmX1dkAk639aZ/tJPOMLAiH0Q+C4A/UsY=;
        fh=+S5WkJ8Mqde52VpHzNoZwEV6VIs+/Ieu66ZhC/xt7M4=;
        b=m2VsQ7qhzbv3uRAZ0pOR61/Stst0AkV97mV4POJwSR5WrJzldO2llAGLoahlVUvSmw
         WfTP0v+rQ/ixGJa0UGyHdjfYJlQogygzYq1kD8Fxykp79aqzXpBLq32bOizD/FJRyazN
         RMj1RoYQlbmbMtALU2n4H8NDSGDxq6ZX1aNvNKcqKGU1KqQ6+eglTug0oDxm+QzFYLtw
         r56cX4XfFJpBum4UrwKi2peP9x8w2P09X9E+xGibWSoMQwnR5TGo0g7rKf2PUI/BU9xv
         OV6vxJIOKyNqq1Jq83Virvdm9aFpOXG2v6VO9FFCKS/wx/4hUYLos/nwdsCtJ9Kv1gHV
         gcUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811025; x=1791415825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F74ktHoo59KmX1dkAk639aZ/tJPOMLAiH0Q+C4A/UsY=;
        b=SofLuX+qoadKmbJaTPZ/rAtHdcS0gemHdxYDn73TH7CHtrUIdt9T0hyb+/cq9kMuM0
         M6ARMVLMIcv7Wn9Ilmk3tfWYxXHpUDbZmR5DImQwiYywzeD+R3YfYX6oKN67KrEFTvnG
         gepK8RPnlnRRF1KY8ertt0QP3AuSMwFLMnQnvhqBREGou7U80h1bZKcZTzjjqRKnD7rK
         f7dmGWgMliCepqU0JzkHL/W7FAdjbu72OfjUqw+2mlxlBpLMKkl0rVx7nQutS+Pnjh2+
         zTZ1EKCgMHtzGiqZf2GLklli55PiORuxi7oubJTwCMnEAGM4eJmGBccTb0MCZlm/LPqX
         yGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811025; x=1791415825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F74ktHoo59KmX1dkAk639aZ/tJPOMLAiH0Q+C4A/UsY=;
        b=zc9bBnZM40X0MeUfit9Ro+Yc2AT5ryYNjYR1WzVTQ34yT/mOhuqh/DKzRJ9Tm5anmx
         hXtMva63+pnuusmOc6S3Xn+qIa9qOyadzzWl91izdgn10WkDbUPXuxOaG2MeprYib05K
         9qKJKOcIMKoKJbDAoKOpCN4Cdsb6yKqARjh+kiowBXfB2IcJS9XYl20KiutvyZTtE+Dy
         0imRKETRQ8opGN6yWcNxbqPcp9OtGEq0qx8WgzaP+0Uy+EWE2/jYXHd7i50RQnYY4Mph
         NyktoGvKVfCiK5Yd96/hQort+ArkNAGqiCgujp/bR0u59S5iJp8/6Ck36kAAss27KRq5
         yNvg==
X-Forwarded-Encrypted: i=1; AKwUvBxC8ux/ysmWAtLj9OnYU6zwxk0MpZD94ma9nsF1WNhBsJTaisMrFoit55c+Et3oIgeEKIh9TNGLj2MCmZA=@vger.kernel.org
X-Gm-Message-State: AFuF++lUuBjX/ysr3HhtkHsboyMyCSiAbCDrR8NL8t8IKr2rzgDZ4M+O
	umeSfmcI0/BtlrNH1AqBIx03wibLpzUjCBkcgHcBCGYSoe1yJxgCS2budK+sJWM1qMGnLtucWcJ
	AVi6DqY8WP1j0IQq0fTb1n76cpLNx6bAa9c8Ross=
X-Gm-Gg: AYBFou3GoTYWLPUZk0K4AZQBo7utOqJyS9RWgmg5rCDo7e9dGtcY3vXMwaWzuyPcbvF
	UV9oETwSnh2iuflhZPS+8EyfxxH/AtSvialNm9MCE0YfEtU8iWsi5ifHkB5fTVNBmsxL820FzuF
	KO7GJrfCeAUMrNLa3co2itA8vKN2+MNsJekk52kxpgE9dVJM41NbEv3wNZYXKQOsP7yw/kUhvNE
	IUDHzGC3pogtxsLbnIwbPoUCP057Em6NqkN0ciuwGNv60+opUY+a+0baBFiYO6VzfDQeNq3FCa+
	9atA5vHHPvvqS7zlAdD151bN8yTlJ5CYjeJfs2Msg2GXPrkADxjIOertGse2bHS07YVRDpFRYcB
	Awr1d6kmlN0dX4m7VB/H/IHW8LAjdNiVr81ocz6vai7jQ0onMqbyxVj/RZapqed3BRnDitQ==
X-Received: by 2002:a05:620a:2682:b0:93b:cb64:25a5 with SMTP id
 af79cd13be357-93cb5a52e38mr239435785a.12.1790811025015; Wed, 30 Sep 2026
 16:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923025148.35637-1-vinicius.m1821@gmail.com> <20260928232540.51083-1-vinicius.m1821@gmail.com>
In-Reply-To: <20260928232540.51083-1-vinicius.m1821@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 30 Sep 2026 20:30:13 -0300
X-Gm-Features: AclHuK8NRbuQAS_waVnj7I_4awYH0UgwVcCCzsszviYWmku8l8ttavFzhdvGZFA
Message-ID: <CAMAsx6fHNXUvUbacySzcnXGWtaQd+-Nqpst-f21582=DS3MgXg@mail.gmail.com>
Subject: Re: [PATCH v4] docs: translations: pt_BR: translate threat-model.rst
To: vinihsr <vinicius.m1821@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 08:25:40PM -0300, vinihsr wrote:

Hi Vini,

Thanks for v4. Two comments about the translation, inline.

> +sem privil=C3=A9gios (por exemplo, debugfs). O acesso a esses recursos p=
or um usu=C3=A1rio
> +que tenha recebido permiss=C3=A3o expl=C3=ADcita de um administrador n=
=C3=A3o constitui uma
> +viola=C3=A7=C3=A3o de seguran=C3=A7a.
> +
> +Bugs que permitem violar os princ=C3=ADpios acima constituem brechas de =
seguran=C3=A7a.

The original uses the same term in both sentences ("does not constitute
a security breach" and "constitute security breaches"), but here it is
translated in two different ways: "viola=C3=A7=C3=A3o de seguran=C3=A7a" an=
d "brechas de
seguran=C3=A7a". Also, "brecha" is closer to "hole" or "gap" than to "breac=
h".
Please use "viola=C3=A7=C3=A3o de seguran=C3=A7a" ("viola=C3=A7=C3=B5es de =
seguran=C3=A7a" in the
plural) in both places, so the document uses a single term.

> +  * capacidade de contornar algumas das medidas de fortifica=C3=A7=C3=A3=
o do kernel sem um
> +    caminho de explora=C3=A7=C3=A3o demonstr=C3=A1vel (por exemplo, cont=
orno de ASLR,
> +    sincroniza=C3=A7=C3=A3o de eventos ou sondagem sem consequ=C3=AAncia=
s demonstr=C3=A1veis).

The original says "events timing". I think "timing" here is about
measuring time, not about synchronization ("sincroniza=C3=A7=C3=A3o" would =
be the
translation of "synchronization"), so something like "temporiza=C3=A7=C3=A3=
o de
eventos" or "medi=C3=A7=C3=A3o do tempo de eventos" may be closer. The orig=
inal is
a bit vague, though, so could you please double check what it means and
adjust if needed?

Thanks,
Daniel
