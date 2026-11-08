Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794121261;
	b=T/1Abtot2fzw4FtquhjbMGSBNR5d8tIkjfCNkfq/mLWmhjZJqC/t1N/lYE+K0blqmAZ7
	 tvNssemKm7iuLMoKmWk191I9XIOeJEydBBlorns5aQ4UCt2NqL0v8zK0D4JcGcU+4PEDI
	 Yjg3yedkylPpduBQJMJQIRI6BR0bvmldJFmNBUpmWswHv82hAGh5PfuFRh80YEEjk+9gu
	 eivYilvyo6j082ehNIfTK6hx/IJT5mfuxp837wD+pdE/AuZ7PGnEMGLWrJP5T+wg3Jt5t
	 3XrzEBN+KG6a9m8LJ9KNPghtwRSeiO9Z12sdgW17rHl6Z0ZIbzfkyb4WHFoU2LOE2TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794121261;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=qCmx6DpnIrwTlTWDw4oEodoP0i+gU4Ja/jIjM7NRimI=;
	b=hq6pwVpXQER/l3Fl2Hbvvbi6eQ+n59cRAH2BybW9Vw3uvksQEBBV+17auYm/Y1s7a07s
	 cFc46msGnXOiKwroW09OUWrOCiIWBEF5O1K9fRGOVkIS2ewGGUfUbDUvFB4u+LN3I6C2q
	 1NQ6Kjg1atPkpBg9C/CdLXRofAahj2rS5pj/ojMhliAq5/9tg63Hv26IiFG1fYCi7zz5M
	 fN8atwFOnfERHVSQPdGNjA9ufjv2JFNQA7wia3v+P6OO1sfaDAWfweZXho2CYPinYj0bD
	 6n6Of9+i8lHFSJ06YyJ24FpFc0GqYcJZrBz3mgK7HwVY13DNnTp6AX2RVLakhCK4BJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b="DPp6/sWp";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mYSNldut;
	arc=none smtp.remote-ip=202.12.124.154
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD4606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7DD4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=DPp6/sWp;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mYSNldut
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 30D6C7A0127
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:01:00 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 08 Nov 2026 02:01:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794121255; x=
	1794207655; bh=qCmx6DpnIrwTlTWDw4oEodoP0i+gU4Ja/jIjM7NRimI=; b=D
	Pp6/sWphpY/crljA3CuZR9fExWocMAM3i4BCC9f7aECItz0A4jefcdUIMIWL6QO/
	9onbhUQGpKmwOYA21hr6zCHqHe7/GJkPFqKSUSoAHuNwquMBWKLT/dekAnveZnp/
	lah0DtRtoC+811lz2RnE/eN5Jd3Jx+D76eHQBhuTZCSt7VpUS+YaoIrAWFMsOxdN
	CXaoxUrkgafDtMXijoI5hSJIFPUITcvX2+iA3bYKOMYGltcZqZy6K3iAviETUCEN
	RZWuRws7gWC52Z/eTBWjSEK38CKSimYlAEUvEenByH8Rh3CuDfiUhUmKnhS86g1I
	xSIXbu5+ocdqJcl1GZFEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794121255; x=1794207655; bh=q
	Cmx6DpnIrwTlTWDw4oEodoP0i+gU4Ja/jIjM7NRimI=; b=mYSNldutDrm0MG/h/
	+Mr6ezLeeCBnq7S0rc0Plf+eiKFotqm4Oc22/79wQTX4ChTvXNpCV/ip7bewLFhy
	k8+ZrhlsvJw5IKMZo3hJNdYcGtI2VH8aIvotfL3PUUg2COqXQSy+HRgtOdBCZ+gx
	qenI8v08Tq2DJkL4Q6K1oR3g9UcR213mhB/cw5iUoucqpz/wopi+B7YE1n7ju5Bs
	riYahlhqIrd62TBLdNwI/ZHtP4agXyTUeq8rWaBGEZOA3UIwYwHTz6/K5c3qwEZ5
	DPOUqCBUB9GuNjwUKoMQKTdaXiBo3jV8atshb1Dnpb0eCsHSSgxoiDxhxvu7f3U1
	tZuJw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794121255; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:i7gsMMg9HQJIw3Hmi0J1zslTEnJ6fdntw5nMALzp0bPgkNc
	KN0msfNGjk9/MYGGtZ+MvLCkq9Z3avoAj2aUlFsUXolApLzfWQtPfLPMPb4/ukA0
	yHB08LBsRnl2w97sOOyEdtFVW0YfNxCYYWU/mPSqJzf/+Rc/jYb+UFjzUAKgiEU5
	ZacAzmZ15F4WPFDwjasBUpR7W8xgN7g01i/zXD8bT7TCOOdZtJxoYsYOOX1sJ67q
	H3cyoSXMVKIaGO7N4jXPZ9Isvhw3suCM6+i8TqWDsNlfh0DKupb1WcWB9OXW1sBJ
	Cr8EWaXdZBLuU8DUD6Y5X6pkReK088yr/P+R/qA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:mD+YezxNul0uW96XjIapcxbq7AFt6rwK50+Ib7PpJsM=:DlVKbproDw44VuK3FXRaoSxqI9g6sF0q1Q+SGJiiono=;
X-ME-Sender: <xms:Jh7wansapv0-e4bMLHvr0jylxmpkEJzKZjZNU_oDj-biO76uJYq4AQ>
    <xme:Jh7wakkTxlk4rJMImOugPpa-lEKAqJ6JNUHsOCMVAtSFgsFKhKvWp_lIYizWtg94C
    fA3l2HtNbHowZbkAwL9sQtert_h2xwPMYcKlSpSYXPo9YcrQmmdD6F1>
X-ME-Received: <xmr:Jh7wakDoSgEtxYEtL9PvAoefULDOn10-gmZpgrtCj9XbdLxZJNNl2H0AT4grgAjDMckATXqX>
X-ME-Proxy-Cause: dmFkZTFKhclCCJN9i5LFQp5fvn9DylL5PDR95+qcmUDEkBDvAaUlhVhO6JW1PTcA0oiilr
    afxU+kS37MwfkRVrV2sLhNS1OkBSH9hrpfUYkvEeAEfTx8oUhC1lvQdEqsrvfO12L2kPDm
    Y90xvEv61R5vWsABT3XVmqKcWsSTBPoQRHs33ySAWpN7mh8mIX7nfmpu6Q5St0DdZLVl6o
    GJpMHUC7TjUVqLMHfqfKk9SHn10f5lL6CdG6YeehrsosttZtbM1aNiFk46XYC+svmJcMBn
    4w1I3sJZaXrv8SSndHCWUOH7cbPZHBY65Sr1oZjnZZRxSV2wTTFO+3xU/Lmvhk4YCMlhJn
    An92hf5ayiDz+JlUMx2f9ip6BPNZSyXqeXxkmvmU2+bQCo+6Ag/d4J/t+61YixRab1Msqm
    itojlPIWBp2werHJglOT5dTuhiS/TbONUWnYE1ymbnAb5T1c+G+UozmRi5FoQqyiLD5T4j
    dlsU0vGXJWFGiijgCcUtqvb8qh9HwCtr6jkXyR4Q6DIAYohu/AdBwoHhXdwaGnLxRUDVho
    2VCSN767LQnBQCKCmSgMzo6uQOBati/L8USUdRk1zsgA9zDobnCjvLdcMSRJaqRGt6TkEz
    dfO6e//4ABIWBCaozAk6nDHnUCojDu7A+bZDNYdGbgLU/XmnoT7Yp0ASlv2Q
X-ME-Proxy: <xmx:Jh7walTIccjng5cx9DN9G4zk5QL5sm8fApOITmG0kb6VksoMnujtcw>
    <xmx:Jh7wasK6XW7NFbx3EfQ_RXy7o7ZY1aU-dR0EIadZ7s-bN2d9KlYbCQ>
    <xmx:Jh7wam3FbG9Y_XBgK53zEGoO4RHf4Ltgod0stcqlMOclcAWIJLNjpw>
    <xmx:Jh7waguA9lI57fMbP8qlASKNhMy4VYRNjWlnHiD-mosoxxra0TNlmA>
    <xmx:Jx7wakW8cb9ZncY6CxXvwbkTgfIKCzJfhnrsXLvQ1oU0a_c__odKaORI>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 02:00:45 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v16 05/16] accel/rocket: factor the completion tail out of the IRQ handler
Date: Sun,  8 Nov 2026 19:59:06 +1300
Message-ID: <20261108065917.135194-6-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108065917.135194-1-gahing@gahingwoo.com>
References: <20261108065917.135194-1-gahing@gahingwoo.com>
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

Move the part of the IRQ handler that starts the next task or finishes
the current job into rocket_job_next_locked(). This makes the code easier
to follow and does not change behaviour.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Reviewed-by: Igor Paunovic <royalnet026@gmail.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/accel/rocket/rocket_job.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 4a577b642849..ea23a44b1d9e 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -365,6 +365,24 @@ static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
 	return ERR_PTR(ret);
 }
 
+static void rocket_job_next_locked(struct rocket_core *core)
+{
+	lockdep_assert_held(&core->job_lock);
+
+	if (!core->in_flight_job)
+		return;
+
+	if (core->in_flight_job->next_task_idx < core->in_flight_job->task_count) {
+		rocket_job_hw_submit(core, core->in_flight_job);
+		return;
+	}
+
+	iommu_detach_group(NULL, iommu_group_get(core->dev));
+	dma_fence_signal(core->in_flight_job->done_fence);
+	pm_runtime_put_autosuspend(core->dev);
+	core->in_flight_job = NULL;
+}
+
 static void rocket_job_handle_irq(struct rocket_core *core)
 {
 	pm_runtime_mark_last_busy(core->dev);
@@ -378,17 +396,7 @@ static void rocket_job_handle_irq(struct rocket_core *core)
 		rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
 		rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
 
-		if (core->in_flight_job) {
-			if (core->in_flight_job->next_task_idx < core->in_flight_job->task_count) {
-				rocket_job_hw_submit(core, core->in_flight_job);
-				return;
-			}
-
-			iommu_detach_group(NULL, iommu_group_get(core->dev));
-			dma_fence_signal(core->in_flight_job->done_fence);
-			pm_runtime_put_autosuspend(core->dev);
-			core->in_flight_job = NULL;
-		}
+		rocket_job_next_locked(core);
 	}
 }
 
-- 
2.43.0

