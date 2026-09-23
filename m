Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6BD47126B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154051; cv=none; b=CdiZhobxfDCGMexmUj6Rvsk7WXPcfq11/g57TfdWSxth34oh00uBMoJJ3cI7TfBhwcI4zZZfZJpkXXdswfeRfplt8ZAnnAeZIK5XI7vr/GvIYfaMWviC+elGU/oTn0TABMzkNkwJUUEZyxW7cygX0+tO/2ZyswytranI9LNA6Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154051; c=relaxed/simple;
	bh=y+jlf8HC0jzi0HPwewqu9aTCsp5Qe3C5F4r8ZihI4BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9rFqskBL2UXfizYZXUXPdLI5rvwWQBWjOXchl5juiwh+hdYNTZqruN+Fxm0loHt1jzmhnG2J1nXn7szsA7dv0Lew4GGLnw/92g9XzgKtIY6/yI1QYBo5qWPKie6PpSsw7T+mJPgZMwSo3PutiTIRsIC073ty4B7n2lEIVmmt/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmHTxM6N; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmHTxM6N"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48704fc0141so87634f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790154044; x=1790758844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+jlf8HC0jzi0HPwewqu9aTCsp5Qe3C5F4r8ZihI4BA=;
        b=DmHTxM6NN5gNwGhjAByyJ5yPvK8n+kfdw3dXZ7BI0HB3GM3EIR/wFIBBcocOuOI+0U
         qbr5FhP5m81nua/tDx5zZC/nGtBV+JvEKnNA3ZN4Zj0uv5yIJswWqIPupJbwn+aE6x0x
         B5fxcYMCc7jzJN8BjhdI7Xiu9xUF6Zs7ZgSeovP3cTL1pNjkvIV2cnu4sYYGhdleaxQf
         GE0YCCrPxjCxxGN8l3Xhovj3+DyHKQ6uM3ppKbElYLFIA45cSEcru+YSGinnsVxSlk4f
         g2vMHdFF40yaa4C73DMm23Vfg/UmGnDe/LtsyZ6K8JPDoLoz9S0Kc9+0n3WEhjFuldUA
         nQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154044; x=1790758844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+jlf8HC0jzi0HPwewqu9aTCsp5Qe3C5F4r8ZihI4BA=;
        b=ynTHGwzO4lzNNNSRjZEc2QT0oMDQS1RJHLft8STL00U+mllL6jAThj9GpG80eImEc/
         ws1Lqn9rFEOoNsY/W9ctw9bleeuuh+GZrfHbFOre0H3kYSWUrYpcMeNMBT4Wm8HCIoyP
         VCNDVMvJk3xMZde0RdQwCL/UJ+8uTWTt7A8NITUp6siztQg25ZjJ2NMAg9allhQWPKyD
         +ZFz/tE5mLKpeXSwG6bKlLbM+OMJzuGj3Q2nzOHgpfQ0/PLPPl6nALBr5PYF3WjvnQTK
         hwCZrpIg1rY+zMihAwRsnfbCmamfuYADaLvbAnR3vUI/+XfdvpoA1BOPBN/3sYqAk8UP
         0OGg==
X-Forwarded-Encrypted: i=1; AKwUvBzExlK5yZg6mGs5WbiKgzJDGCyDHJq/nJmRPN8wrQ8UYLYTyYDCQ7XJTOPkvL6fzcLc0dyHauVZ52x1qqg=@vger.kernel.org
X-Gm-Message-State: AFuF++kOfcDgc2WfillNsDKGus846J4C7jPGQWSAnLzX41urT4Us6wx6
	1tSp81Y1E52c+WxrZCjoSx+XJNewc0TiTVN5LOSqKoyV+XpP2y35DXlB
X-Gm-Gg: AYBFou0I6jVwqZEkvEIsAZ3q7gvQtWCscnVdZsy39kjGoPHYyY3sTsooGio8mBnrkaY
	rE5HHW6zh0s9+N/LOXKqHk37xnpaCdGmsVwRZ0I4VLRewzl4MnTRjSxOZvm3GzJh/vrXy9uPu94
	WQ+wLY2ibR07G87VBCYcyWyKurGQ2bSFqKA4iTCQsDfYWIRZ6BUKn+lBEz914ozgxC283Y8z5Zb
	/ma5cUO0k70aQVVHyHwMdpT5Y0+1uF9zTkh+elEcjEDyrCf7XlDYqPKJm++Od6JEgKmYl/TnI89
	YeUoE5ZR6IEHwWxeAfDqv2pqqhHSkbEAM07VDS2el/S7QAxWXSmEpnM0DgohWJMqKqDjYLQscer
	xC9E1EM5mbinYDNKSzmkAJoQgM4eBHZdwrl3LQshQ3RJZWrR4q6Saf5sitZxvx9MDlYGkOJ9F3s
	u3zWXo8uZJ/hNzmWtqBX68H92KqZUHBiirFUAXeTNuoPg+e2+s697gVNcbrkh29Xl5Bjp6iRHyW
	vA9J3yz3wH+BbUmYE67YbuKp3W/bPgYxVGORRXW9Lao/UqqIBjhzQ1hVxxYnoQ3dPzOIJU38EQ7
	wOY=
X-Received: by 2002:a05:6000:4a17:b0:487:803:ba34 with SMTP id ffacd0b85a97d-488670c9e54mr2673656f8f.6.1790154044255;
        Wed, 23 Sep 2026 02:00:44 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F4500D949869966507951.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:d949:8699:6650:7951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688893a0sm5538990f8f.32.2026.09.23.02.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:00:43 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] media: synopsys: hdmirx: add HDMI audio capture support
Date: Wed, 23 Sep 2026 11:00:32 +0200
Message-ID: <20260923090033.16539-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721064115.64809-1-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Heiko,

patches 1/4 (binding) and 2/4 (driver) of this series are queued in
the media tree (media-committers next, ee6a964dca65 and d667a3c4d003)
and are in linux-next. 3/4 and 4/4 both carry Reviewed-by from
Sebastian and Dmitry, and both still apply to your for-next (4/4 with
an offset).

Could you pick up 3/4 and 4/4, or would you rather wait for the
binding to reach mainline? I can resend them at that point if that is
easier.

An LLM assistant helped with these checks and with this mail.

Igor
