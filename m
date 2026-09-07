Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F603659FB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755067; cv=none; b=uDKmMtVqTa30zNGQ5hGDcma0pK3xc2hJP7/jrEIb5YZiV54Ryu9EXsA6oRg0PRbCcg09CcfCVy9W46iqwn8HwkB0jTiDo1Ep7RjOjknNIltcRaLxnUv1tMUI/4J8ZMiS2G4+QMFpAjljC2Q+6gi0U1aemYLEWIHVkDs5d2HaIjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755067; c=relaxed/simple;
	bh=lJDUxyPdhayx0ExZBf2syu+HfHSr7EA6KEMr71C44Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADnbz4EuryldimLD+jHQR86W1etMYdL9H//IvBAVzZb4grwacEYxbcu180uKsl4ULXAtvp6b5ANgA/GPiP5I6V5XI3AmbNvQ0wLed2PmXvEcNqJ0jbK5eq9kKL9pzdXjL5dTVDYfrMU/65Ui5rkSFFKZhJNE7LjafIZQthpHzrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBd1QUZo; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBd1QUZo"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2081661a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755065; x=1789359865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJBeYuV5iB0P/zCTwardR507uSWbJkSOyEux2XLgUg0=;
        b=YBd1QUZojHmDvsTmSucJeJotD6pKeR/hzNShXP26uVItUyhAajHtO2jgDpOmXnD8OW
         ZesD8iZRzTpfRHAvLE53TKHY2JkvOj5WEbqSs3T70LvJf+l2G3brZcvy+PEZThn68LNG
         lSKOB9JtSmqnop7DdYjXCUte++xlch8F9GvgkblIvy0OMRJ9ZcmpsiQLZ4sAi4khirpn
         thAsLI5T0HmhCXcvEmOjRT9sBLYn5x07MRhNTKatx02tFsG0FAWMYvu30aqU6Lp2FLJP
         MRp+nkuf/vUatSSldJ/V69i20MmSuqsQA/fQRRG8E6P9x9MAR7guod4ZmN/EFXEnSJQY
         8HtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755065; x=1789359865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oJBeYuV5iB0P/zCTwardR507uSWbJkSOyEux2XLgUg0=;
        b=RCGiKspq/dvQ6bBowxMrrUEFVee3OUvUB26msL5jow60ox1eQgLs2p0M9n9rhy1uEo
         B3wZXzKM0o02HiiuiWCqZA3Irhkmy3HgMIltjfo//rBqJ2pn8QpxJV8Zfc3jQt9o3DWr
         VFICCk5WYt+WKIqxOs9cxLHFQZVrHd+PPIADzL9QJ+EWAQ1lIVytX++34zZag1Ic44vV
         FhcJ3dYGKxSXlsssIxt4I75og6v7wXyguSQB4vPLLWDERS3cEIipdYkCWFlvassFwiaP
         xxBr546xfYKKF7B0YwfLHlAeiBHxIvXU0meaG2sVmVKHCnPv7c23IGgoernv0q/Uj0r7
         7BVQ==
X-Gm-Message-State: AFuF++nBugo4JAWkr9DqEDcqvPwFLNESTLPBpWH/Eh3OoJxQbmEPFBK2
	s0TRpi5Mpucj64dN/SvLJF4M9MIZ+DDzwKG261Ovs1J/GFuHBzXTztGK0ohNZ7KLhtE=
X-Gm-Gg: AYBFou3W8opvLW/x2JyYWJtyAfGbg99tL1h2QkS+lgXE5dJ2QT6OddOY+FzwqbVP0OO
	WCUSRBdUoVFQrH4a6Q5YJuB8JgQKejSsBnxRMcqwoQN9aNdieohLhj5G3ZnNmiZvwJfRMYLoRRO
	4oK7C1PZ46zmGGHtU8+Y3/rG23ijP5Qqwq143CZYo4f3TR56k22Pp3rHwCnpmrBDkC2ppkyfp88
	krN2REjRvmHreflRj5+M6Lu5WFAB4rUEFprjnzU1fDwmkwuKVBpW5I2KwxSAkaUPZYjHeTVAW5G
	Lifn0TkXRPPQZH8hKJcEoUziHNxFr7BQiGnGl2RSK6+Ie8N2UIpANBXN7wWncGVmFbGWDRsUh2N
	5pEXee6/p3Hxpvg9pQRX55W78Pb5QQ/364Ba2QB83l2qAythbHZV2EaEp4QV2ZXqDO1R/ieGjcl
	ErIWqxzB/y9pbVWZkNtXgsiCDcRbEQoe6AagAiIcx5qJ1ezOZWvibCsGmNJ5sXbUiXnoO1u7hKI
	gPaaxicBdAtow==
X-Received: by 2002:a05:6a20:c896:b0:3cc:917f:f302 with SMTP id adf61e73a8af0-3da39f6054emr30322461637.9.1788755065532;
        Sun, 06 Sep 2026 21:24:25 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm22629643eec.17.2026.09.06.21.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:24:25 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] isofs: fix repeated word 'in' in comment
Date: Mon,  7 Sep 2026 09:54:02 +0530
Message-ID: <20260907042402.12893-6-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904123914.583-1-hemanth.selam@gmail.com>
References: <20260904123914.583-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please drop this patch, it is wrong.

  "the subsequent blocks are going to come in in short order"

"come in" is the verb and "in short order" is the adverbial that follows
it.  Both words belong there and the comment reads correctly as it is.

I matched the doubled word without reading the sentence.  Sorry for the
noise.
