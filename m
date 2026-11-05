Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887374;
	b=jCY/tx4cdaFezQl4SD1IwPNcYJ2ogSVSeEJMycB11VUWzmk5YWR6QPbab76ggAvPQ/SX
	 v+/Xj7Zq1FH9cW4UB1n2wdQdCKhAb7pZ///eiKp2mRlZmawVLzG5pLKdQiAjc3C7eqxtR
	 QVpwbU+bf5OYQZuamBcv5xGkmtCsN3eJHA+u9Ilv+byFCDEWQYpjHeSOEiPyyb6pXF3Il
	 nmsOxkQkmblGTi1CsljI7KBtl5NH8cADwJt5wjNHq4vr45ZgJB3wiP87MM6sKftYIbRUr
	 uWx9no5cZjm60/kp+t5jZ9WKUY2gMEOa6NF0gVif8J59bgtz/nnPmbMmquyhH2/C1Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ccnom0mZGa552DJG6TPUMA/Iqkl36ZDF942n5bxWo1Y=;
	b=IeYls1bH3S9KETQrZK+FvvRqHjJelNKU1MAwRjWVEUH4buvf6aA+KJkjfogPb/oeBBGM
	 FMwAcC4u335S+sqexoZEUXgxNpcKqXeqsExpWDzjJBRmZteGIIqseTk0it1TvfvGHyYeq
	 EtpZgtL4mRlwQ+mZBNbPO66O+SO/H4jOzGQNLE1KSfmz4haXcR5ra4v8yL+R/X4MoCY7d
	 30l+MG6aBNxvPVVjzGBaqdtMJd8pVfTgRihSm1nkmcmWBxrQHLirT9JaeO/4vVt34b7wf
	 BCNgXUrCz1wnBWnQHK6Tj3RCIkfW56qkTGmkD2IHJYNrDUQK5JjBqdgeHi6l1Go7yHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KGrHlaFA;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A98606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A98606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KGrHlaFA
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35b2c599f43so2075258eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887373; x=1794492173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccnom0mZGa552DJG6TPUMA/Iqkl36ZDF942n5bxWo1Y=;
        b=KGrHlaFABfrQQPuyh9DhZ4bkjg+B3lEvH+y0ekE1M0MxL9p6XcNHlvNZVoGHcrlyaf
         YIyY36yVKrkBt+IF6hq7cKBFlFRqgpDffVNdesxUSWN06IdLLC97ghtZ5Cu8Vs2N5XUD
         uKWXwhVnjGkiAJLkv7kF4tCJ7eDEEQ6rHASXwdrqC+iLxbijLfZhsflQAaVp+hYMzSmn
         d9bcDbCfxfrrCboxWIcUn6eWwCb7cBOTEZttPrCSZ2pc7BVMyfZPv7C0SxOSryXnf9KD
         nNLebG6+4Yge6gSY0m+NwE9159HYASPllg/y0uoZ7ZTGeeZO1oqLagWogFAYTW358FCn
         P83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887373; x=1794492173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ccnom0mZGa552DJG6TPUMA/Iqkl36ZDF942n5bxWo1Y=;
        b=QV/qj/e+6GfYv97mdDrkABVyyOAm5cT5+yDV6B7rJ8N95+mKNwlIns/pWtjIUEIaqf
         UQJUXSG12NfQuhdaf7burs9yFPC1CAjjysUDvSRWmjfHhgvP/HiJRYian4oAxh7NDCgd
         plqKxYcyCP2fxuNQXFhBDFtUgxWXkLosAOkh0GEXWAFTAD8Fk/vvBorAaJABk9ANVOaA
         m70fhHxF7xpxbvVrQsO5qmPXtUQpkkx9lTsOi+WVCO+wEtKghD1zQqbn3BnuMi2PCmvJ
         vtSDivQepgTjSZzs765wnL5ITNSLhuL4mb30wuuWngyIQLtuJeh0RxrpsE+3Ln78howE
         ePCQ==
X-Forwarded-Encrypted: i=1; AKwUvByIer/wihn+oOqVhWPTdB9lKdtedhNwKC+9pYzouEyxJAiT/TJHEhSld6VI9SlKwOymj8WlN6CZbokFt/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XekNC31FoU4sJHN/z9I0QPhNAxZzHNXYgjOaYYh4rQAte6AAE
	aGkfK46qwNWjTEtb6GTZIUXiKW+5FcDoEEs/TlTKpt9YiQxr7646xTp4
X-Gm-Gg: AYBFou0J0PAndYeF7ECT9o9HT0Yv4unxX70ZUSHc8z6jBWSbRkW0iO0rkEspxCqX3dL
	tiFBowG4JdWufMiLy4vBave+vDSjS/GGvb5Wj96IO3K35cmH5VjAkzdFD0yz+r4oAB7HmFEA7qQ
	ljcMJJCnESslBGHjl0sDjV+QS21pYKuUHcc02zyTBz7DT9Tvhf98TpbXwFIA5D/yquJL4PKLnCX
	HL8sNhKDExJrJgx/W6/+VACM6yA4bd4IZclKZ+VLGbfBo8aaGbbJ7PPUrTc090sL6b9Uu9qUsMt
	ELIsLtCjnelwGnFwCUAogrbEsSoMC2f4mLJs5mESuuqlAHiwz/f8ujn4tPIf4qrzGYplRtcz8DV
	Z+SOndb16IL1oOQXy7u4x3cUagiBnuJGPxfcOo0M6tyTM8vWMBZZY7DDSCYEEVF1CgM9SkrIp/y
	tUB/yt43HFObq2N5fHExA6ibqOzOmqKSIpCexPrffGStS9BvBU6FHD/4+Jf8waQ2nTFaF8tJxbb
	XXosCuJ8co6/LjHahGCp/gha/wuo+nGClttBHtEMoQn5ljsOjT72YR7k0+GQv5IIOzHt+k6/Axg
	GCUq+lr4yQWS64jsZZOY2qaxXOe0TIGSXrlw0Fq4k4Evvq0sdAwkYAnpYOo6q+8KFgGFeA==
X-Received: by 2002:a05:7300:7c16:b0:36e:1fbe:3571 with SMTP id 5a478bee46e88-36e1fbe3944mr4304252eec.3.1793887359174;
        Thu, 05 Nov 2026 06:02:39 -0800 (PST)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm20969616eec.24.2026.11.05.06.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:02:38 -0800 (PST)
From: Xiang Gao <gxxa03070307@gmail.com>
X-Google-Original-From: Xiang Gao <gaoxiang17@xiaomi.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Gao <gaoxiang17@xiaomi.com>
Subject: [PATCH v5 1/4] ring-buffer: add ring_buffer_memory_size()
Date: Thu,  5 Nov 2026 22:02:18 +0800
Message-Id: <20261105140221.44614-2-gaoxiang17@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105140221.44614-1-gaoxiang17@xiaomi.com>
References: <20261105140221.44614-1-gaoxiang17@xiaomi.com>
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

Add a helper to report the page memory consumed by a ring buffer for a
given CPU. It accounts for the data sub-buffers, the reader page, the
cached read page, and the mmap metadata page. Unlike
ring_buffer_capacity(), which reports the usable data capacity, this
reports the full pages allocated to the buffer.

The function is generic and returns a size for any buffer type, so
callers that need the memory footprint of remote or persistent buffers
can use it as well.

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---
 include/linux/ring_buffer.h |  1 +
 kernel/trace/ring_buffer.c  | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index 649b2276b557..e83e94623e76 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -174,6 +174,7 @@ int ring_buffer_iter_empty(struct ring_buffer_iter *iter);
 bool ring_buffer_iter_dropped(struct ring_buffer_iter *iter);
 
 unsigned long ring_buffer_capacity(struct trace_buffer *buffer, int cpu);
+unsigned long ring_buffer_memory_size(struct trace_buffer *buffer, int cpu);
 unsigned long ring_buffer_max_event_size(struct trace_buffer *buffer);
 
 void ring_buffer_reset_cpu(struct trace_buffer *buffer, int cpu);
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1fd28a72e6ee..0396ec671998 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6566,6 +6566,43 @@ unsigned long ring_buffer_capacity(struct trace_buffer *buffer, int cpu)
 }
 EXPORT_SYMBOL_GPL(ring_buffer_capacity);
 
+/**
+ * ring_buffer_memory_size - return the memory used by the buffer (in bytes)
+ * @buffer: The ring buffer.
+ * @cpu: The CPU to get ring buffer memory from.
+ *
+ * Returns the page memory consumed by @cpu, including the data sub-buffers,
+ * the reader page, the cached read page, and the mmap metadata page. Unlike
+ * ring_buffer_capacity(), which reports the usable data capacity, this
+ * accounts for the full pages allocated to the buffer.
+ */
+unsigned long ring_buffer_memory_size(struct trace_buffer *buffer, int cpu)
+{
+	struct ring_buffer_per_cpu *cpu_buffer;
+	unsigned long subbuf_size;
+	unsigned long size;
+
+	if (!cpumask_test_cpu(cpu, buffer->cpumask))
+		return 0;
+
+	cpu_buffer = buffer->buffers[cpu];
+	subbuf_size = PAGE_SIZE << READ_ONCE(buffer->subbuf_order);
+
+	/* Data sub-buffers plus the reader page. */
+	size = (READ_ONCE(cpu_buffer->nr_pages) + 1) * subbuf_size;
+
+	/* The cached read page, if present, is a full sub-buffer page. */
+	if (READ_ONCE(cpu_buffer->free_page.data))
+		size += subbuf_size;
+
+	/* The mmap metadata page is a single system page. */
+	if (READ_ONCE(cpu_buffer->meta_page))
+		size += PAGE_SIZE;
+
+	return size;
+}
+EXPORT_SYMBOL_GPL(ring_buffer_memory_size);
+
 /**
  * ring_buffer_max_event_size - return the max data size of an event
  * @buffer: The ring buffer.
-- 
2.34.1

