Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF892BD00C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534462; cv=none; b=RxC05GE2AT0jwku5wz2FuujUko7RVyYHfYzkzmtakikJ4NiE1vCTb3IKyNJe6IRN7UTx2ZccFTRB0otev1INS/A8wDoht1n4wcgVBTAHi/9AY4WpSpdTTkZ1YhgWDSNPqmk6iuHUMasF9TbOBxitpIGjST+RzEvpJ+gFTYp5F14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534462; c=relaxed/simple;
	bh=fU7vRJN/RkrHsrR+xp0E2tLiD/3a+xc4dMZXnHRhIWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVKY1OFaGzsSBGsPRpAz7HMZU55wRDROvdbFvNm+ZE4J0JIFW/LzJPpkzrIqS3fL9utC5G94RA0pMHW0ySLOYT5MjTY9ZvlUjfWfKXzvyWEmzwPzexvXyOhrjIO5TV2d8YxXv5vVCi0HXbMpNEgZMZ4vm8HUbtk2tDndZ+KdRdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovm5Xnkf; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovm5Xnkf"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso390408a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534461; x=1790139261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34AsoScSr372HQ81huKFVdThsUFHshWxaz7XBk7BIog=;
        b=ovm5XnkfQviT3GQxHdVnIVLPifcDmCGGEmatz9wRj2ahhiapTxynmvQojAjQCt6AoX
         TKfbbsdwJDgJ8QzPNUfT87Yhnwfs5EsF5DRTTKGzGLLsLJliTruwoCiSJbWXGb469u+9
         gJ2Ld3bypoR+9aV2yZ7fhaF6Kg9GuKWWtG/aeLrprsKoWRFapZYQyaL9pgPbroZ1Nbuv
         Ndw5mzibSkigJjvckCoSbetD1vIlob1RdzuTiduWKtWvS2WgvcJaFolEdjUnl60pjewb
         VoQi4hZdaLDyA/ohAQPdgq6PJF7QOeMw3SXX8IPHzlm5K4BNB8g714Lu+LdL+2OG/gYm
         5g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534461; x=1790139261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=34AsoScSr372HQ81huKFVdThsUFHshWxaz7XBk7BIog=;
        b=mexwtPz1LSvK6l0yA7pPqQaNjJUROW0csC7tDcKK3Jluk/MOxvT/GARKOIn/qsfzJb
         ybhesTi/OeGsoyR8SXyAyxsSHgScXTWhSf1fuV9uknwl3BkrVX6gbOEget/IRxHzC+be
         ZoaiadkFmwQx5f/hOEtYmOmJQttlP6CB5CNgeZvZyrKQvDYmhHLM18NrTRcQPq9D62GT
         yHYS5BELDUrjV1OCaH+Oc1drvMX7pCMXyqllRSw3xdduw2Ga+6BPqY58Zhp06Mx5Dkbp
         oWdhs3Q709fuIxCMbQOH4f9ZVPc6B/eIntWKYuEJyG06VvSsBySKl78DhthjGnir51Js
         Bztg==
X-Gm-Message-State: AFuF++kU/5yiAmmv6HfUX8vbsiRd4KZ/04k2RcjE2pD/Nc7avMLuIENN
	RqcIruTUGm4tr+w3M0FGQ8eqbo6sCDqIcW7vtDdIevHPA1wnnMBvvqoZKueY49E=
X-Gm-Gg: AYBFou1o5ZfFdDarl2Kr2c6Ky4RXa5mCLRKWXHdbQ3Cc/ev4ohLmQgxPZI16buX9T8I
	ZMrwKRpF+D9wCi7I5liV9wCmztZPk1nTYUOr+h0iobB2vL6viLxdELZJJh9d1v1fnt2YAZNEGcK
	e08Dc3EkGJF5itcs0/aoycYsIt1K4zqiYDZuZ0H4VyB9Guuen1fu5qahTT/X6Qs/Cpku4sHwrbc
	LjD1XPxfK70Cbt8WbAPcmgi+BDKt9ilEmwJsz7aF/W8qg7joX8PHfoEeE+GG3XUYSQ9gsXzOx/s
	aMfyIJ61ICnB+tHHwF0FpvX+i1nTT4gNXFPJfnWkUQ0PQ5uUlthzj48JZcY2w16fS2TOeZb0aSq
	FVCwoPK4iyip3hlH8hXnYjNz+b7Y/mlNZKgfBWX8KD2r5Y1CXzF03Cn611pSUN1/97gL6M97t5R
	pOQ+K4bzjDv2ZjIGtPvv1Bb4D64L+esO/yELocbk6X3Ek16SgWXWO+h+ZTuroj3f05ci9vmjNXe
	YZI/HV/l/E+
X-Received: by 2002:a17:90a:902:b0:39e:2192:97dc with SMTP id 98e67ed59e1d1-39e2192b682mr1243464a91.6.1789534460596;
        Tue, 15 Sep 2026 21:54:20 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a3cc9sm2308379a91.14.2026.09.15.21.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:54:20 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: tzungbi@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	triet.hoang.dev@gmail.com,
	wim@linux-watchdog.org
Subject: Re: [PATCH v2 1/8] watchdog: cadence_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed, 16 Sep 2026 11:54:17 +0700
Message-ID: <20260916045417.77262-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aqoMxDnKCOARllQC@google.com>
References: <aqoMxDnKCOARllQC@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 16 Sep 2026 03:28:04 +0000 Tzung-Bi Shih wrote:

> Not only for resume(); maybe just "PM callbacks"?  This suggestion applies
> to all patches in the series.

You're right! I will update this in v3.

Thanks for review,
Triet
