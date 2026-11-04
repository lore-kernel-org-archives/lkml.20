Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778147;
	b=Qh7Ywn/Hn71pRaHlVNpus97gqfEUn65UyfYBH95j0qSabE3An7unCTIwL/pX98SlMIBo
	 wb3xT/DGke3CTxWZD/9DO4pNbhfWbRg8n2bwJxF/lO2h0xXQx4NZWMgyE/RMGZYiCI0fH
	 PJXynAdUNxbK9CJza86DdXWXT3AT71KwBGGddkLTobxfwSnGtr9BaOwMtVOvCHZADAoso
	 LvNzHEjvlqFFcU3OxDLdbcorVox1EMstA6/y9+HY45SoZy48KUd765pzNryoD7DEd4+FX
	 dyaOj58dg/7GsMa8QzUPXITAqjPK7o72t2w4qU93rp1Miem0jqhFleZeaShUh1UIeGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ywH8oMKlX3jURbfZOh+Ks/EFVKolkyAyAwEMCJeFd2Q=;
	b=l1TyhGmTyz61FspAih0W/eaPvg4ksJ+Z5SDWW1KAyI6RrL+Dvl4X5zAs5FSjpKWTLWRe
	 Nj8Gj4VWwJoCgytH1bm7zDyZ++FvI5oD213HKoWB5vVi4y/qmAvI9IZHT0rENkC/z88ra
	 C+rI+Dnn9YpV+tEh67PDwzoZt0Y2L00o2iCjbQ1aUPANzxEFG882bW1JIG8LFKDnyJQ4A
	 RTMHrz9TAnw+O5aXAFUF4zXr3uNzjffQiJfNgWNaO24mqKvlAb/cO55LSy/rrQD8ccJUl
	 +LxhNss4zm6QneyItFYKVxoObJRhPxl+Lj0IJ9fsvb/Tu8uolELx+uzb/FCjPJBFU0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DpKyaGe;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4144606D807
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4144606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DpKyaGe
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a8cc11ac42so545543c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778146; x=1794382946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywH8oMKlX3jURbfZOh+Ks/EFVKolkyAyAwEMCJeFd2Q=;
        b=0DpKyaGeelhqhK2VnYs46HrdUzesWLRZfRJMpxsYlXLJfFzF8EcddpY8RtqVyvHT+f
         tfiH3hjXHQbDJ9x82BGbO/9IbqSX8HiA3bzRD8cZUzlzp7rjNXhO7EPV4mF2RCW+OIKI
         H+XkeaqccD2kbJ1tj36g/VyOiv/0mlRaBt5jSlAUzEvCakkK4z/+lYc6CTncQktehuWA
         /+GSGNTZO38C4wbB8KcKw9o++AU30XfMdPElbWPWpOdY8ISO9fBxv23Az1OE1ul8hDIi
         3lhVrJuLFddh4/1sLboE136iaqVLBMWNi7c/dr9kPrnqoWtiErXslU41gTOjQaorcBI8
         U1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778146; x=1794382946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ywH8oMKlX3jURbfZOh+Ks/EFVKolkyAyAwEMCJeFd2Q=;
        b=Zu1UNSw3MD1MYijR7Ar4gJ89Y8troch3eOVR9zYpA8RGernm7jU9kNLX3hsG52LtqN
         g+MpRcOGioEe71wmJLLCDQX+McBomFbP/fLsSUYUxeI6iu55nWtOkb1fS7kREE4kQWXO
         HCMe2ffWAF0/lpqLZLhXe9tSMEbdNnSMJy0P7vS8gwSjXgroLmMQen5goQxCVP266Gol
         eOOTkeJTJOoseBZUerEDgDBLgdMsCwZ2fh7vF+rNU0Vu6+eoSh2eqWSxvik8e2m7qeG/
         xdIN2YafVnEHJz2dwfUXh0t3jwXnN7Y+6Vn29qO7aWt8s3zC3ifjYi594/LzL0zU8J/r
         s2vg==
X-Forwarded-Encrypted: i=1; AKwUvBwhPPAH0Jv5qZbjk/UKOcJQc9QVYpM+u9H/6IuDyJeXDy31CQ9cjMMStbmWI5Zsu/pS+MFkdHYPbJOQqR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4B6Sc7hzcgHogDYzNXD0UOzZVNcMB7SWS4aF2ZTakSnlyIWU0
	s1QKbR3RJc7PeIH3sul+W+SkCz4g+T2CHO+PDw2J/AKNtL8GX+2QGt3X
X-Gm-Gg: AYBFou25aCQbif3J/m8PaTPDoz7XvjS8a2+F3LT5pPHAPNjveNJU+sfChlhCi50IJWK
	GX3qPm4rOcBx/Tsr/O0Vv49oOUZ28Vy6AXQ+AmunPPnKhFFAn0xiKA1pippS1O5fgaNaSM0US+X
	CVoFiigNTCNK24M1YwbF2YpGgdb57vA+G+N7ZhdCQzqsVryxAFVUnfFKUNGTmZCmJ9TqCLcWCLO
	CvWOQgT2nouyx+P6JNUZ1KSbeqw0FEvtR5yQadKdcbatr2zLcYdNIzNgXi9/iq3VxH6qk3XAXBm
	RdwX9F9TNPTLVnTnXTVRLc3gNLxaaY0PSn9cuvVnrvF06/V2SPfTDge9hct0VLfEDf85KbFJCMA
	miuhFwzk21Bkm62dVWJurWTZ/Lezh4hfeaURz7lzQMQp1uiFv4OUbA1xsK3V10QsbP2qQYrLsqS
	JFBo2SROrkCS1lGW+P0jHDMitW2We+3/HuL77x8KHESjh0ydr2bvWleax5ghE4G5JFb6liDTbKi
	1wlepIemKxN67y2l2fqn8+TE5pRPplPxqbXBimHbOX5m5CMuZkf9wLqrDQqICc3ujtg7atZc+j5
	tIMBV/0u4wb6eXPCMYKgljeY+/abowFKgQKrWpEaPcqONH2pWii8
X-Received: by 2002:a05:7022:f507:b0:190:d9bb:281f with SMTP id a92af1059eb24-1ac5e3225aamr22064013c88.18.1793778144624;
        Tue, 03 Nov 2026 23:42:24 -0800 (PST)
Received: from 192.168.1.71 ([2402:a00:163:2ce9:c926:5826:36de:3b37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm5318385c88.5.2026.11.03.23.42.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 23:42:23 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	romain.gantois@bootlin.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 2/2] usb: typec: mux: tusb1046: support HPD_IN override
Date: Wed,  4 Nov 2026 13:12:02 +0530
Message-ID: <20261104074202.76712-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261104074202.76712-1-blfizzyy@gmail.com>
References: <20261104074202.76712-1-blfizzyy@gmail.com>
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

For boards where HPD_IN is not asserted by hardware, software can
force it high over I2C using the HPDIN_OVERRIDE bit in the General
register (0x0A).

Add support for the optional ti,hpd-in-override property to force
HPD_IN high when DisplayPort mode is selected. Clear the override
when switching to USB or Safe mode, and preserve the existing
bit value when the property is absent.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 drivers/usb/typec/mux/tusb1046.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/typec/mux/tusb1046.c b/drivers/usb/typec/mux/tusb1046.c
index 34ef81f75693..c21b1f8b9786 100644
--- a/drivers/usb/typec/mux/tusb1046.c
+++ b/drivers/usb/typec/mux/tusb1046.c
@@ -21,6 +21,7 @@
 /* General register bits */
 #define TUSB1046_GENERAL_FLIPSEL BIT(2)
 #define TUSB1046_GENERAL_CTLSEL  GENMASK(1, 0)
+#define TUSB1046_GENERAL_HPDIN_OVERRIDE BIT(3)
 
 /* Mux modes */
 #define TUSB1046_CTLSEL_DISABLED          0x0
@@ -32,6 +33,7 @@ struct tusb1046_priv {
 	struct i2c_client *client;
 	struct typec_switch_dev *sw;
 	struct typec_mux_dev *mux;
+	bool hpdin_override;
 
 	/* Lock General register during accesses */
 	struct mutex general_reg_lock;
@@ -44,6 +46,7 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	struct i2c_client *client = priv->client;
 	struct device *dev = &client->dev;
 	int mode, val, ret = 0;
+	bool dp_active = false;
 
 	if (state->mode >= TYPEC_STATE_MODAL &&
 	    state->alt->svid != USB_TYPEC_DP_SID)
@@ -67,9 +70,11 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	case TYPEC_DP_STATE_C:
 	case TYPEC_DP_STATE_E:
 		mode = TUSB1046_CTLSEL_4LANE_DP;
+		dp_active = true;
 		break;
 	case TYPEC_DP_STATE_D:
 		mode = TUSB1046_CTLSEL_USB3_AND_2LANE_DP;
+		dp_active = true;
 		break;
 	case TYPEC_STATE_SAFE:
 	default:
@@ -80,6 +85,13 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	val &= ~TUSB1046_GENERAL_CTLSEL;
 	val |= mode;
 
+	if (priv->hpdin_override) {
+		if (dp_active)
+			val |= TUSB1046_GENERAL_HPDIN_OVERRIDE;
+		else
+			val &= ~TUSB1046_GENERAL_HPDIN_OVERRIDE;
+	}
+
 	ret = i2c_smbus_write_byte_data(client, TUSB1046_REG_GENERAL, val);
 
 out_unlock:
@@ -131,6 +143,8 @@ static int tusb1046_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	priv->client = client;
+	priv->hpdin_override =
+		device_property_read_bool(dev, "ti,hpd-in-override");
 
 	mutex_init(&priv->general_reg_lock);
 
-- 
2.50.1 (Apple Git-155)

