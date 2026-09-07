Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6045388880
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788747610; cv=pass; b=IqO0a8kBuaayin5S+EcDFZdb+KoFOkax3ZlnJoD32xtY8NTEJzRGEtOC4Kr0K4sPdwHHGmLZSSyvSRa8MbEe1CJc6Eco2oT5plHxNGclQax1MwdUvYdntI/Rp+VjUq82skNl9PhWJZkMwctFlkqhHSc0yeTmSlc/96NzBVj5RYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788747610; c=relaxed/simple;
	bh=yjZIwk2F/FS+WxKDAZj/VzO4DcfE/wopEMvNXvjZ3KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=al1pzRWysZBNeUM0DdBFiyIqg1H1Rw2U3N5CE6si/iZN6smQWnHw4tgS+5Mw/t923zjvKKxT3qqhmzR2nQLav4nFaFebGuoeMaxIxEHePX8HJ31B+0yaalyusD8cnDLeTbE9uUUVonONXvI7KnkUtyEfJkNbXXzXgrc9RjAuhYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwc9eEyI; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwc9eEyI"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e27035206so2709315b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 19:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788747608; cv=none;
        d=google.com; s=arc-20260327;
        b=FTwZPJpr6FozeeBRnYurHiPQvsVm3aJOcBLfYdjpkPlQ63BeOubMxEcRb0Kzc8r5AQ
         ywq3YCdSjTVRNbzPa5n8EAAm5k46CxNwlB+D+S1dFUKs/yjJUejD14fK5vzvnwuJQdaT
         a4oNgk00j7aOqpdNgUfarkVWhIHyHYB8gbu0kjRY8a553j9mbGEFAGamtDE5QqTYwcfO
         dMbx+B5sNn1Q8FuVRLTYaqaGnpXtQFzqhFqEPaaDANcj4eVsGGh2G6nZ5aFwndFtwDbn
         kw2Bj5+FUGbOGSgAaZ4E59MEaKtJhpp9OmQZIeud95pyZ3d4B+9q1fbzDe3ZjzN6YpgM
         wpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yjZIwk2F/FS+WxKDAZj/VzO4DcfE/wopEMvNXvjZ3KI=;
        fh=Fc/richnYsc4Si8s000TjtEnDbR1h4kuAK7TmL9A/ak=;
        b=CoH8/lZH1cRhHP1whRDwhaScV6cx5i0diXmpYa5fWPlh2Eqe1vAY/XUL6v3l289auF
         rH7JxzexKLDYkxFFezxhKxw4q0OmetS4EMe2wzfULSaOxfvFivs/9tAkM0kuVVrWz8RK
         11qNQXcNanwVlcnlotR7Bjdjf3iwdUEF+29mi0aJdMBie78vmWFQJYCguPoRUhgRXd34
         HrAzNHYTKt/GERmMMcDRZCQFUA+XP1KgarxR2rjo47yAIrg2yswwT1bKPBAecs2KtQUr
         +aADcMo/xJEQ6ouwjagVmB5KCMi1y2+StLHyZcq0JtFc18Gv/IoD2wnVWqZiufYmTm4Q
         eevQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788747608; x=1789352408; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjZIwk2F/FS+WxKDAZj/VzO4DcfE/wopEMvNXvjZ3KI=;
        b=dwc9eEyI2D3sRwDz1DbghK9iJkDXxoI7VEqWBhwLHBg466tnpEsu+QHn5up5UmmOYk
         98BZgTPahQzu0oklg9uIPpU/Jcnn22fnjX9UbgAiewHKBrXu4exwEr+37kz3HOL81KTj
         LukWkGntxlFPPBTE+QmHkrmDOtYEbSejo7urSBYstIPEh1KTaBgjqynqZIqdI4WXJCKu
         W7eRo9QbBWuShiNXSr9nkKVwRcyUZpStmYtpfeVtFaEUIqRg6Q/ggXpPOjkqpgjGNKKa
         b/aQ54MoUOaRRPwBtvf+3ZEDsrBmPpeNxDNHCm/uNDqJDr6Fv/cJbBNzkcS2Xc0blqoQ
         ohtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788747608; x=1789352408;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yjZIwk2F/FS+WxKDAZj/VzO4DcfE/wopEMvNXvjZ3KI=;
        b=G9lb2ICsJhNvFVH9Ui+eXKeZ0Smo8KwvW9b7gK3V9/1EfCduIWD87HVxm7JoD+7gCd
         aCLaqFqXChaatqS3G+V8+v5uBf7QyFRKl/S552c/Pgu1ekIxDa2JzRyqVrtr8gZLWoB9
         eAA8VU3iPun109Yv3Ag0xr6loJB6i8Wma4i6eVimWpc0IXEnAMZuxRmeLjOGcBZduVDL
         j3vmNonbuug60ecXlnafPFztdZkGCqAt/mmdswmgiLgdFPsByEtC+fr2d0rOQSDTcjGM
         MEoBSNa3GUrMZzGo3rHXyuXiWUQw9e1s+5lbcOgSCEwXeNPqll6WMoMG82V4x13h3Js9
         qt/g==
X-Forwarded-Encrypted: i=1; AKwUvBxHwmU5xvpVZRki49K3QVebOtMpbXld3d05ZBAHuDZoQZKfNiMhzFnUBhI73JNaSAonGj30GiFnyLtpp+4=@vger.kernel.org
X-Gm-Message-State: AFuF++nt9MCQ7hUyOYfb2z4dUq1pk4Ys4THu4GGWVEJh+mTuryKUBlhc
	ZPWCxeqsKKemtNpdpSMX/ACFWUZEntwg16PXEI+J10g3vKMnvCZvOwd2PhFpi+IZMhguGww9Rua
	oYxE9FyuzcS4XMeQ+7X4wJjDbsfBxpxw=
X-Gm-Gg: AYBFou0qqC4SJqWFIKozI27MEItpekFbdNNxGa9b4slOTydBoP1qkFdx1GkYr2ht+Fu
	4zrTE1rBdOE39LTZF6X9i7v74D+F8tJivKIKEZp9ezy5nQasderYpvFCBJngYJp8CMJ7X6Uhzyl
	JhGPIiJRjF/8syYzI47oilfMSuoV4wpzLeCk3tK6sD1a0Z1mkzGrVFs7gqg6DvGxxcrx/Bj8Lr4
	sjZ7y1XI36IDVSKxQfJz+4YKomjnjtHydK22xbR4vj6WDBqA5lxOqgT93xmMfeKqGjjINkfVDUM
	BN0qP6hRft9yPPFBuf0Ue1QriJ6Ff9VQb4yYkKvm3ZCPYE7YvtmlSAY8jejQALHUgzH1qEiDhva
	IjXuBS0RBB2ZR3Y3xARbbm7TPtdnI8xHBOzDFUN5CcsKWJMq80DZFt8AX
X-Received: by 2002:a05:6a20:914f:b0:3b4:7e2d:a3c2 with SMTP id
 adf61e73a8af0-3da3a03e965mr30021035637.18.1788747608151; Sun, 06 Sep 2026
 19:20:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903092430.354186-1-phucduc.bui@gmail.com>
 <GV2PR04MB117394049F412AAAC59FE93FE88B62@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <CAABR9nFD1+GJiWdyxiuGVRzKjpCUfu3TQHYOLnOym3hHzOM2tg@mail.gmail.com>
 <GV2PR04MB1173931CA07AEAB48339FF71588B52@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <CAABR9nFi06-7=uHmOBFGZv1eUYCskv8WspOdUxbDuQ6vMk68Dg@mail.gmail.com> <d12608a5-468a-44ca-9442-07f2eee4e335@lunn.ch>
In-Reply-To: <d12608a5-468a-44ca-9442-07f2eee4e335@lunn.ch>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 7 Sep 2026 09:19:56 +0700
X-Gm-Features: AcwNN1UlYoV4Zt-Ge1izy88cCImOs4q6AUtidKnj8n02ugjYmxdqp8X_pG3V4ag
Message-ID: <CAABR9nHuSC3jkfuvN0hUU2spfeDfSRDmkVqsvWdwHyyQOsZe1A@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: fec: Propagate PTP initialization errors
To: Andrew Lunn <andrew@lunn.ch>
Cc: Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"davem@davemloft.net" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Stephen Boyd <swboyd@chromium.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Thank you for your feedback.

> > Second, the current implementation can silently ignore -EPROBE_DEFER and
> > continue probing instead of deferring.
>
> This is a stronger reason. You should mention it in the commit message
> as part of your justification for net, rather than net-next.
>

I will add this point to the commit message.

Best regards,
Phuc
