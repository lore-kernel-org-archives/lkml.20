Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519876;
	b=Cv0CLj6qHrmEZXTF7qQvzW4i/v6pv4C6q3bC9auSV01TaHHKT26DmqA7/PM68K3LRmlP
	 fTyPEmTfqd1X3UJ2uELMlCwhQq4sbegk1wVhBbwkx7OWgqaxY/3IMWLqHRrI7eDMHT1gZ
	 y1cOYAP0UJnOK/Mtra03wgYttnQKLuF3dihCtUy8Hbb6VwU39Mh712od8MQtlnxEwzCYZ
	 xmQHj9WqeF41bFM0RLFFKSWBSQsS282SmP0iNTdPozsgqlKkClcJW1ckl3FfYLGQbddsI
	 c12naxUopZON5sfcK1YZUMfVUgKCNkDo84eZCDEPl8th3f78/Sm6LorUn8R2tOfI9mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pe7zRQqq8DiaqBGD+rWVGO//vsZ4iJBToLUfyGdHZkM=;
	b=WJR4OGDA5EoXySiw+RtWkCTotFf8S6Pc4OT1lzKHw8g+iusD8OaPrdt1k8u2GbBKSm4T
	 fs5ULKG0W1YmbkWxDMMelRnhTdLiaQg+4B4NNblI8XDKa0FeMoZiAsJzSNH5340i3fWys
	 hdLtmAks/DRxP2bacAjNmtkhQPPZFfkxWFchnkd4rcarlmZvL65YRTRDkgARQLDCPueU/
	 HKM6eYjDjUkVTB8JIGbbdskBnFzB0q9vXdYuQuV4PIZf0uYXqeD1UbiSTWXJ2Dgn/g0Yu
	 VjxJNC7+tgvH4i5Lcit8vGi9dHFEj8Lb5Tuw/UbVKW7NMEXn9mi/uCgzh0M7YmULJOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jwkud6FH;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B61D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jwkud6FH
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2576661f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519875; x=1793124675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pe7zRQqq8DiaqBGD+rWVGO//vsZ4iJBToLUfyGdHZkM=;
        b=Jwkud6FHUDrWtcml5AH1PpozqSEmpiPc9Sn4mP+h37kRFLl6C3sGLfqbXTRVUULGXt
         mM0FBxHPH6PSgMBxzJE4ksMcZsgUdQkBECHZ/g/fXelnjJS+0Z3cHuIHZjQ91MoNUIoN
         MpfUignn2fHOyaXBeri0sFe1rIqLdIn5Wugl2reOE5fXMIdAuCqRJx43Dff+b95Wjoa4
         wjJmV2wpIOyrEmfkR6rNC+JUvM7TI9uSG/p+X6zhDk+I6jiVl3INyM35KAqB7kU+7xaK
         dwKpu9zLugABB8mgRVF7qdaVH4Vod2lwwGC61or/pdUY2MY04TXSS2t92K62/jQ4pg0L
         vCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519875; x=1793124675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pe7zRQqq8DiaqBGD+rWVGO//vsZ4iJBToLUfyGdHZkM=;
        b=ewLhEEQ/FTMPUVwLYDH6GD+ASU4zlufDSW3Gccy2wilvBONaD0DSMSWXo+IX/T/k6Y
         dlN8Z/SciiOk3//GfHAQsHz9803fBnL6Uc03uQErNlFMXyPTr3rQtbYo8l/XVk/oTv2S
         kAvRwgwRqMSU7V+R9t9zGdAlyKS6uTbOwwZsgfCN6Vswv9kNFGOonw5+YKiWlIw/cyrw
         CZvwfAcpVpFRkdFOZZOIo16NmYn4kaFR1EnA5OLZ5IHFIVxpRh99dBD7vLDPdWDoixzF
         kNJ1xCdvr56D2d5mu9eS5ORSRwUmaW0c2gVjtzS1/KjkzXORHI0ZhQdqpzvCOLaAx+2h
         hGjQ==
X-Forwarded-Encrypted: i=1; AKwUvByFXG9OoZcdiJ1+wDGNhtoJO7kAMXNobgzdhFAyAE0cpr6EQR7g/niV4TgErkT6JHR34K5TbXQ63KZtgGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRx8yLthMgRoLay8HqQPgYDw95pABWvd36EkSXwy5u4M0YVeTt
	o5IWAUVrQeWtCKBeC8K9Bo3s3QeqlmRzsbMKEls5FvnvRbgDob6Fsp/a
X-Gm-Gg: AYBFou1sx5+HAvSY5tM0SDQuAN5zKqgDppTENG3E0iRS7+6q94i/OhCxLDhc+Hj8SKR
	IcTpzTDVP+aGD9nu/ZEfK7S0R5FIWv4H5HYRWCL9mKU0M94FIgE4j5k7WUW2pdQcvPBbZafhqf3
	xJaUSbxihnCX4y7ZbfrOGidCJer6sBD7ysqlIJk2ntXtD8c2lQn6voOrMfNhKoOWtRgw3JANLK6
	iHG8ziYZBJsOw7eJ4nPS853p86tp1cH3zFQeKRhGWCgZYKX1qR2dqygastBcze2eKnkiJiIXKAw
	kEZjvDBIaTxpTIp+MMhA0KeRXwB0ZNDMdc/LMCcFAtRtO9bLgYLjPRjlkHa1kt1YnaMbLm4OWjT
	ikhv15cBV26lPO+jBsPsEcQ71HV7tT0ebCau5vgnt0bodcX7zbqEgFgn7lSQK8Z8efc2zczAVMU
	HSp+DStiWzG3Y2dtnq9mgToWBdAL3tcYbsm7RMS/hbVO7XDaCAd+1MNci3eJdJWM4lPQ1sttQi3
	iVh+J0CTWlYruA=
X-Received: by 2002:a5d:5f47:0:b0:48e:bf0:35c with SMTP id ffacd0b85a97d-48e0bf00821mr22139283f8f.13.1792519874750;
        Tue, 20 Oct 2026 11:11:14 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:48b3:351b:a629:512f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cbfsm48367f8f.23.2026.10.20.11.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:11:10 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] signal: skip blocked signals in dequeue_synchronous_signal()
Date: Tue, 20 Oct 2026 21:11:01 +0300
Message-ID: <20261020181101.1605736-1-thnkslprpt@gmail.com>
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

dequeue_synchronous_signal() checks whether an unblocked
synchronous signal is pending, but its queue scan can select a
different blocked entry with a positive si_code. This can deliver
a signal while it is still blocked.

Check the blocked mask for each queued entry. Forced faults
are unblocked when necessary by force_sig_info_to_task(), and the
existing pending bookkeeping is unchanged.

Fixes: 7146db3317c6 ("signal: Better detection of synchronous signals")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

Reproduced by blocking SIGSEGV, queuing a positive-code SIGSEGV
with rt_tgsigqueueinfo(), then triggering an unblocked SIGTRAP.
Without the fix, SIGSEGV was delivered while still blocked.

Patched version behaved as expected.

 kernel/signal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index e433de93b430..4dcc47a7d30d 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -684,12 +684,13 @@ static int dequeue_synchronous_signal(kernel_siginfo_t *info)
 		return 0;
 
 	/*
-	 * Return the first synchronous signal in the queue.
+	 * Return the first unblocked synchronous signal in the queue.
 	 */
 	list_for_each_entry(q, &pending->list, list) {
 		/* Synchronous signals have a positive si_code */
 		if ((q->info.si_code > SI_USER) &&
-		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK)) {
+		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK) &&
+		    !sigismember(&tsk->blocked, q->info.si_signo)) {
 			sync = q;
 			goto next;
 		}

base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
-- 
2.43.0

