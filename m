Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A18384CEE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789527957; cv=none; b=Y0WAS1HWa8rpKDgxRyjccWdeg+eOvVbBp4MPk622hmEZnpUbHD5Ak8HGfHlYFMTJsn/3sTaEHGV4ndMX0LOkkCLlMBHZvGAyfxXFwIVk5kpll4Nk7XeoAUutntsBgo1EjcvpqNi4bDKi15bndViGPNtkRUzT9HWXlhckhmb9Zxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789527957; c=relaxed/simple;
	bh=kRKbBg0C00LiJiDKCOnV/1e65cxSnK2qqQwxLUqAQLE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z5ILsmLLXzBoSIhzUsaYOAZ9QKph5zL91/6XoclEoIVU/ishqBhG4Hu47WzReDYbTgRmB5/rjj3O75bDimNdnrvLvMxgroudyTlusxkTx990edlP7OKjjMz7EnlV+0FJZtCjshBUU40ELo02FRGjHDNGBroaIuHAdT4grMk58nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HokhomKb; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HokhomKb"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d93ff61046so4099155ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789527955; x=1790132755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRKbBg0C00LiJiDKCOnV/1e65cxSnK2qqQwxLUqAQLE=;
        b=HokhomKbjGvjRHDzcLBLqJRaNrH5elgWvTJsdBsWvuaMCPXsyvimcnYXJBLyIkYbFJ
         Dfs7J/zhr9PRnmm+gmdIVaPD1PnQ4aLbN2Ab358MRxW0nWg1gmBucSwE1aaXb25HicFA
         HAyVYwWSz0d6lNipWnbWh8QLYek8cOSM0Ud6c8zAsfLWO3k4XdFZA7QLvM3g4I20Wmjl
         rWaFJquPeXK6vXkqcdDp4hfU+dh9pjgsttoDfkz10v5vZQV1duAVMJHuw/ToR3d0I0o3
         Bn+2+ocpuGLx9YVVKVmkV7OMJXgBfCP3RuAyPaK6fsovf1pDlExoya0fC6lzpfhfSQ/g
         7a+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789527955; x=1790132755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRKbBg0C00LiJiDKCOnV/1e65cxSnK2qqQwxLUqAQLE=;
        b=m6o/CTHfR7ozRlxPdC998C4OULVzIwzXxdZeQc76EKAHtaNhAdB2KwFCPxNYNGb+fR
         3EahdmsRRqBmiHjfT6i1VTIc38+lXEJ/7+5z2noP1xH6UFPS1pKJ5AQRvw7xey3Yg6gr
         oBkr2HaBfj/lolRuG4zFzELfIvG6pKbs5he1SOHh7dxrqeK4ar7S8mAdY5dCVcrH2Mqg
         zsSSpcRngK4bxkjLH05eqyyrflcj9AozDD46mw5han+1KtHDOUk9lCgXSTUMU+DAyuIo
         ubuYUVdvHudP/CdsBV9GfJHaPD4PWZnP167Fr3h6PSGDmPGVlFTgdEImydZlsWo45hoF
         6TIA==
X-Forwarded-Encrypted: i=1; AKwUvBxRiPsFoDQW2PYEDjB0pE6n9h/Q18K6Uv5E4deyaoJBG37jBQipfeH2/GzA+Ve/Fikqk/yczes11SQnN5c=@vger.kernel.org
X-Gm-Message-State: AFuF++liwi6NUxzQnnC2DTvEUlekaBFFnHWoPWgjSrW0kAbUnpOzpw90
	gFDBev933Hll8mq+V0gZqoCOQdz/24H6Mpa+de8BSUtYJ/ws7XsNH8pA
X-Gm-Gg: AYBFou3LRaD8b2HVPX1PS3HIha/3FmkxxmNHLFBAHdv+sGxFsHq3hcAMpMy+QTk2g3R
	Mw/9pqdiMDFpw8dr2hJVzTL38sYXtyX1922nL6WV2oBUw8dn+K3qye1VefRXBy0eYqrkZz/5z+g
	ETxgDMJ4L2VIIwR8lLAkiZPg9jnaJTlnqdCIXBWq93VHuCeHbaPsAd+BKtoyf6ImOuonSgrI615
	mhXpVlaXiBQbmzHNWPEnitkcaH0IOR86ZAWY6oqqALT4As+gh0ucVcDZEB218DKDwmdTZbsopzH
	YDzsCdEpVpmPFspk/cZ2WnIxw8iKAcXHchiGy69LahLHi4Z0K6U9iTlW3xz2djziwwJMYb/UrQa
	fudS1c3br6ZGOK6jS4R+1OZkMIPBA13TP2W1AJrKeKsE69JLkFeCv9BjsNQxsZ2j7oebkWbSQW/
	eOg8XCwpnDrzeccC7Y7RLMz95SuPIhvS4Mmii5Xn7yKO70/9RB6+kmeLJdrrJ8Z7SQt8bxj6Ojf
	pxSN15511qKXSlTR6TkQVsLgdvkrQ6u4EDeb/6LD5NNni8gk2HIR6A41UQePyKQFF9QsJN0fSiy
X-Received: by 2002:a17:90b:3a43:b0:39d:f5b1:e365 with SMTP id 98e67ed59e1d1-39e1e559b78mr2375705a91.25.1789527954984;
        Tue, 15 Sep 2026 20:05:54 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:13da:4baf:148d:4ebb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d5d0f3sm2649001c88.12.2026.09.15.20.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:05:54 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: kuba@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	tahiliani@nitk.edu.in,
	vishy0777@gmail.com
Subject: Re: [PATCH net-next v5 2/3] selftests: tc-testing: add fq_pie per-flow class stats test
Date: Wed, 16 Sep 2026 08:35:46 +0530
Message-Id: <20260916030546.6393-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904231757.4082435-1-kuba@kernel.org>
References: <20260904231757.4082435-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi @Jakub,

Thank you for the review. Replies are inline below.

> This isn't a bug, the flip is correct: patch 1 of this series does add
> the cap in fq_pie_change() [...] The only remark is about the commit
> message wording [...] Once these land, "patch 1/3" no longer
> identifies anything in git history. Could the commit message name the
> change or the behaviour instead, so a backporter can pair this test
> flip with the kernel change?

This whole case will be gone in v6. We are dropping the flows-65536 cap
in patch 1, so there will be no behavior change left for this test to
flip. Case 83be will stay exactly as it is today.

> Can any of this ping traffic actually reach the fq_pie child? [...]
> 'ping -s 500' produces roughly 542-byte frames, so all 50 packets look
> like they are dropped in TBF and fq_pie never sees a packet [...]
> Would dropping '-s 500' (or raising the TBF burst above the frame
> size) be the intent here?

Confirmed, all of them were being dropped. We will fix this in v6 by
dropping -s 500, which defaults to the standard 56-byte payload used by
the other tc-testing cases with this TBF setup, and by adding -W 0.01 so
the test does not stall for about 10 seconds per run.

> Which iproute2 version prints these tokens? [...] tc routes the blob
> to q_fq_pie's existing print_xstats, which only knows the legacy
> qdisc counters [...] and has no notion of the new type discriminator.
> With any released tc the regex matches 0 times [...] and tdc has no
> iproute2 version gating, so the case fails permanently rather than
> being skipped. [...] Should it also state the required iproute2
> change, since the case cannot pass on a patched kernel with a shipped
> tc either?

You are right, no released tc prints those fields yet. We will fix this
in v6 by relaxing the match to just the class line ("class fq_pie
2:[0-9]+"), which generic tc code prints directly from the kernel's
class dump regardless of tc version. The commit message will also note
that the per-flow fields need the companion iproute2 update.

Thanks,
Hemendra

