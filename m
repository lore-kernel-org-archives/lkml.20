Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243F141D647
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135032; cv=none; b=j7AfiSGboK/JkWeh35T3YchMeZacMgZlmW5Y7/oWeApYNqK86F4YkCHCmuoXmVvrkcgmghVPNXrCe0q4l+wQPSgizlbK4sJYyCF408Sw1fvjnkEmFsUugny97QDsgMdEnB+GUyanTfzEll/0xZTVKdiH515ic8kDNRUbAIye9Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135032; c=relaxed/simple;
	bh=WYIoHRWahmE2fvmt+avDjJLVf4iUC15MrcJZtroluhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JYxAbD8iaNVGwZt7u2Q/J/yMtTdGlDoWBKzUUVc1NdZmA+d9vZHDhZMNPu27ZI/jLS+JiYjsFYLP5BGhdAjRu15p8t9pMNUiQWANXEOxVnofpZNA203/MXGG1wOkDqWDX7mG2IP+Hr2t3eS1XplFm4osxWmhh7RCHd0wia9cI7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljB4bnyv; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljB4bnyv"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30b6dad2382so14704265eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135030; x=1792739830; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WYIoHRWahmE2fvmt+avDjJLVf4iUC15MrcJZtroluhw=;
        b=ljB4bnyvKLk/t8VWqupEePEo8p86nyEJndWQkJ+twE7aQsnLkR1ip0bPAF+i9J/Ewx
         Y+7ALoeK8MWK1FbCZfM5r1kJIwqu5Zx8tnJ84LZpUt2xxTeVjWlDKrMNzW47WBsWBAOi
         DUqddf0ExPC866enxMpjhX7vPULYdXzmLYn/Ztg80GQCvN9KReZqvbTeB3yaFHIwmAb5
         ftMCLH4y5ClGAhFXBuR1GndE+VIgCXFXDNoURkMC1q+9b02V6693dHpC+Z5DVW90pyeQ
         PGhZ7g5uM/VPhGsgJj7m/q/w/SuRYoWcIyKphiGqSeuQs44EgzLearY80ZP1l7TVGVsd
         tLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135030; x=1792739830;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYIoHRWahmE2fvmt+avDjJLVf4iUC15MrcJZtroluhw=;
        b=qWCqbhEWZ/Br4cx5GRhVEXwGFSKFjmrIbbf2jkqkvxhpVdWtgFTyghbPgK1C9rTqdI
         Uyu9rYU2uMme7trRHm26bLeIJnJyyFKFv768Tpnc1GAPg4Fv9IaZbTKtY6Hwduya4OFQ
         9zvhFVduHmY5+sMDmQkTuKpFfMjDx5K3EW/SaeidyA36z/HJF2HW6P5FNv39p9dErSxR
         pN49nV1VxpwlOpK+pbndFuuLuqtTTIOLzs6omuQPfZ7pWFRlUerVJDAud+2lTq/QRyF2
         V33/0I/bjBYmx6z4p3hS+ZqRw6kps9wFj70hDm0Zfg9TbkQbYtEFP1gXuBlzJ3xdnsiJ
         lxOw==
X-Forwarded-Encrypted: i=1; AKwUvBzMx/4CtWLT+h/RUk7b5r8O83JlOwqVQxNNmK8sKAlHOjeqcMXG7GeEbh8YnIsLyiV/hopdVNyix3KslHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTBKWfMZpjV5ky5WGyI24q31xBNsG9K25Qiyeg+yggdX0COJqf
	nV/ZVifZCw9QbGJfJY6Or4GuX8vNUSZTpuoTOXNy8t6OYCFCfng2BcjQ
X-Gm-Gg: AYBFou3GMGXnXy0z6DHf+jYprrqCv/OD/+YiLBVSLPz6cimvg5a+Lipp8cnNs+Kype9
	zSzM0YhZfKqIlYynxkKH7wWvVEpwWMfdKY5tY4KyyYVgvMkQShSBy4UpBe1K2U0xFwEBQNmNgDq
	n+e1+ERCGSBGx7bwZ6OVd3tob/FF9mzlvL67OcsS5liNj7BV89NjxY4egVXZU2tQDRcKBbrWRqb
	SWDryArLgAu33s3RD9JI43+qRPQKyynKgxBrqwpw/9pDPq2yUftVKL4j4bQiTI/XXOq3C2K2C3y
	PvDmQlQl3lXNDbqu/vBO8j9x0zyHP3LtLZNMonI23Yd80zADXGCa57JJHw53MKxOy+hlh7k/NGi
	qB8ojjntVBIzvoJnq7yYlARDNqqtWT3NgsC6bu090pGrC0FyKN9fgcBLf15ypg+kOM5YippJMgH
	lUPMJJNtpY1bHGc4/7gLJPEw3HlWWDu34ScHv5BAXFY0qqwDY3sCmjqoduJywJYvzcJm7r
X-Received: by 2002:a05:7301:9c91:b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-35f8c5d5bc7mr4763847eec.30.1792135029915;
        Fri, 16 Oct 2026 00:17:09 -0700 (PDT)
Received: from [127.0.1.1] ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm3973233eec.22.2026.10.16.00.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:17:09 -0700 (PDT)
From: chaosheng.qu.linux@gmail.com
To: netdev-bot+sinfo@kernel.org
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/4] can: don't discard the platform_get_irq()
 error in probe
Date: Fri, 16 Oct 2026 15:16:59 +0800
Message-ID: <179213501981.212310.9988031427961239592@gmail.com>
In-Reply-To: <179213131512.408196.11368789495251891862@kernel.org>
References: <cover.1792118040.git.chaosheng.qu.linux@gmail.com>
 <179213131512.408196.11368789495251891862@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

The issue was identified during development while reviewing the probe error h=
andling in these CAN platform drivers. Manual inspection showed that negative=
 results from platform_get_irq() were being replaced with fixed error codes. =
For drivers matched via OF, this can discard -EPROBE_DEFER and prevent the dr=
iver core from retrying once the interrupt controller becomes available. I co=
mpared these paths with platform_get_irq() semantics and neighboring drivers.

This was not a production hit or a syzbot report, and it was not found by a s=
tatic-analysis scan. LLM assistance was used in preparing the patches, as dis=
closed by the Assisted-by tag. The controllers were unavailable for runtime t=
esting, so the series was build-tested only.

Thanks,
Chaosheng
