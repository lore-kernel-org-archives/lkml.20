Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090714F3920
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737391; cv=none; b=mt7RQAEf7iPxDVarOobEm66hJhlHoQmxdBIXcojoQCckl+Km6UR1KTyNM+AR+jDFy6yL3xaUllu3cQTB06h2FZxUswMnFCRamvebCd/+MLwNvPo816ioPjVS5PegeKXCOkxuT6+FDyNMEazY0QDOxB3whYNF1z07Y3fGdy0TMo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737391; c=relaxed/simple;
	bh=AziE3Yj7NTzqiNMtlJscqQncplQWikmCngG3C9eD4oU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N38ZvyjgBumjyEKfrnw1dnvhr6/lw+GOOthxE3MQqkaBITFK+rRyXCSBOgUWwF8o4gw016AY5shVcdFTsmuJNnWrmw/KGdOXO9bYwl7Q3/zLl4NAMhZarqQu/cu4/FARlm4ohp+89PWZtWllRI622NNUKd84sh989iKoNuoCBuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku1ruZox; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ku1ruZox"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso411326f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737386; x=1790342186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWU/Z4Cv9J6Gjygd5g2E8XPN0BiQe/Sbx9hToRJGZ3A=;
        b=ku1ruZox+vbqHzEVK3Dw4aYrn8v2mGEmjQDn2D32uHP9qvvnHKH3RtsLza9iCBtYES
         giUyMzx6lqddELSpbclBFB3iupTd6lIquoc73iUQM2zsX4vVKPwi/pHuLpupPYbNUJps
         Ro3FrmSfEhdZJ94nlsYdPd212sN5K6XWR/KjnB59ihvOow0VLU5rxY8TZBZHy+yV2hzK
         YBhmw4oYZa0H0PT1Ssf8xyk9STeMxDnyWL+DEjvcL+Ekya484vq151JxK9iA0RkpkINh
         D6kNN2sJ4EBA73qLBrh9lKoiIcLuu4Ibw9vQAFG1DJ5H1+oCR1Dge9Tz1sq63VngthxQ
         EVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737386; x=1790342186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWU/Z4Cv9J6Gjygd5g2E8XPN0BiQe/Sbx9hToRJGZ3A=;
        b=vdczVXFkfyXtewS95wNluOb+GnuhwJe7xX7AK/bIntF4pgweHIOSjmeHIiKiygGaai
         adjq/FjjXtN1C25L7Lg+Mivqtty14RETiTH3QUhp1xsMV1xx/yblPQ0V7VYgRmj3QeKq
         COR48UbUw/4WaZmP4TMo0W0r1ff3mQDtsYe0LSGY7VTyr1rxV+KG2lqsiwpJ1BRdTv/3
         Y21tEoWyrep51113qnGjIWQqmeM5fpKQlcQFN/xaUVwD11/HNKNMnqvYNGirl4UOluZY
         AwQ2UrVR7qco3fd5Oaze6OHnGCvh/bDQUNdwZx/E7CHEcZXVdxC52wHIKii8NSOXaFqn
         Wg7g==
X-Forwarded-Encrypted: i=1; AKwUvBzPVnrdrXF6VWH7YrTnJwBMDvhdfjxHdPm5yGHeSX4iRifIiunaZBqkdJaeu9H80N47c0fbaAmIyWoc97M=@vger.kernel.org
X-Gm-Message-State: AFuF++ko8oWICizfNZa91BQ1b6bI9/+Xo0Tv88qzzEaxUyenbRX/jfJK
	BAx6vUueYDklPNwYnXj8OPVuktLclhlnU9YSPgrmiRqQOzKv/3aYcY57
X-Gm-Gg: AYBFou2K456UBt89EK9Lxgdy77YuaMUpvXZqZXL4StZa1oODURZqsWpIJKTKhnmlGrk
	H9KFuxm+sY9T9VirAa55QeknDjoa7gEAMiF7ViprVUybKihVGSyqr5wXjLyNxrUWCCl9+eWtoCA
	JCURTViwbx+P3Jtz0l8VcU04t0g8sSByvm1Bexw9fvHN4gnu5D5sHSvbD5Xn4Mn2syR88kauQgl
	V1e3SGm/3mK7NYqB/lUxz8gALYvJs1+Ct8bugE4eFJSb+sDESbOGNjpQXKBP3fVWFQU83cq2Xov
	W14L6huB1CFtn+Ryfdaq6TL9VnxDfEm4M/4J14lUs/rIEryO9lebYj58exM1PsEfZEBtzKKZNM6
	xJmLtB8gzDEKywBFKZlQF/yhEqNOFB4T57X0r8+3m9FLNNY/BDnb/6eqfgGHctvm0yeiC0h7oS9
	9NIaSREWustTIiaZTRzXWCJkJ2pRSgNic1yeTXsOU/PmdxdtpINFai5M6yCpJnoAllNGfaf+E9w
	UHyR6UeceI=
X-Received: by 2002:adf:e19a:0:b0:487:35d:cb0f with SMTP id ffacd0b85a97d-4871e216fc4mr3566538f8f.14.1789737386045;
        Fri, 18 Sep 2026 06:16:26 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.209.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200829e1sm4487572f8f.34.2026.09.18.06.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:16:25 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Karol Herbst <kherbst@redhat.com>
Subject: [PATCH v3 3/4] drm/nouveau/device: don't use the pstate cursor after the loop
Date: Fri, 18 Sep 2026 15:16:19 +0200
Message-ID: <20260918131620.405133-4-postadelmaga@gmail.com>
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

nvkm_control_mthd_pstate_attr() looks up the pstate at the index supplied
by userspace by walking clk->states, and then keeps using the
list_for_each_entry cursor after the loop.  This is not triggerable today:
the function already rejects args->v0.state >= clk->state_nr before the
loop, and clk->state_nr is kept in sync with the number of entries on
clk->states, so the lookup always breaks on a real entry.

Should the loop ever run to completion, the cursor would point at the list
head rather than at a pstate, and the pstate->base.domain[] read and the
walk of pstate->list that follow would read past it.  Rather than leave
that trap in place, track whether the entry was found and return -EINVAL if
it was not, like the other lookup failures in this function.

No functional change.

Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
index f2e9a0626..28702741a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
@@ -74,6 +74,7 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
 	const struct nvkm_domain *domain;
 	struct nvkm_pstate *pstate;
 	struct nvkm_cstate *cstate;
+	bool found = false;
 	int i = 0, j = -1;
 	u32 lo, hi;
 	int ret = -ENOSYS;
@@ -104,10 +105,15 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
 
 	if (args->v0.state != NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT) {
 		list_for_each_entry(pstate, &clk->states, head) {
-			if (i++ == args->v0.state)
+			if (i++ == args->v0.state) {
+				found = true;
 				break;
+			}
 		}
 
+		if (!found)
+			return -EINVAL;
+
 		lo = pstate->base.domain[domain->name];
 		hi = lo;
 		list_for_each_entry(cstate, &pstate->list, head) {
-- 
2.55.0

