Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21793E92A9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085080; cv=pass; b=eqp4XPT9YnV6n0S3P1Wbr7rE23AatNTkfz/0za8NUQLCa8uaObjlVbvT349xOXRJewoi6Pt93oQPneCfpplzFeT+cO0HZIKxGnfVeCSDi65NR9dYtlUgvj1NdAVzxh2UXN9ANeECzmRd5GuTcZjjZ1JQSdyScxXhKEhPITv2Uc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085080; c=relaxed/simple;
	bh=S/kkWPHwSGy4P+S0JQpAAo0Yk1iGNL9+bI1LrpJmTpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0buMezmkoSvsIMngFxltJZXqe9PJ9kuJdlA4ypbm1wFyIzKLFG8ir6xs3tMDe9Qr8In3YcjPJPtdSXqS2mAR7wGyAAtoAeBpAXSOg6skp1FSj5wpKVi238pqkZzfd8SBNgvqX4bS5edmJ1uF3+Lntzbg2+5ZnrwsGUG+mCz6r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWd2UJGL; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWd2UJGL"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6798eb0d190so1771803d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792085070; cv=none;
        d=google.com; s=arc-20260327;
        b=aNKrmIzRDElTg0ltySSfAcOsnLljMJdtOcDn5xmOtyjJyZTg9GS8LhcN45BqueyXJZ
         UegQOgJGYNkpK19e15WpSYD42/jwfcnhvzchwWOZ2sAHS+Y5gDV2sS06DZm8RTVFvvp/
         D1NIakxhka+JCCGgACrcvV8NNa9ayGFe0MexW0Gw5AYWryqkxQ3SN4pn3jj0i1FAHw83
         Li7BRfL0+PRp92vcVdJsCM/GSmAN8I9Gmz59pfDRyM9DiPSShi6m83s2O9cDef5nSWmD
         77EGkvxBg9o6QqIxnAN1scFvRuLVsByz3iZY+nD+KJpnB989DgT0PUtN/K+KcFuSWf+g
         bCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QJ7AwNTLGK0qJotpIP2/0w2WrkX374IVRj5Elec6DwE=;
        fh=GqXsxgBIbXl++C4p0lBz+r6KM5bBBTC6Bud9dPxzruA=;
        b=AlMNQ6N45KHk0KSalox21WrPJX73/7a0cUn72JGCSsqgc6nnxjAlmOCXTwbbg6huWs
         RfWccNMuAQ3uIYXAFwDl9eUYM4X/EUvTw32NvdAlyZnuxlyBivgSTli9T8GhBYVSD4nc
         V1l0ajFMjy25N46443lXsrFq7tQguKM+eLvx6zpQCf80LP3GMwbPvMbE1fm9oopvMNsD
         3QBACoar6PXSANnwRg8VhBFseq5ShM0J0boRoWrzj1hAB0IYLlV2Kd/W5oYkpwQDFhIZ
         t+kSb1ZL4CN1vWrfq8mIriNgUqDopGd0Bh0el54pSySAgb8CXyU3OEwhZ41px8B6oQaL
         A8iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085070; x=1792689870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QJ7AwNTLGK0qJotpIP2/0w2WrkX374IVRj5Elec6DwE=;
        b=sWd2UJGLzuAKdvduDyvmW3+H0AzYhPojsFqtsaMa05JP0LqE3RRIz+I1eZf0+pj5yz
         pR5E6zguECT9aP0R+4+XtquuWSS9MIijhScbkDptfkurwaffvp6mrcmwJnodaTNs4A7t
         SyXbfYzTIBIHcQnWmvaH+jhYEFB1JRbNjWLs3zNQGf7KsLx1TZf5RJLnhsOciKKuHovp
         i1pKdkcanYnIaUI1KxT6zUTSkR5H9q0+Y4/KbIVHI/IUadLa0SmKAxoTzr4x2Gc/F4ks
         6yqHSZ5y0ovdYwol+F4Z//RLXgVy0otqDR8nOrkzwh7DssMfeWhZvBvyj4jt5sVx+Q4a
         wvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085070; x=1792689870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJ7AwNTLGK0qJotpIP2/0w2WrkX374IVRj5Elec6DwE=;
        b=tHymADaoLkZmSJ+fp2bHfrPuEx5m9333g6ts1guAAI2tgTuvSunMcCXH4YahWaqGjV
         QNbb54qAeyEDRhtUkekOy3yiIdg7doSbe7ZENDl39SuA4+jIxIerVvsrS3xETKgMc3yv
         By9GNBahWFYlIVW7Hyhoh5lNCBzJxidmBnXVfFFNu6yYBKgdzwtRKjMCVuGb+lWh4NVe
         KKDaC9h22k87BTYKe7YiNwHGvOr8eT0SEpj6F2wqur+P4awOWny0WzkncZ1bUwOORtue
         s9jm3+nNWlp3K2cFLvGfWfI4XxWA3NLKo59Y+E9fklUL//YkJfEDMiH24+W2x5bcWANX
         rppQ==
X-Forwarded-Encrypted: i=1; AKwUvBwatGmGoxO07uv6XQHSfGd3tTxenlslD+qUZDMtvfU2WFuVeqRKtH5eUXafnzVCDMt/wZocwiI9mUAH+8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbrPMSfdDgC6Z3Ub6IHaxmAo7QUtCre4fjuH9CX2K4BR0dTC0W
	4Mry3ZiqUajeblwLXAcIVwt3t1ot14pVJkuhXfzNGwm3iGOoZSWN2+2c6mu0aJkfKqn49+w9EQn
	gpTPGdD+yfiHKdx6PnuOe0ARLXW+SyH4=
X-Gm-Gg: AYBFou0Ojmb/t2CYba+z5SPhuPQrkTAcIerePa14CFvzP8fFlxGLzoMBz0+bfJLHg/y
	7ygfDygK5yJcUFet/0VVgs+hC0Oe4+gozqOWid+4tszzqkY8W9TnjSIAk+IJMPOEtvBtLdeL4De
	iBycSslmosT7mKRSUECbUWWehqzIH8AJdM3/hfjA7t6bhrWtC9JkD1r9xt2YpgmKmgPmcl3jwvC
	FIuJcsnSYA5XTBTuAaELp8GA9RV03w6jx2b+NJ6KvjZeIAJ3/gH9eBnTNF9OeK3I+LoMF8f+nX5
	9YXMmn8YQlE/w7TABFeVgGDL8obFf5JrgFn1feO6Dilc6PLZhIkwH5Z38xBdMdW2Ys0njcbT1L8
	zFWVzqGNFQAaN///I+nE=
X-Received: by 2002:a05:690e:1689:b0:672:f272:f629 with SMTP id
 956f58d0204a3-6793630d90emr8360068d50.104.1792085069711; Thu, 15 Oct 2026
 10:24:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923055103.949540-1-gongtao0607@gmail.com> <10d0c5a6-98d0-45d5-a196-aa839b452172@redhat.com>
In-Reply-To: <10d0c5a6-98d0-45d5-a196-aa839b452172@redhat.com>
From: Tao Gong <gongtao0607@gmail.com>
Date: Thu, 15 Oct 2026 10:24:19 -0700
X-Gm-Features: AclHuK8ES2Kd8skfs6udor0Fpl5ne5f6cGaytsMa82tMXcwNkOjHwfvDn2lGZGA
Message-ID: <CACmSHQse_McSbBfEiyvCCePp97Azb7a5c7q5rr3AdXncrcSfUg@mail.gmail.com>
Subject: Re: [PATCH net v2 0/2] net: dsa: mt7530: fix trapped frame forwarding
 and egress tagging
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, "Chester A . Unal" <chester.a.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I overlooked the existing fix, commit 4cb3cd670b2a ("net: dsa:
mt7530: untag VLAN-aware bridge PVID"). I saw the issue on real
hardware (AN7581) running a 6.18 stable kernel, which doesn't have
that commit. After picking it up, the issue is gone and neither patch
is needed. Please drop this series.

On Tue, Sep 29, 2026 at 2:08=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 9/23/26 07:51, Tao Gong wrote:
> > This series resolves two issues in the MT7530 DSA switch driver prevent=
ing
> > trapped link-local control frames (such as STP BPDUs) from reaching the=
 CPU
> > host when bridge VLAN filtering is enabled:
> >
> > 1. Commit 3ac85bcfd404 ("net: dsa: mt7530: preserve VLAN tags on trappe=
d
> >     link-local frames") set MT7530_VLAN_EG_DISABLED to preserve VLAN ta=
gs,
> >     but in hardware this disables the per-packet override and causes
> >     trapped frames to follow the CPU port's active VLAN table (VAWD2) r=
ule.
> >     When bridge VLAN filtering is active, the CPU port is in stack mode=
,
> >     causing incoming untagged BPDUs (01:80:C2:00:00:00) to be egressed =
with
> >     a VLAN tag, which userspace STP daemons (such as ustpd) and the ker=
nel
> >     bridge drop. MT7530_VLAN_EG_CONSISTENT correctly preserves wire sta=
te
> >     (untagged frames stay untagged, tagged frames stay tagged).
> >
> > 2. On Airoha EN7581 and AN7583 switch IP, setting MT7531_CFC (0x04)
> >     CPU_PMAP alone is insufficient; the switch MAC forwarding control
> >     (MT753X_MFC, 0x10) must also have CPU_EN and CPU_PORT configured fo=
r
> >     trapped frames to exit to the CPU conduit.
> It's unclear to me if you are observing the issue with real H/W or if the
> patches comes from LLMs or static analysis. Please clarify such info
> in the next iteration.
>
> Also clashiko feedback looks relevant, please have a look. You should
> address LLM's feedback proactively.
>
> /P
>


--=20
~Tao
