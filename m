Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353002;
	b=qUrE8Ymeo16AMhcH6DJ6VFnfx2OjWepBPF5cRbijrTQB20Ox6rh8OLdLtyeTOO+tJzW9
	 onyqbVNMBqOzwhloM4J//6AgwOs8o+NAqzvZFupzNqU+/SjLg8YnR4iUznQqhGpfW956K
	 ZiIaDK23QHERmk40z2zc3ArdHs1aiK0VAU472TDu770nqhLDuszNK4rNkUeP2LpMzoNof
	 yOT1tMJNrZzD+Ar6TfhSuyMse4WBlFJehARKIjZSovcNITmNx4AGRQfKAp4+COkimjg0X
	 Qm15H0eE28GwomU5H6jvcuLirUAnTUEdKQnajEW1YtENDU3jpzUwX23JupHer9reKfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lIUdXHqt1l6Ach/lPnny+8tyovb/w0zE0U5VmrKoitY=;
	b=NgCR9aK2OPZzLBdtX6r0PdU6g5pHKpBjUmU8yeFVdRTo17mQj2W4kgLTcm5uNSaVbfs7
	 ReKtF/8ji/PO7ooDw05kBE98wXPP8raKy/73MV0H2gn6gJU4HoQzeYJLYQs3x9Oycwc8Z
	 yL9CX19NOjPlJiCCAnLZu7rkYxEFVfXUYJGH2/xa/m59W9/zLdTSp8RQuPirJO+yQ0TRp
	 ZRzj0aHwqi0AI00Jf7iemZxzLMeDeEXjs/mnznG4e+bLuZY2Ulf5edOLmMuWLzC4jQ6XZ
	 HRWIULOc9QpBCdchcnrAnO8BowikO5EEoZsuDw4JFxX1ESOzA/NWNbHAxwj61mqzfWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oci00GYM;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B517B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B517B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oci00GYM
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e09aa5264so218499f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793353000; x=1793957800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lIUdXHqt1l6Ach/lPnny+8tyovb/w0zE0U5VmrKoitY=;
        b=oci00GYM2uiqieQWzN8K8tErKZgDEP3SbXbgAQ/ztjDZXMuTVelTyVwAJvpXb0Ybo9
         p/JewnJgXDlpBv5wREVJC/IuzJ/jA8Kp5p/kqsRv9RLaHnZ058EahrxjNKUzuQsqsJOv
         wnXBeO+IAa1TvvmxVhqT8qf23gn1abfyzLklTtPy5xvOD9uuW8g1QO5rJMs1xgrt4lNC
         XT4ZED+XaNnH9d+lURCRld2HPqbwFrsrBw32JYv+23p9IgBJu6ahcKIDQH0pPNpVZVm+
         5GA87Y4RYLbDX/dVWCfl/6zbfFzEbl2t0NAXCZsfOki2d1OR+1hmkidln9hX/11iUUhG
         LERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353000; x=1793957800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lIUdXHqt1l6Ach/lPnny+8tyovb/w0zE0U5VmrKoitY=;
        b=nHpocYjtW6F0l6CSFhEeuXhyA4dmrr5jdxiy1q4YZJOF16kEv5NfkaxqqD8NOT5r9u
         gFhUm09p137fN6MQ1fPx9mYI8dNHf2J0d0XfIORdkMrpYDPTdmfEvAxIa5mqmDZB2x8x
         FDCg5+59fs6UECyZZudw7ol0u2YGOLe5n80DSRDzVgg6jp8F33DNOAGvORQeUUtlmgxB
         aRmLp9OP0E41k/Wc6eb93yZnNkdgnH/8hfIgzDj9q77Fye+MN/KJtMm+ZdYOpudUs2dm
         9/j2dxgZae+TvhwJ2D9F6+fCJ3UYnQYhYTP0uLtCXYAAw+4QSeu9NqAu+AKUmTFxQLsV
         jHPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd3hCACggrNk1OFRP3ZVYtL0PDKffSMAwxyGGwCBNGZwGa4JWUFFCumM3290aTea3sMBaSRtiYZkYJg30=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXGytHeR57eFzpQWlX3gC0h2egIX2nfhZ6CZldeoUEEqHMkGl9
	m1A7Zw/6ICISSYD3Eu517pgb09aiK7AGcknKEafwrbfF6NWwRs34lrRFjyr7bg==
X-Gm-Gg: AYBFou2TSsDprbiO+Z5vsOGbssFTXv9Q/CqJ6Q0kkJkm3vmXWJ4gdpM3LsfEhPDvhKa
	c1UL08S/A1R/XNj6M7Vf8OMkonv4cvUk6bTHqvaUBJNpwNy3abRpFi9ODRw5OmEBkjlj6WAV4KR
	MxzwSDfOPf9yV17ENQDTDV40IG8ptC08pUg6+RNtztT6uzYBEu+NskjcLP0E7aV+F/Xk8A2BdaM
	4XxGjJmZP8a6huE1u4KO81t4xO7QVtAEjvbf2gCx0fg/sjtVwpAJouQYgxax9qhUgg4S5T1o+Gy
	azqZdN5BDBjulB6jsfR7DY35GYQGw7I4lrpZzH+ja0MD7Ncsp276bNixfLYkOsgKS30/bHOQqDe
	L4QtF8rfOLzBgpB3rpTmx8Aw5pQU7kl2f2WpAW8RrHTQ/wz/2I/Bu6WaCb+Unb+MSI8gUbU24g0
	EKz7CBtpj8cqSz18yQGIv+R7sOT7wFaGIwJu53mtAEbbTLvEqARXmrIkKC1eIMmgHYZnthaSOd2
	T23uyTOl1d9/uoD0raX9MgaRHPh2pGn341jKVI6BTrRyla2jHai2A2YcGjowfROkkEHGFGnJvLj
	7pCGLIuJuvRGqoYB4Gh+4ttZyJSoZ9UJRp8IgjzS0twecQ==
X-Received: by 2002:a05:600c:4e14:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4ac187a80bfmr35290785e9.30.1793352999880;
        Fri, 30 Oct 2026 02:36:39 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:6ca3:c7d9:c03f:68c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c5063e3sm123364125e9.0.2026.10.30.02.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:36:39 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] virt: fsl_hypervisor: use matching dev_id for shutdown IRQ
Date: Fri, 30 Oct 2026 11:36:36 +0200
Message-ID: <20261030093635.2194503-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

fsl_hypervisor_init() registers the shutdown doorbell IRQ with a NULL
cookie, but both the unload and allocation-failure paths pass dbisr
to free_irq(). The IRQ core cannot find the registered action and
leaves the handler installed.

Pass dbisr to request_irq() so both cleanup paths remove the action.

Fixes: 6db7199407ca ("drivers/virt: introduce Freescale hypervisor management driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/virt/fsl_hypervisor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/fsl_hypervisor.c b/drivers/virt/fsl_hypervisor.c
index f472c94806da7..de52d47a705e3 100644
--- a/drivers/virt/fsl_hypervisor.c
+++ b/drivers/virt/fsl_hypervisor.c
@@ -855,7 +855,7 @@ static int __init fsl_hypervisor_init(void)
 		if (of_device_is_compatible(np, "fsl,hv-shutdown-doorbell")) {
 			/* The shutdown doorbell gets its own ISR */
 			ret = request_irq(irq, fsl_hv_shutdown_isr, 0,
-					  np->name, NULL);
+					  np->name, dbisr);
 		} else if (of_device_is_compatible(np,
 			"fsl,hv-state-change-doorbell")) {
 			/*

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.43.0

