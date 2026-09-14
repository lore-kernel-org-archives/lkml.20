Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0902D33A9E9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410539; cv=none; b=DyYG3Ixjx2nQFgewWDcawhSoy4rpZyN9Vh2FV7XuEP2gw0gxW5z6HoKg0KZmuzfbFikbaL6baSGjshe0WKPtGRAqg6dM8mNbWxrHLn93UxsnhY4Wqsy715jRMs04ZsqPkBYgerQ5dHbncdPPln5hPCqQOGYhUHxx5w34qfgFxJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410539; c=relaxed/simple;
	bh=Pwu/0Cot70c9cl/FQ0qDdWdGr0VR3q3j9hvKe2dSMUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VbIWcE7YI9RtrpxuODR/CACfi8MvmuhjHGDuB8MIST9jCuMi7P+RwGyKNJ6c6u2aNsr3HCj8nsQBK/anIRoZ9Efi9j6RbRJlksjJ1jEbqCJ/e722weYHrZMIh9Ho+j6b6x7SfDtkd2wiRbfKFp1Ajr5ldQtubDX28fU9P6PHl/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIfOgnJy; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIfOgnJy"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso416438266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789410535; x=1790015335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzAQVlxc3SiItgqPCAg4pRFm0RhGbGZG5JH2sIt5XL4=;
        b=tIfOgnJyAl/VbEUJeidi5elXy9sxivmH9fqWsr9PJtIClxDujdC6IYllYnY8dPG+3u
         NJ2U5ONAAcD+UFOMvbBlQMFCpTIwYxZ9/WKXlcCwoJGNssKfGmLCb7TJFv8gbFYx0uJ3
         8lH0jVe87JkzHmxvUTWPAfBr6ryLvBi+6QsSgfWY9K6a3O1wAJXNE/NgJf+ZHoeD7/Pn
         E8ef59hAGUTDGF+v3XgbeudtLM+dVPsnDnz8pjR1OQvyiPWek7l9bDtoRsVaQ1NUuEFH
         Vwdyw14+1i3gfyVuOZRU6nPPDcpoFHh0FKgdTjegktLhCZrXlWkY3N5uibhR61CeI/tU
         gVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789410535; x=1790015335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzAQVlxc3SiItgqPCAg4pRFm0RhGbGZG5JH2sIt5XL4=;
        b=yYUbbPFE3+b1XcNZE4zCozn/Zbqud035CVpZqBTcoM0sgLv2vwJ2Bt/Xy8VhdMBZBR
         LrCt9IWKmKJDDq/jVYROHBEBUDpen/o3z8an2l1DABC7NwfUASkiTBBj//zwmbYvoWIX
         JtoaS4Mog+4+C1ADQZBu9EUvoJMeZ+6a3Xx/fjHbKI+pxVhPJ7if7UKTYDDqvmQgcbNs
         l3xfU1t97W4NBfuvkO2e4j8nlbCeG/vowvcWtBaKEiJbkBIU+tugoJ6ZYYK//4xHzd7w
         VMCD7KbIr7tGjhQaHncKmc2nTuF3Exh6fmoVPz50U2XLNwztrHJf/x7dOGLgX5ywlKIo
         L5yw==
X-Forwarded-Encrypted: i=1; AKwUvByed5Wo3aW1Y/8i6Q2OsF+TVyGT/l7KWtG4bMLHsjfq/SN5UPsYqGWj3hZ2ttaFoTO2vlf9Lh0LY5EPGDc=@vger.kernel.org
X-Gm-Message-State: AFuF++nyLrrnw5UyrdHrb2/QgttuWp+dHwclW3d6iahZISUTvM7pzBd/
	XyUCt2gKt4k/n+Ryr9eap5pi0eHj4XFIifL1OZzef7eQ/RRciWgu5t/YQUBLaQ==
X-Gm-Gg: AYBFou0UO8Rf8xme2hBUUUcrxY5IaNMz24YvY9ew1X+a/uFblWuAbMxO92itg5LtU7Q
	9iCSYUIewr+ejUEaY8TDJp/WRF7DQJHhgfpvq7wzNQ1h+gz7V9wc//Q2B+agjQc0GHDVEulGD7J
	ruyrusWf3PohIwyD2xxcel5c1khnh3cDWfKYa8b6F20kmHo7u5sGOJrVVgbo9uT48ShFK55W0x8
	Jtpljx8aj4RZvUG59Qi5Efj68yefnTY0ta5N+JUVG8TgIW5cDZHTPD8XGRnTt2SklvgI9KtMOCg
	yW0rut9iurX89YWoG5aRgm3Ewqt4rh5Rb78JIzoHrpVb+D0OIq7v0Z4kFQfZKvwLOSVhkKxFVq6
	xjiQ7rvYDXzD/6UZQAARnmG2KRVixD/8nCF/0TQ/VShto+KqcVy4sDv96GcrcCiUtzWrs86raOy
	70PjdHvJQ0CNQ/KCOPT9g2oESiYbOy+tG7jVP6kg9uWJfzx09OrSai/Ubs8rKzgR2ogY7bN6Hpi
	YuS7QFAiUemjP9OSurKM+i0j+DLnUCSRd93nt1y5sowYvBIKgNFcg6Ad6E=
X-Received: by 2002:a17:907:c13:b0:c26:1648:a06c with SMTP id a640c23a62f3a-c29b8770a38mr275145766b.39.1789410534761;
        Mon, 14 Sep 2026 11:28:54 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614b29bsm467316666b.62.2026.09.14.11.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:28:54 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	vdonnefort@google.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ring-buffer: Take cpus_read_lock() when changing the subbuf order
Date: Mon, 14 Sep 2026 19:28:43 +0100
Message-ID: <20260914182850.21449-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A CPU coming online during ring_buffer_subbuf_order_set() can be added
to buffer->cpumask after the allocation loop, and the install loop then
uses its empty new_pages list, corrupting the buffer.

Take cpus_read_lock() as ring_buffer_resize() does.

Fixes: f9b94daa542a ("ring-buffer: Set new size of the ring buffer sub page")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/ring_buffer.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 04bb94c29f58..445931bc9ae0 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -7464,6 +7464,12 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 	if (psize > RB_WRITE_MASK + 1)
 		return -EINVAL;
 
+	/*
+	 * Keep CPUs from coming online while changing the order to
+	 * synchronize with new per CPU buffers being created.
+	 */
+	guard(cpus_read_lock)();
+
 	/* prevent another thread from changing buffer sizes */
 	guard(mutex)(&buffer->mutex);
 
-- 
2.55.0

