Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412217;
	b=YIbqDutxUaIOukUmjQI7vsp4R2qvxiV/Sp2nEr6Wqlmoj3u3XZpAjSWTRyxh60wBxYzr
	 gWsVMsN7buI6PuA7qJsFEwj03IticSkKW4qKfQhwgblhETh4unaM0/tfC/w+iFVy56rzS
	 TJ1m/GjxLAMTWRj5Hxt+JFtsYF5G30UyAu3MAtUyJ1kQLPKQJAeV6T8F5HEPkcZM9+0N5
	 mGGSrx8V3JHQ/zo5iS9CW21EO/gye80vxLDOEpNK2qAy8uL+s+TDwZTAnHvHQxMf/Ugkw
	 T5fCQlprhoXv0dWkqyPlzrvBsfpXOAYiStWHehL1JdFNkNG14ig6hIeoXux8FPRtjhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OmhqdGtVntrssGlTkjK6VX+9KY8nrwvikDTwqEXEgkc=;
	b=4hqBByWm6/azk9AeC2hqk/34VMuJ/AHDmLK+JwT3c1rYP7AhTO6FLy9bIeRvHsCAqjQY
	 LHYMgPNSleX+hXSaiNsihcsg/YHZdZc/fe/kzfCPOdS1WTNvTAFrxdUdMWVIqv8cxL0JC
	 QywUUx6x63DYspjFyLh6IxNe3axaDmAlcBsC3j7B5vuSZREbWY//3kbXUTB8SYPb0pwCU
	 nTECxl8Hz1wMpkRJW3W+RUSCiD7/jPq1ZZNL3lxnUL30dlefjuP4tDC0KsqpG+tPcMTCG
	 Qu5vJk5Jv1MOJMe521JOX0p2IvaqDl4K/jythOmReghmPhMJvC/C+096mDjYbonvxGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XmBmsHLr;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364CB606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364CB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XmBmsHLr
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so29047945e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412216; x=1795017016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmhqdGtVntrssGlTkjK6VX+9KY8nrwvikDTwqEXEgkc=;
        b=XmBmsHLr09+D8oJ4bVJ+qDZNbakkQSpC55bIdQl5a/p3+F1KNR6XfnXLHKmCOUNDx6
         BBaHlRy4mmzvIJ1cIdf1y5q24+Bvd3Fl/qNsJdM+3H90XdZm9MIgHk0vXru81bzWHHzp
         pacPUPBr6Y2lHtUF+oLJZPBb1sQLPE6zfX10xilZUbYJ2fl2HUXyKdG7+a0SU+bRnEph
         b0PSpTRAdSzIoE4yB4IChhh0RCLbdR4JNGjUzgS86BUiaKsbI3b7wgGNhWBn95Yw9Kzn
         Fs0ttewq4RWJqREsg5mHuwhTsMMBzLcfmNS+yAefw7NU4o41PiPWWQunTijl17Eqn6w8
         HKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412216; x=1795017016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmhqdGtVntrssGlTkjK6VX+9KY8nrwvikDTwqEXEgkc=;
        b=jADnbFivHxp5ULLUZ/8h84ocb9hpKDKRh0Ftza1pRGdzZmdAvArpsGbyRWByfL/qvl
         GyKGrzH2dIVjLyyU1dw/e1gPuS0ObQd6MAby77kJ2u3jYp4tcmqEq8bIBzHpnKf8Egjd
         f2fFzCtthSN6rMNz9cJGJWyZ4beXR+u+Yzlki1fDipxfImuSfqlz7KLBF8icxhGDgXV5
         cmAJsxRYyFSjNVbvLuRe9+JwyjHEtpcZzjYUWwQiOxQMaAJ9e2V98aYYAoDtGph+K1Ne
         kG6JyWJ5IIw0R0qSIR3f7kBMvsDmIxqsQTpuJfyf8eaeNbQEQBtpZiXxlAxyjZ4r6YkX
         c3yw==
X-Forwarded-Encrypted: i=1; AL+hErEPUFjGk1qmMQkIUY1gHpbJe8imHo99MojPcGwLd7OOE2KgdEs0xYM9XnjBbQ9pG0xdW0kkI8yKyAO1bpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RpPLS3ulRXfeCYwb0XQnVuSVZN5fPtRaxNEjf6XLhcyZIMsF7
	q84XdiQa80rC8k0/9bnGzw9TAd138DCsTmfoubKQatI/NRWfkKXsAhKy1jnebOmMSio=
X-Gm-Gg: AYBFou05fnruRtCfSWZTJOQ54hnekh4CXOY4OtgyTXMnojJ66rfs6V8ICcIIISE2/2K
	ulHCnnVcxQHGovQOvyHq7zk9J10dM0EWV/tQZ6e0fIOtyABz9KHP4cjzTFhnoqkaZZL35rG33IZ
	0RJDo9gZGETK8NDZ4d+W1kMu+HkDtzRVn4Z+nwZh8+W0fMqIch6ow2/cJodYMTBpgNy793azlHJ
	nNqJr8G6yTiRh8NxMyJZ1oK5C3Ox+bdgrROqtRJPrVZw10PyOx3iJr0lDLgJTXNhLgJRXjmoF6K
	Fx0Pf8yN8qW8lwy+AknQLEs7g3VTaxrx67cSo1ejqfQ5rK5F1OvkVBbqW9rSJgx7DgtK81V2Zm8
	wlVzKLWtk10HkZmq/04X0TcETW2GOQjKhPuNUSaU5X5fGHiaLNxdM916JslCfvSxp0MSzjw56BR
	GlH9sJhLKDzG0AGyjKF8HZjO2E/ALBGs3waRy/RN8JWmo8n0EvTuLW53oLf+DMfuDC6j58aF/tn
	STRmYob67BD73wxUayB9CC8ib7LDxLTqL87mBEya+Z8DgSt/pKugftuUPNYf2c/C6ePUtLWj+HV
	AwYaOjJHak9zSa1eMUO++9DNlS+5V5A=
X-Received: by 2002:a05:600c:b86:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4ba093583e2mr54869735e9.6.1794412215332;
        Wed, 11 Nov 2026 07:50:15 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddbfcesm34455965e9.0.2026.11.11.07.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:50:14 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v7 09/17] printk: Do not quietly ignore adding entry for a preferred console when there is no space
Date: Wed, 11 Nov 2026 16:48:08 +0100
Message-ID: <20261111154816.71103-10-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111154816.71103-1-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com>
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

It is hard to imagine that anyone would want to add more than 8 preferred
consoles. But never say never. And do not ignore new entries quietly.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/printk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index e9b189eae548..5275bcf32578 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2578,8 +2578,10 @@ static int add_or_update_preferred_console(unsigned int i,
 	struct preferred_console *pc;
 	bool is_new_entry = false;
 
-	if (i >= MAX_PREFERRED_CONSOLES)
+	if (i >= MAX_PREFERRED_CONSOLES) {
+		pr_err_once("Reached maximal number of preferred consoles.\n");
 		return -E2BIG;
+	}
 
 	pc = &preferred_consoles[i];
 
-- 
2.56.0

