Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51121891A9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691472; cv=none; b=QkqegOCp/MMx2Iz5QryXVZSnCiAKgY1EWJtSui6ttZguK4VFIuhIERH9pRMzyA+JPRotztaWEgFUxAK9VSVFTQDkSwms8fa9pY8zrnbJrw7BhSYivRfl1KQwkhUaiJIP7yhMM1zfqOiGeDOBuwaFRY3xflHOLwR7dyYm1xsoHVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691472; c=relaxed/simple;
	bh=4Yh0Dtvko0nZONYoMl+zPVKAif82Q3nxAXjZ3IYlXSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfMmFKHrUeTjhuTCYlUd4MslYHITJs05zEFJjFRmcb7YmleV6I3isVQeW3G+oPlEYbPl5C0k7oB/ftv480jW8vuYI8CcM7VD5/46XXELalP2Zdyov7LUdwuVcUJJHjWPGyjXnd1by2YUFZfzDRUY8QQ87ipyj2j4m/GEXpWnwmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKEppUl5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKEppUl5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so39969225e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691466; x=1791296266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Yh0Dtvko0nZONYoMl+zPVKAif82Q3nxAXjZ3IYlXSQ=;
        b=RKEppUl5zf0Q2zmAIn6Bu//M2uApmTcBrvVJfQ7/ZdbVSHVfYYxymJlO5uQRuPCJyX
         ntquiIypDXZX1Fgwrr7ZlpfPEobw4JsOU3unCDTSZEhao8T3lWSmzYpjsqabRRXnKBwp
         RoWNhOQAV2RBwnEFSjm73t92i/xEB/yJG/I/xVTGxMixfSYlow2sjIYdL82bmqVx6u4c
         2zI28Ql4euuy/sW8VNp8Rf5r7UDH1LuOw+dtMRPwBQiVb07+Qigr2YApRQVHlrz/iQdC
         nqI/BADNNehvNmSLJv13cqg3+HbKfgZgyiSbmUpS66u8+SKf18leAMLY1HycrIghO2iQ
         lxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691466; x=1791296266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Yh0Dtvko0nZONYoMl+zPVKAif82Q3nxAXjZ3IYlXSQ=;
        b=uSyJErq4R0f8yGTXJ/hPjUMjiTFWgCTDRNA1BJrbcAzmr+rSiDyTqZq4xuzh6sM9Bv
         7vxhBfKI2xRX55EzMdWHqZai4ujC5qfSRly/F/YqF6Rnw7S60WM4SZTm69lWRuHBvkJ2
         9O/GzJCq4viLnWKjroIiLd61CzwsBBQ/jTsmDjJ1gYIUSEvljhpSpMMPyzuiLuk7f4eC
         HT8U54d8oon/OsatrgrqbJt/Blz2Nfy8Dq6NnGzqOnezDMY7wxev3PgVqCD8DMX2mYoF
         Qyxp4T0Ocmy7UHtsPoh0cjIcn+sRzvFE0xKDvsYzLfu85ijyaoCfKcSEmIrw0leNvQuR
         MpJA==
X-Forwarded-Encrypted: i=1; AKwUvBwXUaFtlQuiSEFUETAPWQYx4xtge3LaFAiXkftdIFDQRjib+7BPH5hQ/3EFS4k2SHlSQ9XxoDxTY6eV4dY=@vger.kernel.org
X-Gm-Message-State: AFuF++l/txE4mHsRL+CC7Y8zcV98Gi0KdHsompnI7iovXzSM5LRo/1Ys
	nO/CBFw+tjo3xbBk143W+VZWlip33RgK1cRG90cvzfJhtDXeIB8ejqU=
X-Gm-Gg: AYBFou2iVPt1PQeoCIeJQUPbnYFRGjnEOkBzQOaKLo1RZFJjqVGc14lfa2P/dnRxYsZ
	yLiBv9TXcQDpvNgDmgbzG9Ch4VJNipjfM61mtD7GmECmA1uuGS79Ksg17rFRtHmyjpmWm4gZ1wr
	7Xfe+DFyAqAe9L6DWVCDkGx0uuz1YFXUr6A78oVIyCQbyaxrPU6m466wJ9jgRHSKsln9a4UXqaZ
	qQXC92wKNJWs6jshAC61yg2g9FjpQsaR8uULfm3YLVdCMB+uNxSLXKYy/g6ikVpd5QhyLYllV/o
	EOaccauLyZ1rx+2zK/1D+Bk7n8cDMq8y21nEQL4HeIIJGyo0pKsNnGbilO1indc+clua7GyC5pS
	k1LB8ztlROhgBodMjnwqxvmzseSCrO71x+byXl5ukS+6TCMTnePkmhYKCuXMOuaWZVkgT6imLUh
	NXpMVqBERfc7TxAB5bazq7YypH46J7RTOv0r8AkrEYMisqD4gm+BzE/cVpE8PuvRpjBLXYJnZdt
	RAaJcDHhs+yuE9gqRR1Y3T5ApBZRfQwzoBxNes39GuXOrfJ7JQvFvyjJ+9YLHVd8HBYxNB6Eqiv
	HHyf6BEffwlsSdIDXw==
X-Received: by 2002:a05:600c:3511:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49fe66fca74mr266280215e9.23.1790691466237;
        Tue, 29 Sep 2026 07:17:46 -0700 (PDT)
Received: from Ubuntu-2604-resolute-amd64-base ([2a01:4f8:13b:86d::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013d05647sm5702365e9.2.2026.09.29.07.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:17:45 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	andrealmeid@igalia.com
Subject: Re: [PATCH 1/1] shmem: fix unicode_map leak on remount with casefold=
Date: Tue, 29 Sep 2026 16:17:45 +0200
Message-ID: <20260929141745.211878-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ba38f80f629fd093c77f3a49fdab7b71ee7bbc5f.1790687276.git.med08elkadiri@gmail.com>
References: <ba38f80f629fd093c77f3a49fdab7b71ee7bbc5f.1790687276.git.med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Missing tag:

Fixes: 58e55efd6c72 ("tmpfs: Add casefold lookup support")
