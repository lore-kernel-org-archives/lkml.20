Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACA53C1D5B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791350375; cv=none; b=ZDqdgFcvklesqOOL3swXzozHpsF1apAjZypTxBKk7ms21v0CsrT+kjPBCJHa4wvS5mwmM+fPG++BAdQs13fdjUaBcNHSO3DN5bnzDGflLVx5LNvJ8UAASq+rw/S9mTVzm2ZwRE5mJTgAANMvTi+klWwg/pRwPMrHaAfH9ugwIVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791350375; c=relaxed/simple;
	bh=pEBGEIuvQXUOhw2qs60K5A3Yyo97btH1M39qmx8g1LA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VFcNV37JT+XiyDY4CsBa+sT9thjprO1zOxTazYt+4VUVKmZLG+74aHVYY9kuECgvUFSalB9vl4/qZKaqD7q3+P6AJEUGlezTTuQz1lxzaSQEUyKtT2/uDITXldEEZgmhE9fChHEE93jf7aqFX6zlv0sfdmEfbAA4jGdgMp7zsJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRNjMJrt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRNjMJrt"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso9711205e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791350372; x=1791955172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEBGEIuvQXUOhw2qs60K5A3Yyo97btH1M39qmx8g1LA=;
        b=aRNjMJrtflxUUYupJVRTJfoEKEf3YdHH+eiALtZwWZ/Hb/vEICmBhBs08MFbRwJ2V8
         /dE0l5gaJYY8tveSU8KDvECtl7cKjLxF26xz5xw4TACWJAmQ7LbAD4DUlrZEixPn/j1s
         tDNekUogp9ezbD/n+a97/TsNyYOGOaY/5DsL1/TO5u3/aK3Aoys6ergP6rI/cVK+MCPM
         ak6pf+bAsiWXIDzRtVwu4MN9gfleq/Y4M96wWOZvpXy1K/kK0f2oWWut+/1PdVD07F1F
         OeutOZcOH1ZteY6SOruuyupto42Jk3/u6GpLZ02zcFZzs31m64XvVA+wrmnO4TZf/1eg
         MXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791350372; x=1791955172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pEBGEIuvQXUOhw2qs60K5A3Yyo97btH1M39qmx8g1LA=;
        b=gLnSD1xZRRXEupSZQyze4icHUBHIXuYHcBZUzklJZ6Rpj6pRS7WtSJ+cOwovaVF5pL
         WnLs+6wyrPoR+il86Sm9cGuZe6GrtneNjOv9fr5run5QiUJlIqIZVVGHNJi/xfuTm8BV
         D2LUURBIwfgeQIA2Gq0B6f8vucpBzNSMCl1G0HhBHJJbcPYqrJuwz+jX2HbhpMTq98Eh
         0TKbQN5NFDKmmkfuWOGckmzKaWkU+6sGc0o2XDdqXob3XVmNEIMk8mxDDnyDpJoVy7Fh
         nnTODohLF4e0dPQTRNAgF6Guxo/DDul8ZFHHivokHLETNvElF8pa7b+zYpnhGMgbWql9
         v++g==
X-Forwarded-Encrypted: i=1; AKwUvBwkFsV3VIw8ctQXZub90QczkNAGBcM2L9KaGqojPW72P9oawLVlGS422fwOL0t6orXnInHAL5yjc938IKs=@vger.kernel.org
X-Gm-Message-State: AFuF++nnzjsmMA4ru0erC7JpsgKKSzjiz+o54cBqNEvp1To4CGuO0WOD
	s4VgRfahiV8sJyvjic0mNRm5BzuVs/eEOG8eI2TKyvXQeH/zSwCbWKm0
X-Gm-Gg: AYBFou1ggZZqwcYLb8JzcGclejPc8ggUiLLvjKY01q7NblSkPKL6UgkeX7xcQm6ubBk
	/vQYSLq4O4IrMHPfGlCJYXRi2IraBEcTVEcBaYA0zIW3xDyeb9RuFRy1CX2wKj24WtC5z5/OElJ
	+fGqFGEOeai/dgeBioW9RuO8Rmq94JVAjLiTffjBNpkqJ+yz0sFg/CnoYMMdmnvYDYxIULJoifz
	53Mm+9LWjZjQEJ5WpFxKiM39LZCmeC04GEda4hZeck/hBd1OW7Dn/8D8Inz5JxhSNvRsLEJhsVY
	DXUlRGlhg3qdcmOgDzE+2dZMorV4phZGtIKRxpFvafNs2DsMIb58s7rGnbUeOyypTsnd84Do6RW
	rTPJ/DYvM6ATOHUz7VzsxXdQm3sKYyr57S/6pL5kO5ffdlJ+3TZeR5OB7RFUMOWI3CLEfu8ysz8
	VbmjqlR0smFRkTinfU74LAn/Nyg1DDpPm6ok5Ez/X0zr42amktPTUTT8TOq2AnvRsZKXGqrhazJ
	m7JDBSa/DHDhqF6d/fMUzP3jhgR+CXtGpeXTUFGrmNbxmTrNpYkgVDbedqXxFScNQRJyn3UEtqX
	p3ZukHa6D/yT9UpNJuKtONb/gw74fsCT82C4swxuU5bs/1xWEt3ws0VgdYXYn1oaGdt1th4nhDp
	zYuJaZ7c=
X-Received: by 2002:a05:600c:8105:b0:4a0:20c7:6d4c with SMTP id 5b1f17b1804b1-4a180085f90mr13193475e9.0.1791350371849;
        Tue, 06 Oct 2026 22:19:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a1e1-2201-60f4-32e0-4d59-5772.310.pool.telefonica.de. [2a02:3100:a1e1:2201:60f4:32e0:4d59:5772])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178a175aesm156822265e9.2.2026.10.06.22.19.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 22:19:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	sashiko-bot@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFT 3/5] drm/msm: Extract out map/unmap helpers
Date: Wed,  7 Oct 2026 07:19:24 +0200
Message-Id: <20261007051924.39963-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261006131920.6870D1F000FF@smtp.kernel.org>
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com> <20261006131000.81501-4-robin.clark@oss.qualcomm.com> <20261006131920.6870D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Does this error path miss an IOTLB flush?

Yes. msm_iommu_pagetable_unmap() called iommu_flush_iotlb_all() after
rollback. __do_map() now calls __do_unmap() directly and loses that
flush.

An arm64 QEMU/SMMUv3 test:

- mapped one 4 KiB page,
- hit -EEXIST on the second page, and
- verified that rollback removed the first PTE.

No stale translation was observed because the device had not accessed
the mapping. This tested the low-level IOMMU sequence, not the MSM driver
or Qualcomm hardware.

Restoring iommu_flush_iotlb_all() on this error path preserves the old
behavior.

Karl
