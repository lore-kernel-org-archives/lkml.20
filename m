Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E641E3BBFB4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625747; cv=none; b=pZtA/pBXVjEJxgi0QCK8+HfdpD2+pvpgWEopa/9LZ5yxUjhk7/X2vmn0c168NW+xSZCqkbFgpbSa5x5RZ2I644P+4UoWBVF9wVzoouK7UBDSGm9j8nRCHbDTePdVkhjI1XS3pNiVNW1QPsAsPrwZ03jbRaED07tKWdySciwykys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625747; c=relaxed/simple;
	bh=+K4jEI7K5jG3d7ElsjaI4ZZGrcnnZ/RJPFxiwdiWFHw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IGvfBRGvHf5u9cFoFbHGpRGoCMpmPSnVBkK44XAQG0iFlJlNCoagR5cdoRVlwI+mKSgu+w8KJtwq2jwfrqj60Nv+FlwjACFr0wi20LJggXJ+HILWkfbOokzAmp5YXgkl/2vlW/98mOiZHQ8XwP0D0r9d3XI7RtoMU9OU5OhuUiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecx+c3t0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecx+c3t0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso5966705e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789625744; x=1790230544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+K4jEI7K5jG3d7ElsjaI4ZZGrcnnZ/RJPFxiwdiWFHw=;
        b=ecx+c3t07MH9sBrCeEPAbfQYci6shc52HtS4r73KOSmKZ7n4S5F55teiL51reGS260
         XxUannRRoX6RRYc1f7aW9mvhaZ+WgXCu7gziS4SAT36HfZZJaj1Gx+RxdGCh/xEhCUUP
         2SCTat+g5dZsiedwwIWKEwDiQtRdH/tVOtvGdare6TbfDhYQYC4fah/s7N1HDKy5CkBT
         hRseOleyC33ZzqhKJot4fK29HoLBE+yqpPAIEGaQcqk+GzTX7Ek/n+miWDC48k7jqg7Y
         AKrTgIM8Gj2+rNAg4qjtFpaogRwyVsxeaW5K6gmaRDK0cOeIrpXx648jfj4vv5SdUEEe
         nxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789625744; x=1790230544;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+K4jEI7K5jG3d7ElsjaI4ZZGrcnnZ/RJPFxiwdiWFHw=;
        b=pRSWfwE20Z+FIrq5bD6ljoVHrF41QPx0fdngsXr4yR/oMHVIjO8WI5PR+mtAlog8s/
         f/4zPZoijSr8FQ3PwLT/W7bNk4GJhoFLcApA3tu+fh8tJVJmzsx5Ic/5O0qxfLESk8q0
         52sVO/Dbw0Kr68gCIG3vOvPK0cYOkLEE4xGJIagM3ZwND5owx2daSXXtwCPTBSyZ5p7k
         7Sfe2iAc9dvXcdrKTGWAE5vabJ8pT4xDV7FF0VktrsDEsaBLW2XLV96eeqecrEt9zgaN
         Y+1KJfKG18g36I7JIlMQXvRsH98eD38NpIP0K1L6KJw23eNyoSdhUTAm+kfWrDa5wgb1
         KSeg==
X-Forwarded-Encrypted: i=1; AKwUvBzIgkQUU3swJN8hVC2BcOIiAgc+4sC8YoGWJymVDjpt4mNH4p42DB6Ku/sigMehRTmfx1yDYH+P4b29EjY=@vger.kernel.org
X-Gm-Message-State: AFuF++nODDTULmJPJ3Ih8Sq9xUMEJki5dgiowuuLk1pbB3VDm3CtvU4m
	jY4HE43xd1crFUIpmNuwU2ksbGmU7FAkr4V9YCpfAUk0k8BsI4G1GVXK
X-Gm-Gg: AYBFou16kngv3BpcJfAwH6xYoUIafwi43P0ZWZ2hbriv0t3McABCPjhDcTgHjI81SsL
	Jt780bRnmqJaNBraoY7DOQuOsxkPRRfUYROasPZwBO8Cwd54jFG4IYtpM0vbt2Wkwz7ewspDV/g
	jE52DImSr9hlBc+xa5GbOl81CSB4ONpZXnBnHNSF0fWolGpSmtoAy5htUs0W0CC++JhZAAqF6xe
	MpJzH1hNE7QVtbAiRoJvp5PLbZsxlrLi4d/zCqBJBUpLIKIPJbGTekHPQdbsbH/VkQq3mJsId07
	ZiDQQ+jfm3Y38eUGSYD4akvEwOBmibp7cqzGPTOhsNwDZJxTZw7o6CEIwOW5UWAlDQ5hJYl76ce
	gpc+MIKg+OwjgmvrOln+tlLb9nrhnrkCZMbcZS7Ckufcp7IMI/RpuN6fdVmJnQMsTa8bC1ET2pU
	ekbZAZq2U9Ts8PvcEahLgW4OUbrLO96GOrAzJv5Pr4Zt0KVL3WsIx921wJnFkc/dWq87iNhJsB2
	4ke2hGRonHO8rP3/398ftULVoQC0vUEPOwnimeEkeCC6+Iy2JAILrmkryNRUWW2eqZrCz8PJUva
	0VjJSvsFmZ0g28EDWHZnOL67Nyc5zaaCKqdT42daIc7hV98Xkdcjhp0dVUSw+f+buiYCPE63JbP
	E
X-Received: by 2002:a05:600c:6296:b0:49e:602a:b4ec with SMTP id 5b1f17b1804b1-49eb730e225mr109105555e9.8.1789625743878;
        Wed, 16 Sep 2026 23:15:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9dc6-c001-54ee-4741-4927-0a28.310.pool.telefonica.de. [2a02:3100:9dc6:c001:54ee:4741:4927:a28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23f4e6sm55558105e9.8.2026.09.16.23.15.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 23:15:43 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Brian Masney <bmasney+clk@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Subject: Re: [PATCH] clk: aspeed: ast2700: select AUXILIARY_BUS
Date: Thu, 17 Sep 2026 08:15:39 +0200
Message-Id: <20260917061539.51943-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260712160301.98941-1-kmehltretter@gmail.com>
References: <20260712160301.98941-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 12 Jul 2026 18:03:01 +0200, I wrote:
> Select AUXILIARY_BUS directly, as other clock drivers that create
> auxiliary devices do, so it builds regardless of the reset driver.

Friendly ping on this patch. It already has two Reviewed-by tags.

Adding the new clk co-maintainer addresses to Cc. Is anything else
needed from my side before this can be picked up?

Thanks,
Karl
