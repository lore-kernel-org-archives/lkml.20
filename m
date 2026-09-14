Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C5641F35A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377672; cv=none; b=ZYxIUlw2f+ythxEOXhaMFzn0vPMHLH48GS1lg7T6gbdyGwSP7Oi2BLiqp0fexBR40oTWb43fY0bRIpswZv9sS6aezmL0ySJE2U3GEQNNhMknLLY1mb/CnYta0lVTgRRvb0mLxXGmNhdFCD8XZvTorLq4Lsos1mIQo1oC95l+yAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377672; c=relaxed/simple;
	bh=NFwOUB8LNevhQFYQ3HgiB/dniCw5BxrZrjmLeU2SyVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhyINoENbTZa7yws38Dz3fjtENK2sfv2HcrSxhZpSfCg3AVZosJ25VVkx88acbnJGpqRw2jfqFX/NsKPVKCiGKIqgWd4Fcw5kZaylhFoBVAHeUTYFAfCJQ3mI7l367fgg+H12TsVIMuFxBipW7KewrFjXTqX/G1XxK8WEbg8EDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3hfAWfs; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3hfAWfs"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so25518255ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377670; x=1789982470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zT0oCOu16lcatVlgDSURGpdGxFQF3bYKh7NMExjIeBM=;
        b=h3hfAWfsRcRonshoqNKUC3Y5DakQH3+xmjKxt3kSHMrdfJtJyFqWhhMeCVdZqgKDRA
         O4H06CUFu+QPMoC+apK1KQs4H0Npaisyu5iLwETYLecMWszXMbtNFSoydBWJAEmvwyXi
         Nnc+THVnHQj4mZ1AiwPJkDo36MaqGc0BYGdvRzESkNUcPpVsl4xIi7MYdJL8QvQ6SS6j
         kDv64c7hKbuiMmMtqwCFJ8q3gV+1Pg2c7XnrOyN5buFBe/R0Ahv8AYHb21K1zgEzKOrI
         aoiD7uJgKE7wBmhZ+Y9l3N3skMRbiYT/l3GmI6WrSKoVYQenOrdkuflf0b82Tx4x8KaH
         cyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377670; x=1789982470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zT0oCOu16lcatVlgDSURGpdGxFQF3bYKh7NMExjIeBM=;
        b=kB0ZkT3Yh4nOE1Dp6N4UeF1B23SK9RZvLZXtsPS3qzhtjK/H4N33h5hM84+MWDHpV/
         blAR5iVjm8RtrPlz20cbpN64mB+NE4P0DEQwXJItKa7U+IsUS61A48KVTKIQKe1ZFynS
         wZpU9U+12c/ZGQP4mt4afAcEX6x9SJxxeG8vDCu3C3UdLYJmh9oJtBpG+6l9AGFT0Azw
         diqn+2ALIJD7gzcyfJPA3T0Of5BGf2MEkhrGlm3p8jIp8foUI4R9dX2vsBMoElgUAdYn
         yQR7bt0y1Bxcx9oBTehQbyN5q+sUkODkLIZlHEZOtTRF27dtF1VsNV9jsPgL72O1CgyU
         OchA==
X-Gm-Message-State: AFuF++mO4fynxDzX9TOWVLtDH+8m5Y8zxqU/Fv0JaYivDsZdCwx9r+Xa
	xErd3mykdEhFbM5eHW/g7XgPBdS4+f1SuGgCm58UpHpw4hx5EcaR9k8=
X-Gm-Gg: AYBFou35XuN5+EnSoCDgzu3tVd/6oWZ0IDSRKUJXfbZhtAEb2mrdYUQGOStTlKUuexW
	XifWgm50/oKdk/VFXKLOmI5+so9peWsCQuBaxJ3F7Q2aGshuYO/SRL/j+eXbvE69S1hPzrbxbRw
	nt1LpnENd3De+E9NTuPpRZ7c1p6bGWdCrgSB6z7xWgKk9Gr20lmeNxuH5w9lNHUAbbEGIJy3kgW
	2kdPnqW+LmL1uKXnakxjP2AFLdR07bQwyW9qPTTrAUrTngwJQF+TdadCuVC74Bacf3Sl0mQhOPB
	q1ismYw0IdBB/ewMYznIk7m9FS2ZIDF/hh0LMOyJDwHTx9II9RT2cBSXiivD0xZLjbS2kBoCSDY
	Ci8NxogAMKEuAvtQhhS6qDY1U0rtDzSXmLNWRmnARBsQbDHB4SXk9bIUBqluRkS0LmbIVozT2Vb
	YVoauZGSPDAyeCPqNEJwz0HeI9+eKcClRq4CJm14b+8j54sMbX3Ort9DVTFuk/N03zPWl9V1M92
	zPOPgUxpY21
X-Received: by 2002:a17:903:f87:b0:2d6:fee6:65ae with SMTP id d9443c01a7336-2dd6c5b16famr37068635ad.4.1789377670362;
        Mon, 14 Sep 2026 02:21:10 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b8asm45067855ad.5.2026.09.14.02.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:21:10 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: triet.hoang.dev@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	tzungbi@kernel.org,
	wim@linux-watchdog.org
Subject: Re: [PATCH v2 3/8] watchdog: keembay_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Mon, 14 Sep 2026 16:21:06 +0700
Message-ID: <20260914092106.901496-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914085451.891675-4-triet.hoang.dev@gmail.com>
References: <20260914085451.891675-4-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 14 Sep 2026 15:54:46 +0700 Triet Hoang wrote:

> @@ -284,7 +283,7 @@ static struct platform_driver keembay_wdt_driver = {
>  	.driver	= {
>  		.name		= "keembay_wdt",
>  		.of_match_table	= keembay_wdt_match,
> -		.pm		= &keembay_wdt_pm_ops,
> +		.pm		= pm_sleep_ptr(&keembay_wdt_pm_ops),
>  	},
>  };

This shoud be pm_sleep() instead of pm_sleep_ptr() here.
I forgot to change this line. If needed, I can send a v3 to update it.

Thanks, and sorry for the inconvenience.

Regards,
Triet
