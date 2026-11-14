Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654387;
	b=a3t+DHkVOGRI92CQjbAi1q4EoWjSTEp7QRORySTsOFVaGO8z83CDOCdv+3TTNeSqqRWa
	 bVlDAwh6TsVptxwScmGDGbS2P/jrMs0+BnNVSZ6ctF5vBTTDd01X9rNKcLtMNLEFDBih8
	 6CJdptdf8CUnDJH/AO7ylDEfeQ13sPqv6M5j2t2Ijhgvku8IU6LKe7gLvDx8B5AM4ak8j
	 7BQceBpjYNhhHsreWyBg+5Y6GtZLkI2S+CAlJ5VOO9EDjtY7t69CKOdH+M1wfQduIxe2W
	 JROtj89r2BKHzEHFuHzBA9AWFW3ajFdXxoiXtJ3RoNU6ltoaFg0JQmtQ7f7AOO1q6zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654387;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=3TJsO1c6i6qRWo9XIWzztf8Qe/qn5kjQjnDvYcZnLyI=;
	b=zmJkZkpCsIwYLyB4lmJQJjAk5ONelLYPvSQZEGyJq9mOZPUXxsczxAGFrbgSRPm5Aads
	 OjFHWVUa5wcvaYW3bsbFTS1cl1mhGxjAkQmksiKPiqqtRF59uw0hrVyPGXdMX+7Xmpafz
	 05zN4teCA8vnhscCpr96/Rr7qrvJjFvVA26axcStIZjT8i7S5QGt/LHNIdRSWo1A7ZDFo
	 usvqWxUuOOE8RjNuHYnv0MOs2Ne4AtxU4R8iOYaA3Af4DamH6wtiI8VtmgTO2efHEnQ6N
	 bGxENAw6fRax3mX6/7l1yL8+k+NCVmwUpWlUFPZLwpRTTJ0irV0QS1YvGHezDTrhb+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+XfOTmZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE252606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+XfOTmZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82761F000C4;
	Sat, 14 Nov 2026 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794654387;
	bh=3TJsO1c6i6qRWo9XIWzztf8Qe/qn5kjQjnDvYcZnLyI=;
	h=From:To:Cc:Subject:Date;
	b=U+XfOTmZcae3eFgB14z/89MyMTjqQhl09XHYIjBSWMIbBvxuCiJVTn8cxgOlVVZZT
	 Jiyl3kMJeebOURosQMWjqpHmg4DF2K7szICdqJPDj1hOx021lPBkW8SQGRjme/mzCA
	 J4E94dL44jOCPA/qnAt8IJ/c7zQo4O11Juo7i21dDb/aCNuUDoBjWwzFxTU/+FbCt0
	 /oK2l++05mh9Ft37UU+ee/cn1zL38xlWXDdHD+6254Thu1yIKKSJ6EA19CHEZz6fUm
	 D+cYU35SyTGqtYCiRFxLRfmoMdHS0aONbNAhCNWg818jUWNJlm8ubFBIS6egicQ6S/
	 8dBWtXqQwYFWQ==
From: Thorsten Blum <blum@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Wilson Felipe Pereira <wfelipe@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] init: Remove strlcat() and sprintf() from do_one_initcall()
Date: Sat, 14 Nov 2026 12:05:31 +0100
Message-ID: <20261114110531.26138-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682; i=blum@kernel.org; h=from:subject; bh=HssEf/X14wqhEWrCqz/c62Xd6B9OlXq7PQtWWGExo4c=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFk/HKpdjp7XWP24Pnx66IcKQTNWrg6OJGGl1e23VE9pm Kh0Rgt3lLIwiHExyIopsjyY9WOGb2lN5SaTiJ0wc1iZQIYwcHEKwER0Whj+KdrFFCdktU/MZEz+ 3D9736zy78/j11uEMVh1Vax9dCHfleGfScRGwfxfJgf/PftWbnjyYtvFC5P5+yPneO5nT9Wpr5v BAQA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

In preparation for removing strlcat() from the kernel [1], format the
warning directly in WARN(). This also removes the temporary 64-byte
buffer and the sprintf() call while preserving the warning text.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 init/main.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/init/main.c b/init/main.c
index 93a2b12976f0..430b403e0880 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1397,7 +1397,8 @@ static inline void do_trace_initcall_level(const char *level)
 int __init_or_module do_one_initcall(initcall_t fn)
 {
 	int count = preempt_count();
-	char msgbuf[64];
+	bool preempt_imbalanced;
+	bool irqs_left_disabled;
 	int ret;
 
 	if (initcall_blacklisted(fn))
@@ -1407,17 +1408,17 @@ int __init_or_module do_one_initcall(initcall_t fn)
 	ret = fn();
 	do_trace_initcall_finish(fn, ret);
 
-	msgbuf[0] = 0;
-
-	if (preempt_count() != count) {
-		sprintf(msgbuf, "preemption imbalance ");
+	preempt_imbalanced = preempt_count() != count;
+	if (preempt_imbalanced)
 		preempt_count_set(count);
-	}
-	if (irqs_disabled()) {
-		strlcat(msgbuf, "disabled interrupts ", sizeof(msgbuf));
+
+	irqs_left_disabled = irqs_disabled();
+	if (irqs_left_disabled)
 		local_irq_enable();
-	}
-	WARN(msgbuf[0], "initcall %pS returned with %s\n", fn, msgbuf);
+
+	WARN(preempt_imbalanced || irqs_left_disabled, "initcall %pS returned with %s%s\n", fn,
+	     preempt_imbalanced ? "preemption imbalance " : "",
+	     irqs_left_disabled ? "disabled interrupts " : "");
 
 	add_latent_entropy();
 	return ret;
