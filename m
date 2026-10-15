Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1FF199947
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059208; cv=none; b=GX10k91Er3LL6rblqXKE7OpJGppJgnoW2cbpqKH3k/LcWXdmY7Bk2HQrXaXCnqQTraMzDYxTzy2PUxuSchr/EZoJiINXhWRYEogBlMvEtfgw8Ceq4GcRWqlrKgdKzcEnUnoylB4Z15ySryQBEQP0FHMpXu4HsT9tcH7tJaTI/zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059208; c=relaxed/simple;
	bh=AQIgnnlkDAOMkFcve0wwVpG795qOGakU5OyYPUaHddc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0e0dTeTSYQkyZ0MgFXp1FyURK/hhqSp1FwuWV/2hnU6ChY6lfTC+a/M9Wc7UwHxSJ5p1Urd9T/mYPpu4nJJ7y4EA5haomMueHzDy3nMYRiAweUEnD++XjXdo7fR8NF+HqDVuH8zX+7GHo0880Zz/FYVhGSEikzh44E17ByXvCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0RY7qjD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0RY7qjD"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df54150dfso305170f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059205; x=1792664005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AQIgnnlkDAOMkFcve0wwVpG795qOGakU5OyYPUaHddc=;
        b=A0RY7qjDP50lnGojtRnlJkCon8qpY7xzhKrMy3OPd2PsUhxVZBhpRjnFvEGDPJRppf
         A8dC8QMrNz5Zgu8YXt87PqWWWoJiAI2mUg1/FAWC/Spruo39ZuOG3i8vFWV2jpv/D6U0
         lvwUn9cF5fhgtW/nAtetW/MRZ3tRchtiUwZLlbYS2iJqN/897oysI/G4bcAR4V+oKGvz
         F4m4D+kuFS3xhGARpPMsjOxQqCtzh9o1f3aL0gptQn8/0VOgIbhvXj5rxIQFRR2gWDMG
         VAoJw69hFqBk0xt/+RWm05fJ5veVmaCj4GFr4sZl0hV1i7IR60a+1ikf5+Elpw1teUp+
         b2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059205; x=1792664005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AQIgnnlkDAOMkFcve0wwVpG795qOGakU5OyYPUaHddc=;
        b=MxoTvfBH/qbmMbYIYvX/8zdvoND4GAR2Te+gpd+/P134apCtFs56segkyptyDxlV+P
         1/FLgWcV3I6kEcm6PnChEgT9H3lsbILuw3YxWkEdAA6Iku9sPpMvULmSOj2s13f69bCl
         fE5h7j0jx1Kb8dmR+LiPU0hEpqs8UT/MfxF7eN61Cyi2fsLss/nwE2nyHley1C8oLWNK
         zZ+LXdKCd9BzvNfU7B8BfxMNcEHFUKG7Z3+dQoH9KcnXbrldMTGiHGjZIRtzz1OCCDnl
         XC1B5Vj1ptoMyfutyxH/f8e5b8SGenDQQi5eRNdkR8PIbav1OHyNamR6Erl4177KSG5h
         uz5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzfYtImBnG1QeSrs/x8285qEwrj64Wkfmshr9MEbu2WjKO1NDECcCxQQLiDBE3o50ZYxhBAKGSxNGSx09A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVi8AhF4NauLYhCacyX9mjEJu7qa+0dTUcEqDOStMUoZRGFcTz
	M8uw9jR8IW0kzr01DnpG3YBRj9i78TnvP6cm/o1TPPZn8Jy7TSCKzHMO
X-Gm-Gg: AYBFou3+kVgUB0bWjZLtHRGflU7Jj1oRz+xIRw6JnnPDTI69x7Q80CKaQJxGXnkjDtM
	JCwF+5z2XES1ODBpx7PeKU12tagvbhmtDFpYGY6OnduQ0g0QMj6ajNpfj5VGPiG+R8PBci9Cgrz
	fjgZEZPAhMzgcNjhDHX8mfXu3Hpgt2nuVOVMKEEA33ragEi/zaWHWudoFfa6puntlm6uEEkkhhz
	bLqce69BawCKuPk0YtM5QwDe4VcjCdH4gio/LyYiLtP+XSiCB6BF5o86kvm3bBhdDFxQ+TZ75M+
	EowkCjFtK2etNMSWRA5cww5ANKmNnusheOnSDb8s6l7eIb+Xi4R1pV0N1/DxJz4QFGVu/z8PrXe
	0w+uxhlQdyyGCpmV6+HNZIY6lY9iNLkvRD1mxD+Z3cYeblX3BMxNP8KLsFttIFE5XTH8UJzCcD3
	x9nKx2KE7wO45AklaRPRXqAHCgAY3JlI460PDMTxnzVUnMkozvziKqlUXqsuXtYlA6A70B0SNbK
	Cdkoalsr3iWkC4lnUPfFKAn3aQffaaK
X-Received: by 2002:a5d:5e8c:0:b0:48d:ee31:a07b with SMTP id ffacd0b85a97d-48dee31a460mr8339355f8f.42.1792059205344;
        Thu, 15 Oct 2026 03:13:25 -0700 (PDT)
Received: from osama ([2a02:908:182:d1a0:44fe:89e7:9985:abb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm16924881f8f.35.2026.10.15.03.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:13:24 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: airlied@gmail.com,
	jesszhan0024@gmail.com,
	luca.ceresoli@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Cc: osama.abdelkader@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] drm/panel: Use managed helpers in DSI panels
Date: Thu, 15 Oct 2026 12:13:24 +0200
Message-ID: <20261015101324.22215-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1789994813.git.osama.abdelkader@gmail.com>
References: <cover.1789994813.git.osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

Just a gentle ping on this series. It's been many weeks and I wanted to see if anyone has had a chance to review the series.

BR,
Osama
