Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3AC4C2265
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803431; cv=none; b=YGRY6oScLXRasUu7Z7n7HAV0jt/2jLl6YZmyJ8tU4562YItpleB7SDJivrjUWnOmVfU3g08L3gfjAVnZQWG0vnRDW+sP62j+l7tp8DI0i+rehyoIuF0mzutOc0hd6h/MIHuXluJLjPS25M3ln4dr5Qkoc55WGJeJvLJbMRiwcKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803431; c=relaxed/simple;
	bh=5nULokajq+EGRczUFAS/zID2IRCv4L5cJMxnamASDig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3sRXkuikadNpMVeaec1JAySkjhwW50Eve/aJSDQ6kW2SXG308OylUeXZtIruVth24v0asTXgkjJLkG5m4x7LppdP+3ar0hGpgUrD730Jbroht4tUVZjcl2Ku5LyXQ8nP/W/FMGx2jqk34ThZne52fkW/xNlPb0uXonbTzG6zik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoRnuKPq; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoRnuKPq"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e309aeb38so84243466b.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790803428; x=1791408228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5nULokajq+EGRczUFAS/zID2IRCv4L5cJMxnamASDig=;
        b=IoRnuKPqlVsp/Yv0p8kdYuFBoIWbuRUlQdX3kDAIlgGtfRUPkzpP3xza9IqxtiJ4Ud
         6fyCNAGd87Yl5ZAlXguhR8q9lg5qL7UHuHSmmx2QWX4AURrdcbT5HTSElujM7Fmwh6DW
         UuQoZg7Z4qxL2D2gekKuakPIclrV9V5A+2hLwiVEy6Lf7XPGE8gkaiv1ZTzODTypD8LP
         li60Gug9Iy0fG+k6dWN4COoqAlEHmCoujVH3tNhj7VuoJ/A2Nj1NEBVvYDcIUYDfahAt
         fKt+jFauN1Q4HPKEl+xS7gv+WQm0/115ikVGHl+d+ckEDbMsSEIdnmHDdU7iOf/q4YIZ
         2YVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803428; x=1791408228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5nULokajq+EGRczUFAS/zID2IRCv4L5cJMxnamASDig=;
        b=vrJfsmxiL5p3Pwwep/usFOTYPbHHLWwaHb+rIwg4Wxznc9OwUx9poXlRRNmRbqvsg7
         w3+//ZIUp7wp/D+9qd6t13kHc62vF7q1c5TXfhE4vX3kOg0W/KZ77si5P1gDTVeeOQyk
         aNM543uFLAaX+si1s/hDUvBiQSt61HRIQA6o1q3IjK55QmH1625H/o6nuQsfdZUbW3Lf
         WIWOR/knWX6YiIau/MmJSU9fCAgesR2dW4JggemnT1ij2FqWQ2/G0uBEkxRQ7g77X/ZZ
         7PQz/TqyFWSzLR9RzlL8YT4k43dHu9GdaM6HBrF/9Po+MpGvhhKkoE0OqGqNtNOwoVja
         O0xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxwWb1arAS8ywxqoRnBsQWzLUsOkey8ZzU52OKBSqe5E8iaaXH7Ibij9hgm9fOqjkw7hCXolqkxdVNhoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPgeDuBTgRP6LBybO9/CL/9zl1CybbVR7AYnZQlXHCt/7CpfJw
	sweSCTCeWqhtECxlSmXyP6TAa9+eTN/hbvRWfKJiiUT610XoamU6UIN+
X-Gm-Gg: AYBFou0hVVLYUjYs/fyJCoXOnhQv8jNsU7hioqirSPF+jylX7H4phCYIHOq064MjFx9
	A+xYMKdZVhRZ59tBrbmus0fsYL+G4voZ9J0i3bvxogXgypYWGvAyRPwkTIrnUvteQzMg9RKYn2r
	XvH/h2Lfv2htK1PdSq6wCh+te3dHq6uyNVn0my6tsbi373IFAjeLoaVr8Qd+vv0lm5sDvwcDtlC
	llL1UiglZmRPBLjfhKO0klNY5OFyTbfg83340xmuY4aFgVyigbpRtsfeXuQ/7Ic6YBnSEUi4j4d
	K8GfkP0Dm8Om3F131V40HvleqnDXh8+qvhJP3LDdcXvzQYVm+ABbFRd+f9dLnKvcJlbritAYasx
	/49cIap1iLI588UrRbAyJWmcrGUGO/OhrigijAzOrM7LnET3wMd3Tk7h2z1aRF56iKA8ccEqE/y
	SpHk7y4zwkVdZcnZW/Vf6ryc+fVJB/fMiK544UVc2AXF+h1+bwJ6TIeI83+JahhtTpYMIT2SlaJ
	eGzK3oCDA6gTcmNj8yJGDpWG+6G+UZo/AbQu5m6+WDaHCmd2ftYxX+fXrb2NaPBO8PhoG0K+BnU
	7NB+fhObDQQgthLTw3Nk
X-Received: by 2002:a17:907:9688:b0:c25:b620:d676 with SMTP id a640c23a62f3a-c2e23ca521emr232682966b.15.1790803428047;
        Wed, 30 Sep 2026 14:23:48 -0700 (PDT)
Received: from localhost.localdomain (83-233-221-82.cust.bredband2.com. [83.233.221.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31e053e0sm59849566b.74.2026.09.30.14.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:23:47 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	George Moussalem <george.moussalem@outlook.com>,
	Ziyang Huang <hzyitc@outlook.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: phy: qcom: at803x: Apply IPQ5018 analog settings at probe
Date: Wed, 30 Sep 2026 23:23:35 +0200
Message-ID: <20260930212335.1565-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <f8e1f642-8250-4c1f-be1c-713a0026282e@lunn.ch>
References: <20260928220717.939-1-yongzhao.derek@gmail.com> <20260928220717.939-3-yongzhao.derek@gmail.com> <f8e1f642-8250-4c1f-be1c-713a0026282e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrew,=0D
=0D
> Patch 0/X should contain the big picture, and there is no need to=0D
> repeat it in the individual patches.=0D
=0D
Agreed. In the next revision, the commit messages only describe the=0D
problem and the change; the investigation and shared test results are=0D
in the cover letter. The code is unchanged from v2.=0D
=0D
Thanks,=0D
Yongzhao Chen=0D
