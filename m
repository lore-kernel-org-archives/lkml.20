Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94B84E1C8D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568245; cv=none; b=eRUiK8G6Ax5J1f77ZuOc1NDCq9CpMJU+JhpDb/wdGi4/6mD4tJTqelY9g90akipl8fFEP7BKQBK+of3lePnzAQWphOWfBqMgbIV359FZHdk3Seh8kK9qbIvXO3moR6c/O0LrvunGGpuP5OJUq3A+QDefhSPav3UhZAcXgw9LEcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568245; c=relaxed/simple;
	bh=WamLBlsKicbvMN84nu//E+GEDYaz+ghaJeYJo0L0wF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Isnipir9Mr73IJtqmOCu+oMjk+DWRrKIYx5C3gd+qJa3aKuYuK5g/5pYQFp4+5hEviDlQL2qQx4KqjH4VXYAw1x8EndbZV7MqZQMVLdpYw96joiWqrkrvwjxjcoPKYavJGnEBwg58q1gWP5Cl1tpfrP+TY3u5mTgQ2s2Nu6yr8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEPpS5a0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEPpS5a0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db80fcdf8bso33244055ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568244; x=1792173044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJ9XeYQkqhsjchhR0kegBTiZB6XHwagNviFnMzxLQE8=;
        b=hEPpS5a0HL6SZR2CuA8rnNtR4gs6AOQsoGHc5/kjdWCDE+XOqhYyYMTUH5MC13f6R+
         kpaBAiNFJ+A44VDf4+EGJOgDz237JnHgORfpY6xWEeUn843ecQTOWCdj4bmn/bAA4szv
         yXHEUC+IzODdarFT1W/JXpAfOPeLNwazM164RDTqgaQ+SIX8njOB4rPNRrNEO9lEaMGt
         3Lw8RRdOy2nBMGANG47TrdwsMsYNwINtl8gmQPkDtxRgKxDMSh2Njn0DmtfaSY9Sdo++
         MYPpsMuzDX8kVV11zTG9o3PSfzertFZDei1GUTyQAAb3egORcALl+3lGUR+pAb0LPPe7
         9JJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568244; x=1792173044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rJ9XeYQkqhsjchhR0kegBTiZB6XHwagNviFnMzxLQE8=;
        b=sPfwVQCFz499ahOH5jSXsMPlSUuCZTcUXcFBmD6rwBmbmiLOvdnC5KwTzBXyA1hxJ6
         Ozi9zOImlckeZjE1OhDArPhRWzGqguCmOY8aBd3n/E3sqBXIbBypbKfFhFLBz1tnW+f+
         Q1fMOJu1/IwgkZL+mRqaUki1NV4onZqCY+B/oRlJOgY3aoZIsYQ6uJwQsRbepUzqXlgV
         5gitr3OrD+HAbqINi89e2mLGniuvlhxWgdlf5lqOAeQF0wmENf2NLLC8zXPuxqlPafvk
         DX+k27j7mSsffifjvZIev44ku2R1czDtvmxUuAVeuNTuofzyb2pqv2VOfB+DroyYFu08
         ixRA==
X-Forwarded-Encrypted: i=1; AKwUvBxwdyxerZKpWrlKnvXHzulKid9UiXooJboWotyyb8pZPCAHVleLoUVqQTKh4rRRIraNFHelhTVyYwslBAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE1fONLFRIp4vGINPuEHN3T9nQF+EIMUZDsSQaONhzxD6UJHU5
	EbpHgEOQYvWsWg3RsdoHNVZrBCvJQoC0ht/v9CYfYPamdt894eCLuVpi
X-Gm-Gg: AYBFou3nA6dLDO6MwvRMtfMu6IZVdRXG/JAkPT2ZoYArvbM8Xsv7cTAMhxVcGy7WxSl
	DPM0/cnezO/EzS/xMEtEdOhP0tQL2ETjOcomDBiTaE9O1rVgOp7TRK2orf1rPhwoSwiDYlUWoE0
	eskR+K+mE48J8FSLU+ZRfUFtL4wi0YBP9IEWfSDYptd75q119xPV1PIa5NaAshlGq3f5b/kCldf
	o40bI7+VnsVzinUdi/dKiqT9+3jaG5wW0pOf94eohHVf5taBAEWWfvRbuHhWv3fbhX74AM045xV
	uTNxRFbjYx02+Mro9RSIX/AneLf4NrVXQgKWuZMdnvkV8EOHLh4S/iDiaaLRH+UZPXBSTr9/jnh
	RVyoCgpMCNW4AXxkDLEo1F3xDTOXyDr55ow6FBFMepHMVGy+pu37ri2pn6pjgwohg3rqAyqs5bp
	QxqF33XTnIm+1tY5QUvnKWU6PtBVWYJggkn3SO+zjsIlCMXqsCkXCcG8JElfCsSlthy+R5kH6sF
	tzoFQyzNpYpCvVkVIPjVcKO2XOXdyxSn0kAzSEU0LYioEUk4C6gJ52jVAuTrFx/glSfA8Xb61db
	KgSd8i4iZ6gKvkOgjNGECQfS3u3ML38gFjm8YPEHvh3ns3bRu8Xc1ur7a/UbysvjnS0e86y3qEB
	P/TVaYMa7fu9KIajP
X-Received: by 2002:a17:903:8cc:b0:2e4:b218:f689 with SMTP id d9443c01a7336-2e842abfe6fmr19557115ad.53.1791568243896;
        Fri, 09 Oct 2026 10:50:43 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:d58d:323::50:f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1562sm14512165ad.34.2026.10.09.10.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:50:43 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/make_fit: Ignore schema checks when decomposing DTBs
Date: Sat, 10 Oct 2026 01:50:23 +0800
Message-ID: <20261009175024.2212-1-ue081723@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <CAFLszTjiX+oiDBsm7MccvZqhcMae=4Dh5x6ULHSLDRMQN8NwZQ@mail.gmail.com>
References: <CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com> <CAFLszTjiX+oiDBsm7MccvZqhcMae=4Dh5x6ULHSLDRMQN8NwZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 9 Oct 2026 at 08:13, Simon Glass <sjg@chromium.org> wrote:
> Reviewed-by: Simon Glass <sjg@chromium.org>

Thanks for the review, Simon.

Nathan, Nicolas: recent scripts/make_fit.py changes have gone through
the kbuild tree, but I did not Cc you or linux-kbuild on the original
posting, sorry about that. Would you be able to pick this up, or would
you prefer that I resend it with linux-kbuild on Cc?

The patch is here:

  https://lore.kernel.org/all/CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com/

Thanks,
Ting-Han
