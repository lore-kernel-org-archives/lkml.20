Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508740;
	b=cfrVz+CQhf7YMtlbzf2Fo8dpi6FOoHRKWvy9OXk11mntW999dr+0mUCM82BQg+BuaWge
	 KuJQUmpI1s36QL3vupI6uct2MF5M5WjJRLUgtnfu+1MWpceprbM8CzL5iVkVZTIBQ8hsP
	 WnC62KanbtRHWnS+vzOQLDiJbYKocDINNCEJMH5WhdHbIEfNhJ6Oxw6tob7o9y4FxWrXQ
	 riJmYsjpQNIGqEJY/SVQPOTEXctTn29Y35Ak67ei9SGiLPnMcekOFVxpxdKe+vGKpPqEQ
	 T3/W+k3W4h3lwZLvMO4UyiXshDErGbh0EOqleEBBtgfywRpwb/N3EnLQZ9EG94/4cWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8znbwtg9HjW2zeICa39b4bJRE7uID6ay9xCAZoXxhNI=;
	b=ZL8/MnwvNuN+rvWdCQHMTZTKI/NwF5UJrJH1lA6OYAksE5EvsRNE3bnosY3QkVCE2Tg/
	 nISuoqJAPnAs6/Lk04Ox1q959QXOtT0eiS2A879afdobrCHo0liWsOoEnLYs9Z15XqyRC
	 JGGOLZpY3/IcEz8votiaLWX5CtX0gaiT7ZJMzNjmdiOdDefe9DywlQVO/2mdkHkADjrSr
	 KOZaeurAVuA+igfXBCpLeA9PLCnDHK5juLRQDS50wcAgDJ+8QBVVMKUL/4KjH1ipTkASG
	 gXn1rJDIyNvTK7zRq3ByHPjbkvqpEORJR52bXmX60SX42NgoCpVq+sDonULqOhGdfdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F0rwEhzA;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D76B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D76B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F0rwEhzA
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-355724d032fso409270eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792508739; x=1793113539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8znbwtg9HjW2zeICa39b4bJRE7uID6ay9xCAZoXxhNI=;
        b=F0rwEhzA8aaJT/L5J9TVeIChhedlGZyVGRUxPWOtTZKd4lerIsu6xZFdCYEXp3vcfJ
         71aYU3NO3KcUG5fuA1nX5k1U0rDxgZ8/eS3ASPjhoGGn/Sy2F9mYctdCqsxlFC//o4gl
         OGacQePBxY0fD3MLoV2hoBptUGc8tlfKu2MjIlg34UQKdYSmuq+cY0i+VmJUBU4BlOYs
         qUSdZg825gzy9gmr8vYCWBrAP7ZPAVPdpNaZgwUtptntX6Ku8rtWx7IikTqyIeM+fvkO
         J0shZHiiuLEgDQPXOD5creDbO/ub3dPdnOmMpmnvxOonzBGRbyiKNhrmCEUGF0ZnHgde
         rL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508739; x=1793113539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8znbwtg9HjW2zeICa39b4bJRE7uID6ay9xCAZoXxhNI=;
        b=mNIvaaSupC8QeGExFW35jwfwMCG4PWko3QocwqhrcvtTB+NDheYuVJ1VIVZMTi4FdJ
         c5R09xsi9Tv+OyasBslepqQSFxn39+YeU/C9tfIRGe21qv1vAdyl/8gHMeB5+OQdzn0W
         mCj/Fv49GgpM5rmZHGgYWGqog+aDRJ9rOU4e5aOrle77mLSn0+qcLm0Z0iRZm6GGwc7h
         GPASch+vupsUqiqd6vA5ZHkEQWH+toRfsPd/mpC2nxrJw1nIB6JZB2OlBHkXl5ef6olY
         dUNR6nJrf9qE3oBxC2/nBOCl+RinuS3gtp71ua5JCREX0VNKr/Afjf6YXrNxbKkF3hk+
         6JOg==
X-Forwarded-Encrypted: i=1; AKwUvBy8rGjvJKzJGsTGQlFV8Tb46tX+G6VMHfENE8wCkM9URG3swStC9SoPCb1uNetEt7h9OT4WPJBzKcZgfcs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUIbaxUb3sYhZKJ0iWqeM4r+yrECMXv0nMJQAoElHDdfk8g8ZP
	7+PG1oWxKk+vqpnqNZTeU0WdEIlL6GuMMddykh8O5pqpq92jIXt7sSQC
X-Gm-Gg: AYBFou0OLhb90VPGpirOpgMr4I9fwDf/cP2jFWyyPPTc0K7ChNTPGNklkSlk+kDMb9g
	4adqPdFlu8QkZbxRQMGGquS6hsU/zBFXB5i21A+3nAxlxkNh6IWA9rqxg7ZRmuiq5KahilUSxn8
	kbMXcVkoEbNSTHa6axCJOOepqGphm2e6ipeTNLbPBMjd0og0cVq48KhMmv7P0EUufxN4Ieaqbhf
	/Uvzr0kZQUnfpAyPzOWHR1Uw2+6J8uOh37a864wb+D5ni4qtBkwgG89q+k9qad8I6oZnzEJ5C7R
	YTrJkbIQB1bBETjzMkyxOydS97zEfpv1n0ZY0aYyjc0TASu19AYhNTdR2plIjXcSA7I5LaWavNf
	P2J26DbCOOpUtJile3t6eoPYVzCv1REw6KDCx59KN/QHPruS0ENm7qmaZp5a9yvABv1J/v98961
	bYrzUPrvn10UDfcUOZ4ykhZvKT0e6ax5FiqCu1KlbPQkQ1PnIvPTRGA8ga7D3YxzehrgBw2lak/
	1Bz8WRdK+E=
X-Received: by 2002:a05:7301:da84:b0:351:7e15:9c59 with SMTP id 5a478bee46e88-3619b30919emr24107862eec.0.1792508739165;
        Tue, 20 Oct 2026 08:05:39 -0700 (PDT)
Received: from subhobhai943.. ([2409:40e1:7:197e:d6f5:c443:63e9:fc37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm42494269eec.4.2026.10.20.08.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:05:38 -0700 (PDT)
From: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Subhadip Sarkar <sarkarsubhadip604@gmail.com>
Subject: [PATCH v1] docs: admin-guide: Fix typo in kernel-parameters.txt
Date: Tue, 20 Oct 2026 20:35:30 +0530
Message-ID: <20261020150530.15291-1-sarkarsubhadip604@gmail.com>
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

Fix a spelling mistake in the rcutorture.stall_only parameter
description by changing to "applications".

Signed-off-by: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f4e..f5263eaf8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6249,7 +6249,7 @@ Kernel parameters
 	rcutorture.stall_only= [KNL]
 			Shut off all rcutorture kthreads other than the
 			RCU CPU stall-warning test kthreads.  The purpose
-			of this is to test production applictions'
+			of this is to test production applications'
 			reactions to CPU stalls, and with minimal
 			additional overhead.  Or you can omit the
 			stall-warning tests as well and get a heavy
-- 
2.43.0

