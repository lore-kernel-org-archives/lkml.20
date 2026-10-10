Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741E01DB95E;
	Sat, 10 Oct 2026 01:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596278; cv=none; b=n9Nb5rcr1LE3a8lH/EHMLVgRIJ8ex1eylD3Arub7uOsg+anVqeM/o83kf3J7hg9kVMcntJ5w44/WiVgeIF1KleZms2ubTkS+OCQHLSLnzM81kJqcD5EMEk9YizRYJZZ+/rDjG/Vmcqb1/wIKoIkMsAyf1HXlp8YbwNmqzpeLNnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596278; c=relaxed/simple;
	bh=TnI2qyglFEvUhnqtMG9SAop4rziNGML2SJ/uwtQ4YWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qcyIY03CkX7gvLsf89CBYvwwoKf8GYWbXdLdvo+LQAgTtce1lvKm0C8X+5V+JvkQq3aGcqkGmZrYa+LInXOGXes1BO2reK5N2HQKCiyWHiJt+P8jsXvjO7WNl0ivq3bRXtIKciSZ5hIi/BMEVgW2FlxmkFQ+3ZIzDNLRqorJTyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCzvBhHv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCzvBhHv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18A92C2BCF7;
	Sat, 10 Oct 2026 01:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791596278;
	bh=TnI2qyglFEvUhnqtMG9SAop4rziNGML2SJ/uwtQ4YWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PCzvBhHvT3kMpq0OtjjeWPo6n0UaqJH1Jr2u68+vEjoI7eQwc0sLCV69pirxxsdIK
	 ttfrBCyVmvsyOv90/hJ88Q1db6POVAAjuc3eUnb04AH/AujjVyf3NHq+VSv77SKc0o
	 mVsHTXl8DVtlIZNUQjmdNIujBhiNh8lLewpFoSYZuyEQmh+WMBwUPkwV4PFlYvhq1F
	 XlEKYMS4bDTPRQDig0IkgRK+rc/quJEMZUg8fZSpLhk8XNHTISwS3LTAAPz4Ly0a40
	 TamM/zc+R2DYkk5OdjwMdjp0ykMsgeBhJyDJ2WbLQ4l1XQXFFqbrmY9MsRWOw298Fy
	 IwGwK3UwN4PeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED56FCA9EC0;
	Sat, 10 Oct 2026 01:37:57 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sat, 10 Oct 2026 01:37:37 +0000
Subject: [PATCH v2 1/2] dt-bindings: connector: Add time property for
 tSenderResponse
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-tcpm-sender-response-time-v2-1-67ea364a21d7@google.com>
References: <20261010-tcpm-sender-response-time-v2-0-67ea364a21d7@google.com>
In-Reply-To: <20261010-tcpm-sender-response-time-v2-0-67ea364a21d7@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, RD Babiera <rdbabiera@google.com>, 
 Kyle Tso <kyletso@google.com>, Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791596277; l=3123;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=FL1PG6Q8jNcDKHxKV05v81lJ0z959GjQmYchXFifxbA=;
 b=JkSV9DUT2Ao6dhQnVTsmooSFEYzmlk6TZ05+S26KNp+VchDzCNfPsdjek40eTiHK3srSNHl9F
 PGIrFhfMlfbAgzyJGL2IgEAFvzL4LtyctvnRNvYMMftOKbF5rlZBdZy
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

As per the PD specifications, the tSenderResponse values are:

+--------+----------+----------+
| Spec   | Min (ms) | Max (ms) |
+--------+----------+----------+
| PD 2.0 | 24       | 30       |
| PD 3.2 | 27       | 33       |
+--------+----------+----------+

Set the minimum value to 24 ms (the lowest minimum across the PD
specifications). Both the default and maximum values are intentionally
relaxed to 60 ms to maintain interoperability with slower port partners,
while allowing platforms to configure stricter spec-compliant timeouts.

Also update the max33359 example to showcase the new property.

Assisted-by: LLM
Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
 .../devicetree/bindings/connector/usb-connector.yaml         | 12 ++++++++++++
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml    |  1 +
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 8ca0292490a2c..272181e375694 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -283,6 +283,18 @@ properties:
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
+    minimum: 24
+    maximum: 60
+    default: 60
+
   sink-bc12-completion-time-ms:
     description: Represents the max time in ms that a port in sink role takes
       to complete Battery Charger (BC1.2) Detection. BC1.2 detection is a
diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 003c0b7130688..61d8fc6607032 100644
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
2.56.0.385.gd3acb90ef8-goog


