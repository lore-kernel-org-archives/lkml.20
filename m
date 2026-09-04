Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5948C4F4750
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540878; cv=none; b=MHWJ/9xecSCpzZc6D6+RXJp4tUtmN9Sevn0R0QoE3laffCmCa0GPyFWkzxksMMgaex3XJBiQr69Oflat0aWbtBwl6bkPiDpaq7CYMJY5lpf8ScV4jh8raUUaliC0nczxpECR0c3+pHiZkQT1GG+76ANZ2MxfWF0EYV8CacMUSe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540878; c=relaxed/simple;
	bh=PCsXRN8ULrTJKxNH5lxZIzZybr6uVzEfHw0QUb7L+Q0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=CFtUB6LA/hNiqo2xqODL0ioNMUR7+CqssW8OGxwak+eLe+rguxz2Ts5sCRscx0vhbX1tNCfBsoD3da9wsDgDzQ6uczreY5T6uO6TMlA0Gxxd0M3vbXX9O6+Fd+bYRRMXZz7Y5SU2vAHye0zQ7qXG4FQ5ht2znPL44R4r3aeEBC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L76MPVMS; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L76MPVMS"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so1888844a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788540877; x=1789145677; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PCsXRN8ULrTJKxNH5lxZIzZybr6uVzEfHw0QUb7L+Q0=;
        b=L76MPVMSaWd7vx9BCwVbzprxdx3i8FSOYsCYMActeOGJ7N2LP3P6S23jBNU5OSxf1L
         LLcJygjObrydXrSlVrHewbB0br56CQOQPUkNSnjykZ62knK+q0x50CTzXDPIoJBqlE+j
         qW1JmTwzEgq8hTqeDBqlDe9G7VInGnHgh9N5gaa4mNJW5vSWNF4rpPEqGZxI2PM3RyL0
         PfLHb1ZdcExSAiWDeaEvqXH3jH4hsXTFAOu4tneWHxrcW8/X93MQlxINUspAE3mEBFcQ
         7VL0EyLDCNLOYBHnDi8OScB1AKsJOYQRsq9RICCq9HYqWuC19jGZO099+PXyvzXAEISX
         iY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540877; x=1789145677;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PCsXRN8ULrTJKxNH5lxZIzZybr6uVzEfHw0QUb7L+Q0=;
        b=b51avXWv2XSrQ0sMFA0Mn872Qvk84MHjn64iPSY5BWhDl1Ynyk1m/K7t7nhsRHhxjD
         pGDpYD/jiNjhXPfjv3msFNpOSH2nVpw5mvIU6K0Ar35GJ87uwypKXBtcLPbnf66XHeuH
         5d+7PTUl6A1qDlsMCMLAmq20imgLrr/1dXO7eKlkFGBqbwq0vYIEkyPCkUmX7hR3rr6S
         17Ynh7kO9n4rKtV/tQepHpIUZDxb4NZeAmU3w6EtNCuahMfOw+qyF3dcBH3DPN/EirSZ
         HyCg/k15Er7jjLfRRsQdJlYBfy+p9RMyNf3pWz//E02OtlpYEvROfSPTfJUfyNIYjOQS
         MzSw==
X-Forwarded-Encrypted: i=1; AKwUvBybQktFjRoxbtdF2dcHJTIEfH7kPaUzMliz3Z/hJtvYeLozhS43dUpQ7ztgzx0j4tTRAIQ0dLhpA94dv4s=@vger.kernel.org
X-Gm-Message-State: AFuF++k6LYK9P7UXu1s+s2wskwDB19+fGDkGYxmq1UmF/5mR+ohgnvn3
	ZIVn/JtRDdlwVJX/3GlRE3r8f1VQIJHtJVocqUvgyJQOqX5mYVm3Mev7z0qyynoy8EX69xVv0iQ
	qbBvZzQ==
X-Received: from pjbsv16.prod.google.com ([2002:a17:90b:5390:b0:398:bdb4:e8bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d44b:b0:396:4cbf:45bc
 with SMTP id 98e67ed59e1d1-39b26203f11mr11310116a91.16.1788540876431; Fri, 04
 Sep 2026 09:54:36 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Sep 2026 09:54:33 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904165433.3281036-1-seanjc@google.com>
Subject: [ANNOUNCE] PUCK Agenda - 2026.09.09 and 2026.09.16 - CANCELED
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

PUCK is canceled for the next two weeks as I'll be offline/traveling.

I will also be offline from ~now until sometime on the 9th, so don't expect
anything for 7.4 to show up in kvm-x86/next until mid/late next week (I have
a massive pile of stuff tagged for 7.4, I'm just waiting for 7.3-rc2 so that
I have a relatively stable based to build on).
