Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668485;
	b=IECVCf9l5gilozi4/tLnvQgpGhsIl0HbLilmc7XULRZZb7BLsnPVw6yAYmCS3RHEQOg7
	 nCCsqBuR2S8vAkcbq3PtS2H/9uCLEGFFB+t3skE5WR91deEMwWXihxaEbSOKeMr4xRJDk
	 70bvHaewuBt4SX1T5DdY3KXDGeQk8TY43rnTLKxfk4IrQxJrZcuMUMEIKLMSmEjHZr/zA
	 Vq3pJ4a6CU9uXAJgbHcyh4fa9qdCUCJQP80rtDHBipY6TUvieJ5vtgn48s90HS7NtDLOR
	 L0b6MrV744O0MUZkRjnx7lpr3yHobM4bHi0S8Bx3EoRK0o45E0tQ8JJWMS5MpAOCDkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668485;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PemHAwyW+U+iybF7zh11klbOzuIEsXdauTMcn9jFZPg=;
	b=rDSuqw/5gz6WSi6RP1dtGKddSgqJIp4O+b4YDMxMJEr0tgPF/xRpwZ5Bt8LcfRkTA9l0
	 uppCwlBlgjGQmy3uHJFd8cgX/6cM+ZxXUwH3PEQdyIcY06Q4XGRt3zuE0pWMoxaCgNRSQ
	 2DVwhScz/3MJj+QSWhTmcRVMO7g59pm7oeT5t1L1/sS3pNLMvcAqTj0n9OTiwuEdzcQ8b
	 TMDdgWIQz3DAfH5+9VrsNVGkFeecv/Ywc5iz+DqtMTDSB/TMEugeGqJUXJfUl+KGFVi2r
	 1Qx/PbQhln76o3dHQd6ztd5wcUccBv3mWXIaNGFEcF0GWiTI0WY5r5Ns+vEeFyb4TJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11554606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11554606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so6882409eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:14:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668483; x=1794273283;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PemHAwyW+U+iybF7zh11klbOzuIEsXdauTMcn9jFZPg=;
        b=h+3o6uqc3RzkSeCHGxaeRswKbFRm8+xg64R9Fi8NkhlvuTpOyyWLFCSw5IW9EEL6ly
         hV701MrxM/ToYk95pql/N1c/DW9N5GKqKEFTXOg8097uMYnUNCCo/qxvHjGHNnZZX+rm
         d0YfcfbHhlSJKBqgtd4Rs3i2uy+4MrfVxzxRv7AkE/FuZUgkiQOFBoBP06RuyaLWpHuK
         YSYaSRmuQcoKPTADkabRT6RmYWCwJxd8EzVmzod2UwiCYDcC2vN0F62SAWmIxjTZf4ks
         p1eo6R2aBPNz4DD2MRPYWhr+5gZUz3bgA+rv+rd9qIpm6in33QgOO17JwVQ+wtePgqUg
         I/CA==
X-Forwarded-Encrypted: i=1; AKwUvBwFOeKa030v6BfHS7nit7X3JqUaqRk/UoBhQocv7mWYAxRpoxQDcJGwLtCs3CWYfzjo7UvE+1IEvYe8onY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ny7Ghm2BEmktKNa7r2wikJk/Mx2UllSTqbmg8p/+eV6a2PCrB
	PGLmb3U1iHPyAbYNoOjUye2uwWDnN4r6Ehm8JNKuL8fT9Cnj6REdXRsK
X-Gm-Gg: AYBFou3Il2AqKFzuu5DdxoAvrg13VTA6+WRl1X5PMTjC4GHlnP+Iqxg2F6WPuynmzyX
	k7E56Ym/YyzjeroNP0QPqqTJkp5ecNkwipl1B4YyBrV2oQ8UgSvr+Lg1MbwJpoYibnWbPh8sFMP
	RqkOAURFFd3yW3aU8vUNYhN4Cb8vE7HvdWy2JOt+xjsHRqsJ3L2VUjpYB5XWz0ur/7QRtPc03kI
	N3+C8zgPobxXXcZnVfw1G6MlSKW8B9idRzZecyYffz06E1jZoCNVdtWSyfuEuUdFuyeH3B0L7IN
	O0zeNllwK+gNSeWosfdJXfWSachwlmJcD4uchQbM5XX01SbXO6JQG6JzcvGk6IYXfaCNLTKrH7Q
	Hg/vCiR5BcOswp8iCY1AuDjad5WDBwBiCf5lFwON+pIQYtIPMOODfRTfSMlNi4s6QFHibIzGLGk
	4XJRFkF0qi2pFUdAvc6t7/llSMv3zsZAgl+tzBGT4pnlwyDeekcohHJRYDYYfGCeM+h98leE4XQ
	oSx8XeY2sVTk3JLvkmZ3pHDQag9z/jgPRuZmvPo1dMSB1GpqpyrbG0LzcTNN/GyblYneeXmpT83
	aaoSNrurFuzFP3Loy4MKs3LfTnoVdPXRQ/Rk/BcE1vs+na9wdKA3EaXeRN+GF+Lxyq3tYasG6fS
	CboYlZrndHUC28hNIaDS2wZDaldKza1cXGghCNA==
X-Received: by 2002:a05:7301:db8a:b0:36a:279:c93f with SMTP id 5a478bee46e88-36a423fda77mr17577768eec.33.1793668482843;
        Mon, 02 Nov 2026 17:14:42 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2602:294:1:b9:a2b::1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm51988583eec.1.2026.11.02.17.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:14:42 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: samuel.thibault@ens-lyon.org, speakup@linux-speakup.org,
 linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, chris@the-brannons.com, kirk@reisers.ca,
 w.d.hubbs@gmail.com, stable@vger.kernel.org
Subject: [PATCH v3 1/4] speakup: Stop catch_up when the synth is not alive
Date: Tue, 03 Nov 2026 09:14:39 +0800
Message-ID: <179366847964.70545.6676783028105686328@kylinos.cn>
In-Reply-To: <179366847311.70545.1738521378158835923@kylinos.cn>
References: <179366847311.70545.1738521378158835923@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

When the synth output cannot make progress, the catch-up loop in
_spk_do_catch_up() (and its local copies in the serial synth drivers)
can spin forever: nothing tells it that the synth is dead.  This
happens when the tty write keeps returning 0 because nothing consumes
the data (e.g. a serial port with no device attached), or when an I/O
error deactivates the synth and the loop never notices that
synth->alive became 0.

While speakup_thread() holds spk_mutex across the loop, any
synth_add(), synth_remove() or synth_init() then blocks forever,
reported as a hung task on module unload:

 mutex_lock+0x54/0x68
 synth_remove+0x28/0xb8 [speakup]
 _spk_do_catch_up+... [speakup_apollo]

Check synth->alive in the loops as well, so catch_up() stops as soon
as the synth is dead.  synth_release() writes it under
speakup_info.spinlock and the I/O error paths write it without the
lock; the loops only need to eventually observe the change.

On its own this fixes the I/O error case, where the synth is already
deactivated when the loop retries.  In the no-room case nothing
clears synth->alive and speakup_thread() still holds spk_mutex
across the loop; the follow-up patch completes the fix by clearing
synth->alive from synth_release() and by dropping spk_mutex from the
catch_up() call.

Fixes: 2067fd92d75b6 ("staging/speakup: Move out of staging")
Cc: stable@vger.kernel.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/accessibility/speakup/speakup_acntpc.c | 4 ++++
 drivers/accessibility/speakup/speakup_apollo.c | 4 ++++
 drivers/accessibility/speakup/speakup_decext.c | 4 ++++
 drivers/accessibility/speakup/speakup_decpc.c  | 4 ++++
 drivers/accessibility/speakup/speakup_dectlk.c | 4 ++++
 drivers/accessibility/speakup/speakup_dtlk.c   | 4 ++++
 drivers/accessibility/speakup/speakup_keypc.c  | 4 ++++
 drivers/accessibility/speakup/synth.c          | 4 ++++
 8 files changed, 32 insertions(+)

diff --git a/drivers/accessibility/speakup/speakup_acntpc.c b/drivers/accessi=
bility/speakup/speakup_acntpc.c
index a27e6bbf05da..fe19ba3f0005 100644
--- a/drivers/accessibility/speakup/speakup_acntpc.c
+++ b/drivers/accessibility/speakup/speakup_acntpc.c
@@ -192,6 +192,10 @@ static void do_catch_up(struct spk_synth *synth)
 	jiff_max =3D jiffies + jiffy_delta_val;
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_apollo.c b/drivers/accessi=
bility/speakup/speakup_apollo.c
index d2fbb3f57221..b62696e050fc 100644
--- a/drivers/accessibility/speakup/speakup_apollo.c
+++ b/drivers/accessibility/speakup/speakup_apollo.c
@@ -157,6 +157,10 @@ static void do_catch_up(struct spk_synth *synth)
=20
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		jiffy_delta_val =3D jiffy_delta->u.n.value;
 		full_time_val =3D full_time->u.n.value;
 		delay_time_val =3D delay_time->u.n.value;
diff --git a/drivers/accessibility/speakup/speakup_decext.c b/drivers/accessi=
bility/speakup/speakup_decext.c
index 271bcf279bf9..e6be5a99670b 100644
--- a/drivers/accessibility/speakup/speakup_decext.c
+++ b/drivers/accessibility/speakup/speakup_decext.c
@@ -171,6 +171,10 @@ static void do_catch_up(struct spk_synth *synth)
=20
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_decpc.c b/drivers/accessib=
ility/speakup/speakup_decpc.c
index 1bf36d1e5477..cfafd9475963 100644
--- a/drivers/accessibility/speakup/speakup_decpc.c
+++ b/drivers/accessibility/speakup/speakup_decpc.c
@@ -391,6 +391,10 @@ static void do_catch_up(struct spk_synth *synth)
=20
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_dectlk.c b/drivers/accessi=
bility/speakup/speakup_dectlk.c
index 56334405d865..d9247c53d327 100644
--- a/drivers/accessibility/speakup/speakup_dectlk.c
+++ b/drivers/accessibility/speakup/speakup_dectlk.c
@@ -246,6 +246,10 @@ static void do_catch_up(struct spk_synth *synth)
 		spin_unlock_irqrestore(&flush_lock, flags);
=20
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_dtlk.c b/drivers/accessibi=
lity/speakup/speakup_dtlk.c
index fa826568937b..73cd39e781b8 100644
--- a/drivers/accessibility/speakup/speakup_dtlk.c
+++ b/drivers/accessibility/speakup/speakup_dtlk.c
@@ -206,6 +206,10 @@ static void do_catch_up(struct spk_synth *synth)
 	jiff_max =3D jiffies + jiffy_delta_val;
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/speakup_keypc.c b/drivers/accessib=
ility/speakup/speakup_keypc.c
index 9356f6379560..e229009107f7 100644
--- a/drivers/accessibility/speakup/speakup_keypc.c
+++ b/drivers/accessibility/speakup/speakup_keypc.c
@@ -193,6 +193,10 @@ static void do_catch_up(struct spk_synth *synth)
 	jiff_max =3D jiffies + jiffy_delta_val;
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
diff --git a/drivers/accessibility/speakup/synth.c b/drivers/accessibility/sp=
eakup/synth.c
index 11cba1fd8715..6a49ff475c16 100644
--- a/drivers/accessibility/speakup/synth.c
+++ b/drivers/accessibility/speakup/synth.c
@@ -75,6 +75,10 @@ static void _spk_do_catch_up(struct spk_synth *synth, int =
unicode)
 	jiff_max =3D jiffies + jiffy_delta_val;
 	while (!kthread_should_stop()) {
 		spin_lock_irqsave(&speakup_info.spinlock, flags);
+		if (!synth->alive) {
+			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+			break;
+		}
 		if (speakup_info.flushing) {
 			speakup_info.flushing =3D 0;
 			spin_unlock_irqrestore(&speakup_info.spinlock, flags);
--=20
2.32.0

