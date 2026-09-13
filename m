Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A222E738F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311001; cv=none; b=HQNlsPSkBIj9zkFuQwa8St0WolAgaQ9fOVlfNErEce2o/sL3vcX22dZPouF8GRDfoXgni+qbayTKZAin7a+Lcu/MDMm5IYvzYmCvOkUqnT4zXhEQgCtbv7QALlHAO1m2sWvsVtpIOzmn48fnyeHKeYoSzcMabHW8c3mM55MjCTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311001; c=relaxed/simple;
	bh=LubrbMnxIKnN7lBVtvVGlZxjV+CpntlE18ShoqLWK+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aq21kaWAcMCzVNb4HF0ld7TcWpMxm3CwzSJjAUJqEUso+uCAHZt8waEumpCnu0FFcJsQKtUE45IgfVFSVMV00pzjM160nbRnAYlfzif6rfr33T+4A4uLoOo42ljtI3xuLWGeNS/ESH0l3+IBo5kOwwa13CtAvNMQr3cjHXSIV10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rS0/MFLW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rS0/MFLW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so5149205e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789310998; x=1789915798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=afPZZL7err8emUCp6Hyuu5QUo4GAQSFPzGqL5FJ8ZIg=;
        b=rS0/MFLWDopHFHUzo5HE+aWhwaVj+vUa8JayLN+PCNMBXHJyZxUz1Z9b43v/Z9Eze1
         uf//V08WJyfEhVQZ+sgHmHtGH+OG4OweFteYhpH44nRfYeZORJHOs5foa1fwAgrEszYU
         OEHcpHM6cdoDlIg+nHI/DDN7FkHmtv2PtStVoroLsygH/ay1I9q4krLbpJGvzJYsiPaj
         7jDF5zvk/QTE5on+eSQX3R1tW483mB+JVYFF3nNve2pfq60FLwXZdU2DJlve3xACqCwT
         +UqcH10a7M93Zbege5UcH/ypVq/OmX3CMBAfEjtwFZJLwHymjeQpJkBUwDwzK8WIW6qd
         yASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310998; x=1789915798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=afPZZL7err8emUCp6Hyuu5QUo4GAQSFPzGqL5FJ8ZIg=;
        b=gmy8odeUZz24bLGTqn/Qq7pt6Laj+/N10WVsHOgPQR789evkTaauWFHwLXfNJ04GT3
         uCITC0JcdMpFEOhCdzo26pnOOSOTVP4aPVW/TpxD/Na1nnNxktxSLCoUpJddLtroTBj2
         T/xSR+roQGGM1InHDNQS9fs4uhOjc357fxAsCKEwjPjWTXOJO+h063AEYvEYAIhcdd8k
         C35f4WeDg7Sj/+IyCGYC1R6PkRtm0a40+DON1WnKk6A3TPoBU7Y7GNVSiU14/FXgDWhK
         feXqO1Jo7RB4qq34QVnmiSJpRj38zNbt5ErTwRzx9l0uc2pnEwUHymqnM12IhkeezGh2
         9CYg==
X-Forwarded-Encrypted: i=1; AKwUvBwZQ4BxbogiF0Ky27dj+rZHOzDHUdgjuKJm15iyugjHYhRvBA+J8dpaD+dk32tkfGx8rn5JNC35LuPwc5c=@vger.kernel.org
X-Gm-Message-State: AFuF++kB7aacpJ+/eNlt1+4k5XXfkq+aqd5yXLMPHCnIBJBHCeMvdyH4
	rwNC0FNmiG2ViPMCmSp7ME9FWQ29qLgOhVO7O0VFwxwl/S2dlxOFyPF3
X-Gm-Gg: AYBFou2SVjtJZ5k8JkSYC7ucqCRMMJ3MEGmOX9q0KWqEdktzIcU1d3rRS/6NfXmV9/W
	OA3QbUt83Dfi/RvSQH5mNuPfh4wyqex8e4oMXcL0ugQWtIXb18HbmiY37pEnKXIxtRfoRjygAYG
	oJkLPVZ803PEfl0E1XZ/rlM1ObnmQmKs0QNrHmk3gYrOq9cilNdZ65JDvWK01tOZtOG5ulgXERr
	/hY3+ZAI76NfLrHRduMG4pM/hPa2j1rGP9iA7CKReEbOQ1/D/uZwRz6sAn27J8c3N1WCb0K2lV5
	3exhNOhqqxhxCIJFwTfgn+bnmnQMnD/J6MpseMmrYX4mtaFo2DVAdSQ2QEyS/vso2Kfkv1L8aks
	EQ6kylI4JAAn5umb+YCM7/YpQgG0+1X539lrcdcjsG2szed0EGgy82VoMNvLSKXyrMDjCB/bLM1
	AdlsuDfrSqbVQ9xa6WSHAHfpSuH5MHiOmL00fLMhvgNBn+Bgox/8Uskidg4IIZvtXEx4Yq0Ny9h
	vAxWsxBj15VQBdPmRRRjS+MKGv255yKYXCDm2N8sCs=
X-Received: by 2002:a05:600c:3ba5:b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49e6caad1a5mr80018295e9.12.1789310997702;
        Sun, 13 Sep 2026 07:49:57 -0700 (PDT)
Received: from f.. (cst-prg-84-1.cust.vodafone.cz. [46.135.84.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm109534235e9.3.2026.09.13.07.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:49:56 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH 05/10] fs: use path_clone() in backing_file_set_user_path()
Date: Sun, 13 Sep 2026 16:49:12 +0200
Message-ID: <20260913144918.1606123-6-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913144918.1606123-1-mjguzik@gmail.com>
References: <20260913144918.1606123-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes.

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 fs/file_table.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/file_table.c b/fs/file_table.c
index f9d1b5edd6ae..0dca0c6c991f 100644
--- a/fs/file_table.c
+++ b/fs/file_table.c
@@ -70,8 +70,7 @@ EXPORT_SYMBOL_GPL(backing_file_user_path);
 
 void backing_file_set_user_path(struct file *f, const struct path *path)
 {
-	backing_file(f)->user_path = *path;
-	path_get(path);
+	path_clone(path, &backing_file(f)->user_path);
 }
 
 #ifdef CONFIG_SECURITY
-- 
2.53.0

