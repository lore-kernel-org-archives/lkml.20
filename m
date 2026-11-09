Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.130
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794268695;
	b=AURm7XgyA6JDiLLgDlOiHSRnb0/MilrIaR7cs1ZoTluLgonrXncWVfzid9lAfX9oSbDK
	 l+z93Pl7hx3o3Jko3jdxBY5BynH/SOtsb+GuVLeM0SMHW2wX30t8VWL/968fLdregfz1V
	 atr2RbmjFW8LgBaGSeJvCQO0B74DWBJfVhpngpiVktQp0ozvx5zOA04BDinBPSJdxFR0L
	 rr7R6a9tslTgI4obM2RDEWtsrSJmIfERV4y3CRDjVFrStwLI72wXUq4eV14/mKVTQbtJe
	 i8nJVPlaz7qxHP6j+aJrwvNTzGg2Qxj+WAf77ECy4m0kkOIlLj8QbmZ+xXxt7CmLj9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=B3xgcv76EQAIc2HtjPQ27DBd3dSBpeYPhZDku4jNZpU=;
	b=b7dYrVmNC7O/Yoxhlr7kvIxA7qilriMNxWM63LTIIYlPzjyNkz9RnwQDM7Kj06/Ww6O1
	 dFmLGBXL+oGrTXnM7LV/e+AmN2/fBNE8p4vyVg8OJk7VcyWM2DFDWRTJl2vjeYLbgxfYn
	 uW1/7TsiAiOqkCiCJGDWq8EwRKiruXHP0Yk0OuDMY8YjHV4ejgGo2PYgYzBSBSnmeZ7rs
	 LMOV/gik10k1CcQepk70KrQHx3uv81rHQQ6+SAUawF7n0sa66bFZFJzT5Ra80esPJQH4f
	 l8H2T3j/UnawJ4Ew+3nNwhXjLPe3sAKrxpIplUH/k8nfnC+Gy5RgJ/F9OibmtNxR/Xg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6feYrWZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25054606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25054606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6feYrWZ
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-84abe8ecec8so641110a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:58:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794268694; cv=none;
        d=google.com; s=arc-20260327;
        b=ZkYtaqY68xyjNe+RhcicfCVrzPGrP+ipTnoXUHQOSww4N+FakaJSZU625kB9LHuKoZ
         2ILFy9PDR7d5ET7iuv6g37qkU7niywBTRK31pcy5gdWzsZj90zyCZpv6QqiIPRaemBld
         xKnludIwRE9Xe4eQTngPQfHDzN0pzy0j8NdgrIppgY+BaJDyxlpByOxkHdLDnfumbZkn
         SvCyjNZYQZ5ST13uY3t0LXVD24O9CEvLEQb8f4uYXg20F+Q885I4NEkkmDy3ScE6Vrq0
         aNUVRKP+dmRisb8+2It9hmlzlb/+sI67vbto9SJlKR6hyqTOVTiglU/vi5Q1DJNS9q/U
         cqGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B3xgcv76EQAIc2HtjPQ27DBd3dSBpeYPhZDku4jNZpU=;
        fh=HRmPobKcyrf2WbqFWaKeTYg0z7Xu/QGXXR6XUXqL3Zo=;
        b=ht0zAa/zu87z8KCzQXk96+J1WonORWDefNIhkaTyDESWAsbBU+TChK31lukL8p3/gi
         YeoKmKnkTisjVN2p/WmV55P59Nlvg7TU2KEW81YxdYBh7/pMXlnsk3dih893kwM7uM8g
         F4Z3HJietQ/va99KeykEboMFf2PoprwJlleDdMB6FLT36Zl/Qudb4acglhqWFTjmCfZ7
         MAKWA7P7Lwk6V+Bes4EnjAWUrBCGU4BKSpg9zwBVJQOAsLZIaUURAqjJVDR67/0KjeRP
         FdmNhUhf72JWp++PKuxWmz81neJxmGTQRESPe5PAUOVAeo1x65QSBAijsCPOCSC82P+v
         e4Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268694; x=1794873494; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3xgcv76EQAIc2HtjPQ27DBd3dSBpeYPhZDku4jNZpU=;
        b=W6feYrWZzhLEPMNLCKkZKztN/y/rZE1jfr/hKRqc4WAMkDgqRxAGxOxS/xDyzIAtFj
         HnZa9TbDAfkLFVd6v2WtW6io5YYICRcplYdh90y9/yZMoNvc0sIAP9zZjEcqX5clJwLk
         3ozbF+3ENRJ3bmQp8HvShuy7i4BCXSD7FbIrRvhx1yMiGvTL7QYowRugak4/uGpr3USC
         Rz9DemnVrDZ8CxhqFvLk1ecEMOkoIgCm4YuM6gHOTbeLMTIignJs0ADIyDLaFD31dmLG
         jLaiNhuiVqQdEmB7oBeTzuVenODHuMIp1858FWPYIWB0FIhUv6gfgQNcCOByT9QuFvIr
         Bvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268694; x=1794873494;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B3xgcv76EQAIc2HtjPQ27DBd3dSBpeYPhZDku4jNZpU=;
        b=1RV5e3VOsiO5OlXOkPpGURPsXqlR2QDs9OnBhGeEOfPjonni512GEM9XC1WkmDoBzO
         IE8SM9ZvL2lLP9R+Di3jiik9iJ38po2lx0c383YR8R/KF+yS+xk99n++sylud0rC8Y3O
         TrdlM2HmwzK1Cy8gkuEg42FdjIL5bP6dmh8zKAEUaz4/shptpe9OF27PooO/ZCyaf3IB
         9zXCgOAShWRrmN3KreFAwE4YaXPHYOJSQewXD4x2dxnTVbOTiDDDyz8vUJMACiqYy8D6
         aZhdqJwf8HwFy7LGRNp/q3Fp4fW/gPTDiC+hii/bE35j/TP3gR5FrMJJ7h4CZyGSIyry
         BYnQ==
X-Forwarded-Encrypted: i=1; AL+hErFAT+fpBC2j5PoChfzt+Ie6bbGFOSHPk9XDc0voWHSfRbMOXlhYgDSJ4Wu7YKi5A9/RjpMRvQgrfdyy2Oo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8btF4uHXa5dg1SlZhERSuotxhBL3VmzQpgNHpIDi/MJJ+2Uw+i
	MoDnwL5PyjDsfolfYpqPUjh6TnH0zWlrNE4bXp5M6yvIfau+cJ4So45wUNXm2Xrvq2OANPgFm8E
	CTUz+0FZBhpxrgZ3S14t3ReZJNobsG0EUDpQj/5bunvnX
X-Gm-Gg: AYBFou08McoqPVWQoI3eKedSIqBAIEJXfhN3j2pY7BYNF9QvTEYqElnT4+UCCcg/WyM
	6A/h3e/m5/l+CqiebukpM8LX/K2yxy5H4w2G+0rIz5l2ezMwJ59lhKWDskzpp7oO4DLfi1oHwKB
	gvghrSrMpYgsEkzBoEBNYD0eoOKKkLWAeotsucI7LnwPlFKwLnPYF+10dQ+RD91qj8SnhF5DqVq
	qALeV5N59EfOgjAaE19CY2xFCdIoosbGpdcO6uBb0Yc3sM8NE1SeIAKH8mHjYPj6bOwOuCTHvjM
	g7GvMK0jlhpfkWcGEayJ7WP7ZryiUjSyUGnYaMP1LZxxF8hTtVYx7/87kJV+rDCvECirv3h/xjA
	ss9LW5hllnJl9GO9cSIuxqDxDtuV2HhXsgxTglifJPgDANd1vEnqS06jTURrGHYWDdL1M0XT2tw
	nbqs1D7lD1taAGJ/dMDTpD6jj0K3HcPhfn77iD7kKDsFUWFAJabq2g
X-Received: by 2002:a05:6808:1827:b0:4bc:336d:7494 with SMTP id
 5614622812f47-5683cd3f882mr943882b6e.30.1794268694027; Mon, 09 Nov 2026
 15:58:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107211753.75932-1-dennylin0707@gmail.com> <43045fee-e8e8-4f42-a535-8354a53680e8@enneenne.com>
In-Reply-To: <43045fee-e8e8-4f42-a535-8354a53680e8@enneenne.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Mon, 9 Nov 2026 15:58:03 -0800
X-Gm-Features: AclHuK-EsFH-ieGfoKqH-PErFZeiy3VtHKi6SqIC9k4pf0Ig9uxdimmnImTZ9Ts
Message-ID: <CAGEkeHdr73NeT9ig8HrUtQjDN1xdL1JtbkQOdpQmgf+obi7qtQ@mail.gmail.com>
Subject: Re: [PATCH] pps: require CAP_SYS_TIME to attach N_PPS ldisc
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Are you sure this is stable material?

I added the stable tag because an unprivileged user can exhaust the
global source pool. I'll reassess it with the narrower fix.

> Did you check whether this breaks existing setups?

The check would reject that setup. The default capture settings can
be used without PPS_SETPARAMS, so that comparison was insufficient.

> Also, is pps_tty_open() called only from TIOCSETD?

No. Reopening an existing tty after hangup can reach it through
tty_ldisc_reinit(). The check would use the reopener's credentials
and could make open() fail with -EPERM.

> If pps_tty_dcd_change() is never
> called there, wouldn't refusing N_PPS on a pty be enough, leaving the
> real serial ports as they are today?

PTYs don't call dcd_change. Rejecting N_PPS on PTYs would block this
path and leave serial ports as they are.

Thanks,
Hungyu
