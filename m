Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794358626;
	b=yLUF722fF4z938O+vkib7FgRzudpX/kDjRB0dNDGiToMafdUVMQUDPzu2X/5LKOCQhNJ
	 DBjgPfeoNsle5zoSRn3HQHKp1Ca3GZt7ntKY0HUNeUp5NFJSZ6cEjKDbcXRXpbiizcWCl
	 iz9RAel31pb+iPmUQQuxU5UOPqTX9aaCa0FRjfMDyUQhNDgVXC4FwMosOiyfyKVlZF6Z9
	 nQ9V0xguFgOFS2mX1bwqh4ARjQ9h9KeYT4dFxrUcGLIkrZBuIBZRs+yprv5IEbz7qtenv
	 pIVQbHm8oHIktOykFyHqggrRyw0oFZ0gmLOG1JfVe/9RWoa5z7LylGtGE1rUmDdfLSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794358626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=yiKuo8XiHGZbGLQTvMzCv4TDV6gtZYRHfBfU4L7mPHQ=;
	b=0R5UXhvqVC5DqwAO9hEw/UdX3A5zqUbhifpOaKUygdTFy36JYeMTSB/zZkrxWgkqoP7s
	 XJwX/Xp2/kVNuNPHUnUK+haFIhPqQexL1Hmufiuy+jeXaFkdy2m60/GQYrvrt2iAJJ/8f
	 kqipdxrmMQ7QPbdG2XbE8FdSWoSeK4qZy6XViJcAS7PmQbGAqB7TjsZS1RFEZj8lOeO2K
	 Tl8ovIUShueQWLWSqLm0usaVrLNsNwNYrws4orvtC1iJHy0okbIlt3FAK77ufnnLCS+H2
	 cedWfzODgFbugv2OWbnDeVQ13Vqg1cQ2bHNVrjuwUYcgB0AjIP4HVRLFc+Fa3gwTVXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jogCD7lz;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7044560A2629
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7044560A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jogCD7lz
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so3506124a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794358625; x=1794963425; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yiKuo8XiHGZbGLQTvMzCv4TDV6gtZYRHfBfU4L7mPHQ=;
        b=jogCD7lzVyUCtowhrydRmQhNcp6cYxHzk/xxgv/qgJiCj3wn22LqZgTBj8psOr7Sb1
         JpiyTTf0xbKgnyDBoeA78PK4rSkoNoxKr5JFdSpYAuBO4A58oHRGrQgCCqJZpExht+X1
         iWQAznxYuutbAnIlUh5ubnAjvERSynXfexxijRUXHlZLiGtcBNe6+QSc6dVPhoNyrsJa
         sCRH6agPK3mLMb4e8ycFxS2MoJ+yHBggfFyC/mrcYsMuiPF3mpArgud6UYlDdhTe9pHp
         zD9U0peab7oQEaoJeDJ4/1102lI9wclORM+NvTxlIId0Ietd/5vxveP/NPfwMEF3igDf
         kS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794358625; x=1794963425;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yiKuo8XiHGZbGLQTvMzCv4TDV6gtZYRHfBfU4L7mPHQ=;
        b=UWXW70VhxkIFrKzrs9BfiEPANd/RC6BvNLY4DpP0iWvAgD1HZihq17MPnbrWRYgHsM
         1aJIoryFVcGRNx6icbKu02WCC5aV43nu0AlaR+kduMaxYFwkYil/UfY/GyuX700/9ZfR
         wObc7D04A3fhYSNg3bOmcQKuDFR3Xoni7Ek5ltiBCrVqo8LlxXB925KfSCH+2hnWgSwi
         X8RshxcqamtQb6i7uuPTlNHg9i+BSO0BsLhvifkBh8Zp1bDXs86QsgomQZ3Vhfp9sOAi
         dLAYJ/Tf8N0CxbiAdakti3dYvG+gCbGaxm1139ecmG02tDAxkXVWjn5WPjax4gcpSVS/
         aLRQ==
X-Forwarded-Encrypted: i=1; AL+hErH9ligYBXzhx+rtk3ng/jP9NVHP2EKIKuX3jTm1KH1W+PcYNAy7Iza/tVQIM8fs/btvROOtG6KyuF6zmek=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n9M668+sH8UyhXY/K+WpXc/VpotNDhGRbw1yosCO7tnFS4LGA
	zY8XzxzSlTA3oXjvYtlrH+IGZD/KagmGed9gTZiqaYZF8/v2EfiRTb4d
X-Gm-Gg: AYBFou1CB56WVgFwGlMst8e3AReiprJptAYDm7yK2RlRdT+lqTTaUYENVN1KeJXO6+U
	uQpPmNQU42ALuiI3Ix7CC1RWDBi0Joe0dbbVsXY2w1wgvmY9UOCfUuJQz1hPs8Ht5KqQ067M9Yq
	FCdgfctDfGoEzSKjumYSE20N3ABdYwvb7VVDVbsMnaVTVTZ31Bz0VrXxVNejiTV3mY4SphLkGsD
	bpHmw/HFw5IdHUaPfVIjtol7DSmC3LHjNNqHW9HAifsVb9Hi/ydegnEKtTM74i0dCSwBgIE3Gxa
	n6jKpaIXTck+HjLU+/w6Arde1rJNl1FW8nU3IlFOKANU2OGKL9wZG5I4CsxdtlkfNK09ISY/cFQ
	c5A6lOz0nmA5V3c68N7+fvSiD0kqqGbLbLlK/n4egZ/Q6HvQsxOJ1arc9g/u9Rk83UVtBIpuJLC
	BAFeNDoGRREphkon6eeensaQLIZQSGjQq3S5aCGjOje2i+PYZ4r4/KOvXTMJMVIAzhmcNSoeyaN
	4j3K3pHv2ZM/cGN56goMEhUIU6u1MIPI4jclo5L2ImHP40bHtFrN2gU3+YZwJNLzj58ISZzEFjz
	D5q/poOd6m4zLDIZY90muSbFc41TDaOirQAYZSlqlPFidXb7
X-Received: by 2002:a17:907:3d0a:b0:c42:4750:8d33 with SMTP id a640c23a62f3a-c5066b46008mr53840366b.28.1794358624563;
        Tue, 10 Nov 2026 16:57:04 -0800 (PST)
Received: from localhost ([188.146.174.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6916sm177361266b.7.2026.11.10.16.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:57:03 -0800 (PST)
Date: Wed, 11 Nov 2026 00:56:40 +0000
Message-ID: <179435860052.4109564.9298992817657762327@gmail.com>
From: Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com>
To: syzbot+f9f5333782a854509322@syzkaller.appspotmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, media-ci@linuxtv.org
Subject: Re: [PATCH] media: mxl111sf: initialize state->d and fe_lock in probe
In-Reply-To: <6aeca161.99d0dbd8.3801b.50e8@mx.google.com>
References: <7cbccdb8-870c-46c4-bc61-2e40d8c4b4db@mail.kernel.org>
 <6aeca161.99d0dbd8.3801b.50e8@mx.google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git c03c1a14507dfaf8b856c2608f9ac216021fc222

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 6404eb74d..fc4010b6e 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -431,8 +431,6 @@ static int mxl111sf_lgdt3305_frontend_attach(struct dvb_usb_adapter *adap, u8 fe
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -502,8 +500,6 @@ static int mxl111sf_lg2160_frontend_attach(struct dvb_usb_adapter *adap, u8 fe_i
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -587,8 +583,6 @@ static int mxl111sf_lg2161_frontend_attach(struct dvb_usb_adapter *adap, u8 fe_i
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -674,8 +668,6 @@ static int mxl111sf_lg2161_ep6_frontend_attach(struct dvb_usb_adapter *adap, u8
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 2 : 1;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -749,8 +741,6 @@ static int mxl111sf_attach_demod(struct dvb_usb_adapter *adap, u8 fe_id)
 
 	pr_debug("%s()\n", __func__);
 
-	/* save a pointer to the dvb_usb_device in device state */
-	state->d = d;
 	adap_state->alt_mode = (dvb_usb_mxl111sf_isoc) ? 1 : 2;
 	state->alt_mode = adap_state->alt_mode;
 
@@ -935,8 +925,6 @@ static int mxl111sf_init(struct dvb_usb_device *d)
 	if (mxl_fail(ret))
 		pr_err("failed to get chip info during probe");
 
-	mutex_init(&state->fe_lock);
-
 	if (state->chip_rev > MXL111SF_V6)
 		mxl111sf_config_pin_mux_modes(state, PIN_MUX_TS_SPI_IN_MODE_1);
 
@@ -1068,7 +1056,9 @@ static int mxl111sf_probe(struct dvb_usb_device *dev)
 {
 	struct mxl111sf_state *state = d_to_priv(dev);
 
+	state->d = dev;
 	mutex_init(&state->msg_lock);
+	mutex_init(&state->fe_lock);
 	return 0;
 }
 
