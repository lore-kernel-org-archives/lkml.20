Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250448;
	b=yEW+sCrXLXM9e3plw4tQkui0+tgkmJcCrR5hKk1cJaOwxQQ5ixE1rewhoAqTCrhcJTg9
	 wHFlvU6F21LiPZefBOoOKU+oBY/58CrCQ8ZVMXfAQcJQrKzY+7D8Fw55CKuFEpzoeXBMD
	 SbVWAqk/hiZAKiK/F/Qj/73Prt5IpCEaA6ENpZ8jx/YpNSLrFCdThOViqtd8EJDQ9i5+H
	 TjYH2aa/XG/ShULi92fc4fV2jmiZ1xSAOGdRmJWC8IK9OVpMuIW13+LUvHpYRJz0SKqvD
	 UUf2D3KM/QTxxhTg+m7/zYnLWzmbLP0kIhtTP8YGlRAaM5MfEuMQUnxdyr7pQeErOSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zQNT7IgbxAV25cmcgrqKQ0fkAq6sElRF1wG29F8EmV0=;
	b=AfKRWPqZx2/8jsiPLTfTYdwji2AYzLW/sqmNE93cu8MYYXjqi0VIKRuo5kOq9i0rUONc
	 5tP8EUdPjn2nzrWi3LHn4/fVKKpvd1uqvs3vmwPcoMRZAK/EX7s3rwCAjIAHiKx9iOlGK
	 ReWo+y5Vp5N5k0/RtlqvJKlskUEE1a7l4aqrAuDFrU2bIukR8Y6OHhBL5OG8PSC3Luc4D
	 zPH+LTbY/NyAEnEn5VR0kr584U1s6fhfZp/b5dBlkVk43GfAUwLqOCRKY3RWXFX76qN1Y
	 bSF1wk94foHhdtuyhS2lC+YCZWiToYQ4fMhnbSpRmJIsd/8DRHWyDsg/vwnvFzDwFJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzCXo7ur;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29741606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29741606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzCXo7ur
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ea7987517aso10492655ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250447; x=1793855247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQNT7IgbxAV25cmcgrqKQ0fkAq6sElRF1wG29F8EmV0=;
        b=bzCXo7urDa6UbYwZ1ZnzYmKQgEctapwj9XX3Bn8RdVeT7BZVAzczVg73uESuoQICT2
         AC1tRi1ifIsL/spuMAC9rXHH24zz9UzV0bhCXMj2znMtbses/nwzdcmtvOI5TAJHqUOy
         7+GNyz64WKsk8cLgTbITiFyuukodRlO0arxkZ+evUtBnU+2XGur4cTdovJh+wGvPDklX
         AhyBWENXiWs2bVx603vlVZKWr+Mxffheq7KzR76/2ypgD7WYRyvbta7WRUUbSSLsxg7o
         vvI7wl4OVrnLvJMoh9FEUupt8XF99EOQ4DASyrM0itQFZdOaOTZir1LGMOK4AAZiqgqc
         reSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250447; x=1793855247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQNT7IgbxAV25cmcgrqKQ0fkAq6sElRF1wG29F8EmV0=;
        b=qfb9bpZaIsDBk9RA3noO5xeCn+wm98OvNHG3juty1ayMzK/6UfslsP31NHUsE1C5Kg
         OrXKdUbrtvAog5GdhEYG9xL5GIKlFKs6lrsRxXFZr6DVzdj7iVgcWIHtFSKesR0iamSZ
         Q2oXT6F421dHLsQx2oX3D2ntXRAHk4+w7LWQycHw/jfFnbOxYr+ljMQj5eTxq8XKtx5o
         Aer0MhtOuDko/6l9pYGwLybnXri4OqSDKXiPAoTpcaNsjIcGQVK3w9OKUzq4x0OlvjlT
         yPr8oKstSHF0y1xTwrL0gpXTAiMc/1HQ1NoPhpaqXOtEZtD7oHBbWI1QUUdDssjYmezb
         eQLQ==
X-Forwarded-Encrypted: i=1; AKwUvByFL/46EsRZrCY1pEelvjb0ZmDIU9qNGSoLY+3wcCXp04KuFzoenIu2dUvDh9GlBLYZwbLai3kcF9/baDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLehEGDZflimqC2gz9H/98lyYv8naHmR1bVoC/iw4HIuMRl9Aap
	k507JU5InnItTiu1f5DTEtOyqZQK9+yai3ahO09eExej6ejtoAWgloHh
X-Gm-Gg: AYBFou1uq8ktZ+sKJ8YPpLuRLVjGa663Nid0AfGueBwxKGIC5TSTM3mfamLHgcmvGag
	1tuByu3gEbL+m71EuU01pOF2MmlKVzt51hc5tjWIwKhT9nYVejhX63E98PA/x/ja/rClqQzSWvJ
	rE3lN8GrL6aFHA+WWl7y7cq1bq0vL+8gkNW0H+gB1X9Mh3UTxZagkcsok07R2yFzOsjOtseQq+2
	yUnjBQQjbWWO7kIZqZl5FelX2GnNwBX1qCAGOhxBiDaczffeh67J+nxPYV9ogoCyjh0j0negHuz
	F3WTyFekqUsUNRgXNw/5wpdJCXkUFY87ShwU7zldm7B9G5k7aLoswZYiKdzMkb3l/Ch0x5CnZY7
	v64+Ur1qz8NcG6wrLKcq2N679yH0swUTQo4Cqs/AkN5r76GToOSIP8gvDfH8zDbs0wkzeLkhN7E
	1vEHD8rTvm1sjtAC7fAVzPXrxJa4AgVCeQTtlPUYvmjMQz5knwXmhz7HTQEap1dYz/pdk6pPFE1
	2XL9JMF8zitro0QPxC0DqtDTmSBlZojX6/GxX+bwYEg7m11+UuGq4viVjEdxh9Zg3QK98mpMHyV
	M/XcvDkSZswhDMB7RaXvOwMZ7Kbq
X-Received: by 2002:a17:902:d485:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2eb004fc927mr39045165ad.27.1793250447442;
        Wed, 28 Oct 2026 22:07:27 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:27 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:52 -0400
Subject: [PATCH RFC 11/12] riscv: defconfig: Enable Bouffalo Lab SoCs
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
Message-Id: <20261029-rust-bl808-console-v1-11-b736ee920078@gmail.com>
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

Enable support for Bouffalo Lab SoCs in the default configuration and
build the BL808 device trees. The Rust UART driver remains an explicit
configuration choice.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511bb0760247f50d4b69b1e3a00527b..78a5580021d8cd654c33df931149a2224465285a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -24,6 +24,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
+CONFIG_ARCH_BOUFFALOLAB=y
 CONFIG_ARCH_ESWIN=y
 CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_SIFIVE=y

-- 
2.47.3

