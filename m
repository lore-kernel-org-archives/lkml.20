Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722393;
	b=pE1szuVfLJJ+p+a0d5AiVRwiLdsiE1JbEMQpFYmqfOerazwEAVRU+oo9pmIZ/B3U+mbF
	 maSzxV1xNe+fOzvS+9eqM2Cpghnna55fPGQfGwJCVpnh9IxrHjIh6V0n8Aa9nilmazhlj
	 CZfySOXup4TM3GgAZb5XhO80f1t2BEeOIo39c1ntHUMTikg1zBYmiiN9FMtGT6WFXdqTk
	 ncpW6a2TLC8sbmGxAz+iYE3afEDHuyfNw6aI6Vzpjx4PgJXCw/023UbyN6bWD1ZvzbydS
	 VjgTC2G+PIR7xsxlbO2RIVD0YhlQr3j8hwQIJWdmis4T4o9XilJGFfVCycbDpTsATuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sXDOGbebjk6S3dDV88xPL87kUcW9/Te6jZxMcOYYfdM=;
	b=1iG7tykQYTGjv/mU133W2tNg9ezUL7I4An1L3T2H4/KnTG/UqJEOP6R8/QwXOahS1ihv
	 QxDfTMnh3u5/9JjsZt67TVLE0IXP/K1qh+NtRwAyjuIGSN4c7G2aNCC5XIgXbMAk+Gxxl
	 lddNvKOdrIK6COdMoqzFydl73SN3tf2HBQEZUbujfipSk4zL6or50TooFsqZWTWK0L8+x
	 ehfcBckE+CvxTqpiAcp/CQnWxfcYS4kvJmdB/rYGiXWbYgY6DX2IBbgqQW4LEyMG1fLcn
	 W225ziiL4PZTdBu3ebwnbrHKgxRjU4zCZIfNRpVRl56nk/Djb/SrZROEtw94cSrDm2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NgBNskAq;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E02608361F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E02608361F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NgBNskAq
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2af4c8d00so6465135c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793722393; x=1794327193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXDOGbebjk6S3dDV88xPL87kUcW9/Te6jZxMcOYYfdM=;
        b=NgBNskAq/L9xASzeF88VEjMvv3QASUCE+1S+IssEXtw40//SrfyfePtkryhvBb4htB
         GViq1TG8PGuI1ClnXAiYvCTui4Zbc/Z5FjDalHhaualZq4Z+wb2sFbXuUc6CJiTs/xNf
         k/q9PrmKXQtMNqs57Zy2QiYH+IJkBGWHhgw0ubI6p1Ldr4kcTS1BEkfnHJGK+un9kS8y
         dxRbHT5jutLsVKvx+BZ2vOI4VwdDessC7D4fGsSZGZV7iQSB1wE/xOcqDX2DEyILGeVU
         z5Eu2G2BcsJ/M6Xwj/lj6UIbQvrv/6L2EJdDFmgo02u99tm/LcaMvpLd/2Z0d0pg1ESL
         ZISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722393; x=1794327193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXDOGbebjk6S3dDV88xPL87kUcW9/Te6jZxMcOYYfdM=;
        b=hxSMD0GggHLYxZVBNGXfyOCHPWpXJCwU1pRk65PD00nxrah1W8El8tkBMf5NpdAAkf
         lgWgB2dOPKOXWPZ4quxQTqZNcUzODBVLKlxMOeqi1m8hGcYAV0BJ+sd9fK7m3ENt32oO
         WYLNA4K04gfng1wQvWcoOUfbkoYCi8Jk8+Iw5MjUOHIUA67w4J4UaiEqkSdCTxr5XF/J
         gd0fKRClrtFwqLSAdifIm0Ib9atnZZNwc1W+1FK7ngwPfp8hHGdtW34lq79FJGCnHdBe
         t2N/DOZC5skftwSq2gMAr8TXLll6BlR2QIichD3DOgz9m6uXJq8bxzJ0/PcpFocPFkDv
         SgfA==
X-Forwarded-Encrypted: i=1; AKwUvBxVSlKqzypCWMvW0dOxDTL2X+seR6UjsRoS4LMisUahsFTfJhajCbpOKEegV31gGZN/r1j+arcHJm96dF0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pZZrNgHMWSlKFu4n89VDGN2FUV4NuiOy7IFZ5u1eYprfTlTsk
	UJFOax4cVdkX+3gACSIxT0WH/QSozzkoWpqcoR1NABySeY31RSM6Pd8f
X-Gm-Gg: AYBFou1v3HwcspJpK6hOHQo+nMnd4N+8jHB2GhYOwMrFh/VPZsGlnUyQD2Scm8DVw49
	G1YhV2fQW1Qyep52icpiAnLKlOI7dyKneKRl6Cy1Tg1auFzld0etPHk9e1lQsTpHQQADAJu6EY3
	Da4UgiEKmp9xfFktmGN16CKvuUl/xdriWPnhIuBRkOZzi0rU65S1njTEvsTP258TN0A5IF4N7Xg
	bnKxOex/ugGVBIzBska63tF+HCOcB9KPd/jAwDjxZwEwC1WEcK+avQ0FVDtTpdY1WHeUbpYkWVq
	6zZN0pBhoEjZsPtpS9qtfTB7+UIOsg09RkGTQxNbbfmhPj70Y8vOFA7z0yvyvdPFkdLEwfKb7Mm
	VT3WDJHa+QELzisBT57/kRzTlBUXv1uCYglUMtVjs2KaaNc+X5oddF/R+mEVeqPdB1n9VyDYRoQ
	l+mGPxOktT2f7VK8PLay2Tvz/uKmS6FzrmW29gPtzQlRapI7gTYSfyCZt6qE1RE9RIqJ427qkgR
	OT3u4DAdWqAREDhtWIUrmgQob5+AkSbBdnBhm/igY9Tt4ISyiB4EG5RC+hna3GT0WxVp25TNZAW
	hf405GhHAOY3P1U0hQkLFg5Y6MFpFA2f51RqStHP9aHEQJ+ahOBOCLhPh8heIilJIpolhY47mXl
	rYZBhRESAfheF/ReMA6lAk996uUdkc/9mXWJumzHfufiXp2x9hL8lL+Fgw8e5yVUVrSJETT+hXg
	==
X-Received: by 2002:a05:701b:42d2:20b0:1aa:6c3f:2f7b with SMTP id a92af1059eb24-1ac5b3fdef6mr21692446c88.24.1793722392314;
        Tue, 03 Nov 2026 08:13:12 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm58231978c88.6.2026.11.03.08.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:13:11 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: netdev-bot+sashiko@kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Florian Westphal <fw@strlen.de>,
	Mat Martineau <martineau@kernel.org>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: Re: [PATCH net v4 2/2] netlink: Check a group again if it was released while joining it
Date: Tue,  3 Nov 2026 16:13:04 +0000
Message-Id: <20261103161304.56981-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <179372164415.488856.15554879847164426558@kernel.org>
References: <179372164415.488856.15554879847164426558@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The deadlock is fixed by my separate patch:
https://lore.kernel.org/netdev/20261102120929.4077030-1-anilkaushikwireless@gmail.com/

Anil
