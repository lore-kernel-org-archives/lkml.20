Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62C12C15A5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508192; cv=pass; b=LqW/PRbA6mRoj40vFW0MiLAv1JkIx+VyGyT70onfvthB23nLSN0XNxRWi0Cy94oNBo0xswJTr+LYstThiO7sXoWIymXlm8MGLQaUrDc2q/1lLFxc2hakCegUDHVzbCxHmhBCi/avAXRQolq+ZT9a5HB4ANEhcpQAqSlsQSKPeq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508192; c=relaxed/simple;
	bh=zfbHOYPpmgOxH/7SdLKAnBHBmgz7/uJSAeYRBHo1Y9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVJ5mdPh278pF9FXo4pwnDzyAGaL5yLmWtCkwgR+4a8VbFhqNZ+u0oWLwWNdcS5KPlRouSD78l3axKJT3+u2JE6uL483GcB5C/kvGtpl0Um7t5e9t1kFXe8FN/AxKO3dg84BOHF4GiGfCKeuH+wDBwiYT6NpSFP322Yt4fQqjYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=VdtQHaAF; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="VdtQHaAF"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso5699022e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791508189; cv=none;
        d=google.com; s=arc-20260327;
        b=LQmdR3GzUJ4qff8drSVwhuLX0LjH7v2Q41CavDu4GopQnsQul9t4Vi9rrWk+osyj+m
         igSUXHOiW++h7rjLY67iTcVfC42KoHe07KdgR0DaPy8OFW+jaV8EHP8NjDRWAzwVpOyk
         XIoS8dizRCMMexzQIK/cj49Ufbm+xoHt9HcCIE3tVM62Y7yfQkcNb/5XGMlBWzvENeGX
         /hb58n+8ON9t/Fp5mAtzhiq2bHhxgQNGT95EFFsJ4NBprD/2LEHWroj4lq6zwjW3kwo+
         3yEzCbI/zzTcaicyAQLYdsS9uVWUmvTPii8es6vhvwJZEs300+5KpIpxdfsC1SyW1UC0
         VLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zfbHOYPpmgOxH/7SdLKAnBHBmgz7/uJSAeYRBHo1Y9E=;
        fh=kkLfaAG3saNhLECDW/2hRKvKeJ25D2FtV35S6EML3P4=;
        b=EBcfUZi0YhSej+8wMGdjjY+13ds0FM93e0KUeGr7IqJaUU/Y3sZebW0vI414qb6/sk
         aQnuEVUMU7PC3p+iiBhbEX9cOkNaZUuBq/JKn+oOlrqECqe8EVDF2GA2WtBRDNL3cXC3
         4hfd159Z0C/EKpgm9NgI8hn3dcZttvTdxeYwIuYbVXCeKXNWcGTF1fm8OtpGibJHveyD
         6MOsfbvNGDteBY7SzPXUBgmNVMuLD/XKwM+Tz4TxpBSeflfjoG6j8M2hTGW5lEixsC24
         Xm1eBZ2hs5RN8DkfhfZ4Dj41i/GRBsJKXylVEWoL2lZO8t+1ezuyMOR7t5fznDNuyhda
         ioOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1791508189; x=1792112989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zfbHOYPpmgOxH/7SdLKAnBHBmgz7/uJSAeYRBHo1Y9E=;
        b=VdtQHaAFWbaCLcI2lBQ4zcGk+rEru0nEXCPViade1MCjKs1JlyRoiwDs4yL/yRhb8D
         MVgwsLy6jyApwoLCCO6OvQbLtqtQVmqzOQ/M+7Z9o0q1/9Z5JwHDKA1QSaF4DNEp2uJ3
         4YtUIlwE5IoKsMtbkv5o0ZO0MmNeS7r2bv92bKmpMzUXmRX+OhQbjjY13AenyygB/lzI
         HiYAYRItyeyLN98Lw1/zcikdRhKoS/Qj43j3LUdhzWowkgxWhenCfWxsLJTNLq+pGBYi
         lXshJJtXM5GeSar2fjurnFJY14NVoevclALHeYaul05Os0Nm43KoC3skubw0icfp+npF
         Iw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791508189; x=1792112989;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zfbHOYPpmgOxH/7SdLKAnBHBmgz7/uJSAeYRBHo1Y9E=;
        b=HPqNLp7OI0dW1Ouqh0NS7Uko7TXAbx6JsBkq2lec5dYQLtlbawISjSeWF8ts6/aQnH
         ivatcj/2qLQoFv7eNSZ6t9FmzUvHwBIVW7G0pwOlkY+V9BTESRKK9zIgPVzjmauIy+9s
         CP46dOhf+71cyj30kehJJWeyJruZpvMfpZsdaeBYMFMmpVKT/fe406BQV1GPlBdIPSyF
         fE1y3UjWVgBZkfL7yNo6T60bH+nd/qLi+WXse0vTJevris13dd3qqh3DPKcS58URqo7u
         sfeThEppo/IX+UmXSWLgr+6I6/vXiytkq0JJjomLAMCCDvQMS/cRIyTg0ee0pInYixB9
         HYHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgJBQuEkMqVScAirelqYbpP55wmuwYX7Jzyfxc8hLHV4RgM/XwOMuZjFUtFUS9HUZ684E5GY+L+7PliFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlnlQ8UsisOoBvizS0i7GqDMUtARaykQLi3D/TjCjSR84rP5yL
	9Nx6UAWnryqJoMw1OzpogCVqligMyn0ktM6Kp3q4i9WEF6qLvcCRyewzyTNoNdfWhp/eCmjv7UU
	wxd+/l2AHwNt4wtQvIGoBXQoDMHle+4TVVyePg+BwXIM=
X-Gm-Gg: AYBFou3451jeHF+0h7XBfmLhy1tN8v3X0vtAOzzcejJZvCPL1wxt8EQscf8mEQtw4ye
	/tM8/fz1HnrkXmd7ISniBciJXstM9dM57XnDq8w0uYyIBMe3XvnqyU4Pzo/8/6hXhwBtYbcStnh
	d/4YEpvg+MsHJM5sMdPvZAsPP4Wnexw6UNAa6o1tgpKAThIWTJnkPB7n/85SQYmL5qElOTKQb9h
	Q1KBErxze+2uf/rfpQnRNuyM3LUa+I2gUY2TilUhKRxCNMI+jKU8MfoDagnnV10EVB6LOepPm7w
	o6QOZ+EcX+NO49W+FK6ojJM6Ort6NAwTSuywqyM2p5gXNCug0fZWReOeUhSQJEn9JCajHrRtmMH
	tNNuCM99wPg==
X-Received: by 2002:a05:6512:3b24:b0:5bb:7829:741c with SMTP id
 2adb3069b0e04-5bcde35ea87mr133020e87.1.1791508188824; Thu, 08 Oct 2026
 18:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789885804.git.zihanx@nebusec.ai> <f88fc502b17b4022105a99eea407525807ee573e.1789885804.git.zihanx@nebusec.ai>
 <asgtQ3E2LVWqfV8D@chamomile> <asgwR9LsGCEMolQX@strlen.de> <asgx_COtYd1PifN2@chamomile>
In-Reply-To: <asgx_COtYd1PifN2@chamomile>
From: zihan xi <zihanx@nebusec.ai>
Date: Fri, 9 Oct 2026 09:09:37 +0800
X-Gm-Features: AclHuK_SUmv4p6WRojnrW3e-mI4nWpBMifWbKSG3UER4l70SEe-UheyaXxZXzZc
Message-ID: <CAANe3eSnAF6wRVqopQkgtQLv2Kat2sGT0Fc6vGkCFk8cCovbuA@mail.gmail.com>
Subject: Re: [PATCH nf v3 1/1] netfilter: x_tables: avoid holding mutex over
 faultable user copies
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	phil@nwl.cc, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 8:14=E2=80=AFAM Pablo Neira Ayuso <pablo@netfilter.o=
rg> wrote:
>
> On Fri, Oct 09, 2026 at 02:07:35AM +0200, Florian Westphal wrote:
> > Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > > > The ebtables GET paths use a separate ebt_mutex and are outside thi=
s
> > > > IPv4/IPv6/ARP series.
> > >
> > > I keep spinning on this, and I am not sure this fix is the right thin=
g
> > > to do. There is no single caller of this pagefault_disable/enable() m=
m
> > > subsystem function in the net folder.
> >
> > See:
> >
> > https://lore.kernel.org/all/CAL4Wiir+CBGE=3DhXxHEBkyk0Au9B6G3=3DAdHFd5b=
otrC-FF5BM5w@mail.gmail.com/raw
> >
> > Quote:
> > | We have many places where copy_{from,to}_user() runs while a mutex or
> > | a socket lock is held, and some of these locks are global.
>
> Indeed.
>
> > So I would not spend too much time on this, especially not for the
> > xtables get/setsockopt APIs.
>
> OK, I'll drop this patch in patchwork then.
>
> Thanks Florian.

Thanks Florian and Pablo for the discussion.

Understood. I'll drop this series and won't this approach further.

Best regards,
Zihan
