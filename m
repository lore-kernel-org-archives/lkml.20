Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492896;
	b=ubfJmKRQVGZoUgvewxeEpgD3+DDOVUtvYDnCxC6VJtHz9Y4lLhaXbjxw2OPxI3VLGjIU
	 h8ASHF2Y/Jd6jYBcFs6LH7sd/60GBY2tVMwqsZ1Q526ILq3RmdsbK8/36LanRY3Sy04UF
	 7CyU9HsWKA6GMtiW1sDNbs2a65zimwgo5NXh74fJH+Ah9npVCH1S0cUSu9hkyP+i8wUVt
	 3g/3HTutGs2Zbwo/zKJUxS8hofSxPTmsI1DZZhaxW2NrdlFVpWNZY9qe0RrBZKS/eMuj/
	 9R3EAYkPXT0K0ekT468JGeWP4ICQeU4f1MQvuF0E2dcMhBfIcHThK1sHYX8rR2kXq9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nOnTfPlOL03qOmHIzh6thEjDQQkJdnopMg7V/l7FapQ=;
	b=toVhf/jNcnQ3oBZtNS8kKZLqAOGJWAclnEk0MbcnsSJKesh3h9Pq2IODTnY+LD7soCco
	 kN7Laewu+sS53uiaLeX4k9NVr+/fGBw4dGtWPMiinWSMFToBgaLW8ROtVDunQHAiKZEiY
	 E8Fdmd7cxte/hBT4LchoRNPdg19WSV0pW0vToANj4HTFZW2VQkM6DL2anMhjGENjZe4+c
	 4H9JEeJnkRe8vlK5WQ8YbrPSDUWu+fKujOezEDiYZMfHDeKRC/yqrRdla93oXcvgxkmQg
	 ukgxQm2maXDFztkskpASoAGWb49Ti/GRP+wYUsDHJmyK0tZ9t681GFBGOYEl2Fabf2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZyzCL0KH;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5131F606A8AC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5131F606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZyzCL0KH
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e29c25101so2249447f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794492894; x=1795097694; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOnTfPlOL03qOmHIzh6thEjDQQkJdnopMg7V/l7FapQ=;
        b=ZyzCL0KHYmPmV1rv1fa56vVy/dEPis6EwEF3uqKSca8RkkiNnLxY/Bm8eOY9ffwQm4
         RxveEMoq/wkjeLR54UtRoKMH0gWCcAekuoOgrnxktjWaiLA+VRFG8vLUEd4HI2lDzIVS
         W+XBNOPvaodQFvLnKmVurVBYRokWifVamJQAxqWClUCRWEwnEk4jTET10wuhaEs1kPL9
         neDxH5kkBLNu9YJyBIQCFAe9UreEnXQER996j1HFSNaCZeN+mHAm4KwDxePgWbg9SIML
         b+ymMn6cfQ8JhAzVvpUivJt6CTU8pb/BzyID1StdA2ofRKtbhlNoal3bn1AZOLxpPF9f
         Gi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492894; x=1795097694;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOnTfPlOL03qOmHIzh6thEjDQQkJdnopMg7V/l7FapQ=;
        b=R7ng8JVEPYp1WjCVsJnk1boBm70X9G+6nGAjOS1dqGAPBlbxZmfa2IIqalE0KJQQp7
         cc0lXuipu8PlM31yzuVsMa0nAQhJ/zikVHqqCFS1Zr2gyP1gfD+8UZSL17ncBT6z/mzA
         4HP4y9F9oyjTv/OEQkSuElqivP8xgjAzUa0DgQhLcQhVqOJ5GAPBcHNbXUiH/6XpAIGE
         HzHIXvteUeUBYFYw4x+RIT6rDL0UBJDGTf0/kxRV1bMYxX29v6paCN0kSwAdSbmqnS5L
         XZ23wJBj9QtAHzC06sOSjXG8t7zPWeEf5RuRsYQIEvRaztiUj9QSOAKIWfgQgt2Zpbzw
         7wmg==
X-Forwarded-Encrypted: i=1; AL+hErGn8Iov1+UfOrbmU3DX6YbyS9EntC+GbFpo7dkAaNr5IXa81QZAUT5fhQCxzejWUxmLQVEhBGLUYl1i9ZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sNLYd+3H6h3wsmCvswujPuHgnDOTHwfMHW3m0Fz6ZaDJwN9Zn
	3OWmRCgcQlrsGgY21aIGXpbU257D/5lZZh0BuR4D1xJZJonD1MyvV3Ny5jhkmrxAD5WqZKaSn/7
	Gl4Y/VlOOo8mQU6VYVoHgig==
X-Received: from wrpb11.prod.google.com ([2002:adf:f24b:0:b0:48e:1312:61f9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25c6:b0:491:6c24:65f5 with SMTP id ffacd0b85a97d-499c5e3c13dmr10477013f8f.17.1794492893477;
 Thu, 12 Nov 2026 06:14:53 -0800 (PST)
Date: Thu, 12 Nov 2026 14:14:35 +0000
In-Reply-To: <20261112141440.3050124-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112141440.3050124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112141440.3050124-5-vdonnefort@google.com>
Subject: [PATCH v1 4/9] tracing: Cache ring_buffer_max_event_size() for trace_marker
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

write_marker_to_buffer() calls ring_buffer_max_event_size() twice
without synchronisation against ring_buffer_subbuf_order_set(). If
subbuf_order grows between the two calls, cnt may expand past
TRACE_MARKER_MAX_SIZE. Read the maximum event size once so cnt can only
shrink, and drop the now-unreachable WARN_ON_ONCE().

Fixes: 2808e31ec12e ("ring-buffer: Add interface for configuring trace sub buffer size")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index e8c4efa8107b..f44bde7c51b7 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -5962,15 +5962,14 @@ static ssize_t write_marker_to_buffer(struct trace_array *tr, const char *buf,
 	event = __trace_buffer_lock_reserve(buffer, TRACE_PRINT, size,
 					    tracing_gen_ctx());
 	if (unlikely(!event)) {
+		size_t max_event_size = ring_buffer_max_event_size(buffer);
+
 		/*
 		 * If the size was greater than what was allowed, then
 		 * make it smaller and try again.
 		 */
-		if (size > ring_buffer_max_event_size(buffer)) {
-			cnt = ring_buffer_max_event_size(buffer) - meta_size;
-			/* The above should only happen once */
-			if (WARN_ON_ONCE(cnt + meta_size == size))
-				return -EBADF;
+		if (size > max_event_size) {
+			cnt = max_event_size - meta_size;
 			goto again;
 		}
 
-- 
2.56.0.567.gdb80ae8cd5-goog

