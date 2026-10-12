Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C4448BB5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796793; cv=pass; b=qI1sD1E4lCrBAJPgaPJSbxssAjlr9Hxdd9VAMmVGJkzEn8Yrc/1vaOIt/ClHhC3bLJvePuuhxtDxz/9YenrpNazZiFO7IT2FsjEUQp79brZrDtZuIQlT+GlZ7Nj1zlMgcakDK/W9+xHPwroqBuC4H1Q5nUOCpX6s9Ybs+bISPyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796793; c=relaxed/simple;
	bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDA5OyluIxX27hIW2C9e+lVIjWGMikd1nXMlU9G9YheMZWcIEeeF/aBN/o2mCErAcPjr3YWJelPQ8aNut5EjnaxRbbC8qu26BjAmh9LFrOVxglkqWq667eKc+vSFY993PkV2DnjtZfwT5k+41z8gmXdl36K58+WEXpxaIxAoC4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GToq8iRH; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GToq8iRH"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2a4e013a44so237988366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796790; cv=none;
        d=google.com; s=arc-20260327;
        b=QlJF0btj9Cxc0S9gSHN6jEBXcfOs05Hr3zFTSDD2auTyvKQC232c5g9KFHy0UGXmQc
         bFUxnp2PvTPx9qqEC9zVfv/xHyLgntqniQ/JwoFpeoS6c5gEJ5vll7ryeLtCqUJmoA1b
         dYcYQh6QZk35h3rlnjDymoSyY1PIqkMeGRvyRaqZnGWFcVN8/OEq3qK1EBuid7jNdhj+
         zszqkJx3wSYIUjunp//0BL0S20ZReDtU7BystvEFvJrxYWe1ZJ382GF/rKXvHHrLfHzT
         Q7Nc5Ad1z5n+vTdyzCYOo4Cqc58oIFKwyFedYas4bl85+rnqOQFue0r5IBNbahPXY2Z5
         Q3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
        fh=aN61n2srmE4Gb13fhnE4kLaWATAaHhRLhgKsAyEZ2CY=;
        b=Q8Tfx33RcaV5Z3woZx3VbpzKwczZaYUCealFnXMnPjhij6NF516Kb6paj8so/U7O84
         yGPcQ6YNX44UF9pBaVjigELW1ikogY5W9TLaZdUoZnD+yX7ydojFnk81dBAdhZP+7nlx
         UpxNbYe2FltLBqNf1t/IigOiL2OItQA4JYXOqwC7qU7VQ1+kaAcjt998Mbhbc+FDvnxA
         ZxlQl7b7NDxKK3NaLvk87K2c+lPAKEUQZTQiZcU3JUAOe/PPdCkCROE53zrqnv55BRi/
         TOt0uefhjF3LWvllwat7kaXOW+0avyf3sr/YeG8/ctdwDdimfoyR/0w1VqOBsOc15Rjy
         H8dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796790; x=1792401590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
        b=GToq8iRHnVvIYGlaMQ3xj8dhUT/k8baLJSbWj+DvN2L7REJP+azoGVIZoVJiwas9cq
         HjptXwPv21aUn9wxlKEl9x9pfHRat8+to4qymSW6b1El7M5jSbEX26aFPkDzHeqdwsBa
         4Oc+qujWNXaZXowCqzwgWzxP/fG+yauJ9dPn8ceuDs+acuT3KoBFna2wZAlYNTGV8zWB
         vhv0BufrIMecOcZX4CNPLKOk3Bdxza/2wu5pewgfMJETM29KG2ygrKAFOsV4e1JDwpwe
         1Q31YYNftRTALmHxEtWL9lxsWNPL4JHUHtzdMq+BZabnie8cz0AwMjyKX4NGbwLMJYje
         u7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796790; x=1792401590;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
        b=unHumzDePgDiG9u3fYYvsbrLXEo6O4XYsHqwfI06cGUkCCFWJ/z1OxvqwvZRt5TG63
         zUrm3qnyHkpWC15ivGQmSElot7SPWAai5WvAmBTJYU77n3aSQ3EGme/bkrRiWSm/p4so
         dZL4a7oRz1RNKawEVE8lTV6QwcNFeMbBet8203tKCLA4NxpaCm5aESbRLikw+F7uM/X5
         I+5PgpLuIlt5yCWy0H/q0ykdEtmButXieqQ7HWmDWPXJRwFwpwUs6mL47ZQ5bSyObvmb
         cytZEd3Le0ym61xentB9HMOVvLPOrGGfN0puLAg8NrNRa5mNg0kS26r+ahdEIu5Vv/sl
         BJXA==
X-Forwarded-Encrypted: i=1; AKwUvByl2HP/Sb3nYDYivSIHppaXaRWAMf5+C8oQEUjPO/CaVhFKbif+vh5AnCcdJl2PyJbYSqx2bd0nwWBMY2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNzlLB9bJAnVLhgX260UHJgMtVAPYZIRAyrnRE8aUIf0yoMN2R
	z1vfkavwj6CaxTCWQ/YskcOCupePmnXsKKgegPQUX9ELp1fOrySQeX6FAmTRSYKUSLCam9Fjlrp
	MkqVUEBIp7EOgFV0p7LHxluvX/BiaKPg=
X-Gm-Gg: AYBFou2DFYmMvXcikZ45kY/ps77DmTDbvN8RmYt5BeW21wkEDe7DanbDZxxt6YbjQ+/
	/Wukmr1WlfEeoj8sEvB8UywWeGwo7no0+k2na4S9xn82k8N/2Y56rDqGEioMyBWK9KUBhoEA2UW
	kAoFWfbYxKBpTHY/qVvfabDS/hSe3E6nAeUVqggH8Lu4un5d+CPndE6DwCYIICvdQNQxkNcg38l
	hryn0MWjaQhn4C5fBw/Q2iTjh3lUaC2jjIL7ueR30sAAYQdUW1u4G5Z1SsStVfS3hLpfgJ0By0W
	CIDeoMgHs6pcXKu5fUQiV3y6O+/krc2MBh4IQH8wtGqpRwmFuD7dkvBnWcNlCdPTqUEJf/l1Bf0
	6z1sSlIVZE49JyjG/iptjpEHioy270Mp5w/uT6j7TwRp2Zham1WrQJ2UY37WesK/l/F+W1aHUc3
	VxeVP0XVslHzHSKqxPP1ryTzkTpwN6q6Ys/tib9R7o
X-Received: by 2002:a17:907:c317:b0:c2e:2ef8:5585 with SMTP id
 a640c23a62f3a-c31a9b0af08mr839361166b.9.1791796789636; Mon, 12 Oct 2026
 02:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-5-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-5-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:19:13 +0300
X-Gm-Features: AclHuK-_ERRyTh4kZLrDH4khT6vrVC8RPJd3Q28g6NygjNOEZR5lX3Usk0n4iPI
Message-ID: <CAHp75VdsxjdbrvjmFS0R0wzFV1pge1L-bfqmA5dwWD=o1Z81LA@mail.gmail.com>
Subject: Re: [PATCH v6 05/13] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> Use for_each_set_bit() to iterate over the enabled wakeup pads instead
> of checking every bit individually.

Suggested-by?

--=20
With Best Regards,
Andy Shevchenko
