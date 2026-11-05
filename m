Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887404;
	b=psQrBCy/Fgr2mpsRK6qUuwITPhy9bXdIJBoxerFGL266YdEjxtdslK3kViEm7eneRoZC
	 uO5bfihquJxJQY4vB5rVJTlJgz+wX3oUHFzBVg/tvrvMIcmuSL3aFk8SinuW7AF7p2nyd
	 +x4IjexAGmvnS8G1tF/wmUkvvxrOrKCSokWwpKSXS9BpB4gfDCcfTu4t0Rnd6cLUtw9aI
	 rV3yQYTgXs6A+z3wVWvlO6l8eXBDFgoDwfZWT12j5aBfgdxmp3AkSJdZE5Yb5glqJ+Hep
	 EX+47y/yYfYlOb6Wap5CBoMFrGWOK7ENe71XEplxmCkh9blsihTvG+yFi75Y3B3YRBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=q3zuYC4N+4jQg9NxR8G2yKJ6ru0qT8VeCTZSqUBui/g=;
	b=5FqTVp6OcjRyqI7v/2wapSpLhW73tiuz8q0newZHLxbLbkS4JoR3+kUKcrzeFPaSbpbg
	 /77AoPeTYh96KbYK734xw9MRzufxinPgLAoTh6BDc76HUWXjrlJkBtdhuWpWmhzBpW005
	 l8u/pEw7WSmurCUiBNtZhDemBgjRUZTUApd2Kq6OiPUESJpfB6HNkAkvpzXKUOQj5EGjt
	 4aL5nJRy+Hqp0n/GVzf+jlqaJote4Ei+dr8C2wAu2/AjB+y3S95tlRiC/D8TO33QcaYDb
	 7Q7T5bMiF8NbOsDWS/gO43/IJWMMQAXfH/gEvN3afTQ6KzBpECp01oqeFDWY3k3qlKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YjFgMmYX;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68B3606D818
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B68B3606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YjFgMmYX
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36d6765756fso2217058eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887403; x=1794492203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3zuYC4N+4jQg9NxR8G2yKJ6ru0qT8VeCTZSqUBui/g=;
        b=YjFgMmYXFwlaHwMzX29PaiUvO+EMotve+U7w4xLuFRkknkgMc1Bu2sIdIkhSlDWjTs
         WSVUCAYAVPSa9OSqKVkCK0ciEgcIKhYAiKwh9PnYNUyUvSucoEa2ZLoTs/jgkouhUvTq
         EAtv6KeIvF+bM1EQERCmBEYHWCfZRqnL2kGjU8Zv5JnM8msN94Efi1EXI6KTK/4AeTBZ
         8Sbhr6sIhFTYmonqAhuxaPl96JJjwDaz8L8OdhZ4tcnIQOb5XokHo5Rp/3GmjaY2kI/G
         22ZzBO1ufO2OU1lHc/dN9ZjAsETgRgdHlvjH0ySvoRtTVHwfcThHtdouCKkIpWO6+F46
         qi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887403; x=1794492203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q3zuYC4N+4jQg9NxR8G2yKJ6ru0qT8VeCTZSqUBui/g=;
        b=bBg98+HEIDmpV7QKLHswFXHqmeZErw4J59iD8it6tDv32E9kHex9ArBk7kEJcYSGlr
         +AxPda6n398x38D2MOVxty2Yuvav1wLt3CMEMGn0o/abHVlQ3M7a0Dw1LHK9yt/qzyQd
         fBz3ySOBzqkCy4CWMbU99hIOiILDR97jOb+y4/qiWxCuuIS6hoWb5DzeZGNimVRJ74/V
         UEDe6PkN6etziZ5d8d7pHdWhzaju1vbxg7tpbPMN5XYyX+pSxv1V9p1A8yR0chTlWkvH
         HqK1hSVPi2DO1nhg8xmBoZGM4wou3VpRVADynXw+ITCy9q6kPcPNGx76U0HQPXLM8ScJ
         Tg+g==
X-Forwarded-Encrypted: i=1; AKwUvByNFjm/bhH4t0TgbaXUa7BTLNsELq4dWBKW1xTFgnZmDBwWxh0WHHKCI3jzi03j0wFOzGRssk0TCo7KV1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DZC2KjrhnJWS/2SjWHAcbsD5pE34zYOBVSqX9XVjiyOX3cBTj
	aWyFAUhvHNv1uh/jJ3ITU34Q2qVxZtvTj/uicrTCz0TeUh3Og5JxyR2M
X-Gm-Gg: AYBFou2+n1z2Vod+l728HvEGGE9vOl41VVNTJyxD4IqDLgizv80XL4n8m+N5el/VkIa
	I38MLRAOawBU8LexnWj8SiVrMMaBvRqDUSvaSfI0we27VG37xNsfJWsJtmvSaRp0Bjpw+UE014L
	Cj95J9MJju0HQFTd0Cg3vSzJJW/oOhlSpRNvk3IBviHYw8eJeGea2q7WGhG2VYekEmnGmdNWKIx
	GP8jTz27frHdfJxdH/SYCn+9Y4MthIFoIOaYjuu8AaZgGM2ueYtUmNfqjh9NtyHut4mIYNjvUry
	lMo8GQRMjiPkhcig2I5BHVsbieSfCXOGsJu2QhDzSBLB+dJzQJHqevnuki59fPYVutGo1ecr4Lj
	ALOslqGnQneV9V025lkXlCASaPaamEcTL6DjKYX+IIDoRfHezAeytSUoSelJ8P5GtXeugG2o/m5
	glHvGpYA3yIaA+hu0KCymRlJCwdlUfs+08Sdn4433kgeISuQECZ9r54zuHOqPaGnhpmt8NTxLAF
	jmcVSJuoTyh+HTZ/ai1tlctUW/1rkZ0wy3qjG81+4PB5V4yamG7jC+qugjl7GWreZy25va+3QH5
	PcKpoqOj1uvnlPoTFpSmSjvMDIvhmw/LmQoK8XCnl7Xe1r5tVIcOiM9SQX8mZOQld0zRvwQzzFd
	yWSiD/4Nwjhdn8IQ=
X-Received: by 2002:a05:693c:6092:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-36a424609c2mr34113914eec.35.1793887387708;
        Thu, 05 Nov 2026 06:03:07 -0800 (PST)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm20969616eec.24.2026.11.05.06.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:03:07 -0800 (PST)
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
Subject: [PATCH v5 4/4] Documentation: document trace_stats memory_usage_kb
Date: Thu,  5 Nov 2026 22:02:21 +0800
Message-Id: <20261105140221.44614-5-gaoxiang17@xiaomi.com>
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

Document the trace_stats/memory_usage_kb file, which reports the tracing
ring-buffer memory usage categorized by buffer type and memory source.

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---
 Documentation/trace/ftrace.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index 9423722848c6..d7af1e37e6b1 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -218,6 +218,28 @@ of ftrace. Here is a list of some of the key files:
 
 	This displays the total combined size of all the trace buffers.
 
+  trace_stats/memory_usage_kb:
+
+	This reports the memory consumed by the ring buffers, as opposed to
+	the usable data capacity shown by buffer_size_kb. The value is
+	categorized by buffer type and memory source::
+
+	    global:
+	    instances:
+	    snapshots:
+	    persistents:
+	    remotes:
+	    total_system:
+	    total_carveout:
+
+	global, instances, and snapshots come from the page allocator.
+	persistents use reserved memory. remotes are not yet reported and
+	are always zero. total_system is the page-allocator memory, while
+	total_carveout is reserved memory that was never in the free pool.
+
+	The same file is provided under trace_stats/per_cpu/cpuN/, reporting
+	only the buffers belonging to that CPU.
+
   buffer_subbuf_size_kb:
 
 	This sets or displays the sub buffer size. The ring buffer is broken up
-- 
2.34.1

