Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045454AC163
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602379; cv=none; b=AVtZJkJyt6jMuPBl73pK3wkANitgUyCj0N+WgSdn3Exuspa7PkwQUS8/H7ZKmtJJbmtU9u964bvV9ukt8zpEb4yWoD30O0nozBes38E4Xk78yxHeQF5U2y4DzvU1O9I7i2LYJ3oioNTKwCcxWu9K67I6zpolxH03ukx9Pr3V28E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602379; c=relaxed/simple;
	bh=2OhXfXlxGIDEVphsIawGeDZhndr5+3TI4gbyGiqZyB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A9edVh/GIQJqSJuKpjwqV0dUUuhi9rB28T2n2dtehRdQR2oFP45sja51Ubuai3q63ubvfpM1V9RIdD6/7vt4a2V0ln4MG+hpWf+/kwoGw/7V8NcTWXSZw+bZVNgOwqTrvyiL4rL5QyljBXngT3l+glYggne/Kg57epbFn6aEat4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzB2R6ok; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzB2R6ok"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97eaa1155b1so130416241.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602377; x=1790207177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dpu5ToiMC1D2AynV1iB9BM+jRcYbmOZxbF1W5LEpeiA=;
        b=nzB2R6okEg/3UkWKspZXxmAVwp7nomGIODrdPUp/09TW93TnR/nHATXuQWcZe9VsEH
         rSXvDZtvLqYSSg8vUhGZA4a1i/3K/7vA9YaFicYtBbwT11bnvtIcyJPYTgJ0heTukpm1
         5q0f0195QnpEgCL4d7sCstNwGtik95kc/afjm+9F8iGmKpFV5uW3EDLff9rBvnmHJQl/
         pf0o/SFxqor8GCbCE8ffZqSuL1sa59x8SV1uW5fRUIfQEKfm3Kl1lZfqTakzFSyitDus
         3RKggRPNy+nvqS67ebzQqo1kCCOjIS111XIuZUyItS6H04DMPyRKDXKGWCi85vae0zIo
         djPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602377; x=1790207177;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dpu5ToiMC1D2AynV1iB9BM+jRcYbmOZxbF1W5LEpeiA=;
        b=KzCIliLLN6tCGu2l9d2xC5mQz7sPouEEBb/4c2v1pmK+LoiLzfsMkttZkfd6l9rOc1
         gSdlaxndIbMCw0ecMsiyqYq89wmaeGcnLw4EPGNR9eivw4mc9JGqzydL1yXcwoXEr8Gg
         hFBZvgkH8egfD2lEDUTHzjviItoj0oWHxvKXiPBXPu4DLTJUfLg0EVpNBZnv0ynY2Npy
         I8IyX1VxWeF5FRVJ7CYsf58pYM6oCKl3Oic5AZq3jozlldhwDAvwExaUyczJ6WaX+kCH
         wss6HKnPQVhnn3KdJKUrcs+LxK8V5wHdax5pSO5GYr6ART5BpWB0c/fi/tW78qGWJe7B
         rwNw==
X-Forwarded-Encrypted: i=1; AKwUvBzXH0Csbdmy2UHwuSLpbqTp/fvOnGvRNG0Uzl1+JUD3Vf64Nalf9xA0UowSn2/2+I99UOfRLfLR40dcW+0=@vger.kernel.org
X-Gm-Message-State: AFuF++krqLIOxdTk32aS9lutJ9uH6qTVB768S5KNdOihxHIjY3XdZqsX
	X5kY0gsVG3TwfOpYpOwLTl17zx+iRk2kOILN9YRw6QYgH8N1UFBAjAEkrRuGGVwv
X-Gm-Gg: AYBFou1RkvCyPX3PTVI02G4mgtJNW9h9/7sfbQI9R5oy7ar0fjWJ9Kik9cjPfmWCj7g
	nPEONt8gYXUtb6gcso5RUCmg9ZuOW2N+x9QDrMCJxrO+UrWTqR7Ya1M5FYvskvuMDhEQ4ZE8ah9
	IK6gl7uFg76ngQ3iXCxrERzU+5Ux2CFYmH72gYnsvP3nC0EeH/MlwrQnbWT/df2fb9o1+8VtjLd
	oaQkIcFtpKUTe/F7KbVMJAFvJ8BGSGMALz0kFIR2JIOFcIbGlpOEKUTNFzjwQELCpGDD1r9x4T9
	zNNPA8txK/IT8xA8LODraw5hr8xWJ7qs1HY1mk7s6vMAUMxirXt7ofAdr8QOq2eOAL6YX47zQEt
	cInjGqhl+pZ3iXbtqlZw/aXYr6WtRpwvP7UEB/4crWNx5ZyObIutHGpzla3hOh6ycBwSP6Pp5fU
	BropCdpowTU+RX6vgkFr3eCn8rZ649qTCaOdAT3f6b6gptu+HHeBn1LC0/uT8F+vbX
X-Received: by 2002:a05:6102:5344:b0:7a1:f7c3:3a41 with SMTP id ada2fe7eead31-7a1f7c33f3amr1280846137.14.1789602376909;
        Wed, 16 Sep 2026 16:46:16 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a1e314e925sm1533528137.9.2026.09.16.16.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:46:16 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>
Cc: linux-nilfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH] nilfs2: fix checkpoint root lifetime on sysfs errors
Date: Wed, 16 Sep 2026 20:45:48 -0300
Message-ID: <20260916234548.376973-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915041206.2430937-1-qwe.aldo@gmail.com>
References: <20260915041206.2430937-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Slava,

Good point about the wait_for_completion under the lock.  There is no
circular dependency (the release callback only calls complete() without
taking ns_cptree_lock), but holding the mutex during an unbounded wait
is unnecessary.  In v3 I move wait_for_completion() and kfree() after
the mutex_unlock() in nilfs_put_root().  By that point rb_erase() has
already removed the root from the tree and the refcount is zero, so no
concurrent lookup can find it and no other put can race.

Regarding rwsem: the kernel does not provide a combined
refcount_dec_and_rwsem_lock() helper, so nilfs_put_root() would need
the two-stage refcount_dec_not_one() / down_write() /
refcount_dec_and_test() pattern.  That is doable, but the lookup
contention on ns_cptree is minimal (mount, segctor, recovery), so the
added complexity does not seem justified here.

v3 follows.

Aldo
