Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985740;
	b=Y3kBaapyXDkO+i4W+yw7ZwImNM0lH5YjRfEn/s0OQQXcYH1AqZTKoe7Q7aP1QgUuFs4c
	 kLOviLoj+XvRg9QsDOr8c+jmEcgiriG+WFXG6Tcbij7nfzCM1Aaknani61xhzDbL/Jczs
	 JdS7gM2zZVmNoJnSUKXOWWQKrl9hBog26y7tomgOwFDOsc4ArfpsAZVSqWxEfXgnVitAc
	 to8fHqUE5kSwNt7edD2XdemuvBZWQnehbSuV9gejAg/12XbX0AKfckuJR910B2vVxE7tK
	 99LWnUJsp0iqIZryNZvJsvwWilkK8k+CI3aHSA5zBWpWx8VbwRe5eWm+dcB5Xzz7cYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XXKcqZDk+pXy0MzkP8tHfD/BYEj0adOZiSt1qNjNBeo=;
	b=s7mRt7b4jAcIarHrJ/+YoV1k7Pid/mmHps+PcdTdiKfL4UJMfJIMOwehIo6hYsnd/zjt
	 OUHek72T0lzr3/MJpc2P1KW2Lbn8NxRZyU1FNqpd+E/+r3D9FnZZTUPVBMUjiXAIIDrKD
	 aOvUkYcdw/eqdCShjsbRs8dg2iDuN9+0c4k5eeQnRHf2CKw3E6/aTO0fejXv+Y9W0OItN
	 4+UShBoA9iWtfcOrK+lr4jo976hk1PV9o+O0CjRK9Rz+KzOBtA62XX+zBBFg/DAboUPLW
	 Vh95z9b+PmtRe1k6LNBQco62h+yHqN1BUeOovyjvtZ1y/noYLwLmpEaPjFD+Gs0XcTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=c8MXAu8a;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640D6606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 640D6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=c8MXAu8a
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so8796145e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985738; x=1794590538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXKcqZDk+pXy0MzkP8tHfD/BYEj0adOZiSt1qNjNBeo=;
        b=c8MXAu8as/CQXCrSZTqPDbb/XH2rz0FMiVpmY2hDYwBwIJOKTreV6k3XbR1b8pypQ2
         jhoKaJHuTsWGkjxtT7qTK27WFO/HToOjxL04DZtiH6jeDzwJCVtp0TBa2+K4sW2Q5jhT
         TSqQKqVb6srTUAT+gD4EDEGzcURguRuEtQN+dsAoboN/QVb7v8EX/Gf9dkJK6bYkmK+i
         /BWeiGoa+Ab5v+W3gJGEj18yt+k1qFOjTvwukF0gaawmh+q5CONfoIqHg6uH4SBJG+06
         k36OogZHk0g7lqBJId415AoB6KyWNo6Uj7erFYQWbjj7gBcJZzA3LjUkMbscqgJ7dbOt
         IHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985738; x=1794590538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XXKcqZDk+pXy0MzkP8tHfD/BYEj0adOZiSt1qNjNBeo=;
        b=RtK0al+ONN3LaJdLAK/ogpOEJTQ1PSKWpj0jGZg/SfkYY11WzSwkz9qTnERU5qeC7L
         WmwaoAHXpcRZFRXakXf9qkM8ia+avoTxVCcxLjndQiLzX5SKXy9M3ycG2/6J0RKyuR+9
         oHK6km95rKWZXG0dlTWa9tSF+E3aje04r4LoPBQrDLxavV7WD4eiWK5M2ZRSj7Dkzt9y
         iE2LRIPcmuDur5WrQmIpxOpeziYCUoMPIakHiovaWmoO65D9YKrR45prpcAt+KdQVB+w
         dyFkMDWDHWpgtyHasyf6Zhn5zd7J1sb/z5tqYD24gw7yS97lzBReXCCEXdMAjj2boQed
         lzhA==
X-Forwarded-Encrypted: i=1; AKwUvBxlEcXqVikudf/7weg4ZpCHCLmN04m29OArSfjNuF3h++kWm09frjJIQ3zBurFG9ZyBxnSmxX32T6SJz8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/omsxEoGV4npu8xpLokcOzX1C6SKK61p+qze0gjabNofOyi2pv
	Hu3LvQdD7UkpBsfwlI7bj6fq+6YGNw7jTEdoopiKABD/0VYl7xzuywNxClba27LkPOs=
X-Gm-Gg: AYBFou3QvAYE6ua2DiKB/b7ccWxSkLMC0N6Ss0sDqvtG3Wo+Y6KxdZx4TZQAwrofw73
	fy7eszF/073Us6S75HrRNDpRvPlC8OQ2fr6j9JY9ZWIK+WjKOxx7u158NNbzbMbAMUKmp9LyyGK
	GYewfWJr3tAB0PtOxu5rVKsp59TYHpmHMySVtjZ3xG80AUtaYSZ4aIZJtN1Bub4+ElEVJSzDYTI
	O/A/FEph+4SSyNzRBi59K3hLrGDQSJpNn+w7vR1dvuRrDvOu04eF9J/eSrGmemZQEan9KGko8Z8
	+bIOU6hnyJ66Jrs7xvEc8mwIHkLP11JXERQn02RDZOV2wHJApSWxZQ8gmAPwq/PlTjtqnEICJEJ
	W1W/NdeKMgYEvHkqBjjZgvCYWZCilZJskkDg6w8nSAgj9LfGxrOibswqJ3XJjNEeSquF3y8xThd
	xbbRjurWASauZl8LfkMtbiqXl4qg+73KfdRHGqR7t8+D6hwy+rRa5lfIhZuh/Qz1yH9V3y5SpGh
	J4sNiGyKHfNhgNuHc031A9OYJ+bftBC090MO1BfXuWifW0qEHGEmGGii7QPFx4cplCmypKCVJmL
	YsJwVzIBXyCCJbHec0cLII5UEzEOspI=
X-Received: by 2002:a05:600c:19d3:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4b6e0269264mr56193085e9.33.1793985737841;
        Fri, 06 Nov 2026 09:22:17 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6187sm4738510f8f.46.2026.11.06.09.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:22:17 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v6 10/16] printk: Allow to debug misuse of add_or_update_preferred_console()
Date: Fri,  6 Nov 2026 18:19:46 +0100
Message-ID: <20261106171952.207909-11-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106171952.207909-1-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
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

__add_preferred_console() should always be called only when either @name
or @devname is defined. Allow to debug the case when they are misused.

Use WARN_ON() because it is rather an implementation problem, it should
never happen. Also the consoles are typically added during boot so this
should not panic a running system even when panic_on_warn is enabled.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 1eb542a321a5..49c5624eede0 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2585,7 +2585,7 @@ static int add_or_update_preferred_console(unsigned int i,
 
 	pc = &preferred_consoles[i];
 
-	if (!name && !devname)
+	if (WARN_ON(!name && !devname))
 		return -EINVAL;
 
 	if ((name && !name[0]) || (devname && !devname[0])) {
-- 
2.56.0

