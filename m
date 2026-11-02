Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793591579;
	b=Pnzo/Hv2r0sWN8EqbWffaLIAYxtn03O2aqgf6EwhTcI+3M4yQaxEdMYLBhu8QhjutMm2
	 M5EPHRCWYwYXXHXTdhN6y+dNPc1BighoTZwpnrOB61wdmnpP49G6XLVP3y7j9rcIYM5RL
	 Vie/gw9KN87cQWJFGi/zbe9gezuUZCmtVf2/vNd4o3FlcOz72HlxTB6R9Axe83Le4xNi2
	 BL5LwznHUI33DbKIP263Bcvv18g2HDEC0H7Xb46pnByBa/Sz7F+ubx5iuK81m+Ll7rV7q
	 eVWE6bli2k02GjfV3uVqnWN2GHcNnOTyHGBXKh6TRISgkfckQZmEFcIp3YxLnGbaNQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GEgLVAromPaUrH1jitVPbv7vIRjTpekHb9MijwFJEpQ=;
	b=c8fQOXWp8D7RlwVdm5Lze8bZ/eiAvx2MyZNzirIv8FSOMbFkydUDcRmuvYwqL17WhMaE
	 znsZMacJNAirwMXMV3ouoq5jHj1T1I0J6lxn110Hy4gqD1i5v/+9x9NBfyDQdYREKrYep
	 vbbgB9fQw5dBgnpWSqG7nAArWGbWztU105TzqWa8qArjA9JPvHHEcg7CHqadrljkIwevC
	 OeB5SQjqgx7NjEIfQa9SlOa3T67XSnoDyAZZHsicQGX6+nnN7FrgM2FXz7ysJe3d+oz2N
	 yaMT+0CP4pX9KATu/TZH7ewiqSeQC5j7unp8el5xod9caYx+POS/klvYbndpZES7lMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MWK818G;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDF9606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DDF9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MWK818G
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1430550a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793591578; x=1794196378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GEgLVAromPaUrH1jitVPbv7vIRjTpekHb9MijwFJEpQ=;
        b=0MWK818Gv28nmlTZO12RnNRMhWyi8fhmOjVscQpXx2kRVjMDCPCCYP3SdiYSpuC5nS
         TdyNkGi10iE0/mH9ZaUN7V9IC+2sGF92ZZn2ClOlgB3IwitEfOVVu6Wq+Brh8QW35R15
         iEObQv7eQbKWb/IhUaQ7/TPyavQJodNOn1emrXPgD1XL1P7vJcD8ZQSyhlgH7mOJtwrq
         7ukFqIHqtIzvhT1GN+a3/5yefuvLScma8vNQV9B9X7FrWItWXfdYc+Y1nvDTSVvUKQgz
         JPNZrPZAGwZqavUPdIbenu0Oc33XFW9s4PVxNkmDxWrT2vhnI24F8iRPWdg+DOhMYZVs
         EcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591578; x=1794196378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEgLVAromPaUrH1jitVPbv7vIRjTpekHb9MijwFJEpQ=;
        b=2Cr6UASL0S2RkqxliuN7CnkaTXnfyJ+o71RS/p3KZblMxk/zPrlifehRy5c2gOIR4Q
         0wom+j/wtCKkCUkQmRMhSfYzOnCBKaaXsd2yxsdfAy4PIJ2ucaiBUSIC12zZTPREqKi0
         ljb6sq2DW4HZv5tUd1nYANikjq0ybjXMWXL1hUkoe/XY+AlE4cEMkK4fb+6AEXNYeOlX
         zvirC/ro6VQYl4a3+1cdfIvuC3k1ST48CIP/s6dUY8eBz9uNnlpwxP4XNPcJCct2XwK6
         Cw261EOi1FG46FVUM1ZNnsi9loNvCx1vrFod9ti5rpWN7Vh0I06Q7nrvoLM/XIbZwijO
         X4GQ==
X-Forwarded-Encrypted: i=1; AKwUvByM7aoiErbyc1CTys8NuOG0z2/x0XgNmxA/1xp4/3ier+DESozdmMtp3aER5hyOYGoNQ4IXwtFhtHRdpOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YCnMg8KuJ837uP1kwM5HtbR1wGOHkGlH6EvedBMurNYpMOGAv
	0pUdu3x2qFqe+v2HOmkwBD+hSHjn00jxyVQirOQTk5DOrbz31IBgKHWg
X-Gm-Gg: AYBFou07pMA482wWlza22QH0E9hPrmW1w4bKF8YmppWVygjguhTdWZHImaoplGYpyK5
	ZAlti//cCFVM5vYcBCMqOyKlppnQ3QEun3KT0P+ZtrkDtHFL32RbxryoqFed50F6MciaGBv3TBB
	75HHpzVa9fvupcZiIkmnudnVEJHDGe2pB6zJS3EaVxE1BFL/ebX0dVH7m2aEgFwep1XZlDdvN0H
	/L2a8StTEdsHw34P/+Zq3K06zBC3rD+GKTFbh112NDUfHDnT3VOppZV4xg2Wvy7VP+S7lRueqIp
	/M0tQNtAeSsP2+9kaefOKogmAS2TvDkea4qda85TDJlSV+kTHEsCdMMQz+UsNvwTp6Q9Xs56dkV
	FVxrn8cueJMymcq9yeC/Z9PBppt7iKMUfqdqryAwIhtWq/kyyd4fAzE+R/BGvA9ZLZhOY6+5Ad3
	99QRL0w4f/FTXqNT4JO7zD+kYbe4EbUppNPMyoClLqd9lhlB2mbB+fYjdI4LCpS511EYmk3w/9r
	9F+FfDlyG5RnWLbfsayZNwXKjCWC51g78rga9RxtIQx0mrXz3XKZuYb6SHXoJvRMbR+oniU2KMW
	Nv15BSGFXt5iIrqr82akHLO4457sl7nfMuHB5HneHJCPZgZi2LkwIWkFepKZhxDHNlc=
X-Received: by 2002:a17:90b:580d:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3ae8970e5e9mr6935025a91.11.1793591577770;
        Sun, 01 Nov 2026 19:52:57 -0800 (PST)
Received: from localhost.localdomain ([2400:d802:dd7:8000:50b9:9b10:1e19:1f0a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae880b1f71sm6998814a91.4.2026.11.01.19.52.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 19:52:57 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: wesley.cheng@oss.qualcomm.com,
	raoxu@uniontech.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: qcom: Check the return value of qmi_handle_init()
Date: Mon,  2 Nov 2026 11:52:37 +0800
Message-ID: <20261102035237.56253-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
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

qc_usb_audio_probe() overwrites the return value of qmi_handle_init()
with that of qmi_add_server() without checking it. When
qmi_handle_init() fails, it has already freed the receive buffer and
destroyed the workqueue, and qmi->sock may hold an error pointer. If
QRTR is not available, qmi_handle_init() returns -EPROBE_DEFER and
qmi->sock is ERR_PTR(-EAFNOSUPPORT), so qmi_add_server() passes it to
kernel_sendmsg():

  BUG: unable to handle page fault for address: ffffffffffffffb7
  RIP: 0010:selinux_socket_sendmsg+0xa0/0x590
  Call Trace:
   security_socket_sendmsg+0x29/0x50
   __sock_sendmsg+0x43/0x150
   kernel_sendmsg+0xd6/0x180
   qmi_send_new_server+0x1b8/0x2b0
   qmi_add_server+0x165/0x200
   qc_usb_audio_probe+0xf4/0x2e0
   really_probe+0x2b4/0x850

Had the probe gone on, the error and remove paths would call
qmi_handle_release() on the half-initialized handle, which destroys the
workqueue and frees the receive buffer a second time.

Return the error from qmi_handle_init(), so that -EPROBE_DEFER defers
the probe, and check qmi_add_server() as well.

The bug was found with kbound, a static analysis prototype for
ownership mismatches at kernel interfaces, on v7.2.12; it is present in
mainline.

Build-tested with x86_64 and arm64 allmodconfig (W=1, sparse): no new
warnings. Run-tested on QEMU (x86_64, KVM) with KASAN and kmemleak, with
the driver built in and a test module that registers the
q6usb.qc-usb-audio-offload auxiliary device. Without QRTR, the probe
crashes as above without this patch; with it the device is deferred and
removing it again reports nothing. With QRTR the probe succeeds, and
removal reports nothing either.

Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    The bug was found with kbound, a research static analysis prototype.
    The patch, the changelog and the test setup were written with the help
    of an AI coding assistant (Claude); I have reviewed and tested them as
    described above.
    
    The runs were on mainline d135ab453a74; the code this patch touches is
    the same there and in sound for-linus, which it is based on.

 sound/usb/qcom/qc_audio_offload.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index e4bfd43a2488..5ee568e0454c 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1969,8 +1969,13 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 			      QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
 			      &uaudio_svc_ops_options,
 			      &uaudio_stream_req_handlers);
+	if (ret)
+		goto free_qmi_hdl;
+
 	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
 			     UAUDIO_STREAM_SERVICE_VERS_V01, 0);
+	if (ret)
+		goto release_qmi_hdl;
 
 	uaudio_svc = svc;
 
@@ -1987,7 +1992,9 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 
 release_qmi:
 	qc_usb_audio_cleanup_qmi_dev();
+release_qmi_hdl:
 	qmi_handle_release(svc->uaudio_svc_hdl);
+free_qmi_hdl:
 	kfree(svc->uaudio_svc_hdl);
 free_svc:
 	kfree(svc);

base-commit: 56abaa599bbbee5500e166ddb0b5241a00c1f763
-- 
2.53.0

