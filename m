Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794039067;
	b=np+tg8agEUMxuMRo2EGsAKNb/Ax1GWxBrM1YD3SkorDkscZRHFlWu2NcyINixJpMBLOB
	 1fiUpmPzcW8zmP+a2yem5ZGtbzjZXEcG/dX2zY2q8WGQx/5jZNeTfVPnY28zinBOp0W5i
	 +mQUGR2guS7K2dLD+fAwU5o+M8wqGPuQRQIuuMEgHcQjej+sovBxUfHrqaj1Z3pqndUHD
	 O9F9A4XrX28RcyNH50kxzBK8BH4gOtepx+ppYYnDxay7Jis1u/gC7dKTsS2AASNwm1kTh
	 Cot6KcslASAk+fKKadeRJsoVwhDbUbEOG3pKf/qZgGTU2KK8bENM7e+Cj5DQoHXeH5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4Lu9mr35jotGFrY9yCOOQ/XVTGQS2F4snkENtqG32G0=;
	b=pUHZwdpcPu0G08tKhlGGkG/KxeK6IgTOeLnYCZROGjTPVGA53EysUg+WGILEL4wrEA0q
	 TQ229jaGTq/c0FJPnAqp5dR91fmwwvKaAHJkvYUPQc+Yvn1F/2t3w4jHL7av6+OnJ49P6
	 J0JrrHYj2LxNmmF3pD39yObM8afieJXQARyIedzBuLkXIWcOMhuXe7K/rBOgjv7JFO06a
	 v7I/je3FP/gAyHOH7fovDIiknb9FFpjTnDACLrUuqwbZmXALpf+G/ITa+n+WyaQAjtxvb
	 Uoe0OAn4tn64bLX+aEOxcLtJbhmnaO+XtZoq1eYyXOSenJmB6kToJnQMvdB4yr3equw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UAngRiUm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B520E606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 08:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B520E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UAngRiUm
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso200645466b.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 00:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794039065; cv=none;
        d=google.com; s=arc-20260327;
        b=MJoRyD8sGe52b7s9/+aSxFGXfZHeUl3TcylUH7ctuWadLZxfPCQL0a7CjWHARzuwcA
         3aP5t4MIZHs+GEs5q3CPD+XU7QUWDV2a8ZTd59eEqHE0FefThQA0OmZcwVXInsowsVYM
         1ptGmYoFkhOho6BKqMVpNxCruNuUcQv2JilJxxzHryo+qrObtCDUrOdR/bW6MoIoYlp1
         XJfPf5yuxKmphrMP9OR+/dMhOR85FZhfGTAeQJxYVm8HPRPTMlwMqsaxbY/jQ4x0tnTS
         m43How1bjmjV62nG60l8ZyxaTFuEstASVW71aV9AwHhk5jjyyH5ziBTykYWr5hCDc6gk
         817w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4Lu9mr35jotGFrY9yCOOQ/XVTGQS2F4snkENtqG32G0=;
        fh=2t+GElNCl1W56zPS1dGmKd1vmFOAcXnua0cIRFO7nYg=;
        b=qhNvvpxTyJC/Ub3rP4PIkwlegwpwtmDm8yYnPGi2psQ4zbgbnK4MLlliUDlhYsr+QD
         NdW2DiQdLE3kS+BfpCTHVtEVrHey0KV3Kc5h280KRj1tbLs+suA9hyCx+B+6bvH6AjLo
         HccyChNoB5qx6nG/aoR9KFWItR8rstOXqA1PvpGgbLzYDEIHYAQItTj4sVrE6iHQHVVI
         0IJhM9il7DGXMdzMQCTGuO12XLx9ejFY2BCQ81S3QZ73KFb5WhGf+2RyW8w6nlhGmF41
         woM4JMBj/PWfIJODvfjDcx4XZsQa9R3OpEM5WmWX0WwYHU7vjJi5NxSGgjLBOrxJqzyB
         t29w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794039065; x=1794643865; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Lu9mr35jotGFrY9yCOOQ/XVTGQS2F4snkENtqG32G0=;
        b=UAngRiUm8pvle7Zr0N0Z3j/tjMuBQv7NRKrwX+M3eKVi62jW5XULdpmOnrOqCDRXFY
         oFpoFh15sCmEXCV5Wia4j+6VR+39+PY+YGPzpVJPSkhSxLs5LYJOEeGhs9yn5UXzcJF5
         KXTFAo3X1cM+Yn7TfMyxZ9OMfshOve/iLaZvoIN1D/CNAIhXbFez++hBzPhAsRYk5gLJ
         40VIwf/8wisKrQijYzuIhmjGodeFBP5g2dBCfNbv1WmcqOAtzxBKlQwEjKLP9721bR/D
         tC0AWJ+Fq9hG4gYji6X+AY3kbwU3keUZ28cD2W2q9ybn7Igzt6rtzTw8bZNUGApKSy9l
         /duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039065; x=1794643865;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4Lu9mr35jotGFrY9yCOOQ/XVTGQS2F4snkENtqG32G0=;
        b=viinal1tj60mK45UXCmiMImcyIVvLA58IylOJcVr9eFQU/ypTyapJHFi3vm7bdc0MM
         MnK0NbGwRebcQJi3ccj8mzMxYegGGAzEO9ZdBTsvgzvuQPVOJV6gtlgc6Q5wvUM7v/Gp
         KZtJ5JidvFT2yiQOA7HKpcQRY9fXMAIO7HZuoMhwDiLxilkYXGlVxRegs1zYWyc7QHMJ
         FyeS/+Z61cqVq+pg9rdVtb4YWT9Mugymh4cTcAdLo1s9Kpk7jPjvlX8FTbgZIqFBHeRQ
         pA156u0gI6fvW7AFRMXZhPatcMLBFDtuyq72NsUVbaroxeUvZvWW3k8dfuEaxXd7cFDQ
         gAdw==
X-Forwarded-Encrypted: i=1; AKwUvBwNZrIhid44V43UbjAOSQyJY8837BKA13OIR630M9LVWHzM2zKaJHf06DhEQUsTposn8t2PB4G69RcZVV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z914vyka4a3q6HJAewCdvblujseq8AqzmZncBybiN7VB4lu7jKa
	rm8X4HUVwuEMEiYAkCYL1pVMcZ4ftZ0T7oitZXJtRWRZRzPZNmimhDcpjvQcio8iObaGwarzRce
	EkRQN7dYok8bSVk5Un6tfWGhM5oIocHM=
X-Gm-Gg: AYBFou0zMvjaM8sBQGugwAM7Fisns90Js8Mx/DKzVS0BmnMZpDF8+8upHRtSUxPoTr/
	X7D58RYOcwnQkJkUX2DIssEAeyynnqTm8qjchhUsFwyX+d71gIDwK3On2XcufVGPn2Aat+PPXJn
	E+oeD5IRnGJWU6wqGaHifrgTDXNLRI+LN+Kuv1c9cq3vcaX8RW2RT6aA7lHG0axpOdTVeQQbngi
	D719PnEIQNaMoMJfSK7vN/bCdbHb6ukoJ0sGe05j/Y4qoYph9quXfLp5rHjF0JENBl4C1Dck7ji
	SgpVB/EcJmMEOKOYn56IPOCbdnhyG+pbnvUDb+V1tP10y/FTX7DkyIh0szzdJOw12tANJbqaouu
	vIlv/pD+KMNVrE26FAvM6Vw8TlYsGrACvTmbQE+I=
X-Received: by 2002:a17:906:9f92:b0:c41:30be:4f82 with SMTP id
 a640c23a62f3a-c4d355ac266mr404152166b.39.1794039064583; Sat, 07 Nov 2026
 00:11:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-doc-modernize-git-v1-1-8b59c1a578ba@gmail.com> <871p8x9iqw.fsf@trenco.lwn.net>
In-Reply-To: <871p8x9iqw.fsf@trenco.lwn.net>
From: Alejandro Lucero <aleszlucero@gmail.com>
Date: Sat, 7 Nov 2026 02:10:53 -0600
X-Gm-Features: AclHuK91DUkFbpNIFEt0OfQGSbn-rF_ZJ46dBlm5lWx6Q5YsF6mXZsaQ93GyhPU
Message-ID: <CAHDi9tqKP6R_zE08jLLMcYHP53sZB8r2M+fRgP8c53GT8Dxu+Q@mail.gmail.com>
Subject: Re: [PATCH] doc: process: clarify legacy status of applying-patches
 and point to Git
To: Jonathan Corbet <corbet@lwn.net>
Cc: =?UTF-8?Q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>, 
	rdunlap@infradead.org, krzk@kernel.org, wy@wyuan.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

Sorry for the confusion and the noise. The six earlier messages were
accidental resends while I was learning how to manage revisions in b4-
please disregard them.

This single patch is meant to replace those earlier attempts (I also
accidentally duplicated the commit message into the cover letter).
Would you like me to resend it as a clean single-patch v2 without a
cover letter, or is this version fine as-is?

Thanks,
Oscar
