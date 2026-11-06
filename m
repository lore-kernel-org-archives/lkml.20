Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793952002;
	b=c1J/85bzliqxK7nZjV1lIYEmU0W3F67Uu48XiSkJtWAO4EsK8xT2C56zFPubdAKv5nO2
	 VHgS73DaLMUWjuJS/6I2bZyUfwtPugmD14q0lPp44FZK5YCMflWGmBZ6TWLVmXmHcXtEt
	 b2syic7cXNL2FPJiXVdosQ94ixPRSlcMt5UMz3fYOPm/yCIIppqfSW8ZCxwTAu7ZJsFSZ
	 RYTAQyC3SWbvz1bsLDnHCGKpaFNeUl7IlXJa/hUNFTrUnmGVwlwvfzWOOo5RifWA2Xawu
	 cvKZq2jrwOYKEYacIWzTpQv/34iJRIEaWRKrlyXfAqhdWCgtIJhC/agchsuoswGo94g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
	b=R3k3DoFlsohDjN19N6GafAenhv5E2Mbsy+F1Z/26CrrWsi5rxlJjijFz2tOgPEVuQU58
	 FXH6GjeC4sSE/KCzTw8wzily0YocPlH47ubG5jydi+81g1c4Fi7lhikqF071etX7vsfRe
	 ggiiSGgCAY9DGVliUgi7m3hFCETLa1d/TwQX82KzTcW+4oy44DO7UlqkbX2VxO9MPKU2K
	 P3i/km9nOumEbOeGEhJO70C35xO7k0MWDVCQx0vWJ3zqmK/qp3ZDobWnsoiKDaYAUAw15
	 EqWV8SGU2bc8elfUZnzxLtPiAvOXEtxnL3rghLyAlYudrrxbr6VdOHpV3ouGfAm7t1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZn45ghf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0366082BFA
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA0366082BFA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZn45ghf
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b56221d361so368837a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:00:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793952000; cv=none;
        d=google.com; s=arc-20260327;
        b=klEFpchGyDRqqHiRNrs40Af4d3QbNXq0qtBBL+4UPYaeQfEt7Otj9KZR0qnE3RFSif
         QQbc6DrEHb/xT7oabUj7shyMItIFMtW/0rTmV/w/ycnEH6wL7v2EKmOjGi8qgXDXJf7L
         rzawSZ+Kk4V1AqMTTDjksfA5RyOkvwe0yXfOwkItjLu7/usyMA3ilAg75hzZW+nJS5Dq
         BGm1Yl/eHflp8aXF9ha4hvwRi6Hfu5xhow0KSzgD8NntvYn9MikI7nwlHq06+ZAeLMKy
         aIkh4nhM+iG+q+5Hz1SOwIs7Pzvj4WOeRxWtrVWr+xGx98Fhj7hA5P903lJndpw8G1SC
         8MgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        fh=fPujoJWvGlDPtRjxJhqmVrS5lFnQF5SpLOxownhtx8I=;
        b=E7Rmh+yUC3Jea/P5Y3H/JPxm84+hM60tw6+EE9y2RCm+9iKVbQy4gSp9XsI1/Dh2D0
         4u40h7xbSb3IY5zQsW0BfTi7sLrfiYwF+jQJ63OlkZyRLVHtLtzvjO2w+MTATAI/B8xJ
         QQU9Hd/vR5dm9oP8PsbV7ZxSlPP8rhhPmw0mLSZDKKoNvvJOz5M/GfyyJkwxD1xliZVh
         5W8L0BY1lIka0PmeQ+25XUDpTW2GQs7gCJ7hT7KxupiKBfj5BaCLzuxAVgxaQa5AGU+B
         hOVT+EOXhhxF6PDCQ61IdGpJc7agadDiuMNgzk2tCKk/sMb6cwLXGbcq0C/iTcBkCSlH
         JXEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793952000; x=1794556800; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        b=NZn45ghfBG0ZvdDOyynp1nFEfObT1pcptC1zoQJVefkfah5Cvf4KhBdfAtP45zAtAQ
         UULmHj0hEPtCZn15bvzalYNRj9fhdp3uyVdEClRuRLkVnpOfV9ppeglAAdfxPS28qNaw
         O+q0E4sjEMKTMoFNcQUz67xVF3I/KdEzY8yg+Tpd2afhiQuFsmYUaFLtm5Ti/Cv1nQCD
         bntrz8dBI8l+pN19cS/mEKfoLl4E98jrhkuxDF+X3o30Z7L31Q/ieTJQlTrfBLk9dFV/
         5CptV3jFVboDZT6yTQgUn6wxAwHGSAsVVrnPYMvRpyNWRmRF2c+DpLESNG1RwdqVq9wY
         I3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952000; x=1794556800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        b=XJlYe7GorSEqqYRTsL1/Fs9G7mj34wXPYCBDxsDfFvYch7Mo16NB6BNRIcsgAIqzql
         v1/340pEh4Q5Sy2kxjSJR0YlABMyVNnQu3sofVoU08QIqIOjMgqOlob8SIWB0YZKDBp0
         GNATCMYlzG8CKZcSmqHf2D3CSaNt0cGBo5XOx85eWS++0/DVy99ZUpmZNMWDJP/ph8kp
         KAIyggecJbFRqTo2jAfT5MQFE0roLWOug1ljD9Rl0bERhp+dNM+fszETEUZbG+jW0eqW
         JtyTX+fpZnauZVhzR7/kAS/LUYaqvSq1rWTXLF7etF6gHZ/j/4GSuTlcSvbBvgMWhHjw
         aLog==
X-Forwarded-Encrypted: i=1; AKwUvBxl9lFb6Lx18kJHN/Lrhdaq3McQBkin+Jr8/sCjecq2t0aJj2yrUAEHtYqmXK5oNnJhQ8c5whu3kAVdpy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lChlPKzhlkGToXRsjiSZS477mn+/x0VZS/jtYfvqVPXokuzNt
	526wZmLE9//2YLIK13dAwdcGtM24sRwIUcUGBDwiCzF1TTQ6tZzlBKA+bV4pk+3yF9MPRbod2T+
	WgF3lf9J2lIhNOyQQUd825g+BJ7CcDZE=
X-Gm-Gg: AYBFou1s7QGZh1dOQTQ60s7XE4tBY9Sgms95vGRByM0key7Wvdow9MY+Tvm5zO2XMw9
	FYwv6bjG1O1kCfJHqDkAaae2hHMMQQ5ElkJBc4iGcSmppnRmpTDdMvrTR2bseoIcAua6bpH59rq
	aZ0PWsM1Q4a8z2Uzfrh6vNvutn5DiS8BxCJXhPVVELwhWgYtALGf5lky4SCaChHwH7/51lwBKs2
	bwdZFNaQczS1jYs70V2ZG/+v64lMFTdl+jlSQQJGgiVV3I8q8rBocQngcdQsOVIx8GPzelFepVX
	H5htdL1Pk9J7A3G5QpqzySnYptD9pM5zrVDXLlDmV3J94iW9LtQ12ihPqHUFp+I3CArYYfyOMQd
	XeQ3RJGB7k5PyiQJEaX21PWKSG3rTla1t35h+gDcuV6MBKOj3rrmnMbVV
X-Received: by 2002:a05:6402:440b:b0:6b5:9849:e335 with SMTP id
 4fb4d7f45d1cf-6b5985927b4mr1117288a12.1.1793952000065; Fri, 06 Nov 2026
 00:00:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021105109.199886-1-l.scorcia@gmail.com> <20261103150936.GB792264@google.com>
In-Reply-To: <20261103150936.GB792264@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 6 Nov 2026 08:59:48 +0100
X-Gm-Features: AclHuK_yxwIK0Nk7bFmyEO_n6HuxXT4AJJgazikzKXrXwadabrKuwJfTV_QGR20
Message-ID: <CAORyz2J_J0dYtg2BMKq9cuzo7U0j-cMQoFXn+2pOTztHz8dS-g@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> How many more Acks do you need now?

Still missing acks for the regulator and pinctrl device. Yesterday I
sent v12 of the series [1], rebased on v7.1-rc4.
Thank you

[1] https://lore.kernel.org/linux-mediatek/20261105194426.1113050-1-l.scorcia@gmail.com/
--
Luca Leonardo Scorcia
l.scorcia@gmail.com
