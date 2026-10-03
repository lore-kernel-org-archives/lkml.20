Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B761A5BAE
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990843; cv=none; b=scNoATNVLTuNlhEoQ2pRPppDfwQy2BdytDzaKetSLxIAGX3bYwB1599pnCQxpegDfG1ewUOSJcLQ/XAcrdvuzkeq5dNlJbAyKT4lkjKrOArAwo+VatEBveApg0sLy68XAsWGUTCdaMDhjGEmc65ErvnGsKY/Wo+Sfd07cRE3cMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990843; c=relaxed/simple;
	bh=fqgab4hqliuJ5sJXJfAfVMHg91lDalrjupRyxoQcC/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8aB51yV+a3FQU/q1oPcfDYjQvIj3TUP2Y1OzXiaJuySjiaBRHwdzeH5twkpFyjPC2GXaJ4ZX+CrcdWiSI6cup8+VkVYcPtdXxidA8Cqn4fa9HsanWsOQGQpytZ5gJ6BMd4nOvxyIo4E0hq3CmNjA/fafjJYKDQz900f5gxfyzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-34bb8b31647so280651eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 18:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990840; x=1791595640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WQLlaZBcT5TiKH6jHmoF4Nd+NZMHVC1YNos0SXXELk=;
        b=1EnyqAnfoxW/LYeQkaALY4f7LBXXOBMQuBA3aZagylPE6Ge7OYFQNcC2nFmdYibIKe
         mdVtsk0lofH31ASyBkj8b/hbq518zLQTJyfoTFgUImaxwmwym+Jto6/5njMrGFLIzRB3
         9+j4tu69GRAJhWZtFa3Ps7Xg2yRp7brQgiU/BABIT5ODTElBfYbVwlgCmJMBrvofI1IL
         0uokcFFuW06cvJCqkLQGeli4y+rbgPAdfB44g9n8pYonlBf8iTu9H09GGsRW9CvwVfBc
         1MavFzjgCLd3iui/2mmVl24pdNOGL6POz4aHbMlKbrhR1F+dV8QFAYqW01i84HqfIyad
         UxDw==
X-Forwarded-Encrypted: i=1; AKwUvBynhbS6o/YjLS+XgN9C3iqdOlohYbhpLIN/XJrJ78CQgljmy6dBQBPu1BsLiVfLwKN2n0wGJuD7B2p0WdE=@vger.kernel.org
X-Gm-Message-State: AFuF++k/9nxpMMJFe3ImZNPcGo8bPAmUdwsLiDqTArFfbbLNBzeSRFEb
	hhdDNnwkZ0943wfEa6nc9Epk3pDmIhE8nYwrfnG6Q3VIovYrXlA4JyA3
X-Gm-Gg: AYBFou3T4l0AtgyN3ksbLH+8ebrMhm/WMJUBr4kr0n8IABlbN0ngHnqG8aoSQ/2vG1d
	gq4udTniMeMCVbs8yRgzCcJgNi6xGOSsb/ZM9xhGLcFjpTE0ufaxZIiE3A4Y0ppBrxbwkwq4YIg
	/miF6NZpTnuNPlDvzo98UfKR/OL0VjJqp4PYyFHfVFW+lDYmeJhs+v4hFmlFFOQMgU8SRI7CBmL
	XdK3tmhiGvAiz2GbJY8o2w/84QTRUSDFSUVkfrPKSu87ob/lTyVJSuxIOtJ5EfDbkYTBucRBnOv
	A80tZI9+LKNXxYWYRmZgsZjI09V8QGLOb1DGh3JdmyY18X4iTivWnA2mXvlhAtwJ01Q3FeLXYJe
	AeNjg80bt4oqTZWT/wqpeefEs5onNMiVZv0nw13HDNDcaDwALSSB73Ffzi0dDv1v13gNUA8azCe
	bADF6+4i2sCXQ9n24CA8ZWV0BQhBroypV6DgqZvy1ExgblSl+4sTJcm4dWLD4EuE8up+7lX9QZZ
	z1YFDI935OA3s2asVcoA+JvOVUZXPL2rWzkVxyCxfJ3uPW69ckmFaLS9zikN68849l9OQecE2ok
	exj9S4BioK5djuWikFHg2WO4gUphGT2ObMy7gXOx8u2N
X-Received: by 2002:a05:701b:4510:20b0:144:eaa7:2763 with SMTP id a92af1059eb24-151c2d0b226mr1341545c88.16.1790990839589;
        Fri, 02 Oct 2026 18:27:19 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa74fa1csm1218093c88.1.2026.10.02.18.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:27:18 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] dt-bindings: nvmem: SID: Add binding for R40 SID controller
Date: Fri,  2 Oct 2026 22:25:35 -0300
Message-ID: <20261003012534.418820-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003012534.418820-3-otavio@ossystems.com.br>
References: <20261003012534.418820-3-otavio@ossystems.com.br>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner R40 SID exposes its 2Kbit eFuse at offset 0x200 of the
controller, readable directly from MMIO like on the A64. Add the R40
compatible with the A64 one as fallback, as done for the A100, H616 and
A523.

On an A40i, all 64 eFuse words read through the MMIO window match the
words read through the SID_PRCTL/SID_RDKEY registers, so the R40 does
not need the register-based readout of the H3.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
index f67470b8a2ed2..a4960b0ef8cbe 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-sid
       - items:
           - enum:
+              - allwinner,sun8i-r40-sid
               - allwinner,sun50i-a100-sid
               - allwinner,sun50i-h616-sid
               - allwinner,sun55i-a523-sid
-- 
2.55.0

