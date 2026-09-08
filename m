Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D7451C329;
	Tue,  8 Sep 2026 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860988; cv=none; b=GffAXqwX7NlOEMJRIRXm4tVzxh8YoQionAvXx22WTRgNUM1VqQzb7D3CVtBB/capF+Tp6l7IKWVa9/UX7br2/FDIl/mrLLbo+nxvUMXO3Bg1IQQMz8CN2pwiFq34AbaBUg/MpWzqwlBhGNqZF3hUfel8rGby9yxOgH6a4c+xh3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860988; c=relaxed/simple;
	bh=Q0kCzxHIUiOCWyfoizcW7qoxa2sZ8T22l48DSjpGzzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWWK0njA7cCxgE6Kz5W0Pla3WpXwFvfMc6L66XdflPXL9j6AoPhg8LjpmkMt5UZ9hi6pdYQvC1moE4YiJYKvDMTpBRkZnY2ubfhmGeeOB5d60xM5qAtQT1xQ6xVyrZCt+AdU9HyDlwoE2rJ2QY5M0hUvzb3N6dJRsArLhkUsFCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=j2ZLtX5L; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="j2ZLtX5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860928;
	bh=ga7Cc8VmPlzvTcI0Jn15zu3WuFtjhfzWSPUrlOrjDeo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=j2ZLtX5LtDJgMwTTMZ0YbVB8P+EV4wRbV5123iFvJRAZK0H9xY83pGT2sl7be/Tda
	 WgI73jrry2umwdQ88FHfKuGfIlt86WzRi4+BuuQMZ7++xdebRz0Llg/TJSocGgfi6D
	 FlDbgtnLQuOrquk/Det7K+8ciaRmF8TDveiRwFc0=
X-QQ-mid: zesmtpgz5t1788860926t19f03d4d
X-QQ-Originating-IP: YuZo8LBOHAKjnCpx7FWaCiN+8A3UW2Pf5gnxtsSGcnI=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:48:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 435864523406959042
EX-QQ-RecipientCnt: 22
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 08 Sep 2026 17:48:38 +0800
Subject: [PATCH v2 1/9] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-1-f07342ffa051@linux.spacemit.com>
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
 Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=1030;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=Q0kCzxHIUiOCWyfoizcW7qoxa2sZ8T22l48DSjpGzzE=;
 b=hlvuL0vOizfCEuqH7I1fU0zVC+wKYnG4FY47seiO2aUDL5mRXqERk9fboyiy7o8Ykpyi5Haam
 T0Mcsf1RTX8AAJZbeUHAxphaWA100Yomfl5PbItbHNYerrSiiSHA4Yj
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MxwHD6hb8WBVHcxbDB4Lj5Z8QwT9ax/hdZpRutQ0QFVIiHTeivcKv5bE
	1fSv5p1QUGgfGzAsmXPA5NceMMu4MI5KsblMKpTyfUSE0e9i3gE6zDb3QferV2gSEw2FBt1
	ue1D27KaE14f68SIknbfLlwfNuGhX/eryAtZ4c+4pqCZnxani7Uavfm76dsTf6uC6VY6VhJ
	4wuq2sOg4Jil05OVpoMVvZ7FY2zUXtyQ34hDkElmqsUO9/zhWbpd83EBSO1mg3vyXSagoOO
	zNtPxbdNI5x1cLZb+ZXfalTQy3Qz8Akf5aW4FPmTQ5ScXW6I+h0Wt6iXwMRzlsR2Sv2BiD0
	sTM8Ek/bvT90bup4HdqiaDK3e5+FFQmpaXviBrpLwmCS5iGFK4P2zN7Zci7qyZ8IHf2cdAQ
	aFvMOReNQOWveSchUKp/fHQIbmMTwEvRzOV17NaAxzM59FKPVApBLLyPKD73AdyGBxK/lh5
	GNjjnTO1uwB27aqepE5DtLyZuzuH6QmgPK3aVJqIs8NhNH9uAoTWJJYj1yEcFnCTx3WDoCY
	ia9rcq3g0MP6RwgPN3jP4uatnsKq1CwAZO1UVnpixDopkWtiYY5AZOA4BDQ/41rJWq7FdQg
	0P99fmKb4mf6Y79XCpxKPjugtk6eNChgTe2AcFuCK0MguRGI1252MrwWQ3kMqsEgJOcxX9J
	BPHIqIhb7wNgqVqickud4ReIyaUftL6oB9Ij5evTiwNnkLtFxnKh3RHfbQYOw49fT1W6S92
	6Af3lThe0PRZhMEpWDwahKb7msUGn5xVaNiXmon+e79svvUpuFjSL1COzP9k73YQs1/QJkO
	egNTGegjJOK8Q0ABvZOqAyUUFWfEXhkJwEgzxK0ylnoBuUugSzHamRzbVYNbl0whGpAjPVr
	D88AWDkE78aMO7PevlFbE1EY2Hti+eQHGR41IM9OUEQL6rCoOfmT+fRcg+5e/yMvMuL/ZM1
	DYdxgQPHnhp7ulebi0pecsb5UmNCP8o+oFai9gZ6/kl3fer0iG0LmP3jOMaCVovDzTvYCpt
	ZZaIhj5uOyBQ/+DpNbrWB1jk+lgwDxda1JokAZkBX4ez7/CCiZjyH/ELpkt0jhAurXcGjYR
	Y5h9NjdUVfx7KJuL8E91nMkMl7KJp+B+QZ1KL934EY1GJiTWFEKp+37fwbkrqVB1L2amvZ8
	ZsssM9SVWvG74nseSzBuIuN9CH0S0w2oHLLB+LyiIf1aZmkz9kHggkullg==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
has no internal OTG registers, this requires flags which disable
related features set in platform data. Add a compatible string to match
the platform data.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Ze Huang <huang.ze@linux.dev>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d4..6f8d88a0681d 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -25,6 +25,7 @@ properties:
           - nvidia,tegra124-udc
           - nxp,s32g2-usb
           - qcom,ci-hdrc
+          - spacemit,k1-usb2
       - items:
           - enum:
               - nvidia,tegra114-ehci

-- 
2.34.1

