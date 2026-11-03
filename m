Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793733820;
	b=EX6Gkt3wrm7zaouwI343szhQFD1+WuRauUT71hEZXpZZJZl9quHkpIf8NNyK6IniN0uz
	 S77eYnhO9730Pb+qeFkhsrYWqb/5TF3N68QE+JTX8d29AUEftT67xRo9tBSl+vYcGtEc7
	 0YerXT63r5wPG0/qHjk60GVao9uZhRjRlRD8icm4pCOi7RJxbmxgJmfkuF0+F7tVv5XFE
	 VYRtijUlz4pFxufHRqWi07XWSvj6hslSuoP2VDEi7MdRiRcCDlmXaj+iU3FroCMXiFtYC
	 pp3UEyYOydwTCwWKlUPO5TnY9RsQTj0Y5Gqk64iWtAx04yamFsgoWB7WMG2eWAz05nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=px9zdgpwFS81LrmsDCxEPDim7SV/QUfj3I75ZxFvQQQ=;
	b=z2Gd68lLMbG0rqpy0DMOyg8JfF5Ne42UP1uPgVdUiWHECUtHVPoONf0kCppGT81IK97V
	 2siFX0aWKaeCztyJ+O4ZChYImEsJfrrfFyWCiAOhQyvQd7pcKF0O4L9sE0Y2hiTc/EWfP
	 DV8QsrN/N6gYXqKPdWtkq6kRFhZ0W2W/mfyl8ZXDfxhEq4EszcuIfeRI9dJrXBXK/C/T4
	 Ym/nwUjHCq/VkCKdCaZ4qSR1edFA0rjf/FSgPpWU1h5tQGqkZOXNFemT+ZJZJVtG4ktOu
	 IahCC/0knNtjL68MbE4eudCtn4dLZ6D6igTiAt4NCg9q9FYQbv3/Qyd7uWrHNn2hTig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E0333FfG;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9B6606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D9B6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E0333FfG
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-844a8bf7e25so3153727a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793733819; x=1794338619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=px9zdgpwFS81LrmsDCxEPDim7SV/QUfj3I75ZxFvQQQ=;
        b=E0333FfG4upsPuighbjoWor7MDkevAE3RMaN6spi1eERSv2pBeIJJUG3LDKs2Sb2Ii
         dJ/HJDIqWw0ivTbTFx+TGd9q+W1alH16eoWs9jXjqXLxUUtXpMw0+BbaEMt32pXW7eZX
         ofifav4nGTcLHkN0DZC0Iea4PwBsMV6aEWb5NxEiiVRdSHvanX9KBLPa9w+Q9Py+42GD
         RvU1+6uvqHZn5maBDc6a/7aPuvXOAA9ug9C811JRrv8mnPEMPyMNj31viZKIsaqoiq3Q
         2KPSglhbMUyyhII6t1EgPHDhehA7EgbPFakzSG0irtdPmMWkimrmNZ8WLVIek8HdaeNg
         S+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733819; x=1794338619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=px9zdgpwFS81LrmsDCxEPDim7SV/QUfj3I75ZxFvQQQ=;
        b=rbgNc5/n6EDbYm7hejy/vK804BmzfmUrXNvrFEv8+fKViNViTsjwerfvDEjB60JzyV
         ImYVsEuewfHX2QJAaPDu6dZ6ymYZfdE8EJyr00O6LYFgR3URHhBKAhTgPeVWtzurV9Jb
         sm51EwMCGRrX8o27qiuoN1w+N51YwbHZ8NqN2ecBhreRh469hdq2hfpPNAjzdGiCS+/3
         7OUdh28bRn6FraKnjCUsQyD5S2DNm1rd+q5Lt4uVEFDOyjjCgbyhJdzbzONJTwN3kjPK
         IGOK8MI/tyG72WJjr23/pZJQalJM6EvaxnWzjGA5Joizl/Wt/Krr3GHuaHodOzGdU2yx
         pcGQ==
X-Forwarded-Encrypted: i=1; AKwUvByUP62TbHPNQsbLWkt9mPhMqaEmcLfWY3SXUUqHnmhK7DSMX+6ZG+N5TK8qEZPWqIqxIZ/5wvdIj5E0YDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1iEn/rScykbprVScWNlEtmYyQTo1M7swxYb5ipSLhatnxh/OO
	unDmeckmFA3ccGL0Pu8E9hDL0aCUtFzRQb6s3q021fGqFHCNyBXl/NYRiHaDtflz
X-Gm-Gg: AYBFou1tvQWvVfsxfy4TJ8AV+zYa5JgZQruVaoODRqQBlGW3Vm4LHtlI2yuX8wUVXMm
	td2YMk21mD+xdrfNWK3Kbbwn6YEo1q3ZuZBHxC5rSwjhwzrj78M2Yn1FA0FZGstMSLiAVANTTPm
	CULRw8r9jxrb0KcERJ6+meNSSW1wI1pNHgKOli8dI/Edk6gzQHC/7ONr96q1eBCJpLrBDx2z7CD
	zcH6WmbhA4jxkS5WMNdIfXAXSHEpRUcpcV2kFxHhhcNZjdlUJbwJUR8a0Ihj0Pli/TfqheWO/J9
	mQ3RkN/2OebzdpbYXPklH5STeSNUfI3DP1c8xGObakQS2LrZnTLRGEzIO+2CVBCkQN1MZHdebbq
	1zJ2YSz3rST9M7cX4zNM0FsK854n/xajSFYvNloTE3slUv6AtkxGD0iyitsHQ5XtwRG1p1f6eKY
	irChLmwIzaRLhunxm89JqlG4gF8AtsekHNRLwZODt6fffBkzTlPyQKnLG8WDUyEYoxtyoKeaDHo
	Jv8+7gDFsHv8PVAbgZ5XoMYT78KqpvWZZI8kfKqLyBLv3XNZ2/N7uIXkHJ/m6zedLTu0UclUP8O
	fm+VTtALcQDdUmGnFRfqCUzg68ENcHg+v7k7F6N0rqOGaXMbxW0=
X-Received: by 2002:a05:6830:43aa:b0:828:d647:332c with SMTP id 46e09a7af769-85d3647359dmr9188302a34.25.1793733819011;
        Tue, 03 Nov 2026 11:23:39 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e16ef1sm43323a34.14.2026.11.03.11.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:23:38 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@ixit.cz,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	michael.riesch@collabora.com,
	diederik@cknow-tech.com,
	shawn.lin@rock-chips.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tglx@kernel.org,
	daniel.lezcano@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/2] dt-bindings: timer: rockchip: Add rk3568 compatible
Date: Tue,  3 Nov 2026 13:23:30 -0600
Message-ID: <20261103192331.394489-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103192331.394489-1-macroalpha82@gmail.com>
References: <20261103192331.394489-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for Rockchip RK3568 timer.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
index 6d0eb0014eee..b245a3051d66 100644
--- a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
@@ -24,6 +24,7 @@ properties:
               - rockchip,rk3228-timer
               - rockchip,rk3229-timer
               - rockchip,rk3368-timer
+              - rockchip,rk3568-timer
               - rockchip,rk3576-timer
               - rockchip,rk3588-timer
               - rockchip,px30-timer
-- 
2.53.0

