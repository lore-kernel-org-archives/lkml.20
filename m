Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DE14C9558
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854787; cv=none; b=I1zbrB6ZKa/5gJ5Ouota5JsNYHB1cEUO1NV1eGE53dYjnczHHQCdHQJjt5EJ1Zvf/rXBec+DvhtXOVWUaVqk24dNCWGyOOa9ngK+PjEnAPwVCprvz0sTO4WkjbNENpSkWw5FSxzvCJvcs5AdbYHVip7W3Uy0jHq3Dq9tIQJmoWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854787; c=relaxed/simple;
	bh=fixTMnw1wCe4SQW1Mpx/hz/yAjnGwm9mXVrqZi+gr5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9mBMiHLZ1W9aUyItSN/ekSsPxKc5LTE8HsVBHIHOFA+hBadrmIlSXD2WDhp6E3SFfAjYvvfCBbHEvq10SicAiCc+1dyZKj29KwsZ6OU/+8FmodeUW1pnNOxSEEsic4Q9A+cTfCllqJphx7s1uOjw175Oo9Q9Hh1maZTyIaHYj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI07dLGj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI07dLGj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso291085e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854781; x=1788459581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fixTMnw1wCe4SQW1Mpx/hz/yAjnGwm9mXVrqZi+gr5Q=;
        b=jI07dLGj7PcNU9MqOinhnBUDl5e32enE/dM0LmtoxeCWtzy5MCUQ59CYkdSyU1DH+L
         Z9vOLdLEyiiQ1gcMNLqFYg/8Dsaf2HxlwqtmgjdFBWLpTJUNMJsaTjMizBDWvYwAmpGw
         g5szAp9xDjVarw2xtH7NA3YOd+SfADq3vsTUfdZzGxDX80cpQ9oebSyepMXxchEjjbbw
         DRAk8coB07+0zQ1HN6vOROze44YO24Yg+fbnVlgHzzbT/rRLDT7iJe+aZGij/HoBBuhk
         66ttjP3LEOTkOCjRoH7O5K6vsfeu/nEUdUk1eWbl/r8BKm6yVhqNS5hYYVlUBxlH/4yX
         xeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854781; x=1788459581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fixTMnw1wCe4SQW1Mpx/hz/yAjnGwm9mXVrqZi+gr5Q=;
        b=bG7QWhJRsImqY6moBGmc29BO8QCTefytuIxP8m4r/bCDDZtgEug7940VtQwz0SF9VX
         le3Ic9k1DZ0ue/oP67SIvHWHPnO3vvL54Jx3ObB7G+pemfOPaXMOn+ibGVpCJbGmv7uP
         hs95nmkV6JEBhKPa9SfdD580ITKS0+hfUjkspb6d69d/Kes6HvXy45ItFWk/uKvdqW1W
         l52Y7EgIzFtQR1LEw1M4/W12CO30+/H2MuFPihv9SGElKGIY74Ns7AnMpccbjy3R/V93
         vmzFtYVQD9k21+3s1yEKveBGuRC+3hTjDVla0Idz0RfPS7Oz1BWrSA22nxU6Ja12IdoK
         nTQg==
X-Forwarded-Encrypted: i=1; AHgh+Rr67xVcPOsO60VrUOiig7XvmS5XsIMNWOLmbMerYAEvPxLs18SLvrM2KeKNbbDhUHBPtoFVpsrtqCk9pH4=@vger.kernel.org
X-Gm-Message-State: AFuF++kDpfJyUKEVmdSnfwY14AcdJGupzqHjuW3JMCH8swJVtjTVlaHs
	6TBa4BU1CPjZgUR45s1DCCwp7hgBqVCwQTgFTJLLy9NTkUbWVO1mfpyF
X-Gm-Gg: AR+sD10TBHSRJGV2CLTLIUVynA4aHwXe9sReMBLPLeht7Sun0dbVIGQoaLXKCCLn/22
	9/2HKEFqS5hE+MRxC43W1gMMZ/6601/aCBhc5EqbwqY+R91tpSfNR9i1ANMIRrO1biMfgwNLs9E
	mDVXRhJWQElE4VHQ20I+S6eWCe8P2SdZFKVQNZITKqrXk8YSbB9aVAoJT4RQkPLy3Y5AcE/nF2G
	B7L5PM3Y9tPqEH849n5fy8Y6D0fb7agsLCVZEGaJ6mvMOpAgGuO9G2jOhlEYuO9+AzKpHanE7p9
	WGVNuHsjiLwmMFB+x1ZWdv08Ec74n/VhyFerUxndkyjlZ4NeWBGrPxEYVaazs1qu4yQfQoi1WZE
	SUShaUOJ8sYx2ppJZemZzt5EhOnMoREZftg6DTL4XsC/0f56s53+PmtOHJwCbMZrlwyuwEbitRi
	i8AI1HhzWYaZTECpUHxsUWcklZWun/4IUCFDwiEmThPc0qPtpnWLxW9Oh8ygGcEGqm3wN6fTejc
	v7UDnGf7J34ND/gxqvMvCP8DvtGYqmvPJRSPLQJNWtqdQ==
X-Received: by 2002:a05:600c:530f:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-49b91bd1552mr13828835e9.0.1787854780571;
        Thu, 27 Aug 2026 11:19:40 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91ca314fsm4381035e9.3.2026.08.27.11.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:19:39 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 1/8] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Thu, 27 Aug 2026 20:19:31 +0200
Message-ID: <20260827181931.2432507-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAGGD27ZUFHQ6Aa@ashevche-desk.local>
References: <apAGGD27ZUFHQ6Aa@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you. v2 splits the existing 24 MHz digital-gain packing into a
preparatory patch before adding the clock-specific path.

I retained the two masks and shift for that existing path because the 14-bit
control value is not laid out contiguously in the 16-bit register write:
0x350a receives gain[13:6], while 0x350b[5:0] receives gain[5:0]. A single
combined mask would not perform that repacking.

The remaining review points are addressed in v2, including HZ_PER_MHZ,
single-line writes, a table-selected gain range, and declaration/layout
cleanup. Pahole on the final built object reports struct ov8858 at 792 bytes,
with xvclk_rate naturally aligned at offset 8 and no hole introduced by it.

Maurizio
