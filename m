Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742208;
	b=28xvDVzeqOdcRo8a/VV564h9bZMOk8dkSL9QfXoYtA3G+S6xT3bEsWK81itGh/Esztgr
	 YhZzMERT5bisMSBWqz2JOAh0qIdRtA+byvtRCJB9a0YjD2kvuOny62WlJDgnqwrbx9UkK
	 PM8/bBavmTQKqWG6rKxbyoShEPuc1kJP9vIoUf4n2sKn5cnb+lXbhtj8wvBN5A1r4QFXn
	 XHimBArAw+d7g6bfVIQ3x8cdXT6MJJXWVa89AxrJwUWwacHjJ3zOtigLyTgJUjkcRfJzw
	 zsMgqL3AK7UAQtFjG7lJRQ45PHH6I1RI6uEKhkSbaFyUi/kiZ8pYPDARTV/imttSSRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C9mkZI7UPnFUcdrNwGMweO7b1qOA1u4Bsg8DNlvkpTc=;
	b=1baewwosia3zs9TF05PLWtlUqO4jLNtFAXGVMXVU1X6Zw0jRJslZHR8CAsxXyHquxUlD
	 toePcNCcBSok4XMcAOqVMTjuXntj9kdE1xbMpzAzVTskI6B0FOS2AZKIDrWs2+wn/xA4/
	 Wp7nyqThVze92KhcZJ6/DncBAy2+AMaFYgFTlGTQKLAb22C9EUFPjngv0Cc9vY6ppfAZf
	 gsjwWYtD06y25GYlHYwJdbpz+YWrlHks3bKbQ2XpZNIx8Jy7CJMPJLL1zJ2IDLFvYQgmw
	 DKdlSEIkbTV6zJWuNDvQgR32vAFwpnNKyaptJr9PSbe6Gj5gOoQE27eAR0PpECkvlqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S8HHgAqG;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200D06082BDF
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 200D06082BDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S8HHgAqG
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso4243a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742206; x=1794347006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9mkZI7UPnFUcdrNwGMweO7b1qOA1u4Bsg8DNlvkpTc=;
        b=S8HHgAqGYZ6dlH5v1zjdH6Cf8l977nm3fXP26IoSm6c39LE1EYQk4jEpmHmy8bVoF+
         4VyWrdpKf+25yQ97Jk167umkbqjmbzQlLH/8qAIVqfpBWNt9ffSZTycV/0/mCnnmnE/z
         xvFm3sGeMFGFh4CcY3pwTF/C2QAnHJN7jRHo41CqVTP+kiWI/b2LtD3TekNDKAyYZKh6
         fRqzr9PelGdXZvOlYt01AgIQmUIZFVXRSoO1O9LxctstHDfPI5KahwTRI8buSAMLS8Ov
         7rWrkUpt6UDhHXX5yGKEJUGFcYwKP1UeEEpahenRqpG/RcIZt7cPHh21VftGLQnsmYkJ
         kE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742206; x=1794347006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C9mkZI7UPnFUcdrNwGMweO7b1qOA1u4Bsg8DNlvkpTc=;
        b=zWcZQ8Qa5l4k2UBoUC0h1KKxwjVrSGnDdY0NUtRa/RsXG3en6EQs70FysrYDJ7e1qB
         EhYH8Wp4bc+bsGkNoB4veTMEZWmSZNFQYl4dEEKz32lsi4vnqIkzQsumZNTx1usXYg5W
         sSH41LG4C4+90YsF0m9Y7vCs30gWcOvF3d2MT0Gh0laPdICHSCHR1NjjPxoyfyw0/t20
         A1/UU+gtGyIOG4TeNDoS8xjWZXH3L3EwPzWuartH+qy0d3uU7tBfY9+DLGQgTtIrMT7V
         0+oPII5ODFKGnhhM7dWLH9HWkm7Sy5Dhl4IyRimReKAct2vps24HyehRDJf4YerZXD/a
         8x9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzZ2uOnFiUwozvAmyn7nybM1FVQ0Z30rfMArL4Oh+ZSJygugvcUmQc6r0XUq0vr/Ea7PFg4PDJZ+nRKDeM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GI8MWu6U5X8Y7xWViltww/yb6xfrOIllNpWqXf7QcueWJZMxc
	gRLktLB7z8C0PcI5yRmf/+xUA5LK0gGfcyv+tN2ZmIftkrAfKyHvyP4t
X-Gm-Gg: AYBFou2lnwqGJFeM6EGhdDZ7dGL1Ny/yOHN1SVs4ZOAaDX+6duZW7lBwraSQNp2Z5sR
	HhwhDf6rJKRHanBh+b9wr3heynF9vLRNsfZzEylPWaCkIN9VGJsx8QnZ2TI9KzinXozjAk/25I+
	XXa8doLbIFisJhKX7zAKv5AzrnmxKpoBtpjPEA9fBIAbZNOEfELVYgWbmcXngQoWVvX9oZu8MMK
	ajFz0ibFnsM9ovOQd7yy0okGRpHaf+45V3crL3spZZezRF7ej3jFOAxM86Ra8QuJpOv3iAG8T3q
	ASC/jXSGyh2T9FuV0Bo08xj6/e5QRfx6XRpKBwpYI/whxTnlB7vyfyJgtan2zhe9y8AKnT1TcPM
	7N5MHu9aclLyvRhjcm33THrhaurMGKjeDnhCa0m6K4f2MnkMllRhCJFA8FR5C08DRDVO3GmAo71
	9w5YbQ1rGjoyQh+kxWICpVkMjGvOuLm2lB+bnwX6HflD6/SM7QIDxp0nvLHOy8GJQZQQfnskKJs
	nARC3QK2kjh2QG2b75zZvEVuv/0y0NmF4SLPL0b2lDDNxqR/t8jZYqoOYwCCm0mgrf7eOQl8now
	Iur+PyUFZ1xKEGBdgl6mPy17dm1KemOlYVU5C+oSMUe2lyo55Nj03gM1P1s8dF/hWAgxvW0=
X-Received: by 2002:a05:6402:27d4:b0:6b4:7f3:a9cb with SMTP id 4fb4d7f45d1cf-6b4d64b21c9mr11493103a12.42.1793742206485;
        Tue, 03 Nov 2026 13:43:26 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:26 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 13/14] alpha: use generic getrusage for OSF resource accounting
Date: Tue,  3 Nov 2026 22:35:19 +0100
Message-ID: <20261103214120.1099893-14-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
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

Use getrusage() for OSF resource accounting. This intentionally aligns
osf_getrusage() accounting with getrusage(2): RUSAGE_SELF covers the whole
thread group rather than only the calling thread, and ru_maxrss, block
I/O and context-switch counts are populated instead of remaining zero.
CPU times use the generic microsecond conversion instead of the previous
jiffy rounding.

Keep the OSF structure layout and the existing RUSAGE_SELF/RUSAGE_CHILDREN
selector restriction. Share result conversion with osf_wait4() and remove
the jiffy-based time conversion.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/osf_sys.c | 56 ++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 39 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 61d8061762133f5e128d8538cf104dfede57ea6d..c08796f627332e4562a30557dee700052d03c0e7 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -15,7 +15,7 @@
 #include <linux/sched/signal.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task_stack.h>
-#include <linux/sched/cputime.h>
+#include <linux/resource.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/smp.h>
@@ -960,13 +960,6 @@ put_tv_to_tv32(struct timeval32 __user *o, struct __kernel_old_timeval *i)
 			    sizeof(struct timeval32));
 }
 
-static inline void
-jiffies_to_timeval32(unsigned long jiffies, struct timeval32 *value)
-{
-	value->tv_usec = (jiffies % HZ) * (1000000L / HZ);
-	value->tv_sec = jiffies / HZ;
-}
-
 SYSCALL_DEFINE2(osf_gettimeofday, struct timeval32 __user *, tv,
 		struct timezone __user *, tz)
 {
@@ -1062,37 +1055,27 @@ struct rusage32 {
 	long	ru_nivcsw;		/* involuntary " */
 };
 
+static int put_rusage32(struct rusage32 __user *ru, struct rusage *r)
+{
+	if (put_tv_to_tv32(&ru->ru_utime, &r->ru_utime))
+		return -EFAULT;
+	if (put_tv_to_tv32(&ru->ru_stime, &r->ru_stime))
+		return -EFAULT;
+	if (copy_to_user(&ru->ru_maxrss, &r->ru_maxrss,
+			 sizeof(*ru) - offsetof(struct rusage32, ru_maxrss)))
+		return -EFAULT;
+	return 0;
+}
+
 SYSCALL_DEFINE2(osf_getrusage, int, who, struct rusage32 __user *, ru)
 {
-	struct rusage32 r;
-	u64 utime, stime;
-	unsigned long utime_jiffies, stime_jiffies;
+	struct rusage r;
 
 	if (who != RUSAGE_SELF && who != RUSAGE_CHILDREN)
 		return -EINVAL;
 
-	memset(&r, 0, sizeof(r));
-	switch (who) {
-	case RUSAGE_SELF:
-		task_cputime(current, &utime, &stime);
-		utime_jiffies = nsecs_to_jiffies(utime);
-		stime_jiffies = nsecs_to_jiffies(stime);
-		jiffies_to_timeval32(utime_jiffies, &r.ru_utime);
-		jiffies_to_timeval32(stime_jiffies, &r.ru_stime);
-		r.ru_minflt = current->min_flt;
-		r.ru_majflt = current->maj_flt;
-		break;
-	case RUSAGE_CHILDREN:
-		utime_jiffies = nsecs_to_jiffies(current->signal->cutime);
-		stime_jiffies = nsecs_to_jiffies(current->signal->cstime);
-		jiffies_to_timeval32(utime_jiffies, &r.ru_utime);
-		jiffies_to_timeval32(stime_jiffies, &r.ru_stime);
-		r.ru_minflt = current->signal->cmin_flt;
-		r.ru_majflt = current->signal->cmaj_flt;
-		break;
-	}
-
-	return copy_to_user(ru, &r, sizeof(r)) ? -EFAULT : 0;
+	getrusage(current, who, &r);
+	return put_rusage32(ru, &r);
 }
 
 SYSCALL_DEFINE4(osf_wait4, pid_t, pid, int __user *, ustatus, int, options,
@@ -1104,12 +1087,7 @@ SYSCALL_DEFINE4(osf_wait4, pid_t, pid, int __user *, ustatus, int, options,
 		return err;
 	if (!ur)
 		return err;
-	if (put_tv_to_tv32(&ur->ru_utime, &r.ru_utime))
-		return -EFAULT;
-	if (put_tv_to_tv32(&ur->ru_stime, &r.ru_stime))
-		return -EFAULT;
-	if (copy_to_user(&ur->ru_maxrss, &r.ru_maxrss,
-	      sizeof(struct rusage32) - offsetof(struct rusage32, ru_maxrss)))
+	if (put_rusage32(ur, &r))
 		return -EFAULT;
 	return err;
 }
-- 
2.43.0

