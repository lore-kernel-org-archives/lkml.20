Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1042EEE6C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204170; cv=none; b=b6dgN7WOlW3fJU3N5/79ak307TQ9r+niE2fmI3QvL+SfEas1dBe2xBsFRcVCj1XbKVAJ7B9qUueid+h4jyd662jM9/9GT7jhE+qoJFudVGcgZLo58ZTd5wiGBE+LzC6vIq7yjLavgG+IPOp1RVnF3Q0JSUSNPoO5V38PqxLAfJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204170; c=relaxed/simple;
	bh=2WOsLAPThCX8TB/02g8wSwkG34LMSmNHu26+Sy2QUG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1QIpiceQ5ScxVSz2PCI5MCTm0HN+XZQ4yaAE6j/AsNoCbcRB8kIhAW/mmqLSpp1Fex+PZhUDCEkeJuHWNCQBOg6I1OWM9aGNvPehHfYyy/NevZyILmhCcalwTzTd1yB8HASdZQQr6AqYNoDO9VWiMZ2CGJnIx7YUv+pzB6ik+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSUAxqyO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSUAxqyO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499b10c86edso1359875e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788204167; x=1788808967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WOsLAPThCX8TB/02g8wSwkG34LMSmNHu26+Sy2QUG8=;
        b=VSUAxqyOg6BLqm7gt31+tSxMi51bQgfKrZ3vwpgwSMpAJSXm2lkTgOQ6uZw4xeh5ei
         Z3RRWbY8gfy9GuQ6Ax6yY7yYjdDbykj8K/BLamb6ZHWDn5U76MgePf5gESjyY3whN1nV
         2LopaDwqidB+Oyi4Dh0KMu9ki8fgHy8goQ0dYjzSDAFxN2nh8q4xfLuzdZbKrnyKn+Si
         LGgLa0SPoTiCOnFGxwZglu4k/NNh8QsoGcKJy0f4fyMHiOzxNH+/Jmvmwnz2QKx81jH2
         /NHLqevAIasWALXZEylOZ2jnooqQGdump5IEGKxy1CE6FMmjcHjZ6pumTsQLZar3DNyQ
         dWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788204167; x=1788808967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2WOsLAPThCX8TB/02g8wSwkG34LMSmNHu26+Sy2QUG8=;
        b=kZS5Qh9YOY4TmoZ/GqGkvZr1wSKj5ulV2wnq0wyjZ3wTRjRENxTfbDTl2nZsOso8o1
         6Uc6038GViKfpTUyLpVpK3+UvDoJslUm3OkFhYdWplidjCVnU3VSZfpxVx/IyaN/dQvG
         AMfQu7zHCg4O8cw1nyMLQcWGp5wMSDjC8m3uKHRNoXI20QZia98bfPN3CqbLp/5MSxmw
         tatyhLOUMXRWSlJQvuY5IRm9fe/7+GWRYzOtcVwb+yv/+rTuJ2T4l+5j1YQsWSPm3ptl
         a8euYolAcUndfSvsyroTxyWJ3m5aQdDgjaJnytRwebcTEHeA0MxxXdLX4IByfyBNoSis
         vRxw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0vlYdGHFuQ12rffG7zhVqgGO/2vggBmXsGQkTNs1JrM/JIxjY8amP5Wi1naNcWyAQ4KX660dlpKEI9HY=@vger.kernel.org
X-Gm-Message-State: AFuF++mIfyWyTmBYqssOlxqhmZIF/qAWHjDREUsEQcLmCzs9UXb5tJOg
	+i2qjmKkWI4jjLt74bZmwO8Xu//nQbhVL6JdJIPnN0em28IsLl8EwyAo
X-Gm-Gg: AR+sD106kVY1hHi9iH+LMy5eAxEm6IXBZf4cJYdNwUu8ZcqSAh9DdQzud43je8cDAzI
	u4Ji1juxc4EObhcc6r8D1fWEwCJBrMwzuJW1bABuWAa/FQsRRrAdNTKqeg/ZLKWOFkZqU5Id1gO
	rgGtPHTmd2BSnVF88KmncfE+q4TNIXaCjq1jeZ5hx8U6iK2xVDby2ITF5Tl8Y09695/BLIbvKOh
	rXbaatVqG0L51erO98xCCyvwJCsplFAY8h2NHgJO1WqOq3M3f6amrJPVOYRChLYJBUENurZm7Ma
	GmzOCBkNnm29CHrwXHNeuhPuZKLUfbMSEYDbehhD2sypjxV/vEIyJERDZYBZiVpRJ2kCvL+07H6
	77SSUe/dW/s1jsGjWGjDc+NjY2JATzKVqUfkTeuJj5d8JilWhg6yCgjTiMo2lYBGygE+xMz6wZe
	Y7mPj2bekESc/7xe9mVJmyJVvXeWkautChrkv9gxki4Ut5rIPT7y89frMggxJ4meDcB+nkWafm9
	3dAcwIvTzY=
X-Received: by 2002:a05:600c:1f87:b0:492:4a7a:e415 with SMTP id 5b1f17b1804b1-49b91c41ca2mr233152735e9.2.1788204166771;
        Mon, 31 Aug 2026 12:22:46 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0b456sm16039465e9.2.2026.08.31.12.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:22:46 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: kayracizmeci@gmail.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/fair: Remove unused autogroup.h include
Date: Mon, 31 Aug 2026 22:22:41 +0300
Message-ID: <20260831192242.937681-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260726160238.107142-1-kayracizmeci@gmail.com>
References: <20260726160238.107142-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle ping on this patch.
