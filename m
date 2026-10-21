Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792564989;
	b=koHSrO7iA9tzQthobpe7lrgjg+IjpDbT56m+D4i7YlYhE0DWaECHHgZD+TvMXuZTbPQJ
	 V/UpxFfwiwsO9fjIOXqmRt0nPJoUOxzGzyBCG8Yq0Z6VWwfmEU7UNndmGReOh4AEwbHk0
	 +Blp2s6Wl72sBSDswNJno+BpTxJByMMRQjFAfKz8B003VLt/vIVE7LNXVv0qljXQd3MBr
	 m+zsnqVOORZS/cSmvzqIk53RJV+XY6DpJH4E9nKF8N2t8PKCkqVYXZffqIVMCuejarQor
	 LlVECYrm2z0faOL1ZOaDjOCnres7V8Z/sMQN13wBfSx6qxGvJCWrYFqakBAza914x/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
	b=tpUoFL6RPVJgUIpoHkxtqiha7qfiQgePCSlq81bcyNFFFhOHDRas259uc2Y71Cxjrz6r
	 etA0rYwRwhzjiGNUjW2xOLdVPGA8+HHbiWyRah1sC2ZptCvBjzrU8MWrUmnPNWhbgtq7u
	 voL6KkFCSpoHS6cWKWBK3fopk36i3ugZ2LnKZDJrUR7ScFx8c66Y1mv1f2Fq1V1WW1Ahh
	 KkEqPF7pv3xWuPNxjeaGLGNYDZdQCRQvf8XFldnLEPG1oIeGQ7ZEWrqohKjYxtWjgNFOC
	 PhU3OixDpYi1b6wHsyB9aZRYdTH2VkOeq9GdqTHXyzgTTO5X9QdD0+TqNhCeLKkfsHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="W/GZzHF2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16396606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16396606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W/GZzHF2
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67921b515a7so319363d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564988; cv=none;
        d=google.com; s=arc-20260327;
        b=oyI9p0KoK8oxRd4rlZ1FynMhK8sKLKQl7EM4jOJ3b6ITYKkp0U0Pvg61Nx0EngZIWW
         BfuCb7Jguvbp9/1658C2iIJCueGztDWL1K0HxWJE+T+29TAWfpijvwbgJwo+HKuAK8jx
         r4IqJoWt/khX1APQnmnITgk/S+IOky6/8RQ6pMFE7TqtU5FHSzQmtc9gdHS3z39SIV/Y
         I5xqtBIjJ4ThZ8kPTE02EOdQlk09CmbNkfDTck0KoetGTI5z3y0KN8fEVH6+WcAKevI3
         95nFt2z6yWYElMgcWXOKi+MeTYZlLUKHiir/Fqsg5uULZkjEyqSm5OciNSHb9NsY/dar
         0Kvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        fh=e0CxAONvle/vfa+UIfhkUxmXQ3RBgComegKs5xiZ3hc=;
        b=dg2SBhjvrxzyaNdbd9z+9XeiHxQZ+DC2/Vler4TETbpqwRu4z3FcvEInQRGeqrgCx0
         /qQCDohHo0eJQarnJXA09Q+PKEqeONnD+ZDq/7+igQzhjX3FV3677iA4/I1afewxgLIF
         Fquc0jURxAXOGrfa07EAeS2ykfQ72FsiAGTw8RMtEW73fMn6hwz/yLdcnUExqsks+B0P
         m6H6Tv+HnM78KFctX/YM/rGTyVeJws65y1fnWi0ewE652n+9HIX5A/XWCKWVgVf0zRxD
         g15KD+ZJsUgGMAqpDObhwDKuRnL2cGww+fUM/0C75/mBYWcFgfoBJcJk2nrRnh9IeYL/
         87/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564988; x=1793169788; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        b=W/GZzHF2NY06v+oXZlgyivPlfoDTpJKe9CZuhEPaTuP3Qidpu3yorDYA41xB4bcPSC
         /M1QCIYeBX3/6FCyGJwl0TF8pFqTe88oUv3XwwvX1E5VlPp1911HfPcH3d5saDWQgsVU
         Nsll9UVTXZZuBMTm2Nwc2f03wOSjF5w+FPenbmn78a8sK+qlNzx+w1Y60DCOuAWUn1OR
         UDv5dhCVm0SZxFlLUR/YUHiWZCrrR8+FOmbCrNDyDDz8KnODQNNH/R7qPMfSPlYd8n0k
         Jxr2ymTOX88uWC8p/jyO/uN1fBbx888FwDve3IgT2GsonRNMcqXLmqB0eWi26eXiw5YH
         ZjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564988; x=1793169788;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        b=FqlxkRruOpweWmCUco7klAaqBaR+eIzKYmYWB9o+GmxAbVaaR/zgXxAjYFnVP8IIWv
         2ybvmHSJTz16XfsMoquRcLT9mDUXg1P8dcrnJKcoGKfLK3hPBuSA74nfFF6tBQnasa3e
         ZlMmts41R38FM2YtHaZUnk9AKKda8lfIZsXwhEu5hviFuWAwvanoYKYubp1RWoIByfeb
         B0YruFr8S+QxIUGkWyiEL3CW1SBg2R5JyFg3gUpLbqVFMetvoZ/uocrxbCqywmk5BOSg
         VWRyR8n3Dm8gIvmV29ptugm6X1aP3I/Ix0J+lil9j2tnrnO0/bf4NAldGkK94zWtfMo8
         NWbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjfchV2PmlqGApljMBB6fF5Dkui+YpzGr3KSxSxUwPWAhTTnpAgDiaYndAbmFSx9VFuN4VdyUPiCJFHRk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ10oZm4ZAEfZtpbFZ7ep/DkJoCTFFli4lY2i3ZOGSwC8SYOS0k
	TM/xeB1VCkDOWhXriGEtzKqP0BLsrRYDvmm4FWrGlMQ3uYZdl3ZYy+mSoX2Fe2SxqRo+1oTNw+/
	Gvww9W6I5HcExU8RN0/jbVRmJVFcV9MY=
X-Gm-Gg: AYBFou0wr450E+p5tj3S5KMUNJxaE+HWXhvJz/DZ+koSqH9nyFjwyoT0d52E5TuoX8z
	L6c/E/giHFV8VuAMv8CWsvk8QTO88w8vfOpEGebnuH0iX47tN1NO2BIkTn9UlqwFJEMRmnK8/Gw
	VnEAEeJFX3zdMWxSiQBLlqAnwMPrO05RAXMeApi0/v34JcJ1er9WVHVJ1xly5osQVVPN0Ava+8f
	HzrrxP4JnzBCb+Ah5L7mCCqz21vYrO6V6Xh2GxZ4n4lRJ//f4NUnMyOu1pv1Adjh/1xQ1VhRuwz
	MMAZT+fntraD34cbOuoqLrIIZtoF+iUL5fnHmAn+i8lLa9a9+CdaM0xB+aN7HadWVv/LaTeTEDt
	Ix6gklwWROGk0xjJeg9ytk/6a/XXOAmYtHfU=
X-Received: by 2002:a05:690e:b48:b0:677:db69:cc1a with SMTP id
 956f58d0204a3-67a0e02fb85mr644184d50.7.1792564987934; Tue, 20 Oct 2026
 23:43:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org>
In-Reply-To: <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 08:42:54 +0200
X-Gm-Features: AclHuK9RBvE_tu1JJML2kndZnV_iY7Vg0PVQd2A9ECqRfA0-uzrQqgVwLULojEo
Message-ID: <CAORyz2JaJ40+F1oyrvY_0WdqH=fritbPuuQaZ98sXagVayZPLA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> And here you write clear note about dependency, once you fixed
> bisectability.

Just to confirm, would the same text I put in the cover email be ok:

"Please note that patch 0006 and 0008 depend on patch 0005 as they need the
registers.h file, but belong to different driver areas. Patch 0009
also depends on
patch 0003 because of mt6392-regulator.h."

or did I misunderstand which dependency you are referring to?

Thank you
