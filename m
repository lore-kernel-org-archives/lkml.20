Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A024570E1
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193104; cv=none; b=XD3gzcChFmv/ZioWB9njJXxsz+rZrCg4QqDZ2szMW1yvPIVN3x0dIpY95i7CPzgpkv1W9zs4dVDViyjZl6cT5C/bbTLDcYbOyxrZpQaPIYwVspor3HYfVR73tYH3urUDpsPQD9ylzMshiw254KBzh86r56HQI/2iRGEY3eicrrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193104; c=relaxed/simple;
	bh=deANKfbzeo8P+6mjFcg+WjVuDRCAY429YUB2BPT3dak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8FZW8m36/3QwKapbkFyIwSwaEBJi7RSjV0lCeAvIM4SbKD7lA/L/4Efd5LfhGZ2V7ahNrTN4z2tPXAEgx8U3FnHJxOP4mkO6/cAAQTgTHElBhY0QMNJfhKS4a1RrHiO/XE+Evykcyt68E4a61ZQYLw8TKLWw8gsNjKgerSgSV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6/91KFA; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6/91KFA"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a7c8d1c17dso87474a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193094; x=1791797894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffwk9zd7Q1dFpAeiEuMaDR3BIsGTNaq+nzEVxlzFSrI=;
        b=U6/91KFATqqcw0uduyOpZLa3zHei86eJD9VDl6c3yjm6/FpRNxAImkzFVNGKHmRjV8
         DAl3rRu3WG62aO5faXkxJ72D/YM0fJwCPZf/W8wgFVS41buQwoGimweGjVqLAraiCzB7
         R38tPk+DtGgtmgy0ttppYP9qkj37Tg7k6ZIs+Soy1G+JfhgPudduHCxSQlkvQngcNUCf
         oP2bnIag7SQlgu/Xa2d40zAPb0VHQo+pnkDaUUTfxLDKRhuQiCo/+xmHwG7vqGqXatL0
         iFXSfZs+OgpkL1O4fRUuu1g/g10Xlh9BPuGSdGmZYf/wgW3G3tEAg+osifNHVHOMHJlz
         i41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193094; x=1791797894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ffwk9zd7Q1dFpAeiEuMaDR3BIsGTNaq+nzEVxlzFSrI=;
        b=R/RQRIC+w1nI9OYjpYVptv7TcYQfknu2mb1KWU6e/nmfgIp9+QTswRw0wjpdJ5g7h0
         5cTnYjOjvb3XkQZ9bdVyz381c8fibHRPBdV3z5czoFHo9QSOG/wvqw/WAkv+LNlfrDBU
         LOzc8sy5oFNKPNEa2e5+vnrfQ5Oic2YrbaJSSlo7x6zuizVwSEp6GYIC7ih95Jb3WrPL
         SVU0vqjPTvgVFEe7bsg6GCYKZudedjo7EkZEoEzU3huh3MlsF/trqDD+sJM6FIUkYg3E
         6hxx3mx2R35HdiG5YGwdVDExwPqYM2RBDJorCUC5Tfvra6+PEhxmnQDySxqEcE97YZV+
         5BxA==
X-Forwarded-Encrypted: i=1; AKwUvBxH8NAL78pIV9fkFkuQlaFZtTYuYGAzq3BFMiq8ASf8IWxazHQMEEP3Q8tUm/ybX1UJ8s2k/tuvIk4EeM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNZNPYl9AmZ5FnbsVzAMn1zJ5gB6FIBposXZhyzYPNeI/qFWR3
	IMTIL/0X/7n5VA4pwXT9KmWinZ8f7/VwAH1TMieNDDm6VT3FbatjY+sZ
X-Gm-Gg: AYBFou0EDlJS/tG4q2pcmGlpZDCGHZTfJxOeJszehQvkQmELOAyruCkhgZy8Nzt6NzW
	1C4Rd1jpMEdGM7n1iNzx0gTYdV7Bv3pAyNjAkRvKu25hHKvJIdn0XVMVsrWy/fImWac2t/qoDG0
	SE4bBMBLcnZtsbprYi7T75NpIryV/wIWPJe+BSycwoZAGJU8EbJ1e/cv7MQu29cqa88/YZfigXx
	PLMB9vHdtKIlV8yOlSEE3up2jNMv1WoMzWEo6bfJF9HGv1BdUY4FTShZdE6jA0TiUsS0nU6DHRt
	Lk6fiBy8HFJ8xCVy13f62KKW+1p2nbKV/GgBtBTNqSvduXG3qgnQ8Dh4KM9yi2/E5o9bol2oatx
	3Xtdnt415MF+M0KwhM9SWWnj7bqDnVHMuxxooQ8SlswMAqQeFFEmpGOrZHXAJf/d7GH+OsMF7k7
	4dgpKL2IY26dB4vRS5K4n+T70A9NS4G+3Qw22NQQCzuCJzcGByVjwmpvSPDimR1fEKCmlwJiyP7
	9VHkTJ910E6iDqjcDMoCl+AXY3o7UrZTVOaAI0jP9B47c5UVXQQEGL5d6ezAqaoHn/r0Q==
X-Received: by 2002:a17:90b:4c81:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3a6f1d2701amr12943495a91.4.1791193094249;
        Mon, 05 Oct 2026 02:38:14 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e42026fsm10568067a91.3.2026.10.05.02.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:38:13 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
Date: Mon,  5 Oct 2026 17:37:49 +0800
Message-ID: <20261005093749.645014-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005093749.645014-1-chenyou910331@gmail.com>
References: <20261005093749.645014-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal EPHY node is named "phy@0" while its reg property is <1>.
The unit-address should match the first entry of the reg property, but
this is not checked by dtc for MDIO buses. The kernel confirms the PHY
is indeed at address 1:

  eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]

Rename the node to ethernet-phy@1, which also follows the common naming
convention for ethernet PHY nodes.

Fixes: ba1abacc57cb ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Hiago De Franco <hfranco@baylibre.com>
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ec3bf305274a..d2ec70fd515e 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
 				#size-cells = <0>;
 				reg = <0>;
 
-				internal_ephy: phy@0 {
+				internal_ephy: ethernet-phy@1 {
 					compatible = "ethernet-phy-ieee802.3-c22";
 					reg = <1>;
 				};
-- 
2.43.0

