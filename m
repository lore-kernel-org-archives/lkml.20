Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3713B27DB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790523394; cv=none; b=huTvYWeWQWtr5DDs4Lt01tLPNt8Qwl+pCqRA9vQmzKocjr4v+B6Y+xx8EkM+9q8tXlU5lw7jXNdr+mnpgOYGk5K1ky7YEuNOSpNGHNiM2IYmtJnF5Lyjn4wqjIt65z219mJOfBH4luNlUOF8IP/EXPrq7gyqko1md9MQe4O0k4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790523394; c=relaxed/simple;
	bh=X9OlPvvbQwiUF/S4dqIDotr+ufXExBzARPNlDD08gQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MiRuno9R6RUOF4WHi4iH2NnwwygdAu0JLuDNLS2UiJ6cFIDKSoR6b4vF0G5ksrTTwCGregtIQDluCj/0VXwVO4wukIZ43f1zsApedt81Wf/F6r8aDhGMVTFKfiQIaRVrpaprbT0VzPeqwqwNBj6tHxgqNOiA6bZG0VVXkA8yHJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhRrPFqh; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhRrPFqh"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2afb4e9977so211105766b.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790523390; x=1791128190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9OlPvvbQwiUF/S4dqIDotr+ufXExBzARPNlDD08gQQ=;
        b=NhRrPFqh9nM+n3A3ctzUsHmHd+MwvZ/zyNbDoN1wopRjPhWFxq1lMYdNgBsPqQCgd0
         hYNVVtFxMnlSdL9nubzzFHdkEuhmRSP+0FwjmNChR3dkMmuMITu9Ix9L8lNY0fyGVcLi
         6AxUgmh4nTJtuu5ZzOGTGWw8FpHjFdHTHR8fM5ka1oVOudynt9ITivGkXdvQ+Y2WePld
         DVgJuhNszFl9YVGhja6SIhm0rlE5XPAxJGfry6ZppZDNtRfGaI5mE8pb6cVhPfZ3bH3z
         j4Hia0uF57zoYLMmOPFDuX74/Gp2JfmxXixcCw63DrWrEGIj/fN4RaVjAFGPWQM/tR4N
         6UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790523390; x=1791128190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X9OlPvvbQwiUF/S4dqIDotr+ufXExBzARPNlDD08gQQ=;
        b=AMNTaIvtoWso/WyvR4KCx0iefpcd9xA2J0mD7MHY9BSonpge/lZeLCa5XPKR1/s6Jm
         XC9riyEgETaySVj0N4ny2i23RHKSgry9UKngtZGQLWM24t7v9vGWy7ejJPOW/qbyvxvD
         psQ+txcln2aRrPbNs/At1mw4se09M8cwO21TJOZu2MtnHdf3nsPoqWMjBX2l3kDO5zSw
         5xrHdmezAqvHygGgYXTz+fwZRkezrXJUUJw1TmkIxwlEJKnGc9Q37VW8v/Yq2CxTiOxF
         KqMZOjYCFTSCqv8SZFjMv0lCgbWxAvdiY/f21kg3HP43wGLBGJWeROR9C+qxq+TMNl+u
         S62w==
X-Forwarded-Encrypted: i=1; AKwUvBx8S1nkpsHZUh3Deg+QU3DRiuiphRfuz2qUthEW0V/QatL/bRq5FT7LNoLo7r62z26sTv0SWn8KD0Dt93M=@vger.kernel.org
X-Gm-Message-State: AFuF++nh0eqtLp9Ud7f0Um0LgAKI+4LMiHwh61traB7PRPPHmPHI9+6I
	tCnhViFSH1RnRAZEi38ubcG530NKsNkdW6CHe/deqzAPN0ItNhELNYKC
X-Gm-Gg: AYBFou3LGSfHoefTI00+m6sxXb9jgip1kVczGgzs8THicS9w6G8A9leloy99XO8W1B5
	w7FQvZVwE2uK+2gOYMSUeEvaaghdP8XQ49asdLf6xeiEZLwFk4AosAyK+a65fss9O3tQle2p3bv
	TpJNkyOp1Qm3oEDIfnxwKC5wDltNqHAQhLn0rhthOJgu62XwouwfPOFW2OHWBKzox83l+ZvgMdP
	6SwM30ZlDfN/TTyiLr7AKPIO9Db23khem+kmrRyUBm+icitG5FvrQoWZ6goewNz1TWbXk0C1fdP
	NIpyI1VYWdROzD8n5cAsXiLOxAXNN2iwhjQJNZFJgj+oMOQKmD3OhDOq8oXqGtTDEmI56IjNwvK
	gLv+3bh1f5rCTxhZMnkKtohYklaIeX31THlyawBA4yaleoY4WXtEXUOcQn+hd4lxVUZUfw2Rd4Q
	02gh3pRRbVjEYc0nPaeyoRLiJwItlXBLge+uKhQarP9ffG9rkJe2vbVgQQ0QCvxSVYptb27Ke5K
	S1eZ+e+4AcDWhwySm5xoQS0yLNWK/R7Eg2afIdCPYyGsxmQMyF9Qvmb
X-Received: by 2002:a17:906:dc95:b0:c25:4f7c:8ec5 with SMTP id a640c23a62f3a-c2ac223aa65mr907640266b.23.1790523390248;
        Sun, 27 Sep 2026 08:36:30 -0700 (PDT)
Received: from localhost.localdomain ([2a02:aa1:165c:44c1:e5d5:dfb4:8450:1cdb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2af8ac48ccsm256085366b.38.2026.09.27.08.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:36:29 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: Re: [RFC PATCH net-next v3 4/5] net: dsa: qca8k: flag QCA8337 internal CPU PHYs for SmartSpeed
Date: Sun, 27 Sep 2026 17:36:16 +0200
Message-ID: <20260927153616.2317-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <e18c66e9-7ba2-46c0-baf5-b4281a45755d@lunn.ch>
References: <20260923215858.1653-1-yongzhao.derek@gmail.com> <20260923215858.1653-5-yongzhao.derek@gmail.com> <09d669ff-7aad-4414-880a-21c2e7bf2cd7@lunn.ch> <20260924234814.1734-1-yongzhao.derek@gmail.com> <d2797713-9b92-43c8-a26e-bf3bc9817ad8@lunn.ch> <20260925210153.8717-1-yongzhao.derek@gmail.com> <69b36e16-eece-4739-9208-96bd8e60943f@lunn.ch> <20260926082129.1632-1-yongzhao.derek@gmail.com> <426f9dcb-7473-48d5-a473-4435cc81312c@lunn.ch> <20260926215152.376-1-yongzhao.derek@gmail.com> <e18c66e9-7ba2-46c0-baf5-b4281a45755d@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrew,=0D
=0D
> Also tricky. What we don't want is other developers trying to abuse=0D
> this to turn it into a configuration option, rather than a hardware=0D
> property. So i don't think it should be a generic property. Lets make=0D
> it a qualcomm specific property. I would also put 'workaround' in the=0D
> property name, again making it clear this is not intended to be used=0D
> for configuration.=0D
=0D
Thank you, that makes sense. I'll use a Qualcomm-specific property with=0D
"workaround" in its name, and word the commit message around what has=0D
been observed, as you suggested: an on-board PHY-to-PHY connection=0D
without a cable, where SmartSpeed has been seen to downshift=0D
incorrectly. The workaround would then apply only to boards that set=0D
the property, rather than to every QCA8337 internal CPU PHY as in v3.=0D
=0D
One correction to the data I sent you: as Ziyang pointed out, the=0D
IPQ5018 short-cable DAC values were not being applied on this board,=0D
because the driver does not shift the field value. My earlier A/B runs=0D
were therefore done without them. I have repeated the A/B with the DAC=0D
values corrected, and the result is the same. The details are in my=0D
reply to Ziyang in this thread.=0D
=0D
Before sending the next revision, I would like to check one more=0D
thing. In these boots the QCA8337 CPU PHY is reset about 38 s before=0D
the IPQ5018 PHY has its DAC values configured. If setting the DAC before=0D
the switch-side PHY starts negotiating avoids the downshift, that would=0D
suggest fixing the initialisation order rather than adding a DT=0D
workaround. I'll report back on what I find before sending the next=0D
revision. If the workaround is still needed, I'll propose the property=0D
name and binding with it.=0D
=0D
Thanks,=0D
Yongzhao Chen=0D
