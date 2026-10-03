Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FC3306767
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791048338; cv=none; b=a8njbcjZacg2mupsPIWbqYmNxxhpxL1ceQpqYDXS8voW7cNCcF1HedFCnUWEB71oGwFRJvM9+RHkt86iRtoz+GnvQkw+gliFnolEHV2mOgdCdDnDOlFvCnB6k7COPTogetiNiMd27YwIKKD/tAj3jEYyOFu/foX53VvHoT2Ty9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791048338; c=relaxed/simple;
	bh=+67JRRdlaPsn0nv+yCFFYOj1t5ajXQY+uGgZEsdgSww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1D1tKfXts1xHlZOzPvQSgbrpfQ1bZNly97NTLNfOmsTyfN0BwHtIpnQqSzS5afiIpPS3BNj55n38ejv+eOh1ivGY1VKxuIZg+HuaF+m3EInPT8CudvwdOdAejvKdtgZO8yg7/pElyPTbLml+pSDSueAItGtxpOmSGPl+mXzRPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pVKtxKro; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVKtxKro"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6afb7d4aefbso617450a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791048335; x=1791653135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+67JRRdlaPsn0nv+yCFFYOj1t5ajXQY+uGgZEsdgSww=;
        b=pVKtxKrodPXv3WTyL49M/zZwVQuh0vLv/eFtZLkRDEcOwVTlVQR4cyc3r76u+T9eMP
         QkN2Vytw1aBGqyC5O3nOdsG2DuARDgXf9OY4v5s2C80nPQQrmGrkZeXu+TngXBggxi5D
         1LE1uuZFXzo7QA227U8vVO3gehM2IT9rfp97kNmvhCfIogKllbGCH3SgVrSqsFRGb0Y5
         Evq0NtjyExc8fAgNC/3Yj4S/nMXxGUkFLK6TlqBu2zWy/zILcMudiWnuhgv00bQz+uxt
         +Nf0X6cIi4dQ8gklZZ2+lL1YdOs27lvdXXs0gCakSylJQHIUtPwm/BWi59X+28JgkdSJ
         qP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791048335; x=1791653135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+67JRRdlaPsn0nv+yCFFYOj1t5ajXQY+uGgZEsdgSww=;
        b=ikpq1WL8A6WJ4bSmjJt17AiVEmwqzJoHIfsVjwm5DE21ZOI5R3CczCXwa9PFQWbKeZ
         6083s4q265uzHeHZD0hQH5fK7+xsptA1vykf8Zyhw1ODiMdcCp+U15FBdVUSpAF8rlSi
         8YSQWhvJXfrGoHne8wez+u3wt8TWPX2iRYg9+JVomL5YoKuWmAAg5bjbW4BtL3gdju47
         5QVPq/LIrm39sxDu7PYs4lKYOOXQT7Di/f7FJpVQeem4EZ0qk4Eb2D/TKx8FWbzzbrPZ
         qIrcSHrAxqi7lK9n9cdndpvOdicTL7nvjEs6TzcAalCghuxPVIABKarrYFyAmnZahC6C
         AukQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRlABG5aizHcplj55T20NutIX3oW9AUWpHgCtX6qkvxYAzeBBup110ZRKjX7Q0Cf5iJqvq+XX8db9pQks=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1k+07rPkUMK7Du/Zn/lS48a+fuWhgbXIgu2DSlsKfc7bVtG+O
	TXl1o2jx2HdumGEPNlyBKz4r2+J2fIPRCkQlXU6nVNL5QL7zenj4SxFE
X-Gm-Gg: AYBFou3H+iF0e6vv3icUpcdiq9wmAY9nnzSDnbFuXJeugPc0Kr0IG/7CHV5Qs4YBgyL
	PETHP6wVUM+krKJnavLOFpryQAXwLXFSDxTThF299k3ZyCtESeTPq6hIjw64jTFFvL8PcNN0dhA
	REBWHGurRG3a3fOWC1c8wKJLewKMnkOCruwQkcoTXQDfdKj8WFotH8N5w1edwtQi8+ovFomPBrM
	iluKgSjsr77lBrbneMn1M+Q4Ewz50em0x5b89tC/+HX7n1V/MYAg5+yT+Gx2xj+gqnH3pFMiNPc
	FjgaxqDAPgvSdZV1OjYY1MJ1IWfMRwWPGUAK9bvd+r0reaUBJhor1sg6I1+CKCgmoG0bGhvzxhs
	u1Ugii4R15cAvCD7rEBMbEiqGqgauThx3663izjDKQ2XKNI5quZ2u0zHS7YqZd1dd/cKL9IXc+s
	SnJ933Ef2ysr60ywBHAPmRvhzpaH/FFnJnCWizMqo3wOnaBOcPbUr0zRTEor+ONuSnFclnFdHZB
	KuCVcWNlqDQLDK2T4QsTgKsee8GqXHRL3D5wAvPdpWlKbqdmGc2ALgf
X-Received: by 2002:a05:6402:50ce:b0:6ad:b23f:e325 with SMTP id 4fb4d7f45d1cf-6af9e3193b3mr4811704a12.20.1791048334952;
        Sat, 03 Oct 2026 10:25:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:793:68fd:7995:7ccd:ec2b:6712])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e592csm1023285a12.6.2026.10.03.10.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:25:34 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Ziyang Huang <hzyitc@outlook.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 2/3] net: dsa: qca8k: serialize CPU MAC pause during MTU changes
Date: Sat,  3 Oct 2026 19:25:19 +0200
Message-ID: <20261003172520.239-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <179091424456.434549.5853243408552872110@kernel.org>
References: <20260928220811.1880-3-yongzhao.derek@gmail.com> <179091424456.434549.5853243408552872110@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. v5 will clear and restore LINK_AUTO on ports 1-5,
limit MDIO bus classification to the selected internal CPU port, and use
negotiated PAUSE on that port. The dropped MDIO write errors are handled
by the separate MDIO error-handling series, so I will post v5 after that
series lands in net-next.

pw-bot: cr
