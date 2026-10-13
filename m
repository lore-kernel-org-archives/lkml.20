Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30014A093B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871781; cv=none; b=h8glGQfZSStwAA+JvUCB/JU2J81n77BbnMdQ0q8veTYKOrW21nbAjDYkf4laP0ZYYctkgO59H7kUlCNqNXIHHNwLqNLv2hOa25PgZQYtiDpXreD0ksgkFPCscBSQPke20mlKKnBKMw+5V29N/hFBgyG1h6VniKg+p3GKVIBkG3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871781; c=relaxed/simple;
	bh=5qUdG1fZIVOpI3Y11JBzeXPhxm8ylKtCi9anh9rDrIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yrnq/sCFtDTwIS16mooeXcow7Ag/YxxNYm9FXxysDH3rw4OLWlBo8TvXWle2ZOo5tRBKbi9SDZ3pWWiei1uxIAG/IFbncUMO0ugppApV4RN4/1C2aQAImDXMvot36Bata59cWTX7CrMoYcCP6dgwAKGuk9fH4zo7P+Pzfs7tvZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIBk4YFu; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIBk4YFu"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33c2520ad38so5996101eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791871779; x=1792476579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qUdG1fZIVOpI3Y11JBzeXPhxm8ylKtCi9anh9rDrIA=;
        b=MIBk4YFuH3cS22fMRoU3a1C/Hd+OS9z2np05YcE93fEAjmPPblpu/kmazNCoHtGL6P
         biKLr32QtFqsfZ9zs2XCWvMUJPNhVG0ksnjY4Z0JfKSaZcT1Jk5nFARF5tQKfsQWFZDb
         1BtyFshcZsagKD0yx5r5QqJjZpUWMwC4FCFC8tx6afixW7nfuP7rTAId0q4v8ys/aeO3
         HDVaufOR+hVkGMbu+6hicdfKABe3P1fgQJwRtLiI3i0BAKe46xbhjnBGskalbmNulYsr
         9FNESUx3Hz/SzFmFpuTRKejTe+UIP4shLD5PzTLkVbljVNOaNGRriFdn/Uh+58g1kWS+
         XkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871779; x=1792476579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5qUdG1fZIVOpI3Y11JBzeXPhxm8ylKtCi9anh9rDrIA=;
        b=YCQvZr54+U8fx2JN1mczSdn2Md5RDQxwKaxkW8ZR1z1Bacl9kysrQda0m+3zCJgkyp
         fiFGi27BAjHsFVDWfr4nK8fsnxM15iVD9VvOZfBL0Uz2cSb0x0/VFsvb0u3BcThAKszv
         BB5QaBMGKYv62LXVz5+Ftfqt9EscmCoa+CbHj266Cegd79IY6nvRsPV31w5JpyP17CoY
         56xI+MnEAuX/M7/ae0+w88jk6lnZLnCMjjDFgiUtpQay+3qTjdl1JvgIN6VWc17xij7Z
         wNjZLO0WhLhJ8zbMSTV6X8NoNKk+wemdm7yYP+QLO5gmd7Ies8aZ3xiBuZUX6CFbqlvv
         Zi5w==
X-Forwarded-Encrypted: i=1; AKwUvByNiOqGEFucYSV69rNzurwWm3GcKBNincDdrgPJBV3AlmLRY453z+VI/EcclrqBv+gsY86nHHnUmpmI2TY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRZnShdAQJLGm2ryr7Yqw/G/y7iISpqfj7Sm550UOE3ixLZQ9v
	2sE6MS/OBjXnI+ODt+kddqDqxgZ7F5RHQR5SH4bzOGAuabESAWwgkmfw
X-Gm-Gg: AYBFou2G28TSh9trBpR9k93+ae5vb1rUVsULAmhA5cWJ3pP+ATratDe897ptYkpKr/S
	YW85o21XBJYkss9yfVaoMqAioIvJs1qSw7jPaehP8ORPuCVHf0JD8pY8DpIQVF+OU1t0d9abyY4
	3RSoGwxv03TNHlTL6h8ZT+X/QodElzGv3oyigkY/1Kz0FzcQ8MktSKksMuvoysk4NFJ2hVg6/lC
	GVkDF5NCLrXdmMfhbnv7Xg/osW+nR7gik/Mf3Lh2oLyeQwfMN2P4JmNuSbcGd6T5xHOb5q6q708
	MQlMqZ+7OTNHOR5OBh/7pu1jTx35fDl0cM1fROUXvrBFnQ8dcBmCgoIV/GhRcd45yyz/vVC4tYP
	u3exXaXZFf03+mIPwIwBwGC0GHBJj1cCNGkPdT43c47v8g7GViNXtqce6SPjz3vKGb8mtMKhREq
	6RL9MNr2oBcBBkqd8tRyCrnSCJmBr+mLLmSRAgbg5dNqkRyT61ZShAfgb36Rf6+ImcYdLdbYhSZ
	RfiZtFOlEY=
X-Received: by 2002:a05:7301:53c9:b0:359:d4c9:6081 with SMTP id 5a478bee46e88-359d4c96379mr8845059eec.12.1791871778652;
        Mon, 12 Oct 2026 23:09:38 -0700 (PDT)
Received: from online.mioffice.cn ([2408:8607:1b00:8:5e2a:b6c:f432:a6f3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm39548085eec.30.2026.10.12.23.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:09:38 -0700 (PDT)
From: Pengfei Zhang <zhangfeionline@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
	zhangpengfei16@xiaomi.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: fix RX coalesce frames counter
Date: Tue, 13 Oct 2026 14:09:24 +0800
Message-ID: <20261013060924.2777461-1-zhangfeionline@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179154446637.2527009.3819979695606095666@kernel.org>
References: <179154446637.2527009.3819979695606095666@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It has been tested on the hardware device (not publicly available),
a DWC XGMAC with the RX watchdog enabled, using
"ethtool -C eth0 rx-frames 16" under UDP load.
