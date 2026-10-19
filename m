Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84107489FD6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394069; cv=none; b=epEMpi1iZId8YQIDfjgA7LbbClmFS/yqIiRcqTJEOYehtomxkPTxT01zyDccdbLujolqiJmEx6bPaGYMLhCt7IFxb8oiQb4eu6zdoWueIK66ijp16x9lKSgtP+MF6bevG7iqDik19Q4KDHDFbb+ImaTL98eqQKuCrWdXYTMXYmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394069; c=relaxed/simple;
	bh=SFqiFbwT5zc1Xy3gOBv6MyMahvIHAjT/LaJDsud62Wk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=anG7y0zyhk09FtY8vpILrEJbGNC2UYYve76ZIwr3ya2IdtiW36qPxhMz1hy+eiuuxyjykraFbFglBZj0kgOG7Rf4QqKgAPNf9wg0Roc7PrUE/P7R7WR+tJnrLBFgCd3sIZDwHVgPP7oknxSy6FyebY8r9Alt6DNIICl5z1EDYRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgRcbOUg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgRcbOUg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso17550965e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792394066; x=1792998866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yk1PIjZ/V5CKGQclQeGzlozEfFu9qAElw/hhv/wGbR8=;
        b=FgRcbOUgMZRV6JE1Lhh17+XiVe0jD9TmJfKMVIf3L9AqlaOLGd9UyTxYF7FRgwQ5hr
         gBhydyk+xI8xFV+z68qigklDN8D7kSA2bZ15foWrb9tf2WXFKTPIS+5mTeKFTafTdBd3
         XZQB472E4z9Ornt8zaqGQi8XdzwgS/6zS3TR6MIkF7up98+u/MIou2jMjQeE27vd5a5O
         OqoqPzw9fmsFzJPZI/VgL/G/a6L3UWjNQJ8jMRxi5ScuNTfLq3k3cT7M3MS+MMkPNQlL
         U7cMlT6FrvZpzsO5GBJrKOhXhJoHuBmuriTnI6EUJM/VHE83N9RInL2SnHgVAmcgZtJC
         VP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394066; x=1792998866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yk1PIjZ/V5CKGQclQeGzlozEfFu9qAElw/hhv/wGbR8=;
        b=NV5yOWEr48GY915if0ooaXYeAv2fnkuUM6ixRbliCHBlqbmd/NmukwQuuCOTPx61Lt
         Kdbn6Z8Ee9VcLeL7nriyH7Lu4D0GrtNVe2heR6bAJIM01oso0WrhWxhthV+ylwuMaELa
         lyimk20lS20p3uLpFIfZQg1MrvevdV1vaFwEWYZHhSOCz7oY3tQZckzDtrc9dJFVYBxV
         x2dSWdTltOKR7FIqZTZaivdgw5dBIQB6n8oD6vqsr3YNjCy6NmhjxGdG39Jqhai1xUdP
         gAWMKdN5cJnbgKGk1IDKbgL2jFYUAVmTABJGWNA7P3unckvYls9EYoL3M08BOPUpf07J
         MwNg==
X-Forwarded-Encrypted: i=1; AKwUvByYHGJ0jNRFpX4JIOhXOg8FotQnZO1NWZCtrhUtFYiV5FCVjItVB0Mjc4ACLk1FfNWsmdb52U5RyqNI9ds=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+Ln8w1mYwiYH5swCNW3CXB2Ly7P2MPK+t3FWdcV0HVrXrxPB+
	uexM6oxy/wi071TS1F6q4wS/MMF6Namwm0NFY1KjRSx401dj4B4yXFpi
X-Gm-Gg: AYBFou3vBpv2WnF9+OeG5UhInLJZhv68iKk1Vd3V6IoHkCXJjJO6fiJj/5smmFVLatI
	nAnZdrapNI3vE4tNGf6QcRBrvrM7VmVAy5GPmCNOBVIN3QonlMSaPFkq0St8t722eovZW9xIlMj
	LoUI1U0Rhh248xt6gVA+r8j5RbXIK1ZbPFBbo9GTKCXeHT+3ZoPX2zkpGk4agYOzgjTa0HvE1pc
	pPmH5zQvTwtWpPhiLupPwugIy8/T6G3cw49qGW0Juw4irwKVJJf3vRX6FQ8IFK/9ZGBJN5pp2Db
	La5ikM1gsoLzb2WuzV61TlV4xtmbi3J4POVojmX7uPo64VNL5NA3oBsMZ+ZwxwTW7bKiEqv+Dbz
	eT38muh2H61C6qMHd/Y+Q+yvGL39e3Z8d7ToA4/9st6rfM1zGm9UPVJi5YV0QL9+nnvTRUXl/7T
	P7wpw025CLK9DqxyWw/3URJDPsgkHBIPOPKlQ+dBWm4h5Bsw8c3OV1sigzT2JngqKiasGOyvuf+
	OLIzVyQvYJF9dp2iP36GJ7PuWl8pr3yOUBbq/D9ue9ZtAMnV9QK0Kt8Vdvg78DeRdhlRZZpqbIM
	b12EZbmcjsPlWqFgODpPwtXww9Msr+JJ79SBLSV2qCRJnpY4wh0ZMCxVmzVWGYl2W7tGthNLJsW
	A
X-Received: by 2002:a05:600c:4f95:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a1d75e3c9amr148966095e9.9.1792394065279;
        Mon, 19 Oct 2026 00:14:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4e0-4601-c43a-536a-04a3-af7d.310.pool.telefonica.de. [2a02:3100:a4e0:4601:c43a:536a:4a3:af7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm21559338f8f.2.2026.10.19.00.14.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 00:14:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomasz Stanislawski <t.stanislaws@samsung.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 3/4] media: uvcvideo: synchronize imported DMA-BUFs for CPU access
Date: Mon, 19 Oct 2026 09:14:10 +0200
Message-Id: <bd42fc312d9a046a9dc943bfbdd3e2b3612f8c78.1792392288.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792392288.git.kmehltretter@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvcvideo writes USB payloads into imported DMA-BUFs with the CPU without
cache synchronization, leaving physical RAM stale.

Set uses_cpu_access to bracket the driver's CPU access.

On a Pi 400, 12 eight-frame captures each had stale data before this
change. All 96 frames matched RAM with it.

Fixes: ccc4c539c05f ("[media] v4l: uvc: add support for DMABUF importing")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/media/usb/uvc/uvc_queue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f442fb..1f92ee96e0710 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -247,6 +247,7 @@ int uvc_queue_init(struct uvc_streaming *stream, struct uvc_video_queue *queue,
 	queue->queue.drv_priv = queue;
 	queue->queue.buf_struct_size = sizeof(struct uvc_buffer);
 	queue->queue.mem_ops = &vb2_vmalloc_memops;
+	queue->queue.uses_cpu_access = true;
 	queue->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC
 		| V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
 	queue->queue.lock = &queue->mutex;
-- 
2.47.3

