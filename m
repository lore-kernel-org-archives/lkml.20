Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6477B4B0C9E;
	Fri, 18 Sep 2026 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721841; cv=none; b=UO8MUfi8Mop9E0+H0xTEtn+8KkF3seayCtc2UbthU7cIaRVbzxOW9dteO7wuwBcLWduO7K3Pr0J7FRvT+qspayQ9UIHfAONRFUzVdGQJjo1yEleeri/3rjPGlpQTb3069WoybZp9j3ah31F8YCPSopK9nhT6HMosX0gRYhjPDe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721841; c=relaxed/simple;
	bh=e+E5iM1FydG87K4LexzdnkRbFFD5Ce6LN1dQg+EYuWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4g6YC+9RLFUdYhJCHWFC+dWmfiL15yv47qdagJXAdxpD5QG+Ce1F+/ulxSqr9TKHe+TQa3bWAC8+CE1VaxkT7CNYgMBNfIUsiZQ1wvuBNthyAsCBICK5AfG1akE0MwDwDox9UsisZzsDwx6qAVYKg6hrxTV9Lm6fHuG2UOi46I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFLuQyJz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFLuQyJz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 794D3C2BCB9;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721839;
	bh=e+E5iM1FydG87K4LexzdnkRbFFD5Ce6LN1dQg+EYuWk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MFLuQyJzXUhyv3Rb1KLRAI9NRf0jHpbR0fBHNX4iUNL12e2ErZpFUODsA0cr8V/8x
	 /oJCRqD+qXyj/qbS6QdlKXKZoz3jLxfkaQUewkSSO/4qu2iRZE4hfkRP6SmuJX4Kgv
	 HJkYf4xf7h5P/MzJiwVgd+9cUw4z+KS4wNviyStuPusEDUiGZ7wDM4Ib/Tv3JEvR8+
	 L45pyPSWPT1IIZJTSvSmstd4ywFtgocpkTc6JukpUqWRSYJ/hvTipsjN46FjPs62tl
	 fHEbBZegfTRBGQFZh3JSDmWGB+0+tT1wZBRZEviNVhpeMQveFkntDS2jgsLra0RLz7
	 hg0dK7tgRwHJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5919DC88E72;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:16 +0800
Subject: [PATCH 01/21] media: dt-bindings: ite,it6625: document the default
 CSI-2 bus type
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-1-78d72d7886a5@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=1548;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=9JG2gnHxv5HEk2OflV4GnhtoGwENcuutmXv8NLZl2zU=;
 b=2+6GDfh7bjm2quDcWDEExkXG0+2/O5n/T5weM/DqTYqUWm4G/Xgsyr3lIKcXiXqd9AFif6Srj
 0RilO9sog2cBrts5V5y1zGd2ZyCA53rP1Ev1FVXxSBCdmrNpuG1EYgp
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

bus-type is optional under port@0 and port@1's endpoint for ite,it6625
(the allOf/if/then clause only requires it for ite,it6626, which
supports both C-PHY and D-PHY and needs disambiguation). With bus-type
omitted, the actual runtime default is D-PHY:
v4l2_fwnode_endpoint_parse_csi2_bus() falls back to
V4L2_MBUS_CSI2_DPHY whenever data-lanes is present, which this binding
already requires. Document that default explicitly instead of leaving
it unstated.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
index 756fe655f534f85b23b7741d06710c956f9694d8..9b621f726249189255692da02049ebcbf1d5b43c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
@@ -65,6 +65,7 @@ properties:
                 enum:
                   - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
                   - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+                default: 4 # MEDIA_BUS_TYPE_CSI2_DPHY
 
             required:
               - data-lanes
@@ -88,6 +89,7 @@ properties:
                 enum:
                   - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
                   - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+                default: 4 # MEDIA_BUS_TYPE_CSI2_DPHY
 
             required:
               - data-lanes

-- 
2.34.1


