Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBFE3AFD0F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936306; cv=none; b=bqB5//MYePdMv9DPtk2LmgIhk6UgR6vvK1LRZcuImHvkXbkGAQi5w5DRHE96azhuPPTI2tkkpm7qPnowLa0IqKPXgkqdQQkhovIPc1WCdttibVF0SUTbAyTp//fdxhj20y8qV++gcGldTQJS6yFcGHiZjR2bVliO17D7//CSoJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936306; c=relaxed/simple;
	bh=DanluAYLKGnSSr8y1+7HZ6AUnVzsPNVwXGZvF4Qstfk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RLWIjY6BWsp4Ctok0U3N5QoGgDnGfRtwCxRYtnFODztvgo0CpWOH/1/wD1xXwOJOdBeZaZMGDjGpSM5Kjv6/LLPL6jgn7STEvjgLo0ha1iYI3oObfFyK1XKi+6+aYef11H5wOwmc6W5/SvWPLcWcdvWVB67A9XyJZA3fOT008T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZzwWbx2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZzwWbx2"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843f205a5bso3456656f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936303; x=1789541103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e0E6YoepVX602+BZgbZmpihibucX2fS9462FnPD7Cgw=;
        b=rZzwWbx2sH4d/qXVZKNVxq08MnLLftOjjcT2cbATDTP2kvqWwSayrt/deiN6L/lyZP
         BOafq7gp2gma07KgA2FtbZocta3Obs0REa+qcCDl7OIabpc09XqM1TTaQcE04rd56B1d
         RVBOojzXobjRbMnPS9hS9WQAyLJ3OsBzZpBm4JmpHbveOvnPVNIMJFJORdD+1yE269Y1
         B0L9agqSKqLdslZ883bQQ/gqz6DwCs0kiVEftNW/o6BQh3yr8qQXu+OkPK555nNbhT6q
         UuqNpONmMK72JfZ3WjzEOAbe2AJawNw81YyBvpWSsSvSgOZ556IaMN8mH0BDsyJnvJYN
         fRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936303; x=1789541103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e0E6YoepVX602+BZgbZmpihibucX2fS9462FnPD7Cgw=;
        b=ihxeWRxlIgXfw6F/Qxf0aJfjWkWr72f/qiofzZTcxg9DDZYTIuyER72Fd5UUUHtIcV
         CvDLfP0i5sPDY2OeNYhEG4jsfOB+l+iNeJZ8gbvGA9SqgY1FDKD6F9G9O/70uiUWZ7oo
         DAxCDZcH4/A1M3ECVBE9UczmIhS4a2cwy6jQoDyzeKrrbDeizk0jY1WRCxQLBSALC55E
         ipKADi4H2JZQxtzf1KNB7fXi8bZRNdLnygaFzWNxvoOYa6O6L1UykvlnAcwdH3l/vXXZ
         IFd9WnbmYZVmQH2Rgt58feeF6qjN6/6fqk5DM4QbBrUJtKp0OamNjEgK0vWvkb9pMLZw
         fhxg==
X-Forwarded-Encrypted: i=1; AKwUvBxSQvS/2u0j4D0eBn3gtDr8uCbTmXvzWG2RNLo4Y9wTYakZEdow1gLhBghm6ZDfYA+FlNoe6aA5lXNxDk0=@vger.kernel.org
X-Gm-Message-State: AFuF++nxEFUSB0rYsXiuehX3VQbWYvVv6/Xsxk4Ab+vW8o8DYuGyEmr2
	qlddjrfPqk5Du/xlHOvksEndkzVfoKV+oSXEP0eYWkG6wrg/11QMTauEtwnhknFQ
X-Gm-Gg: AYBFou2tyxuSTd2/vp+USW5bcy0AdWWKPs9G15H7vFVtx/+Y+T9YKpCgaRn1RdyR1fE
	4lb7A5ctqI5u5Q6hdWVl7WcRcCYNnRCmx+3xsCC7KucXxtrM7mTB+i2BNtx8D84pPM8iAzfDLTH
	1MiJXdGhnp1oC2Pj8EuIf861jxPyJc8XdjeunOfnGWYkDirtbf/bDNbI8Ca6AZWr7rsnvYkhOkD
	mPQwLDz2EasJZksIjCPB6jMEO4gtEKeoV/ID947Gy09VYxeRMbAjHwoxYyWLPIgXPAJDXTTJ+n2
	wKr+/Iovqdy3lvj7nxo2GggxVbe7dU0RzCiYNGtPc/WfEb41W/c22HqHvorE+b6u3y661EOo5aP
	xzoKf6G+q5MUIa57PWMaejV1mXeyCfddeLJVbcYm/cAQU+cVul4PAACOocJdGQLyt4QZzMtVj7M
	Zu065EEtLa1somM12R5XmI97rs9Sxiqlwdq340z6QXoZuSOtcRbjQlU3BQdFAfQag+Nyyt3cio2
	LraYU8jFN2TB7tHfwl01IjMpYBv0qWqPnpwtfMwPrnWLD33S+DzFoaMHMD2DRoWMEd4o9GHLDhB
	z3RuPQnLNMfmHh2xm5xEdw6Gjc32AWtE4Jh61sGCFcw3pbtwoblgEk8LZce5hxU=
X-Received: by 2002:a05:6000:608:b0:485:8e4b:3d34 with SMTP id ffacd0b85a97d-4858e4b3ed7mr31596984f8f.5.1788936302679;
        Tue, 08 Sep 2026 23:45:02 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-114-212-219.95.114.pool.telefonica.de. [95.114.212.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm36579522f8f.5.2026.09.08.23.45.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 23:45:02 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Chuck Lever <cel@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] svcrdma: Fix svc_rdma_recv_cid_init() kernel-doc
Date: Wed,  9 Sep 2026 08:43:43 +0200
Message-Id: <20260909064343.90437-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

svc_rdma_recv_cid_init() initializes a Receive Queue completion ID,
but its kernel-doc heading names svc_rdma_send_cid_init(). The latter is
a separate helper immediately below it, so kernel-doc cannot match this
comment to the receive helper.

Fix the copied function name.

Fixes: 28ee0ec8948a ("svcrdma: De-duplicate completion ID initialization helpers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/sunrpc/svc_rdma.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/sunrpc/svc_rdma.h b/include/linux/sunrpc/svc_rdma.h
index 76aa5ec4ab40..5ccb13bf906f 100644
--- a/include/linux/sunrpc/svc_rdma.h
+++ b/include/linux/sunrpc/svc_rdma.h
@@ -142,7 +142,7 @@ enum {
 #define RPCSVC_MAXPAYLOAD_RDMA	RPCSVC_MAXPAYLOAD
 
 /**
- * svc_rdma_send_cid_init - Initialize a Receive Queue completion ID
+ * svc_rdma_recv_cid_init - Initialize a Receive Queue completion ID
  * @rdma: controlling transport
  * @cid: completion ID to initialize
  */

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
-- 
2.53.0
