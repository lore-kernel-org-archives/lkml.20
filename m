Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792569472;
	b=igNlQwAsJjw6psqoUPVBbyB6nKOoF9NcFpQU342C/zn+SDACDoehcTI27Nm9t+ha4jTF
	 1w0s3RKqsN7fbCFsFK8J20TlemXiYEYOlbEKCb1AIeLT8xjqFctvBMPwpkDowypvXJLrB
	 Gsg2ALqK+8Vhkj8nfGDjaLFHP+eTBPidjahli8L1Tvax49eMazrOIZWCO9FV/xkUFTadU
	 6QO1BuQmA53qCKX0/0HOfDQIkmTOkDGzkxYcorvkRjkxto01hanSKPI5LM3Nedx1Qu398
	 EnEX5E0ONGBizAGkIiXJmNlUwr5nded9DAhCOcZnBC42hb2f5FZGHB1L70Hu33rHxEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=b/9FPAXB5OMzTip3IOGW9at4j0vGcQAizKqkhvnReoM=;
	b=Wa/NR3m2kt49bjwehP2wNG5rk/8xkMaEpIHF2SIsEk4extj24QNlr433qjT3dVOxjNUR
	 YG0tdCMsv1I1t+5Ywmpdm0OskIS4gGpVC+6Imenep/z0u2zWkyC5RvFP9tJbctnteLskg
	 m5mhIbRP3I8yf/X0eoalpFK/mljNq5Z5jKTcWzahiEJH+qItFy2tKFpIol/wGzREfO/5h
	 vnQ8Dse2tOgUcVENqtBwlijMbaQuuSYkAG6esol/VdZLE/GH7iwRsyx/5vCJFhv9lre37
	 KzQTUFt394tTfouX5EXI2YLGfovjJ/iv+ujvq9YMNW5kMuT3g3kiwT4WfftsGMfs5Dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starlabs.systems;
	spf=pass smtp.mailfrom=starlabs.systems;
	dkim=pass header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=td93g8oa;
	arc=fail smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0460B606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0460B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=td93g8oa
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-676804a3a22so364569d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792569470; cv=none;
        d=google.com; s=arc-20260327;
        b=GC+6PLc6PqdIEXVA8EFziJkVPBza/1ADqnfHyIVwlr2hEphR9abcRBbjXiWS5MysWk
         daU5ykfo8ttgtjgl6ykDEToNmp4l3ihORknJT2/QX13JzgaHiyi8fjMuQrkqogn/NQIy
         Zr5OCn36fg3j4z1zlW2pSFF+7+MtYAYz5hceGpzgOJ7MTRSUCWWi0LRGZ8UWfFtVjuez
         HMBAP+E413LznpcBCJBIMegCZtahhO8pK2RtSLfLbOoNuZeUwnguofTmzJOgJ8+yVh6k
         JFNm0hrnwIC2Dydp/x4kCRLnlfVIbqthKv30zu4D8aoeFsJvFE9CPotHLC6Oy9vJTCxW
         yjuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=b/9FPAXB5OMzTip3IOGW9at4j0vGcQAizKqkhvnReoM=;
        fh=lUAPsshBu2GHScbeJh+HzCj5KfGIDDszzKL9GJdcY0I=;
        b=PB1sgWBr5LaCCFEcJy8Fnk6ySXhFcaIhDaO08cmGoPfhFjcLfE/OTCLvxgqduZ5iQn
         dbnhKw56eI7Ahv0hHIpo5ZCVKxQ5fkBUSnWlV5Hiu/Gy/rRYpQlz4U743oLVcAyuhFFW
         tJn7XbQcSv6pNE4Jc0JgCLSMjVWA/tPpUmscYB+0qlwMT1dhEvdB4I1VKetESHi/NDg3
         oRADRhHcCHgCL7aIvmqFHlwrF/yllw41ne5kSdhEqdY17q6HPUS/NVZ63TZ/GP/ndn7x
         +BDR284nU3ftv3rLHnaevv6dBilbjwFbAzNCtw8awL9PopfWZq8rQ+ckXFBMqrsaPunp
         xTfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1792569470; x=1793174270; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b/9FPAXB5OMzTip3IOGW9at4j0vGcQAizKqkhvnReoM=;
        b=td93g8oaOLkAmMnhvBrBj4oecBOBJZE9PR27DHRwxLzMZQ9EPrMyr3j0GRnZpEuk/U
         9ddq5V9ri19AL1QopVvZtWDEQ2oy6RdqgTfbnfo2kohUYEuYd3F7vYq6rx75R2GAC1Bc
         5bA9E3sW70TP9mdJm9/V5fhFLcW+of+/3PfvcyxdXY5PjreuupmItCpfC6uVqTuolicz
         ZxDjhBxIJrdvScRnI6mr4puKdrJ53YFKIlGZLweb6rRLg/oWMbBY+fl4Yq2mBIRbO8Tb
         tvrK769SO9lrVATaNNG8Xxt07Dp1T4+jQJ5fzeGHkigGXD8mTouXhJpIr/8fzpCWprG6
         VrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569470; x=1793174270;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b/9FPAXB5OMzTip3IOGW9at4j0vGcQAizKqkhvnReoM=;
        b=FjEZiui/zxMNNGE+YKVgcods8xcOVyB67FuUwZ8o/+3SFBJdV+QJLzxQ9oIzO8cJnh
         yzDHz6TvRIPSX5AQZKnwjWCAm6HOm+FTLxs+P+nRf/mUNoO4+IYGI78iLUllTTmV/ziJ
         VnjPPzCbhcFxO/p9jTAyPZ1dHbmCVtIVGEAx5EdiVKAuRapw71vVxiSEd12NCGBloUOh
         +AupmJc6NSkPGmb0ai52SR05ZzobXy2Z7RjY7FHZSZr4dVMi7rakh8Pelsru8FSz8Exj
         vyXSSmKHQ3HdwCR/2GMYhRjerpT90qN1NvD4drwP4bM4gQiJBdxZLz1DjWVsxn02UOPG
         w0YA==
X-Forwarded-Encrypted: i=1; AKwUvBw+b8v9J+YbkDLVpXky0NSIndcLaFxWIel8rrUOzw0EC171Kh91J2GHtLaAI/mf05w6ZrJhywGWBMlUPs4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOcl7MuXattIyMY2OWBMTircPjS18wNqvPBWHwHvIZvPGr68bS
	i4nbMuls6gDfdqc8wWQUvUJC7ZucumCiDsUoRgufRkrG+iM77ja2baiHYrdQUT/oz45wuF49VV6
	NC9ZAdGKQmeqAdKDc9zXT8QqsQ3Cc78jgiXkBpF8p
X-Gm-Gg: AYBFou2tCOcSQoCeL/iuHldwOrgIumrO2x1YfxVYUVEnmz21mkym0S3yrGbDBB08foN
	jrRYzZIEo8Q00Fdj8eaUj6567w7P1w39CYqQBKdHRL9XtMCBwBUFGzet+CsHWj52wO/tf0aQ1OW
	YFbFXWJaR+74O81/5MCgtbHJWS1RIYFfgOfI7NMbTjqjUnjuIZHKzNzbQdbhiio8AQwIyMVfC93
	Rio4Nspxk/Xu0stME+wR9fn4EEiMzLX2JqADNBHvc+c762Q9B3RPor5p1v7GZOcp3mgIzLVmQjE
	eB3Dt4rVrEdHsKOuh5tXfFvuIh+4rugnuYPqsB2vHiF78cQWhiL+udlzdrak/K0wD/TtXNoO9/U
	+nzk1UwU29mMS8pG25/bfua0+UPhOsblrMBGLVScD8QjqV11hDW91v9CmRwY88rloMJ8=
X-Received: by 2002:a05:690e:e8b:b0:677:c6f6:8cac with SMTP id
 956f58d0204a3-67a0dded6d0mr669334d50.0.1792569469623; Wed, 21 Oct 2026
 00:57:49 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 21 Oct 2026 07:57:49 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 21 Oct 2026 07:57:49 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: sean@starlabs.systems
Date: Wed, 21 Oct 2026 07:57:49 +0000
X-Gm-Features: AclHuK9CuFn6XAC-EPzrIm8Q5Qt2Oj5aACWiFtIwVz9D5V0ryk4CO-CPJLqqTfU
Message-ID: <CABtds-16eUH6ah3Rr9R=N2605TPdFgDekM5oXVeWqGcmYfWqag@mail.gmail.com>
Subject: [PATCH] firmware: coreboot: Fix CFR error-pointer handling warning
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	kernel test robot <lkp@intel.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From 4e74bf1ccc0f61b4712f688eab66a7750f693243 Mon Sep 17 00:00:00 2001
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 21 Oct 2026 08:55:54 +0100
Subject: [PATCH] firmware: coreboot: Fix CFR error-pointer handling warning

The scoped kfree cleanup already ignores error pointers, so passing the
pointer through no_free_ptr() before PTR_ERR() is unnecessary. It also
makes the IS_ERR/PTR_ERR expressions appear inconsistent to Coccinelle.

Return PTR_ERR() directly. The scoped cleanup still leaves error pointers
untouched while freeing successful allocations on later returns.

Fixes: f2e05ce9763f ("firmware: coreboot: Add CFR firmware attributes driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610210637.LiJ3U0ob-lkp@intel.com/
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/firmware/coreboot/coreboot-cfr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/coreboot/coreboot-cfr.c
b/drivers/firmware/coreboot/coreboot-cfr.c
index 2d9ea5d213d8..61d5191b5447 100644
--- a/drivers/firmware/coreboot/coreboot-cfr.c
+++ b/drivers/firmware/coreboot/coreboot-cfr.c
@@ -341,7 +341,7 @@ static int coreboot_cfr_read_value(const struct
coreboot_cfr_setting *setting,
 	int ret;

 	if (IS_ERR(efi_name))
-		return PTR_ERR(no_free_ptr(efi_name));
+		return PTR_ERR(efi_name);

 	ret = efivar_lock();
 	if (ret)
-- 
2.53.0
