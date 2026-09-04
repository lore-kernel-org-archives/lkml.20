Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B262425892
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505094; cv=none; b=KnFYHzdSJLpAGNmrWDjwX8UNfvCKV3sACGED10a75kOo55sB7FhtskFxVCZMH4YsP18Yec/oO1PdQE5ryZYWXU2uoTRwh3R9Ef6E2Ic3Qug3OirAO5b1zVXVuD3QKxYgkeoXhqPGhAJynZnGbqXeFw+g6Xqes3nZPAtMwi6Dbr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505094; c=relaxed/simple;
	bh=lve08jujf/eMvpsshRzTzwRftklUvvZDXztfOjmPd1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mpKoWPo7N9icrSoOZm0/7oW1usoqUH2/lgDj20NNb6ZuZPbB2v5LVzmpePoVQfELd6z4Jvj05NcK6SYhtmx4wonZXdp9Y9ClTCPSU8L5ZMKprOCcKKSqs/MXxw5KbnpA6CEZm9lEzvxvFjX9enQ3SbhN1Mi9erx9aYgaevIi9+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdB0ukcj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFQc6xLh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AdB0ukcj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFQc6xLh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684635oi2751977
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 06:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iq+pltkssLijjF8JMOOy4XYsugaeaREAGo7D2xyU9U8=; b=AdB0ukcjGmd2XZ2J
	d97weZ9NSHUUCiC9J+SBv3cs3O1DA6I9rCAnsNQkiDi1HmZutTzytvCt2TvoV6i6
	r8uGiQHMfuvhhqa8JCkqXUi2GGvBe5OZeHjI9MOjHVP4QQsGF6xOx1sz/5fz+hSE
	M9BrnTyZ38/b4Rohr/vCqqvQw0s47y4cmwfjds/DCUbdTEk+XxOgpjD5aTWJKQZG
	K1zB/+6LUAuv+4Io4p8RbCfCYh1TfvRymPreDPJ14dnQJW4pGTVEO9kOgznr/8ts
	tTtS7Xm81xCuXDMs2VMl5xZe8hsmAjwHMyvx4NiMvS6+uNdi3QVbH8sHnq7h1Wes
	0RJV+A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxjeta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:58:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39af92138f9so1145158a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 23:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788505089; x=1789109889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iq+pltkssLijjF8JMOOy4XYsugaeaREAGo7D2xyU9U8=;
        b=SFQc6xLhJUis+kr+Qr5xvv7sTyrCEIiUG7Pjsla/GBWIvvP3qTLyPpTxb8PwRFC5Ca
         7rKBODDcVUrsXyFVVFIKjGYXc11ziExHgbu0BzdiwLMYpCqgNGJe3W3ywucX4JX88i5p
         1gu6c0r2CvdQRV5CMeeYgirfo2zrmaceeo9k24LqGxq6j7P1El8U+800yQJ9SJk6qyXm
         cjJW4bD00RRr2Z2JGsPpYuAuI5NwelpjmLrgVjNF2KdNbhLmlOCHWBltP3UIcZ3EHBuK
         8aSZbufE7YHpvRTpjsGcmzp4f/g64i/cQ7kFEqJBuHo8n/P7VNly4KyCQPEjQvBxYmE0
         Ra8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788505089; x=1789109889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iq+pltkssLijjF8JMOOy4XYsugaeaREAGo7D2xyU9U8=;
        b=WUrpU24XHOVzNkaP6Zdd6HDqFpMQbKS/+BMBdjG6OoOkeof1ekzLCnLk6Qkft7UjXt
         SC96j3LOVT9+wBLLe/MxFXjVNGTQKA9aF3OJml6ONWE2PqQp6GeEExf+pCoBtpRkOu8f
         0ydWNXt1nJx/e/WjvtgdUWIYxlANu3RhcPD8aKMTz8N4ulfFUtLvKSs0C3lUlmCmMCHb
         BT+wXSkj7lR+xXsI6oonUq78DfGe/VaMxHEzfEsNkdqe74rHt2sldcX9RYU5geatE6//
         NnfyrsVaW3y/eISUfnEzi2Tsbf5rZU8xCYUaFSD0f3weBmnXNyqc+Ygah49nvUSc4GPE
         jmqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLYeDRWITnyqjrF5mTLCZ3CSmStBDX0kdA6RNR3rT9QvRiXYWAleqrNCXFGU+c6SSpwcTjUCajcZBR4Ns=@vger.kernel.org
X-Gm-Message-State: AFuF++nILdyYEGRCZoI5Y8HEr5f7UVkeoFrXpTnzB9gdbNUWd5U8M9rL
	VEl1CnGPuZWCiVQ5SojAUwVo3KLKrIPmnaZqELknO0hS/KHgLeiWRNc6YBJBtrn72FhoWE0MKL7
	dvZ+7fmOwdjHJXO5y19TkXShPsyop/3K4s6roBixGGjnIOuYCUVu/ZrC0xmH+cK4I0s4=
X-Gm-Gg: AYBFou2So2zFtzvP/luArFZy+nIO1P/Suz1YOzn01JfFjvVpy9E9b4Oq/OxDg/YeWTc
	4yWZ1Ixsw2UV0tbcN1nUNi85P8t02frZ5k+jtf9nZuYKLkiNZ11YbH26GQqUxqtOWv4xjeMpQHD
	SXXvcbqpiM+Ex/coaBq/3VSlUV9fiAjWySQBQR+g0x2s3OaUrlDCrsVa3xT24NvVYY+reJI2Xxz
	FxlM0vHMcvjQfT6RZ4wPn6P2AukGwgeLV1koQoih6IczkF9nlx4aIlNUIOkHEkr952FRcDKF9mX
	yqBcz/9AZTYHEKRTjGy2tEYegXbgOnwFvUj2FN5FVu189U+RvAMU8bSGrWhrqrEh5SXFBMpmhjA
	g13GLtY5rUNZwbDCtkaeQdgo8Ousn7vgmZWu1H6zU8opPzeYUEg9X
X-Received: by 2002:a17:90b:4b04:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-39b07f33963mr13166063a91.2.1788505088227;
        Thu, 03 Sep 2026 23:58:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4b04:b0:396:4ce0:6400 with SMTP id 98e67ed59e1d1-39b07f33963mr13166028a91.2.1788505087695;
        Thu, 03 Sep 2026 23:58:07 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm4760900eec.2.2026.09.03.23.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:58:07 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 23:57:52 -0700
Subject: [PATCH v3 3/4] ALSA: usb-audio: qcom: tag sideband endpoints
 before ring allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-16k_offload_v1_b4-v3-3-135928dc2408@oss.qualcomm.com>
References: <20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com>
In-Reply-To: <20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 1McBCqWnXDc7ILQhG2T0cB-fRHwyJUyN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2MyBTYWx0ZWRfX+KR3e4FfffFy
 fy7EA1d2JxlK07mSGWcMJQvUcuqjJ1hnIZaBMDPWeIFUzXzfDRov8htK4BiBEyvIpbVjBJ3vd7G
 dd3+Fl3D/yiAi2xlIfGBe8r6rY2ErFk=
X-Proofpoint-GUID: 1McBCqWnXDc7ILQhG2T0cB-fRHwyJUyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2MyBTYWx0ZWRfX/LiMc2FiJZwA
 SEy2cEEfOlSdvyrzxXwy/u1T16VeQvcPGxKtcKgvek0ZVczzJJvnRK6EC5MaIGe6PEdut6cl2Ox
 FMfCsTUNEfEgsrr/TPACbosKq+s2/BPKtXZQ2LGoAggZGyXAaw/GHwrt0a02drl3IAAPhrIDwJe
 NcabUFiCja5mvbnlEcKE4A8HxAmeXV73oDvka7EV4D2ebhFbaRWD4QRYaqbG7sSjElxEjPVDSTD
 MJx1A77xCs5kaFbAM9sSVRahRQX6hQpXVxCHK+mFjQJurjMULIGt3or4KBcLcVFSrpikhhB9Iig
 EZCMsvAFccerLWVS8PkOz4gGZT041TpxwkPrEi5Ci1/pJ7cb287Cj/SA+B0dG08MASC095Xzafg
 BAL8OMLNkDOT4bgdwvmSu4evBFtwXc1GeSu0r3B95CheHaaGLdH/1rYXioIIEmkeOzmtsNWLlIW
 sY6AwuisEi2sMGbPzgQ==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a9a6c02 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mfbS_Oyj0OiJrwsacs8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040063

xhci_endpoint_init() picks the ring's segment pool based on whether the
endpoint has already been tagged via xhci_sideband_add_endpoint():
sideband-tagged endpoints get their ring allocated from the offload
client's own segment_pool instead of the shared xhci->segment_pool, so the
buffer reported to the ADSP over QMI is guaranteed to come from a page
meant to be ADSP-visible.

xhci_sideband_add_endpoint() must therefore run before the endpoint's
transfer ring is first allocated (i.e. before snd_usb_endpoint_prepare()
triggers xhci_endpoint_init()) for that pool selection to apply to the
first allocation. Move the xhci_sideband_add_endpoint() calls out of
uaudio_endpoint_setup() and into enable_audio_stream(), before
snd_usb_endpoint_prepare() is called for the data and sync endpoints,
and unwind them on the new error paths.

At that point in the setup sequence dev->ep_in[]/ep_out[] are not yet
populated, since the endpoint's altsetting has not been activated, so
usb_pipe_endpoint() cannot be used to find the usb_host_endpoint. Add
uaudio_find_host_endpoint(), which resolves it directly from the
interface's altsetting descriptor table instead.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c | 111 +++++++++++++++++++++++++++++++-------
 1 file changed, 93 insertions(+), 18 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 1b8877b8ee62..f09dae8334d0 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -132,6 +132,7 @@ struct uaudio_dev {
 
 	/* xhci sideband */
 	struct xhci_sideband *sb;
+	struct dma_pool *segment_pool;
 
 	/* SoC USB device */
 	struct snd_soc_usb_device *sdev;
@@ -942,6 +943,45 @@ static void uaudio_dev_release(struct kref *kref)
 	wake_up(&dev->disconnect_wq);
 }
 
+/**
+ * uaudio_find_host_endpoint() - look up usb_host_endpoint for a snd_usb_endpoint
+ * @subs: usb substream owning the target snd_usb_endpoint
+ * @endpoint: sync or data snd_usb_endpoint to resolve
+ *
+ * usb_pipe_endpoint() resolves via dev->ep_in[]/ep_out[], which are only
+ * populated once usb_set_interface() has activated the endpoint's altsetting
+ * (i.e. after snd_usb_endpoint_prepare() has run for it). Looking that up
+ * beforehand returns NULL.
+ *
+ * Instead, look the endpoint up directly in the interface's altsetting
+ * descriptor table, which is populated once at enumeration time and stays
+ * valid regardless of which altsetting is currently active.
+ *
+ * Return: matching usb_host_endpoint, or NULL if not found.
+ */
+static struct usb_host_endpoint *
+uaudio_find_host_endpoint(struct snd_usb_substream *subs,
+			  struct snd_usb_endpoint *endpoint)
+{
+	struct usb_host_interface *alt;
+	struct usb_interface *iface;
+	int i;
+
+	iface = usb_ifnum_to_if(subs->dev, endpoint->iface);
+	if (!iface)
+		return NULL;
+
+	alt = usb_altnum_to_altsetting(iface, endpoint->altsetting);
+	if (!alt)
+		return NULL;
+
+	for (i = 0; i < alt->desc.bNumEndpoints; i++)
+		if (alt->endpoint[i].desc.bEndpointAddress == endpoint->ep_num)
+			return &alt->endpoint[i];
+
+	return NULL;
+}
+
 /**
  * enable_audio_stream() - enable usb snd endpoints
  * @subs: usb substream
@@ -959,8 +999,9 @@ static void uaudio_dev_release(struct kref *kref)
 static int enable_audio_stream(struct snd_usb_substream *subs,
 			       snd_pcm_format_t pcm_format,
 			       unsigned int channels, unsigned int cur_rate,
-			       int datainterval)
+			       int datainterval, unsigned int card_num)
 {
+	struct usb_host_endpoint *data_ep = NULL, *sync_ep = NULL;
 	struct snd_pcm_hw_params params;
 	struct snd_usb_audio *chip;
 	struct snd_interval *i;
@@ -998,17 +1039,49 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 			goto detach_ep;
 		}
 
+		data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint);
+		if (!data_ep) {
+			dev_err(&subs->dev->dev, "data ep # %d not found\n",
+				subs->data_endpoint->ep_num);
+			ret = -ENODEV;
+			goto detach_ep;
+		}
+
+		ret = xhci_sideband_add_endpoint(uadev[card_num].sb, data_ep,
+						  uadev[card_num].segment_pool);
+		if (ret < 0) {
+			dev_err(&subs->dev->dev,
+				"failed to add data ep to sec intr: %d\n", ret);
+			goto detach_ep;
+		}
+
 		if (subs->sync_endpoint) {
+			sync_ep = uaudio_find_host_endpoint(subs, subs->sync_endpoint);
+			if (!sync_ep) {
+				dev_err(&subs->dev->dev, "sync ep # %d not found\n",
+					subs->sync_endpoint->ep_num);
+				ret = -ENODEV;
+				goto remove_data_ep;
+			}
+
+			ret = xhci_sideband_add_endpoint(uadev[card_num].sb, sync_ep,
+							  uadev[card_num].segment_pool);
+			if (ret < 0) {
+				dev_err(&subs->dev->dev,
+					"failed to add sync ep to sec intr: %d\n", ret);
+				goto remove_data_ep;
+			}
+
 			ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
 			if (ret < 0)
-				goto detach_ep;
+				goto remove_sync_ep;
 		}
 
 		ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
 		if (ret < 0)
-			goto detach_ep;
+			goto remove_sync_ep;
 
-		dev_dbg(uaudio_qdev->data->dev,
+		dev_dbg(&subs->dev->dev,
 			"selected %s iface:%d altsetting:%d datainterval:%dus\n",
 			subs->direction ? "capture" : "playback",
 			subs->cur_audiofmt->iface, subs->cur_audiofmt->altsetting,
@@ -1020,6 +1093,11 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 
 	return 0;
 
+remove_sync_ep:
+	if (sync_ep)
+		xhci_sideband_remove_endpoint(uadev[card_num].sb, sync_ep);
+remove_data_ep:
+	xhci_sideband_remove_endpoint(uadev[card_num].sb, data_ep);
 detach_ep:
 	snd_usb_hw_free(subs);
 
@@ -1141,14 +1219,6 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 
 	memcpy(ep_desc, &ep->desc, sizeof(ep->desc));
 
-	ret = xhci_sideband_add_endpoint(uadev[card_num].sb, ep);
-	if (ret < 0) {
-		dev_err(&subs->dev->dev,
-			"failed to add data ep to sec intr: %d\n", ret);
-		ret = -ENODEV;
-		goto exit;
-	}
-
 	sgt = xhci_sideband_get_endpoint_buffer(uadev[card_num].sb, ep);
 	if (!sgt) {
 		dev_err(&subs->dev->dev,
@@ -1212,8 +1282,9 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 		goto exit;
 
 	/* event ring */
-	ret = xhci_sideband_create_interrupter(uadev[card_num].sb, 1, false,
-					       0, uaudio_qdev->data->intr_num);
+	ret = xhci_sideband_create_interrupter(uadev[card_num].sb, 1,
+					       uadev[card_num].segment_pool,
+					       false, 0, uaudio_qdev->data->intr_num);
 	if (ret < 0) {
 		dev_err(&subs->dev->dev, "failed to fetch interrupter\n");
 		goto put_offload;
@@ -1638,7 +1709,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		ret = enable_audio_stream(subs,
 					  map_pcm_format(req_msg->audio_format),
 					  req_msg->number_of_ch, req_msg->bit_rate,
-					  datainterval);
+					  datainterval, pcm_card_num);
 
 		if (!ret)
 			ret = prepare_qmi_response(subs, req_msg, &resp,
@@ -1813,12 +1884,14 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 		if (!segment_pool)
 			goto free_sdev;
 
-		sb = xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR, segment_pool,
+		sb = xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR,
 					    uaudio_sideband_notifier);
 		if (!sb) {
 			dma_pool_destroy(segment_pool);
 			goto free_sdev;
 		}
+
+		uadev[chip->card->number].segment_pool = segment_pool;
 	} else {
 		sb = uadev[chip->card->number].sb;
 		sdev = uadev[chip->card->number].sdev;
@@ -1855,10 +1928,11 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 	return;
 
 unreg_xhci:
-	segment_pool = sb->segment_pool;
+	segment_pool = uadev[chip->card->number].segment_pool;
 	xhci_sideband_unregister(sb);
 	dma_pool_destroy(segment_pool);
 	uadev[chip->card->number].sb = NULL;
+	uadev[chip->card->number].segment_pool = NULL;
 free_sdev:
 	kfree(sdev);
 	uadev[chip->card->number].sdev = NULL;
@@ -1918,12 +1992,13 @@ static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
 	 * This is to accommodate for devices w/ multiple UAC functions.
 	 */
 	if (chip->num_interfaces == 1) {
-		struct dma_pool *segment_pool = dev->sb->segment_pool;
+		struct dma_pool *segment_pool = dev->segment_pool;
 
 		snd_soc_usb_disconnect(uaudio_qdev->auxdev->dev.parent, dev->sdev);
 		xhci_sideband_unregister(dev->sb);
 		dma_pool_destroy(segment_pool);
 		dev->sb = NULL;
+		dev->segment_pool = NULL;
 		dev->chip = NULL;
 		kfree(dev->sdev->ppcm_idx);
 		kfree(dev->sdev);

-- 
2.34.1

