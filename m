Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149435;
	b=DRAjL4h+1y8kzG354JcuorOU82TaputSEIs5EjtCVlMzz3Kiquot8bedIVP8HrJ2+bKj
	 Ul5/w+PwM8KU/i9vPeJAGikcmnJRjdoN2voyACdxDSpoyO8knhhiayUrrKJ7J4q+o0aa6
	 lLxz5V5s9nzesyaFq+pJtBtZ57dm/30Um9GYFXRK3tO2FdS//+nIwFely2kSQMcBNgTPV
	 v9Sy49l3Sp85hOP5U7j86Hzqq1nsmV4kiyuo4W04QFTpgOaSZR+46QLhAiOwAcZDKCWMx
	 5eSYdgqvChGR/huiDK/EBXL3wtipOmULC3RU3G0lGyC48p2ef0t+lmNrVktioTvK2uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cEyRyjk6OI+iUhMYK1UgnN10zyMryNz1Exvd9CmPK78=;
	b=0N4co49zPhtFp4sZOnN5SwtkQcYmoXVncJoBR7o59QvrFsb7W7q+LwKP6x9LcVKN3up+
	 mnZPNvqp9wGPjT2axj2/XMmH528dxIY7vCu2pbm1FdYTN+e0wfEyIAl8R7vqiDNkkdA36
	 TqQUBBM2EVxt6EZV3KRofRaW7zOXct94i/VNB0TYzUZETPap8UwhgXRRf5sWK45TN4VsS
	 0TarLIDBd0i6ZDiNh/1K/Hf3ieWSdnOzvqT8oQOuxkyXbm39cqhWwW7emBhw1sfsrRydr
	 qR/x/I285w/JHbi/TRt8jbu2bMRdoVhu3Ah8/8pGBeav+PIVWZfuFlcbVprANVg2/uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uz5or+x8;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4FA606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E4FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uz5or+x8
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso472045e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794149434; x=1794754234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEyRyjk6OI+iUhMYK1UgnN10zyMryNz1Exvd9CmPK78=;
        b=Uz5or+x8VV4+vxKRyC0WjD/O1dt6rPOP0C/8LCbhHKwxVQU+qvISn1+YlDEcQk0vi2
         Vp2FN2OOS9j0GTc8fv3Qot/kxnIAuCLpiYrjLJfVJGrV5zDY2njPfz9yqrFjR1QTtPJt
         HnjLqnpirqmWaiFK6pP6pOGy+jIuYi3DV+UeyYhlD7D7UX4iuHzugrfW2BdFwRFg7MXz
         X1IVipPFQlbtFM9eKU2KkTBaZV0JNHlgtAqQy71PWhvB+5644zwrIghsmZx4Ku7zos66
         +T7eCVKI71z0+/WyWjyhp/uXKLnHblQs6Un66Dt2yntxJ7enf1skwtpbmdl14P+p9Q/j
         jARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794149434; x=1794754234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEyRyjk6OI+iUhMYK1UgnN10zyMryNz1Exvd9CmPK78=;
        b=PHM9faJ4gqU2QixcECFQczCzRXrajs1BRPm0aXvVcd0SispWEc8ywYWmltNZaP84e1
         bYfg3uaUARlIld+beopM+2+yu5w1gpplfToKRx7GXuvr8BgAmxkJhgHi6CoarnMtLVCF
         bW71Hr6vzjnrmlkQByq7QGi5vNpVWnacGKcg0V+eMrpXNAKG6DYD7jZLzNLMCEqXk5y9
         M3FfNLeQfExbnEI/DJzl66fkEKaM+YzmakkOKrF400vpF1zdAfdJRxKaYmPQZVYu3NoR
         5F3TJIhU6R+OIVc2u1xGakVjF9zCvkKRWDZPtJ8FEGP5xSwuuhjq3aE1RWHfwrcsaiHv
         pdnA==
X-Forwarded-Encrypted: i=1; AL+hErG3WlsF4MIZeJ2vLhWM1/1IPaPLfeiAwgaozPSgIi6DJDKSu29/GkmlffhSpHgEVH39sp8TNlc7leBwIfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JG3bIiMFZnJyHW3MZVy4mfM9N6IzKTljVFdDb35lyFEWxG3oW
	srSUz5MJRYPlPGv42gHOmqav0QssrGsW/HqZdA0TLO/iSXWrr6/jeH+Y
X-Gm-Gg: AYBFou05DzAjzOaSKf3b/Vnv9YCZ9NHJj0O0ZrHGG+LN3Y4VLfzMjZ8iua4hKFbDimb
	eCyIGhniyX2aYssyAeTbKePD2Ul6DxX/Msrt6rt5Skyox+084rR3ZF0jdbiGssIQGeLz0pIfI6h
	DnX429bx4X5L2r0KnftdqI/lrzVqxyPkmlCxm0C8nQqQ83R6piqesqBnqmGXIOcIzqlqSrYt0ln
	lhJ8w45NlX25PHq0JmOmPSuc1qjrEHhsl1Q8dzzAZhYc4l9/KZhb6x1MaKM9Ony6Y20RJ8672qv
	82tHTwmZplvTkywt3Tr3QhB3kdQ6rukO0ZUkGNWaCAppTedtCb1hPPvlGSEAHXyZl1IPX9N4NDm
	GFUxvU/VO1noL1QC+yEfPhCI5w7HWlG+rOWOwesx0UyqW0psWgWdVw0FByAildeBNNhBFnao/y+
	W7AEtggokjvTcVmDYgVhayKtYX7wG+hsKEvrK4/qfWYbwTtnLkXU310uoNKYCZ5oV/7xnGNqILo
	rTMUF4lVz+imsKx19mCc0yfEDtF5H1smGZM3ECB0chk0SiPpkHVQZKgD1vH/hdM3hjiMbFKi3lm
	l9J1NTfXTKoWhH51JVK6Ccpw7zX1m8ww1Xc7
X-Received: by 2002:a05:600c:1d08:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4b960d9bae2mr31054665e9.10.1794149433516;
        Sun, 08 Nov 2026 06:50:33 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:474b:1700:5392:d94f:6171:6773])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee2b8c0sm69612945e9.9.2026.11.08.06.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:50:33 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	zhanxusheng1024@gmail.com,
	zhongqiu.han@oss.qualcomm.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] cpufreq: schedutil: Skip busy-CPU hold when NOHZ is inactive
Date: Sun,  8 Nov 2026 16:50:28 +0200
Message-ID: <20261108145028.2483131-2-thnkslprpt@gmail.com>
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

sugov_hold_freq() uses the NOHZ idle-call counter to determine whether
a CPU has been idle recently. When NOHZ is disabled or fails to
activate, the counter does not advance, causing schedutil to treat
the CPU as continuously busy and potentially prevent frequency
reductions.

Skip the busy-CPU hold when tick_nohz_is_active() is false. This
also handles systems where NOHZ was enabled but never activated.

Fixes: b7eaf1aab9f8 ("cpufreq: schedutil: Avoid reducing frequency of busy CPUs prematurely")
Cc: stable@vger.kernel.org
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
v2:
- use tick_nohz_is_active() instead of tick_nohz_enabled to also
  handle NOHZ enabled but never activated, as suggested by Zhan Xusheng

 kernel/sched/cpufreq_schedutil.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 14405a614991..50249cc1a594 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -397,6 +397,9 @@ static bool sugov_hold_freq(struct sugov_cpu *sg_cpu)
 	if (uclamp_rq_is_capped(cpu_rq(sg_cpu->cpu)))
 		return false;
 
+	if (!tick_nohz_is_active())
+		return false;
+
 	/*
 	 * Maintain the frequency if the CPU has not been idle recently, as
 	 * reduction is likely to be premature.

base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
-- 
2.43.0

