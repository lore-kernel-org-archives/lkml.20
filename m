Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C680741DDE5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790879258; cv=none; b=huAnp/U3Iz4dlbDRDLaU5m01b2eLUlHUErcUx+7K+n+uO9TyM4jZdyf3IPu/l4pQ6VkhODaOyQ7I9VimKJjOaO/rBL+2FUF9jg+gBeCLqk92Vujm0oBlo+KXzdEPGVoUH6oOtpr1OA5AOsVNn4P7WTpqmwOJbq3YUkoUNr51GM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790879258; c=relaxed/simple;
	bh=FWqrY638ndsqYOjgAcSObSdwT8Fs/YNGX9HO//v8TmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVGUyXbh1Biast/3Sp68K4/wW8fVfOZ1jdbmXcLlBRcykK1fhesLVGdyGgRUytxdzI1B5xkh0usVTSr+lNAajbzdPh+1ay1o2fo4Dbhi2/fOw8JafGcH4fJi7Hh3Q0G/8s9Qo8T/HZx2qYgFvpz2ZYMpQIx8LlLXCyguCg84Dp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=R7o5tUNp; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="R7o5tUNp"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so52142965e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790879255; x=1791484055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWqrY638ndsqYOjgAcSObSdwT8Fs/YNGX9HO//v8TmE=;
        b=R7o5tUNpR9hmLw4mfG0sHW8WqKMY1H2FgoOEwv0f2XpcIxD/sOtldJ14wqLdToi5/p
         lfukGXxCczUbolCHXqlLxVXozpvbiJl6Kp841S83ifbVJBi5nZiQp0u525DL5fBI24Gv
         oXNI/Xnc0flYwKdLcrR2jufMXKfiXppbDtZJ/ufyQeVt4L5e5C+EAWXyxdVc2Y+fH1Hc
         eY+fnrH1VLcgVMN66csnCxhut31gckmz1R6CEoPPfWnPLJkI1+cMRPSuqAvSE95NrLAz
         y3D6AVHAgaGn9/LH5rhj8bVmru4ueZtY5ie1aytSWDlFD2EFIiAOx7gxamg5h62n/aOP
         jCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790879255; x=1791484055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FWqrY638ndsqYOjgAcSObSdwT8Fs/YNGX9HO//v8TmE=;
        b=oT0mbTgKY8FFr4lHnKsFhklYRGsVXYVBUAE9p0qud8wSbUkxG5cOosfWyv8OF5LC7W
         RXk6ZBm1RibDOxgHglcRKzOz7ahMZk9YvqO88Tvomhb/t/i8JF7grh9fu+Vb0pbNHBTJ
         qItmOCqnRBvf2mRXNlDB2sWtE9BSE9zqLkZWDztK1iY3nrt5iYdDunHvIMGpJGBNOJs1
         IK5pKFglKiffVfoKTdO81Wq5geceEHIqTlND3P85jDzcBxCg9GW4+kNuraFln8mTw0Dz
         JJdtu7gr4ViyQjAvCktVYhsACfrGDNzx6H9GMNKti5wRfJ/7s3CdrOxbHSFWy5g98W04
         GCUg==
X-Forwarded-Encrypted: i=1; AKwUvBxM3WXu8o4vgBAWK/rYB+0qPrZAsVIkR68WKXS79uPGi1MDA67BylLr19O9Ga38WtMM96ByGw1A620iPQ8=@vger.kernel.org
X-Gm-Message-State: AFuF++nABCojdXHL+WgEqpSL2upVRRFaMd/sNkJvQ8CTtzOnneWSUdJN
	IG4Z97Fr+Pt7dQ+ZkdyZrV/LCEDGkTAGrRXTdlcR7cv2dXKIFTxNKozn1p+0BTRA5tQ=
X-Gm-Gg: AYBFou11hPsDwusrFercvNN9X6ASRw/oLogcxyUvGqjfg+qyOLlN/kzq6m92YXOd1GA
	H2O8ZFzhzsBTZCWjtqpBANDXbsxcRlFHE/pko2Xi9nN3ZTWQwBOXgw8W0aEpUsxsg44BzGI+LBo
	nl/2n8Xj7dwhx9LnuOFpUGkl7HyS5cdhCm509AonZH07FWXKuA2ahfQHluquE3wYrFKtXVOStde
	6TcRukgqg65YprAqS6KATAiQ6URicKj+3LAQZ7cWFHUsx8taxbOZvo6UMAcJk3EUMpJdo+4jWu3
	UxtI5axkU0L5Aeruwpif4thN+PKBYyaIG5rxVhSqcvEowtvCkVOyuC0y3jzqLhlXKYC+UMpmEXc
	Mg7HyzW5MUTuXN0iGIMDeQ7NGPSfOalgKPNFvKUDpdYaLwvrG5iFkNq19VUNu38LXY2D1sSsvic
	uYsPAFu68i/DQqLnQxc85urGTrrrzHHz1D+t8O/z/ef4vNK3Dzl4EMZssXl1EnAziu5cF5IYjc7
	z6MCwFYxbvsmFx+8DJ19GQrHvlyb3bti4gMwVc0sB5wSlETZYhapAfcXJsZ3i4kuXqX2l1QkjOr
	S23q
X-Received: by 2002:a05:600c:19cb:b0:4a0:98c:e082 with SMTP id 5b1f17b1804b1-4a02759fc4cmr8556725e9.13.1790879255118;
        Thu, 01 Oct 2026 11:27:35 -0700 (PDT)
Received: from localhost.localdomain ([197.51.130.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ad8c34sm4242795e9.0.2026.10.01.11.27.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 11:27:34 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] amt: mark relay data as a UDP tunnel packet before sending it
Date: Thu,  1 Oct 2026 21:26:54 +0300
Message-ID: <20261001182655.29692-3-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CANn89iKErdqHOGFpQLM_MAi-LcAaR6ZR2_rhdtZzv1TJc2L4RQ@mail.gmail.com>
References: <20261001171016.88208-1-omar@blockcast.net> <20261001171016.88208-2-omar@blockcast.net> <CANn89iKErdqHOGFpQLM_MAi-LcAaR6ZR2_rhdtZzv1TJc2L4RQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 1, 2026, Eric Dumazet wrote:
> Okay, but the changelog is far far too long.

Thanks, and sorry about the length. I'll use your changelog, add the
Suggested-by tag, and move the testing notes below the "---".

The netdev CI also flagged the selftest in patch 2 (shellcheck, and lines
over 80 columns). I'll fix those in v2 and shorten the patch 2 and cover
letter text the same way, and wait 24 hours for more comments first.

pw-bot: cr
