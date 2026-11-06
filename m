Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988488;
	b=Jg25sF17gHQsp7oJu2kp5n5kQ2/HpbnPGL8R5F3UMMB0sWdwpKk8O6c9h9W+juN0QCu/
	 0bOll0bOA8HlvXK+/hIeWOoxXTfVhD1IAbnHyv/rI8mRTPbikCth13d5crEdiYfcMSCda
	 Ix3sEyBaf09DIo02BELgnUWD3lTRHGtk9BMSPHS0ydBD1gKpV0MRgvhh+E3CSHiu7+fqb
	 GOdhEr2ZPQKM/Ca4ES+q70nymTzqBDJF1Klildn6xWNxEWhjW60w5pLRUo7pH6stz5ZyB
	 Z9mQx3WUjAzt+2H6lJaVWue+FJ+6UhLD9WBf65NCWGsm9Mi0Ch3EaQm3pbqQE7KJXdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+jXf5VIa4S1Z0Gmb+6hGuDOo/rmHYpFX4asd+dpjPrg=;
	b=WpR+V/LUPVlr47ds4b38rzAze+4gU9OxNPETV2Y0cZ+n0WuaCNliqVeZdGOzY8snGoLV
	 Wgrdy6FjieZAT2Uct5Md03zeGVPoZp/6gBVA4zjKwWWxstVnbcT3ipII3eNWXp8yUKbZM
	 tMyfJr3IQOXGSgjBpoVcGKNZYxGXbULh1nOBD9QaVEOMvDWdTOWWoRu2DYEYdU30zzafi
	 IUI7wSrxdZT1diEHwc05wRLolEqAjqJEugclUfNu5Q0hDZi9HGIgSS5NCpsfx7qT72Xvq
	 n2bX6ITU8OwxD3exZHfZ/VDkUVhTW7/PGmWadsrmq0TCIIJi1QhR69dlZk1BqBa8D7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hS05jrxU;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787476083635
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 787476083635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hS05jrxU
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a027f2e364so7769245e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988487; x=1794593287; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jXf5VIa4S1Z0Gmb+6hGuDOo/rmHYpFX4asd+dpjPrg=;
        b=hS05jrxUXFLiRzDNOI/TMO0g3gfX5G9+cfxkwZ2JTxjAkK7kIBu32H6lFiaglxhuVQ
         6tgWlfA++3Ko26Q2v2akxN2jUMgQ0JPtYPP+7u3AZuDr5w0KN4NFupNP0i48359I0Bnk
         heT0UHF8mdhq1dCv8l9oBygOJPwtBbuSKeXuxO9z4iuRvCldumeSeqrz9GlM338xdDjh
         KubnZc/yiD3cjkzeLLChXeQxwkrmd46PvUn5eNxjeSXfNM0hSU5KL0CsIPEiQuQkSoWp
         X9QEtok0AuQvJsB24rbifMPZslmWcQCPtelzskIBj40cZ7XIM5KHWGQoiXY6NE+9VyUt
         +xwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988487; x=1794593287;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jXf5VIa4S1Z0Gmb+6hGuDOo/rmHYpFX4asd+dpjPrg=;
        b=BwpQb20I/NWKn6khGWt30xmMguWKGvdTFizeYDCbLYU0U7CgD6U7B8CsflnxXpI/ns
         Zy4e/UdizSkTBPp6pO35BoXnrYDlKny2Dvlu7OsAvV/Mu0TAAgmXGh1j+suNspBOCRHq
         yFuK9m06yQDN0F1KB60HopO8lsY65xMOwYI1aYNdxKieDdZ/xdfod0gcN6BxuFbLL/9C
         hQpd1NEnF7keqrjMAxGGGNo4zAL2To9NTE1BNvBqwQ62G2pYR1Put3zE0pLORlHvHksJ
         5TnDCaa5m+oe5HCXUinQDhqqxZ4eBQv5Le+xX10PAbYVypg2qm9vGSR7WEs1NtzNoXG9
         5XWA==
X-Forwarded-Encrypted: i=1; AKwUvBxnMJqQX/tkj0nUHrAyv5Z0Qv67XwQTv10BXWPycMsAljsx4LKd2761KuAoaFf1xlCYW78d1jzlJkLsaHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mofJQc6seN3XGfgMpOllkkMiYqIQozY0gn/l4RACMdyn5jizS
	inrL1N1uoyrF9vXfkswHZi0Tgl0jfSE6NvawZQukK4vuzf4pGxl1fg5ZkZPFA3DrrKr4FznG/Dv
	ivH2uB4w0KrPPnwRcSmAp2Q==
X-Received: from wmbid1.prod.google.com ([2002:a05:600c:a181:b0:4a2:df9b:ef74])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c16b:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4b6df3fd1damr52611335e9.23.1793988486780;
 Fri, 06 Nov 2026 10:08:06 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:57 +0000
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
Message-ID: <20261106180657.2460376-22-vdonnefort@google.com>
Subject: [PATCH v8 21/21] Documentation/kernel-parameters: Add trace_remote
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

The trace_remote parameter allows configuring a trace remote on
registration. The syntax is similar to trace_instance.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../admin-guide/kernel-parameters.txt         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..ac93402605d5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7855,6 +7855,25 @@ Kernel parameters
 			See also Documentation/trace/ftrace.rst "trace options"
 			section.
 
+	trace_remote=[remote-info]
+			[FTRACE] Configure a trace remote instance at boot.
+			Format: <name>[^option1[^option2...]][,event1[,event2...]]
+
+			Supported options:
+
+			dump_on_panic   - Enable dumping the trace buffer on
+					  panic.
+			dmesg           - Redirect tracing output to dmesg.
+			buf_size=<size> - Set the trace buffer size (e.g. 2M).
+			poll=<ms>       - Set the trace remote polling interval
+					  in milliseconds.
+
+			Events are a comma-separated list of events to enable.
+			If events are specified, tracing is automatically enabled.
+
+			Multiple remotes can be configured by specifying this
+			parameter multiple times.
+
 	trace_trigger=[trigger-list]
 			[FTRACE] Add an event trigger on specific events.
 			Set a trigger on top of a specific event, with an optional
-- 
2.56.0.455.g6c5a503b38-goog

