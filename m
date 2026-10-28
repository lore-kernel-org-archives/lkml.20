Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793147839;
	b=O1Rf81TTQI0IuZsQQEevJWopPKMIkoVReSuR84FFApGrkdmT6cShipaR1glqkmE3GHeE
	 xF+rykekAfg8y+rkOZSl4NesS67cY06F9Pm+sG7x2+Pp/VUtuDAvFQIUh/kr8Rqx75gF4
	 Yd55FEAZkvMkq/0XdwvdhyzFNA+UOwCCC1rGJyD4pUOZJ2mxtbXawMjOmusedCIS/ppAG
	 u1rodiYmC3rwcdw/wASejZVAmdFpJnA2pgLQd+4x9SN9UlI15ZhEyrpeP90ZjbJUqZiK3
	 Dwf8IgRxJDoHy/W7gFlK/jFKjM/2a56Ybg9YXvroa/XsjyuDAesxOxuUSDHTZQHLcLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793147839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SqYvixOaSSJQbje2En+O9XHXdXx9PhvsbeVvjhj94Ss=;
	b=hJ4ONo13vUte/fyTOZD3uCLMJigU6sx4evHjUeMlMKWZCBjJic2E0Yl7ZuQLYsAuSmfZ
	 uHqhpz/Yg7c2T8hC9V3fGpTOP2lIbAlo/VSmO/yACYhS/+lE3AoJNikLUqQ/Zobg9PyRz
	 DH/337xF6a1ukXOhWndFn3S7ln5H8KMized9g7vJa9PWl1XDvUkgWZsv14YOG7e4X7twG
	 cgy8a2be6gXPjtXcHki7R39UTsWlKPPRe9ELKejyYNXkDnaW2Y4abnfPUQpfRn2Et3ipS
	 ViBMS9beT4PySUwTKw69bM7H3jrvNcv94LbuykFVOYC2bMhb/tj8G6svNLvkSxjPiAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=XqGSRFCW;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC291606A327
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC291606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=XqGSRFCW
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso3296595e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793147836; x=1793752636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqYvixOaSSJQbje2En+O9XHXdXx9PhvsbeVvjhj94Ss=;
        b=XqGSRFCWBECA4t134CNMPUEh6JdnMwR/r4aoxTsdni/ipcinmlCn3WQqkCwLtzEoFa
         P3pOHXVO0tQZ6nJst6Frk1Um7+vFPinom49jvksShnL2tEKtQys7PiSFjKC1mZg+G1FG
         F1KaI9rtqP+2S0dQShMANYGlyVWNtrwwjtlGvI6bCjjx4rjJFQiDVfOorCBunFZHo0eo
         Qjcv0dZFfpXlhx1en+nok1ISUiaDLe1VimpHGKaVEERSs9E2CVkgsZcFjXQdLt+Go9KY
         WIqydPmwRthBlNWaucBLRWLl/SC6JI66tqBqrkwEleCO+68X9hik4BHbwhhK+sc1WtFg
         S1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793147836; x=1793752636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SqYvixOaSSJQbje2En+O9XHXdXx9PhvsbeVvjhj94Ss=;
        b=QT75k6ANbeJzzlUV1VMnvEOD88xNVbV/fP8e6dp8xMIt96G2FQ0IsYSlfW8IIESRts
         NrQbbZw12gfamXXHvkBEi6TzdetrnZIDrtLJoMJsB4Z6tfUjctbBYv8dSkD50FiMTakt
         xVEBmNOEOf93IAzVSEIgq6DLA2rlOp3VE0E9FqmSU2RgFKwW89mTtyvLCJY/i8+MoyQE
         wtnjzCszEnNv5mqZtYGcA52siUOHu/JzOmRjJDQwBnaZXk0DCyrEU7KDcRfwHVdaMDMW
         jNiBWBNXoh6MAViRLIQwto849/IMfGDjU0P3VY8IbG5ewlReus04MjOrcwivsGOUDfq5
         pStA==
X-Forwarded-Encrypted: i=1; AKwUvBz383vr65b+cTltuOuAYOg1a5iBdgveWvbZcUwRPOpqoctxLSneG07o+govRncSWbpfr4OQDTcHmNApE4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKq0J0cjZ8tE7LjvnSBl+fBfseF1Hd4LjV+D24p7K4EYv4sdXWN
	6w7w5uQe/Ck42uD71lqj5kLdkA72Yg9Bipz7ynqLx/mKuHQtAaL1fp8GU6Pg/5vkHY4=
X-Gm-Gg: AYBFou3GpPKrOSwWySG0o5jVAWlKbqE0P1SYjViws34oQlX3KaBsFRGxRawuGBGcptH
	4lAvkA+TaGgxxOSxnnql5xKON/MdCyFkU8VNObm/FIy0EjccmSIxhUH7U9fIOmIzbK2ICRp23Jl
	szU9gKirobQbCmY5QlOqBm1C3nDiYlgRANdJhWuLSwbwWGooMtEtxVJgF8sv7aP9rXkqaSeZiOh
	R8y2g7riK6yfx/twyDj3zQiWrTAA60vICpbCqMS/VTQ/dh1TinKrm1NdghrO+6mu1TI9LzBDEVh
	/quvr49fdjfkQKkgx5QKzhFLB3y487SI06UrvaxDwH47LBDvFC8DmI0G+Q25Wf+UG1yroSC2wLF
	DbnGCMKajr9gw3Kxp80o2xXzvdb0cW9JKLwKuTzXuqgIybsxkle5j0eiNvUDCXGELG3/C0hLK+c
	uGNWtStjhn4Aq/fnZ+rfiY2UCaQF98wS+1B8vwTeDV0zeppCMgWsGvbAYKKjuOYfupl/GFufEal
	EX0U+QqK7LrXAAWxgaJFe1rg5R1TNB2kTLziOq9/97nxrIs6+evC6iocN8t13VRvbjlILnQfNJo
	WM3iakA7j4orviF1/FXQGC1WXg3ls3Z/+wNjciZYoUqIyP9dYJGGekjZdoVRSYqeLst6cTm031G
	hwveZxBg9vRU=
X-Received: by 2002:a05:600c:1387:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4a96667b9f7mr12466015e9.5.1793147836309;
        Tue, 27 Oct 2026 17:37:16 -0700 (PDT)
Received: from irdv-jinli.dev.purestorage.com ([208.88.158.128])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a976010d2csm8395245e9.2.2026.10.27.17.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 17:37:15 -0700 (PDT)
From: Jingyi Li <jinli@purestorage.com>
To: vkoul@kernel.org,
	vinicius.gomes@intel.com
Cc: dave.jiang@intel.com,
	xueshuai@linux.alibaba.com,
	fenghuay@nvidia.com,
	Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jingyi Li <jinli@purestorage.com>
Subject: [PATCH 1/2] dmaengine: idxd: fix double free in idxd_free()
Date: Wed, 28 Oct 2026 00:37:06 +0000
Message-ID: <20261028003708.834341-2-jinli@purestorage.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028003708.834341-1-jinli@purestorage.com>
References: <20261028003708.834341-1-jinli@purestorage.com>
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

idxd_free() calls put_device() on the conf device, which drops the last
reference and runs idxd_conf_device_release(). The release callback
already frees idxd->opcap_bmap, the IDA id and idxd itself, so the
subsequent bitmap_free(), ida_free() and kfree() in idxd_free() operate
on freed memory.

idxd_free() is called from the error path of idxd_pci_probe_alloc()
when idxd_probe() fails, for example when the device reports HALTED
after reset. We hit this in a kdump crash kernel, where the DSA device
fails to reset: the double free corrupts the slab and the crash kernel
dies before the dump is saved. With slub_debug=FZPU it shows up as
general protection faults on 0x6b6b6b6b6b6b6b6b.

Let the release callback do all the freeing.

Fixes: 90022b3a6981 ("dmaengine: idxd: fix memory leak in error handling path of idxd_pci_probe")
Cc: stable@vger.kernel.org
Signed-off-by: Jingyi Li <jinli@purestorage.com>
---
 drivers/dma/idxd/init.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 4b827a329756..1577d22b299c 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -581,9 +581,6 @@ static void idxd_free(struct idxd_device *idxd)
 		return;
 
 	put_device(idxd_confdev(idxd));
-	bitmap_free(idxd->opcap_bmap);
-	ida_free(&idxd_ida, idxd->id);
-	kfree(idxd);
 }
 
 static struct idxd_device *idxd_alloc(struct pci_dev *pdev, struct idxd_driver_data *data)
-- 
2.43.0

