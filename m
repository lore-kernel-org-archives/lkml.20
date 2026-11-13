Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606334;
	b=KncPCTECpjXTghu9itGPUS7dJmM6IEBaSumP3grHJ+O3yk8qDk+XsuPg/6TGmuEjT+no
	 8D8HMRnW9HTF3D5VsMwSzU0YTht6CqyXZk8HdHXAIESYzVtokEszpTpbdrhUjCxtA5iUl
	 S/8BC1pBZ1AA+h5nbb2MCSsyfhPyMM5ls0dNrylnJvWaV0gyWMRF28v8CfmedRrRHJROy
	 BF/3D7WboInmWEmwxreBupe8O3n6it++/K38YM3ltZhV8FXJFaNbDSneBgwMOdabQouxD
	 rNuYp0L8KKkgN0dG3RHHGWazsYt/V59QgnGNd1k78ibgXBDTckTNPriHhawSt5ERjeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oMXbsyiEGd3VJre2l0muSyjhtmpej/ppRBC0ERFe5Es=;
	b=CU7wL+asmAfXijw7Y2WzebnReMWqOj/g8oni5HRcE9YA8nL8hNozdFTB1XLU7hVWWqFR
	 7dCS+yX8fOCUGR9iPZmiqrr3eyyeDe1/lEiV8gKaoeDfHtr9nqd6b/WvWDWSBmrKSlYbf
	 0amf/Bio5KnSQ5Ypk9ArKTCgoA0e8UJDlQL9Hj1Pou2seKM11TJ1QM7uiPaXqNajofSG7
	 VevMvKEZAjhHkoaiThfM89iOsm2zysO4/k4WapTmm76FY+HJFna0Cj6VBIPMXWHNeImLn
	 /f2yR3O2qak7g2CrL8uXhtyHcmMOOEyhLS7pEpsCapTWw61I6PWkqJKicO+/EAYuhIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dal8tLTA;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6E3606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F6E3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dal8tLTA
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso8871455e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606331; x=1795211131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMXbsyiEGd3VJre2l0muSyjhtmpej/ppRBC0ERFe5Es=;
        b=dal8tLTARw6m+y19/sxHsfMmMtlBlTjYwEBaRS2Lp/3b/IpkP+EA+egE3x25NEGx1M
         UE6ewBuusn/dzEG28w7NrIkYHySFEGIzGcyui8nAtkwyzTeutuje93Su6bvgli+EvsJj
         uCG5w+axTaaT9R+3eZ5KJRtHfUtujbS36JmXS1grShbuFBOA52nXxOlCi8K3PrEWU/DY
         8SSKwJLE02IoKx8ln9N5yeAb4kDyZvQ3RAR+Mq2fIpKoka9JZZRMfNOQMAwJJjZlz709
         qNrzMVRGGgU4v2bJHIAjf91Ze4YssnazTXCpjvb7op7rNmciavRFrZGKt9RnysChoFNY
         Eu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606331; x=1795211131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMXbsyiEGd3VJre2l0muSyjhtmpej/ppRBC0ERFe5Es=;
        b=EFRFZDZN6JTaPdFdHIvkqHglwvSQwaheiAvQIyiwaw3nk/mvCilYSf4n8U9j+We9tC
         DX0BIDyiASrWG+xxyX6FZcdnJJso61dCW87mDpVi/KBm81Du4nAgB+rAKS+d6bYgDDkF
         DZN5iRa2FNcusQn9NSBXoqLU3rjGWvQcz650QvZTlszToU1KDwt7mVqKv10kgfrWgdIv
         5rfVnDpk9RJvNldClFHY1e8TkU4PZ7L6LYQJ0BfRAWAhDlLIHT0/f9tHkNXxEYCJHhAH
         oUWchG9UI15v77S9e3hTRZHu70kZfCE617LRgGPC1NV2R4yQhgEpNYBCeMNOVa6AUI7L
         aVBA==
X-Forwarded-Encrypted: i=1; AL+hErHFIC6JLm/MyDkNmF9pGkLEB3PpkMcXc6Evbl81rthNTEsDr9Ovw03Ty0sDemy335ak1a6M+yW3VMeeA4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ouT8nCxxatpFuJ2APoF0eWmtRkCEepTSfdG+DpzLmjGVzh1o5
	PPARLY5uCuMRPXTPYHM1/M0k7Bhb0aaRCSEUGYtdGfPfZBRbdkXku7N988Pi6jni+LU=
X-Gm-Gg: AYBFou12SO74l/GtpfdNUZvnDyGmOAP2ka9lm5L7pocY++V8/QHWFV9cGtl+58y9r6I
	o4kjQaHCYfFegjEAv19GN4ldiIXnPlKPoSPZnTEqTTr5WsG+WJULsBEYMkmsNmeZK3yAJ4C3ks7
	EVGhu1pt0eYOvDHDuFoSD/+xq6IXXt43xWHzDiRLttEIEQtUjCPGbR4zLUOe92GdvoJN8CCaAEN
	5PkUte2ZhposEKl8xbo9r7oeHXcFz7JjzRpDm1RUQuQE6OFR7SjLqimn2bUvTbx50lWD4qIs33Z
	TwMI8F4LfJfP2KaeK427HRgO5iuhdVxJuWtrTjw25Jtpbl+1DS1nVV9xOlFpbppkkXqCGixLnZg
	tFtqpBa8x2aHxj9EpLRXCxzsqZIJXBMeE6d1fUYuDzMJ8nGuK2rBtbJKf9e+FQo4emjXZDftTR0
	EM6NvC+TidbGa4aNX5EAhJFkFQDTMF4ByWaZmwwiLsGyfztPPMMic1lWIWN09Am9PhfKTuZgDbf
	p6mNsc7IT2raDgyWUCJdf831FRFLuEtT2EAJ4XaJ06EOJh4HBRtIWnItkbzf5ROrjOpSg9mtnuz
	8Z4XXuv5a+dtVLwzdGV7fDkylUczNTtgNJXwKgGCJRsN2oaUD3U=
X-Received: by 2002:a05:600c:46c9:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4bb55aa51ecmr89431065e9.24.1794606330704;
        Fri, 13 Nov 2026 13:45:30 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm8542479f8f.0.2026.11.13.13.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:45:29 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH] drm/panel-edp: add BOE NE160QDM-NX4 (0x0d25)
Date: Fri, 13 Nov 2026 22:45:21 +0100
Message-ID: <20261113214526.231324-1-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
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

16" panel of the ASUS Vivobook S16 S3607QA. Without the entry the
driver warns "Unknown panel BOE 0x0d25, using conservative timings".

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index bc16d6e30a5a..6ead44ca6d7b 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2078,6 +2078,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf2, &delay_200_500_e200, "NV156FHM-N4S"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf6, &delay_200_500_e200_d100, "NV140WUM-N64"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d25, &delay_200_500_e80, "NE160QDM-NX4"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d45, &delay_200_500_e80, "NV116WHM-N4B"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80, "NE140WUM-N6S"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d98, &delay_200_500_e50_po2e200_d100, "NV140FHM-N5B"),
-- 
2.47.3

