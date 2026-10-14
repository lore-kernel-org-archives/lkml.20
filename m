Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A25328C6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985692; cv=none; b=NFZgYe1YMsp+H7IsPABkh0m8xWo7zFJmX0ePZ2mOywrANIcfKxSkP1rhZFMF/xv9/iqOmvJ0FrlHfciJpDz2DfnZt7kx/gNoHZbkDouSGZaTGOmPhXS6uAoZ36AFKw2Y7zKPz0rTj0056s5v0gYmASKj1DYoL8qd+9zmvfe3rMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985692; c=relaxed/simple;
	bh=XZb2BuZsmSb3LQX+Gqpg0HwFJSEHBcpA1T+CRYC45/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nt8WJoWDilZFphLey2bU/OAQwq3iUD6SRGeMdhOYDQu+57ToWRXbc3PvzcBYX8qme7dKdFg3Ho99LJnT508BZ6wPqoOqbTRIwNBTw5gy/Ad3HzD5+GboebPehT4TgS1foMLkn5Tl5zUxqDM5HCJklJn0qExRmhQVgrllyyWmk2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0iPDEY4; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0iPDEY4"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8875d220446so2111609b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791985690; x=1792590490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cb14+6Zl+Og5oq4fRzXaYkQdxU/WMK9lIAeYNNyuMS0=;
        b=J0iPDEY4gqIYItuu8Y4y63Cz5+UA1sZxHGnZ9lKPpnJYcnDLFZfKprYQIS1Jc1nAfO
         7AzWBHf+6OBm+mptGEBImFFrPKY7wgvJ1Ff8VK/K4dHGKBC/kwKUDW0rRs7iK6H+tEtj
         DrFtkfuAlH3kuiEdqFTOQGZyQ+0z1dghqY1XsE93fxkbZ8/g1ktkwhf14C0RMM6Y3BKj
         U/YO4kOduUJfEBDZ5LdyxaBjqHW/TV+MvovD/ZKtnM/FTC5ePC/q7KPp1EyRT1N7aRsR
         wuT6u5plFtYBV9VkJzk72yMjgG/wW1/9iE+GZh9aE678lSVqZ18JuINkPQSvUqBiysWo
         uE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985690; x=1792590490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cb14+6Zl+Og5oq4fRzXaYkQdxU/WMK9lIAeYNNyuMS0=;
        b=HrRu02b4Y/GbG4DwTpHvI8PJTzyb9PKeLVlD74BbfpTPiuxzZZUJlS8c0aIpPppirM
         Z+hLw8PS4w/yYW6YV3kFl3szW5TuPnW6pA4g6DlOpou5hhS22a+/YjVVtTJIZoy5ghda
         3F2Qojad9u41vQLUYy1+Ndbwb3NmkwBKUhlxc4shW31xL5BD/xWVUSjuL2TEu/ix4m7i
         bYgvid1XJn2gq3roID+yjZs//udG0BIWtbael0tOSrDJq2OObPbx0kSJceVg9V6eeWb3
         gLrv9aB4NaSPLSULJzPT8QVwxyfVGbionpTFEEXuRqr3eYxR41EyEoYjxEeYMPpuV14C
         X8yw==
X-Forwarded-Encrypted: i=1; AKwUvByTSY+WiUWfw799mEy8WQ/LDyiGA8rdHe3Jgm18y3y6jM7D2a+Fbpeo4FrT4+859xkAZjVTZ+i7Q7Lvj5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlM3XM8Y3XtxOg7AVkoLAYfTdHTJym1FdO1zKl6bTD4yDVr9YU
	7mhSDKIwMSRO2KX2dvZYA+A1droXsepPkSNtV23OKCYc9W0pAEf5ZZrv
X-Gm-Gg: AYBFou24l1cY7NWhJos57vTuQGqK4/pQXflHJ57JGqNpojqHSNz1G8XkH3whlkfdI8m
	39Iox/GPVM31kKc+d8c+PGZxlDcOv+zLB5quQAN4PBwuySNLsWjw/pUlwkrIMBPiUNwDN//W6hK
	a+U7rxRKlm3cAx027DTEA4ik11BQFf8AdJaLUKYk2f682ebDXW3H48QWdUoQKmLOa5joj+QroyY
	J+7Ers/zT8181OJdXG9eIpvhlgZwPhQOOxITrl3erz4fy9RPn52ei74IQz22ca++rV7a68oD13A
	/lH93oNSwcDV68rF7Jg1nVBj+ftG/uRR6Kma0HJXIT2iFcNB+NTy2WZdBQhyFYkwc48crgqbI5j
	lCBD9Nkm33UbjykqtfwIOuUKrLTQJwnnA86h5gr6p7pRKZY8FHcfJUKHqh6SyPF9EgAxr6GJWWO
	wcNXNb4I1690QjSMC2EnGgPOsQuCiXmmlDeO4wxIoZgwJA1qB1dGXBNtlFheSSzKru4eA=
X-Received: by 2002:a05:6a00:b8c:b0:880:4b56:dc2c with SMTP id d2e1a72fcca58-897c69329ccmr12308668b3a.34.1791985689597;
        Wed, 14 Oct 2026 06:48:09 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89e0d1a3223sm296897b3a.44.2026.10.14.06.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:48:09 -0700 (PDT)
From: wyibo6109@gmail.com
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yibo Wang <wyibo6109@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Wed, 14 Oct 2026 08:47:54 -0500
Message-ID: <20261014134759.10946-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012-weightless-meaty-fennec-cdce10@quoll>
References: <20261012-weightless-meaty-fennec-cdce10@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

Hi Krzysztof,

On 12/10/2026 01:24, Krzysztof Kozlowski wrote:
> How is that possible? Same OnePlus Pad 3 Pro has different matrices?

No, and sorry for the wording - within one tablet project the keyboard
is fixed.  What I meant is that the matrices differ *between* the
tablet projects that ship this MCU, not within one: the vendor trees
carry per-project geometry (caihong, the sm8650 era project: 2764x1630;
erhai, the sm8750 era project: 2764x1630; iceland, the sm8850 era
project the tested OnePlus Pad 4 belongs to: 2560x1440), while the MCU
protocol has no command to query them.

Which also means your question from v1 is answered the other way
around: the geometry *is* deducible from the compatible once the
compatible names the project.  v3 therefore drops the DT geometry
entirely:

- the compatible names the tablet project
  (oneplus,caihong-/erhai-/iceland-pogo-keyboard, the codenames from
  the vendor trees) and the driver carries a per-project description
  in its match data: feature flags for the 0x3A sub-commands that grew
  over the generations, the touchpad geometry and the per-brand
  product names;

- the common touchscreen properties (touchscreen-size-x/y,
  touchscreen-x-mm/y-mm) are kept only as an optional override, in
  case a variant ever needs one, and are no longer used by the
  example.

v3 will follow as a reply to the cover letter.

Best regards,
Yibo
