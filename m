Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0224A20DD51
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791940718; cv=none; b=EDoZMpS5elJybpOyav/ukIiWfUGc9UOw2v0g6pW0oKjDTLTRrt8j3eKXRqeKrqdH82YKHYLJklcdwjMTN7xA+8WssaFT3e5IJN9QPjv/uQOCTtvje9BGvBGYX/dlsXXdvROQuIfy3Lmwi0etlFbjkgo/GqsX5nSxgTkR4iTjHn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791940718; c=relaxed/simple;
	bh=b+2Mv1LpDFg9goZtZ1oDMZLOr1tRhG1QhMX5Qn6Q2Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOy1aoE9T6v6X2FVqAtBXqk09THRwfNUuSfK6ULc/i3JUu4Z3sTD1X6BR10bYuwnwIHQZRTcHDnfxsrFiG0TtpcXSNrzf5rZqHwXTGKQLDhJK4sRz5VxqJ5NV4dwpe9KfazylCDAa+h+xrTo2YyV6U4duPggrv1K6v9Gw4VIDcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=Wy86SfeX; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="Wy86SfeX"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso196305a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791940716; x=1792545516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ja8EyJvuRT6hgl8HNzUWNQGXZ1QnpSq8JcxdmHiFCDc=;
        b=Wy86SfeXomgiHiyv7uM1cWpswNtwte32c+KhRk2xe44zezfebC+WmmCc3pHqMnfIdj
         6j+Me2jecZ3XWVn2e/gnWpIQmmj1GalwfMPxVavgQ78FDtp/2wPLSehIier7mL9bIjEB
         jk+ZDeTOnmWtsVXU2TgYcZk5t3vt+diw7vbTYYsbn13SuZmHP+ZtHQOdCc6ZRa/KIAHp
         jl0SLcoumQNq8RF/0bCSYmH4hPeEImKt8WKY2z0elvGae1/x7XAvzevHLfdPJlNf6V5L
         7pu6jipINhiB+6L3V6QfFSHkStVFTfFU4sRsv7oK+UyMhVSMMvE3V7K2CW27GIc48K2b
         MF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791940716; x=1792545516;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ja8EyJvuRT6hgl8HNzUWNQGXZ1QnpSq8JcxdmHiFCDc=;
        b=GTh+sJOqSFTeR/zFi8T6DmB44aTKTL6Ijz0jae5Gt5BHqryCu5EplFXWRU+yg/bVH1
         dPvnR1Y6PumCwWT95vpcWLKpUqjE0v6eDNvSJTYsf/LZRDzjb/pfURYFzN+7f04Vhohj
         DtUDQok4qf4aEHU0sUdMhY6JN1wMflXNq8Hd9vHExgXRkGYtIkjh8JQ7J3bp0pH2EE6o
         h5ybbDKw2sNDIepxhZKjlCaUJ1g6DgAb6dIHJ1RDhebesDMh6XEDnMjUiJ1a4w4J0s2L
         CY4HZJYW2PM2Caxc+ViLZAA5lqVW5/ZVlCCxK8O3tPWBqPis/sBDxOSZhq8oi9XlnLUh
         6h4g==
X-Forwarded-Encrypted: i=1; AKwUvBzUOQszBuuTA++Y1V7w3qwI9mQwna8Rmg6zLAJrCRerYCCo+80sN624AQMvLhajgnc0njMcNi7cwCt4NM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg7IV2d67hODyDeD26yPxuigHOL4YumNiumfJJT2K5TF8MYEfJ
	814BOyVSNeFk1ElAB6U9IoSml8Zh3BWQhatTlyMVcCKLLrajrH84KcswoHCtptfTCX4=
X-Gm-Gg: AYBFou0dddfGamKxV+r7aTHr2B+7vl/Yb0wsCO4ATwXSJb/ebNIzA+yJRxmytvhDmI/
	1vBY4FZWVIEpdSyQv5KMP+9JRDxptZ1Jwg9xjiI3UTDIf16oFu6zbrdrGYa+KD6Yze9m/OlDqHl
	rPvhpKEEk/w+SI8To6WQ+74iPArW1GIG0knH+w3KXR+PmIcUZW71Cwh54qL5EUSOVpd2UrlDAK0
	+EsBvEbCLmkRbQF0vDyMqU41ZCkladtwrrqSiIXnUrDUl0pH0Hgtq1I+QCD6BbAkM3JNypdteC9
	Kxyk92FwQqDVdjAbEUiuJw36zrz+gE1zGWgCM4zQ5u72YnxT7KLQOJCFnVldhLuigF4swgdAJqY
	58ONoNU9q86SHdsnhadHWlFbGh+CsZIbsEMQ9dcq7wv7XLJW3vY86deKOsqWlsQZQ8T6KMUCuDx
	JAZGqV0YSJKF7eWqkDXvcv1zHNgC6/NQ1RzZu6R4W6VBUrNwGynsfx4PFVK97DxvzAA3+o55NFz
	Eu8J/sGmLf5uIDYgQGu
X-Received: by 2002:a17:90b:3c04:b0:3a7:db88:3495 with SMTP id 98e67ed59e1d1-3ab3a93262dmr12843399a91.52.1791940715867;
        Tue, 13 Oct 2026 18:18:35 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f3db2f5sm1967806a91.1.2026.10.13.18.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 18:18:35 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-bot@kernel.org,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH] scsi: mvumi: reject handshake sizes that overflow the list allocations
Date: Wed, 14 Oct 2026 10:18:27 +0900
Message-ID: <20261014011827.3479523-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-170653@kernel.org>
References: <20261014004226.3469868-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-170653@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks -- both are addressed in v2.

- 32-bit truncation: correct.  size_t is 32 bits on 32-bit targets, so the
  products wrap and "total > UINT_MAX" can never be true there.  v2 computes
  the total in u64, which is 64-bit on every architecture.

- list_num_io vs max_io: v2 rejects a handshake list depth that is zero or
  yields more entries than max_io.  The inbound and outbound rings are
  allocated for max_io entries and the slot index wraps on list_num_io, so
  bounding list_num_io by max_io keeps the index within the rings.
