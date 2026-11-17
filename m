Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893111;
	b=y1HiTRr0hxjUQiZfmxATTQ+AySM1hMUhHFmA76IUZo7Hthgc9DlvZsHzvw3GX+iCS7l5
	 iPYasxOAKqtGrwL3IofykGWotcQq8A6LT6qvGqempGxcpvcgd94vgdmcSOIRoX8mTpwhQ
	 sihZ2WCgujzX4LbV1Xl56alZMNaWc8zWmcKs8R57Sml9RZ6aTmzlfS8i8p9wOlSVJZWL+
	 x6JiCCmuLtJ0DCO5wFcUrx6yRoJtYFRu0Q44pSnELyPDNKBSEPToyd4N81mLMSQkVY2TC
	 xtqL5pN/YwyOtLAW85tQ4wqQDNEoTsGDARTZQWXYib3bJgAr8vB6oACHEoTnHtWDz1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893111;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=nAadltG0h6zZ5nCZobB19wYmsPU5qo4DEUWE6Fwn1Xs=;
	b=veIOslPJIO8NlBZ7kgHRDedBR9pGpN7FdnxW8nu3yQLMRWABbnfpoo5Yyw24/ub3cTDQ
	 oBVGf49Jm1aKxHVkwPr2kkNT2ogdNwbMXzSg5npnDhIki47ERGyLKoqk1x9pOUlLVmpKh
	 wrWmsE58desMwWeRANxYvw6/hkuGcM0X/Veawxgt5D7TilR+L/wHWAm1i19ch6N2A791L
	 z0SCnhmimofkQDqE43Q9BPzAV9jGMcY/hQsOAdpWgqKddvSXL3cNQxwYd8bfuf09OKyID
	 NDq5yDEa3KGjF9TRe7ds4MinYL19HPChWLnH7Pj9QPoa2ZW3tTHYhaPBvUwCNg2JNug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB53606A31C;
	Tue, 17 Nov 2026 05:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB53606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.23])
	by APP-03 (Coremail) with SMTP id rQCowACntpcp5ftqHrw1AQ--.11450S2;
	Tue, 17 Nov 2026 13:24:58 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: mfd: syscon: add T-Head TH1520 compatibles
Date: Tue, 17 Nov 2026 13:24:56 +0800
Message-ID: <20261117052456.3747585-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACntpcp5ftqHrw1AQ--.11450S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKrWUtFWxCw1DtF45uFy8Zrb_yoWkCFbEgF
	4xJF4Yya1xAFWrtayvqFs7JF1fJw4ak3srAw18GF43J34SvFyjqFZ7J3yYkrW8uF4fuF17
	CF97X3y7GanrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VU13ku3UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

T-Head TH1520 has multiple system controllers for the "subsystems" on
the chip.

Add them to the syscon binding.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v2:
- Added Krzysztof's ACK.
- Sorted subsystem names.

 Documentation/devicetree/bindings/mfd/syscon.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1caca22..35c4c7c2f467a 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -126,6 +126,13 @@ properties:
               - st,spear1340-misc
               - stericsson,nomadik-pmu
               - starfive,jh7100-sysmain
+              - thead,th1520-syscon-ao
+              - thead,th1520-syscon-ap
+              - thead,th1520-syscon-dsp
+              - thead,th1520-syscon-misc
+              - thead,th1520-syscon-vi
+              - thead,th1520-syscon-vo
+              - thead,th1520-syscon-vp
               - ti,am62-opp-efuse-table
               - ti,am62-usb-phy-ctrl
               - ti,am625-dss-oldi-io-ctrl
-- 
2.56.0

