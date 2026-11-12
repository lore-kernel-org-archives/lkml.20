Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483530;
	b=uCNda1OdTq4Lopp1s36lQL7k7ya2fRBwvWM581KU7JIXGPLaXXT2PScFNrB7rDIwLsA2
	 HXkNzBeu7PTKhW4GQxYwhiOlAsrmnBU4mFp5w+26ZQfOkAcm6fVco9pZ4/B41sKRxlfnE
	 tu8O4ONjyQ9Fg1QzgJeRan/z8IUhiTF1kulZDkFN19Y2D2eEkkrc2yVZSoPWrUBlN330D
	 0f2A6sdqVoBGxgE6fwouIgbAiV3ISuVgIhDlEg8E0SPqvVgRYtR2Z5qk5hse5PEVSjkAe
	 HSJkC7EwlEW0HyGcyA3bSbQHb8j88SJ06wisDHUUnJosbyni5DiU9juwlmVsD1dwJfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BcHFKzH6PC0hX0kM+WnfYgJDlB7llMNXzNgtx2MFobA=;
	b=xQHCCFQtRJccABABK0n270mMBWcCm26Y1jo5D+wp5ZvVCNJ62bNtWcM+R37lc5zW9IiU
	 w70YAw0G2HMlMxqqTxQ4P/MI/1XeHcyztW0gjtnYz7ckP++nD6AdsA13Rjkzgfl8uSGKb
	 lHjdTc81iwyD81ORzJlYg+gP6+WxTUn/3NolXRCrmoZZwI2WpSpeQrZwWdPgps+2Yi+CS
	 GJm4/+FWSOmDQJlcd0z84O9iObQjs2/1p7//ghDOhyR8TvIuO2VbqDDKKG9bj3TfXzMvb
	 cNxTDl4KD2qyYnGvd2gaWoGYVSZ8OdejSzmRE5w3qiGYtk7FIdBLpKtEx805C7GfkQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpc6tjlp;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6F2606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6F2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpc6tjlp
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36dbde64409so8211388eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483529; x=1795088329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcHFKzH6PC0hX0kM+WnfYgJDlB7llMNXzNgtx2MFobA=;
        b=bpc6tjlpFatIpalsJ00zMwHn1GBcqsf3GQV4V2rJbh6LJsquLTd7ybtJh1ijCy47Jb
         c+d1mWb6vX+BpgcenjeNRTpaOEato340SQNSThVZ+mSFA1svcmkV1KNtArFv/4ehxtke
         m6v9iiJVqFBqRwE1AtFHLxr+ti975c+/Z6EzYpOo648IXJoS5U6guDhNGa28v5f9EUt7
         oJV6DlU68pRPghGGxrQOfOoOqssth/ABpw759qlasUmCj5qh6NuOgzYEtoxLMyt3YpDQ
         dzXGK0sJd/4Vy6sj9SEYrLLXWeV/gWrcYhgZQGziUXAScIlS5FNZKiXCg8f/yvO/ZfgC
         N+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483529; x=1795088329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcHFKzH6PC0hX0kM+WnfYgJDlB7llMNXzNgtx2MFobA=;
        b=xEfnlXaCbIIp+cAwX72MpsYy6DARZVrabq9edyA43X+DrdITUIuGtDLArfs72o2T24
         QaxpB4OvlEAHVqDklTae6ZT0ycRm9ap+QUrXa1jQY9gG5MGKikTCq4WwphEm+x4ZdaHh
         x62cm4CIgUhOKFGdLTcHiD8ExsMZFAbCmbl7IG1y7NbeVTwk6ajHGqak7wCq0r7IuKbC
         0kegFl6B4pb+0V3HQawqq+XNLAQGIQ+UjTW/DH4iFU9OPUlYme1Qwok/SWHehYXghgmZ
         FZdixmclWrPg7LSYhfIoXNq5EEa2pWVwDVZBe8ZyHdk6aa/wM9amZtE8XxR2+z0wwDI5
         8Epg==
X-Forwarded-Encrypted: i=1; AL+hErF2JaVpijy6dhbrLa7k9pCAB3i0T6eMcm5hGohb0DV93rM0u/f+sueClHEVuAdwc3S7b5vpdGdFU9vdcEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dt2BGJxDFeOqllXRFKDYvPgZu1/kgq5d/XHykk6Dm9uHFoBJG
	TXZfF66CXRXD8gkMS9/hMJjEZUYfvPFLCzLoZ/cLbMruhv9UyNOfHzDH
X-Gm-Gg: AYBFou3+6jWVVhleZifJeKBS4Mo3beKl1ESqwAl1i/Y2wUzMwatCinc7910ognyXlvb
	MU1fJ7kB1NJpb0zxldskgFBmQkVeGSOpuIT0ePtX1UHJuv4rJVCQ0Zzkztq1RZD/yJ47dlDxkWZ
	oQPTfL7tFws3yjp55wqGaTjKdFc6LWHM/9xM8A0u4hGiWl2hGCM1Cgni1a57t1yf0oUumAleZTj
	jWCZmXAErTDoyI3Peg6VJpIIAMFUTyDScxXFa8SQCC1ez4NFrVf3H2tXiivcj/ZBtJJy/lnN4aq
	VIaY6iJZToCiqSFQ//YXBRn5non2fwkR09h/teHlVYeYIWXJMLaiqFMAM2/jXOXJoVOvsN9H2ib
	KId8rP2gzwgtlhYVStq0XdCnRA7puYznIzF7/6EZIvpcqXmMCz6xdJx8VjyTD3zcqqobysked+D
	pwAy+CKVfcamSeieEmA3Zuht+2BnTW+2M79Xd/rE5/IeEeJB/FgqOOR4HUMf/XJ0WEDD1qAoEiI
	YB8EUlpcZVVfMdIyPmcMyegsr16nmLrBxMv/4XP39MqIvxlhF2K+40KWE+srXuRf2AsU6zhxOgQ
	9l8oFF/+MgsR3QCk+VTF4zWkUj5yzCZmZWAemIB9jw==
X-Received: by 2002:a05:7301:430c:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-37683189067mr5405543eec.1.1794483528595;
        Thu, 12 Nov 2026 03:38:48 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm27149036eec.20.2026.11.12.03.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:38:48 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Thu, 12 Nov 2026 20:38:37 +0900
Message-ID: <20261112113838.506-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261112113838.506-1-26rote@gmail.com>
References: <20261112113838.506-1-26rote@gmail.com>
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

The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
DisplayPort pin assignment gives it all four lanes for DisplayPort,
while the controller can keep running its USB 2.0 port. The controller
has to move to the UTMI clock before that happens, so it needs to know
the Type-C mode. It does not route any signals itself.

The Type-C class passes the mode only to graph nodes that have the
"mode-switch" property, so allow it on the controller node through
usb-switch.yaml. Orientation and retimer switching do not apply to the
controller.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v3:
- Drop the mode-switch line, the usb-switch.yaml reference allows it.
  Disallow orientation-switch and retimer-switch (Krzysztof)
- Say in the message that the controller does not route any signals
v2:
- Use the common usb-switch schema instead of a local definition

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..fdc2bc8d3045 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,10 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  orientation-switch: false
+
+  retimer-switch: false
+
   wakeup-source: true
 
 required:
@@ -170,6 +174,7 @@ required:
 
 allOf:
   - $ref: snps,dwc3-common.yaml#
+  - $ref: /schemas/usb/usb-switch.yaml#
   - if:
       properties:
         compatible:
-- 
2.43.0

