Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516641;
	b=vh8aWS8H0KiroEkKl9vpvetjqrEb4CK3wHnLH6evEQPWckdgNhUExK4aMhfB5ujcMVdl
	 YB8YHNScgvBqjlviP2R9aLKygIxcNtv41OJ9RgfFBlj8+P9MNB5jPWliEhVwVF3zrqxa8
	 pXWTgJ8RkszPAcSqoHGAMmf6qxCS94CNjmFtq1qTbnq58U83TXinYkr6oufyu1cBPHMqv
	 tK+9xAnO/NYtx86h0itEgGGk4T7j1Xb95fVa5tvF2MwivqNrwc53eltzQvg2u4ZHHygdn
	 3pAdX/84Iy2a7wEGoSN2d/3ALDLu0pNtrH9QqKPLgMLOkAW5i4O83/JY5+L/t91A8aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516641;
	h=Received:Received:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=lZsoV5xV/qdIzsmQoRFkHO+0ZG2LBiefLdsROQtEphU=;
	b=2JGRv/wcF3wQGGWk8HDrs19+w4nbLcPQg0U6guOH9Sj88TbMmxhxPgX9KJtIP2z8hL61
	 jJM8YecQNX5fBBOZdC+/1g5PI7HQMbUmGg0N5iS0SRKRZca2GhjaQ7iPyO/WtGT/rdTAO
	 Tv9EuZ8Q2KLzTowHehNPUpsbXo1cfBjXpC9jwcqyFt1n8RcFE38g208nlIZdqfrFYwCgB
	 yEXvD33QetrY4yJihG+M4pZbVXq431Kr2k/STA3uFTjwgSBjjSnfmJiPR6Ax4R92Tg6iV
	 aaZ/8c6ygNO+rSvi6RTlwrSoBNmjtrbubDE5F0kAcZopa6V+S+dSIXeS35mLgY9obiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0262606A334
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F431F000D0
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:17:20 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a9787a156eso28512921fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:17:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwxqpYwZuDBrCYw6zAvZgla+d/H1JpmGh8Ttew2a8VY6tfz/4WVMa4QKU2lEqDp6LYeTjuAFVfwnFXqgcw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3yO+3QjrGbwrvX9HmbuxDcFmpaGXrjSPoPtdRHdIBwq3b0YJW
	MndAJpq9CfdfLEm4TbB59CIG0K5ldWHV0VWL1DOksrUI/sbxNODb9inVRG5LuNon/JktaC4pE6H
	7uYoPm/N+4+LpKZijYGlCboB6hJyNvqo=
X-Received: by 2002:a05:651c:3614:b0:3ab:1639:9a79 with SMTP id
 38308e7fff4ca-3ab292b7375mr20330481fa.15.1792516609558; Tue, 20 Oct 2026
 10:16:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-iio-light-gp2ap002-v3-0-b7e0946c9e79@rudorff.com> <20261020-iio-light-gp2ap002-v3-3-b7e0946c9e79@rudorff.com>
In-Reply-To: <20261020-iio-light-gp2ap002-v3-3-b7e0946c9e79@rudorff.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Oct 2026 19:16:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLne9-+i5aWejLoqb4ZYf8Bk66iifcaT1MV4uY80+9ORww@mail.gmail.com>
X-Gm-Features: AclHuK8o7YJtu4fGAIWMm54FLQfyDMwv1SgdLwwrUNSyOsI4L3FOJbzTrlMgBeE
Message-ID: <CAD++jLne9-+i5aWejLoqb4ZYf8Bk66iifcaT1MV4uY80+9ORww@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-samsung-j5: Add
 proximity sensor
To: Christoph Rudorff <chris@rudorff.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:36=E2=80=AFPM Christoph Rudorff <chris@rudorff.co=
m> wrote:

> J5 got a gp2ap002 sensor, add it and it's supplies to the device tree
>
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
