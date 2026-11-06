Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999068;
	b=3NZ6TCMbhBg0goAmZlvT4OMmYepXSXwZYoQ6SLcjy8I8qblYNhCpklcsgv6CJVgYXJE3
	 ewRP96M9Z40iUocZqBfSKU6ismvibdcTsR93PZXt4rpvH85R8XJ1VTjSY+y7iC9qhV+G5
	 o8cNcPkxoHDZoN1KGXohlimHtPdy/5OsQPkya21TSdm4x7f/3IQ9WUB+5W1M6kWKhIKXw
	 jPYkB2W3TziGrKBKHINqY7e6xI45fc1yZp5bTPRAf5+WbXRGe61GafHmOWaoDzS7nD7Yx
	 e+ymwJAqvtSmSTRqVIUmG64BLIdS0PuO3lSVlimWKqP2xrHXSLsufe4st/gF7tKyGcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999068;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=2Yj9uXfNvECITTH5PNv2goHZJzdSLFM4IX9SvvHkH7M=;
	b=5dcd+MfuDgjS4ZGehBdiH0Mn6RJ83eBYZS259KcmWZ/YyaMx82lYWU8lOBGSZeDTXx/7
	 skkQgp2zB9qo/mswGB+c+b5fvXMmJo64gVkHDPrZJIsFLjRghh8YfUVaBnpu+Qarlz6og
	 YUNKiM0ljLCJ3X11COuTuu/D6oMuHGTuKmF/fUUyrK8famDLLZbAeBwFOo7dn29paJdOI
	 UB91it2OhXiJXZK6pCmGuGtY0sJx8Mu7qOeftW7O3KtVr7CK2kk0jle/9wslbBKtSZTah
	 +3acgVsWfUzUBle8cOu03GKPiTjVzVksLv2sFoQ9f0yQh6SlluPIpbw2F8Ky6sHdCwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=B3piowaU;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16DD606D80B;
	Fri,  6 Nov 2026 21:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D16DD606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=B3piowaU
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Yj9uXfNvECITTH5PNv2goHZJzdSLFM4IX9SvvHkH7M=;
	b=B3piowaURxduETghUwcykSW590YjNnVPogiryIvOuogOzl2H8qnjedDPuCT7ERURfM3D9P
	O2ld6EqIq+SmIqdOTrK9600Xt/tz4NxUpfUsUAfCYs1Gh1VLlkIUOp+usTVNXfVAVyxzl/
	0Bo99Clcqr/6KCsctIvFfRu5t1Zlwk8=
Date: Fri, 06 Nov 2026 22:04:14 +0100
Subject: [PATCH 05/15] dt-bindings: mailbox: apple,mailbox: Add t8140
 compatible
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
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-5-22f4827b4ece@cyberchaos.dev>
References: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, Yureka Lilian <yureka@cyberchaos.dev>

The mailbox hardware remains unchanged on A18 Pro SoC so just add its
per-SoC compatible.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
index e870003d6cfd..774f63f0839e 100644
--- a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
@@ -32,6 +32,7 @@ properties:
               - apple,t8112-asc-mailbox
               - apple,t8122-asc-mailbox
               - apple,t8132-asc-mailbox
+              - apple,t8140-asc-mailbox
               - apple,t6000-asc-mailbox
               - apple,t6020-asc-mailbox
               - apple,t6030-asc-mailbox

-- 
2.56.0

