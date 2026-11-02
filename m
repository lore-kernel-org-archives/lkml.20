Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627822;
	b=gcd5AhMRdLKEuASQ/Spne6uRCIOtkWeOVBVxnjcuYIzzrzdZrv5vuFi+s/EVx6ENygEw
	 3Xb+SoeuE9i/EDRWnLY2Y0ZCw4x01YD0phcE5aMYBc0k5IXWPN9MAL0oLf86ZtyY1SRY6
	 ahnjpBmizRn2qbMz4mygT/JZO9yJcvV/zM+Xqoi8s7XVfT3YkWNeQe9ihA4lo12+l10o/
	 I7KVavc6kZ4scO99QpGYFy7CsWctlnGuiKjMZfhsllT0e7wefVv+kC7KVCL+Vghs16dL5
	 FkBuOY6y/nn5tpUpp0mIYctPzTPUJw2Q1nSU/Yp9BAYop/1MmZvHO7OgQAy6DoFNhcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1yfF9fMJxMLeyUYixvpYHsBI9sOfZXF9h7IOuyspaFU=;
	b=uDsl4OwEcpSCNWHzDFU8hy0Eth0oINJOkbr74mSMa22oAxBIQ/l0/Z6HFk/7rHM9GlSt
	 jQE2uC0r8ian0972Lv9l4hBUuyyvGcGrKV5wmGTCXt3EU5CVOFihiBJhR8qkU0qGD8qpi
	 pL1z+t/8k3g1K9CkbE++5acQbBJnVb07QAcC2JgtkywkMunAs7/t8L6mZfcrKWcmYYAIw
	 wCsLTFvtuH8HLcbS2ExfMAK9Eyi6n80qmkpC8TEnzfRH2SDva2fWUKJwu2Thfrj1lvZ6O
	 C2HMycz8uHUjSGD7Vv9rsTp7Z08hwUk+FjUOvxPWdKQOhpJ5Pk3yC1RYQV3hfq64Zdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y6ReDMt2;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34BA60A260E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B34BA60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y6ReDMt2
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso23841595e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627820; x=1794232620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yfF9fMJxMLeyUYixvpYHsBI9sOfZXF9h7IOuyspaFU=;
        b=Y6ReDMt29AklfD0l7ORu4luRQtookkjBFn+jY6UfBa8mrjyNgdomHhKzvrYKsAsZqx
         Y2PUdBrPAf8O9YZ/2655SSdSTrqWW5kYMcL2VEvO+d78C9kcOHiEbLLSlnMpIMuhXAJm
         94CJl4Is1KoQ5y8lqjtbq9DrkJFr0SgUIpF34jtOb1krNVNNX2zcunU/YShvrAYm7b7W
         v8gcwyj9QzUOo6A9A3GDdl8bg5wceTQwPQgydAjnqrw+0S27YnnW8TLsw3ck9+47efZ6
         25wg07hN3QwZE0h/zVc3Tl8HL3xrGiQm7XxNYFFZ+kvcbbXTn+NCnhmgOXLWwzofJgWg
         Auuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627820; x=1794232620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1yfF9fMJxMLeyUYixvpYHsBI9sOfZXF9h7IOuyspaFU=;
        b=EoMeyXDUAVI7ngIBSZuYwXNF9M/unX4/vbEjk9OPekKfmlmxLjWEU4bvUIsB0FkGhT
         gmSAqFRdY/DrUirUYif/3OCDfpvGLtBb1VqGNzAVxk/XZrZJi57+SSKP9RDBbcFN3FnE
         M5kNZMtTGSgbHgYMCVJKmbpvkxq4KcR/tV3qXrpLc+DGx7AiB6wAhXVs+2Mkmoqk2BvH
         z8BNLuyy1Fs+j+1IhWZiLe9NtLS8up8qe38W05wNn2pDNKTLH90xgoEAbbSdCLiuXyYG
         ELUqogoIWP5e0wX478ftumayu72Ja4oc3VpRqVhanVbzdw4+SUfGL72B0DecmV2B/V/3
         9LyA==
X-Forwarded-Encrypted: i=1; AKwUvBz1p3rjBkmXrKLyMPZdZQ9WZYu71Qe6f9XGJTkdTt4yW3a9uGDfVTqQXKYMQHl6UGwseUlQYlvPGnPemoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOA+MvJRW6I26FzmyXunpXvdyjQ68ZlYd/Igc2u62XXvAF6vcS
	28zsvcznkmdF8rPwwTBEAW6rHyJTjs/ZanLkxpw9pe/60kV+oOf+kzWspCRSlZPqYGM=
X-Gm-Gg: AYBFou3g3DxjqiaAX+n9KGy7iBE2eZpokl/MyoYFSOaHhkhhTZfyOYyZml6GulhpFaf
	S5A+5RMcIM7QWel6imaxKs13OXK24Ps0Xa4UhAJk+GD3NKTDrFYLEpSiIbmSQfjS0iqJMT1b2Kf
	eRwfWP+Ew4Ux3Fded8h/wySCv4XvgEIdmDqH2fTBHURb8LwCjbOLN+oAtP4yXQo/AoiKM5VmS3Q
	iimDwnV8OEPvy3vDIYZ3T6aD0iXcXVXXSjARsPzNDVhRuA7Ms3ZRgqVy8IyH33reh0SfhVve9Dc
	kdHYvJ5cj80l4c5HsiMCWjME3rPLulrEWbqQrIHkQTAuyTsataAl0Y2qXXn2OGcy6rNB9D8dUyw
	CLd1MoBNA7ehPgH3LnR524Hj6dyz6fOjQfl2trpbSjEe66B/9oVMCIzMOjesOrWpGWEnjlzZJIo
	8oOmsOQ1egUwD6XK9azezgFWTE/ObXwE9cCvDi5J8BDn4Ri7h4gyHdxQLARUjlcK4nu5w7feUgL
	kjx1qSYxq+qK6Vign4SmRxgflw8DM03NLLNOCkqcygpqzNIZQZ2Nn6nbkhM8WmxHPZGJ4zegNrG
	Ooati4ImVSJkGnx82Q==
X-Received: by 2002:a05:600c:6211:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4ac17191046mr244313045e9.6.1793627820165;
        Mon, 02 Nov 2026 05:57:00 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:56:59 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:48 +0000
Subject: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence tracking
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4804; i=bod@kernel.org;
 h=from:subject:message-id; bh=p1paHPUiTQGfoLQ5bunItwK/01QP6WM97TRBsHxzpBY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6JalZfZbbQ4gPVNIKGLdhg6LzDU06B1VXdYFq
 vlMqXN7FwmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpQAKCRAicTuzoY3I
 Op/AEACKdcu0Jx0r6q+gjynzIegkqNAoXfg/i8oBkMm+C1y7i1FQnUxpYKZMY+AKD6inLeqdWFU
 ROHrJltY6tW3F/p29CuXYXkvWA4tBqVZkegTRZGxojQBjCQ4hnwCfX33jf0mzbjadmzT2XLeMS5
 2vM6GPc7uTPXTJbL7xEmkTxFaCp0c4R8tvCtOujPawNlOccG24iZpaOzJlvh0Wetv4T0rXyqdgZ
 LicvpYq5MjYvnW+tLJj6w2pz26i/BBMce9BSRXeyqQ7Z3sr6MHmP1PLFO8BrgtQ1dy3IPX6zs42
 HBtTrXZavplAKc3QcayJd+/4M4gTd2UvuGYoAgQN+XBlJuICaZ62rm+zGTIiyirmL1Vrz4pO2To
 CTX2QMMg7clN9/3/75bEIsjoGKrMLzLhbWXt6IXXRV4t7JxK7NTZ9g27WLCdJ7uzhiPgYBeP1yH
 V1ks+CU9D+gA4xKbdLAOU1/J9weCnvWLcEKge+X2u1jM7oyVbQZAiRx9rMBJU4I+7dYwu9mdSHb
 69UdtwelBNZxvV1xAW7DCRgrdwY/JFIiZCH9jQJXN1HnHaee/K4pFsWp1xm69/togmdUNOgsuKj
 6jOPElpXQyWVA7mJtqRtpPc0JareVBZjalC4ZeONd0nOh3iEiM2LtANg/xeK1K4qB6jcTFOLojv
 Sa4wzg1tTOEELSA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

In order to communicate to user-space CSI2 SOF events we will need to hook
into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
implementations of FRAME_SYNC have CSI decoders which support the event
always generate it in our case if and only if an atomic user count
indicates it should be so.

A flag in the CSID descriptor indicates if frame_sync_en is supported so
for each SoC that supports it this flag should be true. Since bool is false
by default no negative enumeration of existing or in-flight CSID is
required.

Subsequent patches will enable on a per-CSID basis.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 54 +++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index a00791b00feb7..e9b399fcb9c7a 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	unsigned int i;
 	int ret;
 
 	if (enable) {
@@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (csid->phy.need_vc_update) {
+		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+			atomic_set(&csid->sof_seq[i], -1);
+
 		csid->res->hw_ops->configure_stream(csid, enable);
 		csid->phy.need_vc_update = false;
 	}
@@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *entity,
 	return 0;
 }
 
+static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsigned int elems)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
+
+	atomic_inc(&csid->frame_sync_users[sev->id]);
+
+	return 0;
+}
+
+static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
+
+	atomic_dec(&csid->frame_sync_users[sev->id]);
+}
+
+static const struct v4l2_subscribed_event_ops csid_frame_sync_ops = {
+	.add = csid_frame_sync_add,
+	.del = csid_frame_sync_del,
+};
+
+static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
+				struct v4l2_event_subscription *sub)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+
+	if (sub->type != V4L2_EVENT_FRAME_SYNC)
+		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
+
+	if (sub->id >= MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sync_en)
+		return -EINVAL;
+
+	return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
+}
+
+void csid_sof_event(struct csid_device *csid, unsigned int id)
+{
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+		.id = id,
+		.u.frame_sync.frame_sequence =
+			atomic_inc_return(&csid->sof_seq[id]),
+	};
+
+	if (atomic_read(&csid->frame_sync_users[id]))
+		v4l2_event_queue(csid->subdev.devnode, &event);
+}
+
 static const struct v4l2_subdev_core_ops csid_core_ops = {
 	.s_power = csid_set_power,
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.subscribe_event = csid_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac8..2e48b08b93592 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -141,6 +141,7 @@ struct csid_hw_ops {
 
 struct csid_subdev_resources {
 	bool is_lite;
+	bool frame_sync_en;
 	const struct csid_hw_ops *hw_ops;
 	const struct parent_dev_ops *parent_dev_ops;
 	const struct csid_formats *formats;
@@ -167,6 +168,8 @@ struct csid_device {
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *testgen_mode;
 	const struct csid_subdev_resources *res;
+	atomic_t frame_sync_users[MSM_CSID_MAX_SRC_STREAMS];
+	atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
 };
 
 struct camss_subdev_resources;
@@ -248,4 +251,13 @@ u32 csid_hw_version(struct csid_device *csid);
 u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
 		      unsigned int match_format_idx, u32 match_code);
 
+/*
+ * csid_sof_event - Track SOF generate V4L2_EVENT_FRAME_SYNC
+ * @csid: CSID device
+ * @id: CSID src-stream ID
+ *
+ *  Called from the CSID interrupt handler on SOF of the path driving the event.
+ */
+void csid_sof_event(struct csid_device *csid, unsigned int id);
+
 #endif /* QC_MSM_CAMSS_CSID_H */

-- 
2.56.0

