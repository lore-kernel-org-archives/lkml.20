Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB961F938
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814539; cv=none; b=iJ0OL2UgMQYYYCY/aNOCmzVTn+juU0c+IybfuJr/pAhT1+19QxdS/IIORz8x1xT6zOEsH1hIDr+fkEiVV3lXOGiAEfF4lEF4jCfSdPwab3naiwH4xVb+bhqtTVqLVemX39+wkLhULynRIvAL6YUjGguQWroHXuiACMZ/wyfLgL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814539; c=relaxed/simple;
	bh=sRd78QSJGil0ZcUwq3GxqGHQF3GnG4W0ymqk7CGnnE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdpBYc1NEkf5Y9l52s0p9RKEeqSXj+T7KLRITd0GRXyWhP+Je5zRmWXnnKzJsYxYSzNj5HK4Sbl/TlwdiO4qV0twHGXm4n9f/RX/9n4GIUbqsc/K3RhDLrhm8eVdWNhZg3j6JNr8ERHzbjlA7VE+v32t4Mx1DJ+HNPWnL9QQenw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haR/eqIa; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haR/eqIa"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39682983a0fso1665780a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787814538; x=1788419338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRd78QSJGil0ZcUwq3GxqGHQF3GnG4W0ymqk7CGnnE8=;
        b=haR/eqIaTOhAA9p741xIu68tyWti+IJ3KXLfj8ZaJ87VR8KjzOk3RC6eLl9SrFlnaS
         aPsGxzhz2e7/2Nyy17ThiYBApAWBMia6LWQSMD98FqpZVySqIloMPVxfu1GaO77OhLPf
         pE4idmQp5Zr0KFJNEru4LhhcWxlgHECgby/CFJnw/1qTed0hZV26FJsFS2XGT5ICtfde
         TmYYwjUojfD7aUky/QoaAjtMDC1s1xFHb6AWBuFL9HgCTtRa/A4GHOd0j2MMRS7XzLtK
         RLLeXzfP1yz17ZvFtY+6PVHWk5hqfv0+I5CMA3umvUeFawwsDTvATiJUMdd/JINjekih
         SPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787814538; x=1788419338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRd78QSJGil0ZcUwq3GxqGHQF3GnG4W0ymqk7CGnnE8=;
        b=RDMjOj/2JUvSQdQLrAVbA9kVp/PJiPFSkVqkwcFzTG4WLtfmiLfpZAPTdO74z3dO1f
         2hAElLPTUFJt6vYf113U0Ua2apx5B4pVNUCHW36CfYPf2pW9KiwilpT3VzRK/NPQEwHu
         Ivlo7SASkAbfglI5ESwVVcfCYbuSd3oCdsXgIi0zHXT12iMga3VCSO0BQP7XnWstMrZ3
         HFRmgVoPeXKi61AuUUhY87LkVlHJscDP7jyXm26kksGrAaoA+Q058FP3odTDDYWdLIm5
         id+p3TmmgU3MEmsLxx6ThWCb9LpLkPocKQ62OKu7z0R3HtpEu2R+CHYMMRnEZpnOvcyO
         Hx6A==
X-Forwarded-Encrypted: i=1; AHgh+RpxV5fK25EwVGTruyyT7tSylDaXPynT5QXWwhE+XYDypzDQCGy1E+x+W5H14dLCVRc3ECzDu5UWt4kUREI=@vger.kernel.org
X-Gm-Message-State: AFuF++lDM+xWd9TNhEVK0aoau9WZctSHReBCoi7a6XPts8QwO4G+83GB
	52gbOHRKyC1BuGUo54DlWlbVvbrQC7SuaafLcC+WMX1aXyU5Q4TjkqF/
X-Gm-Gg: AR+sD10DtSkUzF1EiKSVnKwvXGpj1vlu/rt2zqq1kBcE5SmDMaJTE0hKT0rfKz8TMLB
	ge9KSzFXyGNIlQ5L20ype+Y9FaBT6e3+ODpWEb5D31l4lOd6FWF2QntYyP+0meujWSIcRQjrVK9
	xGqXoDfrgk6jRjIZrWiFkmAVXDU4dL1hpTA6Bmc0dKQ69cTI+r8d/X5Zw12qy0Xw9WSVvhRYZi0
	b6gSkzUWxTd0pGyyl69e3tIo3GuENiPZrooEUTFpND32e60coLEBviY0KVhs6s16QCKGMyix5Q1
	UELw2IEbdEZQW/JDSjL6yl/RBnPgpJZxg0tRhh4Vjsnkp3vEd1cLvizTlPoU4Ea+0YiFAdnqZjE
	+IdNc4izYcOeNyGDbRGZCjP/N+oO/Vk1LgMQbVhYRX21ZiiZQvQbB5HUBAuhVxZ4yPYU8wc4UNL
	EqSClk9ErXXZ+yvhkLUw1m8calG/UchFRmQCIxKupctVKjRwo8h8s1ERTfv+TVcTpYS5HbtZ7nv
	5ijoRt+FzFka9T1dzl8P+7V/bwf
X-Received: by 2002:a17:90b:5102:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-3966d370333mr28339383a91.3.1787814537645;
        Thu, 27 Aug 2026 00:08:57 -0700 (PDT)
Received: from Anshuman ([103.161.223.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd82sm13559447c88.2.2026.08.27.00.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:08:57 -0700 (PDT)
From: Anshuman <anshumantewari123@gmail.com>
To: david@kernel.org
Cc: ljs@kernel.org,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mhocko@suse.com,
	nico.pache@linux.dev,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com,
	Anshuman Tewari <anshumantewari123@gmail.com>
Subject: Re: [PATCH] selftests/mm: khugepaged: remove str_dup() usage
Date: Thu, 27 Aug 2026 12:34:07 +0530
Message-ID: <20260827070407.4108-1-anshumantewari123@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ao17EcW1-iNN4Y8i@gremlin>
References: <ao17EcW1-iNN4Y8i@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Aug 25, 2026 at 01:20:59PM +0200, David Hildenbrand (Arm) wrote:
> We don't check str_dup() return value and never free it. While both
> things are irrelevant in practice, let's just clean it up by working on
> argv[0] directly and avoiding the str_dup().
>
> Nobody after us needs these parts of the argv[0] string anyway.
>
> This patch is inspired by previous work from Anshuman Tewari [1].
>
> Link: https://lore.kernel.org/r/20260821114416.12255-1-anshumantewari123@gmail.com [1]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM, thanks for the cleaner fix.

Reviewed-by: Anshuman Tewari <anshumantewari123@gmail.com>
