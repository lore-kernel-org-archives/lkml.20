Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B47246781;
	Sun,  4 Oct 2026 02:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791082734; cv=none; b=IIy0X/ifh9BSiuD/EyerMvGM0a8lPQe/IpV31Hjesen5zN2N9vz4Ke+lmRQsmWjeeohoflBUi0At/Rk/qW3K2KR++WK1Rl3ijt3L5LffkSAg733J986DPO+bggLHWXPuoIzxOYtXiimLNjytFvgxjBcsQK8NAGn/JwFLCQZVcQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791082734; c=relaxed/simple;
	bh=NNzFm0r1jd6aUEMaAm8uXaOxmMzdR9oAiYqN0dOQCy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AEyNA3mmsWafQXIz6PGYkdS7OmMYsSBGCpk96qh4JAG0o2Ni2UwG1w8TnDocGAdjhTMPmmCoIl/HCv/PD9z8IBWRfgkhoFdDrYVimIp8Jn51GGEM+K7ka18OZBEeSdEz/3SPB2yIz5YM/O3L9BL7F9UJpWiQGRCrDL6856XVChc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IArDh/Dl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IArDh/Dl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE4B1C2BCF6;
	Sun,  4 Oct 2026 02:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791082733;
	bh=NNzFm0r1jd6aUEMaAm8uXaOxmMzdR9oAiYqN0dOQCy8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IArDh/DlkDXDo6AhBke6dPgKXMf/fb/Lh22K4a2gLVYmA77U3zVFYXtZg1fmQVFF2
	 LWaQzXNXRs7o7C0ikA27i/Z1+KBo00wKrfG3m3o1AomYaCJF4Ka/u1zOLsx+tWIgut
	 wndRTLVVEs36PSmdFgk7KRRoiiATojDWJ1qZ1Z6q41wAS9a8fvcO5mqjmPjHDmkBMI
	 WEs1fTe0kadmpYDNbKuRaTjU4VtrwRHc432R7ET1kVrXz0DszChoXtKV/l4aiX8CAE
	 3eSLH1bm5JeRRn+MAAuptq8r2SVHUbbReju+G81ZqhmeZrjRltwFRSjZkuceCOltQq
	 2eCa/812okFeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFABFCA5FED;
	Sun,  4 Oct 2026 02:58:53 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sun, 04 Oct 2026 02:58:28 +0000
Subject: [PATCH 1/2] dt-bindings: connector: Add time property for
 tSenderResponse
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-tcpm-sender-response-time-v1-1-3f8b43084acc@google.com>
References: <20261004-tcpm-sender-response-time-v1-0-3f8b43084acc@google.com>
In-Reply-To: <20261004-tcpm-sender-response-time-v1-0-3f8b43084acc@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, RD Babiera <rdbabiera@google.com>, 
 Kyle Tso <kyletso@google.com>, Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791082733; l=2510;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=zBwpHglPRJMH9DVT1jVWF30TU1gYVzIVvmJQa3QH3E8=;
 b=HiomZa+Gd3nhmw9MKEDeWmXOtoIoa1JdXba4ZXjezNvwoz5JbJ5c+pdshT7Bka66Pnmfn9GA/
 DjFDPEwRXPhCwnYlXZ4+Q7I2cKD6AlDG5Emc5KeTIK/KH79g2h9HnSC
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com

From: Amit Sunil Dhamne <amitsd@google.com>

Add the sender-response-time-ms property to allow platforms to specify
the tSenderResponse timer value, i.e. the max time a port waits for the
port partner to respond to a message that requires a response.

Also update the max33359 example to showcase the new property.

Assisted-by: LLM
Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
 Documentation/devicetree/bindings/connector/usb-connector.yaml | 9 +++++++++
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml      | 1 +
 2 files changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 8ca0292490a2..52dbdd738db6 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -283,6 +283,15 @@ properties:
     maximum: 200
     default: 200
 
+  sender-response-time-ms:
+    description: Represents the max time in ms that a Type-C port waits for
+      the port partner to respond to a message that requires a response. This
+      timer starts when the port's PHY layer receives the last bit of the
+      GoodCRC EOP corresponding to the message requiring a response. This timer
+      stops when the last bit of the EOP of the expected response message is
+      received by the PHY layer. A timeout leads to a soft or hard reset by the
+      port.
+
   sink-bc12-completion-time-ms:
     description: Represents the max time in ms that a port in sink role takes
       to complete Battery Charger (BC1.2) Detection. BC1.2 detection is a
diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 003c0b713068..61d8fc660703 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -78,6 +78,7 @@ examples:
                                        PDO_FIXED_DUAL_ROLE)
                                        PDO_FIXED(9000, 2000, 0)>;
                 sink-bc12-completion-time-ms = <500>;
+                sender-response-time-ms = <29>;
                 pd-revision = /bits/ 8 <0x03 0x01 0x01 0x08>;
                 sink-load-step = <150>;
                 sink-load-characteristics = /bits/ 16 <SINK_LOAD_CHAR(0, 1, 1, 2)>;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog


