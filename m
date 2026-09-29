Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5467B53B33E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790714194; cv=none; b=sARK4GWLCpRaVqpNjRFEqWy5sicAlUsvez3zGfUc0m7SHUcXLGX6QBvwHXlrml7jz6XiP7RWACAw6NZJcSMs/NEJC227TF0aFqmfmK8EDZFLYyes6URHQWlKf4w1RrQJTE2laIBka0akt41DLaFf89I5Ms18hCHEr+W2tf8VymU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790714194; c=relaxed/simple;
	bh=d1KbSzL7wbUeQWAqRwALt8wrw8AGHHea3aEV7/CG66o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iILJaOHpUOgsMq4zOWHG7ny+MaBdg+KcvTVwo9IUmMshSedsLPNuw7NXAWCmCGespGXycYONEEyaONF09luXar4zMlvTahO5JTT/3BF6xbFwkdp+umDBF6m7wb16Uc/2Rw6Mlv/MfOoooKtoRJgN+7r8JXARA8geQi/M+TFNxHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXLDzNgK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXLDzNgK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso4411385e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790714191; x=1791318991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HY+uK+9mHQGUTtMN3D118HnRijdv0U2Tb9WBorVAJXM=;
        b=OXLDzNgK5Id2GAaTa3qJn5JYZ/yDM74qbu8jfE2Eb8ISskglksyCZ8cdnSDBuraUMu
         KTi/gOWCbeSVWqcMjdoK66NLtNBvff58Yc1Z7cCpUVlhaWnuXDmLua9fp2wOSHl5zwHG
         1MdyEhfUvsIZqbE4l4fXZJ11Fw7kTXbMlJnAumYKLAdPWi3nesCPOlqYNRZUGl648QAj
         D0IyNo6kc3btkHJgTR2tRaRPArN3wm0jXHO9uvsH8mBT3FpjKabMZshaZAje0cXzU7DK
         zg9wq1u/LQTt02gyvzkiQAtg8vdFV0OgoXWQO9gQd9MOS3byeFzDa/RKYm7mbKtK80+l
         6pTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790714191; x=1791318991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HY+uK+9mHQGUTtMN3D118HnRijdv0U2Tb9WBorVAJXM=;
        b=QFslSjgMvs9on3K/VkxvwA1IIow7ZNdEvPwbjjaiPtgrUD1NwQZSSrsrVKV99q3JBq
         IuZwhcUjkK096AOe3IseCaaIy+Gp/4ElE58lIifMbkTa3IwXRdYT2QDPh/CBZorWlf/6
         /fuTgRE8dmta3dIzE6bsoPXv9zfg3QFV+EKfGMoZGUUW6X9+FwRzuAsUt5FMjBgZQVOk
         tdK0J7AViloYgqq2NdWdRbq9Xq5rQ3jad5OI7SlChr8VRyOZGRTWb++tJ6mwLw/vpfYZ
         n55o5s6txMm+zrG3Am2DLhEkjV71f1o0SJQSYPN2BX5SlHGkEyBE2BsBkZWojMqtF8fd
         3htw==
X-Forwarded-Encrypted: i=1; AKwUvBycvgBSPErAVk0J+oXCNdduHIRK1a6RyBjoNF9hLHxCTcWSGLfdu/xQi+EmBRLjOm73fHPsM8KTgo470cs=@vger.kernel.org
X-Gm-Message-State: AFuF++nHiaqbi3/GE9wLgIdDwG8Xw4aYXhlGTmFd9eLXdjIzTzsSagXp
	XmoNpn5Bf4YWL95JYl7NA9Pa8LIEiFU2iOvK9f1TvqZKEoLjmvde/FM=
X-Gm-Gg: AYBFou0llMUbcRe4gNS53CIkUeimdt4I9QtQNyJrTXSxDTJbu56nKgtF//n+R62gj/C
	DpQ7fPXqxJN7xKa0hPO5t9WFk2wwWQvuAgQV+KWD5lSJ4Ce2vkLr7+RoQfX4XnxtbLc0wNYfFFi
	qvO1crQOjeTRp6GjNDX2o49yVllPRc8hhCL1ANS0EF7zez3x6kB/F33+RUgU5mUX0VUUc6SVni/
	WnuMiJY+wzJyIskYO2OuSkesgEKkeDJ+RlC4Vr2iCu85MPv0+GXsToZ/ea2qtk35MlKhAeoKLOJ
	uPWQb0EPfN6XHyxjZP3m0lAMN6zPSmOk+VN/Fq41kgzXtgsJdN0e8Rati2BVwaLDrJArw4tq7sU
	XRjZvClXXq7l8hSWK3wevFkTbSsSkXJO7zIYvqNBvOljLwxxlB0ENqkkgIUamw4MFQqFoTNLvXL
	YmSxYMw4bPGEEzXeWguCEEBdQawQuRdf1lLlKTOhszQJtVESn70WA4NaKQ473fZd0TiJW5i+ov3
	hX5BFyyLwAGd9cKFlzvBk2WzqEBsS+rJzGsMTfMmB8f97G/tY489bzFGNFaOIVuH/LOqeAqLqvQ
	lXH2IKs=
X-Received: by 2002:a05:600c:a08:b0:49f:d69a:1a04 with SMTP id 5b1f17b1804b1-4a015141deemr4262055e9.16.1790714191554;
        Tue, 29 Sep 2026 13:36:31 -0700 (PDT)
Received: from Ubuntu-2604-resolute-amd64-base ([2a01:4f8:13b:86d::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015019e5asm13682155e9.2.2026.09.29.13.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:36:31 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: akpm@linux-foundation.org
Cc: hnkz.64@gmail.com,
	gabriel@krisman.be,
	krisman@suse.de,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] shmem: fix unicode_map leak on remount with casefold=
Date: Tue, 29 Sep 2026 22:35:46 +0200
Message-ID: <20260929203547.229191-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929132129.f22de2069651aa2eaf56bf7c@linux-foundation.org>
References: <20260929132129.f22de2069651aa2eaf56bf7c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 13:21:29 -0700 Andrew Morton wrote:
> I recently merged
> https://lore.kernel.org/20260827152516.805622-1-hnkz.64@gmail.com
>
> Which is preferable?

Kazuki's.  It came first and also covers the repeated casefold= leak
I sent separately today, so please drop both of mine:

https://lore.kernel.org/all/3a57ec70731165b4b1244fa89bba95c82a666df8.1790712330.git.med08elkadiri@gmail.com/

Thanks,
Mohammed
