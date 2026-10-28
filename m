Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192137;
	b=PQni2TaI+8S2/L3egR7AfSj0tUxAa0mSKLHPrybTO5tI9O6lzBes0Cq97s10Aw4oEpWJ
	 5WL5w8eSRflSJLHMpw2Y8BIWfYzU83CSIT9Tg7dZ8OkwrWnFOsRRz4eZlrMONsT55BdYw
	 KYMIzcc2sJlnWfIVZStJymYW15G6txhFnZz9pHjw/kjG+6FrxeYT95T1lsDv+BGGCbreY
	 D5mJeenHMgfgSd+fwSTwIsr4ZoBRR5+ZuO96Wvhap93tAlrUXc/jtGlePOnrTgMqal6QC
	 bmiyV3wzlNg+UHEg+CF9H5wgC75CZtc4N1i4gNoZmBoUqbhfstzmSL6CdedDM5Xh/4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ps5+LmGCbkC+crD9HC10oKgEWdHlSUG5WmCF02iG4yg=;
	b=BrDDnWYUWwIZGhomx3q82LxpTUGm0+bcbEw62PheYrD/O/66LDSnmcw5ZOORM1D8Xvro
	 3sKZ1AaoxhvH1C2lW0VU+WFiVOB/3+W9p5waI1JhhjVTGSBjgPWo+NvpK+PiCXUHGGSp8
	 XM9gadvmMhzxbCBXIlQrh2OY1U5M9MIQ6jfcwDls+TV6ma/AM6JJ8RE4HpRvTLRWkQ+/F
	 vp0Y4F6VmJNfD6N4nNsYoaleBEnB5L8s4LsoZHSsbIkKye+xjwfSkPOLZj5e7KyXfVRIS
	 zgVUEa58leLFhvFLSECR2wg5gKJtWF3bm3TUf5ZUjiERLRqbbrQbqgBAi7+hWJUgt4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJsnccoZ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF4E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF4E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJsnccoZ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so8240055e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793192136; x=1793796936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ps5+LmGCbkC+crD9HC10oKgEWdHlSUG5WmCF02iG4yg=;
        b=dJsnccoZ/zR2tUZxGu78DiRkL5iAwL8EAa0PjXLHozIigUx47mR9qmcZ1SRjC2HGAk
         mdCpwUoS1ce5Wz5VA6Mn1eN48ufJPoZ91887+nehErm/8aFtExZBDh9cqAAm1I2jwl3X
         bpNd5Ys7A0ib5MC67d7j8zxBf8AYqNJnWL7MuKa3En7dwGpZRMUMG5WxJ/EBGMgWdQt3
         2DrLfwzwNuI3ERZEhmiVFzujnulwJoy4rqa8lL2nukeNNh2F1DO36aN4YexWkzFw57Cy
         LeEee1UZpRw4lMT4fshXIgFgrcgAznAELEfTiPyEnK1cbI4GEPUdPKAIYJv+Rnj5ND45
         43Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192136; x=1793796936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ps5+LmGCbkC+crD9HC10oKgEWdHlSUG5WmCF02iG4yg=;
        b=YDfEq6Txv+Jqvn2NcNVDflssNeIKnC+DNjt1E1GCHkKM6AYfI2wuxJJmdPl80/vfRa
         V6Y47NA9jPRebhZmPWdQsotCTiG4Wlrrh9D7o0S23WjTbfzeleY2R5U9LESoWtp3lt6P
         LsjsefO19OcNm3hssGrgQiIFSSHpzYPlSEcjskegwJSFPYzCXGax6Ghe1j0gaX11yGSo
         f2rwLFlv5J9vn1u8Ys2FsatcnpfdBVJQ4tblVY9R3BiaM02k0rh4honc/fqrDh7rZEoN
         /bRE7MlBKxeS5NIFsymTCUZG6NDp/cc4ggDAc8FfW7UDemr+qMxNiHaiqEqTcT4AeTK8
         AxjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxS16ZCD5lXunrJEzeOUp3IAsnQgAJn1WvMQ7miG4rtKU5r9toUWdxCOR+YzvAUxMkyOpVsz/llBswM2q8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZayd80RQYgrSVEd6ArRQinzP1zhhG1OG0PdcPEpiVbkRBZyd0
	4K3fQmTD9FXF2gJ3L4A4mpk2dZ5+zS9GKNd/BI40NuqsMkmE5Qo+y+ax
X-Gm-Gg: AYBFou0l9o9/uMt6sXa6bzZc6ZmBEzi1nt435LJxts+FhYtT6JDeoVE9FIyfu6QdnC9
	TB35HsbPsLoEAgNhHKUixpMmZiX67lcp84w9Fs6gxlhCNRif5uJ82m6Qal03rbe6S//HEvRtsOy
	CE/MDVpcnWOPgZ7iukAUqDAsPhmH+wBuEIFO/dRAXULzPtxGPNYczFFHijGmE4JAX11NFv9Qj1/
	PCvKDhjI+hTPWHfARw7L21ptt+xGoDW5IMf7kCLh7uCRp3xP4e8uEC8QI9Y+eMep/Jr15ITl8oG
	XBDxNIK5V5pLkNWhCEzy82yGVR/y4bNxUF1CyvIbr7Pl7++LiF4/7VO6nN3SoCSMMATMLoGdnKA
	XiesFh4NvcBNLNwv+MWhAiFX9zaGWnjajJe/djFv68o7KZfpSUb5QzaJjLTHykb0nKPV0+FyS9u
	iVKkJcpp3NDNeInZkJezw+/yaGrRt8LwXoYthjZQpwrcl98t2RT6ZcE9whHvYFABTPqGa5/YOl6
	wUzYiiSDYYPQuad+cG7Dl3vswq4b+9CzglbCyQkykAx+JLexd7DZQMvMmMqKPddmjQQ2DM7C/oC
	qR4MslmL2CwsdILg3n9omDsKE/CuCEkwEZChshLV2AzfuUWyWVXagE24zMZK+g6xDQ==
X-Received: by 2002:a05:600c:19c8:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4a967201e9dmr49647785e9.27.1793192135516;
        Wed, 28 Oct 2026 05:55:35 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:47f1:8a3:6e76:cd9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a978d57c36sm43998305e9.11.2026.10.28.05.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:55:35 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Brett Creeley <brett.creeley@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dave Jiang <dave.jiang@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] fwctl: pds: report device information length
Date: Wed, 28 Oct 2026 14:55:32 +0200
Message-ID: <20261028125531.978325-2-thnkslprpt@gmail.com>
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

pdsfc_info() allocates and populates struct fwctl_info_pds but leaves
the output length unset. Consequently, fwctl_cmd_info() copies no
PDS-specific data and reports a zero device_data_len even when userspace
provides an output buffer.

Set *length to sizeof(*info) before returning the structure.

Fixes: 4d09dd11d7d0 ("pds_fwctl: initial driver framework")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/fwctl/pds/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/fwctl/pds/main.c b/drivers/fwctl/pds/main.c
index 68fe254dd10ad..01abc7e83975f 100644
--- a/drivers/fwctl/pds/main.c
+++ b/drivers/fwctl/pds/main.c
@@ -63,6 +63,7 @@ static void *pdsfc_info(struct fwctl_uctx *uctx, size_t *length)
 		return ERR_PTR(-ENOMEM);
 
 	info->uctx_caps = pdsfc_uctx->uctx_caps;
+	*length = sizeof(*info);
 
 	return info;
 }

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

