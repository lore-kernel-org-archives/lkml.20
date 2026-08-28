Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B152244CF22;
	Fri, 28 Aug 2026 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920685; cv=none; b=DQJjduoiJPwxh33uofORpqb82ofVUQegfcppDc3Eg17QaX44ai3vhuDsOTXQ3JyP1Ci0vVgJWIpTyZmwB9lzIhCufI34yRWWQ14Dj+2xzl5ohAq7i9FtqAvwers90uCEs3G0etkMEF1caVltGFooaCK0hy6IU0GmdXKQy+4O7m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920685; c=relaxed/simple;
	bh=qu+f/ob1NHeg8faEQQMQA0WwruoStEI6iaJ2DsXt0GA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/8HOxqovg55tYTSR1Q53LMAwKJRhBfof0/cJc0FUenj5GRPB49QGAjl7UZFQTmOhTD79SchmOeuLeyqM2YUGTbrLNbYSBYoChNp4dc1m99hlVmHh4EK3V8fdEpJrRCRdU/zaLFo9p3bgNdt2QvsaIFfLpgkWzLrrcyJwSbWpV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0tB00j5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0tB00j5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D193C2BCF4;
	Fri, 28 Aug 2026 12:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787920682;
	bh=qu+f/ob1NHeg8faEQQMQA0WwruoStEI6iaJ2DsXt0GA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V0tB00j5t/SahuR5LXvA0t0Qq2eJ2BHdlDVWZCHD2P36RCFIDu4BkLjmMiGRCGpEN
	 RW5dldGi4NFK25wNmVTHePYHzrSGW8L/R3liquYRY9ih3zWDt0g3YiEf9uk/YDIT9G
	 cXBV0ZsRV/nVZc+uK2nPSfAiXGKp61DSyslYGEli+qyAUlZ2QdX/e/3kkUJmUsYffu
	 d9PJNqPRUPzlb7LT6vjlGZTCOokyV6ZDOkz63iYoHeqkNUxjAgQi/i2F4F9GgVb4v1
	 BU5LPoAwv/x5c8svt5l/FEw05wWzUucjD1/yszDZVxJb0ZwkZeVe6mpp7cPAwVT7m/
	 ZiELqrUIDW44w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F021EC61DCB;
	Fri, 28 Aug 2026 12:38:01 +0000 (UTC)
From: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>
Date: Fri, 28 Aug 2026 14:37:55 +0200
Subject: [PATCH 1/2] dt-bindings: usb: xhci: add xhci-no-soft-retry-quirk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-xhci-no-soft-retry-v1-1-b9c264b56601@divinehawk.com>
References: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
In-Reply-To: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matt Eaton <linux@divinehawk.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787920681; l=1049;
 i=linux@divinehawk.com; s=20260828; h=from:subject:message-id;
 bh=QfcjNB9WKVLLNE8Ksp+rel4ttvk1LueifZBC6xUC6/I=;
 b=7bkqOqUwaiqf0pG/quRnR30HZug1ImL+eIStoZTr1pcQwXeyvUthSfBuffaR840E25OSzpsnw
 aOM0yODmwLMDMVNflgrbnu9rjZYg34P5NU0Mv+NHuGC4grY6nzAXgo9
X-Developer-Key: i=linux@divinehawk.com; a=ed25519;
 pk=UG4KnKXGwxjTNdirUPh/nySblET4aRxWYWSMTQwzlMw=
X-Endpoint-Received: by B4 Relay for linux@divinehawk.com/20260828 with
 auth_id=982
X-Original-From: Matt Eaton <linux@divinehawk.com>
Reply-To: linux@divinehawk.com

From: Matt Eaton <linux@divinehawk.com>

Document the xhci-no-soft-retry-quirk property, added in the
following patch.

snps,dwc3-common.yaml refs usb-xhci.yaml for every dr_mode other than
peripheral, so a host-mode dwc3 node inherits it and dt_binding_check
accepts it there.

Signed-off-by: Matt Eaton <linux@divinehawk.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
index 4238ae896ef6..5d67a41658f7 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
@@ -25,6 +25,10 @@ properties:
     description: Set if the controller has broken port disable mechanism
     type: boolean
 
+  xhci-no-soft-retry-quirk:
+    description: Set if the controller cannot perform xHCI Soft Retry correctly
+    type: boolean
+
   imod-interval-ns:
     description: Interrupt moderation interval
     default: 5000

-- 
2.43.0


