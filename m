Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988467;
	b=4oEKAtmvkrtI/gkKwCz4TRCPxBjVba2wPtP0uRfwU9zvWcJDSsr5FLnson0DWw4mlDZW
	 CkOtBeZSIWMkYPJcdH+zauc094vHgrF44qyqgsEQnShWwOcYwBtkTGyIh6LTRq1iUVhDN
	 twiHaWuj+j2BJwH5jwZUcSEqEdO3mG0r2jzTu2Lcj7MQlmOBV689p0mulstD+ffZAS9gU
	 vWWt3rGuKiSTZmeGWZ4a2a8crkkfdgr7OIAV2XXgFFrsK5qhGNPLqV1k7QRNnXU2AV9Lm
	 gO2lX798J5WDe1K2nt+zZcJ2YLbfyEpU3BI2Zmu7w1eLUcMGYdRaV82jt9lWbsxJ9eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=3YLiYCoYt3MBqofEy/3+iGxK3/1Shjyq4GIjhoK/1n0=;
	b=zXf11y16fSXOXYJYH1mUAvpYfOnIy/ctzrXKWeRXjxfbG1nnClySBvTxiafJXY1A3Tva
	 +sP1r3pxxxwpVd18U2HIqu/OrAnRVTone5SseBaKOwksYPfEP4lqp5+7RMSVgDI91kwm8
	 HVoDiQa3b/u+NX/06g/m+9bZTmO797/QOjgFUS1i76piRD8EoiaP8uQPn1/TRmFpgP5fX
	 A59Acu+puFtb6X2ycFJ3w68YtQ91ZRyPR3Bzz4QRlJrjxc3LqXkFqpUad7qg5gB1oEqzI
	 DEj1i1gGXK3MssyK7hfeIdIv9vWhz9zmPS4l92PJ/ZG7OEXZJuVD5QJbkd1BxgR34fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="B3p/YyeG";
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2CF606D80F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B2CF606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B3p/YyeG
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-492d47f142cso712372f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988466; x=1794593266; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YLiYCoYt3MBqofEy/3+iGxK3/1Shjyq4GIjhoK/1n0=;
        b=B3p/YyeGMbALzaHph1+mML6CdYJYKLGM5FBhXRwzBJ0aWf6MuW+sngswVre9kUaoIw
         h8Gv6owzBerbnRGaYzDYK+mQCZ1laniasThEMfZy5n2j9lYZdFMT+6ETemdXP1LSjlUu
         1dKeJaPqUlwQPovpIysgkSIUUSi9Hi8+ceTx57rsIB7sZ+v+Y4adaf8iYRCmqLUGaNS3
         bPdTj3Wpd3v7RUO0B0KWR9BUuIcRtFe4pG134wWxkb89UOST/5/7zP1vMJ/VX9ox/b9P
         /vlHBOpqQkXtytrtgk9pW5aorYBeDCdskI5fbccw7/jbZ5taUGvYzl0S66v+4ag6bjBX
         PcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988466; x=1794593266;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YLiYCoYt3MBqofEy/3+iGxK3/1Shjyq4GIjhoK/1n0=;
        b=kKxQYiZn39EU5hTZqS5I4IIA1VSOf2ng1RBmA9/ZBMsSbitDzL6c7OnX2vej+PfQme
         wUa0rIwMD4/HIhWsQ1lvWV7NC2gIEdDs1mglWZhHAPamVNazVBbPn0LO3pYty42bk9sW
         eBdasBvywXHAtvanog/xmIjUKLgQ0YKXC9M8hDgbXa4VBuZdngU6YETcpS+OE5ES0Y87
         APenIm40uJQwzpp1//eR778+UZsAQwRaxmbpC6Aaek3MF9t+tJfcOKcXAGUxvMTTe0iS
         gcIEVQz1U9ww/5dqx/ugnbsYjNoJ+T5CJnmQE6evARwXxogmAnXhT9UkA1gEg1wbAeBV
         DvVQ==
X-Forwarded-Encrypted: i=1; AL+hErHgO2yoPTWS3f44wPESrgQZbsNLgi76AB2y3IRsG7sDi+tFiMk7hPD8Tq2Vr8s1srFySPqbPiR2tf4dYEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u9TfTObO4LUT+wqB22XNqTLjVjnuKmSp2tvkBARQgKSydfkwx
	XqMoKzgKBxjKUF213KNE2C1Nhf5VZs5TN0EIIv49hgn+pA095jp+xPdV2Wn53120D26VzOCcbTl
	HUNl127O0ykAkPGPpPuX2Sg==
X-Received: from wrsq11.prod.google.com ([2002:adf:fecb:0:b0:48d:f8b9:6520])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1acb:b0:48e:6651:5956 with SMTP id ffacd0b85a97d-49112301e21mr12834790f8f.0.1793988465463;
 Fri, 06 Nov 2026 10:07:45 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:39 +0000
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
Message-ID: <20261106180657.2460376-4-vdonnefort@google.com>
Subject: [PATCH v8 03/21] tracing/remotes: Use kstrtobool for boolean tracefs files
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Use kstrtobool in trace_remote.c where possible. This is more user-friendly
as it allows a better variety of input strings.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 10091ff9d42a..026f6ec9b07b 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -235,10 +235,10 @@ tracing_on_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t
 {
 	struct seq_file *seq = filp->private_data;
 	struct trace_remote *remote = seq->private;
-	unsigned long val;
+	bool val;
 	int ret;
 
-	ret = kstrtoul_from_user(ubuf, cnt, 10, &val);
+	ret = kstrtobool_from_user(ubuf, cnt, &val);
 	if (ret)
 		return ret;
 
@@ -1151,10 +1151,10 @@ static ssize_t remote_event_enable_write(struct file *filp, const char __user *u
 	struct seq_file *seq = filp->private_data;
 	struct remote_event *evt = seq->private;
 	struct trace_remote *remote = evt->remote;
-	u8 enable;
+	bool enable;
 	int ret;
 
-	ret = kstrtou8_from_user(ubuf, count, 10, &enable);
+	ret = kstrtobool_from_user(ubuf, count, &enable);
 	if (ret)
 		return ret;
 
@@ -1235,10 +1235,10 @@ static ssize_t remote_events_dir_enable_write(struct file *filp, const char __us
 					      size_t count, loff_t *ppos)
 {
 	struct trace_remote *remote = file_inode(filp)->i_private;
+	bool enable;
 	int i, ret;
-	u8 enable;
 
-	ret = kstrtou8_from_user(ubuf, count, 10, &enable);
+	ret = kstrtobool_from_user(ubuf, count, &enable);
 	if (ret)
 		return ret;
 
-- 
2.56.0.455.g6c5a503b38-goog

