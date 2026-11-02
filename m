Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657326;
	b=TGBUOILWdk0RgfM4QDxsNTwqWUYzske7vfUaOWMhdL/qklYcR9T67X7Zi+sSfpG0Znsk
	 BJeHAUH9RbAs6EV2q7zptHntojfA/EgA9BdGTwr5LDlOl5PJyg7INEy6n1/iOiylHoNmE
	 yasui1YTW0K/CVjiWsjD2z6ZghxwoZzVfTpDvNt/WY+DcuDr/2c6/1MdOg+kgW2J4wL1i
	 6pBDkxn39kB983u+xsEMgioTm36+7av+oXDEWnMfOHoHE/MoIUg/xCQvLtn7Np6GH5Sxt
	 x0CFWYyCZB5rAzAt+HTxBrZe55y0Ws7g85g3X7xD/Fnk6ntlZ7GMLpshfM3pD5o1z4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=kQGcUVFR6ZICl2K1H8hjvGbuC04HgUjTsRDMDBEzoUw=;
	b=OvpLvABD+AfHkegghgFlA5CqI3fCGUhsMQPar5o7ZC7Be1iP1Lk1x4k1q0ZnHZJUBIyh
	 U8o+Dp3ZVVT8og1/cHe+YDypukmLVv/GaT2UmQ/2EbmPPElN9kaJezGS3tcsb2rC30zgE
	 xCN/IZSQuht4n+2M6scfzPEhK/ulWTbKZ9Eocx6bMQPoCg6QLuVuNTChLGCGXMGS8WW1D
	 ujyd/6aq7ibslOhbWoj9qoNudHmU16SwkFzERn+kDjM1tut4PwFzLwGrYgxCsSkD0jDy7
	 0YIyjc0zs9GTIvs0VyRUyqZs5fz+TH20u315vK9JLRU2e985TZO4bsP+zVGcEqVXh1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vlmPd/Rk";
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DF6606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30DF6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlmPd/Rk
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5fb79ce82so23172695ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657325; x=1794262125; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kQGcUVFR6ZICl2K1H8hjvGbuC04HgUjTsRDMDBEzoUw=;
        b=vlmPd/RkycBiY4ukdmMVnlWoeM0oSXArS/RRregiuEzgOAjEethQMPZeA9tAt5elt6
         /cYb/duStX70uSKpDQNglifYisToIuqcdEZnufgRMvKelbPRxsr0rDDCHzaUFaIMMVkA
         BNoJCA/7W90F9+JS0Uh6sO4ORN0MHR0rzJ+2JqdG1g9Y+1fPvXozv1q0M95WGpn9MCNv
         Nq33XGZ9DS0EKoJoJy7goD2zonm5MUFekMx6YAI8VzC7Rn8YO0GHbczvJMkiNKINlpP5
         VW0KAT1pib8wscZnyOcJMlVpAb53CVzazt+nY2aBgLv90hEMgYCZfmfu4CEqfcGJZbRc
         4swA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657325; x=1794262125;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kQGcUVFR6ZICl2K1H8hjvGbuC04HgUjTsRDMDBEzoUw=;
        b=dFSMlV/lcUDyL3S4Df3JgYCoUAkccG5IoUdvmp/nlmKekKKbPkdjOQD29iWhuPNwLl
         rViuVN0La2BQ4gVEl5b3zHAu0zj7R3LZkGG5JogNsD8rVBea68H4EBXd/Kzm8cI2AoNF
         yPU/X7BrKcPQWuqX/PS3dBo1B733ghIu3yJGO4YK7mCyx5KXMg//dIWpkKefELicnSEm
         2eKCMsPG/89Zf11siafRR6GT5FGmi1FLCTc990UPNS0yVI/MqCNhmFJc5wimouArEBqb
         JN7hCGT4McClnEAfyUWGm8l87TIn33aDx8wHdW0szY3iYsIw3vZu7CFIyOtK3QBn/YZP
         K11Q==
X-Forwarded-Encrypted: i=1; AKwUvBz+gNVko0RFUyksTkPez5jCrYxrYuXWc+q0kyuEoMxrqfcgkW2Fyjit/1cJiWwFGQH3Wy1MMykpNi96xdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oLvAgPc2VKW80BHDv+nNDLRNSSoTNWDy2NY29skKTZVuU7jI8
	vvFh3f1gma+pVPuE/27Kkz+abvwgzbkHEd/YWvOHqOkIH1E0rdPrcTw1
X-Gm-Gg: AYBFou1eKQUKs8/Iqd1WDoABH6O91T662lssw9psTBglE6W6a6STk5Q/pDle2S4Y1mi
	VVlXQGUJUygWnTohe+ocq78YiHlxo4ylOzxmsuud30oUrHftm5xHnqiqwO100+hT4+8AZYWNmOi
	4EzPlWy7XuDS/8oZD4FUz2lbjY6VZMAKCnC4Ay87j67jbanXUwnhgEiTrYMDkpEU3/X8QWQPIA2
	cRIDwLEQbbIIPcjJxIUzy3NqzQK/DTIOVWdINyZBLO01gv2OiAi5DCsbG9WJs73RfEcqZ4Dznwj
	yJsiRwHPKrREdvkg4/QCMFvcvdWma+qIYPu7Y/HpHF5P7fnG8sMMg4HpKhkZPS8+0obOMIcHC4J
	huBV/Ymsnm2XjHbJ8wY4Hdrgmt+vLcGX5ZlGLWm2VWyUlmx4UgG6Wa9f9ndL6QAuX47kfuIyzTF
	eVCMU/dCPua9/A2kdLwIzTX/o7CTkGieFWAecq1ktqbknUUcef3wL5KQbFj3/lDUsDYUWOpojys
	3Sp4ErKiEUPvIhWYT1+LuoxZfLLBQ4KmT5dYD6eqn7m2coHMIgO4RZnLyh9aobrKvVsEAmZ5YLK
	h+combiFSX8UTJ7VaaYWykPEGQgbebvxr8/IrOp/9dTuoPDxDSpE5OC7LBNsXSsyj1ahEsx3e7S
	gF7kLyTm0KT4RgRL6BfSEbcyovxOMCsPjww==
X-Received: by 2002:a17:90b:1d47:b0:3a0:c85a:ee02 with SMTP id 98e67ed59e1d1-3ae896f87c2mr10000259a91.17.1793657325415;
        Mon, 02 Nov 2026 14:08:45 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c666cdcsm986281a91.11.2026.11.02.14.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:08:45 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 22:08:44 +0000
Message-Id: <DML2GFI6LWXU.3ODKDXNQDBYYA@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH] bpf: netns: require CAP_NET_ADMIN for link targets
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?q?J=C3=A9r=C3=A9my_Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>
In-Reply-To: <20261102202922.2515317-2-Jeremy.Jean@oss.cyber.gouv.fr>
References: <20261102202922.2515317-2-Jeremy.Jean@oss.cyber.gouv.fr>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 12:29 PM Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr> wrote:
> BPF tokens allow a process to load BPF programs using CAP_NET_ADMIN in
> a userns, however, netns_bpf_link_create() does not check for
> CAP_NET_ADMIN in the target netns. Consequently, a token can be used
> to attach a BPF program to a netns it does not control.

That's not a gap. The prog FD and the netns FD are the permission.

pw-bot: cr
