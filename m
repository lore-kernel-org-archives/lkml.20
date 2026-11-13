Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530205;
	b=sgx4YBk9BGma0yJ43eK5YljAhzgJm7nuf+EbeEeIlq7cgB6E7Drq5V7o5X+G+rrNxycN
	 KhbitvNBnrrmONmlZBSxKg0ZoOmnEeA012v6ocLIiA7H/EiaS94xDHXSgD7BWQFQFnmIo
	 nOQkxDEOEySLNnKzj9Mu3CYOvcVGZ9FqwOvqleMjQZc/vC8tTrFe7PS0Q/EO59jSrLG9S
	 CnSML1pdVu2CU6v8fDIn3VHJeg/UBnet278PrtwhwbYavimO4/NqXMxZmt2s3lxbMdjSg
	 d7NYN0fQFVcyBR/sm66Ak69xf/+MhSO/pdU/c9WFzsvHI3IT5KaZtLNI+KDAu94FpzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RGmNdmvX7GyDyj3rjdj61uFnaluwz5zplmLJm2EDWYg=;
	b=3Ln9FCdZnKXV82fmjzrFNfkurzM6cFzPJbDrqStS3eg8MpprdAnG1dSCfb6sGbrZyN1Z
	 EpHI3nU0sYdarh/cFyh2kVxske6QoOWkT2RFKLjOkEQd/6T3NHmO87pKXSucfLaCaFe8W
	 xILlnac8Dn+w7dtENzmtPjoMFgtGXmotP2YHbzk5jSPtDoGplfaiEEwWdcdX02KZbqakL
	 Ftj8yDnvhhzs74gyzfAqUmQ12Ybp64pr4hLam4FbAhCQU1SzMVrWdEkLit9jsO7HuwAxm
	 7CyWaFtt+5cMxifLtt9dklhV62ZpPlrE4DzgU+YKg2VYBQq05E7vZq1pYlDuBRMRl9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WWf/6nlP";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C86F606A88D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C86F606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WWf/6nlP
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so1006565e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530204; x=1795135004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGmNdmvX7GyDyj3rjdj61uFnaluwz5zplmLJm2EDWYg=;
        b=WWf/6nlP0UfxD9vc8OJ9Z6fdrrsrhpUaHSohcrqqbtodLwuON6B84uadHnw0yh4QAa
         6SbvRbxibFnRfRVxb5gU4Dkf/eSNX0HuI3Th0VEQCqo7j7OmCl029F4km4y+eM2u6M15
         opihwMscPccw5DKudOQR8+OXADxW5RGchhEVhPmFkNGtsP5Wa8jKFwh3uUaRma3FU7eI
         00Uqqtb9Oa9BxFPaWKWUIU6D6v9Vro9GK/yFfyuFGr0vOnvfBRY+YzCaOKmieq3sHtxb
         aU/K1zSPQ54sq3KRmMKTgm3qoT1F6Jzq9hq/UBrOAKUS16RN3qAt0fMfqqpndbCJN4ND
         m3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530204; x=1795135004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RGmNdmvX7GyDyj3rjdj61uFnaluwz5zplmLJm2EDWYg=;
        b=sPMY2MtHt21fR5FSVRbymION41zeFGvwM7WqodgODKgp3Z+U8ZXOEEHweT9ooFem9w
         Is+LUMHWBrz2o0gGnrW1aXn/RcIkVZyKS774K7nDhWsyWnE5pDytpOqoxH+Kkx29/C0V
         +daFmMoIng8IuWV1Yyh925xes+aBCImBDB/bC5vAmeRlvPhX322jOsKAI0Si3McIYpsk
         JKkj4EOYPEdhQNzkeRSslmaQcNMdGzlk5gssAAyi02FsD2t+8eyxUkq0goU0BnY7he0d
         ZWXltBCGBRYkBycwCbnMV5ZK/UMDaPTr1QagvUIC6CVH54ZWUGdLAvGa/BWCvdZ5dIEb
         4N5g==
X-Forwarded-Encrypted: i=1; AL+hErEuqA0rxhO8/HPS5OwJCYm0TPElF3sGKTd1gFF+lUwPhu7RDC57Si7P57h5Oluh/l6piVg1n6A5quKeojM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x5oUaCO+TIL4NpGrcz9m5iErLa/3a3fnFvxMIeIv4+DGzffkc
	Yo3MX42vVLTzNx20056r1vjorqOQRwOhJKftxvRjDuajacaW30mW+rFY
X-Gm-Gg: AYBFou2zH2i9AqcIoAqVSVsxM8KQOcbNnzQ6yuAW0ih8lg3IO7nHNaO7sSch0Wtnj0y
	YGZOWAuMwAwY1BOqv9PqVW4CJv/FXxSbxSCWB0231eicFuYDCgtbGb+gEAIe8grwQ6BwnxAkUGY
	/b8hN/FycN2D78/0dFjFc6l5T11KAaYahaHJPaDEpQi4o/6IqYXBit0Oie+wYBQFNhINfIpJUvZ
	7JwvWyUXInG8PYrekJrmWY+j8/waeKDpAF0h6h0dy+fDj2H5c6PIdwDXyge3qq8B/KfGblXdtV1
	Ox3UCi7y9bgMrBo99FJAM5i+7CIFa+FpN46xXNwqvhlJtSNB0dRGr7SoS5Ky4G+Nj5g+gXCUL6D
	Dh2Ho1HFpN2X1y+/vE6BIxr7XYScefEGc8uXnbyVwYwo4fOe6MNfxMSe+ao/2Yj3o1RafXVgKFZ
	bIPhRaLui5KqMh+WndA0JV207L5CCWxihdSgEmXB87F8AMiUhILzHuKcCc7AQzn33vpaPdAGy+v
	OA+BXebwbebzGxI+tf5JKqTikzHws7Pq8RcgI/+J19Ig1nQrnB92F35OauULmxRzanxoKXxL1Tu
	Dv/KvBQtFtSlP0n+F64xbHwbbZluLqDtTaIpRbX/gzp5DBgfDycgKN123VhmO54lDhuYMBfYz/0
	1W9HHDoHwS5nigCQ3Ty/Cv/nlmIhTEMz+agekqR+TYKrvWkKJU05D6u0rPZEQaqc5wukvxTlk7J
	6MO99SemyRzmrmINtVMLwd+LScHqbVewRaulJdrA==
X-Received: by 2002:a05:600c:1906:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb55ac2a34mr19676755e9.17.1794530203716;
        Thu, 12 Nov 2026 16:36:43 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm3282945e9.3.2026.11.12.16.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:43 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Fri, 13 Nov 2026 00:36:41 +0000
Message-ID: <20261113003641.3664652-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112072953.989664-1-isasmendi.agus@gmail.com>
References: <20261112072953.989664-1-isasmendi.agus@gmail.com>
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

Hi Agustin,

I tested v2 as posted on my ZTE ZXHN H3600 with 512 MiB and an L2C-310
r3p3, running 6.18.60 with the OpenWrt patches for this board and
booted with kexec.

With the cache node enabled the cache comes up as before. With the node
disabled the kernel reports that the L2C is disabled by the device tree
and leaves the cache off, and the board ran 10 minutes of Wi-Fi
receive, Ethernet send and PCIe config reads on both CPUs together
without a hang. Like in my earlier test, the previous kernel had already
turned the cache off before the kexec, so this does not show what the
boot loader leaves, but you checked that part on your unit.

Tested-by: Navid Ghahremani <ghahramani.navid@gmail.com>

Best regards,
Navid
