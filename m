Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794080849;
	b=UeWUOPknWowhDc0fzKpWSwkfrwKw7sfVSwP8Z7NZRoJVbplYkDHTKtWJttGv4TqFFzu7
	 bzKCFX0LAIBRZfX11qm43AR6CNsMmpQla8taOhsjgEV2TlWBhSqHJq00R5ZwV+SBUNISl
	 v/K5Q67EhS7arQjbOJa/J+EvrcqxE5pzWK9GpH+8K5NFtBo5cgW1DBrpde2VixX0REHfk
	 kXlaqVgeLfH1kh+4v9n+yKKa+n8cfLb0QHvOPxIOM5fvJWMRjIoqn7Org6wN7VN8FRtdn
	 +296CD0i/6eNNT22lpxcmTG8jtt7WdOdDZIrpV3WiBb2JexABiacW6A2XhfHm/h+HFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080849;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dXGgmzx0aOYkoX0/ZRF0GSroXTzUKCRg5sYhTbGb8Js=;
	b=do7U83lQg+rLwZvkURqAaXpCI3+F5Oz/AoEz3AECoiqm7QhbeRaTWWRlHoDz1l7Rct+n
	 ADde3Dm4LpnBvycDtF2YYkJegdcWn5+YJ2K2ug8ig5zKJhK3vTIIgAfPVqH1QN6Puyn9S
	 /4DPIWEXeQjJ3XwtnFfEJSmFnxt5yQ8XNYy9xHAsP/3hasklvmSP9UDwTnkHtKxMrD302
	 +5VU6GW56Zmfu7sZrF0rtWuqcMf7GNtNlWt3Axlrx+heCu5bfMui0GIE/cfMa2UKLLKaX
	 drR6KMH37mRz44cHsuMpxLyvJHgVY8Y6c4okdSW0qV7DMQjm8a65j2XcsSlGFKiKcHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EGhpR5r/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCE4606A32D;
	Sat,  7 Nov 2026 19:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGhpR5r/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794080849;
	b=DFKs8JRq2qfwdNwBSTa2pfX4e3tddKWplYTYQOavC78t1rp7TVgHRSnVDOuBIwgKW7/c
	 CJeLsk/8YEsT7E3EMtY9VkZ9WbYOP63/MqQUN+OtpSQU8hnJrRHRTYRupYfrBB/lHG+S3
	 J+EOltMsk/IsU4x99OFyTpPpr04/gal20wX8biDloEbc7zRhZCpYrOuTBCZHFjYvlcl7Y
	 mDZODXmx09e8ZomLQJUxm4lEXQ6bD7DdRv++icumIsLEgnpb9xNOGnSBZxrN8iR5R3cKp
	 O0+kO8pttIOGWL72jk2JWmrPuFsSYQG+cCETN/083lNZebdjR8t5lp7f06T9dBIJkLQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794080849;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dXGgmzx0aOYkoX0/ZRF0GSroXTzUKCRg5sYhTbGb8Js=;
	b=G5Fb1G5HohIB5WoHmvEjCAZITEJwY16gLB3qB7XSCaujkEIaJLGArBUNsEQT7BsCNtRE
	 0HjTdINyUSA7ToFeD4sOrv7rcMtxM+Ew7RCBVpifdctBez+6ZmzNI8MoSBNB7eAjP1Xa5
	 VdiDM0+R53vAJKHYGagpS/hpqrsLQk5tUOf+lYxGYP98vLhSUWXRecWgGPgTatpsHsb4x
	 j67Dcy2qTTgd2T5EIVki+Tlrk5KOyHi6fmp1NxaKDednhCpew2CEu6nWLKuhG/H2ygdtq
	 +Mo+zgc/TaYPY+PAyXHHAIlDGPhxejslWkvxgPUAI4UJm4wkI00o4H+v+db63Q86qGw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FF4E1F008A1;
	Sat,  7 Nov 2026 19:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794080849;
	bh=dXGgmzx0aOYkoX0/ZRF0GSroXTzUKCRg5sYhTbGb8Js=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EGhpR5r/zGFogExIOgDyenPQ806Oinz4gasOKA4IH0ssz8npd5BV2YHw0WdobPgXt
	 5MihIf51G9TESvMtUhA4vkxCyHHBF9prGrQUWzQm06/XMsTBwdzll0nStcTzJ06DlD
	 AaJtdSLPP6p0nsG89jciZJD0+BfCC1DWjepUxG5J9iJkmGjuvBXiRs8aSwUj9S7bJl
	 A61v5rWhxIhlqEtP0ezoMlUhSsgclfPAb0Y/5GtKWKe23L775zk4lOkF1Xjy8kiPZ6
	 VB02WvZMkR0FNQSf9JjQTUp/a1KvFswZSK4qQRIsus1FwP5tOv5SRDgyt+Sbs+ShAI
	 KBqGK9BOmrn4Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D90FF47CB5;
	Sat,  7 Nov 2026 19:47:27 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Sat, 07 Nov 2026 20:47:24 +0100
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Anapass
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-b4-ana38407-v1-1-c8b33147110a@dxdmail.cc>
References: <20261107-b4-ana38407-v1-0-c8b33147110a@dxdmail.cc>
In-Reply-To: <20261107-b4-ana38407-v1-0-c8b33147110a@dxdmail.cc>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794080847; l=794;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=2HvAMxJc/diBPtN/JLnus3Kqq4WWx1yv+UIkhTrhRk4=;
 b=5+MmzenMYLvm3RxC/YRhDPN6/0nfSIFq1Wd+rDv57fQhjKMbdyWQxfBWm6n/I6If+DYI8YNyq
 pwekuVGrR4UCuOA59Ctg8dVAbWKK5S77jzXiiqn0HSyRi5AT7hnYgUO
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc
Content-Transfer-Encoding: 7bit

From: Nizat Mikayilli <nacht@dxdmail.cc>

Add a vendor prefix for Anapass, Inc., a display driver IC vendor.

Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..b117fce91102 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -136,6 +136,8 @@ patternProperties:
     description: AMS-Taos Inc.
   "^analogix,.*":
     description: Analogix Semiconductor, Inc.
+  "^anapass,.*":
+    description: Anapass, Inc.
   "^anbernic,.*":
     description: Anbernic
   "^andestech,.*":

-- 
2.56.0


