Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910506;
	b=QqfkB0AbCicR2y6cheGS2wa1F36UdAWwcI8Q/PB69P7cT3mAFsFzj6J94A8PxYyKEyIV
	 aV5ozLuubn72x3tUlAAkmjS6aBYfYT1owbr+RwkX7Z4G/gJ1cldDInO8Q6RUrkvUkpHNJ
	 UxBLqkoP9G7rh+A27HO6T7fnMF9vgdFCFq4QuZLGzhczOilbkvA1Ky5g5m6lkbR7Od7sC
	 0pSmETqtvq4+48Cs+sjmS9An653APng1DJ8voFKyTDsgLi2gE53Z5UGJ2iLP2QXE7GY3S
	 jBBzpyq3/qQVcwyv2Hsaib1/Aq6qyVBJR3iwhvHtwKZqbsNw7OUBiwy3RUffu88D9DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=n6u88J1zozBh4kFSEo95PNcaqQJ8WiATMgsSjSjkODM=;
	b=JflEktKUIfFHlVuAPlFSB0kTQsjtAcl1VnNV64X1eTZ6qjQshZL8vm2Z2iZEJbwEj9HN
	 9TvQ7ARqtmBg1IMuJBJY1adoljaMT7bk9FMAEDzRVDCnlPs3yjzz+YD+ko6I2TGzYoziJ
	 N4CVFMq3n51ZegPDhHCrdhWxDzbISEzDAnY2Z+Cz2Pm6cAq+XOUdmJk8DNeg2DubqD4Pq
	 po2uZP//m0gZZZHwnqDrP/Tp96GxXwq+3TCrAqRJ3AgxcObAVNmPV7FT/k+tQgLaPpC9e
	 hknofbj/6ODcfo3nysrHfNyGxNL73SDTtAB1AIGypCs32qvgl6zEq/ll6ytlP52GBdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZfZufuIh;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6F6606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C6F6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZfZufuIh
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-490c1867460so907619f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793910504; x=1794515304; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6u88J1zozBh4kFSEo95PNcaqQJ8WiATMgsSjSjkODM=;
        b=ZfZufuIhYzcCIVsVooKDuL8PYkUI4jjGGU7GP5z4SkMu1NKzF4+7WCa7Ad+BN0jX6E
         tunwdcehPLOg8pqiEjO5H4jQoeRlXKjPMf7m5iEeHFVGYHIPBSvncoRbfKda+86I6Ebt
         WdfpVx2CTY/AjjN0kNi4yoxTYZ9Mo/XtrSLu/fQfMgj9pn/X14pgJ9h9GXgGZ1rD6DQS
         8VAn5rCgpJQ+2+5S3FXh35XDdPTC8kv5U6fSJ0wjCIHOo5E90GASLSMZVVwcQC06RAwp
         s7zIZ6ICZeZQxg1R65ZSPAeBzA3ShfpxKeTUCA6pNbTiXzJ+tKdUb5f4yGZb/my2DAHN
         /Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910504; x=1794515304;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6u88J1zozBh4kFSEo95PNcaqQJ8WiATMgsSjSjkODM=;
        b=d9ckK8e9SYkyGdMLmlyiowaLHHakWKoUTKlyDPTjZ8b3hZ5Q8O+OCHF/kcSfKg5kOT
         sw3IEmxZvbhqiy/G6povwSXLY4XqV84hY+T+3g0c0S0/sQW+4tY45GGYDpIrc+r29r40
         eiadkam1ZuPhPH+xUgxz6H3swY92Cq6pHizDIGe4p84ZIVbPlIoGOi23MpjTg4RC0UpN
         RJWVZGSxA8Ry6ekDddV9f5Kwc9gmotZR72v8walElFv+j/fvo6hG+txTBiclOAbxUV0v
         EiDybkLrc96qa6pHubhwJqqkN2QRjGm/Uy3at99ybDv1ZilwT5P4/Hy9t9aB8bEVuuKd
         lQ5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxJjs5VKqt730st9OYrxFWQz9SJK9ddMQZCvsA2qXXu0A0HhrUC8V159zgnOR5ooaASkUIixUMvnG834Ec=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XMObyVeTJ3zQXSF6UzvVlK3cXc1CyiOSMa+o1FVI/nWOhXNh2
	R1rejmBB1tumNwuOkOGGZKSyLwMmtCBgZQWJlpTcjZ/K15w5zZRiAAMvN9XvM/RkKaYwPEy3FWp
	mHnzxBeW6Z0RLSWq8TnZ6bw==
X-Received: from wrqb7.prod.google.com ([2002:a5d:40c7:0:b0:48e:ade:5b83])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:402b:b0:491:3fdd:af42 with SMTP id ffacd0b85a97d-492777dbd5cmr1404295f8f.37.1793910504239;
 Thu, 05 Nov 2026 12:28:24 -0800 (PST)
Date: Thu,  5 Nov 2026 20:28:14 +0000
In-Reply-To: <20261105202814.1350312-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105202814.1350312-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261105202814.1350312-3-vdonnefort@google.com>
Subject: [PATCH 2/2] tracing/histograms: Drop stale absolute timestamp note
 from docs
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Since commit b94bc80df648 ("tracing: Use a no_filter_buffering_ref to
stop using the filter buffer") stopped using absolute timestamp for the
histograms, the paragraph about timestamps has been stale. Update it.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 Documentation/trace/histogram.rst | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
index 97b67f05f5ea..9b301b86a4df 100644
--- a/Documentation/trace/histogram.rst
+++ b/Documentation/trace/histogram.rst
@@ -1676,12 +1676,11 @@ features have been added to the hist trigger support:
 
 A note on inter-event timestamps: If common_timestamp is used in a
 histogram, the trace buffer is automatically switched over to using
-absolute timestamps and the "global" trace clock, in order to avoid
-bogus timestamp differences with other clocks that aren't coherent
-across CPUs.  This can be overridden by specifying one of the other
-trace clocks instead, using the "clock=XXX" hist trigger attribute,
-where XXX is any of the clocks listed in the tracing/trace_clock
-pseudo-file.
+the "global" trace clock, in order to avoid bogus timestamp
+differences with other clocks that aren't coherent across CPUs. This
+can be overridden by specifying one of the other trace clocks instead,
+using the "clock=XXX" hist trigger attribute, where XXX is any of the
+clocks listed in the tracing/trace_clock pseudo-file.
 
 These features are described in more detail in the following sections.
 
-- 
2.56.0.455.g6c5a503b38-goog

