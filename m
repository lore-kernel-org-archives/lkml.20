Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250372;
	b=XiVwHLk7+ttVWSzgy5Ra/cyYl2YskCupkVc8sm39tYGxbtME6KA5+1iHKvRSZuPPZmT+
	 Vx6W99J1QZw/MnMjaJ29lOuAVTI712ZQZbeT/NDbFfv/fTIcZX3KhQyqUCmgi2Wtzvqf7
	 11+FzSTjjLUyATBaG7O6FoF5pFhhsxSElCdkwI7US1VbPvHmR5O0UdLigIDs3Pc++2dVZ
	 rTKQaemyXVL6PMwZBQ/HzjVs2H+Mds6n1cpsWG5g6QLv3Qr/60pOvKkrls3yprCQTtpTz
	 NU+oFpGXskkj6c4JqWpj8CHxGTO4czUcehWJHfNmcU/f6JrC0VvIPy3DUdOJGTvw3oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JRnZbRztbK3uQmcjPiHrls6jXuhvcHYv7zJm0Q9BEjQ=;
	b=qnKLDTG1B5i+rGqtnITPRiqRfb284dxyNjaZK9csqjcU1VtZb53fAwtcDRPal1PerqRQ
	 lAN11Sel9/BEv/X4ZvcDPlETyTu6pLxialX//aFHbKJTTwy6pXqGGO88oVq863yisYTIQ
	 SnSJYHJa7PzfJG6bHqMHrvoQLxZS0LyJfPfjp7BtixZv2nc+rPQ3OpHNQf9fS53mC5aMf
	 VlagboQTewIHqaE36NGjuADyMSosGdKXx4lDKZhwlDzZVZ5NWrWGZbfxCtsLBKPDAU7tk
	 OmU8QE3II4J32zAKRFAGuPAOrNt+lKSL+GsujNTzpyaf6+2sbT3gdJK1rHCuN3hmwxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G8fxqTXT;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B0D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21B0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G8fxqTXT
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ea94541adbso7636855ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250371; x=1793855171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRnZbRztbK3uQmcjPiHrls6jXuhvcHYv7zJm0Q9BEjQ=;
        b=G8fxqTXTTNESyQXKDfIY5Xm8WthtTd3j5AumXbjcPreruRzIvJMDLop8TkQXZylU3o
         IlEvSfcyGjWpqG5HLBexfP/zaWk5YYU3eDReWFuHsG3VrgOxLwqzhNxYvrFdaiwvtCbt
         /arHNvx02yfHlnSJ1jjO/tDYf/1o3w6+RJ7pGCPCqu3JILVZ05QQ83cPE61xNQHWd5nC
         HFBB2Q17w4/zRv+jCWFodkiXb3OrHw8kVX9cxRCiYzEr3xxF9zkYljFcUt2R/Yjqq8dg
         M2CFYURtpKrc4PkoREBYRaO4xVAgS3cWp7BxSi2Uy9RCLdpmE0h3DIPREbo3dcklQkFQ
         V76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250371; x=1793855171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRnZbRztbK3uQmcjPiHrls6jXuhvcHYv7zJm0Q9BEjQ=;
        b=Oa6PKg4p/T1NaydcFfnIWfpUQoxQR9bCpGmqwBZLsS9nsab72QfdWR6XISCRpvKlEm
         u1Z3AEna925kCbpP0a6Onr9BJHC2U3DaFOuEsV12m58r62nOIgz3UOo+T1KLIa7mZNBF
         vN3qZplnDV3of35P8vNB1Cu4quE+H7VFN4ukl55F75yGxcL7HsbFhgDoKoM6tRIc5aKv
         16ZwC0AFFRK6h/WWfvFSp+HjOUlKu1I9cMB62jZSpjJ9yeKF3B+wfuh9fuOrYBsLrTYo
         1PBT3I1WrqDFcnYNeLK0WsYXNFdgH5mibYe5MlYitwqGYyHoiQ6DhaRGPHmBncvbWjZh
         bpaw==
X-Forwarded-Encrypted: i=1; AKwUvBx8CgIZLes1o/IwxvnnO9Js63/4rKPqIHwCPQgTbaj5bXZuJTcILR0zXtR/iSNYJnz6MTlXm6EufiJpgjA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5WpLA60vcd4MQumc+sdFAfmjgzwMK8cRic/rOLdWLqnqx/TMo
	WGay8qU5ujeI/RM+sKXjm4eXh7Mc3C5FrE74iTDN/pbYWHJNaRYEOcYq
X-Gm-Gg: AYBFou0XNVBMB1vpTJNSDcHSKh05YTkGliQ3jIwWjCVJl0zrjXOIsXvxHr9MghURziv
	CvGb9ztFkTF6nZGngS//7113Tmk3laap/PgOSRTlObUdHNgOprj3APQjnwBfeG+EZHC/SnxLDRv
	7PDiatKaA7bE37mJ+wS0vPHlimTsNNFjuxdj7Moepf4aCXwGG7kTkpQotJeNY9RsdU9ZHsL7OeU
	7GYOaaCJaXhci7XqvYKE2tNgLpWhILf2Vp6PRlCtTHcw17rEjDTYEz7SVzR5418DZOBI2eLGnrl
	RYjgNOF1RrUT6pw87byrPWHTBe889agcutUxMGAu4yd5ROe6nZQh4g1MBnJtjGQtCFZrOS7D4Oj
	ty2le1IVX50iY5/6PUUD2sG56B0D+gTd1aOs4mSHnKRTM1AxN2me0HGGcAn4ky+tYyt7niDWT89
	OsoYRwbDbvJgTkqxZRioItPyUiRGz95KrAVE6mSTyGaL3HFiRWHfe7sPZYRL0hOI7PmNopY7Xn2
	wgyVoYDwdfMVYKgktx7Kv5ouOnzgY0OoTT7jHtmRnrF9IObES1ST64s2O3KbBGL+Wxo2H949YCs
	eyeBsXk/UXCtqXc8NuYYnJhm3FT13Q==
X-Received: by 2002:a17:902:c950:b0:2e9:61bf:6591 with SMTP id d9443c01a7336-2eb0058dfa6mr43576915ad.45.1793250371450;
        Wed, 28 Oct 2026 22:06:11 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:10 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:43 -0400
Subject: [PATCH RFC 02/12] dt-bindings: interrupt-controller: Add BL808
 PLIC
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
Message-Id: <20261029-rust-bl808-console-v1-2-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2

Describe the BL808 D0 PLIC as a T-HEAD C900 implementation. Its
interrupt specifier includes the source number and trigger type.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index cde4bb6918978b40037774269cee85212d39d4aa..9c625dff1968ae6267b0ab65ed8d4e771c70c3ec 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -72,6 +72,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - bflb,bl808-plic
               - canaan,k230-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic

-- 
2.47.3

