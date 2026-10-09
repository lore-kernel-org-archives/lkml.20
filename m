Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FC94F55BB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569430; cv=none; b=nCljHeXEN7Qdl06ZeMgzIVgMl0Kh9P/uvW3xc1D8CcyqrrsMOYa9luJXka5kPRaw+s/ePrbF4BzPmp0Pnu0FAsm2z6kZNkhjjE32E8te+Os3OK3Vfe0CIRQsbR3naaFE2l0nuaOkCv2wxO2MxcSmZw29eUjBsPJGHkzD0ZlTZH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569430; c=relaxed/simple;
	bh=GfZpP3M5gKhIEQJYBdJIZp3YUxu6XgPHH7oePre3buA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C607N2+QfjI8oWnMzYRl3LcWfbc4BeR6eoe5G6wfJKi+LjC1ubj8PqP52v3f9/QYbtIUbsz/Jv0cmxembmZrw8YoQ+IXnWToNb6gqbFtPQlbCbUTvDygTMv7MzbAS9nmW0T9BvZfAEbDKDF+s5WgrD6GdQJf7iZgeclpTL2jl5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2fnpmEe; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2fnpmEe"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8819033dbadso2255b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791569429; x=1792174229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GGlaAhNRFFRQYK7WBXOTQ8yjOYWxFpbJrujRON5byc=;
        b=g2fnpmEeh1Mjbjg7HAnstr0BdhZt3GB7qJ32c3tX3nazptGP9uEtMlrnaLATNat/Xo
         DnEV5GZrilC1Hnp7vTAgFO3fVDgROoXuS3512ymD1IHf8EZEOFt5fRfT0fovhu8kTSWN
         IClzsODfIb+lg/rHVKc2I90syJk5ytAn8LKKn0w0aLz3B80fCnjfiOZWWpE95YrR3l4q
         8f+D2R+wSXEXhHkLepPaV7WrtR3vKQ3ys6ym93jKThyQti/I7tcEc+hf41emMQC9K3Os
         KmNbDPSXmO1+HcrEtrO+mES5niAzprsNJxBdQt0wd+/5gLy2fxjAhBT1n6l1fqyKJkEI
         WKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791569429; x=1792174229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9GGlaAhNRFFRQYK7WBXOTQ8yjOYWxFpbJrujRON5byc=;
        b=PPuKDrlG+1M7rlY/S9TE61T7IOoH9hN46+6KzEwJ+8UV6EdC1XMeJ6E7f6q5LCvnmH
         7SmeVqAbMtAooXLPamwh2YeW4Q8/pCKih4+aZTttKEPjaLFDs+VYwH35nzmYT5uEIAE6
         wSQazPAm6DRYdugD/OyJMz/dCKmHbJn1zSPstF1u+vgBrPf2ckuYVm2QbmqNm0lfLOD9
         wJ/IZSgCztf92hjEv7OMmI6CC6g5zhEbans5FbADsZrf0nYIrLUKAa6TPtHwRlfoJDTA
         elJ3c6e9fpgdHrmP/6iC/kLoAsifVuxML0Fh/i1lYV/IZNb3fV0NqkrkAYaKhhLlZRgM
         Sy+A==
X-Forwarded-Encrypted: i=1; AKwUvBxnY9B+vWqPChLVrRFUNa4zuK/gf/YqGk8hjYOPf04tl8RgiuYD1h4aQrwxRPSY9HmqjKWkxFII5dvCyXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIrXYKUKJe/hbEVgKzvJYh7bYxOzRFOYggm4aGO8jRrBYc+qt6
	hTto62uMW2T8tLg4498F+D2N2/WjWT1WMvPve90DA/YF+MV1qiBctdvw
X-Gm-Gg: AYBFou3RhCWpENOjJ67CTO1fycMnK/LrDBOX1pTYy/ZTvcezPF571c39pvUgi4UqET3
	1pPVDBBpCSvDIjk6HEvcRyqUvL0W4a7QH6ncekviU39d/LXvhqJ/ytAxm3NvCPL7zfjN/8U1M8R
	vtCUrotgoC4ck63vIpk5lm2RqAT9ANOZf3IwWHginvh5Vk48jUqaHWBvlq/JFsUdWqgsPbN49qr
	uMOJ/qHkv2Oi6meDjGh9cCJkdeo+jnFCKIdoD199f0Geuu46L29YJCte0dSxnRV0VvFo1YFUAwl
	Lka/YkQv7H/rK3cv4+zjXLrhKhVN0LIvvJQTArFhsS9D2/BfBRWTcwh90dMpBoWvNn2yPoRhRiy
	Uwc9QDCyUG3nLSc71ZxVlPYZl5XkscSMw4r2d+DGw+25aVSFtbr/rb/s32mxQw95CijeWD6Km5M
	UIohYPN3R/Dzl/jVDG4RB8YpKPcvAuXRZyEaJcmSKeJZtvLYxUe3AEwFdvTpg3Gc+66KWArKU0M
	8y2HhbI3znwUzHhoYSm5GyBAu5roqO9SrSVlPN3mv+6W51+Gt8HyB68mThgI7dwJSp8BaWsNelQ
	XWDS1j+4kbB6d//1wiSyY5/ridSp3kYAPfdYpwZXLncvC3uMYyF1iLx7qlzMR4sjNjg39kpjBIl
	cYVNzeHOYV7qLQJH9
X-Received: by 2002:a05:6a00:3022:b0:882:ace7:88e2 with SMTP id d2e1a72fcca58-897c663b884mr2446317b3a.12.1791569428896;
        Fri, 09 Oct 2026 11:10:28 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:d58d:323::50:f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c48945dcsm1491295b3a.54.2026.10.09.11.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:10:28 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Kuan-Ying Lee <kuan-ying.lee@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/gdb: Fix stack depot out-of-bounds diagnostic
Date: Sat, 10 Oct 2026 02:10:11 +0800
Message-ID: <20261009181012.2449-1-ue081723@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <CA+NtrhTQXdQRWe+pRJHyKxPPgsF7Ob5R41Xm3dAJ54OfT2_z5A@mail.gmail.com>
References: <CA+NtrhTQXdQRWe+pRJHyKxPPgsF7Ob5R41Xm3dAJ54OfT2_z5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding Andrew to Cc, as scripts/gdb patches usually go through his
tree. Sorry for leaving you off the original posting, Andrew.

The patch is here:

  https://lore.kernel.org/r/CA+NtrhTQXdQRWe+pRJHyKxPPgsF7Ob5R41Xm3dAJ54OfT2_z5A@mail.gmail.com/

Thanks,
Ting-Han
