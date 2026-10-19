Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8255348DB2F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397720; cv=pass; b=LwA+Lu8+/1Hu8RvhfuSEoXH6yY3upgeJez9Vr2ggl8JpA2WfQ751xCQXu4UFN/eFWBgeaNmlcC5HkBDKW7gzcYcrSlgkyxT5sZO5XvbStdVztuLlLbwX3zoC6YdlfgFPJxByaaDVA14IrplDJoEpyQAaanwwmSsg9SzG5c63gbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397720; c=relaxed/simple;
	bh=gMt+7JbG3jjSGNo2y6QC4ePJzR0+6YmVengrB6NbMjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTAHkgQtvzntAtZIdsSprPbS4sJSd6Cb2ADDNK/GkD/BkITzI/pcntLUDfoiToSU+7b+r3YlP0eQ+aCMylnXAmwL9s9LVO/h/cDa+BmVA0/VLDpE9etEWAjQgjgOo19RRj1cSFZPHQ5e6tas6tzNXW7dVrW35eT2h8L8G6l59/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwTUszms; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwTUszms"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66fbdb0a5a7so245858d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792397718; cv=none;
        d=google.com; s=arc-20260327;
        b=SjGNl3DGTZa/e287FUylrpMxSh8GnrZwP8ZEUcqnD5WERwgApGx7KHbnG4Q9zzf0fc
         8F35lVRr3yECW1deOKQUNW9b+6Yo03ckhhDPUb17jG/nN4cfbW1Zr9ezYQAXGEgFNWiK
         lza3b0V5moGp6durb2THTIu1fCUXScwNNjQwpIFb0TOIFJjgbAjtJXyKbFUyJGEHA+12
         kEuCZIBRb7Knv33JeIFE8CL8h4QqUZmaSK8GN7vrOjlVfU51qUYNj5hUKWyytwd81y1B
         9X2+I8CnPi7tzSkyI6SBVbW4pOOxoP6/jwurNfGMEiHUfG3KP9vkUyr0UF5bNWxM9+aw
         Lawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U1X6Ak1b5YnhMEpM33yKsTItIXYeyxlIqpx2Kl/jIFo=;
        fh=etISnodX1lbPFBnm6Nxu6/mNEb839UarvDWf/R8q1KI=;
        b=LXT6DisZiPU2G/NsFa+rvI/PwWZocWUf/z5DKMvn/ogC6SrFNeDOA6p6sGrZ6Fy0Nt
         7+gIS5NDsj1NyyikmGI/li/j/HBQK8h6+Fx/mRewLsDpUcT3XW2Dc+vJpZlDwJcQt7qr
         TTMu+IdqPRmsxFOajpIfdXL9kE0womUeULH8VGqvgWrA9jAkhLUXaRsYaTsHUbGeMum8
         kHh702T6CCYw8/qaDdXWU6va9/LPnxNHTSCz2jVfn3PncwgnGu9TCCEpMZsOZpWCHNtn
         9LBfY63ZiopMaaUTegs8xsRdpfCAM1mCO2nMQwEau+BDR7ZMFc7kwlqkktv2dmhD7Utt
         gfTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792397718; x=1793002518; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1X6Ak1b5YnhMEpM33yKsTItIXYeyxlIqpx2Kl/jIFo=;
        b=SwTUszmskZQcVUL7kwqIprP3//2zk3++YAAFYKJt79fTx1pvT/Qno8qcw6nACNqjzG
         LHHPZQ+RD20no/bncTbnBY+LObhX2U3jZPjFL7yzUfNcEIykEsXUIhhhnoH3YKqPhxyS
         5xD2vI58TTtYEBg9L8i2NjCwvYG6iFfuWKRKl7Ioo1ws3zAzD4S8iggnHXsN4imhkwg3
         mLC7zkR1HrKnBHeoP2NULCTgGWVo8a1GBEAT5BF3MJJZuRXUZj3xQbb8Tq0zFD3ZAUQy
         b0ULDFf/Mw11Rai3MkIkctqPBRwkuh66ARKa1AjgtDteLFTMvODI9cSpguA+DvRnEWH5
         yicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397718; x=1793002518;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U1X6Ak1b5YnhMEpM33yKsTItIXYeyxlIqpx2Kl/jIFo=;
        b=FzZeeemczGJKNreHXTBWcadnxGGXZbt5jAD02e2xtaBhjnmsDlFG6MJDZMlStSvKoS
         SxrDywg3h17UuJSuILuImPY7sf9QMP6CjdZw7l94lIYru1UuPP4bMhbiJWRX1KEBM9tn
         KdMxtDXlWQcgJR1+Ask6GJIarAxnM9i0xuLuaJRy+QlyIVsC46BhtB82BODDqLP6EOeb
         8L8Ut9cBvMfdrcpAlRpZCo2O6XUHkNBeZcOLVv+WBUU2EFi15GMaucOVA1JFVEPVwRHX
         sa7CLwxemlCdTEzmaTwhpRCKYna6ZBr5zhWk+6dd4WnIBB9OmHIh83Q2lVTQZ4CgoaHg
         nOpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYXoMS5i3NIsSXWi3V0L//4ALJ9DTC1jcuv8OzIWr1OT9XBKWIOdt3zOpx2q3vuob1G9BImw4NlvTCg0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmtZd2Jxj/ENd5SYJ3jRhEzfYmBe3IZya40ZM5UZy9YzsHnWbM
	jcX8jv2rsYyd5FQdmjb6CZzGH45cLfeFmcDIGQnRSUN+Azvyg0Qgbfv4h5EIOt9eVjCXs4EKC9q
	0gIlaaa6anfL/UUtb005BX0kyPgyQZw8=
X-Gm-Gg: AYBFou0H33FKtDWEBEShg0ugH85CieaohQWswaUJmyTdvpg8SVDev+zNhxCSq+jbgNx
	b3LpL3dixYJep6EGjH4qtUyIe765C75I2vhH344jFFU84ZhTR26nSyHR2ecIPO4XHnRP9eXOk5H
	/63oiSm59DyyV/kmjfd4SAL8oBbY6yxi0oNlWbg9D91zYL0ObMv+iQHg/SpXtukYrO8VW+IB9kt
	M6ESiGBWjCD5lXz5mP8KG0a/7YXf5ZSslArDVSuw9lilz6JVD/jgGtFYe9T3CsrpKR6kCX6IrkS
	4E9YkcGdp8obFGUt97Ct+jt9Lk1Fs+3yl/EOKGtw7y2hHQXOOpplAw==
X-Received: by 2002:a05:690c:686:b0:853:bc96:d834 with SMTP id
 00721157ae682-8b0f2149354mr41098877b3.2.1792397717882; Mon, 19 Oct 2026
 01:15:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com> <20261016140115.GA1798470-robh@kernel.org>
 <20261017-gainful-goldfish-of-climate-bef863@quoll>
In-Reply-To: <20261017-gainful-goldfish-of-climate-bef863@quoll>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 19 Oct 2026 16:15:03 +0800
X-Gm-Features: AclHuK9_kQhXB8k-ejh4iETHQ_pbinYeRno2QSundTfXAhMLFdEsJrbL5fs5ZiY
Message-ID: <CAPwA33+bR1BF9KeA9my07Yz7gXW7TXq8EPhwQ4GvHMSFDk+uWw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof, Rob,

> Existing OS should ignore surplus cell if the driver is coded properly.
> Same as adding new properties or new front-compatible.  The question is
> how the existing driver behaves?

As you pointed out on 5/8, the xlate checks args_count != 1. The DC-PHY
driver was merged in v6.15, so every kernel since 6.15 fails on a second cell.

1. Keep the second cell. Add the patch as follows:

- if (args->args_count != 1) {
+ if (args->args_count < 1) {
    dev_err(dev, "invalid number of arguments\n");
    return ERR_PTR(-EINVAL);
  }

+ if (args->args_count > 1 && args->args[1]) {
+   dev_err(dev, "only the transmitter is supported\n");
+   return ERR_PTR(-EINVAL);
+ }

  With Fixes: and Cc: stable, the stable kernels maintained at that
  time (currently 6.18.y and 7.2.y) keep DSI working with the new
  dts, and the receiver fails cleanly instead of getting the transmitter.
  But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
  It goes in with the series, since two-cell dts only exist after it.

2. Use a flag in the upper bits of the existing cell, as Rob
    suggested. Existing kernels are not affected, unless a board enables
    the DC-PHY CSI-2 receiver on 7.0 or later without this series.

I will write the impact clearly whichever  approach is selected in
the related commit messages and the cover letter.

I think the cell approach is easier to read and more symmetric in the
long term,
but it breaks more. Which one do you think is better? Thanks.

Best regards,
Jason
