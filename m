Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793131752;
	b=C4bTmSpurnNGGH3V2FOSXre+FunW0QsOcsam1LCLk0h+CHu8xF6IDH0oUOL43+RB89JH
	 er8CNmMqky6EVD0EYK8/co7Wrpk3UMvrd8onyCsFP/aK8fOimD3FlT2PdaJ249PfGI4PV
	 BqYBh3gwtgD06ofhClHftQoMnTKgY+vcXGFDhEUhuzSWPserdChuoD/H6ejdd8S6V5nKq
	 BC/Ej4gXzRZtOv8+pNWlsoqol6ZNmy1cARJc3Vp5MWoQ0jxhEoV1wPSd99rILJSMXXf4I
	 0M06D5bPBPo26I09mWcpXdw2cZVB5F8h/g3rTSaXlpGAxCL8StVvgMO8onJZWdkCijg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131752;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NNg91saYaDH/iUX+L1xCWXJmWAh9RpX8ijH1Nl8Vd1A=;
	b=WGerbJY0hgY9J/EfNdN7PcwFCofRNM3ih8Rrdvaci2smn/5wzqh1reMxEae9/bCJISnG
	 c+47BYbOuqc3h+JV9o9Tl4pt8cJDnYWC0uUFLh7+igF0JmxfMT2eKJ17QHcVotyNKvExz
	 W1F48hLxGDYVNmYUQntJDUfk2/vEYvjlJop80O/HJDsKcWQOZnXwZTLb5veuxhe5wRMhe
	 Pr3Qw/GXLoS5ANnT0d/VYEn7og2z6ytR+mCpIoVv3kjFrEV8mYb0TEA4k6QaRw2nIAzH6
	 kDCBU9VJ+EzFra6h2IWpQzmfFQRNgOvkFz/6mN94ig50YRo9nVtdXTV20nU/ljbc8XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jz+thVR9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868AE606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jz+thVR9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793131752;
	b=S/KrpBJ3qE9fpaVcPW+jIv4dlh776XrKXn1WxE5c3JGZObvmRPAjHemMXIeRULqXuO76
	 Hx9CWBk28WkrNiWZohecD8CpjEQnqjiDrEP8O7veAnDYRn2HjE6/XbPuuL4XIDaL3PaSi
	 ZSWfQNEsCRLcD4aV035ZvgMUNNItWW5JxVcpoqV8833wl77TtdzJM26+EJn/212Vd0ffg
	 5LLQkrjSVccg1l+bJr4pad6vUhqvXAzeFMCiBsFLdPPh7rYe14ncrPjovND9UuZW4a+dO
	 914T9HmnQE37xAh8IsXCEQRfXkQKAyjf/4jBKF0g5xLBQhIgeNPllGMVZnGGvSnvdlA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793131752;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NNg91saYaDH/iUX+L1xCWXJmWAh9RpX8ijH1Nl8Vd1A=;
	b=Gs6Gzt2guEhIWisU5Vylne/Ugq+u6o3OyZandJvlbokLKTVvJsr5Rl3Ij/H6YKC8RGrg
	 h9fUx2lhif2QGfTabRmJlZvYEd9VpIJNNlrhkKf0TbIWj9MwaqY0reIm9Nrh/+qulIMFg
	 jFp6wTw26jm7o0mfgc/fzyqwQ5Lhy85OOTEWy/F0bJpy62MOk6S6BjBFD5A5cJdonEewl
	 64Nk87r1vo6xtt69UkjaSd4IQO/VbyneqVI88Ofwmfj57WDiRZvV0YHSAFBYchYaDQ2Ct
	 LtL6zWyVj3NaVVHmbtNZv6xQpjOnIUn41gj4UAQ/9BXPvGwj5vHWDf8lKaAnp3dm0vw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8A141F01825;
	Tue, 27 Oct 2026 20:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793131752;
	bh=NNg91saYaDH/iUX+L1xCWXJmWAh9RpX8ijH1Nl8Vd1A=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Jz+thVR9p4XTWlRkfuAEjouxXki2QCBDtoZNarCkZE5BBqwgicZNpY43gOX7/WHC2
	 1KAA4TEt2MCdoCGtFDVEK7r7cY+bwodHKbINxIfqfZQUPA0EH0oJlHkEfhCKjP7bEx
	 gKFpgrz0gY15sdJPBPRDZJDmiIEP5pbfqEF9OLELTaWYJUL8C6aDKGJLIZ73Kh6rUo
	 gLi8cGHBQIM/8j0lrCx8qyF1Jf8+dJypGvdN1uhQLUo9FusHo5lU2ojve5ousqxpCX
	 rr2D8QvU/fXOOClvbpwu0uKhDhaxjckWSkRV3v8fpJ/6ry94PLkzQtL94k1p+38EaK
	 Bph4i7qcQ+0nQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 690A0451B4;
	Tue, 27 Oct 2026 20:09:11 +0000 (UTC)
From: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>
Date: Tue, 27 Oct 2026 16:09:11 -0400
Subject: [PATCH] smp: use READ_ONCE() for csd flags in the async path
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
Message-Id: <20261027-kcsan-smp-v1-1-57a4949106b2@columbia.edu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDWhUn9XEYuqwRAlHUQi7q5Yf
 snLu4DRETKUwQUOD2JarEccBmAGbXsU1HqDjGQaRzITk2FtBc+raIs0zxKFUuUafL867Oj8XlX
 9m/dmRLO9A7jvB8vwzeltAAAA
X-Change-ID: 20261027-kcsan-smp-d968735e258a
To: Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
 tz2294@columbia.edu, Mani Tofigh <mt4022@columbia.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793131751; l=1644;
 i=mt4022@columbia.edu; s=20261026; h=from:subject:message-id;
 bh=UoFjy57HrPBIOxXCXeP3uYlJT7z/vKDqaE0Wh7LGDd0=;
 b=x7adRW74xgRXMnSNCFytKDR3tGpRQYNd5Xq5Rwgy6uluIYTB0ImYyGIO+yuAAx5uoHCclt+Hi
 /FK6aZPiX2uCqfqOXSXN0V+WJDYE7Y2YLfr1M8M1AqXDRNfUH8j78Vk
X-Developer-Key: i=mt4022@columbia.edu; a=ed25519;
 pk=gljCMQDuxyKPmd5y37CRpEJGSPXDV1MyAnHBhCgXl0I=
X-Endpoint-Received: by B4 Relay for mt4022@columbia.edu/20261026 with
 auth_id=1322
X-Original-From: Mani Tofigh <mt4022@columbia.edu>
Reply-To: mt4022@columbia.edu
Content-Transfer-Encoding: 7bit

From: Mani Tofigh <mt4022@columbia.edu>

smp_call_function_single_async() checks CSD_FLAG_LOCK without a lock
while the target CPU may be clearing it.  The race is harmless, since a
stale read only sees the flag still set and returns -EBUSY.  Use
READ_ONCE() like the other lockless readers of u_flags in this file.

  [   18.136106] BUG: KCSAN: data-race in __flush_smp_call_function_queue / smp_call_function_single_async

  [   18.136218] write (marked) to 0xff1100002b62b608 of 4 bytes by interrupt on cpu 0:
  [   18.136269]  __flush_smp_call_function_queue+0x36b/0xda0
  [   18.136338]  generic_smp_call_function_single_interrupt+0xf/0x10
  ...

  [   18.139279] read to 0xff1100002b62b608 of 4 bytes by task 235 on cpu 1:
  [   18.139327]  smp_call_function_single_async+0x22/0xb0
  [   18.139396]  enqueue_task+0x25/0xf0
  ...

  [   18.157072] value changed: 0x00000001 -> 0x00000000

Found with KCSAN while fuzzing under a deterministic hypervisor that's
currently under development.

Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
---
 kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index 89a30d831ef5..8064652747ea 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -822,7 +822,7 @@ int smp_call_function_single_async(int cpu, call_single_data_t *csd)
 
 	preempt_disable();
 
-	if (csd->node.u_flags & CSD_FLAG_LOCK) {
+	if (READ_ONCE(csd->node.u_flags) & CSD_FLAG_LOCK) {
 		err = -EBUSY;
 		goto out;
 	}

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261027-kcsan-smp-d968735e258a

Best regards,
--  
Mani Tofigh <mt4022@columbia.edu>


