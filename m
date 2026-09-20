Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5984D35295C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928804; cv=none; b=gL9UMqMajkUCUU+E1IT76Rl3zhJmlY5Ae0mQD8krsN6e06OT78T/26bGFE4ZGrZCUKnLaUkDZJCG/BptmxmJYuyk+HcblIeSjMNqrDGZSeKMR/Y2MepXoQRW64pDCHWQw+fqVw/ALI0HL13Wj4Pi+yNH1PjfSVBvUSAhSWU4ZY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928804; c=relaxed/simple;
	bh=ctybYDdvZO9pIksP2ULzpuote3bRNon18HCDYrLfzLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IM/oILMc+lJkg+DzJeyyYwlyMzHCzAbZfE5Nmx0Tjk00/Eskj53AcVDscZm02RkB1eKSC76LbtGYW0LTRYN9mJb2TZ75lRoOVq32bCq59kPZBHoE1nfmB9IaWtaIl4TzxUhfiSDEPd+IgGEWKrJdHJqYxtoyrAObOJ5ASLD2f9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=U6rGahP3; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="U6rGahP3"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a4aso256883466b.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789928800; x=1790533600; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5ry7l4Exlxh1M/3zvxmesO5D+d/+A8q4/muqEbWO2I=;
        b=U6rGahP3b0IlfqDm23xMMowdxiMtogOBmEk+y6r0tYFe5PI0xE1TOgLhYwbA4+iJFd
         v2R9Y4Ve5mAziLx44j9EwN90r8+Zblq7+0oCDhqD9/6VZWHpnOAh2oLNuw56a0kYwA41
         O4CtoMcdiv5OsB5xfRhVp9NpwFAUhz/AtSDmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789928800; x=1790533600;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L5ry7l4Exlxh1M/3zvxmesO5D+d/+A8q4/muqEbWO2I=;
        b=bImdehWwNY2nI8td9ISAIIFSu1+NVzh0YO0aOhh6Teu2TrOFkD392ZwSUxmRIxutEQ
         hfH8yqv6kCZFZzeAx78+RwClTwN4woGakCWSJrgexXujHqBYtb7nJhj4kDHZgHFWDntg
         WDOz5n8rjGCs7xyUjS1ihdXmPpWJSehalv3xjtiw2701s4+Q1ZhdC2OvrTkGTzMlEg+D
         MyDasxRt0Qf1PL+dzqPGNgXzX9SM2H2qCCDef3zIHkpw/sm419CXwHNQ3LH0waUu3m5E
         KTMiaQ4bldHUobgoXFonJ3YglgKSjebwO0qPcXEGnH9O8HsdrtHiRkbkk6QtRNnIJMot
         LYZg==
X-Forwarded-Encrypted: i=1; AKwUvBxue2d8exxbTQxA1ankEFstV+p7uin1RKxOszNFIG2yBm9csaIwD9mh/kb56QZlJsjYwCXtmFyscma1S6k=@vger.kernel.org
X-Gm-Message-State: AFuF++nKTSNCldrV8W5AH2Frp0T8oYrunf5wxxdCj3FNz65UUQx44mMC
	toyZ4jeQ32CdzSfez5/v5HaXXQ+IUuQsqTFyXsppBaw2dcufP3RnkEHx7YlUI76Sul80MUFCAeu
	IY8QKZPk=
X-Gm-Gg: AYBFou2xjbanawTNsVWIkiWl8fUoCHKPv5ywQo6dzUijtLS9l/5jCb8LzQ8fEIo2Z/Y
	UiLZBs1ofhXoIO3/MnNHav0m1d3ICG8HQGL8If8juzAdYZf0gxt+ZE3pDJftKDpr5cAgbUnuQnq
	V1h5hgxiVxqKQ1XRIUbWAVj08dDic1SvmkHjE5wG7UwoKxGPwqV8+NvQFcFs7pZSu/1hod8CowH
	BfMQ+eMpsglP1a5tSiHk3q557ygUCCPHdvGFf8KDtWhK5Noh4lCdHt4o9vLFvMX2wIheC8S1GKd
	ZvZRCNy+jRFPIZhuYrJlev8ATGlgAGI8Etg2HKB5bJ9JhCaVVmwDJFKqLhv37t79BNxkVUGYUXr
	KAWP5mndznMf6XJig4wmeTUmDXLNp6ieACF7IQL0+YgXA4xvZBBPVtnrRamveRvKQnYa8qqfhdK
	ofZoNPMpLSL0rLVRJYgxIFRHbBkyzvAaxVLJVQW840vvIw84BeadWeXJ8xRcxg8RiKz9ejtGEff
	ucIWlrvV562BrPv6FGRi/bxz8tMVmubhpSF8UEpzO99kG+gwA==
X-Received: by 2002:a17:907:daa:b0:c29:6cb1:bc56 with SMTP id a640c23a62f3a-c2a15cb3172mr683400066b.46.1789928800367;
        Sun, 20 Sep 2026 11:26:40 -0700 (PDT)
Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com. [74.125.228.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3588487dsm201838966b.45.2026.09.20.11.26.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 11:26:40 -0700 (PDT)
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c254f6c7a56so263765966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:26:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwkKtDr2xXAiumUd/V54XgBznOfEBRg03UZQdHtYz8jKI/+Xh3XwMC671KGc+D9L85UMfnV57ZZS9uRJiQ=@vger.kernel.org
X-Received: by 2002:a17:906:f5a8:b0:c29:c356:6984 with SMTP id
 a640c23a62f3a-c2a1578857bmr728040866b.8.1789928799735; Sun, 20 Sep 2026
 11:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1f3e8e4b-2060-4edc-aa58-d2b7a68280ca@leemhuis.info> <20260920141608.2977460-1-linux@leemhuis.info>
In-Reply-To: <20260920141608.2977460-1-linux@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Sep 2026 11:26:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqFzLDVNk9wi5mwL7sPCDM9EvMPhP6R-v9HrSCNEFy=A@mail.gmail.com>
X-Gm-Features: AcwNN1WJl2lEERaMTEHFcx7Qicbe4cFRR8AKTibQLDiSq9zZEta_mcnAVC0bRVA
Message-ID: <CAHk-=wgqFzLDVNk9wi5mwL7sPCDM9EvMPhP6R-v9HrSCNEFy=A@mail.gmail.com>
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Sept 2026 at 07:16, Thorsten Leemhuis <linux@leemhuis.info> wrote:
>
> diff --git net/qrtr/af_qrtr.c net/qrtr/af_qrtr.c
> index 78347c937af76b..e7b3647424b8f1 100644
> --- net/qrtr/af_qrtr.c
> +++ net/qrtr/af_qrtr.c

How did you generate this diff? You have some very broken setup.

A real git diff should have had an extra path component, and looks like

  diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
  index 78347c937af7..e7b3647424b8 100644
  --- a/net/qrtr/af_qrtr.c
  +++ b/net/qrtr/af_qrtr.c

and I don't know what broken scripts you use that break that standard format.

I fixed it up in order to apply it, but you have a "--no-prefix" or
similar horror somewhere that needs to go away.

                Linus
