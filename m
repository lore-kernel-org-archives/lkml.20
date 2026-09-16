Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A59525A66
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572523; cv=none; b=Kl9WV94pyx3TLCDVPOE7bhcR1hEsIEkjv1msh86s4517ChQ6HKa31P7clyMFwUKkHY0pgUmZggGiVsFfgC2BOA/S8jvtrdYvwhoXVdN6XLWahwC3uNWZBXqW+wdN14W+9MLXwnSzrBF0IR8NCEpHXt3KXcwdYayUunOnahuCBNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572523; c=relaxed/simple;
	bh=b2FawjnBtz5Mv+Hqt1A70ttINqlSdk+8EePa7KvLAGI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OZOFSyYV+q5AMY0NezaQmM8S0UltnwTEOIZHtw10Vw1LX93gQq/cWCge3GLY6NcbWsqkx1ZxXSe+9MXIQj9tHPwOU7+n33jpCO1ocvt7B8PdVI2E691ERbfDZ260VglqaSxstD9T1YzHh4YA8IHJgZ6nfpgTgaa5fJlA0C1C+tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BAhX2B2N; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BAhX2B2N"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4870142f030so2193111f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789572507; x=1790177307; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HAKYIppDzHXSm69+TkNK1O4RBm3XWQ0MkKJ5dia50Yg=;
        b=BAhX2B2NuO1xxdLoeyqdbGYip/sx7rivnMN4iXQb9fMtmbeVzb/u/toeo6WPPHJB3M
         V1TnqO/w4z5ALXRnLMXdW9H8Hm+Z043sXq4G0xKniNBcfOCGghLBw1e8j1ssohtas6OY
         VD9S/rvHLsr+4Ol/bKsfc9/IMxWPEQfiZxQUVXx6rNovrojqH5nl789zzp6UPJUwOgNC
         +obXF7TqjkMSR4XKg1QWB1m+e9CLoyspQtvjXvI/MWc/GPWViB7JxQxQnZmonjiKSCK/
         OQ5WdTK3FASlZmyFNzZ8pEE+awC6Yz2GVYLJhnDBBQZXW/BIk4OKybGvd3JbG8RX5vaP
         3BWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572507; x=1790177307;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAKYIppDzHXSm69+TkNK1O4RBm3XWQ0MkKJ5dia50Yg=;
        b=UGDsKYiSd766cR0xa3TYPHYRK1VHvqx/JsqclXp3ZgHrq/womb5Ff623Zi5NL0TRaq
         wTzs7XceJkiotCkGOReKwU/0GgchJkgphuS9S2EBbaFMgD2E2h3DyY7JJBD0YXyrePQW
         21J2IrmA/y+mUsvolJBQxlLam+yyiCcrJR0qhcxGfIzgK2zQgnrNmoUiX7jp+z9c+C17
         lb0W6eKUjkmTlimr6j5VQusQqT3buMjvvwpyONsSmdHhwecD9W7cMBN08u78dW6g8ZRK
         5sRFCEQqFfZYsv7oAokEeK+ftvgGe/QWB5CHeFCm2mHfPKiORpAIzz1XjrmkLPZlW2T1
         IAvg==
X-Forwarded-Encrypted: i=1; AKwUvBzHT0/OnjLvDFYJOX3hig/bNrn6FAkomS/p/FxyeJWfcVQBvSSaGkBcJQR/use/NR/smUt1mIEnUBTk+hY=@vger.kernel.org
X-Gm-Message-State: AFuF++nLlyTIKbgLyCqriGDpInO7ibnAXaAxPzaiurcN4otNhF55m4vc
	m7hfbFPon1+b+feL24nGcuitdJRrc9wPYXwv2hW+psnVBF1d+mz3bZ0VejzouimKYNNlHVUU9t1
	+AQspAVdQYu1+qqluaA+aNg==
X-Received: from wrnb9.prod.google.com ([2002:adf:e649:0:b0:486:ef61:1eca])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1acf:b0:487:41c:515b with SMTP id ffacd0b85a97d-4870d05a818mr4089631f8f.30.1789572506148;
 Wed, 16 Sep 2026 08:28:26 -0700 (PDT)
Date: Wed, 16 Sep 2026 16:28:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260916152813.105082-1-vdonnefort@google.com>
Subject: [PATCH v2 0/2] ring-buffer: Clean up resize_disabled checks
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, devnexen@gmail.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

ring_buffer_subbuf_order_set() checks for resize_disabled twice under
the same buffer->mutex hold. Moreover, this check duplicates the logic
in ring_buffer_resize(). Create a common helper rb_resize_disabled() to
factor out this code and drop redundant checks.

Additionally, remove the unnecessary cpumask_test_cpu() in
ring_buffer_subbuf_order_set() as for_each_buffer_cpu() already
iterates over buffer->cpumask.

v2:
  - Split cpumask_test_cpu() cleanup into its own patch (Steven)
  - Remove another unnecessary cpumask_test_cpu() (David)

v1: https://lore.kernel.org/all/20260914175907.1027349-1-vdonnefort@google.com/

Vincent Donnefort (2):
  ring-buffer: Clean up resize_disabled checks
  ring-buffer: Remove unnecessary cpumask_test_cpu

 kernel/trace/ring_buffer.c | 70 +++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 42 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.55.0.1082.g2b9226bbc0-goog

