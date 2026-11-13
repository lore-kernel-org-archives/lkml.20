Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586726;
	b=Dc0sABhhKUTlTUP/FUiaG8aIJDMr6RbXVv4QFfcBXuumnHXa63pMH0koeOWhDE4Tuyom
	 RhSOvvwbAISZD4n/xZ4rSLIwHTgUhMw/kCk/cZo/tPXv8NJHEys2OdoAvX3CAukK6RwHm
	 cuBrzC7cbvCjHOfm+pgWaGRjRQ0EK9lcCAxYvr98C3RsdI6FklbRvYysbxYyTIxKUXGWx
	 aNMWrcCSW6+K2ixy+YKuz0x1AbF0leZ3Jr9mQ+le+acpclkE1hbgxr4iEeT3rsFIZ0HW/
	 CCc5AmYXLvikCysRVBxaf+Sle4iuD501jTWfgrQoIYY+2UnKELt/Zh1iq4jOvDZ/+gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
	b=hVV2d9mGJh+Myz/zacRid4TjOTSDJ5lJECHbM2mUUrCxNcQrYDYYxPmna2jgk+gGEllA
	 R1EhsM3UEjiQ3BwYBqu2E0pRuW2gVSfeOKn/JJn6Y4OK9UO1RkR10dSHwPMU6rNZYdmr4
	 jkJE7n7Kvt3ILABVgJgTRLWFgF1yjtSWnVglDYujmn1f6e2WorFjh+mSXrDtYthX9bz0Z
	 np+rz2vkRDFkzWo0ipJqAVSwzVHg/ZgBdYjPyiuSAZ0m7APE9CCjLkOiQJTSZoVz3fbTc
	 dkN8lEPnG+65FFvlrBNtVBKX2bsQA6pGuC/P72vQ3ihO7P/QZ2ReWJrSa2wEzU6TT8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0BSaAfq;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF9B606D44E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CF9B606D44E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0BSaAfq
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so218921a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586724; x=1795191524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
        b=f0BSaAfqvrF4YVCe0zL6bqwE2NH0qNrRF4mgMNPzpCdomHb+euxkiM3S0I0BfoUMez
         rwiZ1SGxAy/qCs+Qb9DQwE8VMfXB1mVZinJCFkVmh8sjIGvfhhSNfbVbBUmOPN3IOgG0
         gqLtcTpMO8r5s8soO531ZL8MPdnbMtoKWwOX54DEokKWNJdq2Ytd+9L8VFbZHcUaTprJ
         9G2ZkREvaNNmkZOT6WPseTtFfhq3ezBzAEDrqm2wkPDTPAk3PFHaVxywpKECjmsMvfVe
         tIz1s6d5QoCurGlPvAymyvpSfYcTt/V+tKWJDJELoSVQG3onfx+pSg2fF8UlPDXwWH/m
         +NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586724; x=1795191524;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+KHlKsszZZuhdaqagwVxvQeZSNU/AaISBE1dxzUs48=;
        b=gCgMvXVET2MFmXfgJFgUojQbsvM+XgL/ObDbk0O/OTlp41O7Jd8X2wSVyXBc/gjlVW
         zZNhq28t6wKXJSrvK35IterRIqBFymkE7OV2crDVtf6gpTBDmok3razHnJljzh20xHdz
         ft/YYH8+vkVpldpdf8UMAbmODTV4Nrr67Tbt6zGOHYovPpExeGZ6dPuTiGgkmZnDv09T
         gAuvNdd2iHk8laWdkndA+CzdHdfor5GgVZkhILfPpk8YWImPvVqRic6jnYvXGg7H/zuF
         y2skk2ifI/kxegkANZen/eLqWqGUMzKgKFfdwewRJXOCojuXyHqgkCHlzq2TJc/NjsOC
         v41w==
X-Forwarded-Encrypted: i=1; AL+hErEuWr2hf+cgS0VQL1gg4RkdabW+yNx43PqXLsxAGlP6WwfPjTtJNIgDyKy6sRpUhMslGXlmxz5wqjXWcFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TP8bOalCa7Iz8rGq/l4Aa6DxjP7FFtJ2Uw0tr7qv1EQXNE0+R
	W9/gJnXWaAA7+j7UzkVFyvrTq7Y65k8+5gcbzL0R9Ro+MHbyeqKH4Ok4
X-Gm-Gg: AYBFou0GmrVwnm95Vz0FvbNoxKi4CAoZI7yVQfY2sTbvZ4AvCLjyVGDwK93LXqtLSIs
	vjVPZwGDE+glTdkvq3yb9kk9HCWz/01CBSWm3vGZ6VVXmQoBhSzpHGo1ZVOP/1d8Q1V5+GNcBBi
	gR+yYyvI9S+vdhvJMot5B7lIa0/XJocxR6VFO1g4j+BEMcWakaUcBTPXMxRX1MaPnW73R+e+W7f
	gIX2Dh2Z/5OsA+kVaBDQPTzBVFx/LR3g6qfBHdRYuJ5Xd6y2CrtCZKhvvH1WSbzaCumfqeJLGK/
	T+v2P/nl4YP5VBJIIkAX19Pa5nADrCcdLZWYrqHDQE5uJL6E3UvLKHWs4jppq9T03K8Vg0cRVTP
	FPZOOgTQOLzMO8+Wqr3fUj1RlYeYoL6N4Pi/HKKo+vcy3O6YdKl7e1trBQP5RnSeadyZlWUvv+C
	mObMlgO2Nj8DupG8lEm8/S1KLnCkDgAMFK2MGJyCwfdXnCsjpEWlTfQhHb5drW6FAB3yw9lYWTq
	cOqyzuPlZIG95UHazvwafmsmiC2InogrgZpHoTVmUyyPgta8Bd42aFnyqjQwuFGFBJsIRz5gyV9
	kD2MK7zxxcV7RIkYfVGWdlqBM/qs0Y0hfz8otBQmKrJ+d076LS7KiRURPugD5D2e6PEuCu8WKN0
	3lsdQCW9MZJY=
X-Received: by 2002:a17:907:3f20:b0:c46:c3ad:e1ca with SMTP id a640c23a62f3a-c5096396effmr277084266b.9.1794586724367;
        Fri, 13 Nov 2026 08:18:44 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:43 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 02/10] dt-bindings: display: tegra: Remove Tegra30 fallback
Date: Fri, 13 Nov 2026 18:18:11 +0200
Message-ID: <20261113161819.36847-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

After further investigation, I have found that Tegra30 requires a slightly
different programming model than Tegra20, the maximum VI clock differs by
nearly a factor of two. Additionally, Tegra30 does not require the
APB_MISC workaround.

Therefore, remove the fallback compatible and add a dedicated compatible
for Tegra30 VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index bb138277d5e8c..2d5538a1804f9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -18,16 +18,13 @@ properties:
     oneOf:
       - enum:
           - nvidia,tegra20-vi
+          - nvidia,tegra30-vi
           - nvidia,tegra114-vi
           - nvidia,tegra124-vi
           - nvidia,tegra210-vi
           - nvidia,tegra186-vi
           - nvidia,tegra194-vi
 
-      - items:
-          - const: nvidia,tegra30-vi
-          - const: nvidia,tegra20-vi
-
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-- 
2.53.0

