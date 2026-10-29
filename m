Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271041;
	b=c2xFbGd+Uj7hdOXgWmgVqOMNUivmAnzX+lIOLDC6bn05ZvbzvPOhvyltujjZW1Gn2ncQ
	 qEMV8309JL9fsY/OudahImtP5JKSrhxeHcwk3lOS4N0XSiTUIZFX50Ps6kh+raMwPdKIR
	 V8gplWd3YAfUMBIaBOM8M1zosmu4cxEkUQqyxZrKvuluw+jPLVUc0zR8oto9lFVaK7n3B
	 F6Tn6BXyZs2PdI+pOeEHgpflPeyZ7X6rt72m0b0J0eXeeDLP0W9DGU5n5gcwUabR88I+F
	 CFZJR7Mmd+kmLSAvWFPak0tZezYZZ9+zwUQaKKEls3GxLT1VXpTVBUrSX/dXOe6BLxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CW8IOaqeYsrZkoZGxqPTohwddEkpCD1uTeoSdK9Umo0=;
	b=IeCEGzbKa5ggh/epRUQQNtQWmHMIILpbraelbUH16DNr+mNjOKBS5i1nU+VNydMT2hMd
	 5HCpx1jlGMiWLetSQrbZDkclUAYOTYfiSo8AJckonn42MAX4UP7nkADWO+6p3cJVTWJ77
	 eLPoBW+Dl0H53ruYELKP413SV11Q/E5oTed+4NRIfjHuplUkQM2vOXiHzNcN6hO6n4YWt
	 6r97mJOqJ14ZotWXTfcrZbxuSZLxUyYMwZBZkuF9HkLBe4KHRdaiBXEXVrpptZVxz1PuD
	 RUL04eevBRK8rZZBJiCpRB1DLhfM0k/AKkxAq3PfwHPxTvKSUrVmD0ibCXX2uqxkZ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3lMYVWq;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1010606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1010606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3lMYVWq
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a78ec32fadso3372455e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271039; x=1793875839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CW8IOaqeYsrZkoZGxqPTohwddEkpCD1uTeoSdK9Umo0=;
        b=A3lMYVWq+snDOnoFwdDh/YWCR8zVuCY1F052BH+meVOosbnLb3orLSR6J1RHndVGIu
         UsuL0F6ka2Z8pCXjgWqoZxYkGgOo+JwpfxpyDEnTID/q3EODEBYiB2Log65XDZclsJ0k
         YLl/BxJqKs32X0uCD2HCP9DrUBGFbVm8P5vIrj48hmD3qcT4xldQTpOHfOYic33YEPUz
         6wBlW73uTWczHRZZMRARsFY2FxmPhig4hfT8xLH5pxgmiIruDAsi0bTYP+vVQ1MHbezv
         qgtIrTPbhym5bQcUlfzKOreht+QsEH6a2va/X3mMX+unmvATxcSPQWfrS6Vr9UZZ91Pp
         b+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271039; x=1793875839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CW8IOaqeYsrZkoZGxqPTohwddEkpCD1uTeoSdK9Umo0=;
        b=1tfmA1j1d4LNNXu/li4YMWWfKdJl5dlZpb5VINRq5kDCAOJVMTIEjoVMNxvfvjcLUt
         tGAmp63J7JJRC1Rel37e2s1xwVHoUksDMtnTLfNU2eHVXJEdJWNAD5WXLHWj5SNdToua
         ayR0h+xBBSihFYd0wroJ86/fUbnJIk/aHqO8R2THL8ZTOnyLJS9fdhVwBx8TEqCIYjTg
         fDh9SvNFJ7vC+3V2WImG+tcmXWfcMsOodN7al5tv3W7NWescV6lEJj5zYqDNhJW7pvwl
         ouCHveRYErFXjvwtAI0CKIU8F7C994EQhL5GfVwNJ1J/paQ03+JKMAuNKjk/UOZA1FYD
         NHQw==
X-Forwarded-Encrypted: i=1; AKwUvBwr+ffhzAif7lN1lRnWmYCdxQnyD617EMjTgVGBiJ70GGinhz0UcUqWuX5LfwOpeFCNGcBlAkpf+FyCZjA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKs9bBNhfEfiT+oOYuloHNFtMdYoZwWaDKVbBPVykfXbCqnLcJ
	3ZKvFhONm4soHE4rumatmoXnEZFqvDDcXhUU3JCZn8Gee54pB3k+yIG7K4nmWo4t
X-Gm-Gg: AYBFou3BrbjfCPPlRh31vSDQ6PbuvHRKOIodbigmtXMTY/2bBO3NTHIg6rR9xyetF4o
	EiGiEqzo5/+ptJO4d6MoCAuRGaDtGkOCJkcTw1L125V/rfHTl7TUwVxJi+r2Cq919xRBf1i/zho
	CVucLhPvVbj3idNaXkkr+4mzbRLU/nLbrewfNh7Iqj4TF4j9inmVflADkh4KHXgMIPmlKhdKgke
	ch7iDj3WHopZ9HnzuEpCiObueL/ZU49uqTcffUkqzKfbnTyWrWDa/BxccAbrnrpj+1/dyjlRwsa
	zh+S6Yzi1qwbKVOGb1zr5P2V60t754SDCAROdJSZ/+d6d+hMIiHHpB+Ke9Jg+58N6QYtIE/FS/X
	SuCtkSwT9lfJPPjZEuq/3hw/DpKwN7mf3v0ysAQW4Jkaa2wvIoKycq2OSzhvNFVQKaXMAm9YdwO
	wOGeTOU9Q6jX+2/i1bbcjzXVbPdjs3ALvXnFFxHck5iKo8SMWwPA2G2JLgC58UfUCiY346vbj4M
	ASYSsXUPV0EAdHLlTXugAD39s0rxHOzlkCR/OEz6GkKla9GqebbF3oU+DP/vpFf8dxD0aUUDULm
	4qWIXutjXK+3ueY4I7tDpXj5MnDQYbwPy0aaug/sfLuKu4CU8NZum/TJZrkdvlfuFhYD+rQ=
X-Received: by 2002:a05:600c:4286:b0:4a2:6ef:d1dc with SMTP id 5b1f17b1804b1-4a965cdc67bmr72534585e9.1.1793271039058;
        Thu, 29 Oct 2026 03:50:39 -0700 (PDT)
Received: from thomas-precision3591 ([2a04:cec0:10c7:3c2b:8fd:45b7:b1ca:5901])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f50d3sm84444945e9.8.2026.10.29.03.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:50:38 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Javier Martin <javier.martin@vista-silicon.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-media@vger.kernel.org (open list:CODA V4L2 MEM2MEM DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: coda: clear m2m_dev after releasing it in coda_fw_callback()
Date: Thu, 29 Oct 2026 11:48:09 +0100
Message-ID: <20261029104812.26411-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

In coda_fw_callback(), if v4l2_m2m_init() or coda_register_device() fail,
v4l2_m2m_release() is called but dev->m2m_dev remains set.
v4l2_m2m_release() is also called in coda_remove(). This would lead to
a double free of dev->m2m_dev.

Clear dev->m2m_dev on error paths.

Fixes: 186b250a0725 ("[media] media: coda: Add driver for Coda video codec")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index be37ea568bfe..b1a656054b89 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -3023,6 +3023,7 @@ static void coda_fw_callback(const struct firmware *fw, void *context)
 	dev->m2m_dev = v4l2_m2m_init(&coda_m2m_ops);
 	if (IS_ERR(dev->m2m_dev)) {
 		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
+		dev->m2m_dev = NULL;
 		goto put_pm;
 	}
 
@@ -3043,6 +3044,7 @@ static void coda_fw_callback(const struct firmware *fw, void *context)
 	while (--i >= 0)
 		video_unregister_device(&dev->vfd[i]);
 	v4l2_m2m_release(dev->m2m_dev);
+	dev->m2m_dev = NULL;
 put_pm:
 	pm_runtime_put_sync(dev->dev);
 }
-- 
2.53.0

