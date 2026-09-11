Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CC93F4DD6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107752; cv=none; b=d2E/drMRjW1AwQCcaQ1a4UJFBZIf8PwEkkz6RkiETH2aGSdTwPppyB2WfhSGUaxeDyLzKiiQB7YqY0XuPdULpPj+7GI5XLb31iRt9E3U3R2KNIpkj0TNzxh250rPykP24SFb1Y2S/eqQCCjevuCZpANOqmyvFMWYJULM/M/TEbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107752; c=relaxed/simple;
	bh=SHXduOI9FxBC5qrnXe0AobISI4kX7mmk/8TchfJBGtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N36rVxYxfRMhXCdG6fSpvqh/uV/L8Z6wEDYGyiGAY1MtQr/qmF1P5D31re/SLXHBMJIWIoPNmyFIV0mK+e554t5vOb59/wQQ3z3/yd61/lO4rtVTsHHQzBIXfjyfD5kqbCoZXbrc+thtvdlbyqQNLWijIMjpeUB8YLKGFe0vboE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTn9dUnZ reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTn9dUnZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4veqG2986907
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ov8DQ7Trrg6ycqk1f4fnXC/EySQzfAKPrnyDSG2tUmo=; b=XTn9dUnZDhS/E/RP
	FGv9wmzidE4yzbs45tVOFN8vS4XSRhjT4TmB0z2Ckyk9OLnKLanZHaimDGmct8Ro
	QpGvTRzNDTrnJbjrHRRQLfs+5OpVAYl3y6Gm332p/RFoNHbKaSfXzCcTYQlGqtv+
	N7fhHMqzNmvy4nYh0r+zeP63WmZxxRljkIzokWFbFaUc/NQxUp+Xv1mp30lgBH0N
	ifVk4ZbC2uERDsDHGXE2oP0PvfNaQFVjQpLJzUAd3NXTMiu+m9RpDDO2pu75+Fqo
	yv0qPxt+n14+IkkN9GheulAjpV83/6A1JKcb8a0QSHzDMAZ7CcGI8v9GEcaidze3
	HHOvLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2aby1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:22:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939a00c45easo86560185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107746; x=1789712546;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ov8DQ7Trrg6ycqk1f4fnXC/EySQzfAKPrnyDSG2tUmo=;
        b=pNt2y6d8dOifPdAZg6dXiH8AZRC1+tvCBXWwc24+zfaXzeFDFVBmfi/H1k7iZ1105I
         Kp+16mcJAnHBo+HTqh2kf9M1ysLmZyL0LzKOg3SnwvVZua7bN19Gi67ITZyV1ImmM54y
         2uMR6oCHsRzBZe3/gITtPQjZ+wFxhOHt/dWXXvnEgmthcCZEGiEJ766BK+hdy7rf9ZcA
         CN73hZuJsrGj8cmMNWQcOG4uvfuMs6EzKeMgyoaSOzviJMBEzVIW4k1YAXEslDnGvIri
         Hx3B9lE3FVlsC9cNEqqQIrs2ZoqPdMMMODWp2Lf4oNMNZuiUE/LnjvkLb1ynGuU2HtDy
         7JFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3eExkWJaAszQgsgOtp5oYiLBav5wrZv26ziQuylcmffWkmVrX/9MJ7HuYtazpbJjmkODN+mRbbFuGLVY=@vger.kernel.org
X-Gm-Message-State: AFuF++kZpBUJo60bzwexRWNWyZFIbH2UHxI98hzcOipWiMalWq6yj3XM
	+lZOSVi94u5t3k3z6XtAabBG5wTGXtWHetWdre1kyisT3zg4zM43QBhiR1pRFI8UBeOEUCvFBdX
	NNEEWEuLsuTN2GcBD+tMDaPVhTstUM5DC2zvIGE6FxOeF1wBxB2eb0MXgmeYl0QkXm08=
X-Gm-Gg: AYBFou2S0Y89DX2dyn60u/bWWVoJjEAThhPJrJMcSBl/GJND97I9GNtWUep0RY18ObX
	UD7p3UmYa/Kn/YXtLCQyYjDtp9zdYRzRWiTyJkQ1JRvLnadsI2k219rXYnaBwwTqBh5ZXYODeqx
	eDjqcRRVS5ajy2rnCR1xmpsnWXCfq+96cwoBM+siKCUpUQXzyNL2Or4JRGqjsic/CNYeT9/05WQ
	pa1ctpiYrCtf3pjRjEMvvNRJ0Zpq0AUxknQMXaqJEzd8Vr1FTAN3Lk+lEVQTGwG4iEXImf+ZtHd
	KwRbKe/Rb5X2LR0C4gmPuZZA+beheqkTcHZ79D+W5x/UucQ0nI5i3ek8HVs=
X-Received: by 2002:a05:620a:4686:b0:939:922b:3de1 with SMTP id af79cd13be357-939ea2a3baemr354694485a.44.1789107745885;
        Thu, 10 Sep 2026 23:22:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:922b:3de1 with SMTP id af79cd13be357-939ea2a3baemr354691285a.44.1789107745354;
        Thu, 10 Sep 2026 23:22:25 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm3681969f8f.17.2026.09.10.23.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:22:24 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH 4/8] media: qcom: camss: Add streams API support in CSID subdevice
Date: Fri, 11 Sep 2026 09:22:09 +0300
Message-Id: <20260911062213.195007-5-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa39e22 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=TOnICaHA50gGwtKooHQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: EqPhyqfvVFeZaUo5g285LaLC9uptVSDq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX03h8pIqJoMHh
 SMusTQItz4SUapW6m52EUqGdbpyNaxaRn66ELAjKCeuJtStuUDcvHJk2RgF96fZ+6wAVbcYCDht
 fFa+7gpRYwOj2cRLzFRdPbPpS31k5Nc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX9U+Nq3zf2HW9
 exRz+FPBg7JsDffXhSL4eLSTnEserV793wrVgDVKY7M8KwgtsnNU7pz6l+cSwB+8WlcKF561I7z
 TjJGZ/OFHFcQzkwz9WOqnCS/Mx3CyvBsBXJYi2gB1cbDgCIJ5BaPgcD73pwJrgWIlpwBTXeNpJ4
 LTQPIXnP2XqJZQKOTwniprcLjPEtgDXapVWTIO7J5d/yfTOCKKDT8Px1bcI4lbL4bOG18xBhPve
 Ezt3ekSIkRcf7e7Spf1Nhi12MDeUjmtHzy2+Ty9uIC+oE6NkHDn79f6XBv/HSndDdsOqGb48i/W
 nfual7RKHpiGAAzzPB3Ur+ewOpsR5ovLzL1smzCrxNVXTKpQWt5FY4nh6ALIltImIEnqLDSH9ja
 95/rdGsRkA7FxyTn5/jHv/ZN4jPpT77N7PfdXPqfssefIj8ukKolBrcKzSW3R8cJxsAVISbfoq5
 yNSrKbWRNY2fkeKLIfA==
X-Proofpoint-ORIG-GUID: EqPhyqfvVFeZaUo5g285LaLC9uptVSDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110086

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Add the V4L2 subdev streams API to the CSID driver: per-source-pad
enable/disable_streams pad ops, VC/DT discovery via get_frame_desc on
the remote sink pad, and a routing table that routes a single incoming
sink stream to every source pad by default (remappable via
set_routing for multi-VC sensors).

Active streams are tracked per pad via a per-pad enabled_streams[]
bitmask, so that enable/disable_streams correctly propagates to the
CSIPHY only on first arrival/last departure of a sink stream, and
multiple source-pad consumers can share a single propagated sink
stream without redundant or colliding propagation.

csid_init_state() caps the number of default routes to
MSM_CSID_MAX_SRC_STREAMS - 1 for non-lite CSIDs, matching the 3 usable
RDI pads on full-IFE CSIDs (the 4th/pix pad is non-functional).
msm_csid_register_entity() mirrors the same is_lite check for the pad
count itself, so non-lite CSIDs no longer register a pix source pad
that no route ever targets.

csid_pad_enable_streams() rejects enabling with -ENOLINK when there is
no remote sink link and the test generator is disabled, matching the
equivalent check the legacy csid_set_stream() already performs.

msm_csid_register_entity() assigns the ctrl handler's lock as the
subdev's state_lock before v4l2_subdev_init_finalize(), when the test
pattern control is present. Without this, the test-pattern S_CTRL
handler and the streams API's active-state accessors serialize on two
independent locks despite both touching csid->testgen.enabled,
allowing a concurrent S_CTRL(TEST_PATTERN) and stream enable/disable to
race.

This is opt-in per CSID instance via the new streams_enable resource
flag; no platform sets it yet, so CSIDs continue to use the legacy
non-streams subdev ops unchanged.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid.c    | 494 +++++++++++++++++-
 .../media/platform/qcom/camss/camss-csid.h    |   2 +
 2 files changed, 491 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 48459b46a981..ce4b07c0c1c2 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -842,7 +842,7 @@ static void csid_try_format(struct csid_device *csid,
 
 		break;
 
-	case MSM_CSID_PAD_SRC:
+	default:
 		if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED ||
 		    csid->testgen_mode->cur.val == 0) {
 			/* Test generator is disabled, */
@@ -1338,10 +1338,476 @@ static const struct v4l2_subdev_ops csid_v4l2_ops = {
 	.pad = &csid_pad_ops,
 };
 
+/*
+ * csid_get_stream_csi2_desc - Discover the virtual channel and data type
+ *			       used by a given sink stream, from an
+ *			       already-fetched frame descriptor
+ * @frame_desc: Frame descriptor fetched via .get_frame_desc from the remote
+ *		subdev linked on the sink pad
+ * @sink_stream: Sink-side stream number to look up
+ * @desc_csi2: Returns the discovered virtual channel/data type on success
+ *
+ * A frame descriptor with a single entry means the remote only exposes one
+ * stream (e.g. a single-VC sensor), which feeds every CSID source pad, so
+ * that entry is used regardless of @sink_stream.
+ *
+ * Return true if a matching entry was found, false otherwise
+ */
+static bool csid_get_stream_csi2_desc(struct v4l2_mbus_frame_desc *frame_desc,
+				      u32 sink_stream,
+				      struct v4l2_mbus_frame_desc_entry_csi2 *desc_csi2)
+{
+	unsigned int i;
+
+	if (frame_desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2 || !frame_desc->num_entries)
+		return false;
+
+	if (frame_desc->num_entries == 1) {
+		*desc_csi2 = frame_desc->entry[0].bus.csi2;
+		return true;
+	}
+
+	for (i = 0; i < frame_desc->num_entries; i++) {
+		if (frame_desc->entry[i].stream == sink_stream) {
+			*desc_csi2 = frame_desc->entry[i].bus.csi2;
+			return true;
+		}
+	}
+
+	return false;
+}
+
+/*
+ * csid_get_stream_vc_dt - Discover the virtual channel and data type to
+ *			   program for a given sink pad/stream, falling back
+ *			   to @format_dt when no frame descriptor is available
+ * @csid: CSID device
+ * @state: V4L2 subdevice state
+ * @remote_pad: Remote pad linked on the CSID sink pad, or NULL if unlinked
+ * @pad: Source pad number the caller is enabling a stream on
+ * @format_dt: Data type derived from the sink format, used as a fallback
+ *	       and sanity-checked against the discovered data type
+ *
+ * Return the discovered virtual channel/data type, or {0, @format_dt} if
+ * not discovered
+ */
+static struct v4l2_mbus_frame_desc_entry_csi2
+csid_get_stream_vc_dt(struct csid_device *csid, struct v4l2_subdev_state *state,
+		      struct media_pad *remote_pad, u32 pad, u8 format_dt)
+{
+	struct v4l2_mbus_frame_desc_entry_csi2 desc_csi2 = { .dt = format_dt };
+	struct v4l2_mbus_frame_desc fd = { };
+	u32 sink_stream;
+
+	if (!remote_pad ||
+	    v4l2_subdev_call(media_entity_to_v4l2_subdev(remote_pad->entity),
+			     pad, get_frame_desc, remote_pad->index, &fd))
+		return desc_csi2;
+
+	if (v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0, NULL, &sink_stream))
+		return desc_csi2;
+
+	if (!csid_get_stream_csi2_desc(&fd, sink_stream, &desc_csi2)) {
+		dev_warn(csid->camss->dev,
+			 "Failed to find CSI2 descriptor for sink stream %u, using vc=%u dt=%u\n",
+			 sink_stream, desc_csi2.vc, desc_csi2.dt);
+		return desc_csi2;
+	}
+
+	if (desc_csi2.dt != format_dt)
+		dev_warn(csid->camss->dev,
+			 "Sink stream %u frame desc dt=%u differs from format dt=%u, using dt=%u\n",
+			 sink_stream, desc_csi2.dt, format_dt, desc_csi2.dt);
+
+	return desc_csi2;
+}
+
+/*
+ * csid_pad_enable_streams - Enable one or more streams on a source pad
+ * @sd: CSID V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of v4l2 streams to enable
+ *
+ * The v4l2 core only calls this on a source pad (v4l2_subdev_enable_streams()
+ * rejects sink pads with -EOPNOTSUPP before reaching the driver), so @pad is
+ * not checked here. Each source pad only ever carries stream 0.
+ *
+ * The shared sink stream(s) are propagated upstream only once, on the
+ * transition from no active sink streams to at least one, so that a second
+ * consumer of the same shared sink stream never triggers a second, redundant
+ * propagation to the sensor. The Rx front-end is likewise only configured
+ * once, on that same transition.
+ *
+ * Return 0 on success, -ENOLINK if there is no remote sink link and the test
+ * generator is disabled, or another negative error code otherwise
+ */
+static int csid_pad_enable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
+	struct media_pad *remote_pad = media_pad_remote_pad_first(&csid->pads[MSM_CSID_PAD_SINK]);
+	unsigned int hw_port = pad - MSM_CSID_PAD_FIRST_SRC;
+	const struct csid_format_info *format;
+	struct v4l2_mbus_frame_desc_entry_csi2 desc_csi2;
+	u64 sink_streams, propagate_mask;
+	int ret;
+
+	if (!csid->testgen.enabled && !remote_pad)
+		return -ENOLINK;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSID_PAD_SINK,
+						       &streams_mask);
+
+	if (!csid->enabled_streams[MSM_CSID_PAD_SINK]) {
+		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
+			/*
+			 * sd->state_lock is aliased to csid->ctrls.lock, and is
+			 * already held here by the v4l2_subdev_enable_streams()
+			 * caller, so use the lock-free variant to avoid
+			 * self-deadlocking on the same mutex.
+			 */
+			ret = __v4l2_ctrl_handler_setup(&csid->ctrls);
+			if (ret < 0) {
+				dev_err(csid->camss->dev,
+					"could not sync v4l2 controls: %d\n", ret);
+				return ret;
+			}
+		}
+
+		hw_ops->configure_rx(csid);
+	}
+
+	/* Sink streams already active elsewhere don't need re-propagating. */
+	propagate_mask = sink_streams & ~csid->enabled_streams[MSM_CSID_PAD_SINK];
+	csid->enabled_streams[MSM_CSID_PAD_SINK] |= sink_streams;
+	csid->enabled_streams[pad] |= streams_mask;
+
+	format = csid_get_fmt_entry(csid->res->formats->formats,
+				    csid->res->formats->nformats,
+				    csid->fmt[pad].code);
+	desc_csi2 = csid_get_stream_vc_dt(csid, state, remote_pad, pad, format->data_type);
+
+	hw_ops->enable_stream(csid, hw_port, desc_csi2.vc, desc_csi2.dt);
+
+	if (propagate_mask && remote_pad) {
+		ret = v4l2_subdev_enable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
+						 remote_pad->index, propagate_mask);
+		if (ret) {
+			csid->enabled_streams[MSM_CSID_PAD_SINK] &= ~propagate_mask;
+			csid->enabled_streams[pad] &= ~streams_mask;
+
+			hw_ops->disable_stream(csid, hw_port);
+
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * csid_sink_streams_in_use - Compute the subset of sink streams still
+ *			      referenced by a source pad other than @pad
+ * @csid: CSID device
+ * @state: V4L2 subdevice state
+ * @pad: Source pad to exclude from the check
+ * @sink_streams: Candidate sink streams to check
+ *
+ * Return the subset of @sink_streams still referenced by some other source
+ * pad
+ */
+static u64 csid_sink_streams_in_use(struct csid_device *csid, struct v4l2_subdev_state *state,
+				    u32 pad, u64 sink_streams)
+{
+	u64 in_use = 0;
+	unsigned int i;
+
+	for (i = MSM_CSID_PAD_FIRST_SRC; i < MSM_CSID_PADS_NUM; i++) {
+		u64 other_streams = csid->enabled_streams[i];
+		u64 other_sink_streams;
+
+		if (i == pad)
+			continue;
+
+		other_sink_streams = v4l2_subdev_state_xlate_streams(state, i, MSM_CSID_PAD_SINK,
+								     &other_streams);
+		in_use |= sink_streams & other_sink_streams;
+	}
+
+	return in_use;
+}
+
+/*
+ * csid_pad_disable_streams - Disable one or more streams on a source pad
+ * @sd: CSID V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of v4l2 streams to disable
+ *
+ * The v4l2 core only calls this on a source pad (v4l2_subdev_disable_streams()
+ * rejects sink pads with -EOPNOTSUPP before reaching the driver), so @pad is
+ * not checked here. Each source pad only ever carries stream 0.
+ *
+ * A sink stream is only disabled, and propagated upstream to disable it there
+ * too, once no source pad references it any more.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_pad_disable_streams(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    u32 pad, u64 streams_mask)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
+	struct media_pad *remote_pad = media_pad_remote_pad_first(&csid->pads[MSM_CSID_PAD_SINK]);
+	unsigned int hw_port = pad - MSM_CSID_PAD_FIRST_SRC;
+	u64 sink_streams, disable_sink_streams;
+	int ret = 0;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSID_PAD_SINK,
+						       &streams_mask);
+
+	/* Keep a sink stream active as long as any other source pad still uses it. */
+	disable_sink_streams = sink_streams &
+				~csid_sink_streams_in_use(csid, state, pad, sink_streams);
+
+	if (disable_sink_streams && remote_pad) {
+		ret = v4l2_subdev_disable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
+						  remote_pad->index, disable_sink_streams);
+		if (ret)
+			dev_err(csid->camss->dev,
+				"Failed to disable stream on remote pad: %d\n", ret);
+	}
+
+	hw_ops->disable_stream(csid, hw_port);
+
+	csid->enabled_streams[pad] &= ~streams_mask;
+	csid->enabled_streams[MSM_CSID_PAD_SINK] &= ~disable_sink_streams;
+
+	return ret;
+}
+
+static const struct v4l2_mbus_framefmt csid_default_format = {
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.width = 1920,
+	.height = 1080,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+};
+
+/*
+ * csid_set_routing - Handle setting of routing table
+ * @sd: CSID V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @which: TRY or ACTIVE routing
+ * @routing: Routing table to set
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_set_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    enum v4l2_subdev_format_whence which,
+			    struct v4l2_subdev_krouting *routing)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	unsigned int i;
+	int ret;
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csid->enabled_streams[MSM_CSID_PAD_SINK])
+		return -EBUSY;
+
+	for (i = 0; i < routing->num_routes; i++)
+		if (routing->routes[i].source_stream != 0)
+			return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING |
+					   V4L2_SUBDEV_ROUTING_NO_N_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &csid_default_format);
+}
+
+/*
+ * __csid_get_stream_format - Get pointer to per-stream format structure
+ * @csid: CSID device
+ * @sd_state: V4L2 subdev state
+ * @pad: pad from which format is requested
+ * @stream: stream from which format is requested
+ * @which: TRY or ACTIVE format
+ *
+ * Same as __csid_get_format(), but honors @stream for TRY-state lookups.
+ * For ACTIVE state, csid->fmt[] is indexed by pad + stream. @stream is
+ * always 0 and @pad selects the RDI channel (0-3).
+ *
+ * Return pointer to TRY or ACTIVE format structure
+ */
+static struct v4l2_mbus_framefmt *
+__csid_get_stream_format(struct csid_device *csid,
+			 struct v4l2_subdev_state *sd_state,
+			 unsigned int pad, u32 stream,
+			 enum v4l2_subdev_format_whence which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_state_get_format(sd_state, pad, stream);
+
+	if (pad == MSM_CSID_PAD_SINK)
+		return &csid->fmt[MSM_CSID_PAD_SINK];
+
+	return &csid->fmt[pad + stream];
+}
+
+/*
+ * csid_streams_get_format - Handle get format by pads subdev method
+ * @sd: CSID V4L2 subdevice
+ * @sd_state: V4L2 subdev state
+ * @fmt: pointer to v4l2 subdev format structure
+ *
+ * Return -EINVAL or zero on success
+ */
+static int csid_streams_get_format(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_format *fmt)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *format;
+
+	format = __csid_get_stream_format(csid, sd_state, fmt->pad, fmt->stream, fmt->which);
+	if (!format)
+		return -EINVAL;
+
+	fmt->format = *format;
+
+	return 0;
+}
+
+/*
+ * csid_streams_set_format - Handle set format by pads subdev method
+ * @sd: CSID V4L2 subdevice
+ * @sd_state: V4L2 subdev state
+ * @fmt: pointer to v4l2 subdev format structure
+ *
+ * Return -EINVAL or zero on success
+ */
+static int csid_streams_set_format(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_format *fmt)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_route *route;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && csid->enabled_streams[MSM_CSID_PAD_SINK])
+		return -EBUSY;
+
+	format = __csid_get_stream_format(csid, sd_state, fmt->pad, fmt->stream, fmt->which);
+	if (!format)
+		return -EINVAL;
+
+	csid_try_format(csid, sd_state, fmt->pad, &fmt->format, fmt->which);
+	*format = fmt->format;
+
+	/* Propagate the format from the sink stream to every source stream it feeds */
+	for_each_active_route(&sd_state->routing, route) {
+		struct v4l2_mbus_framefmt *src_format;
+
+		if (route->sink_pad != fmt->pad || route->sink_stream != fmt->stream)
+			continue;
+
+		src_format = __csid_get_stream_format(csid, sd_state, route->source_pad,
+						      route->source_stream, fmt->which);
+		if (!src_format)
+			continue;
+
+		*src_format = fmt->format;
+		csid_try_format(csid, sd_state, route->source_pad, src_format, fmt->which);
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops csid_streams_pad_ops = {
+	.enum_mbus_code = csid_enum_mbus_code,
+	.enum_frame_size = csid_enum_frame_size,
+	.get_fmt = csid_streams_get_format,
+	.set_fmt = csid_streams_set_format,
+	.set_routing = csid_set_routing,
+	.enable_streams = csid_pad_enable_streams,
+	.disable_streams = csid_pad_disable_streams,
+};
+
+static const struct v4l2_subdev_video_ops csid_streams_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_ops csid_streams_v4l2_ops = {
+	.core = &csid_core_ops,
+	.pad = &csid_streams_pad_ops,
+	.video = &csid_streams_video_ops,
+};
+
+/*
+ * csid_init_state - Initialize the routing table for the streams API subdev
+ * @sd: CSID V4L2 subdevice
+ * @state: V4L2 subdev state
+ *
+ * source_stream is always 0: each source pad MSM_CSID_PAD_FIRST_SRC + i
+ * links to its own independent downstream subdev, and a link's sink side is
+ * validated against the implicit stream 0 exposed by any subdev without
+ * V4L2_SUBDEV_FL_STREAMS (see v4l2_link_validate_get_streams()) — every
+ * downstream VFE line is such a subdev.
+ *
+ * All source pads route from sink_stream 0 by default, fanning the single
+ * incoming stream out to every port; a multi-VC source is supported by
+ * remapping each route's sink_stream via .set_routing, leaving
+ * source_pad/source_stream untouched.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state)
+{
+	struct csid_device *csid = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev_route routes[MSM_CSID_MAX_SRC_STREAMS];
+	struct v4l2_subdev_krouting routing = { };
+	unsigned int num_routes;
+	int i, ret;
+
+	/* The full IFE has only 3 rdi's and pix output is not functional */
+	if (csid_is_lite(csid))
+		num_routes = MSM_CSID_MAX_SRC_STREAMS;
+	else
+		num_routes = MSM_CSID_MAX_SRC_STREAMS - 1;
+
+	for (i = 0; i < num_routes; i++) {
+		routes[i].sink_pad = MSM_CSID_PAD_SINK;
+		routes[i].sink_stream = 0;
+		routes[i].source_pad = MSM_CSID_PAD_FIRST_SRC + i;
+		routes[i].source_stream = 0;
+		routes[i].flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+	}
+
+	routing.num_routes = num_routes;
+	routing.routes = routes;
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing, &csid_default_format);
+	if (ret)
+		dev_err(csid->camss->dev, "Failed to set routing: %d\n", ret);
+
+	return ret;
+}
+
 static const struct v4l2_subdev_internal_ops csid_v4l2_internal_ops = {
 	.open = csid_init_formats,
 };
 
+static const struct v4l2_subdev_internal_ops csid_streams_internal_ops = {
+	.init_state = csid_init_state,
+};
+
 static const struct media_entity_operations csid_media_ops = {
 	.link_setup = csid_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
@@ -1360,13 +1826,18 @@ int msm_csid_register_entity(struct csid_device *csid,
 	struct v4l2_subdev *sd = &csid->subdev;
 	struct media_pad *pads = csid->pads;
 	struct device *dev = csid->camss->dev;
+	bool streams_api = csid->res->streams_enable;
+	unsigned int num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM : MSM_CSID_PADS_NUM - 1;
 	int i;
 	int ret;
 
-	v4l2_subdev_init(sd, &csid_v4l2_ops);
-	sd->internal_ops = &csid_v4l2_internal_ops;
+	v4l2_subdev_init(sd, streams_api ? &csid_streams_v4l2_ops : &csid_v4l2_ops);
+	sd->internal_ops = streams_api ? &csid_streams_internal_ops
+					: &csid_v4l2_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 		     V4L2_SUBDEV_FL_HAS_EVENTS;
+	if (streams_api)
+		sd->flags |= V4L2_SUBDEV_FL_STREAMS;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
 		 MSM_CSID_NAME, csid->id);
 	v4l2_set_subdevdata(sd, csid);
@@ -1400,17 +1871,28 @@ int msm_csid_register_entity(struct csid_device *csid,
 	}
 
 	pads[MSM_CSID_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
-	for (i = MSM_CSID_PAD_FIRST_SRC; i < MSM_CSID_PADS_NUM; ++i)
+	for (i = MSM_CSID_PAD_FIRST_SRC; i < num_pads; ++i)
 		pads[i].flags = MEDIA_PAD_FL_SOURCE;
 
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	sd->entity.ops = &csid_media_ops;
-	ret = media_entity_pads_init(&sd->entity, MSM_CSID_PADS_NUM, pads);
+	ret = media_entity_pads_init(&sd->entity, num_pads, pads);
 	if (ret < 0) {
 		dev_err(dev, "Failed to init media entity: %d\n", ret);
 		goto free_ctrl;
 	}
 
+	if (streams_api) {
+		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED)
+			sd->state_lock = csid->ctrls.lock;
+
+		ret = v4l2_subdev_init_finalize(sd);
+		if (ret) {
+			dev_err(dev, "Failed to finalize subdev: %d\n", ret);
+			goto media_cleanup;
+		}
+	}
+
 	ret = v4l2_device_register_subdev(v4l2_dev, sd);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register subdev: %d\n", ret);
@@ -1420,6 +1902,7 @@ int msm_csid_register_entity(struct csid_device *csid,
 	return 0;
 
 media_cleanup:
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 free_ctrl:
 	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED)
@@ -1435,6 +1918,7 @@ int msm_csid_register_entity(struct csid_device *csid,
 void msm_csid_unregister_entity(struct csid_device *csid)
 {
 	v4l2_device_unregister_subdev(&csid->subdev);
+	v4l2_subdev_cleanup(&csid->subdev);
 	media_entity_cleanup(&csid->subdev.entity);
 	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED)
 		v4l2_ctrl_handler_free(&csid->ctrls);
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 90ee611b9092..a312103cf86d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -184,6 +184,7 @@ struct csid_hw_ops {
 
 struct csid_subdev_resources {
 	bool is_lite;
+	bool streams_enable;
 	const struct csid_hw_ops *hw_ops;
 	const struct parent_dev_ops *parent_dev_ops;
 	const struct csid_formats *formats;
@@ -209,6 +210,7 @@ struct csid_device {
 	struct v4l2_mbus_framefmt fmt[MSM_CSID_PADS_NUM];
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *testgen_mode;
+	u64 enabled_streams[MSM_CSID_PADS_NUM];
 	const struct csid_subdev_resources *res;
 };
 
-- 
2.34.1

