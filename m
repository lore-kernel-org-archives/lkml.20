Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792892845;
	b=iPY5hxMjU7EQRnGiJ4vK2lgvgsmzUjkqU4xlyyN+GdOGd0TgV3kMg+Xpw9FFgN84n6PM
	 cWaR5Z6q+E/43DEER/gixJRPEqLOuZq7DGD9beh/I54l73OUjE3R/SJPCRQlmFR3rTffl
	 Rcbm2dZ2G5LNKJo56yW1Uo2PYnMc/tkvcyLo7CMSjyWxf4PrtjnwNwaMfO/9rVIBz1+Vy
	 cKTALikUNX3LJ4hLtN4yGicShNsk7IihIkA+29QHKWC6QjfaGINVyzwbviDtZTsZrSqnI
	 7pl+XWZWCl1Gu8QIXIbByqMX4TBJOFQyLdR2kl0FU07UdekvGqVCYIlGcY5+pzhaQPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792892845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IQf90Fr1RalRueEZp8ReRjoKdVflHnZWV+h6rhgdLt0=;
	b=zXkQasHMXU7fxX2yV5mHZ+QQMqiAEisFha4dKoG5pnh0HithCxHrrccH/LyOHo0AdUs+
	 R6dAZ1hCfaxMTumjM9H2Mcp6vjTjdQqpjXWGUL9kd2Fy7MzzKqimfKO0ucwDjz/483XaZ
	 ptfRwJKQjK6gmnUenvOcXmPOwXZJk4MrxLIZnXdipdNl3eyuNgk9dl8pwbyDXt/nboJNA
	 VWDM4CTb0/+i/nTiCQbPw2qGVVIzpk1pHbLNJrnnygb7JJ/0z51r6ew1PV7wMku4L4vyo
	 rSdY0MGgybc1irXK2UNTFPSivmMeXw/tOv6xr+j2Co7R5QSJsfTHpZ+LGBxuZa6r3Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=o2UWtj12;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0DB606A323
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF0DB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=o2UWtj12
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14fd9dafb0dso1550197c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792892844; x=1793497644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQf90Fr1RalRueEZp8ReRjoKdVflHnZWV+h6rhgdLt0=;
        b=o2UWtj1296BSHQ/u/6Ehf7EmeG+tCGM9noKdhbkd1+gqIxX5ZCzGJc2/vZObhDCNWS
         iCzFnC8RaSYazTwUjDjTT7yV6neSMC8ZffOk86YWle/3DEePiazSKSGC8LaR/tU/xbn3
         q4wirtVEhraNnHrW4NL8tXb1AlR0SPyi/P49NiHq+mPe4Of0gW0UvR6wLwFC+x3dPPBw
         YhKY5gjrScIVF9yzrvzcLHRN9US7WODXvKStReQ/FJ5NGanEMdqOf8IpMrKpW+ySI+qg
         A1Xi/0DTUQtFivHXdx70LPoUT2KADDlXuVYfiaN8BUX1Fy/ALxZ+UzChGq7ktVsSRQKu
         aSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792892844; x=1793497644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQf90Fr1RalRueEZp8ReRjoKdVflHnZWV+h6rhgdLt0=;
        b=UdeQZbK1+bUKEhWwl0gCVBRpGjRjy0feTCUPzc6i4WnQhhm1UQ/Desq4ZZkaRfGoi6
         Fpyn3LgDzI4e14Ixufy+zOjCbnr1LnRKRh/zHMZm/tNRSDokihAvrdcUHMx3+VBvwymz
         lH+MI/Ec14GmJBZiBVJj+Gi+/X4+NxYvsg5uUp/qMoxGFeZLJRatl6tD1L/KROx+fBEQ
         rb0wwX6EOKk7JZYqVagDrtdo/TOdBrX47gTboKGMu9/TYtCf9ETljPQ3Yatc7lE2xvXJ
         g/hqmEYdbkJgPhah7dVq4vkndT6aBmQahgzh2VqBevgqKyOCAeC1l+J9WlIbpE1LuCWC
         FGqw==
X-Forwarded-Encrypted: i=1; AKwUvBxyn436MwRuik/9/nw47t+JGAK4KwGHNHthPWcEhnB6F+LO2UAFcrE5oDHxHap1+FH6WWk25WGZNWFquMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFt7cCtfVItNtHxd5gvrytGttlxglUc1QqmSP+XAIEeAwpRNHV
	grnw2SLE+fFupEhpG9pWdPUZwsjUWHhosGqpBjC+PAKVqx/UaotFjKyq6ngE4j/Y75M=
X-Gm-Gg: AYBFou1OkpIUpQH+A8fLSj5CYiuzpfaOm77MknQ9/FjQW7KF+xWBocSoZb2tyGCaxbT
	lrc2qNjFhiIZ5Db4nAbiCMFijHK14pFywhhtVOy3wGLk0sANmN8GVyWBwT9iFBNwsssYYW1Dp4m
	RV1r6WDoGYwDoQM78WLWKgMWXcs0Tp4TKdqLldFHYy1k/P0OOnyGY4/Tjr8juk6e6Fc2Kp4qC+/
	T4EoJ0gy5Ma4ub3X7TcJzmAc81cQtUCeUFfWOwA1Z93iWAmAEhFb0GBr/wsjFye1NpCBrsZAcVt
	aIqJmr7t03Nnt2yIk+2lT8UfFfM2U2ZPn1g8O+Bxy/de+lUTuOXENTNO7HXGmtcrIB5fnKZLqBr
	1ZY3aCTY3/Jg+mBizIBBB+KefaUIS/V25gIn5a/wbLRhth9l76s/3DfuFSMYSYVZHG4quBInq96
	eA8xPd5snlmPLa7tVjkTiMv6rzZX9y+OqoeN0HMPsLeHpWiiQ6jpkg8iUxVAXwbEE0fTOpsQ02c
	tdFojg8JT6qFC9bPvU1PnMLi7ZK6PlM/XedU80QA4/0T8h2B2WZKB3Ar/+oKicRzKyoBEUDLaNg
	S1hwtwvBZeMkDKxwBDI9D0A/nI2Lc/lYJ1+cVN+nih0fJigFKqVOZx9w1KI1q0hSLA==
X-Received: by 2002:a05:7022:3f01:b0:19d:255d:1767 with SMTP id a92af1059eb24-19d255d1787mr1959370c88.20.1792892843907;
        Sat, 24 Oct 2026 18:47:23 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:dba3:be57:a674:a67f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm10149517c88.19.2026.10.24.18.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 18:47:23 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v4 2/2] RDMA/srpt: widen the indirect RDMA context counters
Date: Sun, 25 Oct 2026 10:47:17 +0900
Message-ID: <20261025014717.3756503-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <75465b8f-1109-4a83-84ab-f4b464f187e3@acm.org>
References: <20261024162852.3528224-1-yhlee@isslab.korea.ac.kr> <20261024162852.3528224-3-yhlee@isslab.korea.ac.kr> <75465b8f-1109-4a83-84ab-f4b464f187e3@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. I carried your Reviewed-by into 3/3 of v5.

v5: https://lore.kernel.org/linux-rdma/20261025013748.3755639-1-yhlee@isslab.korea.ac.kr

Thanks,
Yehyeong
