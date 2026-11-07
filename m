Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013319;
	b=OLTaGOzYDitYLyq6JfswGONY7WD7XXhCcdm/jqKzPUtJCYGBRvL1bqxZVXob+KL4WEsO
	 EAFvP30eWmpTs/jPOZqWCvXGf3DG5p+NX1LNt0qt4DlmDSRAxrTZytyr2T2Isvay1+Nn5
	 4DPqTAx6yOHJcAfeyyoNpnjkDNmQ7GfhGxUuAgo8mFzThBc3iBJDQpQlXzkSxNUljDB1u
	 8f9OmacLwJakW5m65TocXwoyfS3QZ/HDxQgj3cQQkAXrc7qx2tjQTJBpUj1abN2l67goE
	 rPu00FfxQjpy2TU10RHruGn+tc698PhV5FTd8tgKgr4SyjaH2042n0qDJ0hf+9kcNnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=26QMgWi3o1YD//BgFkcvVdQg8o2jZG8o8gA4UcSTXMk=;
	b=ULSeqRSg78NdKfzKWCTGNyCjMPSP+2+La8kpMirsuG0c6kvH0GJPSsPJk1Z5JRSLu21O
	 NyjPfl1BEOSzXc4COcPqlyR37lKFmO1FVVmNCR8GXDHU4/HdwZAIJQOHgL0Vct39UgiOw
	 ySk2Nq9AvbxYMdRXooRzHrAXMq9gUP0cvH3/Yat4jkRqppzDG4sizNLB13RvGbWod09Yt
	 1ym2bb9ijmheXyRijp3MfGBPRty/2RxKwuXQG5Jut7pX11lU6WbKMK9VNJYyBRCxzpdfM
	 L1N4KzpMCBy7a/f76jN4TZzmEAxGJtZ3mdKVGdpCjJGaGMdJI62J41pd6ZTzd4PaOGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sWSSRMtD;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63DF606D80A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E63DF606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sWSSRMtD
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so12560365e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013317; x=1794618117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26QMgWi3o1YD//BgFkcvVdQg8o2jZG8o8gA4UcSTXMk=;
        b=sWSSRMtDnmwUeDVpbk12Dba8CU1aUb+vg23zNjpdR7PXdeKCrRxUnpkyNz9ht8SYuY
         MUMn5IPPG+ALKIHEkGgkXMZxNxfn1aCrjSfta7s7Cj6XCU33JDhYU5SsYC7+JXQT/dmg
         gC0Wv9jNBj+eR13BJqLF667BhlFYerLadhtK35nf2czXD4OzL4kdq2c/3XMqEx6ATJXz
         X0wrJoYITO+1Uk9EvDaXKCV8JJ/o4SS5CbqpEaDkCJGINvJBbELdF7/jvld83BDLiXbu
         tsuP0XL6OyZfC6Sj+gz4PV/H/HYrdc12HZIa7lCCZ0RUMNBen9Mhh70VvqpjsVs0SMvA
         8e5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013317; x=1794618117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26QMgWi3o1YD//BgFkcvVdQg8o2jZG8o8gA4UcSTXMk=;
        b=J68IkNAQbOckswyEJd9AHVaYuy3MSQMX19Vj+N9g8Y2TCrWCaT7D1e9LHzK6jpoVtS
         QL0BJ6RrarkJbgko6PRaUhEVctrSWTsGBI9q4wk6H+mXRDRAGSD3dEE6cGUOWkbyzqgn
         bTWezul/UYHeqmrW8GU7/RT0Wb7ajQvfiFwGMsLVGnlzl/fd/N2HIy1rx0tNcYNMT+HN
         +Qvwg9RM/friD+37mqrZgLFI6UbOWlTxLmluQdxYBW23lKmRtMJIoV7LxTkDm5wSSmer
         WhTnqxbo+hElXYm7+/iApcjFuvkX2cmYXgKqx7l6ynlg0fNZSAPpDgzLWyRumbTa1Eiw
         1XTA==
X-Forwarded-Encrypted: i=1; AKwUvBzPQB2Py/fAeEJzWS5AN7wpOcZkF0joeWhXLzZAwu5RX8FCw3kqr+NYFHaVmgZRU+D53Cra3WVRl4ZrlF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fcj4lg6+1uIrwGT+SvdAJqj0fXOpbNlBKOzcQxXLBz4cjcleq
	oxiDaQtj+/rJfveb3mgRWKPpkWOo9bAojHXtaeywnftyZUxLTE0J2yEbm8mcNNWbmv8=
X-Gm-Gg: AYBFou3AwsORh3qg1LjSpaGvtlkBnYFzKvOcxK2PzZVZoDzSqYSUHuhizrNSABoM8bY
	Fl5h/wsSe+9JU2Lss9gn8tSO65OJT9/FYUsgpu9E/ZSHZHfRtU+vWZoR4iiPMvTJgbo88a4KQEW
	d5sJDmKsAUVzhwoXYyQwrzIL4v26WU1t07p8UWpq8tsA061WxL7cBEJC78g3UZDtJFHytJoYEkc
	AaPymtsPfyuK+ur3/1rg29OpgHKaJRgT00hhIZwEsOQCkHZwQ5hLkup9Y5ChdZNnWPfiTAbPurz
	BdwcGruWp+Jx0w8Hkmvp7ol1xhSJBS90nGe8aIVy8QVnsQ1LcS/VGlNLHmwdx+y+nfrMwTrZdji
	TKMBTOWslpeYi9dVRt1OAWUMeCilUFy/IlPGre8KDV6zQBaHlREBrKIZbkFPEviLgGPhLgTK9aS
	0Ok96w5lfOZ3Id5Wzm07sAs38S3GivrMX0LgMBBTKn3L7E19Gbf8SidqTok4NWCdcseJV6CFdv7
	pe0zJJ8rkfTlrTkD0yasLxdlrWgjuFv7DOsFbLepPwUIoi5U9jGrDg6tiJHL1WewShk/p/nG5ih
	eVR+kXdictlcErv5AcLajAg=
X-Received: by 2002:a05:600c:a013:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4b6e054964cmr64192375e9.33.1794013317319;
        Fri, 06 Nov 2026 17:01:57 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:01:55 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:45 +0000
Subject: [PATCH v3 02/11] media: qcom: camss: Introduce SOF sequence
 tracking
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
Message-Id: <20261107-v4l2-frame-sync-v3-2-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4817; i=bod@kernel.org;
 h=from:subject:message-id; bh=pbGnTzhMRethQy5NyzCU9Oy6IUo8PlUiERYSrwD9M6o=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh8y7Pnc7LnE9jJpdRW+cJBLGo5+DwNOitHw
 x9RNfIi9YaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fAAKCRAicTuzoY3I
 OkluD/46H4xAqkq67PvrEfebCVmC3k3tdY1c3CGULHLWmM3MVT9bXriZCs3X/2MdQcjb3rjtQlp
 PqY0YsHkj7+r/+za33S2XM4Cr6Os7ZjHMNw5ljP0ja1XeJDiSlkb7D1eAE7mdJwLZlD03q0579s
 uotgREFMBiquvam6QQwVITzcDBe6s96T6SD7bfPR3I1qGtrGoonKZuhlYrRC78/4ERqVHETS3s4
 IGa7UzSlyDQaWYlB1H+5Vbd+s6P9YbRkBmo1kfuyWIIm/g9T4+U0Qw0QIkgzV9CM8nYMYgAGCPk
 uCs42yO5xPRLdACtXeVv/jmf+6fhtJp2JbH6OWb/rFEjdvJXehiesxI6WGPDg2r5ORyxi4I9MG4
 zvMbIpQ/lcb+FxI1YxykBT3Tdxoyb7+LNiQe0m4gHdJMmFRMEVpYeaqDLs7CPQMrrdmB39CQZ5Q
 JOiZrrHcNJV6CihTQb1J5i3ufhyV19cVpi0CEddhnJxJ53LRMJRkgQ/nZRPqTa59SHQkjSiCAc+
 P1q1GhQTdOzQGWZDmNPHxBGuf0kep3z/+6e/epCZHIvqBznld2IGcUYD6SH/5e+S8DwRxO1opzt
 lpVQII4ktiy6OpxkHH2aG+Y7/v9iJqod4zc2xBAGvApdB1KEHTGf0yXDo5QPuqFCaE4Mu5NtBHZ
 Ib5gw6CIKwSS2Tg==
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
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 54 +++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index a00791b00feb7..7f33fb81ca8cc 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	unsigned int i;
 	int ret;
 
 	if (enable) {
@@ -778,6 +779,10 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (csid->phy.need_vc_update) {
+		/* Set to -1 as we want to do atomic_inc_return to read */
+		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+			atomic_set(&csid->sof_seq[i], -1);
+
 		csid->res->hw_ops->configure_stream(csid, enable);
 		csid->phy.need_vc_update = false;
 	}
@@ -1316,9 +1321,56 @@ static int csid_link_setup(struct media_entity *entity,
 	return 0;
 }
 
+static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsigned int elems)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
+
+	atomic_inc(&csid->frame_sync_users);
+
+	return 0;
+}
+
+static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
+
+	atomic_dec(&csid->frame_sync_users);
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
+	if (!csid->res->frame_sync_en)
+		return -EINVAL;
+
+	return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
+}
+
+void csid_sof_event(struct csid_device *csid, unsigned int id)
+{
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+		.u.frame_sync.frame_sequence =
+			atomic_inc_return(&csid->sof_seq[id]),
+	};
+
+	if (atomic_read(&csid->frame_sync_users))
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
index 5296b10f6bac8..a9d88909d37fc 100644
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
+	atomic_t frame_sync_users;
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

