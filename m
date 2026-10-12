Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DADC3C278A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791836105; cv=pass; b=c6NsBDFCOg/KCYR20oC/xOh28xS4/Dp5nXgW/Wi8lqvds8W/5Cuc+2YhAZDM7rbyCnQOvdS4Xk4trwVgR1KfSSeldN4MKnr0eAousPLgKfw0U4IXqh0pPFHb7S5y3AIb9xYld+smk2Kb07ME1j/GM8Vj4CNvpxkYPhExB4DDDUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791836105; c=relaxed/simple;
	bh=HS3YiJJwuBFYmXT0xY3bh6dZ6ZY38Ujwfz/IeJXETc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJxGoX7IupH1VtCkPvJfMn5aWHUPLnxqVX+MfGohzX3L1fkie5zKrZ/ov/BegM2A2/0SxKctprhhnWV2KBcgQFPIgAaYfnDxKo+d0Fkr8LkT+4WrK+CyrY50kEh7T5+nUNa/rZtYXCeFsvLVSlck4Dwr/MbwpM56eeUDw4KRt/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkVfUGNQ; arc=pass smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkVfUGNQ"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c2e36c7fc5dso120805366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791836101; cv=none;
        d=google.com; s=arc-20260327;
        b=BSYZwEwNS1aRZ48jskDKCnbljg7fTqAuhRDlUYelntafxJtAuFzFdkZzVsc93METJx
         /4wkiYwzNlEkQNinhtt4jtagSX4Lj8/hmNfu42ypksNilzEQ0tMbTCvUXEbWxbFVTGTE
         +KLeEUtrp/mnkrYElfaps7ydgDmxwpdbdIJJyONJjIh6zZ6sgEbpe2/1HT+BhqyyG7B6
         9lp9ix1BOBOOOEtyiHKXJHsRSVkg3WP3ur1sE6zdYqccHZri65+U4dExgBB7nEg3xx/l
         uch+83Yr3qYTsxfahIUvunZQ4cuEDojIjIaB4YXLaZCdGOLIXa/qab/Y4o8QPU96rUfw
         Kx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HS3YiJJwuBFYmXT0xY3bh6dZ6ZY38Ujwfz/IeJXETc0=;
        fh=OL4iCVikacyvYPGvbgXnfMu/I/I9nGwUWH3Trt2ccLs=;
        b=KNxgRv6CPJytCjVka8DDvwNgfE7XMWjvTSSPQr0zXNc16T48HWYaFEftkA4im2jB68
         SSdGwwcIblM+AjxmeWG3GN1N2xsr60LnmonELuFWvJTE8pCQxE5vSNf8axYSUzq8z7GV
         N4he2w8C8x4gBEL7akTozO78FOnNbdE7wmasV6QoXolAqEEoFe2VBiC6Xd5hk/BjZCuE
         T5uTPRapHOWWtLbyue4dzRzCBHEiAk5l5KJ/rWGbGZw5Afk0WeMBaOGAy+mFSNelSeiM
         +cmYhELtOgzU0qB0HYyCXUyhPrt/SawJ8RlbiHgMB4v4rRiqCRu2PFvBhJYY6ZBm2u7Z
         sOqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791836101; x=1792440901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HS3YiJJwuBFYmXT0xY3bh6dZ6ZY38Ujwfz/IeJXETc0=;
        b=IkVfUGNQ1yNmn4gzvmzSsvuKHPkeLnfQKjQDS9CEK4YTguVtbIWrAxO22oCHuGOHkF
         dRlwuvdLYjmLvKQU9IKinxTmWXZIqVUJYHv0Yf+5UiBjc3JjciinIvaEGXGiEYW98kbT
         M+L8nJJhrj+yY5JXvbjILluoBVknhjdJjL6qP0x+CeGaDMq8DFHsvVLLmw/RgCKGCpIs
         HTrSNC2iLRrFECAVjLPcPqKNt92+sKsaFkE04FXVE0SAO/FGZizZoF2E6CP6xAL40wI/
         xtUfkhLd04LfFQ6/mFQvtvoD2BZoOkmLj+RgInYKvVdVHHmZW3c6KZkTA3ws7YtBGyxC
         WIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791836101; x=1792440901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HS3YiJJwuBFYmXT0xY3bh6dZ6ZY38Ujwfz/IeJXETc0=;
        b=GzihSw884FOguSUDPzgs5E/u9Vpxo8Sc0O4LgW94lo279m6DGwz26MFzWOHRQZ8Hc0
         O2m5LOdL/7Dvsm4++fxOAsM4TTsWnYbMN7jk/17S0f7HCG75sZavIh/cYnrpuaBDw5uX
         t8NjmBkMg0zDqE3weNSJePpo+lxy/w5qL1YrIy9D0sMyKVIDQeTGfOKBcDDaSsz1UzvA
         Rj//TVhujavD8paANsFMAc5dSfG6xLPSSYq7SYmwBh+FTmQbr9pRDq+sw5TbJ/mFg40w
         xX/Vl5NO7ZKI9qe5vCIvW1iZp4OfkdlhfsZiCz22CPrJeKnrb0Kah4IFqcNxKoHYr1Jz
         7rjA==
X-Forwarded-Encrypted: i=1; AKwUvBx+QDc2xUyGuVsjP7dmZfhrS0kZNmCeCcyjErnq8DC5Vy19BDtXSDWQ0YrX0XpKGuIAlvUyFkgZ1zYqm5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoVai4+QU8foJq0Bq1VXlDH8QNDGMm67CLIKqMA3Gza6juWtpN
	IepC+/XAbedEILvylrI/A4lKwTOpY0xPx/eCKvg8AYVt3sBB1pr2ci4kHnn60ik3xKoJiWzPtiQ
	6bMISPHCqGrpVLFiNMFlmf2p4Lh7ckFM=
X-Gm-Gg: AYBFou0oT0JYScLJOdT7aZ9I1xrtu+EtvbYfhpf5bWtgKkn4O00qIxtMP3xzcd169bG
	xF0teV4D3YvXKT/5nVR2l2ZpD1XnjbdO3/7669esrBLvdto5ksaOiXXsq6nO5F/R2/huIHOYHMm
	BtjMAq//9rsz6wZpPjZQxhcWaepeDZ/CI8ZPU7jgf0niD91zp3C4sCzs3nsDnH4ytPUCPZMHThU
	O4o1kvy6viDSMHcXmBmokweRK6SiDm6XxR47jgsGZeUiIZNSVHyzhdRyM4VX6m6gqCVhQWpScJI
	YESSzVg6sbVFZzJt+YItRkKPoQleRer9iK9XZndJS/lEQoQ8Hk1vbhp7YVk=
X-Received: by 2002:a17:907:9712:b0:c2e:808a:f781 with SMTP id
 a640c23a62f3a-c31a9f8bc7cmr977286166b.34.1791836101394; Mon, 12 Oct 2026
 13:15:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006162807.2843858-1-coiaprant@gmail.com> <20261006162807.2843858-3-coiaprant@gmail.com>
 <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com> <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
In-Reply-To: <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 13 Oct 2026 04:14:52 +0800
X-Gm-Features: AclHuK9DIbMdxghdp8dVnDg3M3UkCfAC1pjnUxZw0sP50Y9CDUKz7Qi3PzTsHZE
Message-ID: <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Vinod Koul <vkoul@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vinod,

Gentle ping on this series. It was sent on Oct 6 and carries Conor's
Acked-by on the binding.

Is there anything you'd like changed, or is it just queued?

Thanks,
Coia
