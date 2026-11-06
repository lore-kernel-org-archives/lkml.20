Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988469;
	b=LGtzMLYjL+t1IQkvULPcK59hy5/DhmkVhDvO5ikF6BHX2UsnHF0RnTah3/2lxSCFNDC7
	 3IOQ8aaclQVWvFqVHwNidtvgyG1d21FaYj+Y5rOenaCNh0xNcfCmuT7EifGOg3YL+DjSt
	 VmJPpr/UyL8k7PKAgvCQNJU5aeFH9fXrPLCTMhBE5Gvre5aTkk4OOJVVHsfM+dGLGfRNi
	 zU4GQ5GByQeVzqiYViPyB/wPW4jZCamnW8SO0ARao4Vz38jR5wUG8p6qQ/6hCTyvj81fn
	 x8U6T4L/9Qir1HBthr0fB82gFceTWLTACsY17lT8JSH8Ddv0jLqKw3wffzdQuSI5DCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NF+p8TaNog+GEkVOzYIekPEmlnmf2+ljMEUGy7nnhKw=;
	b=xzJz/EiYy/xaU+PKl7HY2Dp3VvBECzZeYCnkpVA1XfFcxfJRtRgnbPJr9coPSDIQs33l
	 SYAMm+du2+an7VXB9d4X84e4tErhl2bQnr9vBAuD8TZUxbnVKDLdM6x6O0pxI2kptRs8f
	 n0K/GuNRdCNaeAn6sxQMASoy7VIZfwKCu1xO2l6TwtPrBp/GWVsS9T3ZJFeZidpcdverb
	 NN8981l/9dtZqAOJmHLVLH2qVMN5AoKiMdbt2a29M7GSFfR8oDirasyvT9XkpbWajajFa
	 yqD7E4/znhPlSAIouT+8ksp/WLoqQC0UfgPNkCdehaSzqvwp+IOiCpnPAlvaCtTf1KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMcvktGq;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36AB606D80A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36AB606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMcvktGq
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c4d288b67ccso88877566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988467; x=1794593267; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NF+p8TaNog+GEkVOzYIekPEmlnmf2+ljMEUGy7nnhKw=;
        b=JMcvktGqzIA8+4JJXWq2y++Eg32OgX5gCXGTkEQoSungUlwWkLG1B/sVFGZ/6xAA5y
         uhkCp8i++G5MhrzIiGLRDnDASCmzfj10zpC+/Pjn4KZ+ZC4awVlZb0zUtFCuoswhQG7z
         7Bow3psYj8eaM2vezN09VlBX18PFKg1i+wWDmmPinj63ECAnF468j42k9MEJMo1lc2Ic
         +I9ylLxX/SgI5n1aSljEccPLEvi2jz2n3cU7VcGwBX9KywQduaS78xhqvFPveYgJ5bvx
         hy0VdEhwjVSFWKvMAQR+357rZ7YLK1rMKldyJVOLzyVv562kmo8OzrFJ08BVF5nzpRbn
         LcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988467; x=1794593267;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NF+p8TaNog+GEkVOzYIekPEmlnmf2+ljMEUGy7nnhKw=;
        b=vDbI/PkPJfhzlxk0RTZvrhwKdJNdnnpSfyVrcZYy0BXOpw8Kh2XnP6vt5fTfZHrvcL
         Yqh7YgOrm5mZmZJCmy3pbUiU2ZIDMLhI3mwbUt3kPdpZZLxKby+rgpmAGxVO976yC/25
         6EMJqyvjUNGdqu85lEASNwxF8izLR522Hioq6+MQDMzbVetyH6TE35Z4s5qNjnrAimSF
         c3CS2bPQuhxqNSjz14El2O8vCQY6IuRAc7/vvQ4RJUK/Is3wqr1RJgTXbHnreLBLM/bs
         aCc8ewGfDowPFJcYw2LC1W13W+vnY5d5LMzvZf2ldOv2mBRyY4VapZ6fN79VAdsfNcoF
         V/jA==
X-Forwarded-Encrypted: i=1; AL+hErE1kO/38s2fLMcdsSPWPupATOGly61F5CNzdXe0aZHO94R2dWmrPDKd3XCjDNuMoJQBLIPnhqULJ4SaFXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pG34k5CyJDDgcKQ2Javhcgrcr/8Z6KU3u9g33S3xfSzzwuSFe
	PcZr25sNWMKqF+nosVoy9p4nR2G2KrjczVO3xcCm+sKbKAGn+/o6NAwZ6cjtdSSBoJXpT7BdBaM
	b40falfBP54/SNNa2Ste8VA==
X-Received: from edk3-n1.prod.google.com ([2002:a05:6402:4043:10b0:6b5:8758:c1b6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:400e:b0:6b6:f3ca:94c7 with SMTP id 4fb4d7f45d1cf-6b6f3ca95c9mr952111a12.12.1793988466853;
 Fri, 06 Nov 2026 10:07:46 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:40 +0000
In-Reply-To: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106180657.2460376-5-vdonnefort@google.com>
Subject: [PATCH v8 04/21] tracing/remotes: Initialise pos in trace_start()
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

When *pos is 0, trace_start() passes a dummy local variable i to
trace_next() to fetch the first entry without modifying *pos. In that
branch, i was left uninitialized.

While i is discarded and causes no functional issues, initialise i and
keep static analysers happy.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 026f6ec9b07b..317ba3124343 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -748,12 +748,12 @@ static void *trace_start(struct seq_file *m, loff_t *pos)
 
 	trace_remote_iter_read_start(iter);
 
+	i = iter->pos;
 	if (!*pos) {
 		iter->pos = -1;
 		return trace_next(m, NULL, &i);
 	}
 
-	i = iter->pos;
 	while (i < *pos) {
 		iter = trace_next(m, NULL, &i);
 		if (!iter)
-- 
2.56.0.455.g6c5a503b38-goog

