Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305121;
	b=qv/GDvfkK7SphsZTE8AUGf+wSder09/hNY0laoUmUt7i5UVnRjorAwR7SR4KDY+Hpro7
	 sbyioCQcENUtUVQKfFB7nOULVllpPPN6E0YBIl/QNMQT9pTkykCIckOZ7xtTQpdPQbYRg
	 mtgzMIxtUWKKgVpD7f7dvl9K4eOhRItNbVm9+X2cex4+lmDFy5YUAUsb5wvdRL4+nWE6e
	 D9/VR07d+ANFd6OVBDL5kaG00xWsby3qaJxnqR596MCTCGQDvDlC8daXFe5oKq+aOzTZa
	 3ysbGtM229693WC7Rswjax8i2L1TP5BHNDMabDHWZisIxX0D2mV8Q+WVh9rSSQPQcAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305121;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SAaxaBUZqt+5yM3o1Sn3l7P3VMtS2rIqUac1ZncTLRk=;
	b=WPS8t7hyFrdxzVl/Vv0zXzJLdryKnIHUu8FIz36GhgU8Q+QBxSijwfa/7n586pJDvEXm
	 /xAkHVDudol4YHHqMGkeJkM2LpAAQh3mUuaPURtrUM4ko14AgOXVLyLw3l7tIaUiroxpn
	 lvYzst1mSL74TB5uZB53QRLI4SW5WptWQ6gF9L3xfWfZirp4xRnzHhYN1bsAhk4JIQ/lA
	 I/zbavDI4OGQ2M9dPgnDWeES+lG0EG2h+QIjrMj/DTs1TVAI5D5cU0yNKMP+xO3JApc4a
	 qXdiXZR+27SWRgmXGd92wSWnetXksr2ElPtWzODdyNy65r5lY1h6rvcgNvQ8G2iyf4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=axYHAGmY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB6606A33F;
	Tue, 10 Nov 2026 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=axYHAGmY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305120;
	b=otNZLkelL5+Z2wZSEcPXp+hu4Zl29oWjBqnwucUh/vWM3EsejjS7NN5qj1Ph4psJPBY/
	 1pL94bKksSSV3std1GkwUj+5hdrY2dIdvdy0QDq/EoCO1EBjfWAnIPjnaiFL+NZoQyiEM
	 LemsvEpmOkRR86Q8ABBqbqS5wzoO6EQ5ltA5ISJTJpBdYFE2ztCzFkBGWPlJjbN+8MgSh
	 iLvGp21b2fnBfZDYgjF7IWzUWJa6rKYHA4EPmg/rCcV52EsCGQfQUsoh+xteqxthM3Zf4
	 KGzCnwx7bs7rKJFA6NVQIuoYl8uUY61vOhcyp6PiwmqY5IL5BQHDEQMliFe7/LvxfZQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305120;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SAaxaBUZqt+5yM3o1Sn3l7P3VMtS2rIqUac1ZncTLRk=;
	b=TN2cG8rMv3Li5ARAQTObXuaQB1bJpcrPo6L2EYuocWzvNtsyy96bI6/dYh+djKWRhD2f
	 S7qVgga0aS+iqMz7nUac4kov8XelNRRUEZTqBLbngQKuFND3PMcKo9/wnA1jW6Qlbylbk
	 auZjd0G9XPOo7MIHvmC89WVqsujJOCmckDDPBO9h6W8wkIF17B3fJuTLB/XVC0rygbYtr
	 s59WHsGqjSnLbSTEbDUrr1GDf8La+E9Qe8p80TuNGPLh4u7Oc8rRtje4n2yV+Cv55t4wn
	 9j24cQBOR1NWyc8rJB8LtfmBWw9JGyW6xaOqQjATK7mNGOSLhb2dBB5N0Y+WxixtqMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C8BF1F008A5;
	Tue, 10 Nov 2026 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305120;
	bh=SAaxaBUZqt+5yM3o1Sn3l7P3VMtS2rIqUac1ZncTLRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=axYHAGmYlThc8qrobXe/2lFxgW9JYsPN4HWR6R/4FN/GBzzeCxck2Ba6BEdZFE3ge
	 H5WggeINgiYH6uFTz55iSqqU9GMysdeHgt/+4IRygyaCiLOk3y/LON0wy6AdJarrkn
	 tLBGr+L+pPTiYexj871Nrla7CtkfQ51rls3OIUeh0pDFPzQRJae8n4xudxlBrXFSjY
	 Vg8+B5ePxZ4e1WuoQ9sytj1f/R9LDuzm+41oUyQKa0osUXy825kEflkLQkS6cHD0Jb
	 4b3UeiaOBx+ojqZfcnKKsOj3NI42/MtLyXIIp2s5v/9Vvb5progouVfjv2qGsFqinz
	 LPBmoG7FqXPsQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0D4A548A96;
	Tue, 10 Nov 2026 10:05:18 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:05:21 +0000
Subject: [PATCH RFC 07/11] media: v4l2-core: Halve the I picture QP
 increase of the encode CBR
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-h264-encode-fixes-v1-7-7a64486df499@gmail.com>
References: <20261110-h264-encode-fixes-v1-0-7a64486df499@gmail.com>
In-Reply-To: <20261110-h264-encode-fixes-v1-0-7a64486df499@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305116; l=3550;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=YKak4DZnLwR2w4xlIVJzMqRQDjjIsHD6EnCSZHiTMQg=;
 b=1gdG3JuQ7+8Rxswlkfvv/ue4PfaZlhd8GVpVWfzDJW42hefHn7koR1L/PcaxDzfrLqpIiXXdj
 9htJmEruwERAKNc+yxC9uTHcUhKLk7SzwbZ90ZyeLf+9Nw88KIOEjal
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

After an I picture above its share of the GOP at the largest I/P size
ratio, the constant bitrate rate control raises the QP of the following
I pictures. It adds the increase to the mean of the QP state now and at
the previous I picture, so all of it reaches the next I picture, and it
limits the increase by the QP of the I picture, four steps below the
state.

The Rockchip MPP library, whose behaviour this follows, adds the increase
to the current state before the mean, so that half of it reaches the I
picture, and limits it by the QP state. Do the same: an I picture that
came out large because of a passing scene is not penalised twice.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/v4l2-core/v4l2-enc-cbr.c | 36 ++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-enc-cbr.c b/drivers/media/v4l2-core/v4l2-enc-cbr.c
index 32f98052e981..70810b3fea23 100644
--- a/drivers/media/v4l2-core/v4l2-enc-cbr.c
+++ b/drivers/media/v4l2-core/v4l2-enc-cbr.c
@@ -47,8 +47,10 @@
 /*
  * The I QP increase after oversized I pictures: at most 4 QP (1/256 units)
  * per I picture for an I picture twice its largest share, and in all at most
- * a quarter QP per QP step below 45, up to 6 QP (more where the QP is low,
- * where a QP step changes the size by fewer bits).
+ * a quarter QP per step of the QP state below 45, up to 6 QP (more where the
+ * QP is low, where a QP step changes the size by fewer bits). It raises the
+ * current state in the mean of cbr_qp_intra(), so half of it reaches the I
+ * pictures.
  */
 #define CBR_INTRA_ADD_STEP	(4 * 256)
 #define CBR_INTRA_ADD_QP_END	45
@@ -126,25 +128,25 @@ static u64 cbr_plan(const struct v4l2_enc_cbr *cbr, unsigned int fps,
 }
 
 /*
- * QP of an I picture: the mean of the QP state now and at the previous I
- * picture (the current state weighs 70% when it rose from 33 or below to 35
- * or above: content that got much harder), plus the increase after
- * oversized I pictures, less the I QP delta. All-intra streams use the
- * state alone, which then follows the I pictures fully.
+ * QP of an I picture: the mean of the QP state now, raised by the increase
+ * after oversized I pictures, and the state at the previous I picture (the
+ * current state weighs 70% when it rose from 33 or below to 35 or above:
+ * content that got much harder), less the I QP delta. All-intra streams use
+ * the state alone, which then follows the I pictures fully.
  */
 static int cbr_qp_intra(const struct v4l2_enc_cbr *cbr)
 {
 	int cur = cbr->qp_q8, ref = cbr->qp_intra_ref_q8, q8;
 
-	if (cbr->gop == 1 || ref < 0)
+	if (cbr->gop == 1 || ref < 0) {
 		q8 = cur;
-	else if (cur >= 35 * 256 && ref <= 33 * 256)
-		q8 = (3 * ref + 7 * cur) / 10;
-	else
-		q8 = (ref + cur) / 2;
-
-	if (cbr->gop != 1)
-		q8 += cbr->qp_intra_add_q8;
+	} else {
+		cur += cbr->qp_intra_add_q8;
+		if (cur >= 35 * 256 && ref <= 33 * 256)
+			q8 = (3 * ref + 7 * cur) / 10;
+		else
+			q8 = (ref + cur) / 2;
+	}
 
 	return DIV_ROUND_CLOSEST(q8, 256) - cbr->qp_delta_intra;
 }
@@ -350,8 +352,8 @@ void v4l2_enc_cbr_end(struct v4l2_enc_cbr *cbr, u64 bits,
 			      cbr->qp_intra_add_q8;
 			cbr->qp_intra_add_q8 =
 				clamp_t(s64, add, 0,
-					clamp((CBR_INTRA_ADD_QP_END -
-					       cbr->qp_pic) * 64, 0,
+					clamp(CBR_INTRA_ADD_QP_END * 64 -
+					      cbr->qp_q8 / 4, 0,
 					      CBR_INTRA_ADD_MAX));
 		}
 

-- 
2.55.0


