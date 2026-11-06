Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999067;
	b=4sZjgnW4tE7WMao5A4hKSP6kCwl7ZVf6CdV71NV73vUnjwdeyjvITtJDu5w0lp3BGLB5
	 oJpm+4zkxfHqb/us0i8Z1ofkzSy3pXQ9jPescyhdVyEdu92cct5xXOgYCYMRcxFCDCJs7
	 hxo08fb4uLM0In83NBIiRPszwnEGZa8C1GzBqE4V7wd5yd0KJw1whdNDINCR0Yh032Nsq
	 PfIVHbCs+s3bZ6rOupsnl9GSH6bLtXoqcM+Pijg+8gkJqSFwGu2jVZW4kbNZGGlVfnJtI
	 7n7InGv2UBpmpCA7lJQfXe5JeIsDvEzuGC2Q9VM3p/CJptC32bNyurO5hbf55HuDzcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999067;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=fTD8tsbEMVYtBEjAjS3mfG1A3Xr6WPS8MVtfTKag9yI=;
	b=vA3BfSgKjlQOaZfEv6w5heDK13VmcaJUHhMARUpWD7EQ0lYiK5F6occAHYZDFWeXLJZX
	 SQz13h77Noihe3h4qJiQFTOy8QRembgJkN3sdiGjf9pQhb42Tt0luDUn371AZij3NzmTd
	 c3cTyptXMFF+5Onl6bgFE1vhkd3STobuUG04qNJ8DrIkWi53amyT+Y3gLVvIEpXTOi4so
	 VkT0mU7Z3PnZYX3oDPYV+61Vs9/ELRnKagKfXwkVlK5H/CeO1PSJAPif5HZuQNSpCgKa8
	 V0wKuNXzwOg+a/UU+dLy5z64njM6AEct9Y+MoRIEf9XgQ1sgL7vGJuckFI9pZzNOJcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=jvuJe7yu;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E728606D805;
	Fri,  6 Nov 2026 21:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E728606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=jvuJe7yu
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fTD8tsbEMVYtBEjAjS3mfG1A3Xr6WPS8MVtfTKag9yI=;
	b=jvuJe7yuwU5oazvI1Eo/+WCObEmFWlQ/kwOGcRUU5w/9MG1bx4qtlj/tfXFHUzWdfPWvyu
	a7XYdKdsq1YKtu7kF0/fvjyQEGHFGwYh9FAqWcEBVk9EEK2XNk4C6qIH8scRQOkaN0mqIS
	KcAEAmX80NqYZC7L3Qde6UzT83Vor0A=
Date: Fri, 06 Nov 2026 22:04:13 +0100
Subject: [PATCH 04/15] dt-bindings: mailbox: apple,mailbox: Add t8132
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
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-4-22f4827b4ece@cyberchaos.dev>
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

The mailbox hardware remains unchanged on M4 SoC so just add its
per-SoC compatible.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
index 9a6dfb0b2f28..e870003d6cfd 100644
--- a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
@@ -31,6 +31,7 @@ properties:
               - apple,t8103-asc-mailbox
               - apple,t8112-asc-mailbox
               - apple,t8122-asc-mailbox
+              - apple,t8132-asc-mailbox
               - apple,t6000-asc-mailbox
               - apple,t6020-asc-mailbox
               - apple,t6030-asc-mailbox

-- 
2.56.0

