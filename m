Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB69526AA3;
	Tue,  8 Sep 2026 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861011; cv=none; b=eKHVUFlvpTHv2h5lEIAc2+78l8hzPj51KwyYg0mBQQYTBZIF5vTe1b412UrFC9JZsZiUFbJTl+7fTcS29bR1ArX/qvnSZ8xDf69COcZirCDCxaLk/iKIsAKUmIkzv8KkVgLGmtjyTMEnExOXbTD5F6gbKn+so9oP5faxO4cPKcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861011; c=relaxed/simple;
	bh=fxBkl8UN4tRnHVfp02q8VLqsFWTrQ8bgE6+rw+AmQcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qkwZFi5aGLc02Fh6YJ1xu42vM0K8vvBPmu/mqJrUB/hdNK04rjUS5Ncrr6Dk2lVailcOvVDaecXNMZxblDHSQJCXoVPNeTcZ5RdnX+OclLSzBuU/ny44hXn1BU8SyxzxsODAPVmh67fDGC/4IbTnba1PL5a17LHF87m7agEVj4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=BZQpFhBK; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="BZQpFhBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860938;
	bh=xz739aXXIMUSh9Rjzk6Ups/xX8HvpqZMo6mX55mUgiw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=BZQpFhBKrpEmq+z7kLQvLtc+IIRkkQHXeuldzS4UdYDIscDq63QiLB2l/LWYwPsLp
	 0PaPNIzgay0cgApWPg31dwlTHxkCogKgSzytyGNAiZ50pOrIj/XlFwWD+qrK0CC4kp
	 HKaU3/svgR+3MrtskG/5LfppTitUNO/kaTLhC9iU=
X-QQ-mid: zesmtpgz5t1788860929tfc1f0512
X-QQ-Originating-IP: 0x2hsZIjGcymUws19v1bVA6FVvDkhR+5jRKxV4RIAaA=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:48:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12305366414733721363
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 08 Sep 2026 17:48:39 +0800
Subject: [PATCH v2 2/9] dt-bindings: usb: ci-hdrc-usb2: require clocks and
 resets for spacemit,k1-usb2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-2-f07342ffa051@linux.spacemit.com>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=1019;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=fxBkl8UN4tRnHVfp02q8VLqsFWTrQ8bgE6+rw+AmQcc=;
 b=m9KV9hF+XPbk6pI2SQLmdRaoo+k5YOn76xXHv40m1eGF7TS79E9DYA13F62LsJEopGJ1VIzZE
 eJypALXD3B9DNBfj7eep76NJFSjWVboQnfidFtnmSNIy4TaQ4N5X1Pa
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NZER9JwiPlooc+kbkAUnjfuov5yGG/9rElozlcxjprHHd5t1LvUhHpiD
	bdciiFHPQQdIeozqHbvSSIzuwsvwbyX5uP/VIBbyGFoE/ANdpw3CVs6GQ7ykIZa8OnSqR+m
	y1oEguF1BE23M+eedJGvTAY3hA7M60NX/K2s4w0FJ20vbmo22a5ebb7JR2dIeZmxV6kz8QI
	jwmIL7SitiBHMyHvmT7bgFQ2yeGfoRoeAop+hOrFQHrH7vI4OWcu0XtIXwRdEmd37VbpwMR
	AiLH6QSELtAd2fmT1UE/22E0YAGEhVLOBfzrPzqLZIqzrSXyZjhWGtat5aXwQCx7kdgQIF9
	66KFUKyVT3uwZJ/D/BWlKWqpWZWxe0+uX4OvEo7Z2M0CvxDTFm7teddIOrE+tb0GbfEimsd
	s+nS4Wu4CWdQ69mkTT0JFzEv56ffriAizU0ELPLlomgXOye6Jg0mE74JUaioenURzjdnfbq
	5j2VCvtgqhFhzVgTuGDpc7hxdiWfAnxHK0QcyXHECxcX9iQnuQssiGHzU2z5k8q/u93DOf7
	MtcBJEbnIB5wm5zpC4QkgAtqOAN/+vMNzmQWTQV5CLtO3R4yhcG5/t8ny3qrV/dhImH04+e
	LX08fQQjSrpWpJYTcjb1s8G1VsX7ynQhppgBUcxLa+MHeS8yXkRoL0Xnlc3BjmIWil7MNeg
	Vk9L2ruQhGwjJNdufhfDCj1g2amrplYqTrScTsTCJ3TLz0Mp8Fn372oT4nCSpf7/oZoLXZu
	yAIvPKV9QwSfI6Hp0WCZ3QHdrk8Et0oM+4/tG0qqjblNTVh4NpDYsUmP38Z7Has0vlYsusE
	6a09gCuyU2/rszy5XOpO3LlCQ9SmL5AKj8FMwkeeAqC4Pt011wYCkt3BwtzIl41azVe+Dlx
	L4HzvW+6sEc1+4MiuzqP0X0xKFar3zdGGtJ4+duSf5li8i7keWn2B7Mrsdg8wtctoyAP5rS
	WpjS0Zyq8T0zdq/AxDA8PFgTlV1xS3GjP+Qe/wS+mK0NXMXSojrSu+FTube0j1j21//XQ5k
	8wL2o9PnoQGStmS8qiBCRA5j1JcMRy91fSeQJYTtkMfuyvHM7QwCJtpuFwkt6ok0WPDQ6Nn
	NyBOYrbC4a7kPZ4IkAatYoJlDOo3M+XakTXpwqWAOFjORGV9ofQSbIfAq9wyDY/jsiMH/2q
	SMVxCILvGTZSIHqktV1kQnT0Umo3wKlp2TIrZHByG+2+9zRHYVpldco6qA==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
work, add constraints for it.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 6f8d88a0681d..5c2b7eb1a6ff 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -114,6 +114,20 @@ allOf:
           maxItems: 2
         clock-names:
           maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-usb2
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        resets:
+          minItems: 1
+      required:
+        - clocks
+        - resets
 
 unevaluatedProperties: false
 

-- 
2.34.1

