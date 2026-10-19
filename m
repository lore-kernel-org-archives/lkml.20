Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE594A1DEA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399899; cv=pass; b=QO5YiGP73wJxc37NeEgVVwidLzE+igo7NFgCNH3ys2AJ+oSv3RQ0kzr4RiK+8cChf6p17aBmCbyRsJ9wt+bV2V7VY+THucUarZzMXgAI7iVE+F/Cjp77B15dUBu5bAmivY5598qSJ1ygitVxhpni6lmCu2ja/clp+aA9fFKe7vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399899; c=relaxed/simple;
	bh=YZGPcgD9AFqKQnqdPo2/PO6pxJ4WnzRDZW0BsKuEGoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FwMlhw1bMhbakFd7n6ANj5mZFMRT2TCnLL7fmtkv8tRziFQANXX2H6hx8NMpvH/NoLZeOZELap6rIzvFCP34St7A4E5nMaBHPSxYkuomsmCIH0vjklMpfTj2vgLALMsZs3zAYbxv82/IBNxBSP6vp4uv4gtC/gEck683Qnj37A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4kdIJwC; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4kdIJwC"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1a5a64aaeso227603a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792399897; cv=none;
        d=google.com; s=arc-20260327;
        b=TwgMfg1xhtlv2MhOHglaH2oWh1/aucv//V7p7oN/SIaEHHVJ+NK3d4b5dX4AZAab2m
         FoeEE1+oKP2sdYmnB0dVIq7H4e6eIvjSHA3f7XEhatrSlCXBf3XO6iC3mRSsZO/C/bM5
         DL+HpUvgutAfPrpdenxSOYiFH9g6RsgFDvM2gOjA+kjx5znYZ0NqwnmXGwC6hCKnhHMK
         LynerxNOGlFEqxRlAa+wVFwCSRJcjQ6OUtdfBzGOCsC6neHKrcs4WULqp4uXJ3EqpAsp
         d6eunukKwGObDj0aSVqHon9c2Pae0OHN41qIyErgbiEJxzjJjmMSjbCxF5uG6C3t2PAl
         IGTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YZGPcgD9AFqKQnqdPo2/PO6pxJ4WnzRDZW0BsKuEGoY=;
        fh=Kg5ZBsNHIW+TLfOWqbdxiXuEZ+yByEy5dqAwTThLzDU=;
        b=nDzSqRD2j7erj6xWfw0CzEG0Q0n2Tryees3fBsqdqAP4OwiN0nWfPZXupDW4kuGINo
         APpuN3HfQXE5PvNhZDBK8OJ33muIedm9x7e3cnQAl35gj3MznAWLzVyX5W8UHtrBJH8P
         NZT0sZR5i5FmVIKJ5JvbtLWT39nrc9ZfhaRP2BAxH5asDVq/R2YKeFnAENNDh0Hp8JU2
         Q7Ml3MTwQ150ds9T2cR2uFbBeC95BPYbD0YoM1vy7M9Hdcn4pigco0EeQnS5xEN71Xjf
         S3R+SyVuHdaNUz2xmuU4KzW5/T7WONSc8HpLamuzGKnCac2CpiyoB4jYhxeR/DldW9/H
         ehUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792399897; x=1793004697; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZGPcgD9AFqKQnqdPo2/PO6pxJ4WnzRDZW0BsKuEGoY=;
        b=h4kdIJwC3BSlODG+uWwjhUoVKgH21GnE/26XSzalXkBFvjCbzB7VKV/SZ26esGMGNK
         z4aLukjexfdeDN3dY7rmH9dH6c9WDuibYKqkONoDhZ6DYlepVL1j9LxBfE4g1VTuD1RL
         2tM1BgJ5VAETgTbksQmmxjrgBvDWRcizslaGqM8fRLPXqxzrtLgCgJd5GorGdxGgNwmh
         oAbvPGOMG1FWG6xiK0gQBE7Q8uJGYu/eXLnhS6iVeI3TIEQVU4zmLy7IfAdctSQPOSpF
         QJ2WtxIoewRFAvF2Et37HVLpW5FitwfO0+UUzsnM9H7JzO3UbX/fWrliJY8fuhsETBGy
         MoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792399897; x=1793004697;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YZGPcgD9AFqKQnqdPo2/PO6pxJ4WnzRDZW0BsKuEGoY=;
        b=Dd6x0jEUTDMiU0BXOw3nVQ/3KuS0M9M5T/R+GyTTOw3s1VEq7ZmkjR9zDPHCqNdINz
         1DpVF4Pes+EZbTfhpssTRo9vV67uV386wSbApTMMjSWOkaPzZ9y1JdmwJIKJ2+1wGuAC
         4uPad7KVqpzOuCkkV4XHaxdfzOPJET3pA+2ha3+PTgjSSs4uZBTDPzdMvp2TdEg0g0cS
         vA9loiWpMAzKCGhMM3JisP/L+MVGBcll74gGkV8GrjuYvs0xfEC8Mqqf3HxGEF6UgVeN
         PSRrh+10I1nq7Qgz39bvKnLJ0hfEAEYYkgU1i+uZc+Zax4L6+EwRdLwvLK00hqXC2t+c
         3mww==
X-Forwarded-Encrypted: i=1; AKwUvBxODwN5CrGQVw4KFUDhfxo84a6Ahd2QohkdeTwmljGYvL+hqTO6oTeZUzu7sNQjNzlPa7ZKGlzntibJdkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8w9a24/MurAOrbMvyGzMttwp2KAjHf0SNbKxTKqYMFtgblZ+v
	c4sC5CL30OGn5ATg8tZA4718S0hWjjN1VnishLjcW2fwqhNeEHVCZFGqkhw016qH9WQGio1zQFW
	wbiA369020a04ETua1vImKoz9K4xXC5o=
X-Gm-Gg: AYBFou2wY16cflHE4zwvJM+cnPqD5T/Q/h+9nDS83WoLy0UZTFrF+UkfwQCosUqK3WO
	xeHyv95kQDtJGjdZh2K0MbYj75B80CcYo+wnLDHtXuAKDZtqI+cIFv7t2YY9MuDBf5Hp/hWk+wt
	6kEI/qG0O60J1QdKo8EtK12RHPq1LSs1kViFqaFZqd8KybvnZHZnD77yy8KABiwjqWu1AZiuPZC
	5wpQ06H81ehBxUtCi6YfRQ60/5TRGteK/iysN504hXrC2uFxUAmj5uhovAUABlfKzyJ62++9rJt
	pxCnGrXKoFVi56ke5BSlwqFKn5LjG7lwZjSg4S+PxpJCt7Z9ecgqJA==
X-Received: by 2002:aa7:cd16:0:b0:6b1:a509:8a2 with SMTP id
 4fb4d7f45d1cf-6b3a8153c70mr3342735a12.2.1792399896018; Mon, 19 Oct 2026
 01:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com> <f337f41f-2ada-4958-b0f9-379e78e96a3d@linaro.org>
In-Reply-To: <f337f41f-2ada-4958-b0f9-379e78e96a3d@linaro.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 19 Oct 2026 16:51:23 +0800
X-Gm-Features: AclHuK_WAI6-16edIPrAFWjpLBUVloumDqFsNS60JoizZzHWBKP6V-AdFc5lP64
Message-ID: <CAPwA33KFY0avDH-F_5w01vqWu=RK=nXZ=za-Do5Zm3S8CPtGgA@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

> Two consumers use them - which them ? Two consumers use the receivers at
> the same time ?

> Its minor but instead of "them" define what the them is.
> The second cell, if present
>
> -> you want to make clear it is optional.

I will check my description and make sure there is nothing misleading.

> Not really related to this patch but how do you envision that
> requirement being enforced, per driver ?

The transmitter and the receiver of this PHY share the bias block, and
the TRM explicitly does not allow them to run in different modes. Since
this is part of this PHY's spec, the check is done in this driver's
xlate for now.

Best regards
Jason
