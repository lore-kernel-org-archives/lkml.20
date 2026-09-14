Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D964772BA;
	Mon, 14 Sep 2026 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394167; cv=none; b=dXZkWrKtFMtsgSyYK1Rp+OI78jBvEXRSZ5urRUV1LU1RTnALD+OwxyqMVAHBNLlzKZc4JluR3KLEuv+bQpUmnzZOenqOHVtcPMlHOJxdPeui20GLqtaqfEzgsFxdd9LLKustjuNt1MHv9OD6CT8pP9RazQsli5ryDt4tmNBpHK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394167; c=relaxed/simple;
	bh=feMAIChGgZWfq9i+/AJEqb+Uj9SH6mGtmZ5aQlZQHEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G7cIWe4Z7KHQJRHv2pE7RsMdg/g7IIjre+5iImf5YeFlKhE8qghIuQ5sfgWR21fxd61j2DjUytoVnxBjGfKGalcwUcrCw93XBLNjwUJCQjAiGU3Tp0gviUXjj3PG50rfA9bBassIwndLQc4V0ioRvXvv0sqlrP3CCP9E/ZaFTYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljd0L+/j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljd0L+/j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA933C2BD04;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394167;
	bh=feMAIChGgZWfq9i+/AJEqb+Uj9SH6mGtmZ5aQlZQHEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ljd0L+/jPoReQDlyfSvmhT2jQE5f1C+5nMkCqjepM/74/pJ4MSjsd6Lw/YVsZklyY
	 Riq1xE9Ah+rzeDGSEWgr1TRVH+qoE6U/e4ohWXlmgskhyZQekGaMBLhoG9Mv5t/uiv
	 /2AtOhi9+PlmThCrbVjql/AQpTwbH7whntW8vnC8VfyhzMFflIdVolsUmJH4AuDptC
	 FxlElNlARyskdAJUFakNzAzKv7phBnPoEJtEsk0wfcmwMAsEa5g8YEL5QCYn7vx+bx
	 QlV+yQPTxoTi2xoOSHkod3Xadq1NNY199z8db4hbt4VLxJFTT/tyOZ09LLvitknRBF
	 +dCJmt/hkbTww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45BBC88E73;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 14 Sep 2026 15:55:55 +0200
Subject: [PATCH 7/9] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add MIPS P8700 gf compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-p8700-dts-v1-7-3267f14ebce1@htecgroup.com>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
In-Reply-To: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=1111;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=WFsJFX8KbR9cAkA42pWDMyhUYcejxHY2wNhnlUtG9bs=;
 b=Y7p8yYv9zwnZFtrXTS2MrDg97xIcAaHrIiLL96HI0AQv1uDO2SVRXXJx1FZDMMtkpgsUOM0Og
 C41uzxDrVQLDtZAhRn0Vff+6OL7NlwO/Gug92lvhiUE32V0HhaDp3ec
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add a new compatible for the MIPS P8700 ACLINT SSWI, with the "gf"
vendor prefix. The original compatible is left as is.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../bindings/interrupt-controller/thead,c900-aclint-sswi.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
index d02c6886283af790d75357f77a714558f68bb7d1..6c79d7b7058a64bb39141d565f0a6304365991f2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
@@ -30,6 +30,9 @@ properties:
           - const: thead,c900-aclint-sswi
       - items:
           - const: mips,p8700-aclint-sswi
+      - items:
+          - const: gf,mips-p8700-aclint-sswi
+          - const: mips,p8700-aclint-sswi
       - items:
           - enum:
               - anlogic,dr1v90-aclint-sswi

-- 
2.43.0


