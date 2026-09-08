Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC363AC0CC;
	Tue,  8 Sep 2026 06:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849240; cv=none; b=J4KPgacJAjMutTnxzdOjtG48XOOBczhe7OIzbhU7pfMTLcFQk2XDI/FOf8Aj6Kck+O+P41j5luxXNnpazv9jBE6N50LTL93GvZ0uMrZadLrSvhLxtJPdkyrnkLYHJ4d4iYnNZZCu/Wanr89OUfVj8WJeTAdFsO7MMXNm4kj0J0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849240; c=relaxed/simple;
	bh=4snpnfiRY0hX2v+iIuSNAp8LAGdOUIFZQJ5Kz8Cid4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LbJfLt2tabkZgUHCRhPgYezfori4hSOwUZ4qAmkTocc8mr255OdIrzksppKr0im5uel9fTvDjbO/lwbxiuUfn6iUzPl6Q0SqF5/CY4oRZcdrpIfXs2OwLZjdTAaSM8UU6vSZRrWJEu1sKZbEqcGpDIjuDwNDrGr3EyUAKCXaCKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ahpugELj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ahpugELj"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C8EF1CF6;
	Tue,  8 Sep 2026 08:32:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788849128;
	bh=4snpnfiRY0hX2v+iIuSNAp8LAGdOUIFZQJ5Kz8Cid4I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ahpugELjC3ScRgJ2pU2mpB8hJ+ymZZhqeBVDP3nciYUJcwXdcGKwtU/w20fE2LDua
	 Q6v/p/LNkMqXQ2dDbPvVUIE8RiNvPuELKmgggarTWfosn2UOY7Jeui/yuUCOSXu6Eb
	 Jv5YSHvNd5+NPWKojBpmRuSjDEeu6HJN1Em4QXmI=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 08 Sep 2026 09:33:15 +0300
Subject: [PATCH v7 11/11] media: rcar-isp: Add full streams support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-rcar-streams-v7-11-c406a2c2930f@ideasonboard.com>
References: <20260908-rcar-streams-v7-0-c406a2c2930f@ideasonboard.com>
In-Reply-To: <20260908-rcar-streams-v7-0-c406a2c2930f@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3167;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=4snpnfiRY0hX2v+iIuSNAp8LAGdOUIFZQJ5Kz8Cid4I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqn6w+6CMjxBbbPFoLWKQIeICVBPXrH1v0mfxYo
 xDrxBRzq5yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap+sPgAKCRD6PaqMvJYe
 9eL8D/9CW6HVTPLOWS34xQBx+035nCXo0Y8FrbpUSUt4IPnkA5W+zRwPwT4Nb0/dkw8u83rp0uP
 Y1LttMzW0WMQh3x3w8uRMrDOKPPzC56Ek+HNCXoiyeQ8s3nGsMVu9C29yxqtDPlQ7LTx/obRPvx
 uLMTekD/6pMZT0h0nl02Dfy2WoERp3JaVjl4LrHbko5T66UgUbeBidN9U2pjIQB32BXecDIWSKv
 +NPY/LYabve3Aw/yjEHZja40cN2lNNrUR7b7JHjBY02E1a+dGNLK2GlE6GjnDW9ONxZc0INJId4
 njCkUUIZZSxZA4lqTS6aaT4/+UYxI6tH5YdLvWLR0w47BNsaLETOKF30OUwuxwq5tj7YPTXqOmp
 4Hg48FqRECLyEuiHbg6N44U1wWagw2ExJay9t98BNkBpfPlcmXlDnwr7XS4nCPV7n3ZU6qWVm5d
 cbqRxgac+tDw++U41AxumizIsasvJHsa9XtaBlwyw8jpkIAI7K+KzS/8IjjOtMKYiwI1nBfvR2Q
 pcRXAiy2joRQvqGoQebeCJwTOPU6fIBJEG5HruAVN/VNvYyTJDk6dl4A0zVPqdaqqcQw/CVB2AA
 jQ2rckf78cAR3Ac9HpRn4FGS6Ery7GlpR1+vP0tAl/zsFNHzzujtZvdQSCqyQ3sZb2h0ew7qef9
 GKYjI1gjoddyJ/g==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add the missing pieces to enable full streams support:

- Add set_routing
- Drop the explicit uses of a single stream, and instead use the streams
  mask.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 39 +++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 6480f6a2a435..3adee4e87a9c 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -340,6 +340,7 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			       u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
+	u64 sink_streams;
 	int ret;
 
 	if (source_streams_mask != 1)
@@ -354,8 +355,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_ISP_SINK,
+						       &source_streams_mask);
+
 	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
-					 BIT_ULL(0));
+					 sink_streams);
 	if (ret) {
 		if (isp->stream_count == 0)
 			risp_stop(isp);
@@ -372,6 +378,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 				u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
+	u64 sink_streams;
 	int ret;
 
 	if (source_streams_mask != 1)
@@ -380,8 +387,12 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 	if (!isp->remote)
 		return -ENODEV;
 
-	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad,
-					  BIT_ULL(0));
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_ISP_SINK,
+						       &source_streams_mask);
+
+	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, sink_streams);
 	if (ret)
 		return ret;
 
@@ -423,12 +434,34 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int risp_set_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    enum v4l2_subdev_format_whence which,
+			    struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+					       &risp_default_fmt);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops risp_pad_ops = {
 	.enable_streams = risp_enable_streams,
 	.disable_streams = risp_disable_streams,
 	.set_fmt = risp_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.link_validate = v4l2_subdev_link_validate_default,
+	.set_routing = risp_set_routing,
 };
 
 static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {

-- 
2.43.0

