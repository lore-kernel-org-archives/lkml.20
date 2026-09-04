Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583B03A4F2C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518473; cv=none; b=cuiNsXF1gNVK/sjJBw03xIf3+btdghsCcNSDpurxEi9au+2yXy9aT+7yB8iUq6JbXfx8G5TBwXWDoLQH+flZ2F2Tx5Qjz4tlKKEQu/OuY9nrhG5Jma4orCorBnRZGDm+OcGO+4KU2xEeUCPtXHCyywJZ/mCozBkkNM+e5UR/WXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518473; c=relaxed/simple;
	bh=ttTga9zi+MXP27L+it5mmsUm4houwLSBBY/F+hKXvL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TQRVfi+8VvCSHJ/SfKfiYV9kGYOJLapFAz7uWz4okmJAJTJCJVW9KvtUjvdoMSNLcQrkGLZ5duzSdh3sHWD9HPdvPgG0/8cr9yjLcl0fDXQgD6/vD/mjYymdlvFwG9ZktOZvHSyGpc13w3NcERfKFCUZ6NNf3HnEjVm4CjplrvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKKAmIOp; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKKAmIOp"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b132a5009eso658711eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518471; x=1789123271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=016ob45JWFW9n0q2Hnw2HATnyW0C246HNQzTFfFfgjY=;
        b=cKKAmIOpoGZMvCNe8LWhifjOS2rHiSkS9w5wSo5jiyG8vXIm3mLzIheNqEXcjg0I69
         tl7Dv+XzcJ7EynLHJeZq/fIDujMqGt1jyC9Ty7AtRRl7x63SzecIJ3a/ypmmFI4p89fi
         9nEdJyKsniYvr4jGKk+mOX1G6AMe+jIfgPSzJKlwsaAmMn+EBW74s2UiZ5NHiuDkPkk1
         XLko82RElnb79Dk7zQmN8gds2+KKz6oRLXPn75U5FcDWHMshGTbrXFnjtk0TT4IeXZzA
         jXrElOiCFzgLPm1KUsmwpBWCBOMNbRoiWBodZWBl82tIBN7WHDYoVJoI0Odc0vU2tvRx
         cdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518471; x=1789123271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=016ob45JWFW9n0q2Hnw2HATnyW0C246HNQzTFfFfgjY=;
        b=YKS8lvBL8al3rxK5HkPFWJTU5VMAakbfiatMZ68ozS2T7O6QbULIz4gJxXx6/GUdBF
         gHbYqqYm6Ip8Ia5T/2oXkI1eFbphjw1+TvPvUluq8a4IYykbHs0GCn09cHjLU/ZTy6dP
         HSATZp8i9DQy3Hq8m2b6tq++nbYUpIM1NsXBs77HcGNGeB/N4pOlzyIkQ9oUyJokpK/N
         BabDK6Wx7xmV+eHpRIZu2tpy4Kd58G72XGIstiqC+MnKAOyGxg/5Omcmh5XwJaQRHVmO
         00FUPuclBPtYSfT4+uGZrU8atKIkQ2m7u3ull8VDwCpdoLku9TDJFCywl2rGaeWEOd3F
         KlBg==
X-Gm-Message-State: AFuF++kniCenI8y4VHpIEoKD5NcaYL+bgUTfZz8hTm6X5NwIIIjwKbZW
	gXp8TvEuSqNRWQn1GAXpGdBJ1P2MlW1icYGyUB9NDHQPPwrrcBR1XDP1ywKJHQ4EIIM=
X-Gm-Gg: AYBFou2A3Aq87dMGU5oT67Lt64MY/9E/Y9rYxqTIfAftvD5nEcPbpurEYceO6QefvGj
	BFCNVE9tiPd213xOaynlIp6nWR5H/CySoPqlDkm3pbtpLh/JHH0qgWdxggUK9bPDE7AL9Rzsf1o
	nv6GwV2C7Z26IT/s37r3+688iFsL9s7WE1/FimZqyyI85lnr5s7VspKvDjDvxfDIZylo4XWUCVj
	wYRvixv3khyn9uiuGys0s/jEK3xXRjuVm7kGUPVKpPMiotfcAzo8Dr6lI/VJwGt68eAMlQ6u5ve
	6vHYy/IVGcrFMW1La6sgtzqFhEQJJouW+HWQqiP+aTGWtD1QNH3MDygaKkM8cJLUEFvYf0kMQ8B
	TMfyHb8wTpqejtsJA513V8BAutsbG29twhNim5u00ZsSlDfoCRx6XvVU/+8tXhmR88spEofJTMi
	GXnMk+CqZryZVwMZBjDyGMtHjsNaZDXH3ZS4yTJS8LEHlrCFcPREvAXw8+qyAJCRC77tQ9yYJyB
	xUDJjTEZ2toBNs=
X-Received: by 2002:a05:6820:8109:b0:6b7:46fa:1698 with SMTP id 006d021491bc7-6b746fa1a1cmr1758553eaf.45.1788518470860;
        Fri, 04 Sep 2026 03:41:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm5319267c88.3.2026.09.04.03.41.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:41:10 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mdio-mux: fix typos in comments
Date: Fri,  4 Sep 2026 16:11:03 +0530
Message-ID: <20260904104107.12832-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings in comments.  Each is a separate patch so
that any one of them can be dropped without touching the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  mdio-mux: fix typo "framwork" in comment
  mii: fix typo "asymetric" in comment

 include/linux/mdio-mux.h | 2 +-
 include/uapi/linux/mii.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.48.1

