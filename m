Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955803;
	b=nO900/f5DJyHSerN93YxCxhFQyt80p4sC08CudShf45xGP4l3VffRDlvo9dLu2hggECs
	 7KWzoNdHhYLcVNAsdil60tCPyu7PoGEob3aLosUKSqKy5BZw6dfPb/HKtEHZZLDjqT2+/
	 gM0DGX5LZLIyv4ofUApqw9YQ2jnycJMXikTRGfScWxgidmr10gzoatawJ/omDkFXBeP02
	 csjpjBc/tdBmv2lmb5yAbZt3xwFt2qypHiOVuMUPbNXhcS2uXg8cVvylpYOV5cpDtyvWa
	 r3qqlECll8obd7LxUeNGCJxSBd7Cjji6Ki0ykHafKKVyHTu3PLtCmD4M44ewY3Mbufg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
	b=JkCtv4DKePlriUJEGA0hJdvXKVliMopkbWuMIm80i5dR/Nwo8g7BoJOQccbmZPtWPhIv
	 Ln0Fn3BYyp/GGSXyxqDXRN+PVf5QzlYZloFKMCYmPXCo3Sjj0weaOUJKloltwwFyTiFE4
	 dm/pXRaJjArznO9XaLFm45jeP027MgtdWg3yS+UABiYF7tfzzbczPtCxeftlpnoCZ0XNm
	 z31SWUzo6HucIGcYyknasPQH7eMKYpFF2OfwbLfhn0J/Jieka//F41wNFuI/OoU6YTbre
	 StUalC9+zHN14FBuNOK216dm5hra3gGpzvlzeDhzjzHDOSlweyi/6sbk7sZLuoFy0iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Q0Fs9hwa;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E33E606A330
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E33E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Q0Fs9hwa
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so17044825e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955802; x=1793560602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
        b=Q0Fs9hwak670CqLDxPzzKRJKIZaYW6JUgI1yNvBjffOCRYqcnBbMwQCX2US2gfxfMP
         p4Y7vkImrqLb3aQI5cv4CsAMqChcB1144RY/vvbcLoke3UCCW7Xr5tc8+UNjjxLvZeja
         Neygjqt4Zdd1VbWy9i95C5gnHegqh4RvrQPoFjEpORM11n5rwdiY4K3wz67SG8layh67
         O67+v3EEvgrlSQKuPIKU/XWKh/545aE5vmcEC88tCZQTOc6gLl7jBBwEKAFhzc3ddCgS
         0zq1JzdIFqL0gVWnoMTbI0yl6D9abB71OqOTs/L6XOj7CErnAI3LfWoPmJMl2f+1mMNg
         WuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955802; x=1793560602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
        b=NZo3Pxuxt5t31AJcGWy9jggPA0KjUrCdmmVcZ+gObIG63qjh5zvymfda91SOhPQjHr
         5cmjS4SEeL6HfoualKDpVbDRIHnZJaPp/OY4pJ1PA/B4N9Z+gYNed9ug/J2o9sm9CV/d
         rwWEYJO9BTiVWB98ecGwjIsACWSM1GUrai2WzhiiYtvhB20uZAaAEjbyS8WmSjiM6X6r
         yQ2fqZdaWyKaA8eyQLm4QTpfrW7T0R8jZ2iReGRT6BixAi6k+r3YWKUH/LaaXsC06Krb
         CvB+dP3MlFYv0RAdY4JY03Bmoso/vwFprxN6tc5FWSlFDmW5p8pihyyNCNsVx3nGvW5Q
         431g==
X-Forwarded-Encrypted: i=1; AKwUvByKvbJ7vr3V9Hhs4PQ6WXsfq5yfR0ctSLIwr0lAID5XVHDpOA9Qzp1EqU2fJ+GPu+xQ2cgmOZvr1iOS5f0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIjuEyyRnHsmWTp36f19kRGEc9EPFlV5IYQsIceEvDJdvI7i+E
	xZNUaDjLHuNqPZCgmbHZstqkQvP85YVSoNJvlFLs7LkdofpEUvFkIHYnpFKIT50OCew=
X-Gm-Gg: AYBFou3NBw+B3lYORG8Jx4pjhAYArEpZ8M3aClzL0puEHo+C1HaFoVD1/2GUJUF7GU+
	C9i+VawEpMaKtmFmWij79RS74xoDW9M0jZxpqbBuvwXNyw3LRzBNjhkCSrSUOHD/NFdbsxhfQgu
	mVyByfYhRekz+DE34kYXDgeyUFKah6Brll2R74IwB2YGT7HAcG3HVSQA8nmOV6kKW5tnnduiqdk
	uleZfb7ayktdAqRcX2f/GEPWtWtHceupSWM83EbbCQEP/8LfkVAs3LptjLrPBCzVKYPT4nlbRMN
	X9c/QugBocR5l80nA9Jx5WTg4S6ZA6djwMbpT/QT/AHzHBRFT2/ju/+xqAWEKsAq7iTFE9Fb+YH
	Ly3ZwuEFseupp+Dwabm+i6VDsJsghXNvjy5IVW8sHPmbFCo8dRTDF2xiBS8iUeG4StH4fhsxHn3
	yBI7Rum9f/tF46KYyJCyXkvkNiY84tczskFBvGz/Jrp+xlFtLrlOWAkLGClfDRGLD3PAe6D0yqt
	OmYUX8vDNBjKCOJIEanjx76KBlhKRo0UWxQ+QpEvSfWMk5jGQfossRa8lrlhmxX+8/5qMjOoPrc
	Fs946WTFm82NvUc=
X-Received: by 2002:a05:600c:a08:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a35aeab300mr99622825e9.15.1792955801817;
        Sun, 25 Oct 2026 12:16:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm144560865e9.11.2026.10.25.12.16.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:41 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/5] dt-bindings: vendor-prefixes: Add HiBy
Date: Sun, 25 Oct 2026 20:16:36 +0100
Message-ID: <20261025191640.13592-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025191640.13592-1-olivier@mgcrea.io>
References: <20261025191640.13592-1-olivier@mgcrea.io>
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

HiBy makes digital audio players, among them the R1.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..b5bb11c20471 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -722,6 +722,8 @@ patternProperties:
     description: HEAD acoustics
   "^hechuang,.*":
     description: Shenzhen Hechuang Intelligent Co.
+  "^hiby,.*":
+    description: Guangzhou HiBy Technology Co., Ltd.
   "^hideep,.*":
     description: HiDeep Inc.
   "^himax,.*":
-- 
2.39.5

