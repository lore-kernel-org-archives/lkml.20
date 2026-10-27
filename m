Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128841;
	b=O2knUFvsr8AtDSOZgZHmrWx6Fe51DYzM27LTYQd8ylrwXFJFWJ4LRitxKzIN1A1uVMiH
	 Q7v6sdhOxy6ha3edS7Cp6Kk0LzW+b9I7FfRPRfkpIvfhMOI7FM1DApkPvGnGkv54nUNvz
	 p6Fr/tzDwyKYUhj9ns75gZrsA2nGMhcUFcSjsEfaDwdvvsOsLyLUr6frYYST1Y6NZw13b
	 ntjfBF+i7Cls90FQROvktz3N1TUu/hnqweryxU8KiZTgnV40zI0e79/0OjSVaF44SCj6v
	 GzLrOdSm/8FgUc9NvtUYP1MimHoGX0IrzBekDD5ePmoWfHclK9FmhIemgvD+gKMUY8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hk9/0T79qmJBx1+aBaKaGLqZJw/M/AXieWp8XrsTCTg=;
	b=aep0K+lnzj5+Y0+6IqhwRsL5m3RDI6osiV+9q1ThBwFWY2mLYCK1x5fj9/jrdbxF2c8d
	 0nkg8VbABb5O/9ft88kbvH3uqNaOa8FOXv4VtTRbWmQLTPy+0P4lqSPNnwAQojpgv6+lA
	 auyDaI3vKLFvL/JuI4TSlyla6EhY9GuSXWmO7t4UgFzqu0jJXedXzXHq9jOiIXkuqpDnA
	 eV0R7sY75QjcQltpRPnmnrPj0OVTsU3EtUBH/ihWrKzwfkTactKEzXmglGpG4hiUye2XB
	 5GS/6bQQbnk60yOBAFff2JBK7DU8CofmSP3/YWdjC6xTaNwNPsf1xxB1sdkrN1sM2NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QQkLR1g/";
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46C4606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E46C4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QQkLR1g/
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so58989eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793128840; x=1793733640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hk9/0T79qmJBx1+aBaKaGLqZJw/M/AXieWp8XrsTCTg=;
        b=QQkLR1g/+aSDG22UmIZXQnpCRa4u2Totc+OsjxD24KKdE44CNN5+V/iXKGbMy34KE0
         9J/mdrs7iGN6Cblm4VspbDP498gyj0tj6d9hyieE0H8p4MbZE+EHmO6GiTSdTWP9Ujw6
         xw96k0X6QJCDIXUvebMzlWbB7Jb91SoAcZd73u4N89bUACIqoSnmxiihSVjpw2GbKCln
         noZFuc7jG6N7ev7Ayl68F9AuR36yDmAYpDcqJ1RZf3/VNORZWW/bKDsqLmgjqtIcCBZn
         Wwt9m6d/4ACkqxnabKNpCc1rZC4TIZ5SxWFLlim33XkZBEGr2fnPTVUEVuUKDAFmP58j
         oyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793128840; x=1793733640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hk9/0T79qmJBx1+aBaKaGLqZJw/M/AXieWp8XrsTCTg=;
        b=r9Rr6vftfdYY4XGOo8/sCeohKDfWtE16r9IvmkKMCe+SqM+j1NI0sEYy59t8ltAcdI
         IJ6h9TdNaZIszP36xAon8x/6USj3JMewSaAv/uibreQX/RqdUc/5yzAxoVeFZPBfr6AJ
         mOIT24lulRgaKMMwZHoZeuZpVqPuSIMOW3nvsQgiuZ++ptBviwdbjlhhcYlL+wW9gK5a
         ukWugRCLFiWK8YmD4GhRVaYvHV66zjYbDq/oN26skEbGObzdzvmTUbmB6aa7azoYCjvb
         AOEwCCTvGbigc2RL9t/Cov1q8x4KT6hqoPmZEumT5kxIh9u4T8jqKjjoJyYkB6uzDSDS
         KN/w==
X-Forwarded-Encrypted: i=1; AKwUvBxACGcLWfGzywm4CPrppBjgQ4wHUlwDV7RthYKO6648chBhAOYnkvdOUMt/VmFZiOZu+UMDYQ2M2reyFS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiuhLrgnAg9dhs6vUwhcdrxzG6kkIG/TYTAU6m+rR2C5j+zV+t
	b387Xup1JpxHF1gsp6xvhUrQVi75MB+mxMSWf7Za7Ul9QvyMxp5NkJi8
X-Gm-Gg: AYBFou3MnVfXcifEabnLgMNRPe2EOTuwJ4qVdlEkyB5JQ0Lta8PgeMkH7xACSgAKxnV
	rMAmLtuYJjgkbd5GlnUofFqQuNtqfVRmj0LylCWy+6x4XEKTsb9DSWEO7nc4BozVFJgdDHJ4wpO
	Qy0VmxoOtRARe0npR6re7o6EJgnBsG7WxfhhCEuiFRz3SawitywnlvCfbyG6qTmHTWRvZFIQ5fk
	KooCS9FQ0mOtBT/HseYpmMaXSfaSc/sudcxsVthXoLsbHOIOPrR8BhD/QRuXHVjywsvdxq9pF8S
	+flScxHPhUXCZ48e8a5xK02yjg523pl/kYE7x/Z8FwKEFivWm0gRZYrSOwbuCHuAlg+93wjIO/N
	LiKlHmTw+A1bCgg0YWGyZiFRypGfT2QzXaC3yDZrmrhVHVchdp3RKkjKvoWmY5j98F8xHO9qPO/
	wC/y/1tO0mTrZaaOIfZnPUZ0QaehO7v/gZpMW3sXHMzv9d+tr0SJnsw3xy1up5dEYOT9V7tdzlA
	MHeyrn+wwMgE9gftf/mHBh3ruJEvkeunBfS1dh5MhsJgD5JQjLJT2TZl0Txc62VAgVhA7cKiCGk
	5Kq4/ug=
X-Received: by 2002:a05:7301:2411:b0:369:fdae:c9fd with SMTP id 5a478bee46e88-36a201132b1mr506995eec.13.1793128839731;
        Tue, 27 Oct 2026 12:20:39 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7e73sm35948746eec.20.2026.10.27.12.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 12:20:39 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jack@suse.cz
Cc: amir73il@gmail.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2] inotify: do not coalesce rename events
Date: Tue, 27 Oct 2026 19:20:27 +0000
Message-ID: <20261027192027.8617-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

inotify compares the mask, watch descriptor and name when coalescing
adjacent unread events, but ignores their rename cookies. Distinct
IN_MOVED_FROM events can therefore be coalesced, losing the cookie needed
to match a later IN_MOVED_TO event.

For example, watch two directories with IN_MOVE. Move an entry from the
first directory into an unwatched directory, recreate it under the same
name, then move it from the first directory into the second watched
directory before reading the events. The second IN_MOVED_FROM is merged
with the first, while the IN_MOVED_TO retains the second rename's cookie.
Userspace can no longer pair the second rename's events.

The original inotify implementation compared cookies before coalescing.
The fsnotify conversion lost this comparison. Do not coalesce
IN_MOVED_FROM or IN_MOVED_TO events, which carry the identity of their
respective renames. Leave coalescing of other event types unchanged.

Fixes: 63c882a05416 ("inotify: reimplement inotify using fsnotify")
Cc: stable@vger.kernel.org
Suggested-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/notify/inotify/inotify_fsnotify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/inotify_fsnotify.c
index 7c326ec2e8a8..6e3af6452dcc 100644
--- a/fs/notify/inotify/inotify_fsnotify.c
+++ b/fs/notify/inotify/inotify_fsnotify.c
@@ -36,7 +36,7 @@ static bool event_compare(struct fsnotify_event *old_fsn,
 
 	old = INOTIFY_E(old_fsn);
 	new = INOTIFY_E(new_fsn);
-	if (old->mask & FS_IN_IGNORED)
+	if (old->mask & (FS_IN_IGNORED | FS_MOVE))
 		return false;
 	if ((old->mask == new->mask) &&
 	    (old->wd == new->wd) &&
-- 
2.43.0

