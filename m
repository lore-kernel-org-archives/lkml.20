Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536516;
	b=EOtizO9ELjx3Sjif7+ziTchzlWcpUIPtodz/Ifkl/qDpKQL6QuUxNvL1QP9OzA8EcZAo
	 b3hslg1yC8k8L+DjWAhxoWVBsZN7Cvnn7Ti1rnFWze7N/ZOt+zgodCeOHrxFUO/p+gcHr
	 4Vs8NodQQeQWu5qf4VEul7Ju2oEVV8fRJtkknBadbih8OZN0ojarzqEsivyNibMioC01u
	 eVQXku3XWDsNoW7l7kIH2+JPG6x5JrSxsWcD3snwSec1JmkGM5H7SvkiS3OpoUGuia3s9
	 pnixRx8gAsnG+pRhzEEnzW6SThZMpoP70cp929gBMQCD7UL4dnE04UvPJF6JFMh5cTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t+f2t4DgHL7KNG1SeK4YF6A6q++tfump/Px5Q8bp2kQ=;
	b=VdXlcDogeQd3NaSjHDrJ6v/CfuxDhxcl2RqQuUvRsz+ksh52v/CZvwCwaaBu7PWHTjyG
	 /cuQU/lZa7UrARjVLckiwOlqgoyKi8VsQCNsXf60Jpsc/PVZqduTniIsXN/0C+9dvNmpv
	 eS1yTcR42U0NMWuxu2vOSUiw4u8ngP8VoAUjJDc4mckTYccYt76L2ayScv8opQAC9DWqB
	 aNu17BzHqkG43xGK4DwrmBLCW0rXY6uENyN6wyGPmJPDa2v3eojr7JCJXRQVcj6nZhKrQ
	 9bo0MxyL1aWjn0Mo1DB9cl26MJpmT8NGhJMZwrWqBODb/cGPZTpb3X1kWglhcNr24Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GntD5A5Q;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C94A606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C94A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GntD5A5Q
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso125273eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536516; x=1793141316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+f2t4DgHL7KNG1SeK4YF6A6q++tfump/Px5Q8bp2kQ=;
        b=GntD5A5QnFs7FS7LtNBeXV/1oBU6zVtvVlKJPmmsbSjvxUlVu6WgfC6TtrYWnkZuJ2
         JfnyLyqMSk7T61RqWtxEk8VRAfXSCbJHBa0kou9wYEVufPQF2J0IgcGS5N7pQ4TFYnA8
         qrwhVNI8MMFNgoVzLM1gQmGuq68J11zyVQGLl1942xB+sS5AXjlOn8o4FnSlwTc0WMFO
         4YtkDn5hcNeCKAsdIz4YOFxLGkdh3G3KECnsfxhpx+nQAPx7gHMQ3ob26K8G3FqlZnG2
         +5CjTnLPvZXUNj5leh0FAR66NnNcfUjd6sjmMYI2F3OZdtUo80pawlJUtuSW0uuU8uVA
         GUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536516; x=1793141316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+f2t4DgHL7KNG1SeK4YF6A6q++tfump/Px5Q8bp2kQ=;
        b=OGSjXZAawd7emQ2qI8UPYIcJqm0zazARAcF7GhV+nAzG95gtW8fxeSpBzXiorejf+U
         0rhgFeoUEaxgMCZaT1fkFVxVmGMTZl092rgR+UIC+H2MlczR726r9uXf78JgBu3ttwc7
         SEnCFWdPOJU7qYAK0kFynDsiIXbAJt/101SxFO019rfNUWu72tWTrQrxdBewhKSP3Jsz
         ZATVvg58FutdLhaZOnRlQOSUnyF4Ah5IyRmdCrUXj7jSvWOHXLpESrea9ZCuqLW0l7Kw
         F4B8rnjT6y1Ab3/W1xyiSoORUoMtCdBxP+uYS8NodZ56ERoRbEHhWXXhdr9TtRDS+79m
         wOLg==
X-Forwarded-Encrypted: i=1; AKwUvBzkivV9ByBINdpAAAQXaEKBIR709vsNv0yoRwOmdYAjJCkwisoopzJ/RaofIGgl4tS7usVhscuynYflWiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0aCyZR8TF+m/XrvXdfSf/udcabY74JsrgsvBFjKlghuhqqQ1h
	U41ik+s+W5UMx1NxQ6nXeq6HHTbc4bmyZMneNSR2cR0KBysR8ubFeKdV
X-Gm-Gg: AYBFou0Ueo7t+dizBkoz+kiexLYOKtj3B04uDUXs0HO4JVCq0nk9G9RmrajmTGJARLI
	bmV+Wy760ZyYTpVuXtJDfWnbvIO74/FneYi9MVW3sJ7lpMG2NKt1o6jUxc5BleCL5WfeWRFvzHK
	gJ3xBRsllLyhj0TYIQiQuGgAzcV7WaF3byTaxqxDhcAiq/9vEBPh3uSjuGx++Gwii4/XOqczwfq
	k/MlxkMXlaQQoAJ0Sj2iUP5m0gTMk8GXoBmGPizbmJBgulfdUqpXM1iVghfXYIDyYuQRAusc2Jn
	yUaPiA+7ThhPhiudCiBDgfCmfxANBkdx/l/cGejr11tquU8HygYzBRcwMys985nb032g4fjuCb0
	PUjUqRBDuq0SJ9qCtTBg4JbeUvuYFsxYZZI21aevTA3+Uvjy8bjNnhOpo4o5TXhx0ScBOWGfvX3
	8f4Sh/0COyiw2RieFVcXjKO8F/wJ1MPMdiv0QWuj9rGHPV07z9BJjek709mnHkelSEQiLwRYhor
	eBn2rtr2OUjwZS2lId/RLAzUA==
X-Received: by 2002:a05:701b:2086:20b0:13b:2f26:6881 with SMTP id a92af1059eb24-190a051e0femr366719c88.4.1792536515460;
        Tue, 20 Oct 2026 15:48:35 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903aff3481sm1517409c88.10.2026.10.20.15.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:48:35 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: anna-maria@linutronix.de,
	frederic@kernel.org
Cc: tglx@kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] timers/itimer: Keep a nonzero value at CPU timer expiry
Date: Tue, 20 Oct 2026 22:39:57 +0000
Message-ID: <20261020223957.87842-1-dennylin0707@gmail.com>
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

get_cpu_itimer() returns a zero remaining time when the sampled CPU time
is exactly equal to the nonzero expiry. This makes an armed ITIMER_VIRTUAL
or ITIMER_PROF timer appear disarmed.

The cputime cleanup replaced cputime_le(), which implements <=, with <.
Restore the inclusive comparison so the equality case returns TICK_NSEC,
like the overdue case and set_process_cpu_timer().

Fixes: 648616343cdb ("[S390] cputime: add sparse checking and cleanup")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 kernel/time/itimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/itimer.c b/kernel/time/itimer.c
index 03a32dffc56c..f7de39769095 100644
--- a/kernel/time/itimer.c
+++ b/kernel/time/itimer.c
@@ -60,7 +60,7 @@ static void get_cpu_itimer(struct task_struct *tsk, unsigned int clock_id,
 		thread_group_sample_cputime(tsk, samples);
 		t = samples[clock_id];
 
-		if (val < t)
+		if (val <= t)
 			/* about to fire */
 			val = TICK_NSEC;
 		else
-- 
2.43.0

