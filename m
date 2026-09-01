Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D843E9DF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278095; cv=none; b=SrgypgGnWrn4cPySrXWaGPFrqV9/TH0d5IO0bbtJYFns6toz0nfj/MHkeYA35txvuT0pDqJdZDpq2/kJ6Zj9P61KFIyRiNx7VrezDtEAEYX3Cp1Y/noSLNSzrd5n8emv7RyQvDKrlnvZpAJBHdKWzDLL7BAM+ZgEcP18MEfX+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278095; c=relaxed/simple;
	bh=zuja3xdGtmWolyyOp5Lht4+r4a2fV671B1BwSQW5ZG4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RXaGQyjR7Joen9mYjaYY68pfxojQOy7/CdqQuI0dvaD875Ico0hQtIzwbPKw06vzupxflZkvnk88m66tIFHZfvs4+eMtrDQKSv/UREjOZ8TYi6GuRC+fA+CuFNwv4QHpWhZ+5gaSMYcq+xxqJcHIHwyg8naoCsS43pxqg1BL8Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aEK5aUYL; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aEK5aUYL"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49b8c651ac0so12936175e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788278092; x=1788882892; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FsJpjMap89L3xg0Jo/p/SVRBiaT1jMUIMpNMGOQC0kY=;
        b=aEK5aUYLWMKa7kwbs2b7Lg2IrzwsslTxgWzR2sV7876ACHoCVt9kEi/Zf55klxsbf0
         zzApXEIZ01BJKclGms/gLl/9hBTwro6axxqtVhSoyoAk0uQamQeunUxyaLJmwPN2ckWe
         EjZGcZcH8TNBWgzJNmhV1utDavhlQQVIUFBDrp4tBscbyv743lQKPMDacywvq/4WQt31
         6Xa+3yXfrR/rOiFaIBa4RmUU0dFrOmyQzf9PhiHh3bdr6Am2mJo6uxFc+W2hTcH2truF
         3eMKC+4hfl5RfRnPI3FIEug5RcpMfcGj2fOYAfv9C4tKOwPn8aD8pQyd/a6Hwdbe5LQQ
         9vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278092; x=1788882892;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsJpjMap89L3xg0Jo/p/SVRBiaT1jMUIMpNMGOQC0kY=;
        b=sOuW2blBJcraNmFh+wqjEiM/zEZJGUsF6S07ZZLoA0TLF/9cDvPzhFplNtt9pduusb
         78VaG7ciAvcd4JI9cpuB2hlpbZ4c15OihO2E5JFAE6wW6I61Jwx13nji5q6Oku5VEkzv
         Zk12qp1e755xW5sSjBCNAvZuiZZ+sLDfaJKv8o/MT0GJfoJonx5Kui6FBNTPH6JaFYaN
         o81/2KKnamYDhYpPsSIsqa0rdKvuDtRSpJq0SJGRHkLr1mkCWYi2qSaWAuxuKfjI9WIu
         zZr6JscrWpM2bgrr2ThE5tLrcMTURNkeqIA9WRGMiM/cwA8UmeSJd8GyGgoIqHaJEtV8
         2kVg==
X-Forwarded-Encrypted: i=1; AHgh+Rrq8sd+t3Rx+hZ9jDtnJ17hVNpb8AjzKp6pXndVpvUmvu5BSgRRhuMCXVAXLWrQ21w71ePuTKdLBJgcHC0=@vger.kernel.org
X-Gm-Message-State: AFuF++kvZ//r7ccTi0TEMsF/CQ5dSRZTfPpWy7OJMnf0zvwWjwTkF2/L
	vp7wck9rdO5vNuikAnR87DdJpSSuDEKlXaIje7vBpRzilrvSafgy0BdZQuwCw7Y1fQGLIYK0EWL
	wDj+sWOc65hGPOCl2cXkstQ==
X-Received: from wmbhj9.prod.google.com ([2002:a05:600c:5289:b0:49b:6a4f:11f8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:10f:b0:49c:e3b1:d826 with SMTP id 5b1f17b1804b1-49ce3b1dacdmr20137095e9.13.1788278091873;
 Tue, 01 Sep 2026 08:54:51 -0700 (PDT)
Date: Tue,  1 Sep 2026 16:54:42 +0100
In-Reply-To: <20260901155445.1475405-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901155445.1475405-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901155445.1475405-2-vdonnefort@google.com>
Subject: [PATCH v9 1/4] ring-buffer: Allow splice reads on static buffers
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
2.55.0.897.gb25b4bd76c-goog

