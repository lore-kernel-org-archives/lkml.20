Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904189;
	b=DlGxcgeKPwXiX6iGa1WZz47XTMLdXCVvqO5g6JXiaNmZQu+rDNhAb/Tw90AoOmxIQ4k+
	 4xT8/ki0ptFOw/ZLvvcCRizwVmGBiN6gfuQzeNIRMoZHUd0ZpynL6ZLaDViTkadGb88D7
	 x5HRC+ddRQ9WAHq8Tl5IZ2oRu7mnbBx7dPiUFCo5e14kTKXT2vdEYzqK6O7I4AxfW4Jru
	 uG1UAv1hCgP+V7+nY8N6gDdyETlWsiwiOQM9NsgpmVuOoCfBaJa0WtWqu09c3/+5JJC3a
	 gzKLspa1YBTFW+znDoGcUupENBXinUhkO96MGKcasgFXl2/LTG/2MgGbvnLnh5/7JWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ZUzJJDtkx8ZaYRA5grqqG2mwrrLwcQbjsBpMmpNBpIc=;
	b=ciA+Jx2r5INSTogzlx8LtUkpdoGI/nYkEb1ep/Lx0fzTOrCf1KWTj7zgibcI5frIDOGj
	 50W7ip17Kabao2GyKcafEnUH9WOdZPgAT133tE2xMKAsG6BmO0ieo3vni5ZVCzH4/+Vab
	 6pzssNsvJVtFudTrvSc0td/mszD8pjR6Thm1wFrqdOeVYccARXYOB0keugnscAwo4sRkT
	 4AGECc6EkUDkv340sCOK/cwPhhKS77cjZk4G0aIu00RssrhGaYO1+UVkT3ftLyOU1ukrI
	 9bO6qqsdZvRQ6XSQs+BwcGpKELRp7CsKNvussoAypw2YT9u11N7urif/W+QWw1jrdqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="g/40v4iR";
	arc=none smtp.remote-ip=209.85.208.71
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13667606A89B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13667606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g/40v4iR
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b570b713cbso6567936a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794904182; x=1795508982; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZUzJJDtkx8ZaYRA5grqqG2mwrrLwcQbjsBpMmpNBpIc=;
        b=g/40v4iRuWwI5fUGgNeFddKvD6lR7SkzcbzzaKqUiz2wL6lb7UwNmZz+mbPRRZnLfu
         +58nh0rf9C5g6LKkZflitpOi7sQyrBdkaMPtL+1aYm5pqh+lWba503aaEywfszr1qivO
         u8wOp50SmK+zDTFyswVTMAIi4oGv6LyGeyqlsGbJjExfnUQWSJfo5Sw1a2WkwLzHiUas
         Mkl9RfXrRQZWmg4S+DmWgs2Q1vIDsmMnJJFgg61dHfmG1JVu/DReyq0CxOMwGv344zFl
         TjGRzlTze1ijG1DekJK+neRJ7sfZ6ij2YRdvPKH4jAEdfgs0WaJkRo8JCNwW2F2jf62v
         vtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904182; x=1795508982;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZUzJJDtkx8ZaYRA5grqqG2mwrrLwcQbjsBpMmpNBpIc=;
        b=jIggXjhtsjpI6SNFhy0tnPk0063xGVWK3j8pHWIcpFG/tbrKqdU9g9Y5Xp6N94LH6v
         6WlQr/0bHCuyqrL4VyQtuirXBvPreStrzzmyItMOIauDfKdSYCCpzGS1CvpPcx9mowOd
         yMjb+7zXmlkYKmWgv2aguVvZfOJfz92v90J7+aeIDfULxzJ+/FA8z8VuBiFIXm5idMI1
         I8jxwTuZa2RFaHcHotF2YQtt+24QravZm35Y6bwjr68t6TZPhHAtEe+Q5XcsLPKbjkOU
         W8TyrxEVi/wQORmPApzNkamogvQxdI5nYqn9rW3TIG94d2ONy6eZ5LoU/YVEfoSsupf/
         JPXw==
X-Forwarded-Encrypted: i=1; AL+hErGqSHIVXv0+pVWFSnYsnPlENqz71uLExKIinFH6rGAKPcyTzv7XN9X3itBZ+Ebb/NmwYVLpOW1GhpIJVUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BOBLI4louXqstvflI7aBe8Eu9Gd+hFQBg8xe4PViYNDDH2sli
	4mosDsd6t7/vOZeUE4vk11oPnssY1LNK6JCTDC+ElxbK3DNcwo9iIqcyXrGEQbDAAgA7GkdBKZ8
	b06awdIoRAbqUZXwZqegmvA==
X-Received: from edyg6.prod.google.com ([2002:a05:6402:1806:b0:6b8:7992:6727])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:42c9:b0:6b7:8b1:aa6c with SMTP id 4fb4d7f45d1cf-6b7c0bc4fcfmr10380043a12.10.1794904182145;
 Tue, 17 Nov 2026 00:29:42 -0800 (PST)
Date: Tue, 17 Nov 2026 08:29:32 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117082932.3441173-1-vdonnefort@google.com>
Subject: [PATCH] tracing: Take trace_access_lock() in tracing_buffers_ioctl()
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Kyuwon Cho <kyuwoncho18@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

tracing_buffers_ioctl() calls ring_buffer_map_get_reader() without
trace_access_lock, breaking concurrent readers. Take trace_access_lock()
around ring_buffer_map_get_reader(), matching the other consuming
readers.

Fixes: cf9f0f7c4c5b ("tracing: Allow user-space mapping of the ring-buffer")
Reported-by: Kyuwon Cho <kyuwoncho18@gmail.com>
Closes: https://lore.kernel.org/all/179485165154.2547186.6129837870360499372@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index e8c4efa8107b..456fc388a31f 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -7404,8 +7404,12 @@ static long tracing_buffers_ioctl(struct file *file, unsigned int cmd, unsigned
 				return err;
 		}
 
-		return ring_buffer_map_get_reader(iter->array_buffer->buffer,
-						  iter->cpu_file);
+		trace_access_lock(iter->cpu_file);
+		err = ring_buffer_map_get_reader(iter->array_buffer->buffer,
+						 iter->cpu_file);
+		trace_access_unlock(iter->cpu_file);
+
+		return err;
 	} else if (cmd) {
 		return -ENOTTY;
 	}

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.1.703.gf848ed807c-goog

