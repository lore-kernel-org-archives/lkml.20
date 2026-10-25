Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955009;
	b=phXqJ3e5rPROPfUn1hhTCA9C7JGp90JJ+CO5Eh/1ZOS89HOuPd6XHPjjK1z/ztO9g1BR
	 dKqZmD0Y0tEgnIEi8gAD743MsC6g36XRD3eIcFvkAhWZB5oFzrkV+O45eZiFN427tFb0O
	 nRlE+pOmKRVLJCCoeR8joLFAm1H6L04yqYRc5vod7uXNmFwhUyH92m8mVBq1/ZWapH20Q
	 6gnrBMc9OyoZAjWSJ6cZGrC2Qxkwv8KdmIdA0P+E+NsH2QMOyNrh5U86iHz4NlZMFdSbk
	 dsJho6TZuhRv/QoJokBweBRHdfe3qbOMLrIw8ul8noj4VVMHCB5kDOsChUu+35iVVIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q59lJgdWrMpG/habggsWMdIWbeODWVZuLoi+lIAY/g8=;
	b=CoCCeAb/FjiwkxuuoXRwpMf2f0cH+C4zmRhHe9YpucWs7pg58MOA39eGtJuWLL/0reAy
	 4zinJBMC2BQiJYPkWQ1j6S5GMMEGqscQN6Rya/M3++wpls4sWC5+HKjuPjvOeCc4IdZV9
	 p1HEizUF2J8rTuWLD49+2JTYB7hxdR/NRoV2T7x20/VuLgPePrxNQcaCOkuJfUEmmKjO9
	 97DonLCFwSJqie2oL7ZWwd4P1yvseMVqGKRbhWGT2o2kO4vmDX2Yg2JECUgk2fqC0YkQb
	 x/kufeg/BmHmtTfjslYHTseubRg7SI/YoRevaG6JIj4pYRXo7BgDY7mCKKoDJ0L+gPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m9mi0h2g;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6793606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6793606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m9mi0h2g
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso2993490a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955007; x=1793559807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q59lJgdWrMpG/habggsWMdIWbeODWVZuLoi+lIAY/g8=;
        b=m9mi0h2gQNuCwL8zMMugt+VnUvZrXgIRxDikvAD9F8zTtfs633f+Mfv2E+bT31fp2d
         2QuNGWX9adBEQAcp+EQUVQsWj0Kcj66xlcnkeog4xF0GugGG0rZxc1KPV7mIL0YiLKYS
         V//+TgUIewtGadLyJLwglNPT+yXBT7uFObBD8yDhAl8cVL8E+e93MYjCPzsOdyfzBo19
         utQ6X1fF5He8yfGk+iPj5UwH0eQypnoAhSxwmRCzYKgFv7XGAk4pb0QJw75xdd09VJbl
         Fj9GNNwLT4gSiczEeXNGGd3ccE/vQ8Gf+qPs3rcBE57xIhY8W4PEE24AsiKb/CGRNhKr
         gAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955007; x=1793559807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q59lJgdWrMpG/habggsWMdIWbeODWVZuLoi+lIAY/g8=;
        b=j0ScWjMhBY+cCSxqzgGr7hdRBHK7xmJU30XuS9zD/9ZhjxO8KvWS1zOrxyeVwxntDZ
         /xM+V3GlToM/rR5+9C1otzfOGLLoMCQBa08otw9x+hA8u8x0W0q505yhEKAPlI5fqERZ
         eL9zdqGfohzti2QwWebqxCZzDtyWut/Hhb0C2aL0ecz8qYFqEsvBZdR5IM1Bd2qC582J
         kPFA7WnBHsjBnmhNl+rgFjLVikZ/yk/6ssaltfHmoM0qYWlllftOILZSOCfEZpxEjgbL
         j8ieKO8KwL6EDkRJ2Oevn4FYlmW9srs94eMAqwj9NvJaaBXI06YzLo5mdzG/Ug0JKBNE
         qBOA==
X-Forwarded-Encrypted: i=1; AKwUvByHzJL2X8UppRcYTA6XfOC0hZ9KSWmEc/UtLwyFic+zaUxsX4XHTRGxxOjLmIfX/ZyHtysfHI6MDYvXwmI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgTFSjpOjUH1AhUGoJo9hb8VjEbh9YxF7muIgp/oiJjO6zInAM
	9cKU7x7SbgNx9/u1V0fouhEI/fMdziWvPARVPjgXSsPAuo7ZT7GECQ8c
X-Gm-Gg: AYBFou1Tgzf1YEzPILtIoh1spTJ2K6DRHyNYpfdoJ8cn9ctj9Vi8ZW4Kk3N0SGJDUZx
	Tsk2VWRJf3o9ra6+rKEo6RylHWguc83HXEb9l6pHym9xiq3nMwCzjMB5Mli1YZ5gn8s5z0aJyHY
	8nNqtFzEiINUFb0ruRNYnkehJBBhxJ+auaRCSKno90j3tCdfIaWVB93nJv4gWIro3V+Wua7z1DS
	7Q/u7YECzq0U4Gy3aSgOwFOapOt6U1LNinAHzIJnA0jHxQMTNx5GgroVNPrYO5j1mB6e1xY89Pj
	SFS0y1u5Jurz8A0mHkA4bKucB63TyVK/bPExjPoXxqna8JYF7t2C1s+uliV7th4a98pIN2Ck123
	ldMEqQ0eCvgDxLqTcJbE5HFm1h1Ida0lmzfhqchNkA3hTiy6tCGSmibPArKxcwHK3Ds6pXnDp4d
	zUqdOtjWWAkJCZNrBFWQ6v+xK5htblu09XoG3NIpoRRMbTOAIvhh8+1uav+P5KEetQ2aXXINlEu
	NV5cy9hMd24g6jZENmtFbVXCknHbxmZawwM581+YbJ8DkzoKRhiXs1NMvx7T4u6kaG9rzsJPx6l
	HoDoPlJWXYAOvUMA0t47UmPHXMD/DJB2tBF1R0llVYSV1otig9Q3e17lNPtfAmCvEZ1+Y68A8VM
	ZLFmX9nH+Wgjv0+ztUiJlgf4HDUhIQBsQFTyA//vAGrz6KzAFdTq84sBVhlrDgJTejQ==
X-Received: by 2002:a05:6402:2390:b0:6b1:f575:1687 with SMTP id 4fb4d7f45d1cf-6b443000478mr3814182a12.27.1792955006928;
        Sun, 25 Oct 2026 12:03:26 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44584ad9fsm2754839a12.0.2026.10.25.12.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:03:26 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] memory: tegra: fix device_node leak in tegra186_mc_probe_device()
Date: Sun, 25 Oct 2026 21:03:22 +0200
Message-ID: <20261025190322.449324-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
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

tegra186_mc_probe_device() iterates over the "interconnects" phandles
using of_parse_phandle_with_args(), which increments the reference count
of args.np on each successful call, but never drops the reference with
of_node_put(args.np).

Call of_node_put(args.np) at the end of each loop iteration.

Fixes: fe3b082a6eb8 ("memory: tegra: Add SID override programming for MC clients")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/memory/tegra/tegra186.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 442edb2b0..0df5b5658 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -146,6 +146,7 @@ static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
 			}
 		}
 
+		of_node_put(args.np);
 		index++;
 	}
 #endif
-- 
2.56.0

