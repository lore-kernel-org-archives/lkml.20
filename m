Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78807081A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881588; cv=none; b=m5m6Q+Jwcr2DG2BtDalC44dPcmBlWPKOIDrCea8LZdPbXgmoEjIt/ovBCMmoZr0MMpikmWsvdej52lZN0GDrklgXlw+sR/pf9ijgtbtYTmIV+zH/uTcRN3zRZAFwI/VjnU24FAyM/pBzc46wzmNGQoM85I1VJ0UGShwI4U+KrWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881588; c=relaxed/simple;
	bh=Ww/HCHAxv9dCKdcDO+JrI53B48M1VI86UHdc0RALheQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RiQ9BP0IhLrkA5WmF98yCoenYYItj0Vwq6+IYycWm94tLdBlJKWGJJsrleBVqWSwdLZHIe/ICDH065E8Dp8u3p9wK38pY31XBcmA0WqHqhmdBaa8qAnhwPa/v0v+TSdNSUIpndBrfmzmOLWGcNjgzB8Zzes94UQgHL/jPklGv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=V3bcLFa9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="V3bcLFa9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso70981265e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788881579; x=1789486379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ww/HCHAxv9dCKdcDO+JrI53B48M1VI86UHdc0RALheQ=;
        b=V3bcLFa92W/ou9CwvmY3wqazpQj+O571/xzmk40m2X/mqKPYXOTy0a4wwc5DjB7YtY
         BpQrdu5Sc4+xjPJ43VXdMHHeun+yn/21W2pxwae0fKZFfW0hbpyWGT+Ifwnt03uL8kcu
         vtEWP8z3HU4ioBIKFfcxInKKuBELdk56kjYQUcCFoHMLtuSojwzRfHggkm01t1QoT3Zl
         ow6Wzh58D9eiXX8QGXqyjyqkKi4yVdDLxuhTflNaae/6p3KlnQt2SWNjaxnKt+KIaVr9
         j1QVx7+IpYAvADVUrnqfizCIbe/94JHHqNYt9KhoPK4UEM8t1J2burPlX1rOIWCTvbkv
         Jdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881579; x=1789486379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ww/HCHAxv9dCKdcDO+JrI53B48M1VI86UHdc0RALheQ=;
        b=Cp3Kz89rinC9XsbKRCN0AUM6WZFRhSGa+93+rzxPslDJr9vK5193juevRLUA5z3bhi
         ScyjiAdvyYJ4Y1KAw9VDLzrSRRp6xHoOute3YVf8EkJgublqTbbqvyWQ/HcWlAuupgJk
         90i0Kbrmb0BO+5hmzqwBTK8Iq9LyMrhmoWmLxVLeFPsKtfAbExQHwBaDBj5tAcUMdwJt
         xFaxFOw9IsY/woLPiKer6AtrRnuuyqEq+DSI57LigZJ6WfvL0abuUKPQRotjwrS0KCyh
         PjAgViEQCnCS071akeTfwMPKHo9zh1Tz/k3z9cXx2OgTsWc2SuyEQlcgqRzZ0CVXBdLf
         J6HA==
X-Forwarded-Encrypted: i=1; AKwUvBx2tM8WKpLStVdltnVbBMBmnF+9oEK/b65Tl3GRkeypfi/fjDhK+5NXVlpbUEKM8oKo0ZwfAzFL777z/xk=@vger.kernel.org
X-Gm-Message-State: AFuF++mpFIWNI7lpxGbBKqmqKQ7RRRRl4+H7ZE29I0/quXwjgJe2ABO4
	NsJvQDuDxhLPpuwBDCQvTMPkZmmFQY/Ll7hg6F+09hr8DdcbW9ojabMdOXadOqGOgBo=
X-Gm-Gg: AYBFou1h5FuDIAatIGWsJz5cIOUJbiBbjEMdNeh/s95hRDEv/iZqlJXiXIarA/Ug9dh
	2T/RR+9j0jmJSnKifWZXzy6e9Ihi5RJm/VKAWm92C32YOZ1axmVc7SLILDMlZPVixSyJnMwk1n6
	UKq6oRVHu98XUY4Wur2oIWAntD2zAv8LOasbI1Mr48aVbuSAa/u558MpQ2g4rv+pHZxpzXkEC7+
	oejbR22daNzBP6RIVMzEUD0ryc/5zewW4yQf4RdoAeG2nj0Vn5FvcnUQ+lVT3mbO0W+tjfZkxXI
	cfRZnLCwdrd0azMxGPb/Sz22gaQ2NOdjAh2J6CrS2kAlz6JfGtKlC4Xb031qEg3qk1SHrriPdLM
	Rirj7WChULknifGdyoewYp7yxWhAH1tvpXqYLCIygYagQdNhTMJtq2c4tfZ+3jkd9Fpk9KKR9QE
	Q5sSag5mFB+rhI2wuN2Poy2P9TONAZ3Og+KHoMf50=
X-Received: by 2002:a05:600c:6211:b0:49c:fa21:1c88 with SMTP id 5b1f17b1804b1-49cfa211d8cmr238704215e9.29.1788881578843;
        Tue, 08 Sep 2026 08:32:58 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1e728677sm9639315e9.2.2026.09.08.08.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:32:58 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Paolo Abeni <pabeni@redhat.com>
Cc: theo.lebrun@bootlin.com,
	conor.dooley@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	linux@armlinux.org.uk,
	vineeth.karumanchi@amd.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: Re: [PATCH net v2 1/2] net: macb: zero the link settings taprio reads back
Date: Tue,  8 Sep 2026 15:32:53 +0000
Message-ID: <20260908153253.4144665-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6cfd72f7-b6da-45ef-886a-7703027a55f9@redhat.com>
References: <20260903123652.23900-1-f@lex.la> <20260903123652.23900-2-f@lex.la> <6cfd72f7-b6da-45ef-886a-7703027a55f9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 08, 2026 at 11:44:55AM +0200, Paolo Abeni wrote:
> Not blocking the series for this, but note that you should actually
> specify the model you used.

I took the bare form from coding-assistants.rst, which asks for
"Assisted-by: LLM" since 816d9992d9ed ("coding-assistants: simplify
attribution"). The reasoning there makes sense to me: naming the model
advertises the vendor and says little about the patch. Does netdev have
its own rule on top of that?

The other half I am unsure about is the routing. The work goes through a
router, so an honest tag on one of these patches would name seven models
from three vendors. How is that meant to be written?
