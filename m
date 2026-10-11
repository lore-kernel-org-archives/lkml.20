Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FDD3E49F9;
	Sun, 11 Oct 2026 11:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719710; cv=none; b=I1qqDd72Ou4sjPL9u2Y9SQK+gKdN7wJ+lS4Uyir34xNF0lq8SU2neLJILwQOD19muHpedkhif3Z7yIyfsNGnX05sCXUjpj3svOwxWf5tEtEd7RHh7ZV8fctlvVv1seNy78HIna6+/Gv0kVoX1OHES5tL5KJQtyF3JG8x+llEEnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719710; c=relaxed/simple;
	bh=T2UGNy10ABCgs/jD1wJfCZo13Vo7mhRT6zb/j9330rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HNZA4p8Y416mKRXwYlTf4xUm3gWVwek3ZzvTZJOuiUSYu5tfM1f4B/MSgP0gVpC/kgCEieTCeVwxNmM8xvYuXAHlKwiEuLsslQbOmqA8sUPaE32YGlw6XXqkFrhVsZAnS8rr2V3jLOH5cHywBMQxhuftFFeZxbScf2ksoBDPkS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=NdQObqVm; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="NdQObqVm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=YQs6ToihvGfhhCQzTyPHrn1kpZbxjMBYR8WbOJnTE18=; b=NdQObqVmxVxWwFUBzV1ZmH0UXP
	FqdrQb0qSGCKNCeEyh1pmSjEzHWcggKfUmku63v2JP9py6Aaoi0RvcNFBZxQITVXo+CKjI8A9OTHH
	sV43Zfs5yXk29nQFFETWGdCCPsc7686Onb/OW2ko/VY/rb3Ct0KSQynC2fb1rLTHKEgI=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1xFs8l-0000000GkAI-2qaV;
	Sun, 11 Oct 2026 14:54:56 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Sun, 11 Oct 2026 14:54:04 +0300
Subject: [PATCH v3 3/9] dt-bindings: display: novatek,nt36672a: Add 5 new
 panels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-nt36672a-panels-v3-3-9ea238627f8a@minlexx.ru>
References: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
In-Reply-To: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>
X-Mailer: b4 0.16.0

Document 5 new panels used in 4 different smartphones produced by
Xiaomi and ASUS:

 * Shenchao panel used in Xiaomi Redmi Note 7 (xiaomi-lavender), the
  exact model string is unknown
 * Tianma TL063FVMC43-02 for Xiaomi Redmi Note 6 Pro (xiaomi-tulip)
 * Tianma TL063FVMCA01-00 for Xiaomi Redmi Note 7 (xiaomi-lavender)
 * Tianma TL060FVXS16-00 for Xiaomi Mi A2 smartphone (xiaomi-jasmine)
 * TXD TXDI600YANPA-43V3 Asus Zenfone Max Pro M1 (asus-x00td)

Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

---
v3:
 * removed the sentence "Currently supports 6 panel models for 5
   different smartphones." as asked by Rob Herring.
v2:
 * changed description to mention several panels instead of one
 * fixed alphabetical ordering of compatible strings
 * changed vendor prefix of TXD: "txd" -> "txdkj"
---
 .../devicetree/bindings/display/panel/novatek,nt36672a.yaml      | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
index 5d16d85117254..f63d322ed5da9 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -10,10 +10,8 @@ maintainers:
   - Sumit Semwal <sumit.semwal@linaro.org>
 
 description: |
-  The nt36672a IC from Novatek is a generic DSI Panel IC used to drive dsi
+  The NT36672A IC from Novatek is a generic DSI Panel IC used to drive dsi
   panels.
-  Right now, support is added only for a Tianma FHD+ LCD display panel with a
-  resolution of 1080x2246. It is a video mode DSI panel.
 
 allOf:
   - $ref: panel-common.yaml#
@@ -22,7 +20,12 @@ properties:
   compatible:
     items:
       - enum:
+          - shenchao,fhdplus-video
           - tianma,fhd-video
+          - tianma,tl060fvxs16-00
+          - tianma,tl063fvmc43-02
+          - tianma,tl063fvmca01-00
+          - txdkj,txdi600yanpa-43v3
       - const: novatek,nt36672a
     description: This indicates the panel manufacturer of the panel that is
       in turn using the NT36672A panel driver. This compatible string

-- 
2.55.0

