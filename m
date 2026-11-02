Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630143;
	b=OCMASlFYG0ATQ2KyMjmqGhja0yBiFnwZfeARrz50LLZJxCQ+eL1HLsQYx0rZt+n6QhFN
	 PIgEVlS5SzI3OJCF5Jh4yjbDQPt9KSLAseJ2FI+Jt9VPIKuyrfVu89z91c038hDhTF9wo
	 ArhkYw5vEDpHhkUNaQa6QKYBqvUsjhHSRUnp6Nx8BYY02cdZyN/icXU0u90/rGUFCCPpY
	 GyofqQYIK3K7AqrqbBsdM5wBcNga9fQpBABmIoPAaIA1lYRRXQU2TNaZlhe/UJmM6wGAg
	 Rcw55g9cJPFLx1mGtpDIy+mhhpMOhwrqiKL2Jepz3ZhYincBnXqO/hVP4kc4SLcsjZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PQWcuimkt51bqENNt7X0xmz4uvJH/+F/iqbTS3hh2nU=;
	b=n5IdQUAZ42pXqteceIW3tsQ8kBOO/XjXPm3OyV3Id3pMF04XVgzDss1+/2rARsWM6GCl
	 mf651emNaoQN9qCnygeEwpGxv/l2XzXC9hG9QExdYTndzIHnayS8roFg6PmBZjF+r/qzO
	 jisAVHJF7j0Q9URQocaf0iTGfYqUbweGmV16DYgP7He321qjWl7JmFq1KpV6tckVbIb/0
	 Kz8nYAFvvI2DUtdX/CZadV/LxwZOoxP8NVeA/Dfpn9V3lNvSMn8jXZhYDxJQJo1fbGfM1
	 jFa4HID55lKFR+6mTAA8chKS5t7g20cAuyNZo4xUgqspELi3RjPuPkaYXTKXd3ZsGVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yVt4hFTN;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D647F606D80D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D647F606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yVt4hFTN
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso4710852c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630142; x=1794234942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQWcuimkt51bqENNt7X0xmz4uvJH/+F/iqbTS3hh2nU=;
        b=yVt4hFTNkBUmNE5EZfmnYBGV5CqUr+QR92A+7vdZRH9xtgCW/Prq8BpXjLn9lkHFHC
         ubtq8ac0BNfwEnq2gMQJSydeFGN5Zk4YgVINwXOWSc5hb4AinmQ+F/IeOtcIz+U5bKKx
         5LjmszP6yOqK91DhGvq/XXJGhJw5+/T9FXBRXrA+a+HwN/6FjjNXEG5yyfmiQJv8Yk56
         w36MUdQV/E2uLt7tO5KVrvdkK900RG75ygS1FulRMAww6MEjX/W5xq03idB6Ig6xGZbD
         Wdyik2SA5LLSfgWc5kvtO4CcSNP1yP7dZYVckcdowGU97zuykbAQgSkdD3iCVtKGWuCj
         kGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630142; x=1794234942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQWcuimkt51bqENNt7X0xmz4uvJH/+F/iqbTS3hh2nU=;
        b=0Wu6XrMRI9Jwy2+cpuTnhRXEBEKVBvI99U9aN0vUDKQKpEQr6v0xeNyjJUTGNnylQ2
         8AlvdA5Rt/WnSOgZ2jtqyaMoSWkWHTP2A55CnVomfSe0Ftqa62aiGEIjpRAWiy7eFIva
         wApLNk6TiGMiOimhfSiXZSLfB3eW/bhoRKK7O3rqhrw1clJIm4+7hgS04jtgQeUsii3q
         tbySrV14D5L2/+Uk3602DW456vsnNWCk25bRKzfRHSWxjzPuzsff4A7ntF+TcuX8Lnzu
         EFbKiSCwQYr1u6Gs1LUTM4q/PHuXXiiB9TjT6f/1wlZAv3mJWC9aoY9xjyg2QfgAWjg+
         D8vg==
X-Forwarded-Encrypted: i=1; AKwUvByJeK2nD0085eC+fDDFWPkiUdsMICFRF/p8T7hgPMmfIRhNXSFUrao1wtvGgsZGpFO3uIRNHo1aOVgXiuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKS9jv71OmoVLHTopOIzkGrxig4+RXBHg2/Xk2DEZs4JV3oCtX/
	Dp0KqFfshlKx0iJZMz+SkwSCxddm3ygbzQMF+r0XAxNaHna/NCdi5meFIzodYg==
X-Gm-Gg: AYBFou0jcQ0l+cldiyQw9c4wm269RVmOa8vVwmuj5czTeoEmKX4ogL6kLtXUD0OL0eH
	Xoh6B9aIcI/pykjjCrU4K/ENo/k9FZIPps0TP94F05Q/P0VSRruHXOUx5vJjrONk3NIr32lxCcg
	/Ds0f+EgJ9gMjPUDQd7eMxDDvn+0KlZ9rX0Zr+w1XbolUZSr+0rwLBjAl4NWW/0O+PxAYxlKRAb
	XgL+9ATvl5HCBa8P2xAhiyQ/eAqAfEkkJyseg3kfO/2WXsYMLlT/Y2b8raO0/AdblEg/OqsfsFO
	kGJja6s+KaO4jOiJU6g5OC5udRk5gAlPWmRrGGaGX9p0pmnk9yp/8b7SHQAKYL3J2bFVuZpOZYq
	+Wzo10d6WWJqmSesywKP1FQTWYcvYGwCzSlQHMwbeoZa9XirR+Xcd48DKpnm9p/cqdn4dKsKcTP
	m+uxRXATCgr1mmj6bJiNWjmTt68ZjOx+zu2BlzT6TvFFWgu/qVM4wxi4zwnbzNTEow/cSY9M7Bc
	7cl9tYVCOdoHDm+4j0rUwA4gT7PibAMsWsa91wLJHtQd8S1xKeJpb16g3576aF5/zSnulrLy8or
	MHNxpcAhIOgWvqjSAca0H6INS/AODe4TPiEt0NyHdtc8NCQ87P0=
X-Received: by 2002:a05:7022:f106:b0:14d:baf5:c419 with SMTP id a92af1059eb24-1ac55b51d6dmr14535952c88.6.1793630141807;
        Mon, 02 Nov 2026 06:35:41 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm34385361c88.12.2026.11.02.06.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:35:41 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: rosenp@gmail.com,
	cezary.rojewski@intel.com,
	tim.bird@sony.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: pcm: Fix source frame count calculation
Date: Mon,  2 Nov 2026 14:34:57 +0000
Message-ID: <20261102143457.3438-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Pass the updated frame count to the "src_frames()" callback.

When the next plugin handles fewer frames than requested, use the
actual frame count instead of the original requested count.

This ensures the correct number of source frames is calculated.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/oss/pcm_plugin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index acf5ca663ba8..3de713779993 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -604,7 +604,7 @@ snd_pcm_sframes_t snd_pcm_plug_write_transfer(struct snd_pcm_substream *plug, st
 			if (err != frames1) {
 				frames = err;
 				if (plugin->src_frames) {
-					frames = plugin->src_frames(plugin, frames1);
+					frames = plugin->src_frames(plugin, err);
 					if (frames <= 0)
 						return frames;
 				}
-- 
2.55.0

