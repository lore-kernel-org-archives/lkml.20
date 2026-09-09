Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F79556B81
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957414; cv=none; b=mssEkAVMERLbURlUm5I/uFAM1D2grDvyEhbsmtLHdFJI+vFlL4Q7SGJCNgT6AJbkteORaoTN4dw5wqklAa/KR2OHwZlnP7DBrpqES7Pee7/N5+2r7hTVBpbMvl5DOZVSs6taKXWNtHx0x6owPXHfK4NeszTNOSCEO6VtXNNPB/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957414; c=relaxed/simple;
	bh=9iJVKfbofuta5wUIlWjdU3gTlMJE5osJEWFg/8jwAI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EC34JsB8+3mAGdV6nGDbURInoHZr23Ib+nN9MxJ4duJchTWr4piDG1jmzdGIwm/LsVnJAUFLvaZR3AddNXjIpGgb1CDEX9qcDcC6thNh2sHPcKOxQDasWwWtY5R7pzaSp5tM8eyhUeQBBxx0hERxPHpeyyRHh/ZwQBc+lbEpTdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMZST93E; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMZST93E"
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49556ce3549so35166495e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788957410; x=1789562210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zx3fhksLVe/0x0rLzS+DV0zgnA9dPIadpHrbGOt07q4=;
        b=AMZST93EmTkjT443V4s9aHCzS3+Sgs3PTM1VHDGsFk2pgYnkUc7FokZVWv+yKDCh9Z
         xDyYXAIDshmHWPp4UdjF90cc8jn762z0JuiH4AhmERCeQl1+rb7N2/LOELaSraEfXTm+
         JDsNNZbogoG1ihld0Bj2tDY7oAyBSZtHrR/3Y1EQYg/3iKDAhB35mEZywA7r+rFWNAh0
         8FNbVWpuWCAdM/P2qXsgLg1t+T9I/yGTtk1FUEsttHRNLgE+ZrAGBUpaigS+JnTrQ/LG
         B082m2Y9FjGnVHEoRks9KNu+Lv9a+PfewK9G3HDfkd6wUCfCUHHEmAGeUFESfYJ4CS9F
         eXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957410; x=1789562210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zx3fhksLVe/0x0rLzS+DV0zgnA9dPIadpHrbGOt07q4=;
        b=j0xAJ34ybTpZUtRGpEYYrQRkQPYOoQBmeMhJSoHebBIzTcy228G1DnK4FgM8Cso14J
         qr4PegtwCIBgK8M/hICtUtVswqICSmr+wsFl90M47ZNtoCEOFYhiMb7R7lKs+zgz1CQt
         g+r1GawYLL3cI7ZMHRfgODDoC1f6U4LxvxB1f4zRfAQQoGCK/QESp/SG2tW+98Teu3wh
         +qHnTKwvqCvzOJxT55Ge282riZDCyGElIuUfvYH5LzwTPOxprD/ABQiKXl8ozX2iZjIP
         twrs2Nr9pcMEmtiRwDMx/60y9Y/9WPPKKcTajP7vBwVjGxtPX/vOCMoIEJDz95hsWvJO
         qbsA==
X-Forwarded-Encrypted: i=1; AKwUvBxNeVq3Pzgfle3e9bRqKTFjHe6WZqw9HMG6LgTU30EqYylHl3Z73kh+mOB0i3zZMwgjl9BKv/gxRlqRpVo=@vger.kernel.org
X-Gm-Message-State: AFuF++mqQAnsP1SacKA4s7X+lt6a+exP/NWQu4LHh6htsQN1rMfxVjub
	zHWOVDrou7Cm+AM6tyahrVKWxAPcTDjy3M5G5CGvSDVoKLqsvew18woqRP6lj6gX
X-Gm-Gg: AYBFou1GHhPnr02g0A+CuDH59dfWd+J6O6K/BE9pLeDqBSHhhw8X9btyOB18dTtLPqn
	KxBfk4XsWEudjadI3qAzngX53lExqoV5dxuyuhZPPQtgy61MceZt/RcbyD/DR9+0E5WK5g5VMuP
	QdExZH7F/M9hE+JP0Qja7tp0uLWGN4+5BbvYcLoHHEBbqoQocLTVols5AAloEolLAtQlbJB5QDa
	6ZHRdnG7igzLg8WF/UwDABUg+Tq7w4NUSzHEmg+UkbCDwHFHYo4oMdSAwKVsn/d1ova+PJ2jK8U
	fDaqZCFi4/Yq1ziNXZMpapeygjCzL3vaBOoeIj1xxmJS/8iM1hTSslRAuJ3iE+qfoh9LPITNjyI
	uNuKT+W+Qd7R6LNNU+tls1NtA4vUW89VUNBNfeeCoW1UqO4unHBny1NZD8KykG02oNjDBlZJ1Wh
	i+KUGiMG6UtWsp9Ju6jeCmUxS82D2Njkqmx4/R9iJb8DVK5wvXucV4o0Yb4RqSxGufobIcAx4=
X-Received: by 2002:a05:600c:1f8b:b0:49d:797:83bf with SMTP id 5b1f17b1804b1-49d07978531mr245789755e9.21.1788957410005;
        Wed, 09 Sep 2026 05:36:50 -0700 (PDT)
Received: from bera-gentoo ([2a02:ff0:c13:ea42:44d3:2042:c3d9:257e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm368009235e9.8.2026.09.09.05.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:36:49 -0700 (PDT)
From: b9788213@gmail.com
To: fahmymohammed@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style in HalBtc8723b2Ant.c
Date: Wed,  9 Sep 2026 15:36:13 +0300
Message-ID: <20260909123648.174428-1-b9788213@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908025910.155625-1-fahmymohammed@gmail.com>
References: <20260908025910.155625-1-fahmymohammed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon 7 Sep 2026 20:57:57 -0600, Fahmy Hassan wrote:
> Address checkpatch.pl warnings listed in the driver's TODO file:
> remove braces around single-statement if/else arms, wrap function
> calls that exceed the 100 column limit, and move trailing comments
> that pushed lines over the limit onto their own line above the
> statement they document.

...

> -				if (bBtHsOn) {
> -				} else {
> +				if (bBtHsOn)
> +					;
> +				else
>  					algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
> -				}

You can use something like

if (!bBtHsOn)
	algorithm = BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;

Thanks,
Bera
