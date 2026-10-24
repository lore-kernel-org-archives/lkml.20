Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792834093;
	b=zJNO59/c7MpnXwzu3M6CUR+SPv7jWspT0IICwOflkW5HDoOKrzCKuTDr+jex1B3d4dF7
	 j1JagKSQNt8Xf9wcY1b0EROcLdykfO0IthA/P5ZjYgaBvPUO86uOhtFywojIyK9rCDLC2
	 h7NpwjH6Ne58G+WRHojcJvdMqbqleCJV9bo/ttc9MLpkeuX/XNsRtIDjyWqm+EnLzNf6T
	 CQ+XMmqRvbVMZzPm+JLOnymU5BYLRTsBcrh3SVdE+/5YXE21eG5uOicZjq+6CoHUSo/Te
	 abOkIAsoA03OQFZrtSGEmWo5oghPkG65CbaDOMWwhlevZjINORXLvGPSZVVM6DTD6cQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834093;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	b=5Rp8LUeTx7hE9/smXBjT0rHtVjy0wi9qacLOqG4lTnuBq0wQgDaXHkvkcjRgHBmzanq6
	 NlwpSK4Rxy6I+Jwogl6jLjUz+pU7gsyJfGtr6JnJ+A2wDnnyOx9KX8CQJZw5XFjLxdmqz
	 Mv04rqb3ANIgOTFD2fsO4uj4VWoH/T1l5W8OBrJQR4lDvBuqScSN+XqZa3PFyDX/AzdEt
	 /YM5OqLvg+K/l0rJPeoZheMwK2T8DrjjCDOR/cMBsOm+4qIsnfcNP9tBzCiwNtzG1pvkM
	 CJqjLD2u+ifp+WIUimCWqCzAsgdYbJDdvLJJSFs7aUUwdVVxtMBNja8lXDo2Ps/Fkzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZj7Qg+F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD922606A32F;
	Sat, 24 Oct 2026 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZj7Qg+F
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792834092;
	b=csLVj7vy834liiz578zpST847mYfLfJMjTzRodGGWu1+igr2q4wLPXH9dm93EkNNKCLK
	 t2tkweHqs4ey2jPnpJmWwUzFvOdXQ97+h4a0sYNKhdiu+HLLc6F4+7nUwpfUBJpEZmVVZ
	 djMu3YcXQs/x2A35CqNjQ8jVqKO1LjCY+cC+PVIYoTP6gIbjru0JyRphZ9NXXS6DzTsos
	 GFXilpkUvOXiz5wyfdMF0OnnqVsayQmWhkbFtkvBQqK+eJ4gZrOYeNqBWc7ybyQv8zMyD
	 U2dwWgVgq+jLq03EKF0T4qttkrPVyDDcj10lNP5BNtir0nuyGSx8jJOv4TN3RDlAjgw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792834092;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	b=TdIwwdCCjTVWTgR9A5L+/Mip3yiYQKEekJ8+7MWn/hIoTq8p1tXyHyHJN2uB5scydeg8
	 6t8PzMcz6B8FlVh66IP9SmLlO8kUWhJdqa+O15eIfL0F8fZ5A1KGvQSdSZTu13lsrzXcP
	 jHDLSlMa0pUiYcsFDHXQrvWt4cn7D6xJz5UZPgbzKYPWh1Kv5fixOzzmyUX+XhbTHRuso
	 YoqKmLOKSqKARh44aUDNYIxZoMFdq2o1d9p4dib2BY5bbf8/MSRRuBm55/WqP7CJqQyiq
	 k+5CjDHSQSwHAbVDppAK/uiRnqchbnp0qURqp8lDyhZk7jWdkBxYYthO9/okSvisnKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B7AB1F01829;
	Sat, 24 Oct 2026 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792834092;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EZj7Qg+FgRFS7s2UnGsI/wMIPWpjswUsGDzZB/X+bQL4oivL/30mrq4sxkVYZjv61
	 PtFO6/wNGP7Nz1eBaCAkRRhBTogzFlLfd3IwLUKBaVBUZCB1X5IPdFHQzS1xFTUy2y
	 JM3ooShXvTYnhsIErkjRCZ2X6h/KLZfIYXnxqZFgelaJJJVqyNQxQ1x6aKGFW3lrnm
	 Bd9kEPNt/CdE0QhMlIdo5aVc7YcZb9zInH16tfgWwDJIspw5SIXAH2Q2SJpT1cKs3z
	 gLToJUWfzqwUu4b7eAiKzMnsLgoJVe7jF7gOwNHKFz5F5kdATWV7eqUlfAegHmTzdK
	 MfZBKZMBVaPfA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A93034475B;
	Sat, 24 Oct 2026 09:28:10 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Sat, 24 Oct 2026 17:27:51 +0800
Subject: [PATCH v6 1/7] dt-bindings: vendor-prefixes: Add shenrongda
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-ultrarisc-dts-v6-1-c62994d8a114@ultrarisc.com>
References: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
In-Reply-To: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792834086; l=887;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=e/Kow+cCHmWBpSOP+t1oxwgy4BH4snNIyYRmuufij+E=;
 b=M1oCnUDesQ4ns+QHD9orP0jx0k6sRE8c2K/0IkZA2Cg2wCtFOnD3jpfDn96WVdumd7S4nbKj9
 pJQ/MT1WNLvDXOzs1RgvypKNuQwba+PuY1c1ik/jvT1SV5Rnl0Pj5Mz
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Add Shenzhen Rongda Computer Co., Ltd. to the vendor prefixes.

Link: http://www.shenrongda.com/
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..e100f3993e57 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1507,6 +1507,8 @@ patternProperties:
     description: SGX Sensortech
   "^sharp,.*":
     description: Sharp Corporation
+  "^shenrongda,.*":
+    description: Shenzhen Rongda Computer Co., Ltd.
   "^shift,.*":
     description: SHIFT GmbH
   "^shimafuji,.*":

-- 
2.34.1


