Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421036;
	b=Cl6Je8duLsJHyMubVppmCGLIi5CdV92kTPBJtXI8Y6HzYBInmSj35mZAUUeWJ8Bp4AE7
	 eEPl7r7JJc8a0ZVeknv7bu0QHEsB6vzuBsUA2TxykT2j2xqCGbqovs9pR8XkN5AneI066
	 TjPwKHDZEBFyMLygWibTmL0Bd2vOWutLCn4YsAjxSMxb9isGyp7gGY7858xf9t4LqEzWr
	 4haa9xxcpRdAGIj6lRHZk55irE5RlpV2rRTB97k4MX4+080pgDOOiKhSNXqlJNvWbOiXu
	 B/azKjPx0o+t0S5j3aTHGhqsQFQw7rBotKEuuqj2MaoncBRvRfCvNl376NJ9Vm0/Beg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=618pqcGBrZrV91HK6JBp0UjXa1+rzP/KMK4sW2rhxZU=;
	b=FDOTFubAQ1WOmBznz/TvNUHpQgU9R5NgzoPOVD/7qZq4uZeBok2KhoBDYWbMw28JG9qD
	 wz9cqvhgmQp2LIsj10S5vLaOs+SPUn1sJ9wY6d4dhQBU+JenZ3fKYuAG3zM+8dPzVt6tc
	 eaN/qd93pWfvFwwMopk7nBfVwwd00OCnfOGfrmMvQEf13x0r90CPDoY296NXmWs7WDELa
	 39osbCLlBjpydTlFMziO9oPszAWu//PzFKKpqh0eT1sp/PLrw87ILhYFc8x/ax4tjikDD
	 BX7bXPn/nkIkyvxnq3iulx/ONtKFxjmPgEvqwKehtEMLivo+GzuFmxvsm/RnVUqz5zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TPvZUxh/";
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93817606A890
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93817606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPvZUxh/
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0d126f631so36333807b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421035; x=1795025835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=618pqcGBrZrV91HK6JBp0UjXa1+rzP/KMK4sW2rhxZU=;
        b=TPvZUxh/IlSKDp6xSNqVKM98lnxZPjxyxn7ZQ+jh5xWX1IAn3pRRthM7bvPZWwKexb
         NXdDLrHKajeJ2JE9f0ig+JE2mvow9I5l/BAJkLM0wwTnUMMdASWgjwVQkIG3YqeZZTu2
         1fXBZ5o0m6i9fx8Ea8gAdaWgVNbCdoIbPHl9umJLEcCoY5HHxXhDQOpADHW/EfQvMOHG
         3Cb3vCSHedHO4gxEwp9CG8XvgK1NBfd+on7YGYx8lY55nnAsmfem4gFUrpzRRnxoKXk6
         apq4il2G9Qoau+GdBJKwH7pb55YcAgyLKJqVOPwwCu7ViOXnnW8mg/KWeAA2NAo10LU0
         E4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421035; x=1795025835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=618pqcGBrZrV91HK6JBp0UjXa1+rzP/KMK4sW2rhxZU=;
        b=pZxvRL85idA30sxnfvF6kFQKGGuWQFXn9l9BoBSxwFQPZgDXi0BkmoQSYQmGJERBOT
         +CtIt6vTsTQDcfZtzJQR2Wn6SC2H7GQoxZscanl9KX/KMdnP8iFp2Ui3UgaxS1ULfgZ4
         3TAwl67zA1PVzUCYZvJ6INFpP+3P+acZgZGXQpftzaRDIpcTBJGn+86oAs5OuLyXhTt4
         TxeKtsNgpEUNHQRixywaCYFImRRzhQ26GGCX4lopiKcLaAPk76JGVXIpxGTvfCXb/QNM
         itHkDfo5tZUtLLs0JenDwV70myQxiO3WHzaIBJi3FGS5ZKHhxrMAfM1NtuKWUz9mIJey
         AudQ==
X-Forwarded-Encrypted: i=1; AL+hErFzN+hTltT45f877EfHVKrcdnCMVN/p9697UZcgHozFZcZa3T3C8tZJk/zTV722rTmpLMMTaDlqLa3JYqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d02WZT7t9G3OZDR1y8WRkA3/NJGqiOVgWCy+Vlg7/zqjYn6PO
	I88fGzOmuaJAWeCXLvw5O2rRQ/nPtFRLxo1U7xScVV+BE8ROzyjfX4vp
X-Gm-Gg: AYBFou26wgD1paO+JYnNhkfwKTeBlZxfVxfNfX3jvvVd9u7hJGKIBg8IdMTSyNK8DGz
	0FdhMnWZWKiPpbWNdcYYN5Ubxved0MC/EjqdItoCHruvXCRpannfJJnY9RhwgYFyZtgk6DTu4I1
	hSQROSB0EBejjIyItyV7vGGwAfDA2JUj9PqqK7YjetH1jFotKebBkFKpcIG1ETCIACd2Dy+bAVY
	9v3wXX5S0r8BzY+P7O6CnDWy/Fg26jcffC39PKJh+6fBCBLYzcUQT/74IAN10gBXIQ5PL862Osj
	W1Lp/HPsRfEii2CAW1WBTrZRyoAjJ1i1p3C5LrmyA85vK8K7xaqOwKKR0CQFg+4XtPwcvMMCoGG
	3l8qYWYAwSFVsMAeoDIZPKwiin0FEzB0mlmXIa12+6L7Dtjz0Ge2BP8877JLuIRbv9o4ubNGRcU
	60niU3jTK+nmNCUYjguy4hk5kvx4cHe2duaYFpadu8wVkJkWkknVJMKdsTwLXzOU8d24NPecKQg
	RY7wZ3uVjOHFaW/pdxYlstlGwJk6mkDjzlS21Umdi4sRrsYrn8L4qu99Hh75w1V+KAzWvg2jtbu
	pLv0CJSNxm/FvzrWPL+C8w2PuuUEhcpo4ZZGSd3Bzsqq/T+S5Is+Nojk86tPc411KdG+68qtnEE
	=
X-Received: by 2002:a05:690c:288:b0:8b2:bb94:8cb2 with SMTP id 00721157ae682-8b3a8071a47mr23369857b3.35.1794421035512;
        Wed, 11 Nov 2026 10:17:15 -0800 (PST)
Received: from VPN-156-197.vpn.usf.edu ([2607:fe50:0:f802::4046])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39343d4a6sm50363577b3.37.2026.11.11.10.17.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 10:17:14 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	josef@toxicpanda.com,
	jbacik@fb.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Juan Agustin Niccolini <juanagusnicco@gmail.com>
Subject: Re: [PATCH net v2 0/2] tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket
Date: Wed, 11 Nov 2026 13:16:48 -0500
Message-ID: <20261111181648.34819-1-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179441946966.2168702.5078417118584073258@kernel.org>
References: <179441946966.2168702.5078417118584073258@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The bug was found by my LLM-based bug discovery pipeline.

Best,
Agustin
