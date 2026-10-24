Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809659;
	b=qKSw4PEf7gzOlFhTYZo5IA1vmMtio/iHU5nJXlRT5Hb6GtFYfKW4O26IwFN+2savr7i9
	 SlIn81agI2eI096KdrLSufcOsz8fUcKEN04P9iagS+kOQFYTJItSQI2tM2Nf9izAmzrBw
	 pp3tIn9D1UehrW/K+qpOBdw5UFmZH0SdvWBgr0HckMwRMB/nE6uAJXj8SIuMQ8lrAytnZ
	 2PiRImKeu9CtafSBpdiinckzu3ay6plWvuy9CKde0ckH+NaUL+3jI1z0q0LmrCOxbzmI4
	 SFQ7DiZfeR9IKe2Z6h6arNkHUGQmwzIClhQOdLX2HRG6H0CKEkcLjWMpX6P7X0rO6/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dyxLFL3v3aOd1FtHeGOANRa81M315sVflTjGuyXXt9k=;
	b=4mSTop3RxclwF9Z+dF6F32qdhg81fxDwRE7GVHZCYOugSw24x8CVAOCEewn7PvE5sn2G
	 juOUkpMJdsfiLKjCRWVC3DlEnJf8tKM3epEfUUg2w3se2xI0OkV0pUxAgoFP56Vi23IuE
	 TVJpCoP0/F/SohY2YmW8tywme7O0bRo5ZeyR5S2ghmLnjxr3amQFcyXllCUJpEoVghoWG
	 Okj+YgqBllHyUYS3vCrjogam5jl5t3eGg6tzobRODVq3e2nsWWaqk27yFQtNhKly+kR5c
	 jroIIa7qkEll5MYqndWPCel/0G1qk26xecYXwov6VSTgStggFimQ62v+t/j8xqb6z9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b1jx1KTN;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8D0606A334
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A8D0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b1jx1KTN
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91c2fc03880so21505596d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809658; x=1793414458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyxLFL3v3aOd1FtHeGOANRa81M315sVflTjGuyXXt9k=;
        b=b1jx1KTNxpYtk0D26oCx4jhvPEk0vYhRmZpnl5znUQg3qNFXmRrBjJntRKJJkfCVd1
         2FUP06UB8zo808hn+ke+HEmT7VKYpChDPP4k25cPQqi3apwjTmsXZLyIDzjo3atPyzKv
         t+5oLTjVY4ZQbtq+fpS8jBEfXV/SL7vMIMNhNnBn4BKwC59MO0zyA28u1heY1u5bpY0B
         Wc4qiqBYIUTmpfOrrx/lbiUihMi9lZnExf45fzvqXsIPXEkXWn90UgAGC1wn68+cP0Rm
         0QWgpcYEc+7/0FuxPVsPe92Mjk8lqo9J8OdFoXhFgOOJZj6BJAhykZ42RJcld0v0MZru
         JOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809658; x=1793414458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyxLFL3v3aOd1FtHeGOANRa81M315sVflTjGuyXXt9k=;
        b=S+uFh1wz+nZ2X34ilY8R9rxdQkHpyBXQBHmB6blHW1+IX9ipU+P2hmzvVIZOjqLXF8
         d07G2pg0WCQMMcsljesL8p6iaT7QIDq7fYzkiOAE6omLkWDOlZJnlHvh7e2TCFL7a8uz
         OeU4VNDJXqSx+T5v7MMqXnlxbN4OD+BQzKYAjAeoqxSMw0Ju9R6bVAATvq4/MPCxZwpj
         QofnAuaqn8A715thPw7tW7Is3AaC7X5nibLHEpiYtKt/3xhnj7FKlm+Few9mHu5kBoOQ
         6Q679Q3iYFukgkSDCsTKzWAP0/+cYumwkC14rpNYYovkev3H1ldaKLFc7g/0x8uewqDm
         5PHQ==
X-Forwarded-Encrypted: i=1; AKwUvBykcsoRoZy5lxwRgAVU/hD2Lqh6vmQgwZ0T3j0/n1SdM7Rz14mFX0y1SddUSSabRlv5DopjRONaabZrJbI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJs8t1jj60T3ZEx1EJb/vF2qLGTF1RiyFJO1vjtk5S1SLfMx2aB
	Gcov1ejfBco+QCqpEuO2N5RhBeRKlqwVGGUOVoRZn/rs28R7Iiv3WPA=
X-Gm-Gg: AYBFou3AiunEyKT0Pu96Cz/7YSLqj6oy3eLXEYRK7JflEqtc6bwt41DvDWih920oQwY
	IoIqBqNTKclZFnuLO1Lb78nWozzpiJi6SAcsdt6Wi9aqIwRgbuA/6Z3JO0P13zYjJvVxAETvqpe
	ObjH1pjhLHXkVRFoB2Bx1p1c/fjyYv9nmIFRwlqyW9x6rp6e2a1b7BRrj8X2W9tudR/b1r25xZk
	cOdhEp+KjyqwnBS2pX+UkaBkpa0L24PDuX4mFnraUM8hboFQpgDeCAFWjzJplLM6CzfGfX2Eni5
	OMCqfEVTQWAeeGEiSYnHINf6ead2HZRW3bosizGFAhECGEQdlRhtbGUgSSQzEQN7t0zkc0milpr
	1bBgxoyGViOGbaUBb3dSKmr2cG9J+xm7e4eWtZ0LEpYKRd+BYlwk8uLEYCXLFP27CoNftNbTcw4
	LOLoVQjGP6j1UZTlI5hAJGpRrQupEFNBw+9D/OWpyDZaVkfdkLiEGX2M+z/VWlDhijHATsS9eBl
	x+1pmn9llJL9j89gvxMXuwOyY2UJKOVmvPiygEY/96bilDHDeyjZCg8N/aoR3ry9WEqPJ7Hi6ng
	wCFLhHJ6M3giCzZxncsQME41mGAXpCGVux62T19X1Iad9SlZw9qg1JZ08mORscCv0eO+K2GAMlL
	TVzXYdanb81Q=
X-Received: by 2002:a05:6214:d62:b0:917:a7a5:af08 with SMTP id 6a1803df08f44-91c48f16f2bmr13423826d6.25.1792809658336;
        Fri, 23 Oct 2026 19:40:58 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c48feca9bsm7203526d6.39.2026.10.23.19.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:40:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 2/2] media: venus: disable recovery work before HFI teardown
Date: Fri, 23 Oct 2026 22:40:51 -0400
Message-ID: <20261023223635.3c895c4752c4-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
References: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
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

venus_remove() cancels core->work while the IRQ can still schedule it.
A later IRQ can requeue recovery work, which may access HFI state after
it has been freed.

Use disable_delayed_work_sync() at the start of remove to drain recovery
and prevent further IRQ or worker requeues. Drain the work before
disabling the IRQ so recovery can finish completion waits that depend
on IRQs.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7087af32060f1ed4190bf9f5d4a58cf88dad537d..6e495bc046913b46c926a498c062a6b55c6f7b64 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -596,7 +596,7 @@ static void venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;
 
-	cancel_delayed_work_sync(&core->work);
+	disable_delayed_work_sync(&core->work);
 	ret = pm_runtime_get_sync(dev);
 	WARN_ON(ret < 0);
 
-- 
2.53.0

