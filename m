Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017534;
	b=cB/0x8y+ExLFXzkgujNkfeRBCKxWlCGRkGGYvn7jImuqE0Z3YDi4Olz3hFaMuWipiOed
	 CPdyERInHlSIplqaF+fAvFPNTRAm7s+QMq/XnCci9Qr3ftEySw8RIVuVi1Ty570j1AAmU
	 /NVlZBZ213u0KPUjukjoCrKxnlCl6Tz7lO0Mppb26RI78G+1sc0rrEUHcpr3+vy3GZxn7
	 UQztcqNajv85Kz9pbQJ1m+tWx3MkVPzqYX4asSxuzM/Cn/OjxJqJINS2ycF9BJxHQsSHu
	 Wp1JEaRzftTBgsQdPQSECNRBNL6H/tPqWMyYtCJR62xHkerwq7D/rOj7IW2+lB3pGVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=agfHd5pdc/EdSGq69ep6mXfkA+pM523Mmt9NosKXhZI=;
	b=gu1Mk0Px5bUJ8HztyHhfA9WdP9NeTHeu3oYDmAQAS/4Zp0b0zT8tzdrHBhUyZm5F6kxo
	 KRc5WR5D98an9zKNay9UgTz7jWT0NkqXMvuZtkZ5Og/JtH1+yBZUQQBgoHUp1PZZqstxs
	 QTGSYiEABU1r7TrsFejTpCNEA4nI6Ds4FaIiMHzgD7cpcpaKO3wjo2PtG2STesIp9acOK
	 3YYvyf7qmmjmlxteJxSG6FsACMsGdKkau3lh+R0g1K96j2+EGhtlgbbZ53KyTiXZy2jqA
	 secKGU/NjCex1h9RQVcFENZcH9FGOAFyDj5B8+ZrrzdyMVhVA8mjBtx3GJGebk96b8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vk1G2P3V;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925D0606A333
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 925D0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vk1G2P3V
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36fb88ea38cso274035eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017534; x=1794622334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=agfHd5pdc/EdSGq69ep6mXfkA+pM523Mmt9NosKXhZI=;
        b=vk1G2P3VZonFehrlwAOTR2M8l4khy55Bf3En/v5J6SKdNEhWGermAOXjyGXZhxHt/m
         li2H6VU7eCT2IG0iYJeXtA4GIfIGZU8K/wqkI8YriPjsSDI9sJxnEszcifYwE+0m/Jd0
         C5UIQIjjDNBWcRxcv/Qs0KWpeehmwAceLrRZD4PilxzOiapEsEXJDREYFT2ZkvUh1X4Y
         AEyT7gy3oxWOinZJYQ12n1y9uGeO0LsKbLxAC407865IMGoHus3APRczL/RMoY2X6kTn
         bb347asks24Qjd9DuIsUEEjUpjEPd3/ItU3YKS/w8Pp61uKZceRCtgKZRg7GiX5IgnSM
         tCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017534; x=1794622334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=agfHd5pdc/EdSGq69ep6mXfkA+pM523Mmt9NosKXhZI=;
        b=1nnc6yxKTHUV/6uaKGdDa1fcm6/AL+S4Ycles+8jXhPD29RSr/sbOejDniVCf2yNdd
         Q9z/myLkVSUzrtBNxjqPP4HuBvoWys4iKLXBWSc61vWsSC6pf85wu6QWwYrs0qpLvr4O
         y+t230/B7uWju9J5qbczm2wl3lwSe2d4q1pfHKIEuKC5Dwiv55D3xHOVDpX2GCFe9a3D
         y4walUDi4imqc0ELt91nTId4P6kzbVCXnFW0mBqd49AHF1TVDNg4a3OtBrxORkWCY7XN
         OjKbWLOqCV8FM7MIfH7iiEbvVdjaGS3sVCPOlI+WDyloDJ37C1GiGuIR1FMKWfomv76v
         GjEg==
X-Forwarded-Encrypted: i=1; AL+hErEm2HGJFPtYo2triAAClsSODd/ocAh3t+cbrX0pa/I8/b/Lcr61O+83wfyURzcscGjwcNCWer5kOLTbSkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rZfbrllb1lqfqCMul59EAxOlSQxoitfF6E/IvFIMQg704/l2m
	fei3C0c5XXkLjKrburiJwhXLHRSBKp/A4Pd4LKASSQElqloiCBUM3CWh
X-Gm-Gg: AYBFou0bF0A0wyt61pkWDXp33z4d49R+kcnRvEbsnGRSifSsv7/o1tFjVYlaJ7TYkoA
	Id55XWl6iFju/3xwG1VoCk+VD21ERw0Uin8RSRqgEVl9zTsO1FiHCcQfUfYwl4s2emLMKDX0ubJ
	K6/yT32v/L3UqAGjUlAbNDXicQ+Gdb+DIX/sJTK7al6SjsdMLjufS1uqRnOyTcaawuy2Sw4q0IX
	tyQO0piKNCMgBxRffHTXR7ik9pkt/27GrzaSE5B3bvYYVqUJpMFLVbOfQ//FPWZxDrforLonclq
	1X5adgRoAHGfMUxl0D1f8l1XG3GssctaOmV6ZlokVqqktYXPCO7ZMLQ2I6U7vROYe940WtEADSg
	9umYp23l+pPTJ3x2Yz+lTLPIfmtMoN1yD/f6xmDtElXre2LlQtFkcvJHjLXyst8y0Pj8A6D3CqD
	jnCPNiZ/TEjbur2NGS522xW8nosjXI6fRyyUZSpgSTakIcEceIfo18gu7Ef0Hectfre8HT/TRpa
	2xIBtchJUA6JhagdaNVIXOEdHFok9JYtmTv1AUybjLWwiWA+oi5oQEPf8I34Q26FUhIhbQ3pPAn
	7nYFYuUvaEQNZgTcbNfzJYYvD9NWblgHyRgGOn/3Yze69o7nUD/MWhkQqgPDIZoZ/Q==
X-Received: by 2002:a05:693c:88d0:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-370f71bacabmr1019359eec.15.1794017533493;
        Fri, 06 Nov 2026 18:12:13 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10374563eec.23.2026.11.06.18.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:12:13 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: aux-hpd-bridge: replay last HPD status on hpd_enable
Date: Sat,  7 Nov 2026 11:12:16 +0900
Message-ID: <20261107021216.952-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com>
References: <20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 03 Aug 2026 16:43:08 +0800, Yongxing Mou wrote:
> If a downstream consumer (e.g. drm_bridge_connector attached by the
> msm/dp driver) registers its HPD callback after an upstream driver
> has already reported a HPD event through drm_aux_hpd_bridge_notify(),
> the notification is dropped because bridge->hpd_cb is still NULL.

The same happens on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a
monitor attached at boot, when pmic_glink_altmode probes late because a
mode switch it waits for is a module. A kprobe trace shows the HPD event
from pmic_glink_altmode arriving with no hpd_cb set, and the DP driver
enabling HPD about 2.6 s later.

On the two Sashiko points: I tested a variant that replays the status
from .hpd_enable directly instead of from a work item.
drm_bridge_hpd_enable() has already released hpd_mutex when it calls
.hpd_enable (only hpd_state_mutex is held), so drm_bridge_hpd_notify()
can be called there, and there is no work item to cancel on unbind.
That leaves the stale status. A mutex in drm_aux_hpd_bridge_data, held
around storing and notifying in drm_aux_hpd_bridge_notify() and around
reading and notifying in .hpd_enable, closes it. Roughly (plus
devm_mutex_init() and the initial unknown status in probe):

 struct drm_aux_hpd_bridge_data {
 	struct drm_bridge bridge;
 	struct device *dev;
+	struct mutex lock;
+	enum drm_connector_status status;
 };
@@ drm_aux_hpd_bridge_notify()
 	if (!data)
 		return;
 
+	guard(mutex)(&data->lock);
+	data->status = status;
 	drm_bridge_hpd_notify(&data->bridge, status);
 }
@@
+static void drm_aux_hpd_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct drm_aux_hpd_bridge_data *data =
+		container_of(bridge, struct drm_aux_hpd_bridge_data, bridge);
+
+	guard(mutex)(&data->lock);
+	if (data->status != connector_status_unknown)
+		drm_bridge_hpd_notify(bridge, data->status);
+}

With the mutex, the monitor was detected in 2 of 2 boots, and 2
replugs and 2 s2idle cycles still worked. An earlier version without
the mutex was detected in 4 of 4 boots.

Dmitry's "drm/bridge: aux-hpd: let drivers pass IRQ_HPD events"
changes drm_aux_hpd_bridge_notify(), so v2 may need to go on top of it:
https://lore.kernel.org/all/20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com/

I can test v2.

Thanks,
Joonhoe Kim
