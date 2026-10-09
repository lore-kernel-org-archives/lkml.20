Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6204B415B74
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552545; cv=none; b=L07w3z16u3LAI1yfjRFmg2zIo4ivXuPTDNlrv+11Ky+2G1uRXMLBMARK4ObqUqiuTaGwIA0dgtMiW+v9ZPTevVC8CJqbSwwX5+FH3mQktG6iviZ9wY2RWBCUrFiDho2TyFS9SYUPPMqZAng87PFjuYLUECJcpwPxnNgYSNYXcCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552545; c=relaxed/simple;
	bh=zd77oAJSN5ZuLQMCEq5iNjH0bvfFx6ptqLP1yQUV+fM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=htvX4PRsAmDKpKDj/XjF7aFLlhkDxlppckrlFb5SRMB7Idy7MRgNJw6Gj6znZOwk7V4eezoZ7wbLtbyu1LjnTcd7rNWS+iWMBUoDUHN+y/Di1Zoogj/trbUzyPwUYoIojF6FvgYftCOuMxHC4gJ/bq54hH+TSACRY/90a1+Tzzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QfJmd4e0; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QfJmd4e0"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a168a8209fso16168395e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791552541; x=1792157341; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rPvKIus9N9aL5wDPskeHMQIXHdNdQtdKHL3wD9tCZs=;
        b=QfJmd4e051tDagjk6oKHymahLVMXpwRmhT6VNTgzUYC42MSiIgkOdF6s11OGtXPN+p
         xpndnLj8xYrgtp6vBbU67j6S9mTF11xj+536AlJFiC8HwQWpsi5mxyS6ncFb8wYEneqk
         jMA7nU8FBAf10Niq4O8uMRz31fUTLbTljDSR66Wk65z2a94iVfHohH5oqx0KL4a3vD8r
         J1bYOGlt0qKwmjsoY98x89qvPkajjakyEB3gVy4EbpwmUKSouWYzjQX5Kf5XASaYeN1J
         jG4TngT5RtW7OIHtQYCKqbYCZE4KZecU6Uz9LUI4H5nFDIZUzv7fDIG03PAng+HrYcfU
         0etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552541; x=1792157341;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rPvKIus9N9aL5wDPskeHMQIXHdNdQtdKHL3wD9tCZs=;
        b=S/TwsvoVKnHqfJ5+SjmViRyferQyd1T0zIfc66JztGgQIwCrvPLekxdk00iga/LVut
         f7pyg+OpHLyGZ5pjin5Yyu0WmGsVIYW+xvlhPmXLLgPKxegaSR4msZnacObv020VHiQi
         Z52cw9Sn2s8OFrF/WUqHwtwwEmcrazmboIc7w0Cu3H3f8vndvIEKoNB83WHVQeB2/VIc
         o7M279y1enwqqNngrAJy/O2DME6QrhbDwGJizJA8NjeeskKfzwOBSWP35Jtg0z2rxLu2
         ffru2WPmgw5d8TyQktkpgf6t2gYxbPdU2GyJXyvcwE/4Xo3p3xHGERFGcr1LgDxFiPm0
         mnLw==
X-Forwarded-Encrypted: i=1; AKwUvBxEeTfK1WZsw++ktKL3W5rNo5SRK0ezt5dGlXolVpY3ZFOuCZkcjvJv8ACnh10KAsh/q/b2nprcEG2wqnw=@vger.kernel.org
X-Gm-Message-State: AFuF++lLQVkgCcUuZPTO9kUS52MiLCRuwWIfpbHT56CEhogWuPAG+N8T
	Rzs2YHNGv9kTg4TaSG1gucg7ETKOY/HL4OCjr/yZLNEb4Tmcgime4DJZrDwFWtsv3+WbJ3lpsFP
	i7kXsUYiCE+YVox/XCnI5Uw==
X-Received: from wmol15.prod.google.com ([2002:a05:600c:47cf:b0:4a0:cf4:71d8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a011:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a18e447d8bmr35219285e9.2.1791552541416;
 Fri, 09 Oct 2026 06:29:01 -0700 (PDT)
Date: Fri,  9 Oct 2026 14:28:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261009132848.709379-1-vdonnefort@google.com>
Subject: [PATCH v1] tracing/remotes: Align field offset in remote_event_format_show()
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"

remote_event_format_show() doesn't take into account each field's
alignment leading to an incorrect reporting of the actual field offset.
Use the existing field->align.

Fixes: 072529158e60 ("tracing: Add events to trace remotes")
Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 2d5bc423efca..7e35f48ae467 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -1098,6 +1098,7 @@ static int remote_event_format_show(struct seq_file *s, void *unused)
 
 	field = &evt->fields[0];
 	while (field->name) {
+		offset = ALIGN(offset, field->align);
 		seq_printf(s, "\tfield:%s %s;\toffset:%zu;\tsize:%u;\tsigned:%d;\n",
 			   field->type, field->name, offset, field->size,
 			   field->is_signed);

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.56.0.385.gd3acb90ef8-goog

