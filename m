Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C0645FFA2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925743; cv=none; b=QDqL+Xpn9VYeqjaUhYogK7OeviftbGN6eZ6XsiyU22atsMTBsQRX6M/4VJEntfhLPNJvs1xIxvEHnkFq7Wj5EG9FtFbySZ+ifQ2XP79Tl6GW9r1JjBlSmfgcMO4tLIAI9FM/qm+5WYdnK4LPv3SCwAEMqdo80+DgbsOgsZNWPsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925743; c=relaxed/simple;
	bh=zARhRtMi2uhRTcmOayb7JvR2tMW5B0FUeaEvaQDOBlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkFHDOeQOS3pAr5FetWUf7o19/hMOEV09W1t9LJqV2O9/lb+PElWkLUPmE21kXA6BzkRclV9yCVdxX+VQO4rWgniHMVipU2tsxMuRCh2Q0zU8476fO2s9KE+RACSLCtO4itglwZqdI5/94Eb7/Ebqms19w/uTd28SZM+lLw+9Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iLiS+faY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ro26rOI6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iLiS+faY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ro26rOI6"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787925740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfLbaZ9hxEJZpIRd1TSPZf7Wyc8xWeiweIAMU+tYWiY=;
	b=iLiS+faYDUx6L0UwoP8R8ZtH8H/FykqEXHZKT81c+Y9jhm3420KvCkOwcno4AzU8FZ5iq9
	B226TcV1kCiJ1Mkzus3zm84sBEfls9ZN3u4c9qd2LFwY2MMVuW2EKlwUOgMXISrVYD9eKl
	DxhzPZSUmrKgTcyeModC3Mu9iAARmHySHxgVh4khOyGQaTSzyhiP1ocTgFMX/2ZMzOmij9
	2evpQuZAha11JuANlokeJ+gIEZNYmoY9QM8Kc6bvrJNqfGOcKnV/Ca7kslqR5wFTvSey4i
	BEI9Ahh5e7t5o90GjjfrLe3fdcZ6kJsRXWhKwfUZZJn4AtcNTN9uRoMCdDz6yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787925740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfLbaZ9hxEJZpIRd1TSPZf7Wyc8xWeiweIAMU+tYWiY=;
	b=Ro26rOI6CRyd/cunhiN/5tVzCxwc0S3hX5gOSmy0avHPYFCwRYC/FkYKVOC0eu0pnIQhgk
	46u0Rh4LUsktKQCQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH printk v2 1/2] printk/nbcon: Flush nbcon_irq_work in nbcon_free()
Date: Fri, 28 Aug 2026 16:08:08 +0206
Message-ID: <20260828140218.232439-2-john.ogness@linutronix.de>
In-Reply-To: <20260828140218.232439-1-john.ogness@linutronix.de>
References: <20260828140218.232439-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure any pending nbcon_irq_work is flushed before allowing the
console to be recycled.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/nbcon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index a5921a84a80ed..218b1922a58de 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1849,6 +1849,8 @@ void nbcon_free(struct console *con)
 			printk_kthreads_running = false;
 	}
 
+	irq_work_sync(&con->irq_work);
+
 	nbcon_state_set(con, &state);
 
 	/* Boot consoles share global printk buffers. */
-- 
2.47.3

