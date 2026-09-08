Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18EB566C5E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882331; cv=none; b=YleajlGd6pgiU9yyCtiW+lg3IKSVPwHJYcVriM6+a3SSbOrUgG3DUSkEpGNiCVfKJgR/TOnn7UrBYqXuoi9mAXgZ+8r8GKoTjYRboQdsD20Ck797mQLEyMYs28hdcmOIIl1eeUOzfSZO6ojpteFVnDqnYLilAYouSJ2TsbivtS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882331; c=relaxed/simple;
	bh=QXArjv15FVZH9C/nOWnq4DoBdtC3m4aUZ2D+uGnCtMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j0ERqmp/Dc51DtG9ujbMk6Z/BvDobyLj0fSu6RaIh6bbRPrtaKEe7/89xAW7m2HPPctAscbb2yhjS3B5maFC47Ae9ossPtVOFg6W/j3AsoUk/UKnaM32et732R//2ROe/7RCjxwSsrRzD7/7vmxX0R1rqIhrBOi5ZrbvoMO59Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgZ57w2e; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgZ57w2e"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90ef16ca83eso876606d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788882328; x=1789487128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gaNUihdkxM1CZL4kcfrTQvejs/c08bSRJ/ek0fixoao=;
        b=DgZ57w2eMqwBiK+/KAzjKuj3l6X2xWE5WAeAKZVbEHajWfG4ajuJHiz3bq0Ajw6Gt4
         qi2eA5Tp8aHRkxcgIulPHMZC7ZRI5fg6TurR1MryuXok6e4st/u5w8T2r24E+GfOtvD2
         V1jTq2phKFJannX0v1JD/U0d+rerF1ZsoGOwQG1rpH0bD1Q1rbEz1ur2u1ksCgiNhX2J
         SXWHkXUVmGF4gZj1oU95Yx9HPhXKgzWoW3jddJRRzkmEmr2K6nK1LaeIzFRuAzrcdXt+
         LTaSyNpxCzNsBwm1DruE0QeSnSEKQqU/Kysc1rgCdx8anIFu1fgIDrFCfrJIBchTRDcQ
         pJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882328; x=1789487128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gaNUihdkxM1CZL4kcfrTQvejs/c08bSRJ/ek0fixoao=;
        b=T5OV4JSku6nS1xUFYYd6n9ybJY8jEEh3QbgNS3/3lsyddprquTh+602cNxY2cJBJYE
         fAwivjNdcShm2CnqLwb/VOzUYOzTbsMMljp0Q5zHRRMoGrzx4+J5Ou50ztCLS62RdGUt
         OGCpl4x0GKSE4YACchN9OMcEX/pnWkMaPKk2k9BUbqtMiGQZWQgg6yXKeoeaW98XQBtu
         gEBxqtWqnL6/SRyM14xSPefDEoYWOhsVvHlMZsb7/XACiBb0W4+bZHfDFWmfaFlb1684
         M/TmGKnYVWZTQrTLOcvEKIEUmmKtsA4okEKFfnB2R5yoRlJKjSZxWluQAPfeipVopdTO
         b1AA==
X-Forwarded-Encrypted: i=1; AKwUvBz6oWB9i5YLqZWqArr7+5eveYEBbjCqptDBCIVPWGa5cIlSyzUpCi9J7d0fm/EYhmUHyuX1cSFTL0D2V+c=@vger.kernel.org
X-Gm-Message-State: AFuF++kxCOAeb2Fsl/PsweoIIaSebbEwBbbbJnjxQQb5XzBgDN5g/Jc/
	KfKWY7T01DrsBxw/s5blApTyJ3eBt8EL7ww2WWC7X3KIdADO4/h8FSPaIky39TK/rsY=
X-Gm-Gg: AYBFou3VVOgCGW4wawR73CyKLpdGmgZJJ3n1voBMStiKERUp0ooiMoRrSf2gFfiyiKi
	+U/3K7neITKdX3TzOgSQ9QHlNZDMC987XwuF6Q2TDbzBqLdd73bS6NHUT0o+mpwi0ZR9oP7oCkX
	0m8tUJsk/F1ovX0t9KKQImdTMVQpB3VzSbEjNY8JNsSNY/oG7N9OdD6eaAyjEyfnNGdQhImiTyW
	oK4Y5eeVLbNWpeVuTtbXiYtg1w0GD6cDkwPJVRaFc3BQ6hKqiWtKzY09Ht7HVp53BTKsisyQmBB
	Tp+hqw/mPU7XgNLJMn4LGji52VYwgiLOrrs7W4S7/RIiNl95eMLMxzHIrhJFMAGHwjDuMv3zdSi
	5+K4cSgaPf7L+ujsZyNeNcn10eIei8H4kWBPN1r+R+/Im0YessOqiNaT3pbnatSgVvuua8vo/nt
	B5gdybIaAmGeX53Hu7DJCdMjNo9poGdQDYAz2XjTakLgun4Rt3c9vGn9fwQSiQHbVVruUuD0ja6
	o+Ci0clvQgGEtvL6h2B9gRrl/pgd3iPRcEGL9r2lUZ733X5Cohze/I7bKHlOvs=
X-Received: by 2002:a05:6214:4b03:b0:910:3451:5801 with SMTP id 6a1803df08f44-9106b42808bmr4290496d6.31.1788882328252;
        Tue, 08 Sep 2026 08:45:28 -0700 (PDT)
Received: from Ammar-PC-Fedora.tail72f32.ts.net ([2600:1702:7bd1:29f:8000::1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104049d30asm120779386d6.0.2026.09.08.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:45:28 -0700 (PDT)
From: Ammar Ratnani <ammrat13@gmail.com>
To: linux-rdma@vger.kernel.org
Cc: Ammar Ratnani <ammrat13@gmail.com>,
	Ammar Ratnani <aratnani@nvidia.com>,
	Kechen Lu <kechenl@nvidia.com>,
	Mithun Maragiri <mmaragiri@nvidia.com>,
	linux-kernel@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Paulo Alcantara <pc@manguebit.org>,
	Stefan Metzmacher <metze@samba.org>,
	Tom Talpey <tom@talpey.com>,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 2/2] infiniband: trace force disconnections
Date: Tue,  8 Sep 2026 08:44:27 -0700
Message-ID: <20260908154454.10966-3-ammrat13@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908154454.10966-1-ammrat13@gmail.com>
References: <20260908154454.10966-1-ammrat13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When we failed to send both a DREQ and a DREP, we have to infer that by
noting the absence of the `sent_dreq` and `sent_drep` trace events. It
would be better if we could see this case by the presence of a trace
event instead. Implement that.

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>
Cc: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-rdma@vger.kernel.org
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ammar Ratnani <ammrat13@gmail.com>
---
 drivers/infiniband/core/cma.c       | 2 ++
 drivers/infiniband/core/cma_trace.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
index 1f1a8b4e160a..c4eab48a4a9f 100644
--- a/drivers/infiniband/core/cma.c
+++ b/drivers/infiniband/core/cma.c
@@ -4834,6 +4834,8 @@ static int cma_force_disconnect(struct rdma_id_private *id_priv)
 {
 	struct cma_work *work;
 
+	trace_cm_force_disconnect(id_priv);
+
 	work = kzalloc_obj(*work);
 	if (!work)
 		return -ENOMEM;
diff --git a/drivers/infiniband/core/cma_trace.h b/drivers/infiniband/core/cma_trace.h
index 3456d5f3aa47..3d05d8e80856 100644
--- a/drivers/infiniband/core/cma_trace.h
+++ b/drivers/infiniband/core/cma_trace.h
@@ -61,6 +61,7 @@ DEFINE_CMA_FSM_EVENT(send_sidr_rep);
 DEFINE_CMA_FSM_EVENT(disconnect);
 DEFINE_CMA_FSM_EVENT(sent_drep);
 DEFINE_CMA_FSM_EVENT(sent_dreq);
+DEFINE_CMA_FSM_EVENT(force_disconnect);
 DEFINE_CMA_FSM_EVENT(id_destroy);
 
 TRACE_EVENT(cm_id_attach,
-- 
2.55.0

