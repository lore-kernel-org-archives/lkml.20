Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E651A5BAE;
	Tue, 13 Oct 2026 04:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866261; cv=none; b=rFWJydTed7l6CKDUGnyEAkuYZC5COBaQLGr8OiZxqEM/KtxGg1uVYxc5bNvm0fdE/0mJ5dwEZzKcoqp/HJ9m+bJlRzpLSW6Ohl2T+9NFMoZEjuTWX/Z+XX+sQvZFVUXNRk0KhxqXb4mdF0fIQh82GpYI1HItjj4U2s5RoWpXbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866261; c=relaxed/simple;
	bh=+EKxkOcSK5DwijBLB3Lg5VbEWSiX/fTo+kjg3zmKP5g=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Zp7jhgsX+hBHev+16t2DbCKyfGd+XO4syPlygI5Wb7RIIe5tFSQag4Y/C9bVatNVdCWPQxYxCo7yPvWzHM3AGJhdeCHXAaXDIlsVyeO/uGemGUQ10Ou/mZ0WEHCOLrA0AaUX7rwm2wN5lvs6bYYU9dARktgY38e8LeIfajyd/ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=sQMWJfyf; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="sQMWJfyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791866232; bh=WQcehZ9IwKm8l9MUszjnQ760m3chdg+rDSONdFpFgFo=;
	h=From:To:Cc:Subject:Date;
	b=sQMWJfyfDJNZXiQEYSYhT5B2N2KhosTvkCa0f06EU04iJlUEyjVarQ5o8/BlxDlK1
	 yUXwbYFrWMXzNS6YpAOWJush5UmAUB/SvqlsTQJDNPKXUYpXRUMEzSnPDIhZy+Te1W
	 0hOhnk1RdqjwzMmx7pVmVjZusqMp7vfS/GmNES+A=
Received: from DiagonAlley ([120.253.195.162])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 9490E2CE; Tue, 13 Oct 2026 12:37:09 +0800
X-QQ-mid: xmsmtpt1791866229tc2k0hjsy
Message-ID: <tencent_FA6A841DD9155FEEBFDEA7FE7310568E4606@qq.com>
X-QQ-XMAILINFO: OcN56dxiYj5TUkn5KxRP3KQxk83+pVt2J/55jzxgIu/vsud4H1w7sWyne92bA9
	 4LQFWHUgHSt0aAoyc1roxGpGKFiT5YEbxuQEx+X52LmM+ja4+35lAE5rDt0D2xO4o5oaoIiRGSbs
	 S6el1wYspHgv8h1nSDoK/9ax3HzBVKJuFdf7r6QLRYgkqYEl6iYM6bEG71sfOOXofD9U2ES2y2KO
	 zbUAC03oY9I9WlLlYqWLVRtrCBZzprpww4r9gBjlry7Mlv6cxq3L7gnnpXdefZhHgby31SBoQHwo
	 Fk2c8oKBv0hba6DciaI4GHFB+max08qFuBGOCIbrramihwx8vx1rFPlaN0yjQw31+LaCyft2eBsT
	 1retIaxknl8NO5oVz9ANx/9YIMQYYoZtvl4GEpifR5jqzpkop43Vwe43iPbc6xPDfNoeK4hHPZci
	 o2dpQEifGF8OUok/VfrBhf7Efe6uIRRBVtX5RViL8i+tvUeFjBGMxhco+EeBalM6yf7CAzzdxwio
	 1RuRse9xlmjhzXbNc7jLCZQpnosDUykdVlYG2Yt+7Bff5aKuVDmSIMQEYUV9Efjp3+WxNQW8dbBm
	 euoyyhNiJkbP/LJ77zIAFKtqwFuevhLf/CZjDd9NVoWByhozyGSwuVZyfE3W0KDbyDdVQmPmR61C
	 84gj2XEVslCqLl6psQO8PsPOG/6nDmLidk5IJnmd2Ke/ifl7xskJzpNSrl4W3oxp8UNYhnuhxoEi
	 /de/A5ZwL7UhuYK4ukUrQ3hdZF8Mf1diKKLdbHz4wM4PvHTOyp2P+vPQlILEC5nrTRrnFhfSR4Eg
	 P4QwT+3z8yZHu8IcGmyniesnc4le+/JaFI7k4Q32weZRkC/QYKiC110ccOaWJ2bhqE48kMiXLsmR
	 nnJPqaP0zoiObVNA4pIwPnI8Jk/GexZyBQCBzbOFFwB3uloM3DkA8OTLlu6TfXbkqdJthVdrpBpi
	 UWnd/rBuzzyJV+AbyHVDa8XyB6hXZ2MombmQLiPDDcE5t1E7R7XuE3K7DA4YQljTfGM2OJ7zeZWy
	 CWQnS6bPKo7MvAOin6uIuGZC507gBwORu46ob6GKj08osoDTzBxERcmN6W4+CI2CgFLo3LY5EanZ
	 BPXqH9bqysZl3pxlsZ2y+SuqPa4A==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Mingxuan Guo <gmx472@qq.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingxuan Guo <gmx472@qq.com>
Subject: [PATCH v2] dt-bindings: media: i2c: dongwoon,dw9768: add Giantec GT9764
Date: Tue, 13 Oct 2026 12:37:01 +0800
X-OQ-MSGID: <20261013043701.1093897-1-gmx472@qq.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GT9764 is one of Giantec's VCM driver parts and shares the register
model of the GT9769 already covered by this binding: the vendor's VCM
driver application note (AN971) covers GT9764, GT9767, GT9768, GT9769,
GT9772 and GT9778, all built around the same 10-bit DAC with the AAC
actuator-control extensions.

Document it as a specific compatible that requires the GT9769 as its
fallback, so the existing driver binds through the GT9769 entry and no
driver change is needed.

Signed-off-by: Mingxuan Guo <gmx472@qq.com>
---
Changes in v2:
- Use the GT9769 as a fallback compatible instead of a standalone driver
  entry (Conor Dooley), and drop the driver patch accordingly; this also
  clears the Media CI warning about the compatible being undocumented.

 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
@@ -20,9 +20,13 @@ description: |-
 
 properties:
   compatible:
-    enum:
-      - dongwoon,dw9768 # for DW9768 VCM
-      - giantec,gt9769  # for GT9769 VCM
+    oneOf:
+      - enum:
+          - dongwoon,dw9768 # for DW9768 VCM
+          - giantec,gt9769  # for GT9769 VCM
+      - items:
+          - const: giantec,gt9764 # for GT9764 VCM
+          - const: giantec,gt9769 # fallback, same register model
 
   reg:
     maxItems: 1

