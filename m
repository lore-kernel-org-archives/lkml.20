Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBCB3BCD38
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393323; cv=none; b=If0Y06jslVVxoQGU9gD7288a6ZzRs62nKWrJkdezDZgkTdqXJa/+OOCeo1+rTijlLezbE55lX95BN+R3U5kYzG0iwQEWNN90pcFExgsXKK6Xkrkf1prbWRe67mgOu+i0Cj3gAvKGPT6ywq+e6S33x1QaCIs1PnZmkmga1EYitq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393323; c=relaxed/simple;
	bh=PddB/J9MtdYNRVBKmIC2rQyphN1yaVNjGXFOy6TLFHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8ctrpBaBNevnGKm0g1eqsvVjWylfvRBwy0jWvDBvnV2MSBIqGTUeLdcFIjtpeWBRTu5fauHphAImBM3Ls6GDSHDSWDZsUVyo2k8FRK+ti38LW/5HD/08j5dM+uCyQX01JbWkFIwnU+ek/lPrs/lyd0qZbX8o//jcew+gP0mehs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTOfUo6b; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTOfUo6b"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c8ff1so3338055ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789393322; x=1789998122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PddB/J9MtdYNRVBKmIC2rQyphN1yaVNjGXFOy6TLFHI=;
        b=sTOfUo6byFjMoOmtCTEjE2sCm8r3Q0o7rmKpF5b2pDvKFgeOZRwb6dMVkAbyXItHtD
         EypDeDEHiFVA290NrYjc2/Fm8D863mXGP0L7jQ3gBoUAlOqi/w5dCNMHGS1TJL8As2x7
         x/mvupNB3g4P+HVwJz56tb8tA/pQcU5jjHiKmM0COdMVImfD7E5Z5MeqvTws7W1YzfNo
         AujjK+VAIwnvbB/qz9tezTK3+PEwOmAx/efp5pF4WgAPgHplRH3NSrnL1xsc792Faopv
         Qkf53r2YqUNxHRD8i6jULGTmXmQQhVbOyR4ks3mbNpsjeyxmXw4ujQtbCHecN0/CrP2i
         dl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393322; x=1789998122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PddB/J9MtdYNRVBKmIC2rQyphN1yaVNjGXFOy6TLFHI=;
        b=JP7Ks3vZEhTjYYAj4J4SnRV55RRuI/0mCII12rT8U+4B4QmBvm2yTdJxuX6PduZkFF
         CkNj3W4IH5gHuvaZ3QjHWdHtzmUCTUlnDm4ozCx8zvjWvFcSJQGdjWOIdqZOpR+s4TOK
         N+35Tm217x2esQqmXWWqsSvZwskJsx1mdyCZ/lkUcorz8R5XJyFWKUDaN1r0yoK4wYno
         QfJX9lhF+I8HE2BuHUKPfbh0KzfmbeD43Xexw6XOE3RmI+Em2yALcQnFJPWFZ/hXVGIe
         xOVBolwWUtoJiuGa49f6+Yxl+FwhgkpKBBbi3HiDCZGH8tf3TG/QP/o79lOaqRDdZLlW
         jVTg==
X-Forwarded-Encrypted: i=1; AKwUvBxcMiMkncyaVCKrRi5XLSOYNb8T07rabomhH3TLxNzUjviSTyF8Y7d1kB/l1jGqnZDQyDHLP43NZkRDLMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mA1UDp+hAmXlwtTwGRUuSRQ5IqCURG0ihxSTlQF+nG6VGX72Uw
	LsyctVtjPwRZxMCAAVipSbzvTbvK1+o8Exd0HUH/CjpXuUKeywl3znl1
X-Gm-Gg: AYBFou0y/k28q4HsGBRvjl1Y0VXVZ14MNVlGz/bcbZWvRl9xtkMXdRe76SVS9BXgP6b
	qjoDYebEfU9sO9CeFB7h+9B6qN/jFIWm7DB3wX7G5O932vLkbAWkZa1NWpUE3Pzz1pEZ2nGZuLv
	PdsUIC8L8srtePtGsRf3f4AFhuyGKdcgyZvTOA+cRb3PtbOhcoLq0LI6951gJytDUCw2Wx+8+d0
	UzFAL2v4ud+yJk/23h1r29wWNG4eoqTsExh7aCFE3rhqoNVP1+sgsePYXn3QsPAeBRTR80m+lns
	lRqf8hgcOfhRoCdvXOhTqQdOLKMRixfSFjvVMgBCo4lsY6Vhuoj5SBkviDQ+kLznzA3tV+8rB7Y
	ADXfOx46k1/NiG3tuG1GcBodtXkJMDVKOsrbyVqNKj2A9V+bIwot9hK2a9mIwZTjVRgBAU5grX1
	vph6mm0WeliLMeMtJ1/RPeaEevBugDgddgOTZ1Lx+lJEe+fPo1csnR7jj9nc8adisl85lNwd85z
	U1U6rH2TLSgAYymJM2ORoVWlhxSAlW/mn974vznWiL0NDoxD1H67p2D1U+ZJnPdhMkSHpXvZ7ZF
	xNxyMJHiUb1wHf6Odyj4lZBUDzn7S5c=
X-Received: by 2002:a17:903:4585:b0:2dd:190e:28b6 with SMTP id d9443c01a7336-2dd6c6e2812mr38152905ad.2.1789393321736;
        Mon, 14 Sep 2026 06:42:01 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff6e80sm48982875ad.78.2026.09.14.06.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:42:01 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: rf@opensource.cirrus.com,
	david.rhodes@cirrus.com
Cc: Navon John Lukose <navonjohnlukose@gmail.com>,
	broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: ALSA: hda/cs35l56: same calibration condition logged at dev_info() and dev_err()
Date: Mon, 14 Sep 2026 19:11:54 +0530
Message-ID: <20260914134154.1295196-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <4621b455-9460-4f45-88d7-303b6243ad45@opensource.cirrus.com>
References: <20260914000308.108995-1-navonjohnlukose@gmail.com> <4621b455-9460-4f45-88d7-303b6243ad45@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 14/09/2026 11:09 am, Richard Fitzgerald wrote:
> However, I can reword this to say that in most cases they
> indicate the same problem, though not necessarily.

That covers it, thanks!
