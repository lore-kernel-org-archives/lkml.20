Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F205B3FBB4E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749010; cv=pass; b=BhXKpF2oWP1pKeaOw3TGadpcfw46hbY6iTdi/7cLKhSNaa6SFHJEUp3+xPxTIzaDP5yCwhb9mWmDEHVkulC2mmcNWKUkWbGFiDGSNrBI9b9gFPBA+FUgjKFZ03G9VN2eZYXZMbuBtSsJWBKfzjuKbLcUrNizmhZw39IdYwsVqeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749010; c=relaxed/simple;
	bh=T3EdywQ0FnSZ9/V9O/5TdzWtrn0QpysuhP3PC+q6xFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IkRzz5ly9sWdTowJaIHgLP3qx7M/3IRG014EEZD/oqBkl1VAiKvGORosbYFMncgER8FDnalvqeE9Aw5seJVLawV6Ij5JYNNVjsrIg+q1PxIUhNhaXhpukQBS4M4e1owuaeVcS3mIDzZKJs22XX2bDQN5nLJY2nIECVcaqzsOIps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=es6ZK+x/; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="es6ZK+x/"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f18c0e03e3so647777a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787749008; cv=none;
        d=google.com; s=arc-20260327;
        b=oPwIvQxRMAg0pipArME+d38jakrc/57nCiM1n5rBo7RX4n9ESuVraJjh0zOrwrydwH
         e9XqeLWGtUQk0SyYlrB8Ree+6d8ec6lhiIu3ZIf/I64XzWjg3tdEfvCp489jTvk4cVgi
         ZeG6HPridmlOuVdt1ljSITCa7e2dXlxHUkyCM2iH3ydxlFerx3KjfwHBh/9BoXpn06kP
         ar7quo0YZPRWITA25sYb8L17Fmdwc0sigC9hKoaSK63RqA4RN4UWafDRSCcj/URWAD62
         MePGsAYVX4mp57Z5GctKIvCpaafH+/6u9NJeeSEi8bKoGDQr5a2x3xb+DIAMcllnW1aT
         8drg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oJ4O5COMcliAWQ6BYpejpwUZKPJeoT5vCsuDXQei4XU=;
        fh=mbK00KMXLkr3/U5M7ZCc6UP8U+7UnwD9Fd/j6Hsg3Ts=;
        b=GiL3JzPpjMyIl82/N5GbrE492fSKulE2kZ6bKgQgrJMS2edZEkMWh+eSIS2CUQDbCs
         Ov0tcY4z8Z0rSgVl7LzPx5CAR76mp6DthR4n5AYSvNAJj2Repo8hy/vtnMi3xDBLE0i9
         PwOkG6RcVDMEvaa2L3VKUZh8BYPgh+7uh3V1hdX30wRqOgIeKAabs/yJ4tvAdVtLoAMn
         inOaLMsURDeZo3SPsY/KYVVcRag+nChVpYxV921er/d1F04ePl4URRccVCUrG2wkl4xS
         2pgoYcoolYaVroiDiYBJd88aLI8LejkTzr/tL1+z5AVkOyJJiTuekzYk61ii6Epgwgug
         FWVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787749008; x=1788353808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJ4O5COMcliAWQ6BYpejpwUZKPJeoT5vCsuDXQei4XU=;
        b=es6ZK+x/1VQKZ9vTmvzd42wZdUSpPXt5rXm8aaY7fNOFb3HZMmKRxpfLQLSgQloXTM
         /HVulg4ZrTb8oH7WemXhWfw0Nc0ozccc6hgQcA7RNG3KOXjb2KCgLIBqPV6iJzzPz7A2
         oOO2Yq97bQDKrq+HVNpqj2sRWpMPywXOpIJfw4mx329mSJmLNbUqkM80mYit3d/pbUo1
         RysSVSuGNZAaKhOXZtU8QSjYxqFn0VO0QaEJydWdOYfXCekadCLP+5O8cQTX7PkWVNep
         GAYP3gkOA32Hbryrl8azxflkyK5KVKHjigUiAfqFlgvkVfTntT+r/xyM6ftuXnmm6QLn
         b86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749008; x=1788353808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJ4O5COMcliAWQ6BYpejpwUZKPJeoT5vCsuDXQei4XU=;
        b=dcZOSDlX/5AMGX6YE4qQxDSpmLtZfP1dOPmNBksSETEWYPYoB6Feqj6Kdd1t3ygVg5
         wWaK8puYw42VHYbANREPk/ChWIMkbuA26MjLGgcSTSWxY1Bt0xFBWPu2yvin3fLn2utW
         xOGh7Al/AYHFmLyZuue/ca7Kb2LSNV9D+lTxUvRcFpk/nkSICkcMLlJ/apl+zgkHr0Rh
         Tnw9pwI+MN1v/WfG9xckW7w9STfTlIJmbKrrl+LluffVHXG0aCBw7vgLgW+WFjhuiSwy
         f77nl8Mrcj4bcpW8t1PBSI6S0F/h+hfj6QxScVqanh7uYBzmVCsIV0NunqG/n815hhr6
         zCtg==
X-Forwarded-Encrypted: i=1; AHgh+RpATpVwzcoSKMOZ4OjDAtsUzfXfQ/y38QGkOn4v3g0Hb+gtXI706bdXgYQxGJeRcKvzCSx02sCpmt6b/dg=@vger.kernel.org
X-Gm-Message-State: AFuF++kDPCMm9O+iflbzZ68kRLIpUPvBo2SNG5dYTctTuV7DLp6kEvAc
	VwvcOR4FyFWjUNK+fnq79vnl2bGIaSiiGLIQU+Vt0EiYrfHGR/V2KsEHKmyTXGyzbfgB+h2NyyZ
	WOpXmRaaHNaLsFbIu7jkGqAByNouP+9E=
X-Gm-Gg: AR+sD11+2c66DydzTeKtzGunnJjuAFcqMCXHOEZIINGrOUdideUnUn+o2CIW3MqvfBP
	0ius4ipIqoSp0VpyUodud3+GpAZCO+woiAhcWJdaEIH5mO5+o5L7Xokj5uw4k/L7Lkvt1b0U7G9
	5vKRQLFmKFJOI3i/p+JT4WbBVgauXouog7IGesCv9gVQDkrSjV+LqS+1xcjyAFo0Ok6LqNCtsqE
	jrK0+RDfe0DuWwfYIPn3Ls68cT2fkUUwL+6sAnwXFqXaqhuQGpD5HeRhBoHv5gAwx0r4Mxj0wkz
	HlzL+b2OAVa/yoyvZ+VgIz2HwRIVDqlziB4BQ0+poT2QYg==
X-Received: by 2002:a05:6820:83c2:10b0:6b0:fa2c:f0ea with SMTP id
 006d021491bc7-6b1a04c6f3fmr4670154eaf.24.1787749007328; Wed, 26 Aug 2026
 05:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMArcTUmACRn_h2sthPwsi3jYjKWRM6+Pnhg=tN4jn4VZThHCA@mail.gmail.com>
 <20260826041529.46139-1-blbllhy@gmail.com>
In-Reply-To: <20260826041529.46139-1-blbllhy@gmail.com>
From: Taehee Yoo <ap420073@gmail.com>
Date: Wed, 26 Aug 2026 21:56:35 +0900
X-Gm-Features: AcwNN1Vi8H79S0z29kMqK7_R4gmv5xxfbnqc8ycUo2O9t8HNIzqq-v9TctzLfhw
Message-ID: <CAMArcTV=zbS=XAPsBAEP7j9yzHiAjri44XmDK-a78JrOX1yv=A@mail.gmail.com>
Subject: Re: [PATCH net] amt: do not store tunnel pointer in skb control block
To: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
Cc: AutonomousCodeSecurity@microsoft.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	kys@microsoft.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, tgopinath@linux.microsoft.com, xmei5@asu.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 1:15=E2=80=AFPM Cen Zhang (Microsoft) <blbllhy@gmai=
l.com> wrote:
>
> Thanks for the feedback. Just getting back to this thread.
>
> On Thu, Aug 20, 2026 at 10:18:43PM +0900, Taehee Yoo wrote:
> > This looks like it adds a per-packet linear scan over all tunnels,
> > so I'm concerned about performance when there are many tunnels.
> > Do you have any idea how to avoid this regression?
>
> I see two possible approaches:
>
> 1. Keep the v1 implementation. It is the simplest fix, but changes the
>    Query dequeue path from an O(1) pointer access to an O(n) lookup. I am
>    not sure whether that cost is significant in practice for two reasons:
>    this handles IGMP/MLD Query control packets rather than multicast data
>    packets [1], while the hotter multicast data path already walks
>    tunnel_list for each skb [2]; and max_tunnels defaults to 128. However=
,
>    max_tunnels is configurable, so users can set it much higher.
>
> 2. Add a small per-device bucket hash keyed by (ip4, source_port) to [1],
>    while keeping tunnel_list for multicast fan-out in [2]. This avoids
>    a new linear lookup cost, but adds a second index that must be
>    maintained during tunnel creation, expiry, and device teardown.
>    I am not sure whether that is overkill for this fix.
>
> I would appreciate your further feedback here and will prepare v2 after
> settling on the approach.

Thanks for the investigation.

How about protecting amt_tunnel_list with a refcount?
Currently amt_tunnel_expire() frees the tunnel immediately, but with a
refcount we could just drop the reference there and let the memory be
freed once it reaches 0.

What do you think?

>
> > I think this comment is not necessary. Please remove it.
>
> Agreed. I will remove it in v2.
>
> [1] https://github.com/torvalds/linux/blob/0f23d56f17fdfc7db69d51f64c8b91=
bbab947aa9/drivers/net/amt.c#L1261
> [2] https://github.com/torvalds/linux/blob/0f23d56f17fdfc7db69d51f64c8b91=
bbab947aa9/drivers/net/amt.c#L1276
