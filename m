Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25EC577E54;
	Tue,  8 Sep 2026 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885018; cv=pass; b=URgadVfX9v5e2WwdRc/HiGnYU1iYHXpvkrpBm4XaPTvha2+MQhvpNlPAiFJlgioYQWIydLbVi0RovMuV2/earhf7g4unnrqnRkO6mUmnBDyUK6l8gxjxzONbrVr3zB9RA0MY0SdvJDyLWLvW2/TcfKaFKlb/iXXJ+SLqeEqY3O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885018; c=relaxed/simple;
	bh=v6JrUjrzrdCIbaOlSOoebt20KhWC8xvvqpXbkT9cQx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qljH43H+wXkiJvKoqcSvaL4NhzhakvNXUopPI6ObykNFIHEgkNYgzaRg1XCduHi+dr4aJJp/renohL+MCjT0fidff5LlJ1d76EIMY7cT4nZGdk+lBg/2GBQFpfz7lSfkjvzmvVxS+ANTtDlBYCwWJINPbAItnh5W02Z7TkbQFyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=APjkHUQq; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="APjkHUQq"
ARC-Seal: i=1; a=rsa-sha256; t=1788884991; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=boK9vYXnxR/YWBYNjKtZZutjveIttpelz4kLBY5m3i37/Geq7mXInqMx8AEj1yrIgMKS35PprZCTt+pUN+yv6k/+WX3dSdg4VzkUTaMs4cwjlQ8fai3qJ9pQnTZ2UITpk2LoV40JnHT4ZU9FxKEDfH3FiPOqdhWtnpchyU94RtA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788884991; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/9QZvkOZHRFMbQlA8yETT7Zrff/My6zZYclqPzswPRI=; 
	b=KEJtKMdXA6pxMb1suCo4ibrsgbZdiRm8N92KvDMAiNqt2NexrypDyGPPd3RuP72hu6An012/+d72N1hBwTfD3ClWxMUS7Xrjhie/Tq1SuQbUigeNy6KuBZh1H9otDO9taA2OQKoynb7w6ovpU9FChURUeNogw4z5rCffdQ6mKmk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788884991;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=/9QZvkOZHRFMbQlA8yETT7Zrff/My6zZYclqPzswPRI=;
	b=APjkHUQqMofmkYL0mJ+nItLfYYgrxhCVLEz5oP85MLjoS/C9nSBk+UOUnRbOnmm+
	LbD1fqymk/WApxlqwMMYnacve600HoNlJyxdiTrnEFH/7uDosUcyIBEyp4kX2qlrQpy
	O3mBrQO0j5C6kWgSpd1lIzFjfbAky7U86OoRO4Is=
Received: by mx.zohomail.com with SMTPS id 1788884990679638.4373991668011;
	Tue, 8 Sep 2026 09:29:50 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 09 Sep 2026 00:28:47 +0800
Subject: [PATCH v2 4/6] dt-bindings: timer: sifive,clint: Deprecate
 spacemit,k3-clint
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-k3-aclint-v2-4-7931e5bc86ad@pigmoral.tech>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
In-Reply-To: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1637;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=v6JrUjrzrdCIbaOlSOoebt20KhWC8xvvqpXbkT9cQx8=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIWmJ9p2Xqln7uu4Xvy9eL3Pw4GbFI+/PODZbZG0bmoi
 /JZB+PXdpSyMIhxMciKKbJw+Yv/s9bh+XZEoPU+zBxWJpAhDFycAjCRHkdGhif/Zj7s+VtrUTlx
 ssRR9/nnFKIdkz4Ile88cViCuz5nqykjw+1ZhRUJ/h4rkjVcTuh0c02Q8vP28ZXIy1s75dxyvSI
 mFgA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The SpacemiT K3 implements separate ACLINT MSWI, MTIMER and SSWI
devices. The existing spacemit,k3-clint compatible incorrectly describes
the SSWI register space as a legacy CLINT.

Deprecate this compatible in favor of the K3-specific ACLINT
compatibles.

Fixes: 6cdeb30db4d8 ("dt-bindings: timer: add SpacemiT K3 CLINT")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14de..88b9be2230a1 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -34,7 +34,6 @@ properties:
               - microchip,pic64gx-clint # Microchip PIC64GX
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
-              - spacemit,k3-clint       # SpacemiT K3
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100
@@ -62,6 +61,10 @@ properties:
           - const: riscv,clint0
         deprecated: true
         description: For the QEMU virt machine only
+      - items:
+          - const: spacemit,k3-clint
+          - const: sifive,clint0
+        deprecated: true
 
     description:
       Should be "<vendor>,<chip>-clint", followed by "sifive,clint<version>"

-- 
2.55.0

