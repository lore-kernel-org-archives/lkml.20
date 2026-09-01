Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1865148423F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280705; cv=pass; b=B8YIcXrtttiHcqR8jzURaPpgsYreya6/0SMXULI8BqIOtgCBtE8dy03VMUeA7AN8EIIsFR2HLAPboRHe94fEpIRETHftwj60BoKqxnTS/wcPBTYUa9oJuqkBy7AMdEPRa9vP71wRu/wHvlVkK9lFxjre+KxhPPmFmQRUQSvHg9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280705; c=relaxed/simple;
	bh=u0EQz9qaj+AKu3AT8419jngzyzUGX7Hmro0f+xTswWY=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L107Hax2GTQsx2iEGtECpYruOK8xPaHuKUzuDdaG4eQx28o9LZqXOVt3BULQlq7Db92qXNlZf5sTQ0xvp3Wq7+P/yDAtVZcmt7z86fAVnC7l1n1KhBxYY0lIQ5nz2WM/QVFKj0SyLT1MBpjlfJw2MDG3rfZMxQuzdqBfhSh+HOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmmDP9xR; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmmDP9xR"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso8444a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788280702; cv=none;
        d=google.com; s=arc-20260327;
        b=DjhEob5oRRwHfWAJ8j/Iev8hYSAooO2iObdZrCNZSz6OUycMe0CwlbYLoh4bqBnp/f
         vS1J4VndPksptaV/nJAipdiJ45qu2ikulDyAphk1kHJEHDY7WxJ5Ng9I6hR1YG73e3MU
         +xRh0BTazvkCCaJKslO2yytEQcjhytX+QK3Gof+p14bY4VdiC2NZmCib9sRNT8hBT5fD
         WjbI+KVonAen4UDr7muFcR3Q7rhrcuskBmCaHxtkRk6e8PCppoTCHuBdNG0awRg3webf
         DIluRXAk686gkGCMaRvkGFKHLv/swWAb0RplscVCrC2wlhJu20/NDLkXwOPOKP8xdZ5n
         /ikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=u0EQz9qaj+AKu3AT8419jngzyzUGX7Hmro0f+xTswWY=;
        fh=jtrYwDj7dijkXJCEErrHc4A5U1bk7yIlzKcusrM7ZAI=;
        b=PIsx9DRC3Gjej88Mcuds8cQ4l6jqbpLNmGhATdJWWPIukM4CfcP1MNkScgH3pYkWE7
         bfsP4U2szoTzS9jHjdW1iunrxxIn8ZLLmHduvxz4pigRkK3nfaxGFWn/5xHrguX/6C7B
         lgsEABEW2Tuha8z7BANMIrfAp+nyCWMYYo3YTbuROb06mm2bIe3knLspBl0c+dEjPZPL
         B8WFioR4jJNAFidupSLhfa2iofJpKmUZW/UAG91Fqie1G6e+gqgmEI+LyNBX/ONQ1gTM
         LjeeyPAIxos9DWnNnySQn1AoGmZLXV0e4xcu9+bC0X2Lk1GLZI0QupSTuh5w7ZteyqnW
         G/cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280702; x=1788885502; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0EQz9qaj+AKu3AT8419jngzyzUGX7Hmro0f+xTswWY=;
        b=CmmDP9xR8klsFH47ZmzuYX9igPgoQ0wuVjCEePC6bMdWcCEp3ebb8xjXohtYkNWDWa
         pR4eOOCYjEBDbf77Kg0zYs0U3W770/mhmHh7Qk14y+fQ25W4Pgi41QhDSEylXlNhq8u/
         LYB8WlPokrjFdoPMzMl8GuoLHbsnCUpvz0FDXATk5njvucN+94J40gbYvod/p81udl2B
         OwJmIUYGx5Q4h7R3U6nhfBB9vVwvNFyPr9B+Y+sbThYcp2xVxOBpvd/QvYVwOqrALlu8
         k3d4XHiGkuyexMIEMA0O3qw6CpNqIFXs9bY15frqPyy7ZJzLfabwyME79qo4dTNgjl+O
         H2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280702; x=1788885502;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0EQz9qaj+AKu3AT8419jngzyzUGX7Hmro0f+xTswWY=;
        b=UiKGzkvxiZnazs/Iz5ueQmpyVRvL9MrIybcFT5WaFIsVFOIlA57E+fnAEVAYtstKPQ
         galVXuCT2wMYbHZfsPK3I6Dr6CqlJZH0QZ+MnE2hhz/cDFcv5LrPC8l5dDDo3lyscfEx
         Qo14bMK8ca5YAqNGkwiSgIwZndyaKup+tisG+/uUxY8wwXPB3gjJ2bs7fyWiHXSo8hdC
         QKo/HyFwMmsCw53CHdX6oUGWxjcOEw/+G2lY5JiZitX/g7eETRJXEHZ0QQg9vRsKqwsf
         uOwssW5TzOvzNuDhwjFT752Wm1OSmXDhVWCNiq6q6IQq3u3LhL6ktfM3O2MgoyN5AZAO
         gqzA==
X-Forwarded-Encrypted: i=1; AKwUvBydZO/2p0R9vkBEBN8CFwR5T3F7sjQ/y+dJ9tm9oOh/3UjNmI6usr3REgr2jNP7MSB/99LAkIt/GdcjDb0=@vger.kernel.org
X-Gm-Message-State: AFuF++not8JWJJT0f0TKPkEq3YUKAHQjTkRwuTRzU4kDm6Zgz6Y2nXxe
	ZnRCjuh2DBV9aTcZncJ4gPRth9HoM0SNnvXYqsP1tENivTR0cJhSgc5XnXfsYM/jW/BWXyyTGSR
	bEK72ZmWXvIIBzTuLIbk65UGQly0D0LM=
X-Gm-Gg: AYBFou0EDmhlqh2PtSysu/qlbC42XvUYcUtmEZk3w+T65BS3h0E49/XjODX3V61Cr+Z
	7+Mlxazk9lcGqZdUZmj/pn/+NvEup3VJ0BIcFZwNVqOJpA2LoJkGgq1QrxxWhZW38V8/wkeHEyr
	BX+7m038EpKYr6fI06LeNppl4BSF6eSvxHsKsg7C+foE0Yp4Q7dRjuKVOQnEcTj16EmNDrhLzQB
	N9AvN3HrHkXosgCSLdiGMl2GY1FNuggW8mL9bIr1BZLdmfS6/dfARGtUGaBAHzbnPxDmvLKJqfd
	3lgQ6C403CBD/ZGUOYZWeZbEvdXrI2457bWLc4JJRDwscP0/SLRX5fy/AJdMO+AlYdH/30kKiB1
	BYA==
X-Received: by 2002:a05:6402:1d49:b0:6a6:4783:b6ff with SMTP id
 4fb4d7f45d1cf-6a663a0c7cfmr6781899a12.4.1788280702075; Tue, 01 Sep 2026
 09:38:22 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:38:21 -0700
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 09:38:21 -0700
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87c8adb7-17ff-4bd5-98f5-9628c2e344b1@kernel.org>
References: <cover.1788213716.git.zhangxp1998@gmail.com> <c570b8ce22c1e2732b3319a4ca9c2642aa5f523f.1788213716.git.zhangxp1998@gmail.com>
 <87c8adb7-17ff-4bd5-98f5-9628c2e344b1@kernel.org>
Date: Tue, 1 Sep 2026 09:38:21 -0700
X-Gm-Features: AcwNN1V1w7TeJTUNgS89fh7liMFDjMccSCxQKWpVFv6_5xgSAnxJyqX9ZyBC_rY
Message-ID: <CAH=xXfF1iiu3t4ug6EgAWp9svPYX2o3GxTf8mDMHCvhWFjotQg@mail.gmail.com>
Subject: Re: [PATCH v7 10/11] f2fs: parameterize block size and mask macros
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the detailed review. I have reworded the truncated-looking
source comment, dropped the unrelated const change to F2FS_I_SB(),
removed the unused F2FS_P_SB(), and reverted the whitespace-only
changes.

For the temporary PAGE_SIZE substitutions, I reordered the final two
patches so node-tree geometry is parameterized before the no-argument
F2FS_BLKSIZE macro is removed. This avoids those intermediate
PAGE_SIZE changes entirely.

Thanks,
Kelvin
