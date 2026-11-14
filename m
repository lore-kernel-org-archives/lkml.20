Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675424;
	b=469sE0x4RB/8XXXgAmGi5ZUV81UbLSLJ4qfpfdR4P+3VWsOyppiJn1EWnwb4G5P6kw3/
	 4x79ZrQSot3rT7rJ/5esiIvsKN1y9672ntASChN7BI1pxtHglLjsV1DkdnZfknsGGt8Ku
	 3g4EoFylh50uC+CqDyd/ejOQcAVFn2cJiO1Wzy+E3XFtqFpTajJfE+MzaJQ61A9S+s3J1
	 K2GIC0CDgI17nxPK9nULkIktEnwfgO1eMEZxfEhZgKLhbTNssUQ9rC57Az0p8pamVjlx5
	 hroFCin5l+6RpCk3nbcrDR1rVz0XVLDgm4MHvqHSz+ETymUYdnNlCpAk9/L8jQGc+JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kB2P63pySpY4bHLP3FK3dbsTPUwHpQNshikdg21FxNw=;
	b=MF0S07SSuaA8/Mnm/FItDEgZ8N3wSQ8QPMJD4xXdVXObnaE1NtOOXQu6BtG14Ujztr/z
	 EIu9YQFiiDSmLU+OTeZGYlQu6DPxZEzhI19MQxKhTwf04QWYx1AqvaDqHqu1kJnGUI7JL
	 j+XFt83q9iP8j1sxZxgg8NremWtQaeeQTjr7mmvQjuYVnAQFPRA00T2+NM14qyK5hUO+4
	 1F9yJqe5Z5hNjun7NcXb2cU0/YMN95WfP/oYC399GWn/vmva122nl+i2yAohekpZ6X54Y
	 QRu7RvVaDFOuv04JEc+rzFj6kUS/GCPSUN+VNdjJ7Dgfo8G6gjs/2+1NC1g1nbTON5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCTyKEyw;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4045660A2609
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4045660A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCTyKEyw
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso1626637e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675422; x=1795280222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kB2P63pySpY4bHLP3FK3dbsTPUwHpQNshikdg21FxNw=;
        b=fCTyKEywbFb/Gj6ArD0eixh3rczz+J5hMJOUnzIxzf+M+jbIyDqq2e1drzpk82isGw
         oa9eqzP4nuQo3Ny03XdlMLljsWhDsFF0UaqhbwBUdkaxvHe8A3gBCbKf7KZTEQaJHTSB
         wm8sql6dTAsaQOI/qK+c/dZSA0ppTyEAr1YxLcfxxxpav823KpMziGWO/fZpgHKBm9jp
         tsnz6Yhu1xXqxUEZH6dJhWt4vhgZIOT5e1ifwVs9KkpDKSAfa3JPjBhgfrU5fxQkI7ad
         JgK+EuyJ0QX96OfqdGytYfz+pjFggzzhkX8yNMrfvkPswYxJdJu2ECp8iZlTpAk2xSoy
         uO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675422; x=1795280222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kB2P63pySpY4bHLP3FK3dbsTPUwHpQNshikdg21FxNw=;
        b=axri0z9yLZmM2al/u3Cm1za5BJd1jdKMVJ7ihQPD5fPj+FxSG69EIVIuc+YLrMY/yT
         tXyAXB3RAEmSWrrYGqSlc4AbBxFnA6pZ82OksFaCNSN29n4sLxdMDX20CByLRKanY2rA
         ijdGXhfzaVjUki3RfPVf+a0euaOnCQ/0AGLwLZXAs7N6XqH+dZdxOijP2i5B0cgvY9bN
         btA6OkNg6TCNpVQybArFinKWYC/dem5WyTkt8Nv3KCLPb7RjS4LYlylBcfx8LEnJyurA
         JYzm5MnJVQq/K5NIExRBq0qLtCIw7EnL7azowcFPLE2ZrlgqCJUEtw5urgxPZ/x7DBKq
         CSIA==
X-Gm-Message-State: APuU4Z/ABSnoWVVa/T0ijZv3plle+uJ+wwn3H9maN5N11yEBypZZEqeu
	YuV0sfiV4rZXNDsnas7ezVZSdSSjGDc+iDLKOHEXzQwZ8WBHLK9DBClh
X-Gm-Gg: AYBFou1S4jsYyIDCEIKykqGm2LAc/Dl7VL+ppqL/kldU9yk7LXpDENr4IjJ2uTsNSmM
	t2XQo+w/WbCKDuq2e2tfoXylJDKUrhtcc2dLSqGpUE6gt5hITnmJRsuVggCzdZbpi2kiY6hbqVn
	+ZMe6dmK11OIZUqnA78TGnMMFk6sJMLaS+vxqLicP4Nyz1SRvS0N2Uj1yTiknaMU3G6QkOty1sZ
	IiXrB8UGvqE0s1G0th0ZXia+Cp+O5BTgGKMpNSGV8sDQu3M6wfwmwlhHAenKv9X2wNYYfNhYxYV
	otzdnxYuHBuNtDuP6vAZQw4pAUj8ybuuGPLY3j3qIllewVHrXwlq/L9EsVMOF4sTLcsfiRYIYgK
	POAJpKNGWdvAn+9xGHFyBpa8QOw+iZqDG5QM7Tocs2M0r2OUJsMuNfpPXyswxAZu1WaTfoZyUBX
	3s1+jV+eXhxIXCe3TTRHicNDRVmyA4tA9dqTDv4jbcAJZsVYEmRX5onKFDQDm3RH8qIDr8Syn9B
	goetwBc8+N0Rk9llroOelGcqAnTEbxOQqq+Qyf7HtGOvjbVlOwqxpdUrE7gDEWZC7Gk3bA452is
	ag+HlrPyI8S5CfxEYrwOXVeVmfxLUILRKf9NTbyOkWvDHutIQbG9Iw6tWPiWxTaMPbujT8aHCYx
	+KTGVD0382w==
X-Received: by 2002:ac2:568b:0:b0:5be:4754:22a1 with SMTP id 2adb3069b0e04-5c170b68cabmr2134942e87.60.1794675422319;
        Sat, 14 Nov 2026 08:57:02 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:57:01 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v3 09/14] sched/preempt: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:49 +0400
Message-ID: <20261114165612.368785-10-safocl88@gmail.com>
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
 include/asm-generic/preempt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/preempt.h b/include/asm-generic/preempt.h
index 1adddeab8..fc0da591d 100644
--- a/include/asm-generic/preempt.h
+++ b/include/asm-generic/preempt.h
@@ -93,8 +93,8 @@ static __always_inline bool should_resched(int preempt_offset)
 }
 
 #ifdef CONFIG_PREEMPTION
-extern asmlinkage void preempt_schedule(void);
-extern asmlinkage void preempt_schedule_notrace(void);
+asmlinkage void preempt_schedule(void);
+asmlinkage void preempt_schedule_notrace(void);
 
 #define __preempt_schedule() preempt_schedule()
 #define __preempt_schedule_notrace() preempt_schedule_notrace()
-- 
2.56.1

