Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AC64E50B9;
	Mon,  5 Oct 2026 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220597; cv=none; b=ov7cij0J65ThabTRmplv1MkwQuQJbAzWI5fn5DxOYHWXNRxNvCSOqS2Xpp98IsL9qArZmGBkPjV/1Awb6V48LkhBIX/vOR5hN0ZQ3Di7BhkvHvFwKcmrrguDenU4LXmwZW59MDPdzrcsW2QEV2Yo/TXROYSIRamBsQ4eOUNh4Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220597; c=relaxed/simple;
	bh=uJYbVeA2d/vLeZPMg5dBOonjFGP9beuFqeFEPc0Yy/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nmEMYZAuhgu07Y07Elvl27G049d9oppUQU35CXaNxF11vmRLfNzIMy1QlYO4VZc/vyIoVecYbV06Iib9lqs/s97v8f1EAQNkog6rMn5B+O9tC3ILtRPHtpkh1xFIgkPFfF5aK2nMugShGgGQ1XDEUzIKAPzjEELQYOw+Pe+4Moc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dueI2aop; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dueI2aop"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3278A1F00899;
	Mon,  5 Oct 2026 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220595;
	bh=YyR7Pg9tARS9hhwBZN8G9pK77PaZDn8OCMSreMfPa80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dueI2aopjtw7I7YFGkYIqEyFOcIr9Hm097KGeUTfknvtZWyZEc++x1sYocvAOqeNe
	 JzKhy5y3DsNapypoXxqXgRPhxI9nzUw+OLMvJXLHuVgKgTGh2HkStRb1UKXJwFxcyT
	 XAtF2c62+EjtrtpeMZGz7q8BduDogX/bcESZRWYVf6h2JRyAJdFS3jPlYmfLBnp35W
	 48mjeCbGlqrXhBFUYeWl3I2E8lMGDAhJ7qJBgIFOSE0BupEjThh1bs7SFQC+vWukeU
	 PzK73bhqw0j9J9uWRfv4n2Fd9HdwxWCcZPv5gbJm1y7GAAGgi9Ii6VkKZO6aMjqLsg
	 k1LihIdRtFc0A==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:13:45 +0200
Subject: [PATCH 15/74] media: qcom: camss: csid: Configure the stream on
 every s_stream
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-15-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2763; i=bod@kernel.org;
 h=from:subject:message-id; bh=OoN/Wr7IqWQPvXdm3zVLFQgGCMhHnMKbzRIzonG9vWI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sLPaVrQEpC93llEqKIkBy6iy5QXPlS/g3CJ
 f+M71c1f32JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbCwAKCRAicTuzoY3I
 OhG1D/9T1yw9c1OjZ3c4ZXSteX5kVUDmAU9QdFNR/Z+ddeFNfRsg07ahIWCCtoT0gCX/tEKd+Ft
 1FeTlTX5Imb4L1db3c5rGohsIuXAJEzQ49lbgTfSZOD1qPT4jPM8Pul2zIMSgYNfzT66mlEbF8r
 UL0Fi5amlTc6eqtpOWsiJocZj0TaQ160wdesdMcuaX6OevH78DUlxHJn5yZ+eVXDZ+5nXdSOqCt
 SsnjaBDHcs5Y9lXEJIfUyHquFrcPTk7rBqYirBtMGj5LRuFMJNOFHKlWdUE7lGUJdOPp2LpoUSC
 DU40abZJ8vpmAc+deD7X3TFHHuZnQca9bZZX7ylTpCdv1c2l++EXaD4JIgf24naZgflD7cF5vKL
 HyTw8haCuCB2tpdyeCW9ctrBUOjXCvqaO0psV4Hpf/ifBZwg8JYtR8oNUmDeObot3yfOaTeFNb2
 GjvMqkQtZ7+LkhxSVdGfSXNqR5vVKGcmCYsVL7tmcKm3NoydGx1R8wPvxqkFZ48NLn0VdqAbfXL
 cKWmIpmoIPjTl/isD7YXEVjEBc2vuoPn90lHY5E0AUbHYTUsTF/RJDDtRLQjkdFIC9c67JqGWT2
 bkWDEs79gcrWd6BH6xb/gBVAJRNDiiT3L1mXdp6Daw9Tk3K/nSwXY1UvqmLEBJs8h1wGVM2AoKt
 6fDM7QJmGCiRptQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

csid_set_stream() only calls configure_stream() when need_vc_update is
set, and need_vc_update is only set at power on and on a CSID link
change. Stopping and restarting a stream while the pipeline stays
powered, as userspace does when it keeps the video node open across
STREAMOFF and STREAMON, therefore breaks the CSID in two ways:

- STREAMOFF does not stop the CSID: the paths it enabled keep running
  after the VFE has stopped.
- The following STREAMON does not configure the CSID: a format set
  between the two streams is never programmed, and the CSID runs with
  the previous stream's configuration.

need_vc_update was added so that several video nodes streaming through
one CSID would configure it only once. Its counterpart in
video_stop_streaming() was removed by commit 25f18cb1b673 ("media: qcom:
camss: Remove use_count guard in stop_streaming"). Drop the rest of it and
configure the stream on every s_stream.

Fixes: 3c4ed72a16bc ("media: camss: sm8250: Virtual channels for CSID")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 9 +--------
 drivers/media/platform/qcom/camss/camss-csid.h | 1 -
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 48459b46a981b..645e02ad6b9b1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -721,8 +721,6 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 			return ret;
 		}
 
-		csid->phy.need_vc_update = true;
-
 		enable_irq(csid->irq);
 
 		ret = csid->res->hw_ops->reset(csid);
@@ -777,10 +775,7 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 			return -ENOLINK;
 	}
 
-	if (csid->phy.need_vc_update) {
-		csid->res->hw_ops->configure_stream(csid, enable);
-		csid->phy.need_vc_update = false;
-	}
+	csid->res->hw_ops->configure_stream(csid, enable);
 
 	return 0;
 }
@@ -1306,8 +1301,6 @@ static int csid_link_setup(struct media_entity *entity,
 		else
 			csid->phy.en_vc &= ~BIT(local->index - 1);
 
-		csid->phy.need_vc_update = true;
-
 		dev_dbg(dev, "%s: Enabled CSID virtual channels mask 0x%x\n",
 			__func__, csid->phy.en_vc);
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac8..53f43ae7b9327 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -69,7 +69,6 @@ struct csid_phy_config {
 	u8 lane_cnt;
 	u32 lane_assign;
 	u32 en_vc;
-	u8 need_vc_update;
 };
 
 struct csid_device;

-- 
2.55.0

