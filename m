Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E79541B8F7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804358; cv=none; b=eW/I5Bo+uiqiuGyreIx+ml1TTtxmsk+wqI49Bz+dFK9Qk+tmCY5Diu7tWUrw2yJenjnFI63KdluETxcxpERjchB7KnUFoCB/7g+2/RKWRy9O2G1ItfHB04DfwYNmIyZA1fcnsz/UNn/tXn/+ouw9lLj2+3fgNO/NWP2eCuDN45Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804358; c=relaxed/simple;
	bh=jJZ2weKHhkNfXMFJ22b0RW7OCDsQCS4qAKK3lUmiR4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HS4O91p72Y7KDeNpZC8RZJ/k7CBbbPfydSC64DTTWx0lBHtJIqXODjS9UZhsL3mVQZFaT+soSv0ttVX2YxJfKZbfM4tMuWjOmUlFbkMXeLNpW2rM7zoZu6jUTc98VR7Q0J/SDlQFqdxwE1N2v+1iFRcZcfbpBVoJAdLjVeCDaVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIeYh1xA; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIeYh1xA"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1015199a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791804356; x=1792409156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jJZ2weKHhkNfXMFJ22b0RW7OCDsQCS4qAKK3lUmiR4I=;
        b=JIeYh1xAiGNjN3AvWL5yfzL4h6yWxGfQ9uPB4TCUAM+4I6Czbd92KK/k5SRCsJSJ7F
         +Sf269kZD8JHzaXxFPfqGtgpsrDXvi8j5LvK98zEFbudKpPYNZcfSNjtCr5TkXcYtdJq
         5+yqVmD5mtpFwX/My0N02WK64WpE8UgcJ9SyzCoPLg8jjM1m3+wt1E9aP+vqwul4fk+b
         j+deKZCm1bWFXAPmiBN4LX5k8CqQdEb4ueotrF1rxUUuKwZ7SOtbKho3qrNKFJkzfVg+
         tzKHgzR4Houc6hGo0FQYDto2Gc/W3lfETkKkogUg0RgSzt1JklA6FKUHCYHp5OiQHsEL
         HwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804356; x=1792409156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jJZ2weKHhkNfXMFJ22b0RW7OCDsQCS4qAKK3lUmiR4I=;
        b=0lta38F7JJEBD89PX55kKVRA/nw5csG9ZKQ5evqN8JsVHQSPPKcIoGfH7hKSGBqhFp
         OMRiiyIfPPrI0PvJ0xIztvq2KHSZVx3qWVoYn2hyl9VY/3qs06/LfqtCz1GBbI2UPUww
         mkqEP0PIaM0ni/2lacC5vdVE/0tfjNHF9HTW25Itx0lBbP249QxtgDVeJ3gk6Qr35AjL
         Rz6huxfDI2WuawxOE5MWPzBQidaEB5NUDe6NA7rOPzhMUh0JVa1RnV4mnWGIoRow0vmX
         MYhHccCxE/NhEehA1+1x4KpsTpb8PhB/6Fo3zSM4N+z+SfgGu3ZWMp+qyjT6xdn06MCC
         IxuA==
X-Forwarded-Encrypted: i=1; AKwUvBzqxoj/D4OhCVQf9DRLDOnfCeyugfdqK7JJyc55RqBqROghzTNKL/cqFBETBfEc0W8Z96v0zx0BXCGyDYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVYYdQxb/SqVc3T5XAC1RABpm0EX1t0QAYMYJ/QranZDFh84bo
	N226wLd7saILQ3nCSaFkiHC+8B1DnRkidYQEp7hvjk50mqVsL5JQGiDMsxyXCnmT
X-Gm-Gg: AYBFou2WERzPDJdv34aQu8TurHcMizWnt66C/tsYOh+qp+XGfH/jrz150Q7ukKHNkiR
	xUKMauUa6308+opSAEA4V6iXpHr9F7TIwcbb+EEInv2ddVnGHZTBfjXsbca3bKyLfRbut/SnixK
	IBFQ7TCyGSEI4rSENodzx5jhUeWFLc7TbMUYGuYbhMvIsj9IMY/hGioDE3dLc7vbI0kggmjUbli
	YVn/uWPqiGl6AtvaBfBhuUax28sYxSlc9zqSXVW2VdQ/b5I2gESlEXHcLcY8f0K8A2YSy2mM7r/
	CywaCgHXYRddRJop61Hx1GImDjWVGS/pEspU7MR43TsBdBfoFJcIiWZ/oCR4lpRHk1Ldklb77RK
	N5h4Ir9tJ4fHcGqoRTjJHTypcSFFO/W28yHR59FgoZWHh0AU1Yj2wFVAaHRw4tFvxBAkLQ5s6yg
	vpVLdOjpCIZ1IOAUHrdE+rNhCgwfx5e+yA4g3gB8jf0hFUHtkodTAPrryypwo/7H0PRtRKDlETX
	sPPL+jjcIXp45csjhwpmcmgVoU=
X-Received: by 2002:a17:90a:e70c:b0:3ab:1a5:cd2 with SMTP id 98e67ed59e1d1-3ab3ac9b310mr5103674a91.35.1791804356368;
        Mon, 12 Oct 2026 04:25:56 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab396620e2sm9808526a91.3.2026.10.12.04.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:25:55 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/net: test tcp_rmem lower bound
Date: Mon, 12 Oct 2026 16:56:34 +0530
Message-ID: <20261012112634.3371756-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9b4b59ac-6e64-4dd2-88c1-c3f7844bbd36@kernel.org>
References: <20261007054508.1059927-1-sahaj123.sc@gmail.com> <9b4b59ac-6e64-4dd2-88c1-c3f7844bbd36@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Eric,

Thanks for the review. I agree that a separate test for each sysctl bound
does not scale and that this focused tcp_rmem test is not the right fit. I
won't send a v2 of it.

Your points about the non-portable 4096 assumption and partial updates are
also noted. The generic network-sysctl test you described is broader work;
I'll treat it separately rather than expanding this patch.

Thanks,
Sahaj
