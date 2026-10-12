Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9733C09F8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794564; cv=none; b=QWpQIyDhkctZYfCd4i7zqfmkZKqPBE8H9XnGEzyaNB9s3zMyT3FCa32qDhag3I4z2/YVmXAuMTroceVn1gp46GV3wGsOG99v2N99R0lcLzZZOHD2/WlCTpY0FEm4LjPK4oHGL9VZo8D4EjpteqQPLRuwUCPAsIUau+CnylGCp7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794564; c=relaxed/simple;
	bh=AaxiIHkgLD4ulKUYLI2V7jffRjIqGmFrLAV4aTnpvCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEQlqUk2pR51z/viALd96hvnusx07772ZfrAls7Q3GBC4vOSk+DpuwkRxIRh1hLQPi7CW7oH/+Rp6UjsL0AHSTadh0mIWm+C46uePkFK9ONYBae+pZvOSdRcBCjNWkZEgSn3SQ6+JRwgGMReeL4nK5JCCn7d4/buUfztS9to5BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=XxPrzklF; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="XxPrzklF"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso1086564a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791794561; x=1792399361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMj0ZDjWQZhfS34YQOf6RUS2CPztBt6uEwu8EUdNqqU=;
        b=XxPrzklFgCfxJ0icsOck0/YeI3vC5a/MjtrVKqB25Ylm2MaobbQFurVvlEtZI50Det
         2IbOcwlL+p8/FMdhmlHJpU6kiufdk9dkI/q93PhkOu2Cp3Y5I5dANkcwfmBek0ofRdty
         zjV69LDvJZWf/oPBqRfx2xmCBLSUmOYSSUKnnhtbVJy2r9EIySoXpmfopr7P70qNYA7J
         pk6LzZI05XLCvIOAB36v7reh0dfN6LewH6vDkYLF2QEqbIY+/Ns83xQaKak9zCjXXBe7
         2xIU4U1hnjC2j7IkRCO3yS/4AfXP3vMQ0kKKuDJE79lYJK3V+DZaeHdp4KTuqxBy+TOg
         tB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794561; x=1792399361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMj0ZDjWQZhfS34YQOf6RUS2CPztBt6uEwu8EUdNqqU=;
        b=g60RdKbM3o9f75OkKRHjcRIHDHw3fPd0jKFOvM+ihu5ZKQVeyqG+yhoLeBgWNtufvK
         AQJpGRMIiHtbt8mUKWv57WUayoHCbJy3IEQFVPREMLEWxGQ50mpwRsf+mOp5ss4FmiI2
         L/dlWqV4ZfmyLpruUu1VzkcJtpoqIEwIs8koY854R/Ra5HOmfnNTnXWuJvkHzL2RDoiu
         DgTlo9E9OOdVX4aMqm1jv1MhCiylp7LChRsm9lV5skbMepV3T4HcMukRCHppC4PaA+RW
         r48XJH4XwIIpFdJtUnJi0WSPu+AGiE4FU5zTpkL26o3TYR+6hhs2XosyrL3LGCQ4Knua
         wdjg==
X-Forwarded-Encrypted: i=1; AKwUvByIdIlrsn9Dn4zZXt81chDmnoO0bRpcCEjCEJnTuhTwd7bzjtNt9WZa6ym3QXkwIqroxvpNC4Uz3wfN0jE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzMGNlr3r9blNCLZHRRbFH/T+TAEv+QREU9XuWRTrRJEjkQAXg
	4HoedphEq8yj+65Z98aq3XwmSCmNMaL6eNO2LWjpzgWHZB4ZW0oahFqaqosfR+fb31w=
X-Gm-Gg: AYBFou04jcGVy0p8p2fmZrAFBf902ZLzSGa6tdXuU0udO76mWqmZ/RgZONsVwswqe8G
	ij7xJv6Llmm7q/xWSXiw1QhhK7qQDXigMuOAIEGx1gHek8WgEK3eZ1yWwaEf5BrSEIPliwZhBDe
	0wDyaerDxzEGfjp95l1J9Icf95H9pctCwdyyk0JBADIxSZC/5wMut1Bwz3iXG8XRP6Mnu7raks2
	bgOsCMo1O0zHznGof683mc3x0BWr0JrK4Es1WnGqi64cf/icHCyYWpo7qQqbjafJ9sAJ5k8wRDV
	DNXhuBL2mldWLkz3GP/ow3YqUyOReli7J/1mdmV/YuBylXAIA4Gav1E5A0iVqjbciDV6GgEjryv
	fPBnya1eIlkMpazWmNNaVAJgVx/HQQXVrClmR1aDegzTROp5pimNRcHtac6pDUHe4XLcxeVn3xv
	tmqkTPDk8sXuZOTgW7hbIpY9LfaCOHgDcEZS6iJ7FoK2oQLRmsok6eZqd74zKzfiUFaihXUVYhm
	wUE3w==
X-Received: by 2002:a17:90b:5886:b0:3ab:be66:ddc8 with SMTP id 98e67ed59e1d1-3abbe66dfdfmr3137834a91.14.1791794561283;
        Mon, 12 Oct 2026 01:42:41 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ca0033sm15363658a91.2.2026.10.12.01.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:42:40 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: Re: [PATCH net v3 1/5] eth: fbnic: only act on Rx completions naming a posted buffer
Date: Mon, 12 Oct 2026 17:42:21 +0900
Message-ID: <20261012084221.2285031-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <40b3432d-b597-423f-9279-ab4aa1157f44@gmail.com>
References: <cover.1791775409.git.yhlee@isslab.korea.ac.kr> <25ce85c9821fba5d94932b36b9c9afb9a2fbd12a.1791775409.git.yhlee@isslab.korea.ac.kr> <40b3432d-b597-423f-9279-ab4aa1157f44@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for looking at these, and for the detailed reasoning.

You're right that the buffer IDs, offsets and lengths are values the
driver itself programs and the device echoes back, and that a healthy
device honours the headroom and placement the driver configures.  The
series treated the device as untrusted, which is not the model fbnic
uses; a completion that disagrees with what software posted points at a
software/hardware state bug these checks would hide rather than fix.
I'll drop patches 1-3.

For patch 4 I missed that Daniel already fixed the same reference leak in
1c85ea5df86b ("eth: fbnic: put back netmem reference when
xdp_buff_add_frag() fails"); please drop it as well.

Sorry for the noise.
