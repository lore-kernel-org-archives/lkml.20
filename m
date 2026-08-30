Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2727D2BFC8F;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788121184; cv=none; b=ppsfAxzQDRpkiDtorIhNawCvswpyQ5ZL1uB4GuSZO5E7uCQAGAHL3caV8yzK0vfPrlyPcgCPxxvrhPOAYVBqQnQ1Gv2tlLkawdALqw8sWjvihIteg6dokhqAmLk0a+ql2EY/u283UXgIR8b0SfcpbXIz4XiFav7tXPYVXb4uS2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788121184; c=relaxed/simple;
	bh=AM+uADRTsie5/REEheLPhgbwiWPLSEIpJ/A32xZhBDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XiWGcYTkeYmn3MoM3OgsCeBG+DsS3BkWJ/2rMtBZeHpf1xCebqXxd1vWDUT4845xRSWPhG50MSeYRhcWhLkFMerJX4iM6SjbP2wHx/ZfU6SBG1qAfCeHPSiT0yc9m5Uo9/vIm1y8ihv0HFwjcPwF/BlWCWKsguMGiqJRZiJ9k/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWn/pepg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWn/pepg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C369BC2BCFB;
	Sun, 30 Aug 2026 20:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121183;
	bh=AM+uADRTsie5/REEheLPhgbwiWPLSEIpJ/A32xZhBDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IWn/pepgyYo0JXKFvZJneBbfzMIlaXqEXdcG76dca5SbUyXoqPjEcS0noCsRIZjUH
	 641FkhSqmmX34iDI88DS9URNqb7vXhXh/52MxULj+QYpdYcgm+5GZPzVcJqZE0W4/s
	 D6DBOq/FjbXHJyowVhx8VQK/1hopnSSVfCOVz62gPwgAUNQ6PDlMXpcLIFlWIe8KhL
	 wMRqXHlj9baCWK82XspGFYFMpUUrVzkaMM6UaAcoI7yF1ec7YkZLSRCM90AuWbyS+b
	 addNxzzOxaUljDnbdF9Tqo9J7xyNFKAA+gdHBxFHAqVbf+fG8ggmbE5eiRCatLPIvU
	 EEGg6CvJ6ql3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C56C61DE2;
	Sun, 30 Aug 2026 20:19:43 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:19 +0200
Subject: [PATCH 01/19] dt-bindings: usb: Add thunderbolt-switch property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-1-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=AM+uADRTsie5/REEheLPhgbwiWPLSEIpJ/A32xZhBDE=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCUHRPSviIt489LzkwM0pd0Fr586tWgtyjb2DWzveW
 ChM4gnrKGVhEONikBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAExkuh3DX/G2G2avHrYoTJ7C
 +bRsRUKc/SFv/RiWGesK6rhuxTKm9jL89746k2XX7OdTNVyO3+1co37q7uyN4p9cT608FVHpKWX
 7iwcA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The USB4/Thunderbolt host routers on Apple Silicon SoCs require cable
and mode details to be provided out-of-band by the Type-C port controller.
Add a thunderbolt-switch property next to the existing orientation and mode
switches which marks a node as handler of these notifications.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 Documentation/devicetree/bindings/usb/usb-switch.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
index f77731493dc4..5d125fbb252d 100644
--- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
@@ -25,4 +25,10 @@ properties:
     description: Possible handler of SuperSpeed signals retiming
     type: boolean
 
+  thunderbolt-switch:
+    description:
+      Possible handler of USB4/Thunderbolt host router activation and cable
+      information updates
+    type: boolean
+
 additionalProperties: true

-- 
2.55.0


