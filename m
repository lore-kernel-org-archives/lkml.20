Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764598;
	b=0OjpGY1JyQVs3iatzmY9s9xRqcGDnQbjTIRUHUO/Hc1R7jzpQ3rULXbvPgPUdNIIXwiq
	 B03vOVvzPUJgKNMVAJ4FnknHNtUw6mANhkysHckYv4jWj/02/6f4uNbBuQOXXeqSDxflS
	 TIm0TJKz27odHEdkmilXD1xx15TcFEbyTTFpkI8X8RqGqcy7uOTM7A3lNVZZZhR6H7SJ7
	 mkRMcGrmZ1gFiQF3PJKDswrnJ4NmJzHK79wAhTkpVYzHUhJM14flyktz6F6IdO03bZMX2
	 r8yVUOCB+QOfPGZjs9sM3y6yNj6c1NMA6c3JHot1KaMjhAqUZstdVEPkfG9lJU/4Wnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ny45OBe7md5aOufozmgYkErwn90rLNDQ3eho9bjVilA=;
	b=K/jqiqhsHdmfTu2+bnFhZIlHqgH74X12z/HVpmeFSTwFZWoEj4NMgUEeA5+ODDXXW+pD
	 tSva8SFebQuy49x+dttoXmS4EZ7AvQDeg0HEf1JZjujt/m74DxNha+eLUcjfB+yDxEev6
	 TzVDFXzr7aIbJTKjRE3W2otY2z+LVgZME28f/Pkajr2CLnDS1knfC75qiSSIdtCJq2xPE
	 4QafmhL2WC5Dvl5T2XshTLk8AUEd+e+eri1453oDEAJ2JLi6VgW5GDFXyEcQvOsMMWWqV
	 WFeef2m+9eTaOlz1gDUiZlzNoXR0w725QYkFLCnLVw66RkJl37mA1Lq8sovtj8EfoWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9vPGd20;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20D7606A330
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C20D7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9vPGd20
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37000e7234bso1628398eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794764597; x=1795369397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ny45OBe7md5aOufozmgYkErwn90rLNDQ3eho9bjVilA=;
        b=j9vPGd20QA4d1srp3DoZpoHFs2xzS/ViN3RJrX/XK6MGZwKAO+CMxanOpdescGz1Za
         uwzbsVA+H5Lh0x16eM49DuYJp/q66ePhUzxJievnH8PEodeslp9lPe8F78hpjPQSJoPH
         Mjv6OVIzPf2TKxeGcR58vtCzvtB14AIsi1/GYSssX1IWSRfWICjtDZjGIlMaKji1flkO
         4ySJsYSQa9F+i/WvDeNyp4+4vqcwhVE/f3ia58jEDAuSIJ0+Pod0jcJ62K7XKTz5Qril
         Dg1tOxu6DdHKahZersMMAGxydwGy87vTS8Xz4D/hptOR5j2JwfEd3OVD20LwnvAX3yAf
         vZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764597; x=1795369397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ny45OBe7md5aOufozmgYkErwn90rLNDQ3eho9bjVilA=;
        b=bVi9hWli2Co3DFX5m6iZodFt4Clcgt9JwdKI0kclbqP4uPog7MRJpg7vsbcXbD11I5
         lrmQPUDQg8qd/0jcWnTBiGuKQEKssJbziWefzHsNYLgOS7XgUMyjlL1xbyStwKdz19im
         3P20Xt3ZmzbRo/WsqPE/h5b+kKk5eWdDiODuiyGb+57Mh8A6OGzt2IQEYGqXsR61rTy2
         7Hrgb0+gisb75uncCGBFVQOf8LghxS6H5t/TM9WGoBpOWAhfGPmR0HRARFnsDdqu9+4B
         PuH7ptrdewUk2Yetwd0TGUxpiz7x7mQVmzYEf4Zr0lU9vgBQmQgE+8+QTMCsPqu2mbZX
         BPgw==
X-Forwarded-Encrypted: i=1; AL+hErETJCFrAHyPAv+02m3VSsrKE/fXgXm58ai/bZgvNhG64jfxfyU/leTpD6kBo69EuoQ2oqrH2qTYGUtlwoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K6Ij+9cJdpzqLeBl5NRop1UQ0MRpovOwJ06T+qFySO8PZECIq
	P4BPBRkiNumPePaRTTqSXYYbFKvKTkAOhenp6mqnk8GA3apydMfOrc9E
X-Gm-Gg: AYBFou3Rx934T1BJwc8zqwrBCtin11j30xQH45Kzb/HzRy1KmXccUgOwFMjWu8+/Rgd
	EL3eqMAqUSzVsSDzEbF/DHgElk7rhe85Y53i0iILSJuHjjWXHiEnU0ndFHl+l5FBZ1E37jDx8Uu
	hLYw8lwvCdFGdd+AQzhaf9HmnPKMAaEQ0cFQUr05VgzjQEJDPoMvZFwGeuCwSrs5SfxkVBPTTkh
	lQCh08BkmkcKx0jPxOKSgnD2wBzKFVhkT2wnLsqKyrLzmJwpiEnKWcOenwEwAtqVTL3Mq4AnLpG
	KSWpD0jxjuG8QVW0sy2jMCTzgX9AWs1b5yXesafvH1pJrp9Kv4OAH5Kr6VENDIX2d2CRNLh5efu
	j92PwPerJcdaVq2cYcVkFFZopd8hA5FxRzfHljjYBx6Ow/jxpbUPJU/k3oW9f4I0qH61dFBDFU2
	4oKP4oZhG3Di5Xedyab+Od6wbbvhMap0vXeORhdU20C9WkHHwzbA4AuAGG7JIbO8yDeImae3htn
	Ru6+vGCBXNNcQvGsisxxCPstcorO72Fi2ET8TqT2AiPvuZxk9dgJZ8Pq7/20GEyQhtY31kLisZB
	+oWuJMC48kCo4OYCiT0+l5qZ6UzZbS8RYXosdT2pOSAKzXlHeNXLtxL4xpreFciz46lzu9QsVVZ
	GxTytMaPfRLodVyjBIfT2kknENBFYzM9S7pjWivaS77Hq+uTCPgeBWJ1fPabFfVeJGuR7b57tFz
	+nAO/8KFNMbzqK3Iqo5MR4r0ZxhQ==
X-Received: by 2002:a05:7301:2024:b0:36a:18e2:64c with SMTP id 5a478bee46e88-379655d3d12mr9335361eec.11.1794764596860;
        Sun, 15 Nov 2026 09:43:16 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:9ac3:b274:12a6:a1c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm28204663eec.28.2026.11.15.09.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:43:16 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 15 Nov 2026 23:12:36 +0530
Message-Id: <20261115174237.48908-2-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115174237.48908-1-surajsonawane0215@gmail.com>
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
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

LPASS LPI gpio5 can mux EXT_MCLK1_C. The SC7280 driver names that
function ext_mclk1_c, matching SC8280XP, but the binding enum does
not allow it.

Add ext_mclk1_c to the function list.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index bc7b8dda8..5f7870fa6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -64,7 +64,7 @@ $defs:
                 qua_mi2s_data, swr_rx_clk, swr_rx_data, dmic1_clk, i2s1_clk,
                 dmic1_data, i2s1_ws, dmic2_clk, dmic2_data, i2s1_data,
                 i2s2_clk, wsa_swr_clk, i2s2_ws, wsa_swr_data, dmic3_clk,
-                dmic3_data, i2s2_data ]
+                dmic3_data, i2s2_data, ext_mclk1_c ]
         description:
           Specify the alternative function to be configured for the specified
           pins.
-- 
2.34.1

