Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3E1455601
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244710; cv=none; b=e1EbOpOLxBzMHOfrBCcSPypQ9sHaaIaAQelyi6n0XhHnjxR+PgS2Ei8M7ndDf6GgwnhP76NsLwd1TEPmGdAtaCxJWYT9o2GUNxm/1ayRWcmitoYnaBD0NJfSXkQhYCuG+yEPDBFimvkQhJjUoDN6POdpiH2ODE3z4e9d1pMWMh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244710; c=relaxed/simple;
	bh=Nc++9B0b2Rw64hQH1uTtHtl01UfhcPbPRHWlll6r3Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyGXzsZJdi3wI8wsPngfLXlMXXamce9y5gzNl2XERJotI/xOBAixxRsvNCLmBaauSZlSRkZF1lPUhmkwPi+kVJG0b0uCpuzZ0u+iNO7guLpvF3UbO2k2U/BOIex+XdDkW/CugybhtAAxqbl3aP2t/Oax7mNdnXXtzdsv2w3FxAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evXBZTV7; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evXBZTV7"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb65437so1139922a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790244701; x=1790849501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bJLApz7a6Sj13/KQXZnv/qEoqKgMiQN8Xc7a1Ahq80=;
        b=evXBZTV7OUxqvWuG2xpT4JlqhvV/BLjIx2yy8zN8G86lKiwODvQiAKwWDClcGKy56Y
         DJn1hCA/t70F2zN/wYtrO17QkyMU1HLizueMxp0eq/g0UMsvle9GNBmnceT+3hruPMAW
         ENfbbKzl4/v9Zlu50C2jt8BXt7QX4qMW1R9wCzD2wTEt0KKzujQiimcYtRZm/uz5+M0w
         SzgpMNN6RxvIN5tA5hRoWVtMFGSkicMJcVPjoFqTWVfqIM8dv/Yaewh8vcPSAd//usOU
         szA7YCUSnpKBZrgGcn5EjeJhaLcaVz9MD0v3+68/PsKzMclGTMLVMbbH3vEpN/ZEh5ud
         12Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244701; x=1790849501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bJLApz7a6Sj13/KQXZnv/qEoqKgMiQN8Xc7a1Ahq80=;
        b=FptUlrhVEg0nJ1qAF/WIl8o/fdfnQEi3ZlBmHwRWmwiOBRERfzjtpacYU8hp7rc6W5
         aKX7fZ1MWwiZv2ZyVTFo8y14muCYiDw5bQPQrr0qMXUOlX2X6aJp3hp3LOYR4pUp/Oh2
         TZ4FX2fM+B7DiZiPOhk9ffiRcgr3Brg4BIurOtvPiOc+DsskbTrVYEAS5yqntKR2xGkE
         /ZPkQTLgSr2o/d23oYdvOp2Ujl1yjfyJZhEh+dEMDaeUiuh5GCcFje1F4/SLgDiG0cQV
         PDW5ot+OgRRIfX/dvv6dhfx/ZPyRrBLUYmUI42eHpjFHPGP+8YRMWHCZB6ipvEtDfMtu
         KGag==
X-Forwarded-Encrypted: i=1; AKwUvBxZkGqNwU9OGypSbEz4P/DZwZTZuBhFamGKvWJJkrmV1DuCBWShDhfYKP/5yjvpvEWR5qTWYTS6zAXQ8AI=@vger.kernel.org
X-Gm-Message-State: AFuF++kdF5ZYFf5pp8GZgoQwYAXDuaBx8Q1aHqEE4mykt5Ke70a2FLft
	84tGmGTqKSD3Ys1wNcMY8Rbx5tO0vgVNrmIfMYI/X9b/aUE6NQTw/2HK
X-Gm-Gg: AYBFou2N5ywsmryS/3iWGUBBzwjLa3Q+armeCrlof6w7kuh7z6Pmd+Fc3bNql85Hb8/
	p+viJc9Eeta4dzv7HtAN1c7mE4Nwee4QZVLrqgbi1ZMiInIEH7pQjw7uEcC60dcs+pQR18Edm+8
	PBuA+WCBwqOJm9zoBj5JTY1UplSsgBKPFWCY4HVp+3Wqjx88fWwQgX2TPvf4u2NBuwV2MQkVSNx
	KpVaWq/japDMYWjwuv369Pv63EoA4n+urmMbbYa4mrmxa2a6kdtspRJpMsIuPbwxSMkiecIgR5C
	7N4hwhmQkaNb1aT7+YZ4s1IEhQJ0UM4jdyxbxoe0oSpb16uWpetVwnSn47j1d/IV+onmoRT4PVW
	bEyzEHs1p4KdHobzezv57YoilkSy4gt0/g4jnYkwR254M3aAVyhtWlZqZJp3jy6ZenjOhq6yG02
	92g139b3fL59vnloeXCv/SLlWKB2GNt1bqUPff8uWyywoyQUcHynX9F6XC11Zmy/vrZHVGuf0mF
	kkhexQDcPcHICHoo7iByc/9riRHVHs1oQPn40y/bdU4xDMmVTWNtd7ZlDedCtS149KkGwoI2gT0
	lc17E9PMo256pjoLe3Ox7E+Lp2BBYbUEXc66iDICk4ADVQFr1H7uAuMphbU=
X-Received: by 2002:a17:90b:4b41:b0:39e:4c7f:7307 with SMTP id 98e67ed59e1d1-3a098b8ab32mr1639460a91.30.1790244700743;
        Thu, 24 Sep 2026 03:11:40 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5dfsm4075446a91.3.2026.09.24.03.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:11:39 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Anders Larsen <al@alarsen.net>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/6] fs/qnx6: fix buffer head leaks, double free, and inode validation
Date: Thu, 24 Sep 2026 18:11:36 +0800
Message-ID: <20260924101136.2380154-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924073920.2782917-1-benquike@gmail.com>
References: <20260924073920.2782917-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hui,

Thanks for picking up my tags so quickly.  I tried to test v3 as well,
but it doesn't apply to mainline (40288c9206c1) or on top of v2, and
its context has code that isn't in fs/qnx6 in mainline or linux-next,
for example qnx6_inode->di_ptr in 1/6 and the out_sbl1/out_sbl2 labels
in 3/6.  My Tested-by and Reviewed-by were for v2 as posted [1], so
please drop them from v3 for now.

Which tree is v3 based on?  If you can point me at it, or rebase onto
mainline, I'm happy to review and test it again and send the tags for
the new version.

One small thing for the respin: the 1/6 commit message says
QNX6_PTR_MAX_LEVELS is 3, but include/linux/qnx6_fs.h defines it as 5.

Thanks,
Matthias

[1] https://lore.kernel.org/all/20260921042511.1473629-1-benquike@gmail.com/
