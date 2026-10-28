Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179824;
	b=kkUNE0pInlrJ2TjRgcaMalYaRcq1yAHvW6zgINa1W70xSMxvIHqJh0RjgFVLPkbtJB9t
	 J6EWzv/WMf18AplDp2vAd04TF2elUUiDklob4cfas49PeMvsUy3OKuTLFwgikQMBkseWz
	 7Uomhxj5ydroVq5wgGB1f2bEfnDFxFxZqclRpkSAA2pnP81nU5zsoY4qYLBNWKF/d0jRf
	 Pbv0EBW2eIzwoxAWvTv9yyqU6T5TiZSTHXtnXGSTqzrOx99uoTU231e3zRyYn8RW2+4qM
	 y7xZAdEWr3zQIFYjL+8AfXIBRFOjqg8Qs7iubIYOkT0uD1w5mSB+58bRLG6uF131k0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179824;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=kGgo5IcjlUl2e3mmCEvTzz+v8Bm5wwnVwuOrnD2TmPA=;
	b=zqiHr+sN1vDFVknEG6lGRZV4Q8zyCq4fL634CNg9N0o3RTZtiQhA8h3vrZJbwJ35rz3t
	 bea9/08sEVggnCKr21QI+uTuwA2MQutCAtKF3qjjZkAgAXxWLjR+aseQjYaOY+kPk3wD3
	 hRn1B/lFzPI6y7bMMX/cmjybs/q+EyUV5sO9oSPVJZDPwOfehqt8UYr/cAMyuOqvKlNEb
	 lQBDhdf4P4eTIgWr11bY3jg4zgkM1m42KRH7DsshrT/cHZjDljlPItd07Fy/y5zXeGswc
	 PPNo8Skc5+rfBj7aS4o76DF2sC+15mlowRAu27Br5HkzqiJ4uGT78wppA8z4owwKijg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C93E606A31D;
	Wed, 28 Oct 2026 09:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C93E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=kGgo5IcjlUl2e3mmCEvTzz+v8Bm5wwnVwu
	OrnD2TmPA=; b=qU3CMQsRrgKUGSNL4qVbj+wcE8kBA8izBtFYVK8igMO90sfb0r
	8054ptySeN3ZxetanAY0AXCEPFTv0vKSd9SvFWUp7Yp44IMrN4Y7q/AMfCiSiBHM
	J43aQBg4lCRyioJQcYO65OtZhlWLAk+zyilAznt1PxffHXNgmZgukZeNU=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.23])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgB36i6cwOFqbQZYAA--.619S7;
	Wed, 28 Oct 2026 17:30:11 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: 'Bryan O'Donoghue' <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/9] media: camss: csid: report frame starts from CSID
Date: Wed, 28 Oct 2026 17:29:59 +0800
Message-ID: <20261028093003.722745-6-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgB36i6cwOFqbQZYAA--.619S7
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw4ktFWDGw4kXry8Ar17GFg_yoWfuw48pF
	WkK3sxKr45XF429w17Jw1UZF4aywnY9ayjkrWkA34S9wn8Kry7tF4xKryYyry5Cryqk3W3
	Ar4UtayUua13uFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E
	87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j
	6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUgi05DUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2rg+9YyDwBWsV

The CSID of generation 980 moves the capture interrupts away from the VFE:
that VFE has no useful interrupt sources, and the CSID reports RDI buffer
done, register update completion and CAMIF start-of-frame per CSI2 stream
instead.

A buffer is only complete once its frame started, and the sequence number
of a frame is defined by its start: turn the CSID start-of-frame interrupt
into the frame start source.  camss_frame_start() forwards it to the
paired VFE, which raises V4L2_EVENT_FRAME_SYNC on the video node,
increments the sequence only there, and marks buffers done before their
frame started as erroneous.  A start-of-frame may also follow an as-yet
unhandled completion, so the end-of-frame and start-of-frame timestamps are
compared and the completion reported first in that case.

Hardware generations that still report frame starts through the VFE keep
the previous behaviour, as the new vfe_hw_ops callback is only provided by
VFE implementations that need it.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../platform/qcom/camss/camss-csid-980.c      | 27 +++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c | 59 ++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h |  3 +
 drivers/media/platform/qcom/camss/camss.c     | 12 ++++
 drivers/media/platform/qcom/camss/camss.h     |  1 +
 5 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-980.c b/drivers/media/platform/qcom/camss/camss-csid-980.c
index 09139815c..e0ba84f4d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-980.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-980.c
@@ -108,6 +108,7 @@
 #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi) \
 	((csid_is_lite(csid) ? 0xF4 : 0x11C) + 0x10 * (rdi))
 #define		INFO_RUP_DONE				BIT(23)
+#define		INFO_CAMIF_SOF				BIT(4)
 #define CSID_RDI_TOP_IRQ(rdi)		BIT((csid_is_lite(csid) ? 8 : 16) + (rdi))
 #define CSID_RDI_IRQ_PATTERN(rdi) \
 	((csid_is_lite(csid) ? 0x548 : 0xE50) + (csid_is_lite(csid) ? 0x100 : 0x200) * (rdi))
@@ -295,6 +296,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			u32 mask = readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(i));
 
+			writel(INFO_CAMIF_SOF | INFO_RUP_DONE,
+			       csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+			mask = enable ? mask | INFO_CAMIF_SOF | INFO_RUP_DONE
+				      : mask & ~(INFO_CAMIF_SOF | INFO_RUP_DONE);
 			writel(mask, csid->base + CSID_CSI2_RDIN_IRQ_MASK(i));
 			mask = readl(csid->base + CSID_TOP_IRQ_MASK);
 			mask = enable ? mask | CSID_RDI_TOP_IRQ(i) : mask & ~CSID_RDI_TOP_IRQ(i);
@@ -327,6 +332,18 @@ static void csid_subdev_reg_update(struct csid_device *csid, int port_id,
 		__csid_aup_update(csid, port_id);
 }
 
+static u64 csid_read_timestamp(struct csid_device *csid, u32 offset)
+{
+	u32 hi, lo;
+
+	do {
+		hi = readl(csid->base + offset + 4);
+		lo = readl(csid->base + offset);
+	} while (hi != readl(csid->base + offset + 4));
+
+	return (u64)hi << 32 | lo;
+}
+
 /**
  * csid_isr - CSID module interrupt service routine
  * @irq: Interrupt line
@@ -359,6 +376,16 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			if (val & INFO_RUP_DONE)
 				csid_subdev_reg_update(csid, i, true);
 
+			if (val & INFO_CAMIF_SOF) {
+				/* A new SOF may follow an as-yet unhandled completion. */
+				if (done && csid_read_timestamp(csid, CSID_RDI_EOF_TS(i)) <
+				    csid_read_timestamp(csid, CSID_RDI_SOF_TS(i))) {
+					camss_buf_done(csid->camss, csid->id, i);
+					done = false;
+				}
+				camss_frame_start(csid->camss, csid->id, i);
+			}
+
 			if (done)
 				camss_buf_done(csid->camss, csid->id, i);
 		}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index d1b66033a..070b7feda 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -444,6 +444,34 @@ u32 vfe_hw_version(struct vfe_device *vfe)
 	return hw_version;
 }
 
+void vfe_frame_start(struct vfe_device *vfe, int wm)
+{
+	struct v4l2_event event = { .type = V4L2_EVENT_FRAME_SYNC };
+	struct vfe_output *output;
+	struct vfe_line *line;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+	if (vfe->wm_output_map[wm] == VFE_LINE_NONE)
+		goto out_unlock;
+
+	line = &vfe->line[vfe->wm_output_map[wm]];
+	output = &line->output;
+	if (output->state != VFE_OUTPUT_ON)
+		goto out_unlock;
+
+	/* Count frames even when there is no buffer available for capture. */
+	event.u.frame_sync.frame_sequence = output->sequence++;
+	output->frame_started = true;
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	v4l2_event_queue(line->subdev.devnode, &event);
+	return;
+
+out_unlock:
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+}
+
 /*
  * vfe_buf_done - Process write master done interrupt
  * @vfe: VFE Device
@@ -478,7 +506,17 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 	}
 
 	ready_buf->vb.vb2_buf.timestamp = ts;
-	ready_buf->vb.sequence = output->sequence++;
+	if (ops->frame_start) {
+		if (output->frame_started) {
+			ready_buf->vb.sequence = output->sequence - 1;
+		} else {
+			ready_buf->vb.sequence = output->sequence;
+			state = VB2_BUF_STATE_ERROR;
+		}
+		output->frame_started = false;
+	} else {
+		ready_buf->vb.sequence = output->sequence++;
+	}
 
 	index = 0;
 	output->buf[0] = output->buf[1];
@@ -544,6 +582,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
 	output->state = VFE_OUTPUT_ON;
 
 	output->sequence = 0;
+	output->frame_started = false;
 	output->wait_reg_update = 0;
 	reinit_completion(&output->reg_update);
 
@@ -1972,8 +2011,24 @@ static int vfe_link_setup(struct media_entity *entity,
 	return 0;
 }
 
+static int vfe_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
+			       struct v4l2_event_subscription *sub)
+{
+	struct vfe_line *line = v4l2_get_subdevdata(sd);
+	struct vfe_device *vfe = to_vfe(line);
+
+	if (!vfe->res->hw_ops->frame_start)
+		return -ENOIOCTLCMD;
+
+	if (sub->type != V4L2_EVENT_FRAME_SYNC || sub->id)
+		return -EINVAL;
+
+	return v4l2_event_subscribe(fh, sub, 16, NULL);
+}
+
 static const struct v4l2_subdev_core_ops vfe_core_ops = {
 	.s_power = vfe_set_power,
+	.subscribe_event = vfe_subscribe_event,
 };
 
 static const struct v4l2_subdev_video_ops vfe_video_ops = {
@@ -2080,6 +2135,8 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		v4l2_subdev_init(sd, &vfe_v4l2_ops);
 		sd->internal_ops = &vfe_v4l2_internal_ops;
 		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+		if (vfe->res->hw_ops->frame_start)
+			sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
 		if (i == VFE_LINE_PIX && vfe->res->is_lite == false)
 			snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d_%s",
 				 MSM_VFE_NAME, vfe->id, "pix");
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index c402ef170..621eee07d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -77,6 +77,7 @@ struct vfe_output {
 	};
 	enum vfe_output_state state;
 	unsigned int sequence;
+	bool frame_started;
 
 	int wait_reg_update;
 	struct completion sof;
@@ -118,6 +119,7 @@ struct vfe_hw_ops {
 			     struct vfe_line *line);
 	void (*vfe_wm_stop)(struct vfe_device *vfe, u8 wm);
 	void (*vfe_buf_done)(struct vfe_device *vfe, int port_id);
+	void (*frame_start)(struct vfe_device *vfe, int port_id);
 	void (*vfe_wm_update)(struct vfe_device *vfe, u8 wm, u32 addr,
 			      struct vfe_line *line);
 };
@@ -286,6 +288,7 @@ int vfe_enable_v2(struct vfe_line *line);
  * @wm: Write master id
  */
 void vfe_buf_done(struct vfe_device *vfe, int wm);
+void vfe_frame_start(struct vfe_device *vfe, int wm);
 
 /*
  * vfe_get_output_v2 - Get vfe output line
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388..92d536986 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5044,6 +5044,18 @@ void camss_buf_done(struct camss *camss, int hw_id, int port_id)
 	}
 }
 
+void camss_frame_start(struct camss *camss, int hw_id, int port_id)
+{
+	struct vfe_device *vfe;
+
+	if (hw_id < 0 || hw_id >= camss->res->vfe_num || port_id < 0)
+		return;
+
+	vfe = &camss->vfe[hw_id];
+	if (port_id < vfe->res->line_num && vfe->res->hw_ops->frame_start)
+		vfe->res->hw_ops->frame_start(vfe, port_id);
+}
+
 /*
  * camss_register_entities - Register subdev nodes and create links
  * @camss: CAMSS device
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index ef45eea00..6a17ec027 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -178,6 +178,7 @@ int camss_vfe_get(struct camss *camss, int id);
 void camss_vfe_put(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
 void camss_buf_done(struct camss *camss, int hw_id, int port_id);
+void camss_frame_start(struct camss *camss, int hw_id, int port_id);
 void camss_reg_update(struct camss *camss, int hw_id,
 		      int port_id, bool is_clear);
 

