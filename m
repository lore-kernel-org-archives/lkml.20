Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39084AB3DC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346781; cv=none; b=BtsZ7rCl/8eruXkvaFVTaHahucuLhS8vzTa0P+fOcDirMnlL9Hw7/hm1pQ7O/INK0WKV/kNXWnD3FHeHHLlEuOmezF8kXFSprU3iTyfkYxmeAKVDaD88XQ9u2LmorryAK1EHQDO70XZxZRkDX3CvNyngrNvKo/x/szC1GPeiRBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346781; c=relaxed/simple;
	bh=JfjNdOkV6czIA57rgjyzP2vkzS7QeX8zyexGClAHNV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPj0tO/+KdTkQJmzgeIJjd9dX/BYO5/U52/rfUS+Aa8M7YNn8wAglAcnk7sDwY4SHQYriEe2+KTwIoppgWY1aWM59WVxQR8b8nPuFcBkhOsTz/iy6iYKCJj/Mtzn4F86iBIuO8nwzI7f9sjupuNfFhSGzHi/vTISlU11Np4ecfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hR6z2bMD; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hR6z2bMD"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e620fa473so6080055e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790346754; x=1790951554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6G1/nB52qdf+pNA4653UiqYpDMxleEfU1TnV94wJwE=;
        b=hR6z2bMDq0jmYglEjbKA6Xre+kvsAjX8/IzpTm1EJ6QgiwpvJCih0EXAlrxlJz2W3A
         wJZ1JOw9THj8GCx47p+kfz36Y/OzHfp2zob0r2RoDe884ozVMZ5HbVVJ1ia61z70EGMe
         PHefQOn4mO0HWamibHpSI2VrdReQecoqKdUrQFB33grsv5u6DfeHyCJDBrIN90u3oY3j
         N0O1lKaMOfm3rLwF9lZDOMBfXLfVbrDaSnrCGejig34YxvmBEYnumAZ51grxe0aj63nl
         ScL4wKQ5r5UD4OM1EBiOmvSQb+IAXAoVltLnaKAFjsQRIGBbbHNED7YxycdxVDtqWsoS
         Yriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790346754; x=1790951554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6G1/nB52qdf+pNA4653UiqYpDMxleEfU1TnV94wJwE=;
        b=dpvKDqTymAOrGzx20H1cJvdRYDmz8Gv+cx8PXhEZfSbGiFz2osKzdcHKetHB9Gv/tx
         CPnORcoAugAzmhQtUra1Z3niUwXEXBrJgZMlMMeslZeCCBdZaoiBzeguTrCdt+QZPGJ8
         XFms/01TnBgs8+BY5b0Fw8PoJIu9Hyn2clP2OeawtaDK2XHN6CYNKJcg4Y2NELbZMyag
         0QhkUBtgi3C7BlP1wKdBwvLIlonsei6UonbkDAphpF1q8COnM3ScXaB7JiKTAOFe6Zad
         /9c/Dc1du6PfrZfAk+0omowvuBPH/UpU3CV26Tlz9FJfcKCgo4Yb+ncfxhTqHHRHQmpZ
         3PVQ==
X-Forwarded-Encrypted: i=1; AKwUvBx364ayIiqZufB0bgZc/D0bsawtZ6zQmgtNDF4ZtTfdiaeavFw4a7OltmN8caN/vltD47lVwplQ52NgwNw=@vger.kernel.org
X-Gm-Message-State: AFuF++nYtdtuCHIRldDoSgOFKQEaYX0RfoFfI5ApOyWI0TONrGRYoa1E
	gyjw4lDw2SGwRPsUtEFBhQeEJbnGTxkQ1+N8am+s8eKf2B9KJCNcKe+A
X-Gm-Gg: AYBFou3c8ZWIyPbgWTy+1+lhMNPg1MvmlDFQnQMlO/kQ5EmVUmMjGarOm2DBulHwbQ6
	Rt4q7TQA9mIlTsVOk5RoOxzlMCtx/a+QEvFTb74j2KSba3eK1Ba3kj4XsgdCjec36QLxBQ7llYt
	gcqKa54ga+k6l68lEu80BuQkOFUk8T6MCuuRhggT4Gu6J8lOPiO3gLgwmOGmNyza6xozQrGdGjY
	Nd8Zb8IAFv2HaTS4mr5Iru9TOY/ihLAVQbDWz75gVfmnv9EbDvMA3NArCXSBUvAadpNB9XiNRi6
	tzJiYC1ORilLHV3vbphxnV/wT27mag4iKomXoNt2349PYFpyIgIi8prIg0rQ9YUTG2TgBox4xCM
	2ZydBcRBGq9btrlWd4TWK/pxzvsJYMRU354LLerXW8YWRSzmdX8MPwYUAPc10njauIH6qCxjtKY
	W0KI6rx1iLLRao4gTgmFS1b66/8H8ox8GTZKZT2f7nMgQxcgvI3XgmIYkK+A4tXY8L9TkQwdfz3
	25PLQEivsH2VgBKWTindhKYBRk37L6AAvs0AgOXIRuCX2JNjOe3
X-Received: by 2002:a05:600c:4f47:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-49ff06ed9c1mr51897165e9.28.1790346754282;
        Fri, 25 Sep 2026 07:32:34 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (public-gprs197761.centertel.pl. [46.134.111.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm7034706f8f.35.2026.09.25.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:32:33 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Gabor Juhos <j4g8y7@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jie Luo <jie.luo@oss.qualcomm.com>,
	Georg Seema <georgseema@gmail.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks enabled
Date: Fri, 25 Sep 2026 16:32:28 +0200
Message-ID: <20260925143228.386299-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813093351.178419-1-kuncy7@gmail.com>
References: <20260813093351.178419-1-kuncy7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please drop this patch.

Gabor's fix for the same hang has been applied:

  33f9cb56cc28 ("clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as critical")

It addresses the platform-level cause: 'gpll0_main' feeds the CPUs
through GPLL0 during early boot, before the APCS clock is registered
and CCF can see that consumer, so the first driver to drop a runtime PM
reference on a GCC clock under it takes the CPUs down with it. The
ipq-cmn-pll probe was only the first driver to do so on the AX55 v1; I
had verified on that board that Gabor's change alone gives a reliable
boot with this patch absent, and OpenWrt has since replaced this patch
with his in its tree.

That also answers the two open questions here. Jie's suggestion of
making the GCC a consumer of the CMN PLL outputs is no longer needed
for this hang, and Konrad's question about crashdump mode I cannot
answer: I never captured that state, and with the fix in place I have
nothing left that reproduces it.

Thank you all for the review, and Gabor for finding the actual cause.

Best regards,
Stanislaw
