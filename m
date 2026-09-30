Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6C44E1C88
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807253; cv=none; b=hn+fq6ypE7kT/ZUE4dC2Z48iwF5n09s3HeuQd6soou27Lfk4AlKD1x9ngaSVCkqleYDnyjc3r0klCyDWuIHEH3t/53mZlMCDQ1j51sTube4hUM43eMGd5In5Y5g7lII4BTUwrRb32X3FloL+N/y0FZGhJn4aALQ9a2h1TEE/w8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807253; c=relaxed/simple;
	bh=jju1N8zT9e2tyYTiQp3P1ITPo8JhtLK+vJE2fDFLE3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VH4u70kXM7qixjDJodiCnV0jnB1gx+oLfzEHkJLFGkW1E8cL/MJ+cduIixIiwYDv5GQOmDwqkAl88f9EjLaldkCd47i7byVHDRf+OsI4Hl11usGKb2zc9CK0HD6Lq/uaR6Gj4X6VVwle1jZ93NE4xYDq2Pv8nKXE1JgYFVR/6m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=DeA1gcsv; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="DeA1gcsv"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af5ae31d8so2016019f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790807249; x=1791412049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jju1N8zT9e2tyYTiQp3P1ITPo8JhtLK+vJE2fDFLE3w=;
        b=DeA1gcsvixRktiaPUgmMLMzjw5Y26CcIP3JCfsTxCzu/TV5PnQWcXGwUri3Rm5avmj
         r3EjAuPFfWFAnYVUnnK1+0jSirfIzJg1MFGJ07m248DTQfvuil1nMcVLbe86eMKop32f
         CTg9plt5hPV9jJM3i79sAxB/HtL4944TEXXA09R752yPY74W/CsSwRMHdPFlWU1sfznQ
         CtQfWC7gYoD5m+gLc98oE3saUfGIo+hFD2Uqr0gp9Rsw/4zzGMSGBnGYDMpX+uZTaXjA
         IxIiXZm2j8cjhWb/jctGeRoch1LxwVPiTRV7JL5Tw842fzohXD04DIeyMjmf2SsVdJWs
         o46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790807249; x=1791412049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jju1N8zT9e2tyYTiQp3P1ITPo8JhtLK+vJE2fDFLE3w=;
        b=ix4vLxLcefQ6QvlJ/S9CcIYq6qn4e4WwFBUOYsCxmPHd9q2k/E9t9yxs6qIu+u/ys4
         vGDGsHCCqC9Xl4jtHy7kF5zAcSeAxW/dShwCpA0hn4jyZFVUgprL8s/MODUpgM4+bYUx
         nH39W2haqKnDRn+gb+gHps/INQk5k3bJWpuMHmGTaQXsDLEnHhEeVvTpdwZyaSGGni0W
         mFtcYXldP8/Nc6WusvaD94iQI5rKsKPKYh4yjDA7draettbim6UDs9DN7Uy929WN2K3S
         QVheNbMLw/s0mK/TQswrTrwRtwWjluKS10G0mCZNcT8JjJ79Zg4lOC7wPFO9kzY/2l9e
         8EBQ==
X-Forwarded-Encrypted: i=1; AKwUvByKkg4YxNPwx2KnVlca6D+B0MkCWpADfWaULJNXheDDCfmjwMJECI1GPRnrA5Z87ogYw6YIFO2kJjxeAiA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmBL89rLC5xT6iG770LRO4z4HVfZw0vUkK2lB2xXQr2BJ2Jvy/
	LBzRRxU3fYV9wVYRR6JxSnIZBC1hCMh2pr5WhAawQGH48P7QFmrrqFQQXnTv/FXtOTQ=
X-Gm-Gg: AYBFou0sGpodEOQUmLhMueicloA0xlBYM1L+ouoAGDHaITJHFeFb5n7ZYWskZrjbp/m
	B6DUOXFqNGtOJVkLUqy4lPQRTBVMy3tQd4jVw0yIwukNQ9CmKGOqtuekG2ifawKSTlvphsttzdB
	I8eV2PtCiwpMrRP62VdSefEITzvmQWk2BcB8oSLgxT8aRBCc/sxkvrmAc8uSo+ms80OfnHjHHvb
	EK6gaetzdAwBGNgcGXJbmmyJB/Vt8JUgdr1tEa7VPkcr8+iJ+urEQTsA/PbD5gCV2vRBi1A9pKT
	elihmKMXCk3qNOUpxXEkypRXVAl47EPquSeJbOhpS4anTUuwEh6bdPykAuoJg1LqLNBUcJx9Y+U
	Pn0taUo8S2/h54A7170Ky38L0LlOiG42VGoH6KSrjbxBdq7XPhxmOOk/2K0XGYXSVUy+Nglr9ml
	DeUiTQaoMk3M2J+02fByWbqUyH+1CUUhho1nBUxP3IC4nOqTS+HyF2j/+Luq8cnnQ+DPUk8kB74
	16OXgXTwbvLN4G5iOVsT8QNpqUcVMV+BdB++9OcvSnKLGDWpulsVsM36hB2rz7eQvXhxPO7dk01
	1a+l
X-Received: by 2002:a5d:5f92:0:b0:484:3314:eff6 with SMTP id ffacd0b85a97d-48b02525dc7mr5136306f8f.28.1790807248617;
        Wed, 30 Sep 2026 15:27:28 -0700 (PDT)
Received: from localhost.localdomain ([197.51.54.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff891sm1997599f8f.9.2026.09.30.15.27.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 15:27:27 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sinfo@kernel.org
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] amt: do not offer software GSO on the amt device
Date: Thu,  1 Oct 2026 01:26:51 +0300
Message-ID: <20260930222700.45470-1-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179061959167.31693.11895969550331516671@kernel.org>
References: <20260928181554.85766-1-omar@blockcast.net> <179061959167.31693.11895969550331516671@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found by code inspection: an LLM-assisted review of drivers/net/amt.c
while I was working on an IPv6 outer transport for amt.

It has not been triggered. I have no reproducer, and I have not seen
it in production or in testing; it comes from reading the code. The
path is a GSO skb, for example from a UDP_SEGMENT sender or a GRO
merged UDP flow, that is routed to a relay's amt device: it reaches
amt_dev_xmit() unsegmented because the device offers
NETIF_F_GSO_SOFTWARE, and the outer UDP layer later segments each
per-tunnel copy at the inner gso_size.

Testing: W=1 build with CONFIG_IPV6=y and =n, and
tools/testing/selftests/net/amt.sh passes with the patch applied, but
amt.sh never sends a GSO skb, so nothing exercises the changed path.
