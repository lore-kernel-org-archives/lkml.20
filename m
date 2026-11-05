Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874548;
	b=2hXDgFqq7vxGbwk8cTnARsg/lIdSPOmaGdaAYzH/9KN+0JdPKWoLHNOTlp02HmHsFRdC
	 D+pTfyhW/3EIwYRhp8vp2xzqndpxDDyTzqi2xxVRWiZQb4nNvhzGDSUB3n/A66Xs5HtSf
	 +ml8OikDfwNOoo8CFqITes0pUDdHqb20/z69jQWGJDZeuUVDG2MWWyUjE6rKkHu/lK+zG
	 d6C8E476ipwUlnHK0D+NxOBFop6Lhif/sbCgAqEeZJkFWeHbX6/EQLulmp/gYYNT+jSPT
	 l/JYd+7pnxQqzElDMKzwMIi8ZD24K9Y98pIkz6sykXdK1T65I1ktQujCOpt6wiCTecA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
	b=fzZ6Io8nH1fW7mXXQzH1f0xxTAcQ6kxvt4h6Ehn47JSwWdb2PinLt3hCWcby2Bty8Adp
	 MhOCljBIBIeJA9MwQgxp33OZnwOBymtDQfB9RgDvv+cIpsDDs5+K/TnUgPLoLukBu4k1A
	 mKdZ3NKoApe+aLzbFI7ByPvNfcfL3/rVIKT+y6xejuToZ+Hiw12fvn6Hh5uxAbAlm0Jvk
	 WaW48z0s/ZQfT4L5zKr4Zslw4Y2HEJZEsBbtlZKZsH/Py/JhYgzBayCRe7dBkEzaf4XbF
	 pZKB7O+lfRTwAgvNgDOKAE6kzzH9160KlqYEydh3ob0Y19zcsEelQms3VWUobl2kCtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="a/6um+d0";
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5921606EE8A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5921606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=a/6um+d0
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so2693798a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1793874545; x=1794479345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=a/6um+d0uQTISqAYWjTSS9HtqKug8rg9E2rLH1wkEJ1y4a735hhrmhCOCiwFHxJ3nq
         A6zcqbb/g9Cvv42ERK/gzGNhSpFHNnP3IaxS8FusHfvgiVP5qUxfyDvsmsyN2dl8Wefu
         VckCYwBXoSy9paRds05qrzde8Csv1gyyZSxsRpcSxK9cAn0AAWc2SNpBRxBIuckufczm
         UqU4cZODqkx7b33OgQ6E/1hs7Blozqhb7/xi3/1GtZ9I8dS4qe8Z7m2EHgUxSLW4O6xA
         iqTHsyrS3gW5/HJxkGiV8JwkUV46y1WBvhA4S3tjiqgwztJPNW39oEQZKY0s7NRUH+rn
         Gs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874545; x=1794479345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=R4Wj8soUUVpKAbfteUJmOfddH4x9lTAExI1bTQupkiw4JOD7Gdw42HQ9cUPL7AGQw5
         9/p/XVPM5rNjNqKrBtpW28AZz3bnlqmv9YQzsHAuNbcy9eZdInx4UggNy6kLGBpdelAq
         hkT+FmNBO1sNM84HqZXUUDNY9xzI8Faqfm3miviGnd4D0Kq7XJwOx9JuWJzGX2xw3pTd
         RgoVS58R5aQHFyYSe+sLu2dpddM465jucvpfnJkYAVlGZnFJxGQFXBe9//tZEVrik7Lh
         riCiY8orpjWDiV9/KOheg4h7BTu0mgHz1scIRzNtDRC8lFf1qRtOW/iAc+fjizFKyT/y
         SI8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxPR0gRD6cqkeLAe4U7s1B3fSmw/yhb5aw7KiSGJPu1bShOPOIk9D1Fs74sEgoRkFB8sanuehFgOFENCLw=@vger.kernel.org
X-Gm-Message-State: APuU4Z96b6ub2s/e8uNsPhQUPgBFS2ZHov10AzikMuuwl02+Dzkz60jy
	TARMxDeOYfxjpmqNAgiNs3sauUVzMfSxKscXht/Bn2R+AuofU0EUA2PbOA6j5TaUySCJ+JQ0GwT
	5Kfk6nxg=
X-Gm-Gg: AYBFou2vCBO2DR5zt7uz1Feis2vbdGAyWJ9nPjvKGv1+i81QLC25KmgZlTywBwc3DZx
	OKIxDi/cdO0GB5ghIgF51Yzxw1nXsVMLujb9W82aM+wLKXi1CBEQFp8Nq7q+zmveRlDNnn7flGy
	iDqS/3d/2y8z2PsKy9XYCkuheanCKs5AYGUkreAY9zlYf+brWHPiil5/wmmIbzxS1lH6gvPGpKD
	KPaOTZng4eC8xgLvXPMOZOfMz5v0qsrVBXQlbbmB9LbXEnDtKiSzpU7cABEEjbgpNGlBG5IwcM+
	KRiE0IXjlbwu00rZvhTXTahMPZ6HcUXWICtcG/xxSmoy6uKsF+ggxlh8IrXFAxF81sUWBe5wJIC
	D/s6+E4KoVWiiLOqta9Xf8u00Y9oFI/K/48yPKAdZbHqVCtJ+C99SvKzW+LJOZ3iDMmWfCfqnel
	VNAGgXo+1Yetq0YZkxgnlb6TAda2GNilKAdy5uD8QuHhd15zM0KkNh9AgNKd4TgBUMwUE1tZh5f
	MxM0lo0qqBy+4WbPdFM2ADlcYjiXzUrB23lGD6dyub6BkZtuNyxiBbZrgLY6bEgTXvuwkmqAu1e
	NemtWGOutCUQTIJfqPgtHrM0sgWZQh7GnYiumCrnDG+qBieQIc7bAHVWAihmo12cV26UFV/EBq+
	27qGpLra9szo=
X-Received: by 2002:a05:6402:2b96:b0:6b3:bca6:b480 with SMTP id 4fb4d7f45d1cf-6b4d65a8fb5mr13928684a12.44.1793874543883;
        Thu, 05 Nov 2026 02:29:03 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b5864a87c1sm278665a12.2.2026.11.05.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:29:03 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 05 Nov 2026 11:29:02 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
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
Message-Id: <20261105-b4-dw9800k_cleanup-v3-3-6850ee6a5a5a@fairphone.com>
References: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
In-Reply-To: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793874541; l=1266;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=mcLSV3KKUJrX2Vt1xs2+yh4YAv9r2QOuUzb8TrvhqBU=;
 b=ijW9VPm7EHX86RDK200oj2lBmSMCAHlv42lvi+mFyiDqBGXFEZsOlxeuP2TZN1evalrtRLzuc
 zQ50VXLhpNbBVipwIcRAQN4VF/7J7Tb8Z9rXnYHls9BF6UrdAHwp2sx
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Update the node for the DW9800K for correctness.

Now we correctly select SAC3 mode and enable timing-control with the newly
updated device tree bindings.

This is a breaking change for a part that was previously functioning,
but only due to manual register writes in the driver. Now that we have
the correct documentation we are able to update everything to ensure
functionality with other devices using this part.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e2308abaea68a6b31a7e387881bf2..a657a5dcba9cdf750fab2478ca319f3a592ea295 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -665,8 +665,9 @@ camera_imx858_dw9800k: actuator@e {
 		reg = <0x0e>;
 		vdd-supply = <&vreg_afvdd_2p8>;
 
-		dongwoon,sac-mode = <1>;
-		dongwoon,vcm-prescale = <16>;
+		dongwoon,sac-mode = <3>;
+		dongwoon,vcm-prescale = <0>;
+		dongwoon,timing-control = <16>;
 	};
 
 	/* IMX858 @ 29 */

-- 
2.43.0

