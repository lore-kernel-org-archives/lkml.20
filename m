Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028BD374A05
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788142918; cv=pass; b=K7qZXgf1zg/VLYuvzSpXHiWlW8JGhz1vGF/WC6oXoIbtsXn0pBFBwz5uWikcg3QmxsFCYVF4Pu/1cdnB8rsMestD+w9ZLx/5+RBmpxQy+sPBnOATaX0aIo1ZhyHju3kGazhvZzRX8s7TwHgDpmOGM4Qp4yWNHodJiqJZMAtRDVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788142918; c=relaxed/simple;
	bh=GPWW4oVRcCCMAoA06PGoDCiq79cqQiubkV98jZZ6S0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CWkpC9VKtcOmhYs3XUFB17X3MyAj5sp/+oQih10Bxgbq/Wf+c3JdPxL51MaF/lqjYqD8j5LZ1ed2uzw7tL6u0+Py9oqKuJ2bm7i+/kcbT4EC0lVf3hYbdiAb7aE1w0IqTJDsemqYAeDAeaiv4ON92Hjpvq3tTM/OhU0OCDOPaZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Isp91Hab; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Isp91Hab"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9390a2c8909so199352185a.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:21:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788142906; cv=none;
        d=google.com; s=arc-20260327;
        b=FAorm2fx/CD3y+mplBUK8xvValqHaCfAvgWlB0nOk21JlTtDvP2aCo2gZpjjG0n5MZ
         DLtN+s0pY8cVnmDOojRoi3rH133TiGE63D+sgRg+Ewt079KwXB2mXC1rZRcdua04zlmO
         QdUkn/EF1qP7zSMGuLASE80mfnYWI8Ui1iImBORgQp4FpKFbbb1+BMuclucjPwP+U5+3
         NmnujaVOPR/AnE8F8wZGVRvVPYsWTIZ410QhXGhq1N2LiY7nSMVZzZ3gt52sKTY75Fxa
         HCHZMpgliFrcfruEYvljE0QUgT+iP7lDkbq8fcNWtipjInvFuYVJqYYAWkiqzf0DjCYM
         LVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X+gtQUN8+/MkCJHijWyZYutLZlt3TuwYMwG2se0HQyE=;
        fh=xFbcP5nRf7eZIAA8Du7d+sPypsI/PPYKhbAvqm4PhIY=;
        b=jlnNjPJdjNY8/iEwi3aCVFU61zm9p5uLWgPYnZ5fv1Yp6YXkZEVXJDLFh8M4StV6Ee
         BCGTboicc9qyvcNLSn9XPBGSNrrwZT1xD+Ni/Wkif7UPCpInSQrBLL6bq1afHeg5YbJB
         0gRgxTLaPqJkcpadXMlkIwhjXQ2Lx1AQEBUabEEcpPMnbUuXJhu1Lqyvqj+BKOWDr0Fw
         WJz9N2Nfx0N2bY+xWuTpnIhYx0D6xHyx1dPXNms/0ejK8U1tn/GV8Z0qeEx7tvzGLAdR
         MglzN0ZyueHNxoXT3TGVgzfvyrmVTfXRaykITf817CzBGMVuUIJ9+KV9nRh++6A+Tpxs
         M1Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788142906; x=1788747706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+gtQUN8+/MkCJHijWyZYutLZlt3TuwYMwG2se0HQyE=;
        b=Isp91HabdgQtsZUkRJ7nNKemqpQ6wDNRB6IwNLDAdXLeZnxIXkM7jgAIMN7b7ftqE9
         YK6NC9Llz9nwEf3SvS5PohNPajvPRbbfbu7StkQA0dOA6HTIz1OSj6g2CO2wxpKE7NEa
         eWxoqGp9NfWrOlfz0toRBPZuK0LkAuItmvuKvLGA7Ul6aNxQNdpSN8AtfVfMgV1XlD7E
         m103tHgGkkken/ZsyUvavvPr069Qzamauv7pBprDk8BnFVHjZYtOGJp0dw2AhIv8isxm
         nMZX02MS7UZPk5J+La3E9Z1Tx6S0WecG5+KPdyBjJEOMp5suHee7baGSWeBelGMrBVF9
         ah9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788142906; x=1788747706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+gtQUN8+/MkCJHijWyZYutLZlt3TuwYMwG2se0HQyE=;
        b=MNa3bQM4OpjSt+KYCRWO02dS9OKk2sltK61Kgu1aeKldWk6FfOsHjLN3+fMHj+zhIQ
         u1xHuleM0gHZY58lyNd5F5z9bjMi5zIq8bU4J1HcYzvQn32+KFXo3Q804Uyhye4+1F57
         gw9iy++knukT4b0dcskg+2ysln9V6l5yWx0OfCEHgI4MiAkupiA43cq73lLMbnMaOhrG
         WQqOSJKO8kS/BTdRCGDzIbpf2PjcbmY7wGqN4lJV6H86nnNAhFDOScrmYd5lYAHlyG3y
         rvaNav1kwDM/sA5oXTOZRP1k9pNACW0Q1IsfCJg1lcI+K3jsEha8iO5JriFrsNaedKNZ
         VcFg==
X-Forwarded-Encrypted: i=1; AHgh+RpgJSs49pdma0z7y/+pjXLl2T+xM6pEwESR+Hg1J5YS7EdfSgOx94kPFvGcyOvff3Fgxr7xsrAAH4rhPec=@vger.kernel.org
X-Gm-Message-State: AFuF++nrudhX5ZcWTGSiQKojdn9DQxFw8CzadfIUU6y6RG6LC/pfzkai
	RABmDMmskwGHoJUdLKMFARl9wVCJB6ETQSzC69n4CkYc/DwL79P3849ykT1fy+iEWz4EgEIM7Mc
	++NhSiPEcFouLy1uY8Y2Fi4/YXezPx3E=
X-Gm-Gg: AR+sD1232QR8H8QzB+7FsPKHk/e9h2cbLi2oqZ6PVLJkGgDSOhMtWhrpNSYb9oxcuxX
	KULb/1xn/ZJq20pB+5pAP7dVL+q1a0fgmH5ub6mSPjfSquC1hhOs2RSqRLZpgffLuYEt1DeOAq3
	FKnMrzqXlfrCx5LGrUzyunVWGERG8I4z0GkYT1t4ir9hHsAUpqFvFyePcOTSZ/sgeUYCbqsPDOG
	Nah6thKT1B+lorRd2nkTRmFQzuXfHeFR+CAFEAISlY2FNc65eDOx9HRY8UC24PKqaFszd6+pTg2
	3+z61LfrrlgMIGKKGn6sR9NDUdOZohVo3TecdVwYohehMv4pnZuohx3TGUbXd7x0dpPd6nanha0
	GinMoona5luAE+j6G05941kzksEyzUcvcznxXeaYhFJAH4aBn0M31/hUTzBQ=
X-Received: by 2002:a05:620a:839a:b0:939:1fc6:3fd6 with SMTP id
 af79cd13be357-93942856eadmr13875085a.18.1788142905879; Sun, 30 Aug 2026
 19:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830234515.63131-1-giovannamccds@gmail.com> <87o6ejjbvp.fsf@trenco.lwn.net>
In-Reply-To: <87o6ejjbvp.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 30 Aug 2026 23:21:34 -0300
X-Gm-Features: AcwNN1V4QODqjfFyFNmTAbfRgnc7G8CdM7nfaUJOd2QfPDYS-p2wNJuEK-dZJpQ
Message-ID: <CAMAsx6dBSRBA4hVAd9SH2sL9BxcCZcDyxn4HYwU8AocV87z1RQ@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate coding-assistants.rst
To: Jonathan Corbet <corbet@lwn.net>
Cc: Giovanna Macedo Cox <giovannamccds@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 30 de ago. de 2026 =C3=A0s 20:49, Giovanna Macedo Cox
<giovannamccds@gmail.com> escreveu:

> +* Todo c=C3=B3digo deve ser compat=C3=ADvel apenas com GPL-2.0
> +* Use identificadores SPDX de licen=C3=A7a apropriado

Hi!  There is a small typo in the plural agreement here. Since it's
  "identificadores" (plural), it should be "apropriados".

  Could you please fix these and send a v2?

  Thanks!
