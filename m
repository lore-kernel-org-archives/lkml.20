Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CA751EE09
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789757708; cv=pass; b=s1+c1m1QoXtXSamf5GwxDq6UOluCTPqNErcZaKGAFXzr7VdMx2lTg/S630UcN2u8UPPnH5A8jMquo/B9uS7i9uV+8NNuMVDBCrSh1DahsNogCvDoB4VCRVXgozwPeXbXXdSYoD5XEYM+ZZNF0mQhBd6Hcmh7vaGyK9aUMKv63YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789757708; c=relaxed/simple;
	bh=1Onau2nroopvIQasZQPq5eAOthr53QBTDwhTG+pz9gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f55V/xudii2mDHp+z7M/xWvjTuewDeDEShMW1/xDlbdrqS0Tjd7/ZD2mnLFSrCBd2gGvoAsfu5IRe/3wDBKbrIV4V2sM+FHBcEakXDlbUVAp5VY83PMGBDsadZlwIr9RNKBl9AoibZwJ7LdaamhwtBLAcvWnCeAdJjSHk+RCZKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0uR+Yek; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0uR+Yek"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f55efe5so181516366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789757690; cv=none;
        d=google.com; s=arc-20260327;
        b=nG0oGg11TFndHBWM8niYMgWm/snHljzwKnvgk5Fb3j1h0yGJN1YrE5RbxzbgzJeiBf
         FE/4NXutSctcO1OSpZNH1FAbdN5YkAWUWno3LTf7igDPiEFsw1ZUSSKy/OiPQkbrHMrN
         DsHbltELgohsZi8jS2ODqAw02jrylk54MSAEtia62vZXyBhJOz2v2KWsrbwX5FLNA/Si
         7wBfsoR8O1SwL8hYCEypml47vH77OzqCHZf9M3U5ZBnkN53eaHSZTWt3zN/SR1pYN3VW
         yhs5Qm8VFdnEc68sB1x16zpWuIuzQfP7SkAG+WNCSQWeEtlZY2+X0cE+4dlFPUMEsVMd
         oCbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=;
        fh=Rie+cgZdpHqwYheHDXOeQ5VSm9iI4NCDjAHBynttJRo=;
        b=aS4DmJKVQUZ1OaZZY3SL9WMNCrf1cAMVTI7CODEOZiUhILT8LJn5VwXvnuZigpNJEQ
         apqWjSxnsYyMERx5OFc7oV8+1r6BZSrvpK+GmX89Pa535G2N3WVN8Cl6C4KYfFmQrRjA
         fmnLDV1loW6HyN8jhkLAzRyl/CEn4yPbX6mWBYDwfo5i2Bo+QlR811039v7n1lFXMwbs
         3ObT1H+QaffZAJlxgQWN/yFN0n6nCDc/xuFcV9R/gjMsxdmJctnLiZIOiIYEen3CPUIy
         w1UHXxyIyXxQ8jGxCG7DaL7JqBH/X7rkRyoBqFCeSJpG63Hv6J149RdbV1qjTAh40mES
         hFEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789757690; x=1790362490; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=;
        b=B0uR+YekF3Oc8XmEsgekOuJhR6m4OvFKrIoG118EKKbfCPw7SNArMZgUtJ/y4AKH2d
         tiA7vc6Xo+QZpW9raNizBz6JyBwVCdpcMnYzVS0Hqu7cGszF7iBrqwQ9l1WcrCT1e0Cw
         jwHydUseTLiGQ+RIIj6ylBypZOsWAX30vzkQ0sNC6SAwWzwRb6T4N35vY3TF71QWige7
         uF575zq3egYU91CaEmlSNVaYP+nR/y0dvdH9foLNwSm07ftlBmJ04UbLX5Hdga7XFzq9
         Idc6BGr/NsSCVaZXzTNQKRLvtt0ukdp67YMJ1PH6gowndmd/Zogta4tAZwHVoy1nXjXI
         SYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789757690; x=1790362490;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=;
        b=gg/Uy6RRG2PvkRjKtF4O0nom8OxtM0zJ0FKtWgI6hDEt+wkKiJKaL8ZLUnLBfnKhhj
         D731CYcYYRMVCZNf62mXqI1v/2pvTWfPNUzWm9lLORovKo8eO6nOZQMijcKxte4m/MZ/
         pfp9B4iBdb8tNl2Syub1+iqK0IkGTLFbbgU1zawPgKoHCLQ5EgdvH4PI6AqOybjULSNK
         I1UtXZtlRepwl3jAVxFYpk+oIv+5ZLZlk/6y/XUl0XB0Qw6gZsD3D3tqVUz+rnxRrPSR
         P/0vnq6pb8sIlkY5SghqhEdy70vF5Md74DlYsyrRzLZVh3IxhCpgmrnzCx2KBktrkEUu
         iaTg==
X-Forwarded-Encrypted: i=1; AKwUvBwu8l2IHZ7c/LIf+VKNN4Qhy/p5XpchykUMKbzlao0/4JtMcEpdq3gns70mQW/S8gFqbZErMtDXDKbZfLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lKntCycVHu9OVYQMialNhm8ZNPobQBJWxwhoh216zPqdEIwOau
	SEeJ9vzzo8CGv02M4sGcJZ9XCtUTMAoycPNbF/jqZf0iC3Uqq57Pd1CqcU89Fwz+APfdsFcKQ1i
	qtjy+otUYsR/qOn9ow4TePMq3xVTysBONRlVqSq8=
X-Gm-Gg: AYBFou0/DmdAOs3WOa9zVjaHkqMbc+BqR+bmg++0Iu/X0InndU+hsaJgDgLBW0B0DXj
	qKRhUhoEdiSGotdOOWlEl3Yyb26vHfHCKnzd/Bn9CIuzCF86rGrUAgMOQ99+FEV604UehBgBXNp
	oBM5RdyTwfnc/8M9onscMM60b7bw3gdhTGei0WHDy2mA4lappQTb8jRbNdabexVyQimk3GZV6Hm
	HBpN+BEWL1X+5SK3R7R0S6mSC7hMfrharOkaALZbH4/EvRPqkGpROLDPFJgdL6OzBiXo4bxxCRw
	UTQut5Q9mUYTdE1BmcXCyEm7punvARle/g/2wXxtTprktk2ALwBU2Q==
X-Received: by 2002:a17:907:1c0f:b0:c29:d62b:fcfa with SMTP id
 a640c23a62f3a-c2a156590b7mr346464966b.2.1789756176118; Fri, 18 Sep 2026
 11:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918175736.355305-1-l.scorcia@gmail.com> <20260918175736.355305-4-l.scorcia@gmail.com>
In-Reply-To: <20260918175736.355305-4-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 18 Sep 2026 20:29:24 +0200
X-Gm-Features: AcwNN1UQFOY_vCJJJdBRj6O6gZ3zFhbPbxWCZbiFNcjPHyL_aMs2Ld1pz8hUFJk
Message-ID: <CAORyz2KEfzcJ_2AphkPU6o-YhLAqudCXVdY+LDoynUx_FsTMJg@mail.gmail.com>
Subject: Re: [PATCH 3/4] soc: mediatek: mt8167-mmsys: add routes for all
 display paths
To: linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Sashiko found [1] some copy-and-paste errors in this patch that are
worth correcting. I must have checked it a hundred times but they
still slipped in.
I will send a revised v2 after waiting a few days for additional reviews.
Thank you

[1] https://sashiko.dev/#/message/20260918175736.355305-4-l.scorcia%40gmail.com
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
