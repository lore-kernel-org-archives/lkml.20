Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284F5391838
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853511; cv=none; b=RESuToNrngM4sxl5PLUv9D82qBfdwuyiR7Mxbgh+gWU5lslc4i2zMRHHXcNrlyT9DsfmIOzvvjDx5aPMPTKWydIuXJM3pjd4w+N5ARQMXJwRP63guSnLgkBQ2vnXcdHjmvgmCKUlU+7lCcd5/ySQnpgwmqmczD+xqBYSrBLNiFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853511; c=relaxed/simple;
	bh=lc9zj8acVJzB2Zqg5NYLr7ldjKhGUblQwyVTN5qJy9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeoAqISjayPdzG+GvGADEkhbB9ljh+i2UzsgbmfKQekcHQSLz/rnJ5SLxXqb/EJJDJ6PHp+u2H5aZJZ3tzisGVXLpgsilaTNr8dwiqF5+YJb/YcOyCcdyKU4YJRKGDJD520knqJs+Q7+ooU6BwMgGID3z4WjWNR8ubAmxboOKfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=iyp5Xkjr; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="iyp5Xkjr"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-887fb6c0ad1so569834b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791853509; x=1792458309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rogv8gP1H52CoBczHw69sKFPcqTXLhNajNS7Lu6i04U=;
        b=iyp5Xkjr9/0PVvrnELxm+jrh8SzISYCJ69A1ly05gNkK3pXL0T0xoORr9VYECpqpTW
         f2WtBk5CmHPfbAX0dudG0oqruztFRPqId0QWzeOCSxbheDIaCKI80kqg63YjshMViGI/
         Rmhfxkq/+Xx8z0Bwq25iJz/8oqTBB6EU1REYzkJWIWksbGOFDSCBOXG+SFrykXPELUmQ
         eJzoPLeoYbrSruTmyUkDnjcLtO7yng2h6earm/uMi2j6DgOOPa/odfms4nAqAaAKH8iw
         N30SuUFdvCGc1jBiZTboRjPtCJynnmIYbePS5Ie7Qqhh1+jTZcTXA91b5xi7RrMuCVX1
         I0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853509; x=1792458309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rogv8gP1H52CoBczHw69sKFPcqTXLhNajNS7Lu6i04U=;
        b=aUIfqTMjnSVXWHUOR+hYVPyLhXZEgZQabNChv5T5VkBM7iTLrCjitjyHUCoPCQejtj
         oeZifixygcSmHYCoyWT007OuwtXRG0yWM8TQLhkEAhCFGi2aHZDqtwhRn8vjj7SYPQWT
         kvMejfRqW0H6CecEwsY47QGhzU6AYJsEHePtE+z8vPk7zc00KI5ecnuyxnMpkBwY5mNY
         K2L10T5PXmsktC9XqYiPIx6BG4SnAZb8go4aICxx3CQXNSVcGlFn2vTw8FUtuiwTWsg4
         ulQHD8VMyHN9BwKfXAuVevgJg0p9iBDoY65xGxEq5/qV1dD7RpXh0hNULGx16OnFshQn
         jBKA==
X-Forwarded-Encrypted: i=1; AKwUvBy3MJfgUAgSEidPO8WSTaURbYfp18Ecdvym0exTf+m2vgBOuVTi3GdcNiF8luQ6RVkvc1V+cSIKLkoWnE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYId3zOIJbuxgFzj19GsUpeHTbpZjzfuoeKbWeedw3ktEMfG1NXf
	5f7cKJgOf941TaEYkjgHBhYQSkR2ceIvHhtA4A25vIEj/ePXihzJi7Iff1LMEWl5JJ8=
X-Gm-Gg: AYBFou0D5crs7K80H+wjz21DrNyBnWcs5RUQgi+Z2x5gpdl3MhheJ8nbd9gL7Z6tezG
	OMYlZF7b8Jm0fOj9aT5hLEJg1iynhBaqCGKAyPJlIGHbhGmeM/wBzhaY/bvJODYZTqNHTkzjgQc
	A7ktK+4YX0gle1hINd262avMy6MPT7WnPChdVolxQ57/EmIHec6MfjSFCQVQ8NxvNQy2CNd6qQN
	GOUZ02BAdiyPZ27paYfbYnL3rC+EFqsKK58Xjjq65frh8qXKfLj4SXXQ6sNdNZfjUM1DZ6xQsTo
	CziGCAtxDnDISdTlO+MwdUKiLewMlQtJBqj3Cwapgflq/4dI7otVcfwrIsBm8U+a/sCDCcSlibi
	dHZGpM9cF9zT5Sz+LI0DsgEo+sGtv1UsKIwxLZPI5v9TB/36Wp2EEkYFH09SFdRsl87wKdtIzJF
	LhFyWWauhTI57mAQJeeBpfafCioRTOZ6fZkTZEeb5B8TKKEBKfblfL9NZzDAZ7djG9KnjbJmdeN
	SM9Kw==
X-Received: by 2002:a05:6a00:4185:b0:890:a3ed:8a49 with SMTP id d2e1a72fcca58-897c7cd481emr9345777b3a.51.1791853509580;
        Mon, 12 Oct 2026 18:05:09 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3107194sm4387216b3a.18.2026.10.12.18.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:05:09 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Tue, 13 Oct 2026 10:04:54 +0900
Message-ID: <20261013010454.2472267-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168374@kernel.org>
References: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-168374@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks - both are addressed in v2.

Deadlock: you are right, the failure path reached bot_send_bad_status() with
cmd->data_len still at the full declared length, so it queued an OUT drain for
data the host had already stopped sending.  v2 clears cmd->data_len on this
path - the OUT data phase is over, so the status phase sends the CSW instead
of draining.  I confirmed the drain is no longer queued: ep_out stays idle and
only the CSW goes out on ep_in.

Log: v2 uses dev_err_ratelimited() for that message.

For what it is worth, the same bot_send_bad_status() drain is reachable
without this patch by any BOT WRITE that completes its data phase and then
fails in the backend; the failure branch lacks the moved_data guard the
good-status branch has.  That is a separate pre-existing issue, left alone
here.

v2: https://lore.kernel.org/linux-usb/20261013005854.2470384-1-yhlee@isslab.korea.ac.kr/

Thanks,
Yehyeong
