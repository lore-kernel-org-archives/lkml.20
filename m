Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197A1526AAA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904672; cv=none; b=FJ8mwgCkvCpPf0zCx/HsIo/j7AtiaC8OM77dduDq2J2XBBw9hFwSEeIoVgVnpjVO5H1PHF+PSMKXSp+NlH9j2QCafnf8NvIADBjbUwEuAxXoFRvvEHpzRueFH85M+MS9oJNk//NXIi6Zu5V1iZUK+xrHAY0zOMH5J57UsaIVJXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904672; c=relaxed/simple;
	bh=0tWuVn0M/rJf1SgDZY6aPd7ienFVDqKzCJFXKqoyc8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rD2ac8t6uOgdwgpnt5Ty+osQ+DNtiVBG7xiwQ2RuZpjAdgOzBT6EPBWqfSfdgsrfw4xIZXSQ9imSIAy30vFKq9uEzfu7G1m6x3NCjtr9TcOjejfoWb0DQ/PzUNMINzXRGa2dAzevjQznipB9bX75VXkDW9Ghng1Et0hKjTDrX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JUAcR9uJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JUAcR9uJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso40655265e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904668; x=1792509468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SV/TZTxHXAVVqpMUNaJzALRF5ycwSqiFP4BGozRT4Y=;
        b=JUAcR9uJmijUOnaWmlKC3ApaOc3YjqjDLlg1MIrngEt6jD5C5kW2bLNxArnbw6BdTU
         TBhMgoYjqnbFlCSN7+udzkmTFSFjyXwETWxs/fuMg7c5zaGxXXeffkIFYwxR7J3pIl3R
         841p9P4rnEScPhzjMA1KHhNUWkRfgdVu1pSaISri5A0q/P4FYcbQEKFb//ZbHkORRLF0
         xtmsDGu6OgtaMALE2a+g1ZcolKCr1q/U+qH7kUJw4dfzf6G0UrP9bRzqYZw39HFdnl0M
         pUvgV+TltyYhkUbchB67kE+wah42PI2hpJe144SbVLo3967EtHbV9hbVEfTiKJHqMn7F
         ikJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904668; x=1792509468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SV/TZTxHXAVVqpMUNaJzALRF5ycwSqiFP4BGozRT4Y=;
        b=Rgju8sTU+ZJovRa4AK0hShTE0VoEFCq85fRkZ5aaS2zQ2AY8HlOwY1zjMp4SNjsqgv
         a5z4hwaTtCpA5M5S/+SB5sZYbN5JQhaZVQv4IdElT0gUOLQqnFOg9AFo0/CxncfdZSIk
         gNKqcV1E6S/OQ6+/6vzZ1ambQJl01yYUO6mOcpRxNLb0tBvjjPLCCZR5nfCZcTZzFfaw
         kkGS6sJv2eSf5lk5DjbgWKc/lK+nEmbZT+vJKtMfreEBg1JiGmsmPD/L4Lv5m3+HDQlx
         2UwT5QiIuBzIekRvYv4VJFkA5kWyPnlcdcRxRsTarCZG8XsCBPYaWIrzH12GZGkidUYe
         rprA==
X-Forwarded-Encrypted: i=1; AKwUvByDHvtJ6hTf7f0OBUI1fjaLPupl/NxKpjVLNOW8N6q4cwd1IuAfxibeavrVboKzvFf3enEpL5R0/0nRYBc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2HgmaXGNElOLhElMDA6MiSAgsXp71IDENp+7uTIOErGlShHuV
	TTRYSDmOAyBMydJ1z48REa9YBiYBxFOP9n192y/2VMIrKLx/XwSdXa9D9OVoVj23cQ8=
X-Gm-Gg: AYBFou2zU1PpYnS2TFpG36Mvfp7B9nwV8IAGMmLSCSG4aYLoMS+2BWHjrorVDJSTkIO
	hfeTiSri4mQjM1bO/q6jIKUL9ptZhOhdg2sPQvwQUePc+0mc35C5EkQXhCSJ3u8rEOhZwuDylR3
	+5SKOP25OJGTvOO/ehwgm6r0kQqrRvFX9RQquAjucIjhQ6g0EoukbW89hGtBwCUf2BbkNDBYk60
	Xt+tVVohiCewpUprWxG8QWPuCtG1aQnyn8iD5P8AehAF+4CMAM0z+wCrwZ5CQdQT26ZAnP5WCcz
	ubIejro5uwVNvlhxr34StSHZtDN5D+rnhoSBoS0t7HDbIo1KItfHV67k2xiGy5xzohlzfCdpOfZ
	PvRlggplx2QX7Xg4zmotxOErwCAx+8IehKCLVuCVWKad6Cz0YTwdVOOVIwl0PqgHHvrb2dWcj+l
	D5QehYoe24GwaIxv1WiSb6DiZ5dd4FGsIu341g1v5cDgcjeVy2H+SBMcb37IsEnUlkoL9HWbGdP
	nzv03+iyfgUs/B00MfnRmql6B1M1QouOJkTJbLbIUWpO28HrA==
X-Received: by 2002:a05:600c:a40a:b0:4a1:8eb4:46e2 with SMTP id 5b1f17b1804b1-4a18eb4483bmr266434315e9.2.1791904668231;
        Tue, 13 Oct 2026 08:17:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:47 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:07 +0100
Subject: [PATCH v2 08/13] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-8-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

There are multiple members of the Sony Starvis 2 image sensor family
that have the same hardware requirements as imx678.
Add them as options to the imx678 binding, rather than duplicating it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
index 098f72544216..7c4a7a980084 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -5,7 +5,7 @@
 $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sony IMX678 Sensor
+title: Sony IMX678 and Starvis 2 Sensors
 
 maintainers:
   - Jai Luthra <jai.luthra@ideasonboard.com>
@@ -13,21 +13,47 @@ maintainers:
 description:
   Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
   image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+  It is part of the Starvis 2 family of sensors.
+  Other members of the Starvis 2 have the same hardware requirements, and
+  therefore share this binding.
 
 allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sony,imx678-aamr
-          - sony,imx678-aaqr
-      - const: sony,imx678
+    oneOf:
+      - items:
+          - enum:
+              - sony,imx678-aamr
+              - sony,imx678-aaqr
+          - const: sony,imx678
+      - items:
+          - enum:
+              - sony,imx585-aamj
+              - sony,imx585-aaqj
+          - const: sony,imx585
+      - items:
+          - enum:
+              - sony,imx675-aamr
+              - sony,imx675-aaqr
+          - const: sony,imx675
+      - items:
+          - enum:
+              - sony,imx662-aamr
+              - sony,imx662-aaqr
+          - const: sony,imx662
+      - items:
+          - enum:
+              - sony,imx832-amr
+              - sony,imx832-aqr
+          - const: sony,imx832
+
     description:
       The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
       variant (IMX678-AAMR). The variant-specific compatible describes the
       exact sensor variant, with the generic IMX678 compatible as a fallback.
+      The same applies for the other sensors in the family.
 
   reg:
     maxItems: 1

-- 
2.34.1

