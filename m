Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030494;
	b=g8viSiXbY2H3sNI+vv4XXjyatkYyAXBhlAJkoize1Q8XuiP3lMj+W8auFc6NsdCJ0M5k
	 uDRANAs/3i3mEbr5cnda9O0C7MKPymfDN3CPOIFcB7+Qs6n9xUVunWI/ihn6uZkwJQqto
	 ijBN8o6r+yLi8wEmfKYub4rKbkw+kZCxrty2aPsnUq0RY1K8Bi5fzEAWLWafaHyEpW2D3
	 jcZGvpY/naCMXyppIqq4uKVRYQUTkgIHVpapJDqdV5LCg7D7N2i7QVHXSmZ3m3/2WeNnb
	 A3ILI1MDa2949wjiBU+AItKcgA+RcVY9o3fbkWOeU9x7DmuMkxsxJ3SxdxGmh+ohx4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=G5mOJb0RnfSFctotyurw1MWzkVYTqMttYi7YnmnVgyQ=;
	b=qce5btggZj50Af9f8JEOm4AL2SotnsbcXt63W/tuRCSp4nOmJ3h9L0jkrY1/5/SRXoPw
	 Zxfhwkwpfl9n/SrbygqOU/wqlvj//lUE84hwheiZUC318TwI3L00O+5/8N6V0z7srEAgK
	 qTedm6KuVTr1chFcmH05fzN/0L0upHQmZXWYVyQQuaHq2zt5sf8NjlSm3GwUf5Qtqysca
	 Lk5578nV4oC8xuOqWtqHqA9koBx3tn5tAjhQ6jlpZm/+eBj8iMS0NummegzbWc58xrLi1
	 gW7cmNQjs6YTaIQ2TYsmXDcxjOhP+ygH/7X0WQpWuvRlg4X4F2y8ob3FKfE+ladqRPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dW3Fc24n;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA38B606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA38B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dW3Fc24n
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c34bff61551so459589366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030491; x=1793635291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5mOJb0RnfSFctotyurw1MWzkVYTqMttYi7YnmnVgyQ=;
        b=dW3Fc24nHwm7RX4RtLNqTM5TYYHXznFabtwjEmnDJBOV0ztb/htbS668pgH+XdCeDb
         ss9PL8XqeU4mGTspAXLGVRtIE2oPt9TSPKdW9BcEZnPG46g+TA6jB0ogpTd3atRSFWaU
         ddsrmUeb1fVu4rotrra/pP//4B2YatJB9QUhTqnCj8hYYXGofjUyFtglScfFOP6tFyLd
         rAsy+t6ehs0dhjvOMxC0EHsbDYLz+2vXS1gdnpEaeCMkserfcwPRuXAO0r7/W6FqxAv5
         07LJRDKiYFrilduw8Y9WjZldcwhov715zOcrax2BqNa4jRNWYHgucCbMvj0clGub9Sqf
         p4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030491; x=1793635291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5mOJb0RnfSFctotyurw1MWzkVYTqMttYi7YnmnVgyQ=;
        b=p+Q6RF8i+V2myC22plQko22OVUyGJL2NXXh3D/QshLjp/JAPfuXnEJntEJxZNnRjPk
         vEJ7+g1gz3Orj8+cLHu+DyINZRn84qrZI1DPqkPWhxX+oexWeoG4h6tfdntxG0pV99QG
         yvn3E225o3fJtpL4YOqZKzd1RybFlmWNkxFzQC7YwP55/HxoN32Go6aa1z44ZRJnmeiD
         wTLrD5VIiRsVFmb/Qn4z9PY9/Hd6+xAIAU3yNzCj1mbY6dQilTGRDHSIISFw9qUL4Ipi
         H2N1xz6Mn8D5icejmg9NI58jUVZ5435EU9269lEgkptVW9ZJArDnFW0CXSWNZJ41X0s6
         B6qg==
X-Forwarded-Encrypted: i=1; AKwUvByOWPPSJO9vrvesDUDA+swHw26xOLuT2/Fv4VXQUmNOQ1axTwKvMjPIbYO1ZKZkCZYTfEq6KK2te2Ac1OU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA/tRv2UxXdTPIE9YxPCZ2XTp7bDsoBRUrQLSWiHfkxWqiZhI5
	Yw/MuhGYMba0TjeXtkNTuPcnPj5nILYcOtUq4AFuJ0ttRPGVhb4uRIzX4mmV3t8aoFs=
X-Gm-Gg: AYBFou37RUEsexeV9eRwu45nXNq7YzA+5wi1gFMp7d5g64rnn2458Dr0jmiIZ2o1JAs
	S4NVjZ4N58+qHgeTWTcikLQk9UGODPUFH0cmoiy+sP9JM2aODl2Sa8BHm6RX8K3zHLY5EzCXSR1
	4iAlTCQ1bRJknJTSw/AVUuQCs+Zj8n9hbvH+J0Gm+JHoqJe8HivG9N2D4ZLF0Wa297vFw0LAPW6
	H6E4Ypex6NhaLrgPAvcPyENIkj4vwnlzc5SQSYbqeXZMa00VgvznsUtak9xiIcScVCt31EQuN71
	kIWG+dxJAc+7+qMYDLTVZVkr3emTthgJ1kSb21b7ii0WvnTWmhJIXEMXdmsIo7WFqL5BwqrMwGS
	ko5/7qAdY2SPf1WufWzMoClODNKRV9EAdANtqvEjg9sZS0J4lvDZxYJwObtxHz9rBuwaCZBie9T
	1mflg8sDzo0R4FyCoNs9NUx21mB5dJcSj8Ky0oYI1kmT1AdLiLRSSXGIW60jQeYsOJ79D5kyvjn
	u+ayiM8Uw8xZREVCKJpjvvBoYg/4m/eznJEqgml1X41/0dLjoYWVB0n9D4bRYsV5Z8najPzJCRm
	VBGP7iXy2VuigW17EYzrexMaRbhF6qSYyhBeWVBRjYfHUKAt8yPXLGxgMNmcaZDGDNMKLWW/4Y/
	qD8IFCT6EYLZY80fw7hW+WBrfrJlNdYcv
X-Received: by 2002:a17:906:dc95:b0:c34:83c0:b92b with SMTP id a640c23a62f3a-c46bde24eebmr834629766b.23.1793030491260;
        Mon, 26 Oct 2026 09:01:31 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:27 +0000
Subject: [PATCH 10/15] MAINTAINERS: Use linux-pm mailing list for Samsung
 Exynos ACPM thermal driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-10-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=927;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=BUTSbzEDMtAp9xedXXWiQmdqZWmXBU0Yaz6LK7Awqpw=;
 b=QC+yB04KHzmX5XUlB+M3WHYVAVTzsEU7atGXSGu9B/dV19AW24NT684VZEvIKwYcRbj6F20Un
 wPF2S4wqf9pBCDVZf1GnUpDmH22JyWeQwySA4zYEGDPNhN/tKZ9uvFY
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

List the power management and thermal subsystem mailing list
(linux-pm@vger.kernel.org) instead of the general
linux-kernel@vger.kernel.org list under SAMSUNG EXYNOS ACPM THERMAL
DRIVER.

Fixes: 05657c7822f2 ("MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e9fe9c2a39b..6da7c884373a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24382,7 +24382,7 @@ F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
 SAMSUNG EXYNOS ACPM THERMAL DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
-L:	linux-kernel@vger.kernel.org
+L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml

-- 
2.56.0.257.gf7497c7d27-goog

