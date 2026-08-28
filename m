Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9002478E49
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953084; cv=none; b=JiuhIrgiWoS1YE3A4ruBbaiDIeOj5R7OBXiR24rYcVKMlIUZx1U8eSZXEwy6vD0wJS3NjdpCnPtlXuvl7K3HY4D64lJ6Bey6tYJAC2OVtONeSFcwIw4JUGIFLai/7MRIeJZg0sdaIsmva6Jctwzqp868yz/UOSHRFbJ1Yi4SkYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953084; c=relaxed/simple;
	bh=uIuRToF6+GYeUp9B7mtrYh1Ht28jMpvmqqD4otUBEic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pzYZbCfBeIf6dnx0ShxhjmASnooa2HcqN3QlTN4fAnzwCpjF7EflkUj7xYmGSAqm+bDvlVQ2jc5PMaaRz648ua/zIFcDmlOMo9HbwOYr+botMf6ud6UfAd9IjiEg+pVbf+dgdDW2Lq+3hyftaLDRYoVfibIYNiARz0lxm3Ylmi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfscWWmg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T95E4Hk3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfscWWmg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T95E4Hk3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SKZiB84122120
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abItBtmIQwjb67EQFY51LZAO+X7YMVVSbxtZU8hrtr0=; b=LfscWWmgywmJ+L06
	quLxcxKpGSHQwY1IWXYpbR3YL4uBQqz79EPOUlAhBmzgYr5xXz3tZV2ZxsQtVNOX
	0OBf5hrQ84mtDgf2yO/cJ4zJHS7+qpm+hhFvcFC68UCG+eIuy8eDx7d9HmhSlow6
	q0xyITthKr62YKbVD55ATopXV0Ya9SxZ73YIzV9j1c2Ot+Jw30YAr+hHEhK59Izq
	tOqQ85/1jZgFXQHW3lHasEOOR42skokucqmDzkAjUhLeeAbd9zKDPcbGSBHyvxz2
	JIzXSdngaeAM25obE0HQ3JPcrQBTR2fDiyPjAMLqBATrbn0jMXqNdbUdb0MVpia0
	1YdNFw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbhgq859e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:38:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso2824281a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787953080; x=1788557880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abItBtmIQwjb67EQFY51LZAO+X7YMVVSbxtZU8hrtr0=;
        b=T95E4Hk3q0AQDGiKD+su7DDaRI4MCQunnxyXoc207aVED609XA8C86pZugpIUdCEgy
         49Hxna5P3WDkwltP3XM3EupfK9QiXLubnczX5+iFGLWXaych/Wlvt8QJbcrdtd/Jdpq8
         ciL92nQvZzPLUTkQ6Ctgn5vfKUCPW1lSGt8P/wCR0VRf7YYly6hFOC1vvfeVoN7a66WA
         MhXIzA+mVVtxNi0jAx/S6/HaMximBV0XtvIAPkjCydSMT2jp3NEkBZ0e1qiKJgDrzOhy
         OgrM5tUZ7S86e8vDt4gBdnGYWDpFYyoyUhzR+PISoY8x75zUH2Q+nmxZWHzE3a5GYAkS
         ZEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953080; x=1788557880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abItBtmIQwjb67EQFY51LZAO+X7YMVVSbxtZU8hrtr0=;
        b=bZgfLQw18JZn5rThDz23jPMlXO/uQAIFlaD2MitZ219KX0VGsKihPaRbo6lT4QfNd1
         pbkd6cc/MIu4fKZxIpuCMhQcPJzS5R+aYS87mnbWaCCV6hGIi84WF9oixW1zYrxFXZ9A
         26Za/XnqmD59okpuZV/mk7oC2cwrM+5Ugn5qYfQuF0rmXLcWHwaj5yuvA+vXTuYy5mxD
         Jq08OKv+2uOmvbdsIlAgmgJvAdWWgkMxZUq63PYg0tXhh60OCN5Sc+Ue/q7qrcpoij9j
         nGCp1xoNcm+X4wp3YQnhU4J8cSZ7dBkrrdpc6upVKP6XrF4kgRznBEENoyl/a/ySa3wU
         /AWg==
X-Forwarded-Encrypted: i=1; AKwUvBzJslWpxK1ecSPJ86+p5mI/gIROHdss+RGoZJujw0Gb0g7PIZXDYykEDNNfhE9sEWkwDdmTm0ca5SdEo7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lTroCIJFQj8Xpc2CAfMk48NcefE4MoDZbS9oe/uHohFsCWcT15
	IAz8FiYhILJNKPXUdM5fuCNgoFwaUwdv2zcwntaA0ROplm12gXLKvTA12E2ax1cDwppXkkGyWM/
	kKmHfeBf4YQziyb3zS0XX+sRpfeq9GkGTFz1a7j/kJovUrf9YgYq/nFKo4SR1fkVO7os=
X-Gm-Gg: AYBFou1cQDAr62LKx5lkQR9lxpmF01ToiVv2tlPxKQI1dhlftB9BXLfsJdUyxU1y7s2
	32JUvCwUxsrtEJGlrzX/Nrxc458x+GF4q8hNhiGY1bLMEHwqLyiksA1kZ3PutuZT4n+W812lqqp
	zjuCYh4vq7MzjBaJTfvR+0jWhO0nhKT5UuV2EFZFjFqhoHV51GSso+L8+rCC2i91UikpHElbV1g
	rEUw7VctjYtAfVqdmtoOPhNEP7sS/G1MmL36Ilb3aOEU7DUHTQ/JBbbgpIUxF9UhmyH+GrntHZU
	/inHXCciZsHTkc6eVr+ji2p7vv71mIp3s1qeAHjoUBtUovA80Nv7x3zeB9klzp08MFzWWKZfa5j
	liYmRs3CoNPkl08TDZRjrEQ8DCmd1uleWOmac3anHhXREmQoQWRB7
X-Received: by 2002:a17:90b:2c88:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-396d0f52a0amr18763173a91.8.1787953079760;
        Fri, 28 Aug 2026 14:37:59 -0700 (PDT)
X-Received: by 2002:a17:90b:2c88:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-396d0f52a0amr18763126a91.8.1787953079236;
        Fri, 28 Aug 2026 14:37:59 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm5892112c88.11.2026.08.28.14.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:37:58 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:37:55 -0700
Subject: [PATCH v2 3/4] ALSA: usb-audio: qcom: tag sideband endpoints
 before ring allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-16k_offload_v1_b4-v2-3-8a46369ebbb6@oss.qualcomm.com>
References: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
In-Reply-To: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Btu75yIeGCiKM8UXVVnkQiHD5aNlFOgk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfX58O7/pCyGSUp
 T8iDyg149jS3h/1kfbM5zxQM8XjU6Tw3gwne5fyk1D+muCblcPUt8+eRXMgw6n/MugY2g55NZPd
 OErxmc/h5hbh9fw3OHQAVrOFtX8qhd8=
X-Proofpoint-ORIG-GUID: Btu75yIeGCiKM8UXVVnkQiHD5aNlFOgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfXxbY/7tCR98tB
 KkRye2EKSYkieB/qjnnBj7rXzFnkkJ2nkcupcnVts0eNkRb7JolR0wOR99Q7gJ704tVUZLT/U+K
 a4FYXMqjVEoIai0GU8kc08R0XYRMwYh7oeMqC1Y4c7D/dMxrQiJcql2Zbo7hARZIAM2jQi0OPsj
 mJWegmpwExkL990Vp6+Tq17BbfEj2lVWs4RbWH9SMhaqyw2tAszImYZNbkbAyEIGGUWTYrul1ES
 M+wOvc+LXxHC0qEeII6ZwcmpmUfEf+/fcXVQFJxFL5h07NLw5TDqn8HnwagfL+yip21L/d4JAIS
 iLy3lgHjGUlmbkuHKT0M2ZZ3sLjDGXhYB5ct8WMBsuiN8P4S4bWBW36v1PuPyHRnUu0N6fmeOTu
 5hptCoa3dxNaq9xSWniMHzco8/EvK5QI1D00Dvn7ur3yc/5La1GrbVarcX6wjQAWMq0+clzr643
 iSrRe18TsmadFwUQ7Hw==
X-Authority-Analysis: v=2.4 cv=CsGPtH4D c=1 sm=1 tr=0 ts=6a91ffb8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CbMfP9IJxQ5wjS32uxIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280188

xhci_endpoint_init() picks the ring's segment pool based on whether the
endpoint has already been tagged via xhci_sideband_add_endpoint():
sideband-tagged endpoints get their ring allocated from the sideband's
own segment_pool instead of the shared xhci->segment_pool, so the
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
 sound/usb/qcom/qc_audio_offload.c | 93 +++++++++++++++++++++++++++++++++------
 1 file changed, 80 insertions(+), 13 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 1b8877b8ee62..bd3f84a3652b 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -942,6 +942,45 @@ static void uaudio_dev_release(struct kref *kref)
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
@@ -959,8 +998,9 @@ static void uaudio_dev_release(struct kref *kref)
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
@@ -998,17 +1038,47 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
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
+		ret = xhci_sideband_add_endpoint(uadev[card_num].sb, data_ep);
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
+			ret = xhci_sideband_add_endpoint(uadev[card_num].sb, sync_ep);
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
@@ -1020,6 +1090,11 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 
 	return 0;
 
+remove_sync_ep:
+	if (sync_ep)
+		xhci_sideband_remove_endpoint(uadev[card_num].sb, sync_ep);
+remove_data_ep:
+	xhci_sideband_remove_endpoint(uadev[card_num].sb, data_ep);
 detach_ep:
 	snd_usb_hw_free(subs);
 
@@ -1141,14 +1216,6 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 
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
@@ -1638,7 +1705,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		ret = enable_audio_stream(subs,
 					  map_pcm_format(req_msg->audio_format),
 					  req_msg->number_of_ch, req_msg->bit_rate,
-					  datainterval);
+					  datainterval, pcm_card_num);
 
 		if (!ret)
 			ret = prepare_qmi_response(subs, req_msg, &resp,

-- 
2.34.1

