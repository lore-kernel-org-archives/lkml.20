Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46703BB672
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540367; cv=none; b=DP5LN/GgtlV/6kx1zD+fyUUG377/upd6KX5S1DPonEfrfk8ePG3MzowhFSXbjF28G607RHAPTmxraYKm1vBzwBzBRSgkTdi/5eIY6l+Fya8pMlGVx+xP7oVkccLnaMibN2aMfWOZKdYZDvmzRYN/erwawonXVsU32BUpSgCj56s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540367; c=relaxed/simple;
	bh=hxQZMLwG6yecstcTEMEbqIUKya/zeWZiCbghCJI8fVQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hzaNNZ4Y5c/PNz66QT6gXNbARi1GdMoU7Tw8MiD9bSDl+GSWvFkeDq8vfth30uCnZa1n7+mXmVXY6f5xi5r9NDNTzrJfNFhAF1kwUh2a0vpy9DfXSBP2NEwI38QYe1qSFwrJrqVwuGYQyMV1Gz2MOHX4Lg4Q0vo4ByNzK8GE/0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vpkXyu6U; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vpkXyu6U"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49b7c1dc61eso11047585e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788540360; x=1789145160; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWNAdrwGmNJRf6eRTL3iblh5LCxPTOBo/qfLWNuuaXo=;
        b=vpkXyu6UIvcaSzsDleZpo1eGIF5yY+lTSnOrIhzO5QZNnnGlE05girF4gH4JixmfzK
         50xri6fSK8PczTnr6MUN2GNZ8+fGTML/jfDv+s5+kKvZ++wKj7VArYmCwBJVzY6ok6dI
         16uDI+uTmP0Yg6KEbmZgB6sHCemsYvLIbjQB4shpHvkoH7kgDoS2nOWxQZEH2nenm7E+
         3BiM+0fozaacAidqi66ze+841KgVSvmBfvFH4/XaAMuhhVkqchiR0xAUWAbIZzMWhtfe
         uABTOB/sIUCEkBAEiLLLocP8WBfBR0Pg6ItcfjHhreQXKjyE8b5B+xLeqVYHbYrjOjgY
         io0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540360; x=1789145160;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWNAdrwGmNJRf6eRTL3iblh5LCxPTOBo/qfLWNuuaXo=;
        b=ioJ9kJ+Pz1OcB4uap2Rn3Mck8JY5PErfHbQN6NMLz9qij/6DsqKga5dRgGQ3NESpeG
         EYL1B3NZnYO5NA0IasUyqS0eb0ogBClwZanZQmv4YtMsfUux4aoKyZiL/ypBuM7wEWuM
         ffAUL/kjyE6nA7KmEws8tebSo4Soe0dvIUO5ETCLiq0tv0K8rUoJjejwHMmnD6ju2H0p
         V2WmUonL9dFRKTDbgXJ6j1hEAmalh0nwoRcXVPyIER818cPKdXyjY1EJrZfvnPkkh9jE
         xkvhOVUVdF3F9xWOzKsbdOdkeIBnAH63Q9C9uHTLbbt6VlRBHy8OLnxoyKCCpeh23GLi
         4z0A==
X-Forwarded-Encrypted: i=1; AKwUvByb4pDppUGaZNngdxZfIJepfbEjuBGlDTH3q9Iyyy/oPKD9+v9Q5zbdTLc94E5t5MkMqdaZQ0p7GfvvbzA=@vger.kernel.org
X-Gm-Message-State: AFuF++kI0oHZ0miN5lbVKrxovwBRHLvLCzRLIK6CWUoN2eifqIcennt1
	GkaaXOv/NAfC8vIbZW6nUg3l3ltIPvhGxZ7dh0fIlAtn6mnpQ72qUC/hvwYENZS5SjM2pS44wUc
	Xx/H08buvn+Q7FsL6RV+ReA==
X-Received: from wmwb5-n2.prod.google.com ([2002:a05:600d:4445:20b0:49a:1b4c:be])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a40f:b0:49c:fa21:e74b with SMTP id 5b1f17b1804b1-49cfa21e9a7mr42587355e9.33.1788540360049;
 Fri, 04 Sep 2026 09:46:00 -0700 (PDT)
Date: Fri,  4 Sep 2026 17:44:47 +0100
In-Reply-To: <20260904164450.1345852-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904164450.1345852-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904164450.1345852-2-vdonnefort@google.com>
Subject: [PATCH v10 1/4] ring-buffer: Allow splice reads on static buffers
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

ring_buffer_read_page() rejects splice (full=1) reads on static buffers
(that is user-mapped, persistent or remote) because !read check assumes
unread pages must be swapped. However for those buffers we have no other
choice than memcpy the data.

For the memcpy case, only return an error when the writer is still on
the reader page for the splice interface to wait.

Fixes: 117c39200d9d ("ring-buffer: Introducing ring-buffer mapping functions")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index b0963ac6fd16..84fd4cdd486f 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -7193,15 +7193,8 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
 		unsigned int event_size;
 		unsigned int flags = 0;
 
-		/*
-		 * If a full page is expected, this can still be returned
-		 * if there's been a previous partial read and the
-		 * rest of the page can be read and the commit page is off
-		 * the reader page.
-		 */
-		if (full &&
-		    (!read || (len < (size - read)) ||
-		     cpu_buffer->reader_page == cpu_buffer->commit_page))
+		/* If a full page is requested, it cannot be the commit page */
+		if (full && cpu_buffer->reader_page == cpu_buffer->commit_page)
 			return -1;
 
 		if (len > (size - read))
-- 
2.55.0.979.g7e5102b832-goog

