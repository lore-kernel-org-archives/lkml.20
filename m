Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7472A218EBA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337001; cv=none; b=L2Y00d7Kpbel0CbSdUe7ESP2OfRwXXQer/1V5EOcJc7XZiEtYc2YeWdaGfrQdMp6t0Av1ecOqRRUNbZQSKw1X7S2sCAyFZqFtv9hUK/R1aGao3y5dtCn3WMf5G467NbnXBkxYtCH/lwJG9Kbzwb+QM9fDOYO+UYIheu8+HM5lio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337001; c=relaxed/simple;
	bh=9ugly3DA88PHzTcF6g5Lltp+fotX04uzRCQV3bTwQjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSJP03AbDpRum/gf4WLb6QKDqYZ9KhTpfvtSPqvcw+y9TLmsDXo1jzcMIDExcKIKSFZ0hxJHJ2WmRjjkraCc6PXj2usDAd5Tg/lz5I+yjmPPKcoi4VsJjtiRjuPWAe02DMiNuB4goM17HDPklyb7sFdu2jM94RW3VxOtT/YTgFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAMMZ4aT; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAMMZ4aT"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38511175ad3so817841a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788337000; x=1788941800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ugly3DA88PHzTcF6g5Lltp+fotX04uzRCQV3bTwQjE=;
        b=rAMMZ4aTRwUmhFaecrfC9IW+4NnKs45D3g+f+GyYtnAxjdAvLPbfgKaSg2W5rmhsfr
         Uhj/GK+xlIIcZeoMeteMFGogaVwcUhpKtHPcz365fs/Nle4FiBFHZBMOYqU0Bdt1cuDQ
         KSaDdi2Q2supYSvyqH5GZyyl25lls+LWAV725PQw6u3N2CVC9Ur3UCWz9Z5F9Usd+ZJZ
         LjD5gIGtSPk8A5oZcgHkmzUhbB1KJGf4cBMns1UU25M0mSFU79FywLb3oduZ9o+JS90l
         PDlZNuH8t0gfsN8mnQJ0Q5bZpEVhihdfyj5EYynjBkr4XAEXBBGESrxJDuANLQix0NMp
         6b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337000; x=1788941800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ugly3DA88PHzTcF6g5Lltp+fotX04uzRCQV3bTwQjE=;
        b=P9iJryOVkz2SI5K4L1pCPMEBJTkk3sIU37xFMRWk7X6Z/Af/VW/XumBXOfUTz+pUyA
         9NfjCra4VlfTqraiFF/Y80C+a16MTfERLCK1qRxgWYfH0ixxdLE74oQLwT0Cmpz70oq/
         FhZXCGh/uNdG8hTGyq83JblbhhzwqwrjH11m9I50XgPFQdUHWhMoswLAXrnguvqjUjcB
         cc4LBwnxtH4UPUb0qa1Qxo/JNoFA5Lu078IzEYMcNqg0UBJwvO7iqWba8AsQCsU8OysR
         4OmjhsCMBz9vhdI7jDVSY/1Sxt0nkhpBDOf/SHsYdA6qpOXZBVAs00nx+JlCLXCZZ15C
         /t0A==
X-Forwarded-Encrypted: i=1; AKwUvBxsDO5KK7fpBr2j8er+7xjGJ5gIBjRtmvOvKiKAV83dNQsr4RcUkPbsFEC8nE5xBcc6xSDRJvhuhcYbswk=@vger.kernel.org
X-Gm-Message-State: AFuF++nOY8tmF6YrcQ9F1JKNILFdwUiZssEoIlxh7GF/o95FVqUZyfaP
	2lt3/cipi0dqf2nYx90sA9pE+eDqJzWycnjIVavjp3zP5fJyZkpV9HD4
X-Gm-Gg: AYBFou2gwvrS7+ZdKm9NT5UVdryFvhR3ae36eZLX3+ewTrrXC0sqmZ9wCbwVlAtV2cl
	N3u9usg1CkFW3sDhYF3QVQOP8yJ0XLdeAEP5A1WjRgJsgfNeKfZyT9CFgccx/3MYvcgb1+bfjwn
	kK0HTBD1ojVNlkgWdR695JBXMFANK4oTr7OXKTEE08HLN9sqKwLbVk6MNdEx7zA3Hf3rKwrP/dJ
	GIQQu6Q6/uCt+1nPmZ7WfHSJb6doxHjKbflN73LqvJutXMkIoFfa/+Dnp1bWJXnTCLil294DrLY
	FDWHSdtPUR3f6IoJnEJYnwuDUoVJ1jy8LAIcstZvBUrq14KiJ5ylhta2fjwLgmEEcdshYwR51A4
	5az1UjKvGVE9EHdweyJU7ariTVSJcuMGTq2uYNzIMlPdClHuP7cC0JaLT/RUEILel0SKntMAcWA
	yM03K3gfA9/eHm4XTtZ6jyILIlHusrlvOLC5ePaRqlynJm8eZUZwqPKyOZBumh3hmAyb/zdi+Vr
	ZvUfCEZlgQcjDG0YrEIhjxpCw==
X-Received: by 2002:a17:90b:5281:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-39aee030d9bmr4725312a91.11.1788336999723;
        Wed, 02 Sep 2026 01:16:39 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d463798sm10105680a91.6.2026.09.02.01.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:16:39 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: chao@kernel.org
Cc: daeho43@gmail.com,
	jaegeuk@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: wait for inode record work before clearing ino bitmaps
Date: Wed,  2 Sep 2026 16:16:33 +0800
Message-ID: <20260902081633.520538-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <afbed6d5-0c11-4041-ab8a-68f0264dceda@kernel.org>
References: <20260901140849.3405971-1-qiwenjie@xiaomi.com> <afbed6d5-0c11-4041-ab8a-68f0264dceda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chao,

It does not miss UPDATE_INO. The mode argument only selects whether to
wait: both APPEND_INO and UPDATE_INO call
flush_workqueue(sbi->evict_wq), and both updates are queued on the same
eviction workqueue. Therefore, one call with APPEND_INO also drains
pending UPDATE_INO work. A second call with UPDATE_INO would flush the
same queue again.

Thanks,
Wenjie
