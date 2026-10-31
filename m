Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480667;
	b=CbCSi7EC2/REyHTzx/MkI9GiSGHVZDp3nr4zzNHCGOd3zu/yuZ906yreoc/BOaRMORyG
	 QJKt1hMNtPGCvcvZRBH2SvjhO7X7e+NEwXz4nY+5SVBv3DnXJ64gQUHogPz0Rwqf/9/sA
	 +ia2vKY28RrTaR1LonnENyDediTLYQ5Nlp8IGblfHCHD9CYNB57yedt/Gr2Mup+5JzjD/
	 HT8XWIwbEfBXZ9PHN6yng5mMgWBzbu3J66hWd8pNm2XstH91oRbMIzhwNwKftnr2dml2I
	 0dkf0RMWjmf5id0ncTHKtPzO9L/B26mdqP1iQ8dKbdGFff4VNrzuJVXkm9wr4XP846A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4szFGphMtUoKYDwEO3ILc85/4qEVkI9CTfJtlLVXdJ8=;
	b=QnTJYQo5QDirBtkXO1ax7RWpzuSvNyWs3iA15yKeAX8yTtm7d/i9vSP0nmHpAjVvhJNu
	 vaeYXAouGGVivkMAcQ8ceLwq5r1Svb+DE/qLh8+r0pc7zXT++0XbCM5ZLwNH2N/Sg8XGm
	 76McJo0gzZeyD62gj7e9Zl3KWnYhkAw55hl1+xvi0ms2I14IFyA8vyqOCZCNcj9urZqrP
	 Dsp3oxwWuU9Qavqe9kBkHXPSzOH0CTkE4MFi+cFzbAwZ26A5yCRx6NjTADvAAkXYKqo8k
	 9eGxXfDbsA/ZO7ntrWzKY3eQCYgg2j9tpTm1oAL+pj0NO2ks0IsoKMqDrmXILblANEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zv+gfP3h;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46637606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46637606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zv+gfP3h
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so20265275e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793480665; x=1794085465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4szFGphMtUoKYDwEO3ILc85/4qEVkI9CTfJtlLVXdJ8=;
        b=Zv+gfP3h0dCGmKQSZJgc9BXKNly7hCWlQkiAVteubsCa1u8VJ8/1FknfrfEcBt+UkT
         mOnyh6DWoAmpnQqC81pg58KWwTDOT9GxDj1gRLyayrMmXzDhpHmc9aIQT0Ulc3qv9X9x
         IePk9f+V2iIgPxdC/nJEzxDizOpW4wiwUb2U/RNLyQtG9VtPjEQqmA23Sj6PQPmexqMW
         anVZDFm1hcJSP8zcwfreAaYqg3gklAghiV2RgGjgEumSkmteloWLAJCDnAPnUejHy6xp
         RUlG7Y5Y1YMBYmWPwNz/xMwU7JeVpsvK5YtHqiudSHqfmKGFrt7CfHw3qhBD5xQc80i3
         or0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793480665; x=1794085465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4szFGphMtUoKYDwEO3ILc85/4qEVkI9CTfJtlLVXdJ8=;
        b=WX5y99EpRWmHuLlKy5Nl6ug3Z558LIxqZBo52ZDG6SyeQHmJE3r+jiITTvKDKsmtmj
         tgmOFgAJ6Cdmecv9UDjxeFlECi9Nd0BqdhnWkuOtqOxTi7ziMVCvge7sb3eX7MWQjAB4
         fUNdRk2HtcIxmi9vbsdmvBbtodHcopAPDwEAbvskOA8GMTPuRIKu54yz+t0MXwN9tGom
         qWAD8tm7YUMxAz7Uk2L1yAqr3wMfK9yf7QQytoYF/4gxKBcplrSBf6vv2fmouiR65nz8
         12UiH5zmWLH4VlJnuPTqbooDzUSzUwvGegC8uKQwycNoCCAq4RoPfzdfaGdXx74eRGaw
         4PVg==
X-Forwarded-Encrypted: i=1; AKwUvBxBIyFbecqlXuSmfVVBYEMsn35jswsDX3V3HI3RDg0ggx2S2RKIPVBK5CdM2cqDBv6jNw/7zS0nOKXcfmU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvVqL32lLBJedclM+fKf++zeZx1t2fTA45ju3iamFrIRm11lof
	oG8Z+dpDSXZgIy1hj69QjcD9T4zdZ3jwbZbnMAnyKeQzoWWbu8ZQItpP
X-Gm-Gg: AYBFou3WZfl28w+O5q/R9Fi5TH8EMDrLEgJN5wdcdUMUN2GjMou1eiqkx5SWcHjmiMR
	FlQPbwgy11D9ktD44Mc13E/52I5y3gOQrb6NxoIYMyTq4oqYGsMyFZSCTlgF298sM5qybTVaaAQ
	M8iXvrHbnaL8BY0j0cOt/TseTmeWSPNEAkWYGmPo+9fYCmvZD1VdX1oqHiREyOjsjNZXgXmR0Ls
	FozC9NJD4j+oGZpwAO1y7FXXMqzSLLVsRnVWXyoudvx6XvD48ihFPsRpI9yghE1s+AUezQui4PZ
	sKxAFfcwK3kXj0UzpD4MmGUJFtmmXDMwlD9kb4JAno9FF8Zt/dE2RASxFqxvNbgQuNxmIJ4g0Ht
	28VbUwyojBzUFc6uAd03hjQRMGgHY+IJElKY+A2AXO0z53Yf4g9ie3oSZRJli9RMZDCU/0fHk/p
	9Ah8tHjGaSxAtBCsgle0qaX0bW8jQEB81n8QMUtTIjVVXwLtV4PlXEpY4wG1MqjgBkm87Y/6979
	csozrY1myyAe54uPdDiJ3laEYk48lcY4+B3z/22uGLWDh1onSO7fDlFONSFthVyahbwBcg8rAuO
	NQ51haCsODs9b0X1in/jPCw/Re4PndtWNnJewxnYq6ACfngK9f/aWmC/OLZBC+XHo8e4QV7zOhD
	eWngJ/TAAKbDz1w==
X-Received: by 2002:a05:600c:6214:b0:4a2:9cda:57cb with SMTP id 5b1f17b1804b1-4ac151a9077mr149862625e9.1.1793480664317;
        Sat, 31 Oct 2026 14:04:24 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea72254csm82768725e9.1.2026.10.31.14.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:04:23 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] tracing/user_events: Don't free an event that a dynamic event still references
Date: Sat, 31 Oct 2026 21:03:59 +0000
Message-ID: <20261031210420.501187-1-devnexen@gmail.com>
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

An eprobe takes a reference on the call of the event it attaches to,
and kprobe, uprobe, fprobe and synth events all refuse to go away while
trace_event_dyn_busy() says such a reference exists. user_events never
checks it, so a user event can be freed under an eprobe:

  echo 'u:test u32 a' >> dynamic_events
  echo 'e:ep user_events/test a=$a' >> dynamic_events
  echo '-:user_events/test' >> dynamic_events
  echo '-:eprobes/ep' >> dynamic_events

The last write drops the reference on the freed call.

Return -EBUSY from destroy_user_event() in that case.

Fixes: 7f5a08c79df3 ("user_events: Add minimal support for trace_event into ftrace")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
A non-persistent event whose last fd closes while an eprobe
holds it now stays registered after the eprobe is gone. Can follow
up with a retry on the eprobe put if wanted.
 kernel/trace/trace_events_user.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/trace_events_user.c b/kernel/trace/trace_events_user.c
index f658c3a77aa7..49b857a7f1d7 100644
--- a/kernel/trace/trace_events_user.c
+++ b/kernel/trace/trace_events_user.c
@@ -1506,6 +1506,10 @@ static int destroy_user_event(struct user_event *user)
 
 	lockdep_assert_held(&event_mutex);
 
+	/* If there is a reference to a dynamic event */
+	if (trace_event_dyn_busy(&user->call))
+		return -EBUSY;
+
 	/*
 	 * Detach the fields before removing the call. Removing the event
 	 * frees the field list memory (trace_destroy_fields() is run on
-- 
2.55.0

