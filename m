Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243B3352C3C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757486; cv=none; b=o9XdAxPIAgR8TLhRBBkiJQeQkehDDRFIG5dMHt71PiKpBINyejO4CAt/kRTQTWj/lxRXDAeDV5DNlJiFh1I4Y7hIn6enHW/GlxWzjIgxB36agpi/CK2FzX4A5A3oy6tq69xS5wochc9gAhpKO63ZqNn3H1rr34A7CzL72xPoduA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757486; c=relaxed/simple;
	bh=dvzWV6uPH6nNpcqdcxfnsLvgt9T1LDV1zM8g+XqkO58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPyaQBnmPjSGf3Lj7YTVxGG8/2OgQO3uDCDYPjNOW+2jSfmVNACVYnd7mDVlqtkUZu7rAqJnVwkSDTWBk7Hb3aVzzE2Zwxcxwhe1Z2IyXeMkT/ez0aES77sbbw1ypnmWeLonybs9EXY7zp9OD7J9l4O9izvMIPYFw939YwENgyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jF1H5j/w; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jF1H5j/w"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-85c9a79590aso2983062b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788757484; x=1789362284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iaQChxd3RaTTS2M89yBBd8Z6krjXqSg7X3Hqq+Gd8is=;
        b=jF1H5j/wtjWA5ZkNeKwzOgarYKJtCap/ZqXJhIydOv3c6yqkUDldwMCMDSfoJyAevx
         xuihYxbGtxlPDCYvGxgxYjLYo35vUstlY3I+yppwYmw64YYufr6UWCTHWIAvnWynrmuC
         U6jJbkDWMVgPHo2kTJjXjBAmJQHzIrUsJTbIwz4PlqpZL+tHh6BVWcdhg1eZvcQJY/9w
         brB/JYQRkyod9wn15PXi/r/jLFJ7P5iJ5zEuQUi9A2CyjHFJfJ5Glf2ws762dNYIuBuq
         LLErjXcELJaEwMm+sWoetcWvocR3dnmI6knz0SDQAzr4DoLZNBPuyjFPzv4T0cnXDr/k
         ZZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788757484; x=1789362284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iaQChxd3RaTTS2M89yBBd8Z6krjXqSg7X3Hqq+Gd8is=;
        b=l9jVzKsnkFxWuojtkkkQTQfRjf73N3DB49vSE45rg5JXvt3ZwbIc2epEzRyWkxjPb9
         +TiCJIwFEGULFoQQjTasmoJ602YfgCjYLm2IRnRZ3+BKh44wazdSokCCg3rKNEgD0eFq
         JgBgcqeTsZ5AD09/BYxwEBPAUjPMKdVvWrhB+JtWZTRyaItaJmGyPUGRdSA7LCa2b3aQ
         q5WaP5bCbL/IvSIHxPKJn051aQWRPqKYkqJek0/Tr8ibsAyV6TBXoWNzjDIQPqmlaGRT
         eVKz8xKCXgS2xI13K1OSAEviHT2bCCPfJkYQUtn0TuaXvNuxt7hn5KJS5ICAtairaYmz
         hBRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9KHdCgaY9bts/djUjMbkSOGGl21At38EsBwcfe7gQtUmrAbsi95j1wbfWpsUiikpaqsPgXWrlAh6OIO8=@vger.kernel.org
X-Gm-Message-State: AFuF++lQYMF9cH0WV72rgWXINDu/fbfZF0mjWcYu6DaPfpfQQ4bLjecR
	TZfk+n3U5l3KNEE7ZT9mzBRSY+I26+K0VpPitAU2DtDByes9sCcNlMHe
X-Gm-Gg: AYBFou2QRrCz6MM9wfdKRFdDaww7ZDsXAs92w9PQ0NgrIYE0lN4dFVPTlT2rF6+5jXm
	srgnd0brLstNZrH8MxYpYd+lsyi4pYFFmH8b4GxYN9YYMAJsiHskRr2ejyElvVI9T87mDozPNDc
	9tic5j/DtqEmCYsGN2R6QC6JvPBr6O+lqWKQlRyP7lhXPvVtoia5qOJjquNMZa9tMLfnNsYItKZ
	D2qkvM92587MvOcakxxHMBx8Ar6yUTq0SysBiv1Cd5QJZJWLMd3NwmAofdf2fyeLM0xZERITkWj
	hvYEI4izaeNg/fIvCAh1jLnMYdgcBKj0Q5SaCyxTA6j5+2kaaVk9aIaG/LkxpUCzI1G4tziRWlP
	IKHzW5FXCFEey7AsbVHR0rAg5ubJBR2DHVbzVxnDeXd0qOtBsGnj4BxlJ51i5l6kzazIJz9VwvP
	dEqeZAEomJBHOn6TAgjZB9d4UcBQ3158Q1n9i1q3h0/nmzQYFxYRkFZdoXwCuqc/nKh2CO36ahY
	RqV46cRNHU1wpK6qJTqTnGdh0D+mA==
X-Received: by 2002:a05:6a00:9514:b0:852:131f:b9d2 with SMTP id d2e1a72fcca58-861677b2704mr28394845b3a.2.1788757484351;
        Sun, 06 Sep 2026 22:04:44 -0700 (PDT)
Received: from Inspiron5409 ([2401:b60:5:2e5::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615203e041sm3885072b3a.17.2026.09.06.22.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:04:43 -0700 (PDT)
From: Jianhui Xu <neuromoments@gmail.com>
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	neuromoments@gmail.com,
	pabeni@redhat.com
Subject: Re: [PATCH net-next v10 00/15] ax88179_178a: Add support for AX88179A-based chips
Date: Mon,  7 Sep 2026 13:04:37 +0800
Message-ID: <20260907050437.1345480-1-neuromoments@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f56aa06f-fad7-4714-9c54-846397bf2438@birger-koblitz.de>
References: <f56aa06f-fad7-4714-9c54-846397bf2438@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Birger,

Thanks for your testing.

Using only

  if (link)
          phylink_mac_interrupt(data->phylink);

would be simpler, but it would also discard every hardware link-down
notification. I agree that we should leave the driver unchanged for now,
since I could not reproduce that event in a further 90 unmodified-v9
cycles, and your 1,000 v10 cycles also passed.

Please disregard my experimental patch. I will report again if I find a
reliable reproducer or evidence that identifies a specific driver problem.

Thanks,
Jianhui
