Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE4032FA30
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932674; cv=none; b=OQ5DSMrGnY4fhnMVvvJOANejedhEJLfXkKCetj1Si+JmXXZKX1RbBUGmXJx7LWyGL+esat1JE35jkGILf3PjEIFIZMEneqfPNwMyxIDD/L+K2ohGbSNFmhsA/B43lrcowMX2WM/HQRlB5osVRz1FUacmmV1Oucm54JUUJpSqcog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932674; c=relaxed/simple;
	bh=Vnwupgsqqua90+twkjySStW6ffZlrwSOpXf3UgPtv7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DARJG9+99W1cElLkME5ODsCxRDpO8Kww+5ZYc6QKm/V5sE0WXTNmwVz+1Z0XUTG5C7208az2v3QG2zhk1daoTk7jfSTBA4Hyn4Ta3aAeocJn60iBPfQF1YZip1ochICBLi/cmhTlEUrbrq4MwXFD3Wfn8QicAap1pDvYcQJw2XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8C61i+H; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8C61i+H"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a024e16179so7425345e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932671; x=1791537471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtDqhbbon9lgA9uJuFoMzkzdbPQZ/GXdO0KH7GsNg0Q=;
        b=S8C61i+HeicGPa/h+QI4UH3RP1+5+Ezo+/Ak6QbYD1IcVmpk23V5mUvTesGys8u57s
         2bEEZ+Ii62YqSl5C8e7046f6V73EXbcvscB7r6P0m+Nz62NZFhxGM4sat52VeVWg5x3C
         Ul6mR3kjJYLGD3IeORQvKf88vZD6slI+YiJFo62fsZ5ZGrfttdXlq5W7NM7PJL94k55x
         FEPh2IWGWcRQd++tqhZPpNK7trb6uvnI76tEgW0ZI2nBbsQovi6Qw2iyjX4AvFLojPID
         imxni31hcvBhPQ2mLtdEbObiWNpcN170KDl4QFByht9G+fFcWNGeFPFAGcwENNW8v2n1
         UFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932671; x=1791537471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtDqhbbon9lgA9uJuFoMzkzdbPQZ/GXdO0KH7GsNg0Q=;
        b=SgUGLanhEqB9tGySOICpFt5oYmExSWoS8p2+ODxFT01e13xyBMzxGyM2lukmAytWoZ
         9MsKe8VS5/7/aqCtMBtG7ZYbgggY+0qkFKsLymxmGq46pbwZ2NI50PsJ8CesfL49Q4E+
         A/vJ/GbebcTxpV7BciUJv4u/o7TH2msswB4ermr31AVj4eHzghpWebM5m0NxMY7A79ho
         fq8C+i00S8h6hoAfm0W0AMsE/0Ts3EBS3Vef0BuKqChexv/BTaAaqSwDQjjg52SuYUVq
         6ERODKklIW+6HqlAnr9KrYRDdroEQSmWwxS5umGvQ9Y+k94r174NvuHJ8VDvVckT5F7p
         jM+g==
X-Forwarded-Encrypted: i=1; AKwUvByiXdrzX+YiGnnDkblIRZ4j6ezVLlhsvvKYWEVnp9Lvhcy6tq2DTeoO96VglUFwAI/Wxp3p0v8A5D+02J0=@vger.kernel.org
X-Gm-Message-State: AFuF++kypp74owkdasylMpaEDN7LGX/fVF5KZowSPaplfrB5zfN5agx3
	WrnN9NzUpdsiMf3z68+wU+nPKVr0lg9bovJ4T9KSTEW7UX5o1jwnWhJ1
X-Gm-Gg: AYBFou2OfuMre+3HwdfBDuzjTtdwUNVLzVesFMjTieOhOpO3ibVrvHTqgnmn7HxyVHy
	pOfzmNlXxN+fY+iK550+GEWEkUA17clNfgsRyxbfUXCxBVm7e1xJzWyRhprfglRXrHmjyPtAsX5
	i7/heMRtw0dThGdA4Dew7GaqMVo3x9Dk6ETnhooWwyTWE5YdL18zTLVugbPzntMV7Ua2P89vBI6
	6izajNiypYRWxNmc1EMmOrXXUAi46x+vAsj9aOUO+je2PmT5ZI+r08tBwgHX+Sux10IQdk4Q2FP
	VRMF4wCSO1RnHAkaVwXXE0Joa7UJ8Su8o3WyvAQLEPKB1+5KaDWG1fpJzZgZh51WaPGr9VF6UGx
	eZhEsYdp2fbqMt6n3/SaRuAgajr7JI6BPeNse0ZfRxP998BHqPI2dpTH7sYXKLYpNJEeMxChY57
	oLoWjfBJFlOjWe7PjqN0pE0B/QkLtMrMBoM4DNtc/3GLi/eozNaMzcL+AWa4OYOHQTK4AWfdbaV
	zzVo+osfeS6vlERlasYuHoO8nHka+YvdHCwaOVVk4u/rSKGCSZkKhh4ETg=
X-Received: by 2002:a05:600c:4e56:b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a027584b22mr41936255e9.21.1790932671197;
        Fri, 02 Oct 2026 02:17:51 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03feed16bsm45498425e9.4.2026.10.02.02.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:17:50 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Fri,  2 Oct 2026 11:17:48 +0200
Message-ID: <20261002-media-v7-p02-sakari-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar674__4-cNOGMMy@kekkonen.localdomain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com> <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com> <ar674__4-cNOGMMy@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I addressed these points in v10 patch 2.

The commit message now describes the implementation only; the runtime test
results are in the cover letter. I removed the invalid Link trailer. The
clock constants now consistently use integer unit macros:

  360 * HZ_PER_MHZ
  24000 * HZ_PER_KHZ
  19200 * HZ_PER_KHZ

I also removed the Cherry Trail/MRD naming from the sensor driver. The
19.2 MHz table is now named for its clock, link frequency, revision and lane
count: ov8858_19_2mhz_360mhz_r2a_4lane.

For white balance, the V4L2 UAPI defines RED_BALANCE and BLUE_BALANCE but no
standard GREEN_BALANCE control. The driver therefore keeps green at unity
and exposes red and blue relative to it, rather than adding a private UAPI
control without standard semantics.

With Best Regards,
Maurizio Casciano
