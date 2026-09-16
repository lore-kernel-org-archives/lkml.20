Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B727C53FD24
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576078; cv=none; b=KlRwNvcbD3RQWjulVJRUzsHVL3gzYowFINQXLKUZ8qUwFgdf8EPL68SvIDYQcjMBIhxpQiIvlv21RvTmx7fTQfE3qsw7iUg4Y4UZZGuMbeXzcBZX7xg8uXUrD66dyGetxoaZm0x/JgmmiQ85z89cXnybMe0crKyT3FWH0P1A/EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576078; c=relaxed/simple;
	bh=lRdwwj8EXSG8IVpxD3HE+riRGCvbuZtBiFL12hxh9mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A3oCYUSA0VuyVSTU2lnd393ItumFjNfoZvcS+x+PtnY50v6A+LDpOChSLrS07BSZHvYEQXWVpxvS/CVuUNlkoSXkZVzor4kTozPNcCeT3rj6qPAgBA6HHi09Yq+px9D/LTHTTEaVfJlOydtoe+W2b6aRo+pYfnbdmVtr9ZFGGCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1ZpNUoN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1ZpNUoN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so5804215e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789576067; x=1790180867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRdwwj8EXSG8IVpxD3HE+riRGCvbuZtBiFL12hxh9mQ=;
        b=n1ZpNUoNQCp65V7KJfSsBCziis/z4t4DTmH1uWQCYmkSZKzNCph2xas8JX3b6WFboY
         ce8XPfpdmxPH37O9bX+f3avoS8OUWtd0Xf6emJiimpiS5smdVRZL/GEDitVl/D/3ljTc
         6Mei5F46HD6AeTwwReH7a15MH1GkkAk1pZu82bXoC+Dj22r2hrFhHDvNX5zScD4CPVey
         iZXF+wXZRTueJMgZoP2zaT3pGp62fi4/mb1SQO//P+32S2AQeGT8ujYzNfBxGqRxzRo4
         JOLpAyehALF9d1omRuUG1fzUQAj5jlees6wrD9PLqQpg8za0CkhbmLQvJvkcORkJCXWA
         0H1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576067; x=1790180867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRdwwj8EXSG8IVpxD3HE+riRGCvbuZtBiFL12hxh9mQ=;
        b=rIPbXitDf8uY5Zy+mA6mg5ByYszMR9DnRRNWhJKY3R+zk12o64xDTsJsWzVi0Jsh9w
         YGQBgoLne6CPAL+aCyyU7usuEvVipKBYl9Eo/IG6wEyuZAzdCXxcO9hghXb4siFk0Mtb
         p2tqstth7gCX2Z7Z4hYd9GzxWpsEDwZnF7mnGU8+MOWG0exa6Ryi3+9j2AdRjANC2N1q
         jY1/7anAeUw1pt9jgw8VOFgY5tEvFVJ2pQxvyEXlQJLHk0ku1zS8D6LcBS9hKhxOS5GP
         DeqSAMbPCbevvTAN9yEPDl6r/gKqrt2R8zYXI4vN4xzPL1hK2dqajOCi0dAynlYA1VLe
         WSDg==
X-Forwarded-Encrypted: i=1; AKwUvBwse072II9Q87qfU6zAQesUy6yViq6KBfOq+W79wGOOvGhclcl3oRod/SF9TPs3CBs9fezUsKyjg33ltdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mTMtAJZO5OVHBW0nrrgOvUwmoel06Qj5P+ESyd7sZiqF4udC3C
	+ExWtrAexINgOuiN2wTifbb+CqJAEDzYy0aiYTpWnb4N+okw6S5pYvh0
X-Gm-Gg: AYBFou3AarVqDArNv4BqCmrQeBK9yTia9MHVcHAoYgfWdh1rCgop2Xb/f0OsOQVU2fm
	ERAsKPNcFzK2TlCbMJzTA6Fd4qBzgLISFKHyZqp06VYWCEboKZdftf+m4pbvE0BRrkyhzYc2NLP
	O69Qs29Oz3/3d3jEMANRDnC0zs4kTZNw0FK1qzkuhndS+mB9SDkU3a6rQOI0aCPT1gfeB1tt0C4
	p7eHYB+3rzp/6vHKxMOSAfIGdqjIEGcVu7baqhNodcE6pmw0601FfKXMFY4KWlQ76U79NLta8uw
	DQUANRpYtD1bO/KKRVRTdJkpmGRUmxIfS75I9P9Fl46D4HVV2ylmoKqQ3LXTXYA3MSzYHsnyaRZ
	7BIABz4m2lUiryvp8CXaVLPBS+7N0wp+vQWVemimntS9zLoCK+d0vLca/l2s4mpxSEwpNNG/NAp
	ptL+DKtyE0sptnDgwzIHS+W2pLKggXainxPyZvNrvZ7K3tacpCe/FbBR9ICG++CieCaEe9j2pb9
	egVxxS6xviRWl1tdo14NNdi7KF4ZlQl5LmuDI5Uug+9t7c7DdqpXfqjFUM2MYhCnnqRxJ8c9rj5
	qxeTW7XEWdCRd2vo
X-Received: by 2002:a05:600c:1909:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49eb733983bmr35504315e9.32.1789576066976;
        Wed, 16 Sep 2026 09:27:46 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd262912sm2047065e9.15.2026.09.16.09.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:27:46 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	richard@nod.at,
	vigneshr@ti.com
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: cap the write-buffer chunk at 256 bytes on an x8 device
Date: Wed, 16 Sep 2026 16:27:45 +0000
Message-ID: <20260916162746.308008-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8733v9mdro.fsf@bootlin.com>
References: <8733v9mdro.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miquel,

Thanks for the review. v3 sent as a reply to v2.

> This sentence does not mean anything, I'm sorry.

Rewritten: the count goes out as a single bus word, CMD() replicates it
into every device lane, and an x8 part reads it off eight data lines, so
anything above 255 is truncated there.

> failed? do you have hardware that actually triggered that issue?

Yes - a Cavium Octeon CN6335 board whose NOR is an M29EW strapped to x8.
The log in the commit message is from it, and the clamp fixes it. v3
names the board.

> That's incorrect. It indicates until when we need to backport it.

Added. I checked the code is really there: 1da177e4c3f4 already sends
CMD(words - 1) and already takes the chunk size from MaxBufWriteSize.

Vignesh is on To: for v3.

Thanks,
Orgad
