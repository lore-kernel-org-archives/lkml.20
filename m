Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794448874;
	b=dWGUXhXXyXYPAEn6TrWc6joAWknR3bWV51bywgaUglu8A/UW3N+HBoQDxEuKcLL85uvN
	 9FqMUyMfiDcBEWu0oE2LcrKhz9qaksssurq5MbrGzZmG/RQl3j0oX1JIBKPGqqqINjw3q
	 N7O3OetuoLDdszIpHvQd5RWSEaczD9x+/pVcjZz2DawWrpPRGOKMf6AVchcPc5x+UjgdZ
	 Xhg3uODfxvpo9S/XPkj31+aymA7X67B5JCYqSHpV0u7IvYJb5m6/jTrsXe1mM89MK7iMH
	 oJrfNf0OnJQw6w/uad4Bdo/o2Vf2pdL4qNRZjIBFy0ZU5DFi3bHaF5x1KHG5ONNnJDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448874;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=k5PhuZeyqtV0IkxdYw7Vv+ZE7sQNkascqyFEdJ0HxPg=;
	b=dnhssCROxHDlY2Vj3DutoKw3n/x7cM5YhoJdLN8JB5icNmmJ8e8Sb2IrwcCilyc3kYZ3
	 bU44JSzGRPgQMilvLrR1atjKQ9xvkrXJOWW/sJgS+bzX537JujR/A+zCVIyZU9B8Nfba/
	 +Z+TMqpmg9hVoM1283lBBkt9TVrMs9p5whV6uvX/r/VhVckSJd9za39o9V7foPnk+lL3U
	 2y5aeU12F3obMCUUofj29/s6RreFfrNEft8dApgr4rT0RDywHeskdMxyym6vy0s7omM24
	 Xwa8NskH0goM0XML8swKvUp3OKHNsZKg7bcATD9FW2/LEWcEfw95SPjFEab8TRzChKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BtaLN4hx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FC3606A8A9;
	Thu, 12 Nov 2026 02:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BtaLN4hx
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794448873;
	b=G3yXBtn86v7C3OaGCRWsi2i50JqSOT9odd53ehv64afVzEwdmGeMphBHbYf5Jqdv9JMX
	 e/Qobu8ygZJXBG4uUqHC125kPQRydk0ymiNLgQD3s1WlJZdEq88X3gSXxJl3T0nE/I+a6
	 eRANhGuT/1pW1plz7kZPzUtUHhPbQkj7jkNVrx+EuSMt5fV+uB3RzwgtU2SgL/07utR+t
	 UxcwRouet7xCphQiJJRvB8YONjyYfbnke24cKvfkyPzeRlrgHBwQ5/+L7TqQIwDXHoboM
	 u38Rl0M0mZeMATpSzeNAC+ru9HrD10TRoyMHh+YlztD1aP8G6xLIAgSrdNSD0iPbYkA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794448873;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=k5PhuZeyqtV0IkxdYw7Vv+ZE7sQNkascqyFEdJ0HxPg=;
	b=Cg4HcyXpb3HgICHS/wmN3O4DllyDa5kP7IE31mnU0jNdLZvwknupCmoDwUss4CLMU65R
	 w5ZV5jbTMD5UCOaMB88MWW7Ob/24PPGRBkRcHoLS61PkWrveuQeTXPtbX0/FeZqGON/FT
	 QVuSlVJvaLB8ZZwkv5F2pHSOL49MPSsH1iGbs6ivKaQAWRJhMTR/Qv0ndDNL5YHRMcwvJ
	 XOSPsy0XoYxzuIaoccW+cuFdzttkun7N4oxk2k/QBQJJgh2FjVqpbr7tTa6iC1KIK7DwL
	 T1gm/UjIxIW4HWgjei8z6ZEiiDzPALDvnKKd/81qn4gF/zjq8EVsOIAhossU0gjAdgg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE7EB1F00A0D;
	Thu, 12 Nov 2026 02:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794448873;
	bh=k5PhuZeyqtV0IkxdYw7Vv+ZE7sQNkascqyFEdJ0HxPg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BtaLN4hxXEcQtYIu110oezUJW3oGDxqhrCroNPrntnA7e3uo2WNAsZxMR23u73Rde
	 TATDBlVII4o9RZ45sU+lg8S61fThVjt/LKitSEaZLfm/V0JcqHONhjhstbvlniyp9f
	 gVbm90z/+DE7/BCOyViXyBELH/dh1jxFt+vf+uWJyCkQePAkxjLJv2ywwB6IdeEovM
	 uzYzaiMsWh56pdZnCJsBNhZW+Erdoe05Kl9uT12Z79vTjXvMJuxPXd4Ialju+C0DMd
	 AbfH/pgO728yz4da8dF6HWURpx+3zhfa0FBmODHZ9iBoDycTV8i7HjNGp6RvKW9DMF
	 MLG1RWC16V8Ag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3017849227;
	Thu, 12 Nov 2026 02:01:11 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Thu, 12 Nov 2026 10:01:07 +0800
Subject: [PATCH v8 8/8] MAINTAINERS: Update UltraRISC platform maintainer
 and tree
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
Message-Id: <20261112-ultrarisc-dts-v8-8-14fa0834cac4@ultrarisc.com>
References: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
In-Reply-To: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
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
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794448869; l=1040;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=zzbzfVX2pHKjlzmFHTGwjk6Q4jGYy9Bm9HpLwCsOw8U=;
 b=2iQS3anfVEQo5/QZ4GHyJmpaKBXwQ5QlnDN75lLOfZURdhnA3hll1agaX7JCqLgox4KoiwCVN
 LftIjGMayl2CLv2xDGPW05MkMKn/d1R9nsZaeHBU2RggGCQcqEng9D8
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com
Content-Transfer-Encoding: 7bit

From: Xincheng Ji <jixincheng@ultrarisc.com>

Jia Wang has left UltraRISC. Take over maintenance of the UltraRISC
platform and use Conor Dooley's tree for platform changes during the
handover, as requested by Conor.

Link: https://lore.kernel.org/all/20261110-amused-strobe-d6cf2bf24861@spud/
Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a97926dadba4..67bf01e20560 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23640,10 +23640,10 @@ F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
 RISC-V ULTRARISC SoC SUPPORT
-M:	Jia Wang <wangjia@ultrarisc.com>
+M:	Xincheng Ji <jixincheng@ultrarisc.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
-T:	git https://github.com/ultrarisc/linux.git
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
 F:	arch/riscv/boot/dts/ultrarisc/
 

-- 
2.34.1


