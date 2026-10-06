Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34243AEF34
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286214; cv=none; b=Pjowl65rhBIGZC2XsBtTOkP/g2dtXcmrJGz/Sys78EV97tJHMJjne+rXf3tIBRKsEpAHcmawNPaG55u19AlTtdbMkOh6XAAd/5kgvOYgdrx2pmzXs6PY/X1K7Iz1U92lgSbmwpler13S4E1dYMd5PQ82+qnpIpLt/ZFrCDO7cZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286214; c=relaxed/simple;
	bh=t1eS7GNMzS/X1zSiiJQ+Thm7b5jH6tejPYkFnZ5ZqFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auKlMveW5OjVnVA+yon7KRBNzRb9l1vIeksU3M3RsLef89We2UV50LzZ3rrfGE6wJCcsVlnmV3ju2UWVvbyEiy3erjIv5Tz+7Ooe5MetbukHWp97UOCbGy26ajSgakQ/QYjTm33b6UtksN8PCMEZuUi+f1Dg1XjhrvIsp2xJgM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Mr0ld3vx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Mr0ld3vx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16c399641so6496935e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791286211; x=1791891011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1eS7GNMzS/X1zSiiJQ+Thm7b5jH6tejPYkFnZ5ZqFM=;
        b=Mr0ld3vxUODdq9tWW7gGE9RfU71+BPfUpVJs7NzE8MPzvW2M4yV3znHgKkowk/htu1
         mwWPcWvi25sMNdX2DnRYNSaqDNZR5fHH+42eon8o2BZT7amPEBjOEMTqsVYr0fH/0/gX
         HhaIcY+M1qQJbb1A6dXzq8LjhMx23Rr0aAMWB+WN+XfynDjs7mStTcQP1UEmzG9reZmv
         O43/G9sfxb7H/YArbVWrtdHe/QCEx9lMflQ94kRd0snMMlSatKhsAR3eTClTpWA3tWmo
         vdIx0TgdUF1DIesDKnZgBD/HizhEnpm/1B1WbFaYURHYzMEWF5rkRpq36EUlph31L3bx
         46jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286211; x=1791891011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t1eS7GNMzS/X1zSiiJQ+Thm7b5jH6tejPYkFnZ5ZqFM=;
        b=1aBWkzXI/zaimoeiyBKTnotUgHCWBNYxbPhpV2ToIM4vVFQAios41HEQbQfTpai/0p
         Z4USccglCyAKpztA0pCPEZyPoRn9QHcoslGSMppUEVVpvkR/Cu4KACt8B3K0d5ISx0DO
         eb6NbGogEbfv4fm0jLa9AhMK1t549uLxFXaeQ+sRtZFCChfwjMuv56+TrnSYNvb4FE1V
         WqFUtWRu5a3lRvtZwBaRI98kXByfFE3Euezmg0lFs6rnGSOpmzkwhpVeeqNl2UHtm1e4
         kSKJPRbITrfHBCbHKShRVWpFbB7w38iIeDupmi5IaPOby7hYTw51WkhlJpfW4kDY+oMf
         ioUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzod8zu9g2kNOcWJnoFt7YAC7KdbuPo82ZzVsXzRuqYaojk/zvoMCDKcsrFTJv+2EndV7a1ScvMEv4hbME=@vger.kernel.org
X-Gm-Message-State: AFuF++kNS/wF8y0AXUqQFA/txtkhpZaMWkAIRZf05EkTlMzQAjUMzIub
	fp+L47lbuZWSwWnEGurdaG8ccIB8kRwsNSXxVNE4sf+M2RQYQG1vxH14+qyhpJUSRPY=
X-Gm-Gg: AYBFou2i4iD8R88FkRXuuIO0wCwaZ8IbMFp6VU/ryPcUPZc0PyHsCtnFzczTlCmIQX7
	UgLMDB7Dxgkdiphu+KhMljiu3xNWVg/QZnBCCqCFmjr7gvvrD3th7oFi/ZqP4l8rSoupxOowVZi
	dJAD7glcKrBC0ucGXXgGQz0mWscXPDNtw36SBK45WkmBuVT3/7v6IkjpVfQvi6Z9AN68wGPfjc+
	LOeagnaHSMcYLY1gbX/liN22ggXMtzWXZ0DRK6DNQdqXhyviolzQi+6qoCHqlLw28dbt/MlgLyL
	7yi2Gmik4bz9+zrdnRgX1do7XjA1McALov8P1FRzqT07XQkzvZj82qu+CG30tofRvbAa0KESSMJ
	Oe+zKZp/TBOV3N374Q30YHS9JgzLXtAIjxUwS2fFErHF6zG7HyIiiFuFOZIZOxvDxgHACgfuxAo
	W1D/Nm/Rc4Yt4ocUMKQ2j8wCvCK7PoxQeqUrV/cH9DzxHFEIox91dI7nYMDpLCug==
X-Received: by 2002:a05:600d:82e5:b0:4a1:6c3d:cdcc with SMTP id 5b1f17b1804b1-4a17b5301camr21722325e9.15.1791286210143;
        Tue, 06 Oct 2026 04:30:10 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff106d8sm288381415e9.3.2026.10.06.04.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:30:09 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	f.fainelli@gmail.com,
	woojung.huh@microchip.com,
	vladimir.oltean@nxp.com,
	maxime.chevallier@bootlin.com
Subject: Re: [PATCH net-next v4 4/4] net: phy: make an unbind wait for the attached consumer to detach
Date: Tue,  6 Oct 2026 14:30:04 +0300
Message-ID: <20261006113004.736294-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179120529945.434549.1233446733190047739@kernel.org>
References: <179120529945.434549.1233446733190047739@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Can this wake cause an ABBA deadlock between rtnl_lock() and the
> PHY's device lock when the PHY is driven by genphy and has an SFP bus?

A genphy-driven PHY never has an SFP bus: phy_setup_ports() skips
phy_sfp_probe() when is_genphy_driven is set. So phy_remove() takes no
rtnl there, and there is no cycle.

Aleksei
