Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE5D384CD6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850143; cv=none; b=FJvt326W4+pKFwqf9V9HhdTzhwj9dqluwT8bbNKZq9mNIla2cWYd2yNQPEYnutb8vEWDdTDyf6loFdpKU+keeotyBQOoUwjdSgPjdt3JSYvXtBu6pvPgCZKODi9a4T0cCHowHvAIFzJA0gh3lG2NlGS7Guhzg/by6pTfxGtELXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850143; c=relaxed/simple;
	bh=xUUF7UD2xCl06/7p4fCfClLtYgEYmyE9IABYO7UCbek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JD2abLqBwOANsfI/v/TOuKMLYZ8iHcWuT8/1wqBFNJ+E+hcUgOXvIfsfZGHHVwOX0xN5n04eR73G2uN8bOAcFbo2rZEGtKQjC/azu+kddar29wAgkMyLku6fAlI6Y1wBIvsAkFTQzb3MACMqt7dtZpUN7s86NHuL61dUpQwpu9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZ+aPV4S; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZ+aPV4S"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so4275957a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788850142; x=1789454942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieHVtiuPPdzHJk3HRFuoVkUtejOuBjTV0evlYx/E0iY=;
        b=UZ+aPV4S2xErQiLqVBEkgbkK0wo79YCHQAb/KX8OMzBYm7t+PSjViP2B2I8IO1HpBN
         PJTHbYSi02Ltq9SAiUWO86q4ZxY9juDI2zvc9P7kl71yMPVQIR2ki56SnHk1V2jOuYDU
         4+209tzkVLv5//KDqQZem3DxFvShl3cGJDIHcEFlEFBFqQpwJLsclnZ5PML1cOVWPpkI
         /J4bg5khrjIAI3YXAu5KcBykbDGXBk+c31BVr0esioGJu8ZZGZQqllkmHKwmEv+gHJP4
         mR3d7DkgSYKxGNySt1AF3/hA3oIRJRrLfiZ+rtRY2dxuZ0+8lmMKErmsgX4Ka1LCEhYu
         /XCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788850142; x=1789454942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ieHVtiuPPdzHJk3HRFuoVkUtejOuBjTV0evlYx/E0iY=;
        b=kengcibpWcB+c4endRn+iZXZz8minYAARaFLaE1kvyGt8sHdfk3SG5/7Q+J8sfRam+
         WFv2zPvtU42B9VnoKqgfC3xxJiBp7Y/Mc4XE8886+A+/IrhLPKuZNdzBH3rvNR/0z/FW
         liL3ukOnNf+bdqoW3XOYR/03k//KHZ5j5b5h5CG8C5dLwYd1PoGRUQt9z2xbMM8/0Rm6
         jPeBoZJekE4Gx5d3eetaiYsfJ3B5WkzYVWunNOt1451plP39E/98BinMajutIikirvHw
         +vpfbeTZ7cKPJSw26G5JWQRJFBgDLK6eFAG5edzSrNv1IVcPWFkBhIzZljshSg/GOor8
         8kQA==
X-Forwarded-Encrypted: i=1; AKwUvBxPbE94vTLyI80AcQY47uWUC7VXQN8WUWTdYF1Rd2AQ+nPUsekLHp6+tLpV79zfOINYR75MRUzMfl81K4w=@vger.kernel.org
X-Gm-Message-State: AFuF++ngVJbw/5wcqryXVp7nGSZZ61bUyQpSv6qsaUg1iTRvOTSYT7Xe
	I3bihFCpqRyOrRL8WLmyV0QKImkRMGb8E2nASYwtsKR9q1kSbkKkgWeQ
X-Gm-Gg: AYBFou10arxs79i8de7WUNFkYztT3pm/OrkJ1kBDId0oUK6nmvq1CmNVOXGITgW5Jsq
	lD41Pu09UmHn688YH2A7bTCGHDaMFwMJ/JdHyxhPajHKKv8QA5F2FHni5LzzOu96kDDTXf3f3Cx
	5WDwZh/u7GOFvLOZ7qazDXBY6kr5mureNoXFegFQiPmP5FKaBlkDPclX26S62OixrUd/GvUyMyt
	51yMhNuKWDlQuiTZ6hKdAelrDdh0XUHbwEM6qfeuFY5hdAwx7GMUxJ+aMXkXk7ZLfk2IWajNAGy
	D6zFh33MEQjWiTYIl8jBrZY8dhkkjh1j4/7FZYCGNYLAcdZ/DIOQQqzCDkqzpOMIO1FQhxAQ//9
	Au5oFipxC3WTZTmZVLid64MymsHjKRPrcegdVXIykynfFde0gpZZhGsEX3gH6pPhyC9BsB/3dFN
	IMNgHJ+YzFhLbWZGGtpQjNSxnXKu6gyc3ncspZuZ3PXyon7eUjFd5UItKGns0koZvlejF/oRA=
X-Received: by 2002:a05:6a21:8887:b0:3da:9f19:bf2 with SMTP id adf61e73a8af0-3da9f1918a1mr7504014637.18.1788850141767;
        Mon, 07 Sep 2026 23:49:01 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm31139468c88.11.2026.09.07.23.48.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 23:49:01 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	lianux.mm@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/damon/tests/core-kunit: improve nr_samples_per_aggr test isolation
Date: Tue,  8 Sep 2026 14:48:23 +0800
Message-ID: <20260908064843.32067-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908063635.2208922-1-kunwu.chan@gmail.com>
References: <20260908063635.2208922-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  8 Sep 2026 14:36:35 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrote:

> The damon_nr_samples_per_aggr() test sets both intervals to zero,
> which exercises two different fallback paths at once.
>
> Use separate compound initializers for each case so that each case
> tests one fallback path independently. Also make the overflow case
> use an explicit non-zero sample interval so that it does not depend
> on the zero sample interval fallback.

Hi Kunwu,

The separate initializers now exercise the zero sample-interval fallback,
the zero samples-per-aggregation fallback, and the 64-bit UINT_MAX saturation
path independently.  Using a sample interval of one for the last case also
keeps it independent from the zero sample-interval fallback.

Looks good to me.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>

Thanks,
Lian

