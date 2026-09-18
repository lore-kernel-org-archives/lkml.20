Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308AB4F7CD9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737392; cv=none; b=t9VneThH4+pfSeXxfIsj0izCTXzN9KxLlUYACP1e0XjKXMD9pbZyDw9Rb9W/22MKRwRhiIbGKIFfwey/9IFDnKJlbNhrFarVIsXyaRpgBbbyrRSkFYThY0hJ6AMgjukKi1PZqWPBasz45WlRzNQyfmqKlIxLwBqJiOIvEiHMEmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737392; c=relaxed/simple;
	bh=DbdKlCa2odn2Uw/XyYQhVOEIt2OFS2NRzxTNkQOWfyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqBwyIiPlVQUJOkmAvUoFVKUAtTDm3tlFtV7CwTAALyFDi3hGzOG1UXfBfN4YiXSUwPl8GpwuQ6Lsp+Tus4VQKHwEP0p8ZHzaigWGR7POoWG5GMf7oAs0brQSsLxGOjw2smrWtN3RlJG9AsyUqpmqoUP/Dafyh6m0plmngbgLVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmDYSvW7; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmDYSvW7"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so409812f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737388; x=1790342188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQCO1lrXpdk3Cfzx3wIoTrVcbxEHs1oQDclhX0KurhE=;
        b=lmDYSvW7LItvd+GhnbcwDTm75JaoL3BJzoDBuviZFTAwTExnxTX9sBs5eCutXuuYyn
         utbiawREmlp8iRGe6pDVltJnlHpz3qXvSR2y7QAD97cX96fMT1cHTxHhSyh/4uK9exg9
         ebaI44/YQRdAOO16zZojDpWId0wpl+4FzrxlJlFQTgXMoLqw9M1wTskhVIby9ft4g4xg
         ehtsPuDrfsqi1p/QfRBd6p7iRuPo3x/zd1lVDSUoLBlVyhnzZ7wuWaBwiGes/N6Rsky8
         BjsSzxYssAsLQM1kVM07PTUu+EsNP+sHUIzRbhw/Mggr2tjuEy19Uo0zH65petgv77iP
         8Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737388; x=1790342188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQCO1lrXpdk3Cfzx3wIoTrVcbxEHs1oQDclhX0KurhE=;
        b=lxO5pZ6iCKBP+vJriqM9q52sBnXlCYR7ffAdL9tjSDPuLOgy45f164Sk1Htn/w29Xh
         k9i6y/Ezj0YNeSNztBzgXr5L3qHHdc7RHqrdXaeOb/v+fZre9jes9z6q1EPHS6+Ua76K
         PVaFtPXAQ5Wj6gfX0Y9GHzJRoCgm+knRH6XUQqwKRixhNEaOROwJWp/jhUEltHRTDKgM
         4YnUnyW1aAqTHh6Q66zga8M4GXZWntIn8gGeT8n4elOw/BoqOgK7/iUZ0p1w3AP9TMnQ
         EB1J//UleQg1ZIi+xOLDN45DmiDoq1R1zdQC7OLoeBN8Gw6llMJBd5fPm9qCB+8plEZ7
         F8EQ==
X-Forwarded-Encrypted: i=1; AKwUvBzE5OxrgmGdCvrC+8Q0musiJ1EjC+QiECkEiWsPw4kprGlIcG699nYv2GPpNGXOccdf5xzngd/qkOXv8TI=@vger.kernel.org
X-Gm-Message-State: AFuF++kvnce6xckakfmcC2MECrRCnMGLQ8VFGiFwR9yB6FjtEkicxPcu
	M1QpyivVRgIc28D6u4bXqoQ7odZFGSMRAcxIyqZGOG/RmG3kmw8VBGhK
X-Gm-Gg: AYBFou0/VavgRmibjZ4SpyTaxbTQcZ/jlhblKW1sPwL/DDQV25AqpNprRl0KzDzzd1I
	VqmztKsjv4SQjhVtnH5JtQK+l8hzJ9yEw0KJWPEiVfV5SolAQGxgLJiUPiMA1q+lJhYa5fCA4hK
	fBn15Kxo8s6V3g9xkQmzow0TGnM1GeTtlUUqaPllBgVW89a62LMBTOGHmyEhRxaX7rohG24mkK3
	L2VVBf23wE58CXxTM0fCWsWrE9QUJ9hBn8MCo6y4Ldi1yJjB7USyhc8vbJ8BfJF3/MAqSXH3yGX
	U/IO1Dn0scxQvYsJyURZGJUP04iwz8tngQz9STAkj1gkV/aPaDoJGgryAvWcNoTRYS4JynT6vXo
	E/GE7c6EMbzs3EvchXSqlWElW0CXMErRDzNP5vWivSxOVTrMm+vTssHnIpT8VETGwpF5VTJyJB3
	rBuoVm3Cm+ziYZWqVbMtNhuIsgcOcvO7llGdACkGIWlJD3tObdW2KIi33K5sLfwHrdiUqZ/CLmQ
	mMA2sGd48M=
X-Received: by 2002:a05:6000:2312:b0:486:f6dc:52c8 with SMTP id ffacd0b85a97d-4871e269e92mr3590006f8f.37.1789737387367;
        Fri, 18 Sep 2026 06:16:27 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.209.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200829e1sm4487572f8f.34.2026.09.18.06.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:16:26 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Karol Herbst <kherbst@redhat.com>
Subject: [PATCH v3 4/4] drm/nouveau/clk: don't clobber reclock status when restoring volt/fan
Date: Fri, 18 Sep 2026 15:16:20 +0200
Message-ID: <20260918131620.405133-5-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918131620.405133-1-postadelmaga@gmail.com>
References: <20260918131620.405133-1-postadelmaga@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvkm_cstate_prog() reuses 'ret' for the voltage and fan-speed restore
calls it makes after reprogramming the clocks.  Those calls almost always
succeed, so the status of the reclock itself is overwritten and the
function reports success even when clk->func->calc() or clk->func->prog()
failed.  The converse is also true: a successful reclock is reported as an
error if the final restore call fails, even though that failure is only
logged and otherwise ignored.

The only consumer of the return value is the error message in
nvkm_pstate_work(), so in practice a failing reclock is simply never
reported.  Nothing else changes, but a function that returns success on
failure is a trap for the next caller.

Keep the calc/prog status in 'ret' and use a separate local for the
restore calls.

Fixes: 3eca809b3c05 ("drm/nouveau/clk: cosmetic changes")
Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index a43246ae6..1cb83edc7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -199,16 +199,18 @@ nvkm_cstate_prog(struct nvkm_clk *clk, struct nvkm_pstate *pstate, int cstatei)
 	}
 
 	if (volt) {
-		ret = nvkm_volt_set_id(volt, cstate->voltage,
-				       pstate->base.voltage, clk->temp, -1);
-		if (ret && ret != -ENODEV)
-			nvkm_error(subdev, "failed to lower voltage: %d\n", ret);
+		int err = nvkm_volt_set_id(volt, cstate->voltage,
+					   pstate->base.voltage, clk->temp, -1);
+
+		if (err && err != -ENODEV)
+			nvkm_error(subdev, "failed to lower voltage: %d\n", err);
 	}
 
 	if (therm) {
-		ret = nvkm_therm_cstate(therm, pstate->fanspeed, -1);
-		if (ret && ret != -ENODEV)
-			nvkm_error(subdev, "failed to lower fan speed: %d\n", ret);
+		int err = nvkm_therm_cstate(therm, pstate->fanspeed, -1);
+
+		if (err && err != -ENODEV)
+			nvkm_error(subdev, "failed to lower fan speed: %d\n", err);
 	}
 
 	return ret;
-- 
2.55.0

