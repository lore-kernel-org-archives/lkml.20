Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BB0250BF2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787880495; cv=none; b=THpU6GBIVT5kykO+NJYfUYuttCw+/Tx5RNJQ83MQ0DWsE2k3EV/C+IrxHJjIlLTl896A4qI8voHqMvJZijBCYqJ57/SjM7ICNe9IExy2XpKByKWn/Dg6k3OxCsI/PPSn4XoPNcXgfueaG6eSC2bVU+w7UjBjvxVwALZO/9P65FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787880495; c=relaxed/simple;
	bh=Sl0a9B9nADNHHFtAngkvL/Yf+242p1ix8kNJ/h47Www=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dOa6jCFBvweMegpAShXhpB6wDSKIyqjQPK2MyUYCOPXTfCGzNQJhoycPEXwdsGixEYEJ5LbwuOZ//v+2I0yMEwLqZ79mPgEXiURqGOJ+KZxrGSRtHUEUgJttYMWmI4XgPB3VmwU8U/tFShbGmG2T6xAl0Q4oiFEjIRZUzJKQOeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNeiVYTr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNeiVYTr"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caced6038eso5181655ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787880494; x=1788485294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sl0a9B9nADNHHFtAngkvL/Yf+242p1ix8kNJ/h47Www=;
        b=CNeiVYTr9OEgOc2fEclVcSp0tO6FEXbZNpzel5pCM6manF9ZiNbAel675L1spvzt+n
         Mh6y5Qmdtn+MSyyLtokM1pPCcV4WruTDytnkjEVq/X/wXWyrQK3frjQEph8I323b+hi+
         WzzkeCCblIm/45MsfVQy20FDcaJr6Nfjll6D3vyFsgdbFUmlyAyASHr2colQrAJk1dIw
         NdGXfQwg2ol14dIMK4BTbLMAhGP1FNpQ4n0AS5lviJtdPAjWtX559h3QWII94agnVDTE
         srA35nL9WLfIbQV7Nt44Rg9U7vMuemPNOFisVRjNOA7htyMHrxse36tSv4D6EDqWHbVR
         i8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787880494; x=1788485294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sl0a9B9nADNHHFtAngkvL/Yf+242p1ix8kNJ/h47Www=;
        b=H+rD9RZDj66hlVeoLBRvmotmT8gSSvkkhCXG6QI9Zq/mladP+9VqPmguFqwTDuS/z9
         NXpjTzo87JDsbMhaDTWNENCQ3p3M5cr6KoK6YV3m6DPUKoHsjmlkFZKQC2R/84Cozxnl
         nKvHmOsmcpZD+3QN+KkLsDo6Lx+eQvP3QGi3mM9pvmCb1Jb4T5/e9DydPPCbYwgvEX8n
         OaQ7YtQQq5mdgEZOnIXJBx3RtKo45yAHO8M1AatBoVoPpkEEdumzOl5wEVxFEVOm+ktx
         Q9NQXinkLN5Iiu8Kw0CBD4osf/aFpaoUGnV2gbum4a+DZBymsz4U/w/TdUuX86fKQ7Zd
         6l3g==
X-Forwarded-Encrypted: i=1; AHgh+Rr8gXEWDEg+RHrsxVstou6Zy+E80IhV08X0eig6o2N6EqL8+HbmsgD2q/5P9Xc+X5VboLopxDLX0N456UA=@vger.kernel.org
X-Gm-Message-State: AFuF++miXMUngOH+bRNaoBov9yXoRsXQNZGB3ANTmVLRGwGn7RWhRU6S
	6ICH/jmjctyEM7eTgG9H8P5XSKfZN7z8gScEE/JCEpGa9LPxEG3YrSdB
X-Gm-Gg: AR+sD10V9gry+D8ZRp412SknORpiMeUqtsLUguvM5sBcq2wTbXvwUUttypwFEm9Sdxl
	4MG+a2wAaqD3owA0Y13jnh5zmPWnZF5WsYQmqkJmIfcDbsh8HsoxkC4l5defOv7d/9HdLfLPhGj
	7KevJahklZRzt1nKNc+uHfN5+IniD2ngg3XiZFkiutOgDonMj6vrXRRPkHGv9K5G9U8zzt151d3
	AZJ23XX08F0kn6jY3tHFXtfbt8nue+bnfwksR47doAj6f/0z3edgE9fRm4JDm/DvoV3Kc7KOIki
	c7H2LHaIhzAj0vu0BZbzycxMLKwv/Tt54F+kE5rf16+kcwZ/yRo3taoraS/YFSBHX7IciKLDNRB
	p9lcwwwkQQhJ+eS41qYXbSw7yTrmoN0feWkibjmTeug/3OnIo2XVL/Lwbr803iZAmiHjGvEmg8q
	aDI0kHyOJW7foKAUlXZemxpSRtHj8X6Qw8yKmtkjj2BmMGFIn5KGylvKEuBSe5gE66rZZ4i46te
	g==
X-Received: by 2002:a17:903:a90:b0:2cf:8aa7:7810 with SMTP id d9443c01a7336-2d74cc49176mr37059565ad.2.1787880493557;
        Thu, 27 Aug 2026 18:28:13 -0700 (PDT)
Received: from autotest.lge.net ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988d8cesm633415ad.66.2026.08.27.18.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:28:13 -0700 (PDT)
From: Dongbum Kim <dongbumkim75@gmail.com>
X-Google-Original-From: Dongbum Kim <dongbum.kim@lge.com>
To: hch@infradead.org
Cc: dongbum.kim@lge.com,
	dongbumkim75@gmail.com,
	lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	pavel@kernel.org,
	rafael@kernel.org
Subject: Re: [PATCH] power: use EXPORT_SYMBOL() to export symbol
Date: Fri, 28 Aug 2026 10:28:08 +0900
Message-ID: <20260828012808.2462015-1-dongbum.kim@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ao0v6G68S_W5CBz5@infradead.org>
References: <ao0v6G68S_W5CBz5@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Aug 24 2026, Christoph Hellwig wrote:
> ...

Hello,

Thanks for the feedback.
I agree that exporting freeze_timeout_msecs variable is not right way.

The real issue is that the driver thread cannot be frozen until timeout
expired for try_to_freeze_tasks. I think freeze_timeout_msecs value is
necessary for all module, including non-GPL modules, to prevent to fail
try_to_freeze_tasks.

I will reconsider the approach.

Thanks,
Dongbum.
