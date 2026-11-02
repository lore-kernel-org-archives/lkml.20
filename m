Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656287;
	b=c+A97KYKU6SHe8CG/jL1kp4MPWzeLQLocrZfKFiLW3+UCbk3XKBjXoOXLmhVC/L79+Ki
	 SixE/F7vPMP6SR5StVrfXcz9k9QJ0GDs58J8pIB3bhe8W6FYqsd8oJjORAHsX5RMfMIvt
	 X/Pp0YYPrihkY2wcdbOSPvI9TwoFX+97LxrtBJ+qfywUzVy//5EI/MvB8fNyl+km+TJql
	 K3Rt0bJwDbcdGTUyIqn51WHCadsbvZjL855kTAafALYVjF5CAnrXkRjKmg9xL+jYKGOrJ
	 QQaRle5m+/XZq2osqUFF8VN7GAatNNeTExmpmNltwb7po8RRv9cW8loqfSwMEV/bZMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6inJX3wvVGk46ptaVj2uCmuwxa6q6DAJOXucqM8p0lc=;
	b=I6yb0gE+yMTnN2bPpTqofLiIXAkVfkQGtRn8vcrczI6V4ZMdaPBqT3vunPA/a0gxBwjC
	 60Gijp0+2zTIgizYJMxSm7jzpqAES8AWT8pyZQwsf7U0umPp61iuS1Ujw5Mi6RaoxzQgU
	 c0uzsOZOdVerAYkrpZTRnQMGJaCI4ZrttCYgQ4RPMWMTm5yNocm3Zq2p3eXhnxSmzdCMO
	 dbbw18NgGhEfg3s4o1oYlhyL8NaH6bd1oGi+bnKRDhpzRJNcExA7+XQvQ6BLrql24pJh0
	 SFJ9yumGot4/SM3LibbNEjuxhhb0qA92zYyLPojxowVSvMYZV7sJ8TtbhNyod6vP4Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSFiY5V4;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA34606D80F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA34606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSFiY5V4
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3550c917fd3so4838064eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656286; x=1794261086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6inJX3wvVGk46ptaVj2uCmuwxa6q6DAJOXucqM8p0lc=;
        b=jSFiY5V4htQFuOq1u08r6Qy/G9vfmFL+gWNi9Zov/cX0AtuxOSHykXbgpWUR8GBw+F
         vligPDvpGOytNAl+tBbiN1gtljoS+qjtWY/zqgsd78fH1CJsUmQBtmrUDj52ieCDsmDb
         0+jTbCn+BED+Hm9gUyz1IqdbOe1qK2Jt9lx26SOaL1gglKupCNwhVQ/5bOcIXBYf3ygP
         aOBT/NoW4Jeo+oAIvW7CuKq08AWQhf293gqnRFwbQWqifgMnP+EXtnwzqfvonjJtZRYf
         ULQ9V3f3CKOhUfROm0MxFAl1JDMvmLdAJHjM164mZu2RegECHqeKeadRcBJ3QQTzoYED
         rKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656286; x=1794261086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6inJX3wvVGk46ptaVj2uCmuwxa6q6DAJOXucqM8p0lc=;
        b=VaglDIOxzHZV+OsCOAqklC42Xfo6+cTOIBDKREV0tMYm0OUkvbFeop6Ff4ZI7fi93c
         GrUeVWtYhpP35EouwbF9cMqIweURDguUiuRLhpNcLwfjz/NlvgI6QT3NFqExNtg/87+c
         V1xR79jjVMD3dSmKOI8c+cyt/TYtGEp0pnzCbL/NSK90f47g1dLEGgkPHpBnK+Zc9Gu3
         OrOX0gn43HTQmsIqyKaZ1Mp/T+Yt1k5NqbNjntsGViUZNXRwMQbea4CETxwbz46oooxF
         pswtfdI08BTFa0Ct+nNtkWXUZ4a0vGmzz2e3jW6geHxgCtPjGPulKdsQbvbvs1GSUR4c
         7XUg==
X-Forwarded-Encrypted: i=1; AKwUvBzhsltGwhcoFZ+JQ4A5KSBKagp1/tN57xD/d7NvgRHLQi6f/6fTAYnyfrI/IjBj63nXrbsE6ffawwLhfHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+P+SVWJEDiYOf/h8/Ihsa1a+jbfXOS0kmzqMCdvKHAI+YOKNl
	EXHBaJL4HG59ngQHTJS79+6uqjXsS6XTc7yGwczvhmIrmcb/QQfGIhlq
X-Gm-Gg: AYBFou0Qlqx7F9N7TTqysMydB+wXqEDb5OUAlHR8fZ5ZBhI/uEkDU6UIrHstR9wiyrM
	f/+vX5QkKoSTr8f9hX61PIZOFgcI7iPVSLp0sqzmV6HRKz64wPu6uNRkVuw6G/OY7h+wPriK7+D
	Sdd+dhn9Dbg+L42nA9qbQPmGhU9Jd+uC3T4mzZ5xfy5UfMro1SeVwi6tEWzBVq+5ZDv+P7IhSjr
	iTFSBjwgfBVQKuWUW9Dg7VSbCNbavMnJhGEJJ7RPmD6aQe/papn5QT2JWqBejSZxCzLuTKMCJOS
	BLKpxOzYbYMTdLnLjDq2mZVudBptuMVV5193twe9Zp8MmBuhvAUg9x1kQtR30OB3YArIyYnA40r
	s8l779/w4BbvfbCly3LhM72PnCubsDwRlvLLPcpludgpKDu1a5Vyb/ZW20uck1ZLNt2m+528+Cr
	bRVtn++Vvd2Eim7b83w/gGuKjg6kj0Udd3t9XO77ZE5GJI8jV2JBDAd9qmcInfiShNdZO9tDgan
	OxKdpWbBGhbG3aOjkft1sZ2/2tRY6mkoSnUkr9cy4TGRyfop7C57YWdB0JHfYWFclXe3mx+eK7S
	CWbZmIB322r1ajfgtDZnOkiFTH+oNcSIpuOyjFrAf3/Y
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a4242f5fdmr17096566eec.17.1793656286305;
        Mon, 02 Nov 2026 13:51:26 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm54710712eec.16.2026.11.02.13.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:51:25 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Tue,  3 Nov 2026 06:51:18 +0900
Message-ID: <20261102215121.738-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261102215121.738-1-26rote@gmail.com>
References: <20261102215121.738-1-26rote@gmail.com>
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
has to move to the UTMI clock before that happens, so it needs the
Type-C mux state as well. fwnode_typec_mux_get() only matches graph
nodes that have the "mode-switch" property, so allow it on the
controller node.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..1380b769c73c 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,13 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  mode-switch:
+    description:
+      Flag the controller as a USB Type-C mode switch, so it is notified
+      of altmode changes. In pin assignments that give all SuperSpeed
+      lanes to DisplayPort the USB3 PHY stops its PIPE clock.
+    type: boolean
+
   wakeup-source: true
 
 required:
-- 
2.43.0

