Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD60492E4E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048772; cv=none; b=BToj/siZ1QxNtAwBbeynvrTFSBh9Tl8Zy9zVnxgEkoIxHVQIAWcqzlyRxpw3BLsQiqQKShSulW92Zfhoa6T93pB5vXtRQk5dDqJnHEfe8/T+1TZG4RwAy5ooJxVrCI3kKuXHvd+he4RxtCmr2JUwSl+PRGEavg+OWjCwnxUSzFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048772; c=relaxed/simple;
	bh=Y6jWV6ZpYD55iJx0rXT/G22pEri5CwgcxUksOlBcAeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JY1L1UbuiFHL37JigoGc/F+BzFMkvPcxWUwtSYfbS10JFijPGauXyZqx+qzSMkpB2bDoKNjgieHfD727+Exd5Q0oaWr7HGvzPtWIsoz+aVBYKY/sfXSxN+q8t2FMucpf8EkLdGwBcsRtJ5jQ2zR9tvmBLUJAX0ft9bLWu2H8Y3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S/XFteu+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S/XFteu+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789048769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1GxlXop5BNMoKQi4jo+ZeUE7mc82UQ20F3V6hMG+loI=;
	b=S/XFteu+NnsNAXJmiv3goj+OYMtdMBU+Lc8kZ+CpU9kK0cl5oVXdo4XhjD2zO+1XDGt6in
	hHB/7WGKuE11fTC+4iDmdUjHZ8aumf7jTF4YhMhop6v4ERwAdusQz3Gmb1/0t/AF+0mhqg
	9ynz68E/8eZ2aK6/Sb2gagRBkR2BV6g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-208-dGqvfRB9OYy5zpPFlfNstA-1; Thu,
 10 Sep 2026 09:59:26 -0400
X-MC-Unique: dGqvfRB9OYy5zpPFlfNstA-1
X-Mimecast-MFC-AGG-ID: dGqvfRB9OYy5zpPFlfNstA_1789048764
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E64319540D4;
	Thu, 10 Sep 2026 13:59:24 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 870D346E;
	Thu, 10 Sep 2026 13:59:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Rae Moar <raemoar63@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	workflows@vger.kernel.org
Subject: [PATCH] Documentation: kunit: Fix bad debugfs path
Date: Thu, 10 Sep 2026 15:59:19 +0200
Message-ID: <20260910135919.435500-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

The path of debugfs is /sys/kernel/debug/ and not /sys/kernel/debugfs/.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Documentation/dev-tools/kunit/run_manual.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/run_manual.rst b/Documentation/dev-tools/kunit/run_manual.rst
index 98e8d5b288085..59c3313a6d15c 100644
--- a/Documentation/dev-tools/kunit/run_manual.rst
+++ b/Documentation/dev-tools/kunit/run_manual.rst
@@ -87,7 +87,7 @@ the ``/sys/kernel/debug/kunit/<test_suite>/run`` file:
 
 .. code-block :: bash
 
-	echo "any string" > /sys/kernel/debugfs/kunit/<test_suite>/run
+	echo "any string" > /sys/kernel/debug/kunit/<test_suite>/run
 
 As a result, the test suite runs and the results are printed to the kernel
 log.
-- 
2.55.0

