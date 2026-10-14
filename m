Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7FB240611
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973976; cv=none; b=OCjW8D7oo4CX5KOvrKTCCngClFoeoy4wAhkNQPmrAzPmFQzUCXzZ2T3lYpoPRjWXJFxrp3YzYLV2bSKMMvUdr6HXVELkY6wRuqk/DWFrziT6P1zU5IBuOUm7XeV1OZ1+Ckya2Adyb+REl572+JFRqoROZSpNXW4mnson0KIFNc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973976; c=relaxed/simple;
	bh=Jznyf80dGgdWTP/0QEAd4JX4pzVoDUuSYrH1N/VLUdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzUAAxfzi1vkVq0Ywl64LNB7Dw8FlR9bomHHBgNLz8ndpMxF3nxuZMBR2SpIA5f92YJIzpOYoryX54oeUj+abqBqy5BgxWZflx5jhNa931fSFtTimoRav+YZRsKgmTWYDG2+4sgQSYBnnbMu0xzIgKSx/h7rlRlKgDGXne1Im3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhCW/uO2; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhCW/uO2"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso3263056eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973974; x=1792578774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bYRfGH6x4ZC6itbOwadHAvueNYUJVYtsL/kjvOmVY14=;
        b=mhCW/uO2zSpPCyDq97NODBGNlHYh300+niNZkfwSWu252SF7YlWrY9egaUIm1/DJZp
         8PnIbqw1WvyVR4ss+w7cjPY50Gwd17VUiaw7GgOYfwQS/qrj8eSj6DrNrY3kOJoaDxB7
         vJn/U120KtM18Op0wEMhxYhH4eFbQ4/tITAVuChxz/nJW8XvAwZSQjDFEWOvvUJEy8ok
         7skELZpvgDsoGhGUdNbsqA0bhfVyg6jsZWm/atfJRFI43al7dNLzYaacS0TzBplCTt15
         R4CgF17FgkrzV5pM4zDkUmNm6HVOYMgUGO5If1dV4csbrzAUOCKKTGVbgDMfyD4ARCeP
         PtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973974; x=1792578774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bYRfGH6x4ZC6itbOwadHAvueNYUJVYtsL/kjvOmVY14=;
        b=X7js1cKNrMbHTvAmtCQnVHb4XceMlAQKkpKQV1v0EdSgxFzZ9vPepk10qtIP/CoRgq
         l8Jqil2bqAeHDk6Fjc3cP4JE6JL8FElGM+BxK+MVQzcWvMo0oxN1BrYESUaHBWVPshj1
         aXg8ZD7PfeZHHxQok/a8Qa9/5ZEn0AGoT1EgPuQdxFVaJOht8M0R633SEUusJr4HccBR
         XabsM6IpFbqGvimO9FGgtKD7slhXlgYpVowaj0WI0F6kaKafxOKAC/ALmLInKborQTog
         TM53wzMefi+aAprwqrEbCSZvI/K8jFgsVJUvfFwmue3JMYQ1tmvHb0zVJTCKbyxMS1n3
         aDKA==
X-Gm-Message-State: AFq9FYLC/Oz5TKQXnVH6Vq2mS0n3Y8XOmS7mxriBhre9y1ERK4GF/DDR
	yhJ6fEH8JT8aTK3We960DZ0Hce1EiU6kGvP5olofOVabVriryxiG7Kxm
X-Gm-Gg: AYBFou1CZu1VpM1SBTo9C9N5dyrWVS5gb6cAA0g9MTYWaabLbWS3fUBN6h1OKgU8L54
	zY06uKCdk9GfpbSeTJgabdnEszduZwA64Isg+7ZveEzbVlYH+4d2sK8rPa+id3uojFqU4m6VSP2
	Hrw9ZHJeSBUSWmZE6oZ8QVcc8GC8Gsm5kbrGMT6oxqOgZq4M5h7OwZ3lnCHlYeiMCzwj5CkParH
	wG6ELbqQ+WqaMvenVEeAlkc2Lxe/Z8S0UIGtyBtBCKrSYf1V/3vcycPsFn6D6DzUUCCH7w5w/Vn
	DNcP5W1N9mucTjwfDPQW0BBRn9Xm6wq8MuZEZKkCruoBZcnTo2wYTJZjsMP6O+SNOHBtQ9F1jsY
	3iFmYnIAh6ppO/dEjLrup9fUXq3b4H/ruZdZq4XTivhUDa8IWA183bl1kJqBAUjzwlB8qzkyBvy
	ehHZsaFW9MpGINqgozQgJKjXeZI21av2t5XCXm7+PoIWouQZGdj8U2pmasP+QMYHsJieXawF4=
X-Received: by 2002:a05:7300:8d:b0:35c:89df:812e with SMTP id 5a478bee46e88-35c89df8359mr6439561eec.34.1791973974193;
        Wed, 14 Oct 2026 03:32:54 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm42371533eec.15.2026.10.14.03.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:32:53 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH v2 0/2] remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
Date: Wed, 14 Oct 2026 16:02:39 +0530
Message-ID: <20261014103241.3847-1-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous version of the patch had a new header ti_sci_dev.h,
that mirrors ti_sci_proc.h in terms of the struct decl and
its helper function structure, with the goal of abstracting
all ti_sci_handle's members like ti_sci_dev_ops from being
invoked directly in the driver code.

Lore link to the v1 patch:
https://lore.kernel.org/all/20260922191453.324983-1-sid9.karanam@gmail.com/

Upon discussing in the original patch thread, it seemed
better to combine ti_sci_proc.h and ti_sci_dev.h's structs
and merge all their helpers into a single header. That is
what ti_sci_ctrl.h aims to do: It has the union of tsd
(ti_sci_dev) and tsp (ti_sci_proc) and both their helper
functions are prefixed with ti_sci_ctrl_dev and
ti_sci_ctrl_proc respectively.

The goal of the patch (v2) is to maintain a single source of origin
for all ti_sci_dev/proc_ops call sites. Any stray calls
to dev_ops/proc_ops function pointer members in driver code should
eventually be abstracted through this header (ti_sci_ctrl.h).

In the future we can try to abstract tsd's dev_ops even further
through pm_runtime, but there are some roadblocks that
I am unaware of, so that warranties a different patch.

Siddharth Karanam (2):
  remoteproc: Add ti_sci_dev_ops abstraction
  remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction

 drivers/remoteproc/ti_k3_common.c         |  21 +--
 drivers/remoteproc/ti_k3_common.h         |   6 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  26 ++--
 drivers/remoteproc/ti_k3_m4_remoteproc.c  |  23 ++-
 drivers/remoteproc/ti_k3_r5_remoteproc.c  |  66 +++-----
 drivers/remoteproc/ti_sci_ctrl.h          | 177 ++++++++++++++++++++++
 drivers/remoteproc/ti_sci_proc.h          | 130 ----------------
 7 files changed, 231 insertions(+), 218 deletions(-)
 create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
 delete mode 100644 drivers/remoteproc/ti_sci_proc.h

-- 
2.55.0

