Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826584;
	b=YkNfJIAR0Dt1+vkuGvwQY4rN95xK6XGi3CmU1KmBp/rE+CxWyl00YanwTvRDbHFZ6RU0
	 BZOeRjDz5c11p/CSZpPtJOVKCMGYEF78BYyljcnKlbpFXf7q9zSP/res2NdG65zStOMr+
	 bBPDddgbjuLOsl6EmIFfCnOB4B6ML+y987NzGnBpvvHeKQmhDLIaHaN+oxQn51M0aJXKE
	 PZ5foSx2bzdIm3wvHzoMv/liYS3MNzVPiHYcgselfugiJ068fnnrFNQN9vIhMQVcPUx1U
	 8/RMiC511fvoz5O8I+nWxJkBxeUb3HkfNmFT/cWkr00Ve/OCMp0PcJ617tlBVdEECqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LKarLfxYEUZqeqqLWzc2n+DvjQXfdpA91g/AOtlmbp0=;
	b=C5mvqmYT8deDgwUyDS85szx/rZKgUVymkca61nwMQNlfKuMfKMrt2ZjxsyTTRPrW6msE
	 ZeR0lLIxtAkHRxx51aG1lmufbCQO5W9IU7v7heiZeOG0zivkwX6BYACaB4FG5YMn2/JR5
	 SV6fEDoSrQJfypD2YdGVbiF2TiKHe8EPvYhHncMPoKQ2KkJNtfj2GseCIQZyzCoACajNf
	 YzY5rlX7cw3xq4sC8iLXQ/afGkmHiALheKkxd3clWrvENy/ZfZ+fNifl3l1TADnPgxedz
	 gJE72YBAbt7eVApxObjvwlve8DhWatJLfWx/X5QOV8k3c5qEartElqxPJCJp4DYk3wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QU3uCnBj;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E06B607F2BB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E06B607F2BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QU3uCnBj
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1024593f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826582; x=1794431382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKarLfxYEUZqeqqLWzc2n+DvjQXfdpA91g/AOtlmbp0=;
        b=QU3uCnBji3jCmsbc6W/xxM7tCpsWe3NmctUtH8kaE62jbt09PpVLnItdbrgNkmSUCZ
         LdZ5UR8gHdHCE6qvXFxzo11SVQwDEFRIQSkRP/8oxLBKdbcN8sR1jpDOZrzjBlLdQ/7h
         2vGOGHMRVZXCODU0ykEtVGCaSmbtRh9BW6NlJLGY5OsoFU/iNPqBcyO+a8MR4WpWEDq5
         lQzSlamHimaotFJ19UUR+p5LztcA+nDaU+Z0+2pfBWz4OP4/xCGSlx3dGDEV1vOwX4nN
         jg9Zmqp6fa7L4ejxjLMMSayv37cSRyAuY32toltTTnCPvruByENzalD4H2JiSAM7hqKh
         y/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826582; x=1794431382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKarLfxYEUZqeqqLWzc2n+DvjQXfdpA91g/AOtlmbp0=;
        b=A1k+yXNFbSBWsNp+gS3gIv+KMoRINqu/oH8YfvpbaEKbFtICRL9hPWCp0Mw2dWON3C
         O4uACS31utHJt7e8CgRVYmv8qm3M5+X+KqnnAs1CeT6+fm/vr9neZULQgZ+S+cabRvXj
         /1CMuX3EMRVnm5W9A1ubMS0UapW3rzu8xOP1sotG60L9v/SSUFONDGaCYGHMV6G2boGu
         c73dWqC6CRlniD8t/UkOS9uzTKB1BMraoNGGU+N6F6QT30WCcle2GVstVhRxV0N2lJ9T
         W+qw974fHmsnFquhiLZQ0GCLgytw1uOR9s839d6ICstuDrbuGz0L+PkonZ4HYUk0fztr
         6GtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMYhSkOJxlbVE8l/y0wjBx4OlfFOG7mSU68Fhzl4x0jy9Ir02ndzEk5vus5Qi9daV2oWy4GaTu45V0aR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hFlNzl9wC6XAq2nXQsU2XWrRVujeROzf4JwIes1ituqHlLZ/f
	TuN3HQt4tUiI4+ymCgvNGzCzVFlVEIA0MB5/HZuIB5Qneo2YBFme/RqD
X-Gm-Gg: AYBFou0a8ZAt33XLFkJmcHQWK4V52I58MZ2tkl0zpoD8UpfFS0hA5nL7vekWSHT6BWH
	wPmdqURQgT4oL+d3JR9t9Dpka1hm0LsW/FtYzERyY4tl2qJsXN/WzZ+RsHq2MqvMtIPfhFALH4R
	TD5/JgRUSisb1AfXUtgWkWJBZoMgLO/9wjB1E8F4GC4ujMhTJlbgKUjvg8zOtoQXmQyVCCjESm3
	65Wc4ZUqE21gAjH5JLbHSga9vRqIC/5xt/1oe3VsYEVDjNL0aYbtRHvEbB+JN90AexaJwfBcloF
	V/DhXVD430gBOeMz0pXhwNoS72b2rSwYpNLL++03N3gTT8tQ9G9ZUlgI0otlTOg+2xorkaXTJa4
	4Nxo3eGJkdb/AJWsNwPSCAMTw4BPnvyYL3y16tmsZuEZnJkMifiLjIxZfgT7tBrk8pksazLCn+u
	AyzaYXWH7WOtxGHuPWyFCYAxsILsvpzEWAheNri2aw8n6zkKxj+YfnnOXGH1ovsGZVb+nZMQJJc
	OWdSfiaZ1h65Frz9Bdc8p11iNbUn3tnQ2MaC0SXEDyaSnvrPRdfM0/3ngYxCporW4/Kut+5XHoR
	DgMEZcW5hFxRuo8HfH1xV3i1zKT+z4aS2/ayoXc4ODPsOQRos+KL1uObwcxAcUOJMq2+x4Du8vE
	=
X-Received: by 2002:a05:6000:2204:b0:490:b23b:8017 with SMTP id ffacd0b85a97d-490b23b812bmr3010592f8f.34.1793826581845;
        Wed, 04 Nov 2026 13:09:41 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fe7189883sm6177411f8f.0.2026.11.04.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:41 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:07 +0100
Subject: [PATCH v2 21/27] selftests/landlock: Use _exit() in the
 named_pipe_ioctl child
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-21-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

In the named_pipe_ioctl test, use _exit(2) like in other places.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 1e94a3171e02..78b2bf06b6ee 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -4272,7 +4272,7 @@ TEST_F_FORK(layout1, named_pipe_ioctl)
 	if (child_pid == 0) {
 		fd = open(path, O_WRONLY);
 		close(fd);
-		exit(0);
+		_exit(0);
 	}
 
 	fd = open(path, O_RDONLY);

-- 
2.56.0

