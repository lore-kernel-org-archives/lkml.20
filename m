Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070FC31D39A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788005623; cv=none; b=HyLEvumuCGEiQ0wRYZ2UKCgQ/p0LliMpn8N+mJBvz9VAnqmTGQG5UtpoJmW0hTFfuLTV+DUgsCR2KJGwhFa1UBHg11FVUdoZM5h/4O93xLXSQ6gLTW52HUdLbcy4L1FsMwyvbWhUnzn/v3jdWjFcV+y/V0zmlDA+fjoAPixyb1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788005623; c=relaxed/simple;
	bh=JAONKe6FamLOeWHqWahtkO2yz33T3jhe2IjUwPgMEsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCOYvvuVPXc6EKG+ucFWrkWw3kiZIrW/qR69JI6ECHw92NVhfXLqiT1Ojsd3w4nOXear1AjsqpqjOVBkPv1WBV16CLdCS6LpDN7TWv5ft/J8dq/PHzw79mQAj/Mb81IUOdfbq7aggbz/cG5Q37jObQ615ZVkNfwpL7q99m6RmoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hb9OckwD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hb9OckwD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-852c481415fso2124289b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788005621; x=1788610421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3qpiRKhTPXXV/T2+awybSnvPRBM65XAy0brn5CKaYMA=;
        b=Hb9OckwDnr8wfbcsxCcBabOmKJv6GhFigIg31Itlf92ZBjaW+bkygcdIZUvoSABcxy
         h/d1jnmnlmdmMHqu8ercDmvCfi1HVrdZLGP1XoryGxh9M3wmYT2olHWj6SMROdnNcoxx
         AePdCFLz/u8RGB47ONZ8SL6w86nRxENim4MklUOek7SoApogJE5WjALEVYITlPgRFX9W
         8Wtci3+eZ6yW9/1a2ThdDTNy/yjR2kKkR5lNUI1ttEKDW5meQ5+95FoQu6yC8/NpVlP9
         DL5Mhst4a7EpiVu4v5GQO5oGDzAiCm1h5ivMcMIQPz8l30HLBlM0xknSU/jsQsI6OqsQ
         w8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788005621; x=1788610421;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qpiRKhTPXXV/T2+awybSnvPRBM65XAy0brn5CKaYMA=;
        b=igDQDVQJ0k+qVVAS8VPix3jEivMPzCn20oq/yCapvSkxmov4+qljrK6LBOkbftTL7+
         xgM3NJg1urkkoS7rS9LZooNsamEBEU3Epa+kQxdZhRpofV8zJDz7/H7NFwABXLZj0gu5
         Og1ocJrRu04CO8qTC8HchXFYMR3F+KM1NEn6zoE5g901pHtvFHS6mqzMkmr/EX2al33F
         x8xAisVa76nM4JaKW3PyhASIMPJiZbWjCNVDc0ECQLmG+cYwk6yoHgBHiXj2pP0N3bp3
         YRYHZBMCiP2pqo8eSvLsVAw3+JYkdFpvf/nxJo7Ex0OgnuzsIKkajMJAEJiHXXgINBTs
         8Hsg==
X-Forwarded-Encrypted: i=1; AHgh+RqQArC3WRWwr5rYXZjXcR80MlQUyAcIrHqx29SNAGbkezkOVDDgVeKg4BrQlqUmElqzq/cwxvrFhd63e0s=@vger.kernel.org
X-Gm-Message-State: AFuF++ms0QxB36sWVh1riFEJDGM/fifc6Rh/66iQvnzwE8q26ujAFx0U
	YJlE6iAYk8+u62MxI6ARORukk9BkBT6NQ2e50ojNRKgOpaMl6Kn2uKpU
X-Gm-Gg: AR+sD10A4aTuoSUVpLqePTDjY0J+SemVbZsKxnFMP85N7Vv+bPtsOJP+hI0XgEkutw5
	+8QqSkGf1kcGeHYOaztTePhlr2CZQE+8Ti1V+SVn+6bUGa2vkXUaxV+0CTf6qhktXrj9VXYJRaZ
	y+3KS5tF3hB+peLhuxPOjZfP21rI6JYWWR8IEn6khmMWLKNUzwdWJ0U6viMeOMVWAJBDYXTYmT8
	M8+70HcY0nb7DjFbwNvVbvWPkRNXH/RaIH1xo2D8eUWViIvEKjH0t/YqlQsMALjBM0NiALsQ+MV
	knB8Ge9P8sNDgK02stujBixKy3QSZN3u8/Ppgml4QVToBqBqWn6+PSWNPVGY9CgdjfZUQXZTiq5
	JyGtgJtbddOCMrC8sZamb8HJ+RzosVQPeK2L1tuWb8begKfH21rB1ZXCkVhuSUhP1cy0r90t0Kb
	8sk45bdX5zP+PS9d1kgLBtkDPKEAzCsk0ztxYOBazeRh8AmPQE2h7I+fZT+ZPDJZS6RLcxon3zI
	UkBRGh2wuGnXNrqYW5YFUvhnWSBHCTQNg==
X-Received: by 2002:a05:6a00:348d:b0:857:7337:5dbb with SMTP id d2e1a72fcca58-85773375f79mr9928458b3a.25.1788005620844;
        Sat, 29 Aug 2026 05:13:40 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569f984f4asm1439527b3a.15.2026.08.29.05.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 05:13:40 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	baohua@kernel.org,
	qiwenjie@xiaomi.com
Subject: Re: [PATCH] mm: filemap: tighten dropbehind completion context check
Date: Sat, 29 Aug 2026 20:13:35 +0800
Message-ID: <20260829121335.3491374-1-qwjhust@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828181035.ce6e23970d37e38b64818f10@linux-foundation.org>
References: <20260820142956.1414337-1-qiwenjie@xiaomi.com> <20260828181035.ce6e23970d37e38b64818f10@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I kept the helper private to avoid an MM dependency on <linux/bio.h>.

After looking further at the mapped-folio case Matthew raised, I think the
better fix is to retain a dropbehind folio once it is mapped.  A mapping
represents a competing cached user, and retaining it avoids the sleeping
unmap path, so filemap no longer needs a stricter context helper; the
existing in_task() guard remains.  I will respin the patch on that basis.
