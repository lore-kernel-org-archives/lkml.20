Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC6B488DA0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988473; cv=none; b=t0+jstHEgtKBbV/o0nPiwNiA6tg3W/JyFtAv5QQR5/cO3lTK7VxGJcKqE6tIZN/TJIvcd9C5mmSh7z/7lF8wSoKUf303Uy+RfU+z5MDMxql8u2mwwEBzelQ1eDqvEUwC2ZYlNrXZrEzKv880cfrhRRBzyJ7CtZLvU9iZXKWwq0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988473; c=relaxed/simple;
	bh=B/oP32fYVEgL/ZkWtwoP3dz6NpLmlUOmCKj3v/0F8co=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jsGSuFfKNa5OhMVu5U6T1EvicahhfM1LuvT7GfmJfbLTecLdeOuLWmctpb0cLd5xd/6RnJM4WPD7xJ5OTsgvOAYTP5ACMyKr2c85167dY5Gar9NQ/cjAiRgqAQOM7IhXDECuHORQEN/grtYiuTJ6NK5VrMhQTAsqop7Rq6HoIew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YGINq3L5; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YGINq3L5"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e745d5dabso32361345e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988466; x=1790593266; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCrcI7igLaQUil9vBYjywYIs9hdqlrNEBSUMKWJIUV4=;
        b=YGINq3L5jVZPuoRAEO/CfarjCz6dYo71DRq7DKX1K5xB1gNWSHO9VnbVyjyuyoVe9e
         FwPB+9IomF406zAEppL5sblaABFCyXPKL5usjjGyHeNDbl/OrRx31aFxMGv59dM0wbEB
         mwAdkMwccdLGdGax3vlJypS8lSRavDdwTIzJkRcxuM2eheKPVD2QTH1uADOEveMPCfJI
         A9sm5jDO8ywZuU2hmPzjYWa95XXr/YNfNYqxriXHsblf0FLg1LxrLXC2mcYQt3D8Uh4d
         eraDDQdT12S8EW1eIvA4fK/mfFseAiRgx4gZs4YjG+0FFUt0+eJTi8IInD3EwV/uRLoJ
         CDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988466; x=1790593266;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCrcI7igLaQUil9vBYjywYIs9hdqlrNEBSUMKWJIUV4=;
        b=jFKOk5CLPIIRXJp7yZaeGjpKuJJ05aDLLRWVJT3SFnJCrLRqobSlMeOV9qqE7NAl7M
         gUyTQxcCbSSL0ylrdDP6H30T4k2om+FDBzHbCn4u51bV4apg6q71E7L86oF9qkkQYvwn
         Ith0H4y6rwPZ/263du6Vi7MLHcblK0bUQ21GEf6lFabE3NzUPGN2xW5Y6SgQcyj9q9gi
         XB1H6MSR7vVVn2IvcMGF5U2gf124WirKz0mpKhEdKfypujWrAp+r5ruXA4w9s5iq3bRz
         cZYjID9J236SNk1PB5uhqngiUrkilQtAGEQe3SnxPqZ8Sfc6F6+TiIJDGfg8nDaJD9xf
         UrDg==
X-Forwarded-Encrypted: i=1; AKwUvBziS5zSYSEOvmae94Fs4zSjWPDA+FSMcIDJT0ggxi13b+1QbHe35b3ETpPe172nbg52pYCNBPuwxsSaoBk=@vger.kernel.org
X-Gm-Message-State: AFuF++lXSBYrt8tJPGIa+TKzfXpOMA2F0ltU9nXrW95nyj6zUs31bLN6
	tZmAjFiGEW68kRpYHOUoHGpwDHK7DjvmIQzO78vRe59E9S7AVnLEW6/wVh3kjJHwDxeBBFspV0H
	6X/lXiBnhnK8tIScLXtBLzQ==
X-Received: from wrbeh15.prod.google.com ([2002:a05:6000:410f:b0:487:2514:733])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:290d:b0:487:27f9:829 with SMTP id ffacd0b85a97d-48727f90a8cmr8269596f8f.30.1789988465393;
 Mon, 21 Sep 2026 04:01:05 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:50 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-9-vdonnefort@google.com>
Subject: [PATCH v2 8/8] dt-bindings: firmware: optee: Add memory-region property
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Allow reserved-memory via memory-region to support the arm,ffa-lend-pool.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../devicetree/bindings/arm/firmware/linaro,optee-tz.yaml    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
index 26ebcf4565f3..7fddea9cfdbc 100644
--- a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
+++ b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
@@ -41,6 +41,11 @@ properties:
       HVC #0, register assignments
       register assignments are specified in drivers/tee/optee/optee_smc.h
 
+  memory-region:
+    maxItems: 1
+    description: |
+      Phandle to a reserved-memory node for the OP-TEE lend pool.
+
 required:
   - compatible
   - method
-- 
2.55.0.1082.g2b9226bbc0-goog

