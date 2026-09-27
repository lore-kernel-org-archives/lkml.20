Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075B33CD8C9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790497646; cv=none; b=LpV6Hh0MUUddJ7CUZSSxbMn6A5ljGMOhz8f1DvimcaVW5cgEy0VkbEVmZHRIRZKoTqtjiDaziUjvHf4bfFaIV48xODIsIdc5amiFp3742p5dQG374gIs9DzjNvq2sLbF9yADcJlp4TNVXvzA5szY7OSFb52Zx4P0tzWKC+UZgFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790497646; c=relaxed/simple;
	bh=NR7zvAuOj6YdKnmg+3t3u0hU1PaHud3ygdBFbdW5fNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+Ke8F1QgGg08V//HoRPQ+zQy6uFnvIDbtW5RWivjXFNiz8cm8tDHYpjuzHb3Y3YoW96klR+bUMhVxHhlB+f+/T6/g5Wrs+4nWXJOrmvZGZZDwP2MoP3tAA8cj0skhBJmWN+dtweHGUBkAdpM3bQcEuswMEqNu5EjSr4vv4M8/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pzMa77jq; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pzMa77jq"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc79c0d2bbbso357987a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790497644; x=1791102444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKGd2FIRUe9e0cEAg2ix6lWvPWTo/rywpHY3UIN6DA0=;
        b=pzMa77jqHWgHC+WZPxU9YKYTAAv5kSfsK8YYfDsgFzqr4lOGPHPs7QXOZT3s0eI6iT
         eXCpoQHyxNn3f8uMtRcBF/IJozko7tJVk1HOsg4LCRFVtDlhXiAAX+iQ5VIcU39BRbKg
         M1aS4tOALj0mfCW1NFwNpbEclwAToNaMtFCdFgd3YzBStt8Ftx29C+c7yDfmQVVQE5jF
         IdFFb0JXaBPx80ErvmD9uuJbLuSyAaXbOVKvF7wNdO15RBV88KUcJnV1S+KjZGGxeZgj
         9QWy0pY9SR9AQ0pbSvnt+OHkRtPW+0qyx2MLRX1Yc5Q7+XJKg9UvznowIynArLPbjAWt
         irag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790497644; x=1791102444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKGd2FIRUe9e0cEAg2ix6lWvPWTo/rywpHY3UIN6DA0=;
        b=fhECLJO1OYob1saJ01zzc/ZlhEnioCXV9ZGvmxKq716rIvPpjl6DOgloLMGnqvtowc
         XweEWHE/y2ylk1jYQa0FD8BrfVu7dRbQAU/WRWu72VBNUB4pq+cOnVjJSlxYy3SlqYQN
         WtTUtpX3j6aw873y9cK2pKTQ8l8B7NcQ+yVzill+r87IKhml+Y8hB8+fYJjz1Oe0TO40
         1qikZ6trnOFUB/1d4VfoLfQKeUOUGvu8WCS9302+p0LLe+/pVYlBYPhwvHLMa3kCh89X
         4kFpfuhgXS4JmnK1CDisGL5a5FYp0SorLSJ/mBlmNBQ8vavQKzWojm077ERSCrXEWeGc
         lIpg==
X-Forwarded-Encrypted: i=1; AKwUvBz23G2GyHDjOqpSgAcYDY8IxG/VT1EZOCepAqoXmAjNX5oPBukTCgkd8iwkBO4bgm+h/VddHFvMMGDP1R0=@vger.kernel.org
X-Gm-Message-State: AFq9FYINEEqEXExOkJcqqCrgJ0bJo4nl/jlKH/4Sopfx2QUumulrcRoH
	Q7nsovMc2vIxVNMxZcT85RcxR+akVJWH6L1NZvGjvJmTI5fFOoJwZFI1yEYu9g==
X-Gm-Gg: AYBFou2XiYpKEE6s0alSUPT4sC+DMe6WPSmljSgI/fldRlCE0d3UPYRFIeRNpXP7kSd
	ocQDG6d2CejnpLpsvFr1Cheo94J7OHyOY68VF+hGabvcXvryLnpdpb2VlfDJ0r7604/5ZEC5KVd
	CLJwmkHsOMsyPV3zIWhXYPyi0/X097AlCSVNUfD4wzOJV3HOQ4avs148vfayFaWgBbf5W7wIJOT
	aQkInls1S3GXz6WCmc7rAZMsxLBubA9Bx/Saoay5cJ2VE+LIzvictCLPZyacnYiW8PlQfHHL1Mp
	YonGkb2BgvXiAZDdlJdFwQjQKqOMioj28L56D+9AiXxr0nlWhx7mBI0EKthigarXmGcGqn/qryB
	UATHSFjRDCzF9s5wAz4QPPCxtFe1F9cgX0rwv+934o9JknBvB+uf7qXZ9AjciBf0s+JrEXV/ji0
	0yzpHK3mdPASfAE1zFRVqHqeuIFbMH6pAj+Z6svBVBMHsZCA7/dzfoyQsb+Z2Yeqb1nBEK02SvC
	w==
X-Received: by 2002:a17:90b:4cc4:b0:3a0:9640:8042 with SMTP id 98e67ed59e1d1-3a0bb60e57dmr4980230a91.43.1790497644298;
        Sun, 27 Sep 2026 01:27:24 -0700 (PDT)
Received: from [127.0.1.1] ([1.243.227.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a2b1e4d5basm1921496a91.9.2026.09.27.01.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 01:27:23 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 27 Sep 2026 17:25:54 +0900
Subject: [PATCH 2/3] drm/imagination: Fix pvr_mmu_map_sgl() overwriting its
 own error
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-pvr-fixes-a-v1-2-7f5b18ab989a@gmail.com>
References: <20260927-pvr-fixes-a-v1-0-7f5b18ab989a@gmail.com>
In-Reply-To: <20260927-pvr-fixes-a-v1-0-7f5b18ab989a@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

pvr_mmu_op_context_unmap_curr_page() is called here to clean up after an
error. Its own success overwrites that error, so success is returned.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index 3cac482e103..3e494bfa936 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -2553,7 +2553,7 @@ pvr_mmu_map_sgl(struct pvr_mmu_op_context *op_ctx, struct scatterlist *sgl,
 
 err_destroy_pages:
 	memcpy(&op_ctx->curr_page, &ptr_copy, sizeof(op_ctx->curr_page));
-	err = pvr_mmu_op_context_unmap_curr_page(op_ctx, page);
+	pvr_mmu_op_context_unmap_curr_page(op_ctx, page);
 
 	return err;
 }

-- 
2.43.0

