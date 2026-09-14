Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885F73AA1BA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789429633; cv=pass; b=pa9xMdoAjHAEK6h5bat+nlwJd1NwuE0KFw+Mk8bji7T7FgUmXGNNmpYDKeHmidSYnL9nD/wA3wwyEiQzxNLsoplr24GWeuZA8Ka4OAKmXh1zZCdYpnL+xasoP1veefpfvzyhVtfomqJT/Ycj49EjLe+xOg5hX1WivDg5FaBPyqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789429633; c=relaxed/simple;
	bh=oK9gNr6FEqLo45K0RkNT/yAk3ebgfwqHPtjzK1AF9cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kx9gUTKVzOPui3Sr2QlPK9yJ9mvcigjDirPG3gqU9hk/RSeYiHatC1NVii9L7IZgzvmhKz7v5tfwS0ZuPZp++eJobqMJWdmyKf7a8ofjrNJRzvN0yAsXy8y2VOAnz3MrMyAKSjowB3b1MwrSwMmCIT3ku8OX8ZDJa6fbT6gZEd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=skAGjK7c; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="skAGjK7c"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43da99easo26195507b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789429631; cv=none;
        d=google.com; s=arc-20260327;
        b=kNiZBdWutLvtGhLmbr8pQj/n/IKoLwS7hQebVuACyDM1pABwylOZ34IYfgfVor8CzH
         lr9IjfhkDjSM+pBIJNaZgqM9rwSaeL0PiuSRTYQ0KnqhqsLohAgbaq1So/WgA8PHiON8
         wQDMHomsVT643yZZlwNVojPae/NybZIdtoR611SOrSmGJy8iZzBLExvSk+6PHjIbKpBl
         PHTlTtzbLSQcEpd3KwZzPhuJn36hqbmgen6WqfwHup6G5Im0qy/RUDhQQpHFJYopty5M
         /MCSYaoFjskNb2xV7Q/GoE5pgJcLmzohLct80RFFp7Kkw30qLBRNC7/35YdtPqrBYoWU
         FUcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cFthcrFYFgZKOOCNtEyPVxbnm0K5sPNXxafO3124q6U=;
        fh=TIvxLuDC9MUIm4IMuHmsJbOr4BWxym0bVX+4FmFQ9IM=;
        b=XlhHlKhJk0LvHwpe82wt9RL0B8DXlzCbdAT59YhF+wdJ1nkk2kqUzCdpbzZo7l3RvB
         8K+5ruzayV0Pn0RwMxrfWZIex4BOdoU1THVGP/9TCKahM7PvGyZXSK6TvFH3hshkqSNo
         RrepNX+eEa9qMA+7laIopYQMlmPv8AaUr+TMiy61Anl4yA1am7E5vKn04vjoCdAcKbui
         tCJkyIhFGm4S5xfgY3KPM9G79k/2ouNUl7tX97TmJQ6yvakQHvVqxDFQn3UAM2ZWrzNy
         U9oLq4V9BYA12BXcggBp/8eXnI4CK8FBIBba6UlxfYHuR0cmZ8a7TUe9DsFsgt9KLiyn
         14Ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789429631; x=1790034431; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFthcrFYFgZKOOCNtEyPVxbnm0K5sPNXxafO3124q6U=;
        b=skAGjK7cVNsXrBWKxU0KjzCohPYFFitzBmUKKAVeXboV6gA6vQlqhMQwVChJgk5Nim
         RPs/+wN11IyIFWzx3b3i+uFXUAq0CxAGyLh6YyLuPCpnh4VIus5/fkZQsqKGUY8hJYAN
         futHheNy7lj2Gvbqn65J6mWl55w2AVeDb4MEW3h7BHnyPZHvQbC4lI105CvW7x9WLb1Z
         j16HnPUZE6ejEz8cRPgWLAmEuFj1Cr4orodxx9sntZifqoE5lttrn4hdmlTdhAFewN1N
         b3Xzcuc2s7A4e0e9IV8JWoIdD0109crvVtE7CurEG2dgAlE1rUUC7mkCxHSg3T021Lm6
         FGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789429631; x=1790034431;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cFthcrFYFgZKOOCNtEyPVxbnm0K5sPNXxafO3124q6U=;
        b=ytcc0ufIK71rxgWlL8IRW7stKXnaf4iha5Hpe+vuDT8xnLFEhNJtb1fSICbNBbASLJ
         ZxJbe1BtfC2a5xRUcjOc90j/H0UUzwsA2wioBsdwXix9kA3z+de6PIGWlP4aIUBYyp7k
         /7CNvphoD2DqGy4RV+a1bRFo/mP1i0Al1rHN7u9qoke6d9I/AC0o1YtHwu7hB2OdYOcO
         LZIu8F6HX3vvh1izzKUBg97PXJtsoEGq6twiPt2DtzhXcQbAp5By6Isvuw4O91x89mQm
         r3Nhq1KOd4qTve3YWNC4u2MUC1dl6oUPR1umfK/oENjAlif4ibx/5jtSx6jopYAfK3Vv
         c2BA==
X-Forwarded-Encrypted: i=1; AKwUvBz7T4P/ldmlUbveoqdjV5/SIWduQBW9PjR3Gb/lA9hN00sahdxzXZrclgVXlc5KOuXOpSh0zSIPmoWed3s=@vger.kernel.org
X-Gm-Message-State: AFuF++muhQLfWhkQFE7iFQ+POYDPAj6HAcumwi70yV5MGtRWxXr15n/d
	4cIEanH0DV3n2c4Sju97lZMjDbpnilvxTI3ADUCzCR/3VNOo+zhsh+/TrsNRIDqKWu6Q5IcgLjB
	D87nnrZrH8ouHNplEfOx9kLa/OZ/2GtW4msWEdY5D
X-Gm-Gg: AYBFou0+WxiQCBc9G3toQJQxg/Dj4bVpS6hBLOuZYMmjvFTZzY1k8b9on+WiXWE93FS
	n9gkUbPZZAyjtVO1deSjIArTe727tlFe5Ey3CwP82rUKtnRRbsAJNRBmoZJJfAY17BhMjBiLsT3
	s1AtizBJ1qWazjlGP+1ZH5v4BvMig/WH/wQuBIPV/rVbEFwY+TbNtQhvRLjwGiNUMRuTgIQFLOO
	HnrFJVLAR+mp7J1ZS64OwL2HJcVi1DphLAFm3KXmdVbAdwUqz5lBSUtyhI0bSOkacup5YrZrvo5
	Imctai2ughx1YxmYW3JXV8HuksHbRFWhGevKcDx8RDui5Jp/rO0ocILzkcS6nK4z3V12YcR6s4Y
	y29XNvHF71g==
X-Received: by 2002:a05:690c:4f85:b0:873:5bd1:98ce with SMTP id
 00721157ae682-88d246564bemr11903357b3.64.1789429631046; Mon, 14 Sep 2026
 16:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
 <DLC6ERLST1B6.6K3HLH38DQLK@google.com> <5fb77c2c-40b8-4dfe-95d3-e0c73b8559bc@intel.com>
In-Reply-To: <5fb77c2c-40b8-4dfe-95d3-e0c73b8559bc@intel.com>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Mon, 14 Sep 2026 16:46:59 -0700
X-Gm-Features: AcwNN1V-uXXao4kvW2-FUblLASgfbHJF_w7kOEKYfus9MUe94SpKIUhs3nxCeVQ
Message-ID: <CAHreonHEAPrzhVH0AiAzrZOr+h8D=T8hB_oC0TP50d79y_OWSA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> actual_len is a problem.  Only 2 controller drivers support it.
> No I3C device drivers support it.  mctp-i3c reads len not actual_len.
> regmap-i3c ignores len and actual_len.  And its definition comment
> is not exactly correct since it is only valid for reads.
>
> Despite that, the additional issue here, is what to do about a short
> read.  Seems like it should be in the uapi, but actual_len needs to
> be fixed first.

I think something we can do to get around this is to incorporate one
of Meagan's patches
[1] which addresses actual_len usage in all the controller drivers.

With controller support we can add a field for actual_len in the UAPI struct:

    struct i3c_ioc_xfer {
        __u64 data;
        __u16 len;
        __u16 actual_len;
        union {
            __u8 rnw;
            __u8 cmd;
        };
        __u8 mode;
        __u8 pad[2];
    };

As a follow up, I can also help clean up other i3c drivers in future
changes, such as mctp-i3c
since at that point we should have actual_len support across all the
controller drivers.

Thanks,
Sam

[1] https://lore.kernel.org/r/20260911210935.1353126-3-meaganlloyd@linux.microsoft.com
