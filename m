Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097874;
	b=KJ41/Y51v+FW3afeZcaKa2eWzX+XFN0utaPImlD0STfm2yaStHvj+cVdYillP2F+g/hd
	 4+ipTwQrmBHrSc8WsoFYjEVMWJl6qYYY8PCSF33ocqoxoii64ZGgq1RGF2mEz0kMrhPnr
	 RPk6D7Eyd0OR7es0gZxLYHjGHy9TPNCge1eBL7/CPOPG9Rm7LD1OzgwhJ7ps74ylZV/qo
	 497/KIFhHtvFkSEAP9lMTGqnB1XmUfxkEU4CfqlxyReq8EDq1yt3oOgsqaVJGg4J+Kq8f
	 RXM3ZUbOdZCAB9gUnraoIFKqV3z2peZ5fNudQjTS6UpERWhgX1/HfBy/jyVxLHiBIUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C8ZSmOOvazee2T+kPnFVJUYhcuIYJtaOIOdwT+PAc4g=;
	b=ewegxL41LxcA+MbJ4Tx9gxH9/jh9m2XdZ0JrU34qcAmHg5pS5fbe1ZQ7eNJzX0xXh6J/
	 k9XOfi/xUl7wtJw6Lv6cB0kwBucJTqF9PYa9xSfccDtPCHvyro1F+qM+NmBD4nDt03+b5
	 Ha+weHts+0BuejFsPxkqcdowp3Ruv4p86FgJnWWJJDQ+bmFUBXx1IFQiy5j5dskYSfpST
	 xv/0W/71Hp9oFxGDk9SRQSX0v2jnkA4SlZkvpP6hB3tg/vTeFPqrGF0rGDGJF1eUWTAMZ
	 OSE/XlRlNu85uunrR0mrGBXX4mdoydfpdLcnyBPoB6KdxCew5EGnpppm82QSyIkVcAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YCee+efC;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C875606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C875606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YCee+efC
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1556147a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793097874; x=1793702674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8ZSmOOvazee2T+kPnFVJUYhcuIYJtaOIOdwT+PAc4g=;
        b=YCee+efCWlNsiz8MAXSD5IdiQkSIhmjwXA/O7QtM4uH6/cIWEZi8oDjwK9kIYDEfK0
         UwQPdClJKUN/Aq7P6YIUTcX+eP15P/SSNOgwzvwn+SrFUrJbLoCrs9MgZIyuMeRLMXyk
         mSJ6jaDnTPbn44v5G2/CEyQx390NYGBdyx5xYivSfQFNEDw6qvP4cY6EKprLdLOz2FpT
         WLvoapVtptJnpEsUSlXUSa1XDVoF9En8JWyezgK/RNEoX0vbBFxuDUmJGlfAWSmKCqVW
         PRa0Qots/UeKoC+B6KZLXM37zF6k86KKD6wh+sRDTjGsA2ZrO6jv9Bpfb81Mk4DzMiNY
         HP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097874; x=1793702674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C8ZSmOOvazee2T+kPnFVJUYhcuIYJtaOIOdwT+PAc4g=;
        b=iuh70qcCkk8sdVPdpejTQhugt1CJ1QPzMJH+akyTJiGYATZQC44X5bGit0mLNo7u1N
         dz0sXHH0PoSEd/N3eUXJcFGSw7oWJArmGfzEQvSOytQzxCejPyWMvokVSFulIWkUHLsD
         8t5QntuVOmzze3QsIVqbK43VsMp1aSohSNI/cFWLJ2KyF+f4fQYwBbfGg5Goj/stD3YF
         thnBHcBMZwFPPbDxc6UHOVWpvoKQ3vspiEqWdXZAyAXVICAK4O6YZlFNLToXSLqxE7iu
         B4DxXrh6tRp4J1C4LaJxo/x4Gjot8uEnOKQP1byhhq0GjCXY+b/4ivEMnRWr25xkZEOv
         XI0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx295HLSP3V136mxVOsuyXeQRQGWn3CpgTMeWWsDOUAk5bJTQzka4X+fhO2eOAKFAFafDQpJc3AtPzaoFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0yDljWNX2iJxbxAsOhcNkoxShYkvhoPIwEjjFZpo2g5NiIngy
	3SmB4sbF0Y2sUnRZmWiPafVRcf/8C/oo3buWyYA2KArMwObN7R1Tk+5q
X-Gm-Gg: AYBFou06skvQTeUS1vCh2Prt00VyvYpZagEZc5zih8S3IyUHnwVejYlRvD5PmLfAaxw
	TWAloFXOrN8tKgPUi1b9NbpZUOmJRxK3iREsT41RD+RoPLQeN9XpnLXhnuivZ8pFaC2nCwsypiQ
	lnFGISOEUpK/atlNN3lLb0OkdyJJe/+430OazFoQErN9H7S4RjR+kd6eL7+vRDivLqs3F0PNwDl
	BAyJRAd9kbL0p1ZOztSMTXMwRA/AIGuxaaZ8VlLWcrnIdltjD+qCodrKQ7YZfUagLWOzU537utN
	HkxODhC+yJOr0XJcdpPtk2w9cLAcl/cRavoLzjk+9AkJUmGX6rTXTh9I6LYOvDdtK8wQVCPeM8Q
	tLgdNLI2WfC+vxxvGvqM/hbtb8RjE8J/2lfKmskLFG+NI2RAAvHP81dfwWbK3Jw1d4XAgAdGyiK
	7Vj6EZx3trTq8OViq1ei9vajRRvfOfCCaW4CVCb4qA/U+w1VllCBC0gz2sL4ccxMatf4A6GbAIl
	kcJ27BlB/VSLA+EXpKLvdbP85KRlWOMkSFNo/u9RK5FKjwkhgfVgcl0nuKx+FX1vCTYsKXFHQGB
	3ir9H6NBe2qQjneILndeeOr6fJhgPiUiCDKcefP7v4fx4t2/3/4gIYsz+gQWdq3kU/wGgb92H5E
	HvMobz0i2Aj6zdVnj/0C3JPhjNTAt8Ikz/wgbppOeBaa7
X-Received: by 2002:a17:90b:3143:b0:3ac:9e76:aa76 with SMTP id 98e67ed59e1d1-3adea9dca65mr7683767a91.13.1793097873811;
        Tue, 27 Oct 2026 03:44:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ca1bb2sm7187525ad.68.2026.10.27.03.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:44:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: img: img-i2s-out: Fix double clock disable on probe failure
Date: Tue, 27 Oct 2026 17:44:16 +0700
Message-ID: <20261027104417.7150-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027104417.7150-1-phucduc.bui@gmail.com>
References: <20261027104417.7150-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

If registering the component or the PCM fails, the error path of
img_i2s_out_probe() checks the runtime PM status and suspends the device
by hand before calling pm_runtime_disable(). By then, the asynchronous
suspend request queued by pm_runtime_put() may still be pending or
running, so the suspend callback can run twice and disable the ref and
sys clocks twice.

Disable runtime PM first, as img_i2s_out_dev_remove() does. This cancels
the suspend request queued by pm_runtime_put() if it is still pending,
or waits for it to finish if it is already running, so the status is
stable when checked and the suspend callback runs only once.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/img/img-i2s-out.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index caa7870dbec6..2aa8182d561d 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -535,8 +535,12 @@ static int img_i2s_out_probe(struct platform_device *pdev)
 	return 0;
 
 err_suspend:
+	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		img_i2s_out_runtime_suspend(&pdev->dev);
+
+	return ret;
+
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.43.0

