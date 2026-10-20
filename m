Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516533;
	b=nC62n4OJrsE4ZjDKPbxgL+8iP1sgUmdvfzPlVwCyyd+O6k6E8fH+6ZReDpsET2L3vq1b
	 WLVpfLxtbl45qTUn854wAaDXPU+hXu3Ms9wiJyBhVA9BY1KoEaWv4yPjo5+nCQWwwv2c1
	 KdSBBvYtbT3Oq4YrDDLe75kSwQ+U1Qr0J+YSLHMorRV+EpVQADywcjTiUdgNErD4Xd2E2
	 ijAasFfS5pAK/p0eQWAYpwd3f0DRglyvCwjzUsH4S8KTIHIb4+8Azl7ba3EzFQdfsZhZS
	 YJ3Nyqk6KDMK4rxrbpGwkMD33fclgPFjl9X7CtbvJJ0cC0mr+LUEL2HO2EXqJwXtQSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516533;
	h=Received:Received:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+7AvEO87agVesSj9EpGksF6DuYMEbv0EchchTnG8b/k=;
	b=b90yWmt/OSP5yGIBbpWq2+1HcyhUlhTZPAZLRp46gVDoiNaoMOLwnuFpK56LMR06zqLN
	 aaMQZit/laNDaGhOrGKBp8Tl+2yeoxQ99zxPhoYxv/nfLIQ3C7FTqGMWniaGfL+eRAKRJ
	 KaAK4bLgn7F7RLPhk++QcTsqg/j6GjPOZims1mlp2B5a+S5AO4qmCDdBUS+W0vR/yOxvm
	 o02holWb/VsrQ3SHdzKh3/v/BqYh41BvSMDvah35l6DJam/1g9u9ZfN307zcVFoEkHIow
	 tdAKsLW0oKE5xGy8qcWfDIHxWQuajnCmzUV+V/8+x9ahdTdHQXR0SnHXSB6W4TCdJlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12123606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C530B1F000CD
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:15:32 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso616200e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:15:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwKZjqenunMMjjKL/7jYQwb8xwWbD9l5+Z4FF38zm0NvZoh1JYN0M4pft0HfhR7SJLHmB6cgpmO9irF4tI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdqlH3cWTAKZPb5Jp0DbqnoSWgdQPvDTYp4ZgKJEzEYHsSCkYU
	A1vR2UhWKzJwNxdH6BUWJ/YQll0D5GuTEDQ/FxrIZnsE5OdYUkxfBeqPLYDPjwKhrXsBXzYb0Cv
	a2is3Uh9SFlybu+0+cDe43gSdPTv2VzE=
X-Received: by 2002:a05:6512:33cc:b0:5bc:b0f3:8a4e with SMTP id
 2adb3069b0e04-5be50a62a31mr3833052e87.43.1792516501664; Tue, 20 Oct 2026
 10:15:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-iio-light-gp2ap002-v3-0-b7e0946c9e79@rudorff.com> <20261020-iio-light-gp2ap002-v3-1-b7e0946c9e79@rudorff.com>
In-Reply-To: <20261020-iio-light-gp2ap002-v3-1-b7e0946c9e79@rudorff.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Oct 2026 19:14:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLmA_CAJi31OJe19A1H316XfigAKy5XbGcpvj1CYzPYY2A@mail.gmail.com>
X-Gm-Features: AclHuK9Cj5HfENDrz3fDPSLBKmxyGLPpayybWidXDJBEn6zBCvvY9bndZC-YM6k
Message-ID: <CAD++jLmA_CAJi31OJe19A1H316XfigAKy5XbGcpvj1CYzPYY2A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: light: gp2ap002: add leda power supply
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

> According to datasheet page 8 "Recommended external circuit",
> it has tree pins that need power: vio, vdd and leda ("vled" !)
>
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>

Looking good!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
