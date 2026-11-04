Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805317;
	b=kYDWfIXCV72l4/pgRUa3rKf0ygImp2wvzx/x9ct/oLsQ0LcFCdDuXhdWQTk0C4nTIZvF
	 Q/f6NpUjxiWSSWKhMYfnD7Eeb9HGfD5k1WNGiDXIn55YIz1LeUDQV1nGFYmhfJB5U6Sms
	 CwVNkmmZdUFSkbqpBrMHefJvCGhPmwjKalgsfztsF7WN+4oUTr4FWXCDdOv8ql7JNBZJI
	 eGh9yR8VW75/lLbljZ3q7yu7yMG0WzhNdThwS2KTFxUhtkSnY8MZr+7JCKfZxas3IUikF
	 Sdd8c3DKDRQZXiqYXkfJbinuKpesmWG5J1p8H/YibSY7FMx2GCcXXaE94GEhv/kpaOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DvzKNWBCSVLjdhk3OCIyEzZaa47Q2w26gD0E6/7Rlz0=;
	b=rHajL33DLbN4vFrlng027zJ3+XuQEkWkUmoc4zj2ZspIFCxROuInaj/GPOIWis/s9ZO4
	 lZNZHcDkVBHzuyTXfT18WuXgiNBBVt403Oz2eiMfY91wgsdcy0iCcmudPXYpb+utOl5op
	 pxWpMqEkm9XpIoftFD6pWmAnJpYlXi07V8GJ2qRdtmHjnepAPfnsxHpjreGA/CKp5Z+UX
	 Is2e7jBoR0vxNS2bWqvaVYmuYScxbx0YuxGHQjA7+KMyBv3JDxQpRzl3ff0gVOSrpqQWf
	 yaHB8A5mz3c5c7IIUULqs020wI02T+aso61wMyNJbsva+qhnJMLWxP1ncCN+a0f3TSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Atw0LqGM;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE1606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70BE1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Atw0LqGM
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e47347279so501062f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805315; x=1794410115; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DvzKNWBCSVLjdhk3OCIyEzZaa47Q2w26gD0E6/7Rlz0=;
        b=Atw0LqGMB/2/XTkOeKqUeHo62urG3bqpCUaO1iiTZqhwAZKM0tCVFLLTFdcigPn3Ni
         hREtpXhXKweCPF3emkM7dRNbA0KypJrTYOOwV81hV63Ej+9uK4IQHVBfSt44WgMRocKD
         YEA/4s4cVoebzCQGw0cy0gSDFGKx8ye5WUKui3y+tXrNTWyG8BRYF2rA9kHRhTQe3HGH
         GQObvpisw8rOBuiUL2l3NNhIgICacb+NbbIDUQzx69RO+EHptQLd2ZLvw7EbMT7Iya0U
         QRqf2mlLif1JqVac3SptEfVasbVwAqdIAuvXXIuYxxzveBpN1/Bl++SF3IGZWtYoNR+Q
         I0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805315; x=1794410115;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DvzKNWBCSVLjdhk3OCIyEzZaa47Q2w26gD0E6/7Rlz0=;
        b=ohffgytD0oGfF5nqaiGDNvITlCVP94lkIaRdmKUrJYfn8zNBvbM7jb8Pw3kLX53zFF
         mux4h6j6PmcyIrZKam2FFB8HwSLNOGqr6mABrmFnt9MSxoasGjB1vUcwG92Cz3ya9nrF
         qKoTYlD/ITQP3RtLDwItM/hQxyXyft2p7v/RqYOvkJbyRpAX0FR7dQSYPMd4OcGrRatt
         ayzuLTjzQzZSPZYM6jcDR6qXvo6zhd4Qp042YVy+7UMlRbTgnCgA7cYFuijbCeLHuwju
         RMrCS5gVwZuF8NyD43MsNSVCugUrFaV4NjZQt9iHkLeMb6CaewY6mRjBMyZFLSR9KrnI
         cfFA==
X-Forwarded-Encrypted: i=1; AKwUvBw1XDFFPQj3XCmG2HxN3yyASBBIBaiqp3jMGYOxd5XGOGZwH/Aw4f9adquNl2ECQMFHc28SGNmMg1DQh6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2c526HLaTI/MzXlcx5b2QySnPAbLhXcrDi1G6g1O5nv2tLrVM
	pSx1gvCP5EF2S8X4cLfuTpjrS+NuLeSmFeHv1vrLeEi56S8R+MA51B8f
X-Gm-Gg: AYBFou3c8Kn+50C71o6vc4OmbDsAeAIFSDdHIw2BuMlbWTrOR7U7Bs7W7WMhfRRbdam
	A2xijaKUqFcCBX+tJBjjAIjaUFTBb+l57mcaLeEXz4X7JvVKmjvduVNRKqp2Zt/Wnx0DSuc4Qnb
	TC0vU/6DM8Xdbpz9qLTFnVItokgUhEqRpyOH86XDg8tnnCYIcB6ezBqwhq/lyJirKUYvgirldd9
	N7Lddn4v+8JMTNJx6Id09Mk2AoWwLHx9Y7ykFvpDoG+FvBveiEVLgHku4ILcAZcDHX9oXuHBr3d
	QDDvm5SGDr3p2pj2EFNDC41GSpPACtb3Y00mRP1tRaWnD9hn8jUf7nInihFTVj0zYRR+V9B527h
	xLq/7at0baWPa/+26E4uDasv2eNX43yZp7+Dn0D7hZMMK+OXxw3+6/CKV+G7fKM/LcpPYEblfyv
	sBch3EJmTTs+k5WQagvoe3FVnfT0RRTXiOMgO6QpKyN/irHGVBZ2MY34cCX4cTFS6QYeqgGv3tv
	NBBNBUOYOFjHpROa+i3tQEZQVc5Xuu2kP6qVQDzKpp3qVS1EUK5CpVpnUFpJxbyEuNeL+kLYlGm
	4olbJ34xnrSiywaWTM663asohcP3mfAQr8BPwWNflFI91DhutHC2euXQD+IFVS9eKiTBGv7xSSt
	kvbf25XRAhEE=
X-Received: by 2002:a05:6000:2410:b0:48e:6674:3b2f with SMTP id ffacd0b85a97d-48e6e5005c5mr38318127f8f.51.1793805314720;
        Wed, 04 Nov 2026 07:15:14 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:f5b6:cc80:9262:e168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm4435197f8f.56.2026.11.04.07.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:15:14 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 0/4] Enable USB2.0 and TSU on RZ/G3L SMARC EVK
Date: Wed, 04 Nov 2026 15:15:09 +0000
Message-Id: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAP1L62oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3dLipPiiqnTjHF1Ds7RU0+Rki0QLoxQloPqCotS0zAqwWdGxtbU
 AAgjMGVsAAAA=
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793805313; l=1499;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=gHvgnd4OP4SdT2y42oAvYKf3GElQNiCR0xYw32xnBHg=;
 b=fQ3AQclEY2DOskFDLtq6EMJ3Sd6igp7HqCHLlTD4VC6AgnHTLAqrGCbq47fp9NRymKzapBwcL
 vw7uwp9FLbnCr/Yo/i+vH5DWxy/5BnCLwji8f+bg6KueJ/hg7/fLUfr
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

Hi all,

This patch series aims to enable USB2.0 Host/Function and
TSU on RZ/G3L SMARC EVK.

To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

v8:
 * Moved patches from [1] and [2]
 * Replaced place holders.
 * Updated commit header.
 * Dropped redundant nodes from board dts as it is defined in common
   board dtsi
 * Dropped usb1_pins.

[1] https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260925061617.127349-1-biju.das.jz@bp.renesas.com/

---
Biju Das (4):
      arm64: dts: renesas: r9a08g046: Enable TSU
      arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
      arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
      arm64: dts: renesas: r9a08g046l48-smarc: Enable USB2.0 support

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 193 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  42 ++---
 2 files changed, 210 insertions(+), 25 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-usb_rzg3l-16fe5cc8a82d

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

