Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD603DEAE3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397226; cv=pass; b=a65YwGCcdUJzLCJQzOdDeVqJ9wSxqpp08g9MMkmY3wfofzq3r3wHs5c0Opwv0mvhbhbM5UfwLl9gzc2hxU8spPc7++SU9tze4cCqLKkG9Vf/VUTApI42UrINQNdP/78HII30gq59WSxEdRood6GqGOnjRxfQDVtKbrPyLYn1zsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397226; c=relaxed/simple;
	bh=ojWZsLxBf/E+oTlWaEvpu7l9Gy8FFWSO9+FSkAQyrOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Unhfafh6+1cJ5dJggK+7CSEMoToGiWJuWJNcvu+a5s1HOI6iIHlfVVPP7wjXYb6JkSUdF3g8hdUo+jtWV186kLynd23IJRQTZzC26MfMMgwCWMNN6QYTG/9swmCBGUJUjQLt2OXAZzlyz0nXSVqA8zddyEZiXq/wO8rKTbtFD1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkQOSc2K; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkQOSc2K"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8520161fdb9so1062182b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792397225; cv=none;
        d=google.com; s=arc-20260327;
        b=Io+9R4oXbVSgXpdbkKjBbz4dTJNVJkxWCzLsrQRJs1J+jYN/bQq2VyrXMOAuOLpF2j
         dTM6gsw4fogT+04Xj4AC9Nam0WKzapjie2VA5UjYyqXiE7Dzb3h2yG1dUhUxrprMP5KX
         Ydezg+9E6tU0zhQHHElSXmZhMVOJEymlP2tUVyPWiul1nj5Aayl8tNN/feJu00VSz4Pg
         lEMbIwmqvyguuLRCmJbB19CwFdh2XGqStOZL6RkeEURqZ22cXAzdUIlMaxEQkBSl9ifD
         aIB0PLTMQNYD8wolG1kY6+b4Jkl/0W3qP5gk9gnxnIH4e6wRKLCqL3Tb9sF3q7PjS7a1
         RTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OapHBRcO/exbGoTSwjHoSV037nGR79dQye9OkHt9RRs=;
        fh=Jki8AlGwORgW+8AS2Q7JXsDUBcbUERK/FjWW97vE830=;
        b=EC9JRylq0tZpksD7WLFiaZyEqcfFPOKHhgGJwXxv8q2J/bFMQMoG8BcdG2qmpB0R4B
         ZJxQN81eDHs9aIZOFPo/K6rdsmKfhPkbqFsQj3CtpXLp5Erg42gNUFywMS2fadiB3K66
         +W4QTwsfvHCKipBxMFTbeiumbtvdyG19b67CXLwGyupd54k/kGSat7UGFr6Wo8C8TCwE
         2usx4IN/33T9qjhkn3Vbq+/8QoKotXURYsT9wPSdQ+pII4owdlvW3foIDkIiC1C4pwWn
         oZo/JtJnogELWJb8OfJTf+Rkz1Hn56QktozhOfJ4EsPUQsznWCdlNwXuHhO4sNqVt8jG
         qUMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792397225; x=1793002025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OapHBRcO/exbGoTSwjHoSV037nGR79dQye9OkHt9RRs=;
        b=TkQOSc2KalxknOqVU+eistxoosuP7UMGLTMlh/iZ5K0ItpGMd7YJRzim/mcJwb2XPF
         /hTOtLNK1z3VQCDr9KAqkcofQa6mQ1Vg074rjAHkT/ZsNgxykaDt4xjoRC9N2TdeR8Cx
         AiHl5wDlHzJDdY3SzlWpZrD6qZUj7oKf5wIG05EO1ax/LM2uv3p5XEt2EZuJWihikIhw
         4xXiEehxbpV6y1VIO20PmiHGpZ8N9b7bMN8y/Otw+oQQ+B86MW5sW+nBb5WRIbk1Sdeh
         /A3kH5OX7qB4ghgcBagPE0njtCFzgAvtADwGsUzAkk4EL2u0LUhpS2+pyM/fW3bk6bdE
         gLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397225; x=1793002025;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OapHBRcO/exbGoTSwjHoSV037nGR79dQye9OkHt9RRs=;
        b=AAnQokbO+jpkKN0RjeEgk33xYuGrFLmLq9ouczXfQ13a2zT0taAE7b0jEW5qRH/cD6
         U+CYNm65bnco2R/XaHU7EbT+nrboxzcJyng9GJd0uavw5n1/VlNuAyzCIk0AzVo6w15U
         iI1lRGrH/JOh+LzKyC5wN1ub2UFZiXX6guoJVYDX48Lp6RZAop53VhhMDggXM+/MkYrW
         9WKeGNjSEPnsFWKiVeBo0VlKaeoE4+bno8EbaFlgcP0+RSm7TT60HYJNLF8Qu1hexYHJ
         lalH2UH6rpelPTH+1iNSU+AJBGowFpMKyVlrl3rQQcsaET/x5uC8/YM3c1c0zZsyucmC
         WjFQ==
X-Forwarded-Encrypted: i=1; AKwUvBy29WH8Zea6Ss1swgnrfqxxBEBwVfUxsjg0HFTDtlfyHIi50VHmJh7Vxj7J1IvcOlWtGNVqm6+3/EPRo+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3DstY3G+M7PGQ8HReowRSNtPy+enyEQ0wzS1j4pPGKc+UURrD
	ctiUgGJ0pxP9dPC5WtTT/peKC1AMS2WZdGm4wX4BcsWOOeNpSZQGXMpFFkSWStEGbp07QYO5xWc
	UBBm/7VsB4f+iVUIpP9werkE3lfTh0UA=
X-Gm-Gg: AYBFou2kd31bRtpLzGoheY5/BRm10Xu5G8bmqoXgFCSDo+Fg7NZkTD0c0N0EGZHXAGs
	tQ6UW9+skAJKezadhMFC00eH0CFPOKmcdUFzx4FbWpTSCIR1eCXcUiMszaNa/gULgKlR/1sBvK5
	kBPo6GjmgH0W9n4dxy93tOshk1YQCNpCJz85YmzzNpTOX1vps5TALMWf4LNNPy+EhwGSIJov60M
	/dpd8MvdfIhdp9qpWhfh9lYQcURuP4ftOfg9o3QBWCKVIMM9BVmUGQ1C8ekxWohtni/oIfYcvgo
	Lwftty9Hy1WH79rTUE0JqgX+F3x6GcXqtglFofK3ziaqD5/ShWxGUSUtmkKaAVVxoP7JyrboX19
	ClpTwa7OrMmKmVm26w9deHo76ZXVcdUvPqO1i6WmtryYc/XpNKZ8SBT01DkJ8D07Fz3+AFTixPz
	+0pM5JPQ==
X-Received: by 2002:a05:6a00:1f12:b0:880:973d:597a with SMTP id
 d2e1a72fcca58-8a04d04e513mr5511453b3a.53.1792397224811; Mon, 19 Oct 2026
 01:07:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017140827.290666-1-lukapanio@gmail.com> <20261017140827.290666-6-lukapanio@gmail.com>
 <20261019-free-groovy-grebe-7e50d3@quoll>
In-Reply-To: <20261019-free-groovy-grebe-7e50d3@quoll>
From: Luka Panio <lukapanio@gmail.com>
Date: Mon, 19 Oct 2026 10:06:53 +0200
X-Gm-Features: AclHuK9kTiQI2FRvtYDoJKATe8CTCBUQkubjvei0NZuQDDdDmbhaB9xhCb4qNvE
Message-ID: <CACi=Ov7D503Ug-D2xmKvRP-LceQpEWOrktXTy5Srdc-MZO=02Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] dt-bindings: input: touchscreen: edt-ft5x06: Add
 FocalTech FT8722
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,


The FT8722 is a TDDI: a single chip that includes both display AND
touchscreen controllers.
But seems like other  cases like this handle it differently:
focaltech,ft8719 is the touch side, while the display side is
documented as ebbg,ft8719. I=E2=80=99ll follow that in v2 and use
focaltech,ft8722 for the touch controller, with the display getting a
compatible for the panel module including panel manufacturer name, or
something like that.

Agreed on the properties as well. The supplies are shared with the
display and described on the panel node, and there is no wake GPIO, so
v2 will disallow vcc-supply, iovcc-supply and wake-gpios for the
FT8722 and keep reset-gpios required.
