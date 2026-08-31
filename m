Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2CB424679
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199884; cv=none; b=uRlZe0qFZtoIZ8VvGltV+NxUgsXpB4Cn9NOn9hmPGnA6f795ggGFMd1sW2evuXQtiyaRqU01Pm1GALjNBz78mqZIvJjW9gXqOLA1UVoXKi51C3wcVOLjJFAoCtRUvo/lIcFLw5tQNtfuYOptQiB69I35F5+eySF+bO91y2I9PoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199884; c=relaxed/simple;
	bh=HqkxdqjH457Q9BNK25GoOuuKnbAaAVBhSzT49eSmRMk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lraeFSiOp2sHlHJAO0PVutKzktFtWRKZbJsFwCysqoVFXoqwG9OJsGMcrMwEu+OMBSGbEfwd36jaZy+5hboCHr0wkrmmGXuxcf5SPSJzLE7AkaolQBUisrx8cStCyhHnJsqvDOuIU43ZNN/BdGt3w5VFLc5LuycMmAgcxK3FfSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dl+qBwZI; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dl+qBwZI"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso448302a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199882; x=1788804682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+k/TRLRabTSJEMCHyIc7Jf71jgev3UqCsTHxCYbIzSQ=;
        b=dl+qBwZIK4QsbDj5Bc4jAWQxcYcU1LmDJxQbrwwp/WQlMgFfLLYAsAxdDbWn+8IMDL
         2Wu92T3GPXx31EF1U8ArgwZxT1dWj/8THBjXaSuWB73TCr2/8xhSSoV4aH/ypUyvh9rD
         K1pL2kNZbUr5jRsimROGxClQ+/AqJ/S9UmxeqWtRc0N00wwAHuXpOhZbXIKv5ktgT/6Y
         ZA5oou2dliAUpFVhCNtJsYLRSo9lofERaCnwEGs+X9he7Tf1AWdHhEOCF6/fYibC0CXs
         lDlaCQlsNNyVjcK6LgGuuDF39I8W9qh8HauiHMdid91QgevZbADqM9cRmrmi0RewTfyI
         Tgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199882; x=1788804682;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+k/TRLRabTSJEMCHyIc7Jf71jgev3UqCsTHxCYbIzSQ=;
        b=sIX90DhfcFKQeDv9VHxSbdv1UHAML5sAz7yBJZMJqKcYMY0NV58EV9WdVFBJxLCcL5
         rsgqJYp57ZFBs6tX3Vyl/Boy6TmzUBwnwD+tcm8MUpMVOWUKA2f0NPtFB3AS6DUGL3J2
         GI4n0D453aV57/m5ccMAnxyaHMFuTmD3vgQ7WiwpGGn9p1vB9x2K4OiudcmDvfcrMMqX
         XYAgnakETBtzP1M6ra6hjYRweC2nJfkCGz8QhkV/lVUbnnh/Vtqzr+yS+VFtkRNmN6eQ
         AHuF6CeY/0b1xWl+RPvC0FaoK4quMNWW07yH3LOqy9zhRqhoN8/x0S1wLOZQzF/CXSiS
         wcjw==
X-Forwarded-Encrypted: i=1; AKwUvByDIgsdhwEmRo/acnT4FiywUYQ6G8ELJZ2sg4gkBVOyRJUi9JujCeOmdwnpd/29LwsOVjc1IIh8cFF0DnI=@vger.kernel.org
X-Gm-Message-State: AFuF++l3hbj1FDmAue+I9ZAEW0z7vsRtKET5uLZn8MxlKplHYSfQ2PWV
	bm82PL+vVKgwHcb7ay1GKAQ41oUU06lWqjpMHtzdf6uSD2c72xK3MyvYT6c1tWPLPswazK9BCSD
	su10W
X-Gm-Gg: AYBFou1c/s1i3LdihZfCfw0rv9ozk0xbEl08WzBVku3KewbAB/UrD8dq9yjhAJFIgJo
	02esSGxqj0WyQbM6fqEBysk0axOBcm9/JUZ13OSOd5McT+dJzHBMU9GBmKU4sdhNO4Bchtk6Byv
	9kRUZgC+Pq0TZ4K/XluEl+F8hrFzS5Lcbq0fPlPFVC64dDqAfnWq4fP8y7XswGqjI1lQmlLCA6u
	JrIc1HCXmhJ6HEQbLbpOkMrZipH/Kv/4dbQhc4mrmOzPbCs8uopec3XY68xR+ULjwBmXdL45mXo
	0e65iPS8ZctsUyXA/DL3v+QqGWZGZqkFaItuFa6a0zxapQed114rBz4wmYpM98R81DdEXF1baDh
	ItXL1ufAUp41P2jVNqXW4Eq9UKu3FyV1lvzgtFWnVRqytasEwPqpBXFVgt8K1zDjlf6CxDFdX99
	n0ZxKQpMBEMmGwf/McZ+4huTusVUQMlDC3gFvEJ75Ve0AMPgArVEZcCEsOtQ==
X-Received: by 2002:a17:90b:4a4b:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39907e17dcdmr2865018a91.24.1788199882306;
        Mon, 31 Aug 2026 11:11:22 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990ba8cbf6sm829678a91.0.2026.08.31.11.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:21 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, rogerq@kernel.org, tony@atomide.com, 
 linux@armlinux.org.uk, terrelln@fb.com, dsterba@suse.com, 
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20260828212843.614296-1-andreas@kemnade.info>
References: <20260828212843.614296-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: omap2plus_defconfig: Support for compressed
 firmware
Message-Id: <178819988147.2869653.7385266758702402443.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Fri, 28 Aug 2026 23:28:43 +0200, Andreas Kemnade wrote:
> Especially zstd-compressed firmware is at least the standard in Alpine,
> so enable it to avoid confusion when using firmware from such distros.

Applied, thanks!

[1/1] ARM: omap2plus_defconfig: Support for compressed firmware
      commit: 20e49e03ed714b6dd47d45eed9d6f8681d691e8f

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

