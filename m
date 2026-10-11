Received: from mail-ed2-f9.google.com (mail-ed2-f9.google.com [74.125.228.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638F433CEB0
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791735459; cv=none; b=OdWaiCaTbocO5lUwWJXd9io6P4rBFhjBLcsaiEIXynVeTCStuEMpQB35f22SNQMSYBp/OXfDrOtd6lVgBZ/DDVAIzUhkZmp+ehVTw2wB+Q3ulBk5XfO7/1nWtSKhyhvOw0ZfTUe5xsBli8YXvxMbZwY6rLJR5USgNyqcyU9ibeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791735459; c=relaxed/simple;
	bh=FZJWwERuJMGXxgfYc6WlmmI8oHDZeiRfC+lXTHDo5OU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSxwo8aj4wWI2EKtYsXZ9JUaqumtamwBOIM8ow1H7CIdBS2+/OSVwon85mX/A92A8uvhzGFGOhP9q1wprFyfHow+gjDyd+Qfn3mX27j9Y+3BZoLBtZx6u+DusilnqHzXt37N7HNh9L1LyJ7Bhd6vw9mcPsgiDS5BkrCmzYgjDm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6vXkPoM; arc=none smtp.client-ip=74.125.228.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6vXkPoM"
Received: by mail-ed2-f9.google.com with SMTP id 4fb4d7f45d1cf-6acedfbfbdaso794993a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791735456; x=1792340256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZJWwERuJMGXxgfYc6WlmmI8oHDZeiRfC+lXTHDo5OU=;
        b=K6vXkPoM/MFX1W79Gey/wIn+jbAIldZBYv4zJCkmDV3szWb8h4VeBMKTpDJ9GZaSA+
         YR7INRPdpvgNToHxm6sSV6/ZugE4tEm7UcRve3oOP4/UbXPYm6Uy8fX9MrioM7TOLES4
         EdnNQiMGgynAzRxyw/evry0xnIDy9YgdzVoAU0UlfZ/eZ0y2xpIpQvyjJe924p18JEio
         4m4q/QuF0Nww9AKtXZU2dDdarM7XUaZnyyVKrUQqr2AagQ9f08j7hj5JpZZK7yBX4frO
         xb8cXqIodjgFAFqVTg7RuCAwKrmPhOXWfXKyVwexkexL0KhqgFRlUcFWzHRngjdzORKR
         TGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791735456; x=1792340256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZJWwERuJMGXxgfYc6WlmmI8oHDZeiRfC+lXTHDo5OU=;
        b=q5nFbCvS8s9D2pNu5KRir2SwJIVOa9T4NStCm3wGhTEfiOOg3PphhpR+3fxyfzei92
         /7HRP4FeLkcTm8LEeYTdz0bZDcatX7bAimRdEYuZJ5dWkS3NkshnhM8pBUqjyqLyyJls
         VWXNKyIQxlCTpuMRgEMv1vf5IZl5AUNxmPXB85h95SD1jNLg9W79VVDo4bkazvNiGFnM
         Q8Qo32p9izFZSMI3e9eENGVSKHSGl4eLY6db6qtyAFVybeqZAjELpxEiZNeh9kqjKZ6U
         4DqIf2wsVwbOb8/tLtgJmbt/2ZNHwjxmLyluwy9wDOJRBtRNWD9cGUVAIAVub/rjCjCb
         /5Zg==
X-Forwarded-Encrypted: i=1; AKwUvBxPgCUGPh/ESsWCGsMeQCCN6mQ+lywmYgNoBl92HE5Juz4Hx9TOpaOFk33D6qyk97L2uHpVR6f/fKrmVyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUARrXJApil8+jID7zlV52DuXLzTdvxfgoaLyRwOL2DL1JdBL7
	R2HWCe+LlE0hu5IKFJeipqP46Hpa2atqWPKOaZK/aWwh47txy3Xgyk33
X-Gm-Gg: AYBFou1PvYOGUTr5CusM3RKzj0+gncMxtpZ8iQWoCUSlV3jJQWRHDOWxY7psUxbi/IZ
	D5vHgjj47tEktJlunVIAgYDNaOkuZRy5icbAgJjM/d8Uj9smJl3QqvnIK7lczVFvOp/XCHaSKeP
	Fo4NrN2Tla5BGViPUYvXI3cy3iRFqndWK+VJPQ+3LwKFsvYbZuHiCkU6T4oNOYcXSj4/Ow4ENtN
	DuB+eT6SCrRHIgbN4T24B7m2lOnNWiXZUNqUhEu/+upu1f02KsLY5DD33qxkxWg9VclbZjLAN2n
	qQVLuXbIUBVPv4PF8+RI5R23ECOOYfMuF9QnHAhzKDMSx8M9RTQXwSwpsK6FOzxiCydgrDal1t4
	8wRZc6wWbnrEG1iVlBtmDgZBtLmqsUtbzrRVWJth9ro+ZaU12QhAzDcbkcseb/g/e4LUhK5Jv2Z
	597vNj7t/503kb+2NOQzUiTcTC93bA71ah20s6IRXy24/zqOdqukBD5hmWg094hfU0LyViM8rnL
	9IHO1uMl//NQq3UA//G8jMl2Nhdbl01Lf4WH4RXhQLRkAwUGw==
X-Received: by 2002:a17:907:c19:b0:c26:19de:9ae1 with SMTP id a640c23a62f3a-c31a9f92fafmr746232366b.32.1791735456445;
        Sun, 11 Oct 2026 09:17:36 -0700 (PDT)
Received: from localhost.localdomain (host-188-122-3-146.finemedia.com.pl. [188.122.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bcbsm372905566b.38.2026.10.11.09.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:17:36 -0700 (PDT)
From: illofspeed <illofspeed@gmail.com>
To: dlemoal@kernel.org
Cc: dm-devel@lists.linux.dev,
	agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dm zoned: keep polling for idle reclaim after a reclaim pass
Date: Sun, 11 Oct 2026 18:17:35 +0200
Message-ID: <20261011161735.414-1-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <bfbbb428-5a4e-4b61-8fe0-fd0c6c506c64@kernel.org>
References: <bfbbb428-5a4e-4b61-8fe0-fd0c6c506c64@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Damien Le Moal wrote:
> Patch looks OK to me, but same comment as patch 1 about your SoB name. Please
> confirm.

Same answer as for 1/3: illofspeed is the name I use for all my public
work. If a legal name is required, I will resend.

(Resent as plain text: my first reply had an HTML part and did not reach
the lists.)

illofspeed
