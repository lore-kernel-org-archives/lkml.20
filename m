Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675405;
	b=GA0LuRKxxwHFkBIg6OwT8TFUNv2Zgn9txXlpNdTLuE7mh9CzcpK3ROhiQhjKMQSqOC3U
	 H8xjka551T3IHFGh/c8IFdQPXe1VIC5i/mDY0s7yn8HdjAipv5oP2RJ1Yml1yb6nQgdTa
	 DfVNk/O2ea7A0pNOmOzWUfktDTsAkq42KlqBOeuA3GK8iT03T5T8LGjoJXGMH4tJgCuL6
	 /FxMWx6CK4NoNIxdrK7ODQm4AiYGhbm6y9IBbp7h5SWKB8hVdxFfhNgjqHR/q0qu6HG9D
	 /hks9BNA5LGxv+HKs070hUP3QhMBKXIaYyV0C4WMRG0K61lwfnwEys0JyBap5+HXLeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M+6ivWBMmxezy4v/LQH71faPp84I+G626mB69PT8i1U=;
	b=LuLVdsG32Z0QiGPGXlIS+QA6DIJV04vl3DJfhKDz9/yNgxHZnxCyuvtnQIi3nBpays05
	 rDGHcWsee2jcvPYnxGK8KpyELC8dUUV6zZ0LasS/ohZx3K4hX3KHTZHEEz9rUJJimcXjM
	 rIrcs4CJ92W53olLQ8J2GlxcemWwAj+GGQuLyjxqJPE6rxtLWJ/a3GJFCeRJav5O8FSzs
	 +BjIap2Y2U0u8p0zcquJppl5gnkKjeF99jpUG9+cR+QrwqDikUXG6U6BjCmXTlxk5nMFi
	 ctcIlY7Moy8Ud+bjsfJjyIKW5ZBF96JrSTkgqDrBfLQQNyoHtybj+zC2NWoDRBTsRIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BELsfkBE;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA51A606A8B0
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA51A606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BELsfkBE
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c148d4dbfbso2458812e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675403; x=1795280203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+6ivWBMmxezy4v/LQH71faPp84I+G626mB69PT8i1U=;
        b=BELsfkBE6hXeMWsLkbtlRF/tk79rWRN0B+r0VOYnqnZxmf+ReMlC7y/1xg9k2iE9zm
         mp0pGARAKsPcoqvjSHcrl5j1aS/xhzouTXwPnB+zYBrPKWHTbhQM00f3W70Os0cISdTG
         ithC0iFPEGmYVjoV8oPhVnVrmMUXqmoewJqiaelaQnpcmmtQum7Vycpp/swNxSopJu3H
         F6/qvwns7T6lXaPf+cz5DBIFmcEz0dMbJ9EUxrZQ/D1sHDaC5Jo60Zi51wpA8eG53lnI
         fc4rNRL0Tu/v3C28aRz2yOlL+wVUaSj7uXW03rosmQtwm/Oc43Hq7pPPFP+/gMuhMjHs
         vVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675403; x=1795280203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+6ivWBMmxezy4v/LQH71faPp84I+G626mB69PT8i1U=;
        b=T2ZvpwHfFp9iUWv3SOrEj4QpwvuMOdzK9M8kYcN5kNQ8VFjTddlIgzMPxCaMS47MDw
         pgn0C1mW/XsLlhEKBemLzbFJkvTVeRUZlzjKoyj2MoQ6rW4iBZsost//3jKoXr7lsfiT
         G8fLuwQaeP8QOM2H7ymdGyQDG/f2yxKSoaR3k+l0bjOK3q+JHGh7eH5k4AcReTU9Sre4
         Kb9QeW7S3XfVkWjtnXQjr5B1ItVWIbRlbRwep6Ph7ad1XoCeuT6q3LwR1I4HFU7RIkM6
         tJSf9P1+UdTYo2s4HP81Wz+kmUh3O9jEanfkk5pKxMhFNdVqjNnuHsT0OGcCuKAmhGlD
         exJQ==
X-Gm-Message-State: APuU4Z8dzfNhZxUEffK1McTXdi4KQXloXzO5VgeU3uQDvATDj1QtKd0+
	adOtpemgEwnd0+q9/Hv6UWsu89gDCy0ge/MGzwn/oMMoqcUfDvT/jRhgVrrG0vjA2Y2dwkhn
X-Gm-Gg: AYBFou1yqv/n+/MKrCo7G3IvECOJyjmqTb9qc+97mAW1ELR52asexd48Yni2BAXjZt3
	yO9WBZOQIKm727odNNAUqZ1k7TfuA3M5jMUmDV2oLwWeCuk0eVmOiWkV/0J2Wv5LqZDPSARqdCr
	uAjSCwL17/iuXmruLY+VVUjBhAek8Ooery+pm46sOtg4F31zEtRm2Fc9u+2sIy+uRcmuFeL4j8h
	OPCrtUvOoy0XOo7jP/CpTfAygAZBcsFh/WWdzM8MbCwXY5b22cSN4pe95hL4OSJCtcrhTMPlKFg
	SGOh7QfaRZmaTQXKUFnZHaWehTJh8s4VHrVL2/wZuWiEuaupBhQBBVhJ1Wwx/TAARUwTVJmPtch
	MklzCWcTfqPNhpSmhXKqlRCjsCpDQ8IpGpazlHX3LwxlZzm/eMEy2xC2bd6xpAAUte1kVVMN3t3
	tflnVR7Vmm1cpLzUUsXovypKw0PrZUjjv2O3FBvwS0o38lwcqIwvdpRoxdvr0I3jY1iEyZ0QGEO
	+2k1Z0ZXqy1TfPUkQbtA2eS7exAqOqKyoAvWMxNt0Qk4DSQM8tkdIkGwCIU60PyMSXW088+X6OG
	2pOBw6lWeTLXnWr/YE4J+EJFDM764HzIRUDTYjan8Q7ozmcOn0+jRD+l4XsvZJb1gDgZgx67+9B
	6kKoX820NZw==
X-Received: by 2002:a05:6512:31c3:b0:5bf:e241:cd4f with SMTP id 2adb3069b0e04-5c1709ca463mr2480341e87.32.1794675402862;
        Sat, 14 Nov 2026 08:56:42 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:56:42 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-openrisc@vger.kernel.org
Subject: [PATCH v3 05/14] openrisc: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:45 +0400
Message-ID: <20261114165612.368785-6-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/openrisc/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
index 73ffb9fa3..c46899806 100644
--- a/arch/openrisc/kernel/process.c
+++ b/arch/openrisc/kernel/process.c
@@ -129,7 +129,7 @@ void show_regs(struct pt_regs *regs)
  * Copy the thread-specific (arch specific) info from the current
  * process to the new one p
  */
-extern asmlinkage void ret_from_fork(void);
+asmlinkage void ret_from_fork(void);
 
 /*
  * copy_thread
-- 
2.56.1

