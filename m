Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC9D1FF1DA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791944394; cv=none; b=ntO8/JjV96Z1eKwTKfS54x8OehzBZ6d5y4XM9svqtvcqy/RJ/uEATALZWya0+x96V0R3TMKkDHlc/pBzvVSSMtXvU6XLjGSKC5OiTsLMDTNTLj5IAGzzOJGLYBYjPSCJFEk8MQE8Rg0Al6S7JSQbgSMkaRdTpfDpATFXGleOMQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791944394; c=relaxed/simple;
	bh=8pqy1oMnA2IatGFDWtUZXA1HErxM5AAlotEenJvAgOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=te4uTE55YqfDTYEV50JmKYPIgOWiBTAyJyoq+Oex43NBeHHyAIoiQ4FM9+jDm/p+rRujahttaAaWcbglxm/QNdrpvqguTkDvtmXT0iP/kJjgvOQQWNHVcq9VG4fwxjSVsohnE45W+JiGMnwaXfOezr+GXG3scqGvjn20twzLbUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=CNm4TTdi; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="CNm4TTdi"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so322283a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791944393; x=1792549193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dU08fQsiwmOWxma5Ng7cjNhVY585iQcW31VdocSDwx8=;
        b=CNm4TTdib8ugggzjdkOUa8lS+AxeMxql2xxCXkEu+ptgonlqku2kVUKnS27tpFnjOe
         LZi1RDMeCV8TK5tjblbazaQ/Lz94k4ImwO72cx5dMwphwyLYI1zNrea7hhs53xzqX5iq
         Yj6BvarwUhwW0xJ2W9BNahgxf5TUQzhBnF8BrSeIkVxZiePvbCKB9YuAnnbB5q+Srr6X
         0hsOkAfz52BzA5Q7SW55xlYytu9VffGOLWSVJCuYQi5bX3/0ww2vxmtfVMdFICIPlBi8
         usQ5wpAXJvyRbXyKW1k3GF9uQVOvCfjgOOdWhxoPwlVJcVAUWPEZ2ONEFIhVEoSL0knn
         3I9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791944393; x=1792549193;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dU08fQsiwmOWxma5Ng7cjNhVY585iQcW31VdocSDwx8=;
        b=rz7refjb0li4YDHm59VxwcSrrMYjKZOIbcVG4x/1tcGX4sbkfPn9oY1uYEgSOIvWEZ
         f3WaUTFiEfWmi+nNqjU3L9UXkLCQcd0KduTDhkMb9XBovdDaBNprJSca/UZsIPaZs2rs
         2uipkNrZmgDC6XcWTbDcLO/H+y/akiedPj1mPkVr6/7dVUdvKrl7r+0wYd8zK99P+GDz
         6iSH51jC7Nby53tbxsnp3tJDezE4Y0MR2y40DfuewTRHFuLm0X4GG/wpIb0yB2IRGXgF
         s6NlWDkg0wjVttC/xUqbO9N7XR/9NQohPBAOrEesPCz7qDVPy9WRx2CTPe0aUzhrUL/o
         CJcA==
X-Forwarded-Encrypted: i=1; AKwUvBwDQke+9XChtJTFLsbP1fYrC5a2igxOvVkEWcT6L5lfBO0n+4m7z4DVzxNPcL8/5LK4Oi1diaO8E3jyfSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCzVGgHy4DcWHU2n7ZRnTmndEvDyaswgsMmE7d4DED2vo7yZCZ
	s7wP+VdK9y/orZCAH3Idf1vNmjmnLE89owZpwpwsbqUsLXnPU3X5M7yNKUJVVpbFwQc=
X-Gm-Gg: AYBFou2P5tVQFY1wqjF80qktp2QyE764wrp3jMjsTDN9ruDJLA9pE4kG6k+3zP8h1RT
	MYtStItLCsJ2jeGOzh/oGWJak/lNxzkPdSKQRFKD9vNNuFmWo3U5dOzh+rWzQEi/4lsSLobWmFY
	dEfEeqChgGsIQWGP9l5he5QEer7wlXEEpb1MQiXprAC/mFbNH1WnxKp8Bu0Dj7GeHnjnAwuDWzy
	eSL2WIhk2b4Sb+yM4NRm2MAshcWOOkbo1NJVQWV/l6X9Js0V9wkESmUYVrGgX2RRr5lNpc4UgPJ
	7HofDV5XaL9P7OM4ZcNR2IPsdIFOjIFu2b2uE1l5zkI3O8wVsBawANuj94vUDjUJaZKimubxz/Q
	03JzcHSvF1UTIhz0wyVkDBLDcE0qtYRLcKBHDBhHMkD/dCoiG8a3blmGOMRoO4TbvQnVsmGcJQ/
	Yx18p5iuS7pT2XzDLLcaOE9lOuDI+aqt8QOWJKCY89G5XpODlYwDfg6yPs3c7o/CffLQHBCAk/+
	DymSaC2R0SlecOJzFC1
X-Received: by 2002:a17:90b:224c:b0:3a8:bbc2:5551 with SMTP id 98e67ed59e1d1-3ab3a0f0a1dmr14151443a91.0.1791944392675;
        Tue, 13 Oct 2026 19:19:52 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f05083fsm2254652a91.1.2026.10.13.19.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:19:51 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-bot@kernel.org,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v2] scsi: mvumi: reject handshake sizes that overflow the list allocations
Date: Wed, 14 Oct 2026 11:19:44 +0900
Message-ID: <20261014021944.3486511-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-170674@kernel.org>
References: <20261014011808.3479480-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-170674@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks -- v3 addresses the reset path; the find_first_bit() point is below.

- host reset: v3 rejects a reset handshake that reports sizes larger than the
  ones the buffers were allocated for.  mvumi_init_data() does not reallocate
  on reset, so mvumi_hs_process_page() now compares the new sizes against the
  current ones when MVUMI_FW_ALLOC is set and fails the handshake if any grew.
  The shift, list-depth and list_num_io checks already live in that function,
  so they applied on the reset path in v2 as well.
- find_first_bit(): this is in mvumi_hs_build_page(), which this patch does
  not change.  The 8-byte read on a 64-bit build covers list_num_io and the
  adjacent ib_max_size, both members of struct mvumi_hba, so it is a read of a
  neighbouring field rather than an out-of-bounds access.  It is pre-existing,
  and the only input that makes find_first_bit() scan past list_num_io's own
  bits -- list_num_io == 0 -- is rejected by the check this patch adds.
