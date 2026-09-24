Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668284EB847
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286797; cv=none; b=YDPtWpJ5deybdkFM8mO++evmfoNZB2U85e+d3LFHQweS2P/jGoI+xXO4WJuYdxa6tm3/DpgBG2fy/2D4D4Q/53fQbiG3uBlN6l6xgFNdG7RYewBc2bUeVRlGYrP/gcr3y+eAv8aZ7+5gbTZmcQdK3BBCqRYjhHibWO2eiJ0hjqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286797; c=relaxed/simple;
	bh=wUqMujLgG/ATUODYjLIuP7EXNqWn7rMgrL/D2IHZ4OA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3yX4tiSNq27BTgDrmWb4QWcLsnATh7G4PCruhyLf4mQldtZhU8rFIg1wkdC7OMLrC+McmKwUo4bP7xhzN8w45J34OMC+Wo5dhK5I+slZfZmhiEjfmW4d4hC9GOltWI8EFSd3VJVqNEXel7RFgVz8/29DK1vywfErnvTxtyaF4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYrXMKfF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYrXMKfF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so2182145e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286790; x=1790891590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUqMujLgG/ATUODYjLIuP7EXNqWn7rMgrL/D2IHZ4OA=;
        b=FYrXMKfFuAhNF5aCQVPp9k70aZHLhA5y5y7FHJxEF4Cgx16UZb8Wh570H78iixISQc
         VpF1eAnRuohAFSDR7cUU3I+zypSleeCnUiIzME1/76SDe+P8HBxG12VgJpzaufB07scV
         sSopUoV1c6a+0C0jcWF11L5O+3mh4/MoITbUH9W6RhvlCP6aiKuEbiH6MF13cxRyYSjx
         8oUO6wtI+N0XmO13bsw9XePdvAUAHS0Orr57nO5pnBYb3lVuU423CENcCI+DEz4td3kj
         bm86dLsuIUEhJCUT7fEUCYQr5w+M9VsV+FSOXNcgS3YGNubtD/bRUReRMZ9jTvH6hyHf
         qj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286790; x=1790891590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUqMujLgG/ATUODYjLIuP7EXNqWn7rMgrL/D2IHZ4OA=;
        b=RD7Lp1MTQwwYm4Cd2IftZBL0cjwfmrH/+ZUnfu+SCtYKkDZCqcUOpAevwDBqjytA2O
         QUtzMR39f2wev/vuOXopBX3b3eoLrp/LrGQ9qKbiuwOXWkCv0f0Vko4TaYrHZH/6Zjrk
         395rRUPuITiAgmoLJsMXxXOnGZW64/P+mJR9gq21woDr2JOb4ZzLvIcnpvgqjBDJOwtk
         37vpjoU5PPluW+0U28QhzwBPKy7kDr8Bn8fZvMG1MjCgQKeqVRzpJ02Gk6fdY0xcrv+6
         kBvjWJgUFuZlHd2v23Jdy/fHbdvU2iOzN7TZn6ZxXw9rrdinBQykWSKBhje545cie3bM
         +auw==
X-Forwarded-Encrypted: i=1; AKwUvBxQQXvqSJOaB++NUvixdqSflp6aWrUzXAl7nKjnxSidA+VvSS1JYZmSKWki6f6WqbEiyXUrk7zTDN3H7dw=@vger.kernel.org
X-Gm-Message-State: AFuF++mmOSuhMp5Sgepq0Hff7QY/teP8hAX9fOqjNVBmBzM6+R50ifOa
	AeeNV0OsOgX3fdatxoYuwNUlG6nn+6b2UCJmq6WxnbID2cCAZSlYhrpF
X-Gm-Gg: AYBFou2eJM149ioNPOzljSirHYAjt40NX68CqzN9nLXzP5uNybvL2fB1Odxl9cfolTX
	BDB0j05bjFPPvlSPxIinVWLrDD4D9xglHAXZw6KaPDQlbsWBh36wMkBsDONpIYyD0/5p9azACDr
	yEr2l9IOdiOoQaL0u8vuFhvm8vP4oroFxWg8T3q2qByr7D95F+v6X7xUe2ouH2RzXJUCoVBLlMN
	QRdAelGH3ap/0zSotlkRjmGlMfTRko7eTPA+F/6cA192zsCGHx013kgpZ4ayVcgRikkC+nR0l5Y
	TQPubCDejL/f7g297Q90MJnL0Tdx++a5Rtm9zH0DraVW3cGe4vRV2gt6djVz3yetNvt4+U/zyRf
	BGd4hZksUslLt3XI2x9qvTQvFH0KDRGDV6/7Bx8VP1Sb2sgVoGUfAMGzojKvB9DMMnUWTQ2rIYJ
	I1qK4vtiDSZrY3DS1UBt3U7xL9x4OoXG978xU4P7ZTQeH/5uv/EPc7l3Jiycyz7lVkaxDHt9wOc
	t0efUguZbnRnBqa3lDyKUQgj8nDV5nJz9FR4K+81MicFYOPjhMN/LA0YMGtZ8TAcv0M4LaKBzv8
	b7pz3bBILZhjHV+o2w==
X-Received: by 2002:a05:600c:8484:b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49fe66d8135mr63220665e9.20.1790286790425;
        Thu, 24 Sep 2026 14:53:10 -0700 (PDT)
Received: from 1Z10 (mob-176-245-31-160.net.vodafone.it. [176.245.31.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff1419498sm991635e9.3.2026.09.24.14.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:53:09 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] platform/x86: Describe Yoga Book haptics and audio resources
Date: Thu, 24 Sep 2026 23:53:06 +0200
Message-ID: <20260924215306.930909-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829225729.395270-1-mauriziocasciano7@gmail.com>
References: <20260829225729.395270-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hans,

This v3 series has been pending since August 30. It incorporates Dmitry's
feedback by describing the RT5677 GPIOs with a codec-attached software node
and reprobes the codec after attaching it. The series remains unchanged.

Please let me know if any further changes or testing are needed.

With Best Regards,
Maurizio Casciano
