Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA09A426429
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380005; cv=none; b=f7jXawu/mOKf8emTWvYTkq6QiHxuhskeE6zjdn5JktijduXG649Lk5P0Kd+lONNdmS3lm8/d7GOeBmeFEpRgfOgUJpIXefIsDG5LdFVpa55tiVW+h/hipiPQFIY5OJ3+Df/WEM7uqhwxnNGITZ1Qupx3+vptduwypmhdemvLjUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380005; c=relaxed/simple;
	bh=nY+8DjuSFuBpxoEHzHL2AZ4ftLmPBNY9AbWt/IizrHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uT/ufs4UPrvgGdgRG8yzdOEa5mzKwhFaEegtddGGb8uLDY6sBwvDqgmaqpJC/KrMvK6RUZRy3DfluYyknD1V6HorHgoEbhAmlCh9A4zTdx4svHDx3sF8ON5OiG64+25mADIQomd2ui7Z0jbiNu6rCQjfng3WsD71N+feAEWkV78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=VkdAd4fa; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VkdAd4fa"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so7117695e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789380001; x=1789984801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7QNpdgjusqgoiOYsJVTbvzfzST6HhgyXQdP08BJSIM=;
        b=VkdAd4fa8J8PZ+d0l2YjqnzZg7cvCpWKZMQOmaOWFZosZxzYHY+l4YM3hlwQzrGvbF
         7Cp9Fb/1SLgVdrdJbs2PVUXy3MKM5uNij6oEj/iKfu0AGkJdEvcQkc/AUJD3dDbrYDnZ
         FCYx9XgKatm7oIj49GGjUHnBnYz2iiEybxxVLPaVNvWRk6CAlejiCJj71MZg5dr7F/TM
         Vesw4pSjOXOg8C96cLiUAeEqvSzOIDdHXuy2yYOQRcFxEUvpeyZPliTZ9ZLncNLfzczD
         NMC5SL0Bxu1kzv385oNPQ7d4X0Q4JbX7otGtdkKv+g7lOYb1NUE3v3wrNCHpu/XLltaY
         fkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380001; x=1789984801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7QNpdgjusqgoiOYsJVTbvzfzST6HhgyXQdP08BJSIM=;
        b=oRnLlzxi0DsUbEovPTXMXlwleCTgNeg4rOWDcnYFC9v717rn35QzhwSYmFZTDWalUE
         mY6XbiMIw4ZO2/JxgpPhi9Ygq63wLTkc+rHwPkhqJgLrAzpkt581frrjaTUnUHe/0miP
         VAmpbchW0xkARjgpGayBNMSRcuTuA3vNXJijBg6RLgPvXrUG/FNyNwhKKNoxh/uNYvCG
         dmSIWys9YXTe7Avou90nNIH+/hYo50dkSuQsPd36hLCkdRlu41LlIPIwgZAHs7SgzS7z
         uDWKztYyqdNl3EM+I31I72CzG9eXwEqWfKBuKL/T5MMlBCAULd3TFUzd1GfWvYjicUzA
         9/Sg==
X-Forwarded-Encrypted: i=1; AKwUvBw7Q0gUiI2xCi6YOxTz9eyaIfAbSuJhVCH2b6Q1JKG2erFppa4Fd2F4jS5ze/gKoifJlfAk9JV9I9fuN9M=@vger.kernel.org
X-Gm-Message-State: AFuF++kON5h8HVFU74hU92URUr1FMw77HIlA2/FITkjynhipkIhfj4mk
	9S5mtCbvXxRMkZBO4aeVpTmwI54RGqAuvx3BPXpE5mxaJ10pJMaIpiMZ
X-Gm-Gg: AYBFou2eI0fi0xajnZF29mom+p69g2lxj2pFJzHZucYknGdfG+Hc231RCNtRDF6+OCs
	OljEXAPzJ6CRe6150L2UZS21j7UElFYSVIQIbtyJy8dcSV71j9253TDMSt8UmDPWE0rasg+fj5U
	ctoh3fF7xphdLKiaRE4kWEUQglHyRF4eO0abOZkybb5NCEE5iY4goaR99gg03ToNwY/ghjJX/Ua
	+VKOIje4ixqDeNwAtZ/aJcew5NyajXInIBdDmNmF/pogb/RMw5FLHyMVmQJH/hz1aob63yautDa
	fc0IBgey/Y4ZISpOofye00wEFMnXfDBKXGv+2JIAOHIsT2KJ54/88AVAgtD/ascs0K3zhn0PcgK
	j6tNEhoP7/0FJZFiLYTPQ75jDv8EpIuN7pFTTcfmdaWAp6289u4ACP0rWTPzC03O35HLTOZf716
	+kJZlqHnry45VMj7vVyYLTi7/1ynrOKj1w4K5Z/2OcHRt9gYxV3Y8GHFtPUlb/hy7bdhjh9ZKmS
	zjgCzBJB9OXo1WTeysHX9Ic3JKdu8Q/g3q4Jr95jjzFzy+dO97FZjOwckNTzdX7ywxap3+1m3k=
X-Received: by 2002:a05:600c:8b2f:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49e7a657446mr17851315e9.5.1789379999209;
        Mon, 14 Sep 2026 02:59:59 -0700 (PDT)
Received: from omarchy.lan (p200300dec74de0474f67e4b61f2de2c6.dip0.t-ipconnect.de. [2003:de:c74d:e047:4f67:e4b6:1f2d:e2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm439935465e9.1.2026.09.14.02.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:59:58 -0700 (PDT)
From: Manuel Knitza <manuel.knitza@googlemail.com>
To: junjie.cao@intel.com,
	miguel.vadillo@intel.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	regressions@leemhuis.info,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Manuel Knitza <manuel.knitza@googlemail.com>
Subject: Re: [PATCH] media: i2c: cvs: Do not hide the option in the ancillary menu
Date: Mon, 14 Sep 2026 11:59:57 +0200
Message-ID: <20260914095957.217739-1-manuel.knitza@googlemail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913125345.588586-1-junjie.cao@intel.com>
References: <20260913125345.588586-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested-by: Manuel Knitza <manuel.knitza@googlemail.com>

Confirmed on linux-ptl, as you asked. Config-only test, same scope as
yours - not booted with a kernel built this way.

Starting config: linux-ptl 7.2.3-arch1-1, the Panther Lake kernel Omarchy
ships, taken from /lib/modules/.../build/.config. It has
CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=y, no CONFIG_EXPERT, and no
VIDEO_INTEL_CVS line at all.

Run on a vanilla v7.2.4 tree. linux-ptl does not touch the files involved:
drivers/media/{i2c,pci/intel,pci/intel/ipu6}/Kconfig,
drivers/staging/media/ipu7/Kconfig and drivers/media/i2c/cvs/Kconfig are
byte-identical to vanilla, as is every other Kconfig under drivers/media.

  before: make olddefconfig -> no VIDEO_INTEL_CVS line
  after:  make olddefconfig -> CONFIG_VIDEO_INTEL_CVS=m

Diffing the two generated configs shows exactly one changed line, the
added CONFIG_VIDEO_INTEL_CVS=m. Nothing else moves.

Worth noting for the stable case you mention: this is a distro kernel that
already carries IPU_BRIDGE=m and VIDEO_INTEL_IPU7=m, so it is precisely
the configuration whose bridge routes to a driver it cannot currently
build.

Assisted-by: Claude Code:claude-opus-5
