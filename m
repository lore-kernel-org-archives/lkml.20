Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF422264CA;
	Sat,  3 Oct 2026 19:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057008; cv=none; b=A5Qq8G6Yg/u7f2NSbzQrbsFAFDroNQW1hdsukeow2HUy2FW6LbKN3YHtgGTQHozurypvq1t5UgIJRR9Brk4nvDybdZGNxfFJ6INuF9jw3XoRjx600O/o6a50rSABLtDIN1jNvdwXNDBmc2fHb7PuZSkYeYClaLDqZpJQYopn4KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057008; c=relaxed/simple;
	bh=KH8i/ZfQZWXW8Q11XsLH/3rlI5B80iU6c+KdE5CCJTM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=RsRNsi39r3/QSwQsLLjJo/n0+ARAozzo8q4Lc5GvfQW6/5KWzZQ7gPIMF/Oyd/sJnFw3HLefH7nNu/k9MDSb9vwRK1PVriJxj+jH5AgsxtlvcNeyS6xDLu8tBDbzXwlb7S/pr2sQO0R5mZzHpeOuT1jTtWdg0HHJGMpLLwdftLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=l0kJYJAc; arc=none smtp.client-ip=43.163.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="l0kJYJAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791056997; bh=CZ8jJNMTWXkD7Ie07zhV8nbM/XJJgkE75+/x/XRuIpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l0kJYJAcqWRCc0gls4wLRyiobFrqIhZcT7LL5k9Wzsnoy1cQM5tQPaNtrmJF/VFpg
	 5uToPNGh3dcW8UUnsx+ZrH10HV3rbGG0ZROvyCg4N3nig5MQ7/mcchsC55jEyERLRp
	 beRTtjfJvCQHFAgtnYaUe9BeiD6AEEQ09XfxrQgw=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id B9D93CB0; Sun, 04 Oct 2026 03:46:29 +0800
X-QQ-mid: xmsmtpt1791056794tn6zlrqep
Message-ID: <tencent_73544BE6EEA3044EC0C299F463FE82462A09@qq.com>
X-QQ-XMAILINFO: OIJV+wUmQOUAarNY/SNUs9s0PWMFLrttcOMPIqeoUYIBG/86/282ChsllCvB0r
	 hJ+Nf2HBj50wqq65vEtalVhYbhlOBdW1veTYsRcB5k24yKpP9oaTxF/pLhbXdZRhMtdZBt6VDPOR
	 q624/24n1gAU0GKasvOx344v05RMQIMRcP8x7/jeFMQTWcRmqmGrdQFO56jxcC7RYP6xq31sEVFc
	 BVbIirT7RaAlD1qyawhafDDExBN3TeilxegGL4WX9TLL/Futs7fX0mCOEvskOQBLEwJmzaxtWTEk
	 LKYSi2Bz8e9nPXyUphCebtMFsUobL4RyC0neAMVW0zGxu2HTYh42xUQsfMiAmO7Lzt/wUuaKxU7B
	 HIF9Jks2abkXY4NWpNf5sGs5UlvkE5blsmOxNlu20DJhqZKsPDDKjUZp4vzs2cOdFsHgtlFlaQYN
	 QQXlQZSvmP6zn3KIwV2C5H8CIuIoEeN5THd5NqBL0ZlCsmWpgxA4LUoXpZT5X8xNur4nVbbQGjUa
	 7V40XT0ziI6HjFflf5DG9Kwf+K2qER3GGh1y2XOGNZXObswXmrrHir1+1VScdzt2ewHrEEmZMIfx
	 JdrxHKb+8dgCvoy7Qqrn6R5ruxdkt46r48F2AzmNktYGjJVnUt9IHl55ebUbdATeHNWHxM8eYy4v
	 Q8sKo6a01zOKlOofVPucHwWdOMVRvYnqARFj/RJp+TK+cBibYahZvN1jYPL9kdRcBAZh6TpBmVwI
	 J4rMDt5axGLeQ4fOf9L/UGOEXTRJPgn2TrqVzdhvgiy7J7tzW3zcUT9UW+xCo+w+aSzEJa4mP81a
	 Jy3N5hioiA0I3ovMpVZ/oHNnkkmGf7hwTBVKXlpK/QD/zWqSagPHQ8hYmQNFqIgbk/bXgfqiGjpr
	 QFYCgMZ80DCAcx5t47oqVuXJQ+SB4dTp+cCEG1gpPNrK0U+cEsGqF5USiiXnFdun8U0nESvOZDcE
	 Y6WSQdu4UY+QKBd0senfis6QaEWMRc1CXZvnsR6pF8zD513AhnbMddHOHWbBhfwRv2d6WumgO3e4
	 eyvki8TZapmPkfTfBR6swNd4bJrCWP/3dyx74xPQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: soc: xilinx: Add EBDEE EdgeBoard FZ3A
Date: Sun,  4 Oct 2026 03:46:24 +0800
X-OQ-MSGID: <20261003194625.936288-3-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003194625.936288-1-2254650260@qq.com>
References: <20261003194625.936288-1-2254650260@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the EBDEE EdgeBoard FZ3A compatible for the ZynqMP board.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df..ead3a3c34 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -46,6 +46,7 @@ properties:
 
       - items:
           - enum:
+              - ebdee,edgeboard-fz3a
               - xlnx,zynqmp-zc1751
           - const: xlnx,zynqmp
 
-- 
2.55.0

