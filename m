Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55C54418F0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455723; cv=none; b=i1Buc2w3CBJvIRqS1531ZUs+EoOsARyVtNBxqbg3hg7gIcC3u9hlg9F6ksMJIFgj6t4MOug0TPJd0ZGm6b1L43Y8csIeDIfohNjKyjH4g7BJrInVqWXxC9t9b5EKIlHliBUtvqzOxou8BaQJIsOdbERd5q9CFWrwG5nIO0zJCfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455723; c=relaxed/simple;
	bh=wADxDyewyOsUCJtETMgNzxY4kTMGU5c75K1QgMa7kRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=debdWOTa1eYwt+2E9g9BzeTT34GQSOtwOVnpQ18M1TZ8vTLGoQKXIdcnuQ6QRU89TQUo4j+jeIc+OGFQcP1XS4pFaMvfzyMrFQZ2p2eVqax7CPe3zAou5P211zFGJ7ll1lxBBe5rEBkYfcX44g6c7r6FBPUzGTqQzIGWntPyFjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASrZACSW; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASrZACSW"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccdd76a9so2360473fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789455720; x=1790060520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xCHSjyHMTeilTTEs0go6U5us28HnZkS/RTQ6nrFEXk=;
        b=ASrZACSWJVqC7i0y1vkBujh775pAeuK01EOXVaRE28KwwOdQVDBvJrk9aIqDh0C/2H
         vDTbj4t9t+sa3ZuhdbQhCubDxv8nSPnANuRjSFVy1d5IDdgqPkEe/e3/ej9z6Yvh0vty
         DPkkO8Snn5+6wZdfiSRqImtbe3IFJIZTmY6ybi4qE/eBzGY1f8gJJ0pOyCvirBycqXOf
         kEmoMi5D/PXbInuyihvmYKiyqpO/XXPiPxGBI7eSQG7M/HlQHxhC3jJXaj8WBjbj1F+T
         9m0rUb55knfgJeHyMyXM1Xj4iMVwPTvD2Gpr1Z4iK3h/gxwrcoQUt0HVf8RgXM2IjoOw
         65jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455720; x=1790060520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3xCHSjyHMTeilTTEs0go6U5us28HnZkS/RTQ6nrFEXk=;
        b=hYf7Mnix4oA9oI0zSURAzUDaQmDXswYVKvlifQh1dsrcZuko97jXNM2q5/pWMtuyAW
         r/JKs5aMYPTxiglDa3r/iIVK7AbvichACUyvJ1C1ejtOs8MXaYg6rHWamIJHIMjfe2Rr
         Nh/szyJAD0gGa2ON7fVH3L1Zkr0i6nf2RgTIPlAL1zGGzcwAE4xJbxfKcGyYAg6szWIA
         V4yRAZj4J33R8/1PWwUPgEcbvuPXTSJLRwzsGMbhA58J292llo++PaQ1/7sAC9bNLBSS
         qjZtdvxkhqDmQ3ypAG0uXkzipIyYiYIxCRotOuXrXELaim5BztAXkZEBFHokWimGc+0/
         p9Lg==
X-Forwarded-Encrypted: i=1; AKwUvBw0Yu/DSD8rECqT4Z97fLSjuqQR0ZmsomM3jJdCBO1VgtEpuaglv9QU6dxTARetbDuQBVtuvYmlflsczfw=@vger.kernel.org
X-Gm-Message-State: AFuF++kCV6NYg0TPTawlq8sTc3EkorktcLwmGdEGKxdcs7IXyH/Yma9I
	YFidbL0o5iGFQrgpPItErDFzhwo2JIVc8aQ2VFKJOEVJBJzNpnPd+cA5
X-Gm-Gg: AYBFou3U3roIWFzqpHPil6EmzQsFqFiUqYznIm1OyuQKEKM18h6gds7s460RbS7hIz5
	t9sLCis1hbSMsGk9qW/jhOAstcvNjNo5M3zbc9pyl0jx88nFYJZ6jh17pWiIXnWITFzwc4xWTKA
	EamF3WK9FaZxEsu1Mqsa14dc/DnZQZvxysVSAu/UI7smahezSrsvJeGWK1WW8EFimoPY/eyLedN
	6umdR4o9640ZAcYxO82oU78yPCnq2upL4PGMa81ZBMcbJNEqBjZX9H8hsx3Xvn7HQVXig7/C7r7
	QRaElYbmsyPNhRFL9FRVvdkXoEpO8bAfuECbtt5ufSdTETdWbpWKXxIpjAszn8W45ZwdFMMafbW
	OKJKvyqyX4Eld3hkKk1YFdt26vR+z+R07noKFBqfdCgvAMtiYU3M/8WA3rYAmmos1Y/mSLT+G9F
	eP1zVhWWmYmytGTjJE3lL2kPEh60VrVQyRPC/ULccJTa5HVzMnSVWKUzzNr+H2fgzsnNrhUcZLU
	TtGQgVL57fGVCPar0cMvja8
X-Received: by 2002:a4a:ee0f:0:b0:6b7:46e9:9706 with SMTP id 006d021491bc7-6c54155ca23mr3546006eaf.54.1789455715477;
        Tue, 15 Sep 2026 00:01:55 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm56553791c88.12.2026.09.15.00.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:01:55 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Wei Liu <wei.liu@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>
Cc: Michael Kelley <mhklinux@outlook.com>,
	Long Li <longli@microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] Drivers: hv: vmbus: fix typo "substract" in comment
Date: Tue, 15 Sep 2026 12:31:44 +0530
Message-ID: <4209afe678a3a9c5930edfd3cc07b57cf897b256.1789455635.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789455635.git.hemanth.selam@gmail.com>
References: <20260907044946.10813-1-hemanth.selam@gmail.com> <cover.1789455635.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "substract" to "subtract".

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/hv/channel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index 7e4cc6f55237..a0883ddf32e2 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -79,7 +79,7 @@ static inline u32 hv_ring_gpadl_send_hvpgoffset(u32 offset)
 	 * therefore leaving a (PAGE_SIZE - HV_HYP_PAGE_SIZE) gap.
 	 *
 	 * And to calculate the effective send offset in gpadl, we need to
-	 * substract this gap.
+	 * subtract this gap.
 	 */
 	return (offset - (PAGE_SIZE - HV_HYP_PAGE_SIZE)) >> HV_HYP_PAGE_SHIFT;
 }
-- 
2.48.1

