Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB254D09E0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791329582; cv=none; b=D/1LeL3gjnE48Lv/UgXTpacn+M3G8CXOjJI+QpJNGA7nQRfF/tRQsTF1YPi38T7gb8YqB/GqLoc3z8896CvjH8uiFQXvwi0E6vtU6gtIchVJuqJchfTiuUF3wUl0CxvVALjOWEbbsUlhw6yXWPg4dnlyXjjKejmyPaMzy6Mx3UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791329582; c=relaxed/simple;
	bh=ZtHLyeAPqU1yHYs1vBBFWc+adSg2cLrvC9gffuT5ipo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mtP5aMT1fi6Z+9F+iefUZNkLYszN5uHg48jtcW2nlirpQ8kCMr+ThX7ySEye2yv8kcTf70DVuNJQGXqadH0UkTMPhC3fY0FdjWE7MIBCUUcdynU+iFEJPRMo72re8GI1sSI9JiqNX+Hmhu7yr/+StPRXj+qw7HrGceK1mzIbe7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VBJAQMao; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VBJAQMao"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88b59692e0dso3035262b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791329581; x=1791934381; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDIRoPL3xIeLWskd284eyk1joUNAp3MKwra/NHSENJ0=;
        b=VBJAQMaoejSKaabmORkpQLYdTjhpspoWiNbGYpgqphHi7O7IqB8ipOYjKABdOml6K1
         URmkhzhLpOuTQIyxLq2C0bIFGe6s2y+GtLndg/DlViFQvuC5PmoXK3cvwoOgIc2+lS0a
         QWTY1LNUx//qYyUrLtrkqbox02YdSWTYhbkHXK8hIQIIJO210mvFvj/Kbkgo4eECV26J
         iICFfXDp9U5fLRL+zbbN/+8RJYVpl9H34uDtuUmpQNF0D5wz/Kc9pGHJXHSL42wqxndu
         QOKHeNEOqaWqRSXypxfUIucjTbT8LczgyQXlxcfy9FrtyJlfWQp3DaaXvGEUEZm7xfpI
         WnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791329581; x=1791934381;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDIRoPL3xIeLWskd284eyk1joUNAp3MKwra/NHSENJ0=;
        b=xmpUO74C4A2Tt2PHgc8m4E4b3cTQHFAJDznz2PxlUr9gKsRu0BElYMdvKCRhOS1O9R
         qldhQ7bA1K+eoFm039U2GoYhDdj7/qim5HGDuB8jMWp3VBHUHSCrf2R9+Kodjv/l91JU
         ro3QN1GTTJE37u4QCemd9GPL/X/7JwvPZorDXL3ERHLY8y/ZuGmLBshqDfg7RReungAo
         d/ltv8KsqEFngbJeSfDoT0MSUTFsLgfrWIOjMKr4ZLfK3eSz07X/pDSyeM1YanQkCclg
         WJPkB7XfEF2YuazoGJo9ff+t90N3pY3mLhRAH+BIKK7D53P7edhnz7bLXdmaZKVXn44k
         +ZOA==
X-Forwarded-Encrypted: i=1; AKwUvBxveWGoPf1xFO+JP41xb2J7ao8ZLA/VVzFNKQsol7VyLG6CYrCxEa+oSWiPKx/iWP96uzaByG4xJLiQqkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw/nXo5GbtSUW+x/Nvd3f0bm2taCTlVBnaWZWUx/48W6kuJhaH
	C2M8G9psvvn1xPrXabaMAhiYy8C541uaLD+USKUs4WnUAU1pvm54Db8aCMqMRVw6BED0yvF3ayQ
	DyA==
X-Received: from pfpk15.prod.google.com ([2002:aa7:9d0f:0:b0:886:455b:1719])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4c94:b0:886:4070:ceb8
 with SMTP id d2e1a72fcca58-891b286bfd0mr475543b3a.56.1791329580752; Tue, 06
 Oct 2026 16:33:00 -0700 (PDT)
Date: Tue,  6 Oct 2026 23:32:42 +0000
In-Reply-To: <20261006233248.705086-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261006233248.705086-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261006233248.705086-3-praan@google.com>
Subject: [RFC PATCH v1 2/8] sunrpc: fail only the RPC a transport refuses
From: Pranjal Shrivastava <praan@google.com>
To: linux-nfs@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>
Cc: Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, Logan Gunthorpe <logang@deltatee.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-pci@vger.kernel.org, linux-rdma@vger.kernel.org, 
	Shivaji Kant <shivajikant@google.com>, Tom Talpey <tom@talpey.com>, 
	Leon Romanovsky <leon@kernel.org>, Unnati Sachan <unnatisachan@google.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

A transport returns -EREMOTEIO from ->send_request() for a request
whose P2PDMA pages it cannot move. Retrying doesn't help, but today
the error stops xprt_transmit(), finds whichever task is draining
the transmit queue, and leaves the refused request queued.

Dequeue the request, on -EREMOTEIO, cancel only its own task with
rpc_task_try_cancel(), and keep draining. Setting tk_status instead
would not work, a dequeued task looks transmitted and would wait for
a reply that never comes.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 net/sunrpc/xprt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/sunrpc/xprt.c b/net/sunrpc/xprt.c
index 48a3618cbb29..084d5a508357 100644
--- a/net/sunrpc/xprt.c
+++ b/net/sunrpc/xprt.c
@@ -1579,6 +1579,15 @@ xprt_request_transmit(struct rpc_rqst *req, struct rpc_task *snd_task)
 	if (status != 0) {
 		req->rq_ntrans--;
 		trace_xprt_transmit(req, status);
+		if (status == -EREMOTEIO) {
+			/*
+			 * This transport will never send req. Fail only
+			 * its task, and let the caller keep draining.
+			 */
+			xprt_request_dequeue_transmit(task);
+			rpc_task_try_cancel(task, status);
+			return 0;
+		}
 		return status;
 	}
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

