Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE60477991
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798916; cv=none; b=ornLeI8TrBXPlxL067WNVJ3yaJnYUWDbFY+0Ty9gON04ra54CG5p49kEmlVaOXHk0oD1kXLlsDZFmki9OSRYgzhf9zfzBL4cLzW2InUB1XTCCbyiMdNMFkmKDKlKpduCtw4XEa7o6O0EQY2hJL4zYZDI6KdXeRN41vA6GbIyF7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798916; c=relaxed/simple;
	bh=xtHnZSDfSXA0zSCJVaX9x5fLipug2CyvRd7L9waXZBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=diGy98VT/7YC5gDeOJ8QvTw4yZPXO8YakZoG3O8qBuwhFUqieS1pQeRZ371u2uxDxSN0D6wTsgvkFS9TpU/zgF9CiDggUb0ToG+g8RFLWpWa0gyWDWFOgUMclmkgsqdZ00+GXRPg8xxJ0MEkjNmSwdXGP4IOUymQkx5FVtTRYyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dM6djyTI; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dM6djyTI"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-872024e2b4eso512769b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798911; x=1792403711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtHnZSDfSXA0zSCJVaX9x5fLipug2CyvRd7L9waXZBg=;
        b=dM6djyTIKJumxg5kAD8dIppFOl4iMXiMudeys60d9q8CFZH8gTMNzO94E5iPh9qiwx
         +XHjaK74RIQ/hFyUUz0T1AA5hHfaMGc01hINQPOd7v/j2ODelG2f9UzWiiq/Em3CPHTX
         1uH1KqUoUhGji/ah1g9NPSq09Qymld4Jtt1gXO6RVWOPhvfSvEdk/9Nhmiet7p7wbclm
         4MPzs97WEXoTRLcTdJNTWuClfov8HvcqIj3QDAf146AidBwfFI4Kw/65BJsteyYifGBr
         XUAKRwa6kmPq1bMfgzCpzlXGFOCrvUT7PZlsqxEatmTG804gxy6NQWr+Noz2zmUXsSLD
         dpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798911; x=1792403711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtHnZSDfSXA0zSCJVaX9x5fLipug2CyvRd7L9waXZBg=;
        b=PZ59HplXzG2no5uyWurAPEFAcQV3yb7Iz3GuzF2eojmPRtlDsED8drDhIQF0DiwZNK
         1tW72OoCa3iaquKAXMpDakY8H6PYYBH4NcugB8Zs/7ze+SfIxyFIsPDrjAg56NhJkyPo
         6Y6HVhs+r0JIt6hCkNO4pfc2gbTedWyUeaFgWdz4zfHS0qlF4XbjWe4igI69fv3mOrgk
         UVyCnqfDdVTt85Dechzj+cXiE9m8Whae9QyN4zuPk7HWj6Y7weO3fiE285m/w5RW/MBu
         MLMeI65xsVN+0Vhm3WpNLa1UpA3VU5MHMbRSe9pnYqMoK6EQ+Wf7L8s0ASn4WxpuftkP
         4Bqw==
X-Forwarded-Encrypted: i=1; AKwUvByA3sirbN4kh/hxXHSvcOZPtuGlpZiLY4V05ryf1bR0v9Ahpz2dEbZgELJBLLEJXBbv2DPUoHia58bhEGw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7ag1LtE6HtPKOX2AyWazgLLns05VYf0sxHzHe/4DMcBOXv1p4
	mgGfaC/uQ5Cj4zzVB0vV8CzZRtj1UCT/+T2dq4qJZFtY+JuAVDQIqd86
X-Gm-Gg: AYBFou1itdjbDAn9+CJbPOfOLZi8Pg2uMYuxJEyLe37wDNQ8ZS2Iif2zWlkyXBkSrC9
	qgi9f8YeEG/EUeiMbYuVpl73W99ROZ0fc5P6akafx68rrpaJQI8aIwiNLZeEUeFceW0cIqVjWnA
	tskmJJVluvXMIgpnztdQTaY8TVO4yuez+Q5ZCejXd8bhTu1pv+I15dwYzCuJsyNrIAMKI2GPf2v
	MDhSSe6harTXDW2dpNwSwV4SqVaY10pb3oWj9OFpl6mdNiXzmGdJAaflJxnsFFIdd/LaV/CCihh
	ExiU1LuxivO9ztrExLXtpw7qjOVGAHf7UeVzg7qRnUgAH3VWRTanyKGHkOVIc3qpR+dLN4oyBZf
	Ie2IlmlITBLT6Tg3GfkNhe0L1oNlAqWOZS2pTAonSTMCSXKYGoKrAC7ZNtyE5B0PRcc5Vicr/l7
	zyiushK9AfLe1MnS3PKJpzrvIRhDdUSLdxiZ2KW7+zsug2Q88amNx0da5acOdTMwVstWS1iQVTK
	xS20Y7/y9alxykF4FU/rp/x6ZN2GQFxut6rnu4SvlQ=
X-Received: by 2002:a05:6a21:3296:b0:3de:b0cc:b0ed with SMTP id adf61e73a8af0-3e16bdf0facmr7208501637.18.1791798910939;
        Mon, 12 Oct 2026 02:55:10 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c42b07e4sm3573641b3a.43.2026.10.12.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:55:10 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: sashiko-bot@kernel.org
Cc: tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sahaj123.sc@gmail.com
Subject: Re: [PATCH] selftests/cgroup: test pids.events notification
Date: Mon, 12 Oct 2026 15:25:48 +0530
Message-ID: <20261012095548.3199009-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007063516.1192279-1-sahaj123.sc@gmail.com>
References: <20261007063516.1192279-1-sahaj123.sc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The signedness finding is valid. The test previously compared the signed
ssize_t result from read() with the unsigned sizeof() result before checking
for errors. V2 checks n < 0 first, then compares the nonnegative length with
sizeof(struct inotify_event). I also exercised the read-error path with fault
injection.

V2 was sent as a fresh thread and links to the original submission:
https://lore.kernel.org/r/20261007063516.1192279-1-sahaj123.sc@gmail.com
V2 Message-ID: <20261012095011.3188830-1-sahaj123.sc@gmail.com>

pw-bot: cr
