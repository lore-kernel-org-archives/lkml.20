Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580137;
	b=ELqc9NZU1hi//8WI1fIz0cwIXH0Bjdhc0VZqKB729De5Qh6tpQrPWIOs76Ma34TPCMed
	 afl/8aUi5819n3+DgpXL4o9N8d5JvjlXmMsOH/fqU3I2iQ2dVrbjqxk7ai/SyNbsJlnf/
	 QSboHXgMNcJx4VDyAKpDkIFQqTsuka8QHCNOr7pj+LnWXw+i1zkFDmt0v1Sq0JHYuPV2D
	 87cmpvlVaonyrhDAWGn2XBbpt+2eRsYmf7eLl8PXw0zue4b2XpHAVBL0rF5FTt54xe732
	 VylK2cL4JiypwBuqP0KnyGwxqHhsYqZ1G6OyphwkDzOwSeXnV8yRxe0BTRGgxOKtZJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580137;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=qct/wdkGI2EGQDC4jhkJBEYt1YB2yrUY6a3bWaxmDWE=;
	b=MCOGMx6VxwsvYrxkZMFnCTgCriiMV0q69VfHBlPkC3EV6UFHP+1doqL1iCq8bEW8Bs5z
	 8vIJjT6kKsI+5oUVX4xCvY68Kk0LvSjf8dWJXK1MpZBz/6Gn/i8Oa2DaxFAV6dnxBZbaI
	 s4r9Uu4wUGz3W5iax1qWjOtC5GHg1iRXoa/t6BYayAZK90bEp/S3zr+xgZrp81nVTJyoq
	 3iGL5xOYaiNrs7d3M2YNWDt2MqNmNVlr2DV3qb9FreQqdj0TBArMRoGxGyzBjmANoR14b
	 8C32G1dw3myQN58zRrrLXEy2fOj6Is/hDFwa7uUf4Plz07Ig3cyMNxiNN8GkSb68pRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ZZD9V3Pa;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55D1606A8A5;
	Fri, 13 Nov 2026 14:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E55D1606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ZZD9V3Pa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794580111;
	bh=qct/wdkGI2EGQDC4jhkJBEYt1YB2yrUY6a3bWaxmDWE=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=ZZD9V3PaA/eGUz4XGcHNBCMhB/d5iI7IIE5RrkWvDBgnVBXl9lOldnv40Z4KxuqvW
	 JWe9GX3htgIc0ZWbJlFedLOQBkKNsviwlGqIEIFYDLT4yBH7rbzwFAC44c1Rf2lmzs
	 Wg+p08I+ThhRWwIapEsZVMYX9VEWw5wyK3tlSAb8=
X-QQ-mid: zesmtpsz5t1794580106t4a093ae6
X-QQ-Originating-IP: TxCi3eG70hw8P3SEBboUQyGd/3JeGSmwT4g30QHAp7o=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 22:28:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3050209387300183519
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 13 Nov 2026 14:28:17 +0000
Subject: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add K3 BS01DCMA
 RV2768
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
Message-Id: <20261113-k3-bs01dcma-v2-1-3f0de4a3e1ca@linux.spacemit.com>
References: <20261113-k3-bs01dcma-v2-0-3f0de4a3e1ca@linux.spacemit.com>
In-Reply-To: <20261113-k3-bs01dcma-v2-0-3f0de4a3e1ca@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=WDvWk3ayY+Zv6AD3GWmitve2lOknIpbYffIm3r4kiVQ=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnf5ZrsO3ijThpMKJurk6x/NWH5xi3MyUXvdZLz7uTpC
 Gy8/ce3o5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCJODxn+R0w+dqhg35+O1pCU
 boMXB4UDC3ds/p12YsksK94TqvaPnRj+2e6STlP33jJrlsYO3RDOQjEppum9mq/nfdYNU5rApiT
 ABgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MBuLJuqmNjr0v6pd+sAMax0ppjR5huDSs5dDGfbfNe5aHoijubGGXZYx
	lXQfYThhX9I1BQ3AEdGLcsZNP7wiIEzE6A/sfmsQr6zDrOVWfXHDMdcd71o3d12cyqCo8y4
	KIBl4rhW6yecPftR5/e5Atsui+FZ0cmVYImXliZxmN55hZG5ptjdE0kkTmpYG2MNwfGGXeP
	EXLZv1lfyTubaYeH49oLlP8IWIvP6Vr/sgEblAFtY5vJ5iDFkv/6SGmR9R5TpmonI5fkbHf
	A2n1GBzb1x/NGRN5BP6tk1n0DuT2UqfZGJrme1ZQMcsmC82Fku63RJAYZPXJXrBhqhGu0De
	toVZedjcR4lybC3IZYrkNwmrj3OBrCgVf9VljCTGbt+sBuCqubkiqYDSoNkmgmMumYuAVNn
	Jv/j57vHVFJHe8hrk7eKy+1V6gGIXxo4/Ylu37bVFOQrblhDFBSj/kfndIHvbio7idMb+iJ
	10lTLtukGzVYwKXffSeKJrEiVhfI6VWEPXb3shM4VnPH9EnagWHjas8b4yUbEFGI17ra2w+
	3MQXxGSM+Iyg9ys35uucrLo917uWb6Eb56MYslxPXVNm3EVRzjBwc3u5s3t42Ze7tujniWO
	AxyDddTWejhVoPbTabIujhrHdzljO3IkzGE3+EItxtWynd1i258lCWiqx3ILkyQ2V4x2FTr
	BGZOwnCND852tGpC5MaHFXpygDJz8GUg9XyrWrRoQkKd5A/N/c1Dksg7E3zUZqoK82d6cPn
	1n0I5l08dYfiBbY7AJ+V5MzIdrMg5IPRkVim4xEeeWDpPnRcsT7gCF0NPHH6qsXTc+CxVzj
	vHQJRUXA6dfnNdWDJlCgAwuD9b6hUgyTCzgC2+0oMwHE3hwd4nkRjFFLNKUX3Ksphd1dRHq
	nIhU4tAEsZVn104s5VTi/jjjRq5yp9xgTjfjAXLQVn6wov0emyRHpbbraJxDvo9UuwA6MMP
	rSl+ObGS7c6xZxPNh7LkbrUeFy4ClvI14Nwphy2ckxf9RrlgW7rsMIfIxSsurqFG3aB31hJ
	qQGFNRv9VnWsMNlqnN3KnR2zqTS61WOAlfUAH2RpAS8alHRBM3ju51kQR5IlnKYOoxO3mCX
	kkjlYQNgDpE
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

BS01DCMA is a compute module carrying two independent SpacemiT K3
nodes. The SpacemiT Cluster Server RV2768 is built from several of
these modules plugged into a carrier.

Add compatibles for the module and for a K3 node in the RV2768.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 4ee9c88984b4..31107219d855 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -37,6 +37,11 @@ properties:
               - deepcomputing,fml13v05
               - spacemit,k3-pico-itx
           - const: spacemit,k3
+      - items:
+          - enum:
+              - spacemit,k3-bs01dcma-rv2768
+          - const: spacemit,k3-bs01dcma
+          - const: spacemit,k3
       - items:
           - enum:
               - spacemit,k3-com260-ifx

-- 
2.56.0

