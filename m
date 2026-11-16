Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830133;
	b=28GVA9aQabT8kS0fRew3N/8L+hbD1p8ZVos5CsdhAiHz5xUL5fVlhsm2FMOFU4qW/YzM
	 ipuqkSgXofd8DRrFKcFxQ/QYBKjfZXPMmuJZ4SzeykIIkQwuqi+YmBpqBxXksZYMSCB+c
	 ssdI9sQqqnsBwSMmbrBbcVuS8DPWj4w4Vtpj5ketjKlpxyeCYptVU6C0FkcNX2IlhIfR4
	 XkmBlcP0j5Yt8VU8pqeN+n9bKLaS3THpseOtAalPrPT2dqBdJR+TkG6rwltgh4DNFKGqH
	 zTmlkxdJAh75a6sOD2+vS/x3YNC3GscHomuFUX2RWp+IEsAoVVxxC/rFnAWjxVePnvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830133;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O8IElzxjqMQJ9EmBIa0/9YgZRkTTB3zoVA/QCHT2JbE=;
	b=R0TyUuIo9IWyYj50+zP6M+jGrSceYcwywQ0zAB74vDrSy+nmMOKgYDMaJsnwHBHyrfqd
	 cW6BXC8ayiJiInQlyTZ7v/TarkRucDumayFRzNe7mGS71pw14bXWx3rJ3Vj4+RsPyJv0K
	 Y4/trB6NG1d2jJQLN6KnZXuJRgnRjmJtFw7KChT7Yhm4G5HFRmhaLdX1pYl5kjp9mROWV
	 2bJPqotDUflrFr5r+NtiB9x6+utkatTIyO+fj5SPwiOZwuPhz6ttRWTG+55IyLjqctPVV
	 0BtkPBKSVU3fsWH3oeCcIx7Z7A1s6WLfQ6uBXQdlBDg8qzQDAY/oUqXU/0hXCHg5VVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkMZKmLS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C851606A88B;
	Mon, 16 Nov 2026 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkMZKmLS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830133;
	b=XCK5Ze7sCjDk4jkzH6j8NwNEs07AQJWGwL4I7wP9re1N1kRyHwuQ2p1i3XCtQ7rpeo74
	 gsz3wpBv4DyQC89GeNWkN0gUtxxv+oLVmN+TysD3DRfX5KzyIFpp/sLVQr8owKkcQ7quW
	 9gcjeW1Kl9jDH3FKQ8JJ1+Bd8DLE1mmbszrxo/2I3IE4S3Zy9bIMR9p66+SxqFecZNBi+
	 mnCgWnaA2SqCURdaOlJ6pgQkkQLTrH4AOEJ7C03+aiQZA+tQ3wAwgKjScT7DEB0sump+a
	 LmWha1KSsZgnFbgfJFNoOyKG7xwIvzzD5lxJIh9DA70OHdG7P00NAYxXIj0Ijy7nrvw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830133;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=O8IElzxjqMQJ9EmBIa0/9YgZRkTTB3zoVA/QCHT2JbE=;
	b=vVEEXKX4vN4eo/UJy+u5l90NRb6degLzOs2umIuYGBcqCbdd5klbd0d4qHZ85pUFKe1I
	 NjksUBKu5ZwIasQ42f2/5kF83um9RLqmDKUwvIrBGqfvtureoPpKxtiK08uapw3NoySWJ
	 vs4UQjDdK+AqlvSlKr4K2vqt70aSxd8s10Z+t0TzH98vVJNcS/KwRKQLGsAyKBtnVrKy+
	 k6sutssPrhvA05TmflqfcmSMt2E6ecCL/ljH0exgS2AaOfSXoQK5rhouzcCDFj/xJ9mdB
	 CY1CjnB4QE0pC5XcoXTpKhhfdRzWmiDlOYkBGGyNOX0SlcDYJiNvR5v5p3xzbQdFOQw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 872FD1F000C8;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830133;
	bh=O8IElzxjqMQJ9EmBIa0/9YgZRkTTB3zoVA/QCHT2JbE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dkMZKmLSRL1Ob/0EOkTi5B2BUGwzW/4i3d6FReQZPIbKoqa70RuuyIo6XoyBhAUQb
	 rGXyssekWmUWgRVXkUGddDzW61aimnxIApQ++8TPstaU4lFIEd4no/1R8QuW2YQveJ
	 BSTpS3AAUI+q2Lq18B6lZrHuM5cLq3PDx248y1gKMjp/SP4AQc6zLBP2qXtZGq+zpw
	 Hsg7nXHHTu4QIhbGyWm5FVujpVz/Dncye0qb2QQkc6PjcVh0cqGnloqQeyFbErea+c
	 /HqrDWfa8tZdYl73QzLUgRntAlqxGNiR6CCJZ2VGCUPQIZE4+ukq28ja6PKipwqCBe
	 9jH2TPQrv0ECA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1889E4A45A;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:11 +0100
Subject: [PATCH v3 4/8] dt-bindings: interrupt-controller: Add MIPS P8700
 ACLINT MSWI
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
Message-Id: <20261116-p8700-dts-v3-4-ec5d4b7de39f@htecgroup.com>
References: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
In-Reply-To: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=1430;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=zFOUG0JTBN6Duoy/8XI+grpvovTujt3/U4G1NG7BFIQ=;
 b=2G3aMhBtGSruqDbApBJlAahcUAU+LZ1KKFvWPjahInd+ewDggF0CriiFlj07bvGorM+guUnIa
 UvKC1Z5cG/aADYjMDquLt1vedrCHh1ZQu2Q1w7JhN4YKpNtMp/aBvq7
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the aclint mswi compatible for the MIPS P8700.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 62fd220e126e650e3800d8eee2a749fdbbde6108..3255ea666e1560ccca239264786fa49d444e8101 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-mswi
           - const: nuclei,ux900-aclint-mswi
+      - const: mips,p8700-aclint-mswi
 
   reg:
     maxItems: 1
@@ -46,4 +47,14 @@ examples:
                             <&cpu4intc 3>;
       reg = <0x94000000 0x00010000>;
     };
+
+  - |
+    mswi@16150000 {
+        compatible = "mips,p8700-aclint-mswi";
+        reg = <0x16150000 0x4000>;
+        interrupts-extended = <&cpu1intc 3>,
+                              <&cpu2intc 3>,
+                              <&cpu3intc 3>,
+                              <&cpu4intc 3>;
+    };
 ...

-- 
2.43.0


