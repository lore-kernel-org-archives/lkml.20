Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792932815;
	b=gowwZQt9VuQSff9NBorhyp2HY6zNTBrugJtTIgZLzS2C/esog6lw8gX5iRuFyadKF43v
	 s8A0bHY3A8HYW83xHV5bWVNobrtu2lJE5o4fRIGk0YJy7fZuAmVlv5n15dPm7ZC+4oM0Y
	 hjcuYYxbPnfA0qLLTlITFOlOXiGQewpPkfa6TDEeebSXDwihwcJV5T/2BotAPV0KxcST3
	 6lOW8tL5yYuiMK1FyBu0HR8m4iI5rq4yauTftZXv+qxK5K3aenGbjZk9CMLExsL3T9eQv
	 7JsEAH0Slud1C1xXwRKYz7c6duEGBBpk5VyV5BieCj2TL6P9eUaGIGqVtM5okceJpFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792932815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JCFQvSVrmmm/rHmd8ywtZ5Tn+Fl2rKvZ1A5HZ1sQWb4=;
	b=fYtCR+W8oRXYlpFPnBr4O0OhghXhpXg9L3o9R8u5mTKXtayQtUfanR2OMqF4X2OoL/2d
	 eHldH8UbdhmZSblKUY548RWKBQ119M57bnT9oI/XFR8rz4ww8M4gxpkOb/YHqxa6zH0aN
	 PkYEHKOdABEY/6k0losXiSS6F8xov1kR5kLMVkHuE2yZ7AfJmtmTfZXi48744ND8EBaX/
	 88+nQtjsFTqjVvEhOGL1/4J/iGTyKS+bQP1HzqVShGedo0qi4po6NL+03zG8XK1A8L80p
	 5VCPAk7a77r8xWAPjaSqi/3X8jOFTNkbrsKXs0RxAgTcImXFIv4M08cLm1QOEOweDxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SZO6XcMp;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2E9606A328
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA2E9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SZO6XcMp
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so13459735e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792932813; x=1793537613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCFQvSVrmmm/rHmd8ywtZ5Tn+Fl2rKvZ1A5HZ1sQWb4=;
        b=SZO6XcMpqObUDsLkUHMn05TO0jS40Ri2meMLtsJWCpB3xI7Mt+dtUpPDu9fak0Rtd1
         PwpyEl5R9oFUDplBtyKAkI0Lf0zTgiDeJ5SvlKU7nf46epwoCigpNKKxTnKT7tR0tsD3
         QVBHkfoq6TnBTFvmdhgjn25A05g4MkTxB8W0nu/AiOuBuD/TE7+5G96Z8XSw3pbnzp/a
         7hsL/exfg+ZB1pyyFXNcx5Ug8GKbUcfsdWbz8JyHUAcHoxR9Yl6X0CZneQ3BdWQMtDxH
         TlQzqpVTRrVeEvSdwOmV4SOG0wg7nvVyqnlKAIOX4g10+Vw0h2IGiun8tS2q1A7Whib6
         GaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792932813; x=1793537613;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCFQvSVrmmm/rHmd8ywtZ5Tn+Fl2rKvZ1A5HZ1sQWb4=;
        b=eNNJr/3YB7TV8PDadpFqooAfHs+Spxy4Q7Pex96c87SkQpWROD7xr2qtU+T0QcxHUY
         sUd+6JFh3JaTvLwl0E5cSQochb3NjykhziWqbX8zCkHSRZPp6JxO29gxSZ/m6eU6Cd4N
         JJnRvCtc6qd0JlM4s0JYmafZfYWu90+XranNPKD3jE3t268kz9ijf6spJhpbvMwiKciu
         yx71kdlqKoGS15z9W/oDTt9muAyoPjPilRs5u1LCzcj1s+TtpImP2K/9y7upQWR9juCJ
         1AeVhYXm9chD+s1jsYAevxnnRCSKJQgUSE3F1KgH5nZRnkH198L9/mzYubkbxDUgZtnH
         +n5w==
X-Forwarded-Encrypted: i=1; AKwUvBx+gG6REiDrMZZM/craTnWUeDxMxfzVXh+C3UP/NB80T+NY2lp7QZl3P0dfRnG0VcqZOI2yOZwh9ODiyaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwr+1I75MWz4dVXDFcG1gDVHL3UQBQ9KCwyUyT5ZtTk5tWgz23
	ocjh8kJJ+xjDGqDYHkzwiIMXvr+mL9eIQdLylJChj3bDJyh5R8xILzRK
X-Gm-Gg: AYBFou1z7I6OslbiVIc9DgkhDZoP4iAPDIUh3yUbWnuvIZmwnLzbGZPgOZY3lyls6c/
	LtqJJ6KQ5fTv8pM03Gxl9pymnu10hn6pRU5iEGxMLwUwZEjzz+sofOo58dne3Rpdt0Br9Y6LviY
	18rvCV/j+49GZFlQsiJtz/GpkRo4H0ZwMsBqEgRYn3e4hQgC88gn/eLYs8a1mndtSTKzdM/cAlE
	CjncBJe0EFLjk9LbkfA17J7vVEhmQ3G1Sd+vagKDNOfDjd8RKqtcaq5N6ajMJXrFCpGEE6ryjkn
	W4JXD+447QreUsWLgtCJKLpJKgxT7wDnFxFeWBdOdEQ3+3SeZhj+pxmBifxQBfi2RM9mvcjgl/+
	kLR7OiwHknAQwrgocVf/mN7Lh7yBPkPz7neUCsCAUEmreVAYK51ZksXnV7qRMxzPoEf2h48OXLv
	guSF3whbgKOI/nlpC0F4lqA4KQW3oepU2NZ9Ji8k++umbUjymdYB1rlYh2EafKuDFC7VEMyhnF8
	Em3FHPVhrKyFprb329spjOcCzXnKdTg/9W0aRrDYAzZyklEojHw5aphjr0icKOdfYsGOz4uOnPk
	f0XOrACprAofY0N4vvRrpmC4ewNtKq430QusVu8+PWTebo79l+WnyjbvogNl2UMd+2XP
X-Received: by 2002:a05:600c:6749:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a35ad01261mr66247355e9.2.1792932813213;
        Sun, 25 Oct 2026 05:53:33 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bac37sm128182175e9.6.2026.10.25.05.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:53:32 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: icc-bwmon: drop the bandwidth vote across system suspend
Date: Sun, 25 Oct 2026 12:53:31 +0000
Message-ID: <20261025125331.208366-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8a63e842-3b06-4eaa-95ae-4ba4ebe2ca1c@oss.qualcomm.com>
References: <8a63e842-3b06-4eaa-95ae-4ba4ebe2ca1c@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/20/26 7:56 AM, Konrad Dybcio wrote:
> No, this is conclusive enough that we can drop this patch.

Agreed, please consider it withdrawn. I have dropped it from my tree as
well. Thanks for looking at it.

Ramón
