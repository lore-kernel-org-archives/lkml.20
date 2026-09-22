Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE21654EEA2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081904; cv=none; b=lTXkr7qhbFQtMATyy7rOebvkuqFqGTAdG9hcflYoTkZQPRVdri7ZVgR4PbtWrCQXEQoeB+zPG0UDLwwQeoLDm9Xpc9EWioFWvYt620ftYzk48J+rXIDSWGCgzCF3dYC9TsZr/penvpqlm+EeKr7i+2HI2LmxOsXAM4VL3l2aCZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081904; c=relaxed/simple;
	bh=qwxY7Xchr2weO6MXwf7UPPLqsaoih4agFYYO7kP73Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBc9wpqIdEdu5r41DR/F2XtKv5Cjpq3l008aktBZeNivDomqvLih6Y03Br8+JeQKuOw1ufSU5NTqOJDohQUrifWwuQ3R3sJ8Cp0H7GG2VYVfhy9uPqkDcyhHiH6ItZiDtZVscNmQs7akeV3eRy8os0bYRxWjLwAYe7eqD8Y2B7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmCs24ww; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmCs24ww"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d7aso5721571e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790081899; x=1790686699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRRmEx1q2mbxQzld4Wdzku5SEkqIbjlSMQKlnOePUlY=;
        b=jmCs24wwSNln/YG73fZm1DtWW1LNWj6r/PjJl6inoAgsE7SkEQxu03wjTKB32SpIsT
         OnPbyCNtfIWP/fU+U7eRYhjEJV0Uew3zyUeWt8uvqDkch0mfKAvHwQGRRin0VbsSeq+t
         uWTtnVEY817YGqQnIPhEmtbgkY3BMZXZc4LkD6FtINW8qOPZ09+qSPRu8aD/NDIs51cO
         RydkkyY2Cil5yFikNS4aj0Mjtfq3kjJpMOO3wH+3nkbM/FvoZkH4cBOF4ZZ0BR3/iHat
         im4B2/9etdnFxmQLkMvh1/VFQV01zyyeZvSw0t5WUuQaRT5dKt4HUSon/IXWs/urpoYu
         wnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081899; x=1790686699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRRmEx1q2mbxQzld4Wdzku5SEkqIbjlSMQKlnOePUlY=;
        b=yVYNCpGk6+nVth1dfmYtctZpTd1g9k+BUuyoX6dRFfJ9/f9PXqEww8r5sNtGKAjKgd
         0iRDW/DSTezyqyNxcWqLPNsKj0BQ5xdgmMXrhMuZ0/DY5l0Rx3nusEjWq6nnKmaq3zhr
         TVGTcBZRrLxEhU89A9PeoVH0syTONTogGejIxxsJpujC/5DUUPYUqVfBLixDYpE9B7B4
         JR769Ih8W3OMQxWjRVBQLfniZp3xRSsUD28L2el2Wj5813MD5JRGsB8N6l5ccPMcifVx
         s9LGGKy72m57PwCPB8LuSG6xAjH52/kW3gJxlqvreWKB1ZG/mJU4T21QJRYvLn+V7Vb5
         4DNA==
X-Forwarded-Encrypted: i=1; AKwUvByT45LVLUVnQJUi3aEJLr09Jg/4XBFepdf3pt1+ArFyeux0SDjr29dppdfqPl5RB0/gfTmJJD07IKaBBa4=@vger.kernel.org
X-Gm-Message-State: AFuF++mvZjwiCWiNKAPhrSVZ6rl2c1kpdi6y5Lpqbs6LdPWEEo3fJDRz
	XHz7oFmgnNTA2BKVuImHtDTTiUzEYxthDleMHtwZcaLXaW4vj1eTpq4pLkjg9zgv
X-Gm-Gg: AYBFou3jA4MJGXG2AnQmZLI2L/+3bDQWeQCjh6uYGbdC1WFBHTZ3u3KpRF7yCLmf8aZ
	QUlA4u+ourCX5ayryFZ7dQewCP3GG9wfPF72GikvLT3HaVVJxZJ+v59tJacd89KkaeXNIJ2ltaR
	gF+M0KeXF48h13H+CxAegbwG4CyJjidncZFtPtWmjmUYyJDaBbcaRDplfdmKvgd/FDj/GVMRuW4
	P93HB7SREgrK4Ck2q371EC1VVohT2Ye0kQF2H4LoyKRIRsn913xiGryCLUTzGCXS7fZhjKD/dga
	YblwOC0yY2P07dU5fzhHUUmelpI/0yZIt7Ivgp4NycFikxQ/xHHXsA9byqEDzqF1Xbk6ozfB5Fi
	X29KYXvKMtAM/AlN7jnSbi9wD0eE3FERqTaA+AF5KmN/FpqpJNBXLhMLisvPb8W5CCIiWbVZcZN
	yIubxjnjgj1M+VgKMiHaA5wpMeXtvteiwpUpTZSJca2vc9vjhYoVWG3BF0BUiQXnAMXLSTT1BH9
	sG17dMlxmrsCtTd
X-Received: by 2002:a05:6512:3d1b:b0:5b5:fae5:b241 with SMTP id 2adb3069b0e04-5b8c17f5da4mr4001423e87.14.1790081899220;
        Tue, 22 Sep 2026 05:58:19 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46ed384sm461753e87.75.2026.09.22.05.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:18 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io
Cc: magiclinan@didiglobal.com,
	xiao@kernel.org,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>,
	syzbot+270624bb31d478afe62e@syzkaller.appspotmail.com
Subject: [PATCH] md/raid5: fix NULL pointer dereference in raid5_has_ppl
Date: Tue, 22 Sep 2026 15:54:17 +0300
Message-ID: <20260922125418.2715-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check if conf->mddev is non-NULL in raid5_has_ppl() before testing flags to
prevent a KASAN null-ptr-deref during free_conf() cleanup paths.

Reported-by: syzbot+270624bb31d478afe62e@syzkaller.appspotmail.com
Tested-by: syzbot+270624bb31d478afe62e@syzkaller.appspotmail.com
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/md/raid5-log.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/raid5-log.h b/drivers/md/raid5-log.h
index c8332502669e..5a144051b142 100644
--- a/drivers/md/raid5-log.h
+++ b/drivers/md/raid5-log.h
@@ -51,7 +51,7 @@ static inline bool raid5_has_log(struct r5conf *conf)
 
 static inline bool raid5_has_ppl(struct r5conf *conf)
 {
-	return test_bit(MD_HAS_PPL, &conf->mddev->flags);
+	return conf->mddev && test_bit(MD_HAS_PPL, &conf->mddev->flags);
 }
 
 static inline int log_stripe(struct stripe_head *sh, struct stripe_head_state *s)
-- 
2.47.3

