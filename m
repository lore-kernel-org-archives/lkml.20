Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD9B518126
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904401; cv=none; b=adVPnev8fgU9SVry2Uyf8bhwxGqpV1E15lQToLCUws+WG4qntIqiwvdbOmi6VAaJ/KxKHGKcvwHtM0TKAJsrodDBj0yWbubu6unGPijdTD+Cw2Ks44gUdvFU2f1tFhnS/JMiflLGwB8Z6S72mlo9tlOcTziyObszgumc6vbjzOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904401; c=relaxed/simple;
	bh=YVw+gP4drKTv+aM659q0lrnd6VxcXKe0q9Bl7K1WqJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJQioJ4zf680bwXZdCpqwa0fwkSSVyv08deJq1HcY0o6eGDd+utDqXYiRQTMwfwdDSPA+eEUKc+zMA9+Yx1fhO+O4U6BGFPGViP4tbVc8TsLE7lXVxeZkpd622edsZVFvKge3EGfzv9cwm+WJQMuMpuWpw39JpyLz9iuDpog8FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggsZoh1q; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggsZoh1q"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so24929635e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904399; x=1792509199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHnf/NNvxKAntPpUprDH22l1626hA2gmTLvCl8X5pnI=;
        b=ggsZoh1q0OEnw3CGwXQISkttWaYGDM8fO3Xf/brHhSEeIq+vrvBm2XOw3fXf++QGPF
         1toThw96glbBGni7nFLvNw3EtiS5/kqlnzI/seqTCLEDZp4jo4sGLdyQ/HBPoJZkKPIr
         Bm8i0OLnknhP66sVXe9frG6H5+PA54LuH9LHyK3T51a5WTvSVB0hNqJ1PfKDB2o1J2LH
         Vz+0NSHZGCU4qAJAUmZVeuLlF2098opUVf9x3EwsqKT3LML1+dzA0cnHo9cjLVeXfEcK
         8SjRxUTrSDcT2wosmHjwE4M0F2v2Sm2FwuRfem6gfO/duXaupX6LSU2OnuA3XY8SRG80
         yY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904399; x=1792509199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IHnf/NNvxKAntPpUprDH22l1626hA2gmTLvCl8X5pnI=;
        b=OE5onfBlLg2qzgBAu0gWJPz0FCVvC/R/uDfFE+u4CcHh+hh9w1P7Nb/gHGhY7aCu+r
         QWDm/zlfb3aLnqfZX2B4llU+7idZSXsZkTtXkcB3+U9ZT3RqNVpQ1A06MykOghowc99L
         YIvfKB1lEqE0yty7zX4z2Qx6yEQsjQli1NHUzGq3AZz+SV35M90LA/cRga8KCDF75ci7
         gHPURHhRJ9eWw+i/AcxA77mzWH7l47gfzKEVtqq+4pTgjP+yRUmtNI9ZXY32pzpYJo5U
         p2HMf6o6Y3HVI8FyvB7KODvo/E31ghteV0srhF6JGJqPlx+J/DzhWrmHk/KfHa+5EBCU
         4yNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFm2s3ZQJFcXYHS+b3exZdMFM90rk4cEHh9D+19FzvFXzi11BbNowCfSlcxUFwI6OO3F2/QzvqNAfCzQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaTU7+0v2LiLCiyedjjPbGaYQ8ACD6VJWE8q/hpvdeCETpRzGD
	dift4D0uDHYzML/Ui1Jsmwj32UvSWC70Ho/srUid6znZDrqtX7+fnqYr
X-Gm-Gg: AYBFou0KIJVA0nCMcu9hYm6GmAAEbO/iKdp87JugFCR6xKt47uR7UqFU9r17Gt6XMdB
	hc4QFqS7TQvmkifqKidg5BO5+lNWXz7IXzfwK1djMi6329w/6KdDCh6+MPy/4gg+78188GNcrQk
	NgYxFhiBvPDh2GGG6716TrTuWpj8C6l0NRgDkvOu+r9E/56ldqAJ+SzX7T6GDiNOYqhU7nQZb2d
	5yPaIjZCDQhG8YwBxUjgpVgx6LGljt+UtAio6tFbjDcr/dekzgmPt2+ywIFb5/gJKzjoQYUj57S
	2gFqaWrOVW+29AiQOntkKrJwLmV15+nGrigbEvPg+lFDsFAbsIAmFKTZXkudexotDHgQbq2X1tt
	LKnc8R5bCkjlW+dYM0eK623OMQHxLxomza98DkLsRHuNliqkJGp5fwyUVAQWlRaEZXNvZGDBh6S
	DsmTLAQ+l8qQT56VBvKg1/LMd55MG9ZXDiRv3yzFZB7r6kDN8uK2OJmwjC09T6BO7K4d4=
X-Received: by 2002:a05:600c:3b1a:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4a18e4b91f8mr221819945e9.20.1791904398590;
        Tue, 13 Oct 2026 08:13:18 -0700 (PDT)
Received: from fedora ([2a02:4540:5040:df88:1668:c646:af2b:6f6e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm357374335e9.14.2026.10.13.08.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:13:18 -0700 (PDT)
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
To: john.ogness@linutronix.de
Cc: pmladek@suse.com,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	linux-kernel@vger.kernel.org,
	Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: [PATCH v2] printk: fix kernel-doc name for nbcon_write_context_is_braille
Date: Tue, 13 Oct 2026 18:43:00 +0330
Message-ID: <20261013151300.75966-1-ampr.mhd@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006163141.304554-1-ampr.mhd@gmail.com>
References: <20261006163141.304554-1-ampr.mhd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the function name in the kerneldoc description.

Fixes: c83e3d291243 ("braille: nbcon: Allow to use a serial console with NBCON API as Braille console")
Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
---
 kernel/printk/nbcon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index fb1b37741..5f8afaca8 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -2005,7 +2005,8 @@ void nbcon_kdb_release(struct nbcon_write_context *wctxt)
 }
 
 /**
- * nbcon_is_braille - Checks whether the nbcon write context is using Braille console
+ * nbcon_write_context_is_braille - Checks whether the nbcon write context
+ *                                  is using Braille console
  *
  * @wctxt:	checked nbcon write context
  *
-- 
2.55.0

