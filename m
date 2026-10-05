Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A482931FB
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 04:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791175102; cv=none; b=d1FCrfFCYiuM40W2iOZmUeXnD4Vq4aI8k7EkpT5rf3ZPMhA+Af8+7l9kfx6e/Dsng6aiFoUkolpDyPpKNLy8B55e2qOu17/a9wsBzat55iGZPsGw5Rb84N63lpxJNofAbwIdT/Kj2T1DGCJQR1UZZvV04INF1a2Ag+BmSy/CxZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791175102; c=relaxed/simple;
	bh=Pk1V3yBnj2gKrN3bv2Nfw53cNs1zJpDrB5f3qShOohY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPQ0EJuW0B4XVPudlz1BSuHLwSj72a58UNcKf6bkcr0HgJdkhDYhVNuEYmEh7GvVQr9UPlO5L5K0F5PJV8ZWHWVP9VOTL2SjAJA9PIK5xaBvvA669Ra4YDSIWhJYS+Vy6yoXVrc156Cc4tbvl8KnNzg24gpCkOodYOhTEuCsKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fdk/TLZH; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fdk/TLZH"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34d2d25127aso526356eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 21:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791175100; x=1791779900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pk1V3yBnj2gKrN3bv2Nfw53cNs1zJpDrB5f3qShOohY=;
        b=Fdk/TLZHhgf3TTKcFnziKeT123qf++x+z3sAPbLTBe8OUcM6iBXNTIHkIy9VxgIL0m
         sIxfjZBGOjbl2vLKeYeC+brPAUmSMxJli0L8ItNfDJmHklnF2c0Fx+7SdStUSgD044w0
         +4+dVxpyxWyXuEs+2TTqdLXHYo3WaSrBZnCXsjXnQTw7bKOhmoQk3/eQafOjXi3rL34k
         FbNRKXwkCWimlRvFgSn4+T6Eq+bvye3B5FDUd7LY0z7QUE8l+mCbr89HiK44o4TrCowm
         Uo00lxPdKHC3/m8F7bKCSVxtmyO/B0GWBvHbTWrUF97omC+cfiLx44WqSjyai06wIfEe
         9XSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791175100; x=1791779900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pk1V3yBnj2gKrN3bv2Nfw53cNs1zJpDrB5f3qShOohY=;
        b=RmKWmcQc4BCWIt0CXqFrort4PityysbQXrO7NJEEeZGw/FaMj+IAhDy/luopJs3o91
         y4f7uHlqxVwnmq2Qo1ge0pE8uBDsMjoR4XnB4gjms0ZqZRIoMttkoSguHHTPhYoriYIX
         8KNfoWVbyspTcJAnPlqyfNcSFniO7d7SxLUiL0UtwMEg487ymCzr6ztIw57XYYb93zgg
         NiiyQHUcpTPwbOtVnhKCcsRge4IvZFUmTMGY0WaNQu2xRtR0XlzFATcLlAv7NOZaznSE
         1DnNCH+3ymjM/BuWaHd6P9KnIrarA6F2DVTAMoKu1zjan1eKwdaVw1DhKbHw51vjdBqb
         l09A==
X-Forwarded-Encrypted: i=1; AKwUvByq8TsIAsi3puRLVv7ue9Z/LLCDl24G5S2OD9REwdOA0kVXuPtOT3zKElAYrAb6PBn0xPIb87DOBaoeifQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mfKLd/Nx/Pw2qFdK2YBzl5AxJrHYQt+uj2d2iDtTO3HcQnsRtV
	v1itVgpahTvbCq3kvpyy7wrIkYl2nayShtbMv6DnNsxly27Q0dEmGKkj
X-Gm-Gg: AYBFou0X8kHMxFLtBiUiO7Ajc3spWHG2NqeCziycmsglUfJ2X1D5Sh9SIus62h4JeqH
	IUQyj1MtnqBAGUwo9xvRmAbfiUHPOU+BPXvwtJWVmYkKSG/IWjXXOXIxLiO2QmG6m5GUmWdP7OG
	1VP35Yfb5X19wmWL4+maaQSlZk7SjH1x68AYqSPC6TiOk3pRa2W+t4i5bZKEnfCDQzETiSHDRWu
	1vaVSpoESLWTyH12AJvcj4t0ScDfPVOif2DSLpa6BsQ8atLj5m+QZIcD71d10QvXxlal8S/iz6/
	W4bzwiGAemm7XkVprKTEpmEMlf3Zx51ErYiaDH6ila1JZIuUR4Qpr36Sy5cQoqhaTMVBcyHZZbS
	Femg9WB8XJ5iaTO728zjfopEBwNPKO8NSbYMqNPK4NEGqGOniCupSjI3GUMJQG479MBmx4ym1xV
	8k8etoK5Bod66ydRdCZV/vpxp1PTRS7fsNsP1AdjeSvfvq7Hu/GX453AiGwMID6mB6vtw0vmNIF
	SB4Fnc=
X-Received: by 2002:a05:7300:8284:b0:328:3cce:4b3b with SMTP id 5a478bee46e88-34f14f18c81mr10979887eec.4.1791175099687;
        Sun, 04 Oct 2026 21:38:19 -0700 (PDT)
Received: from vscode-11-19.w453y.xyz ([59.164.88.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35126f01924sm9649984eec.0.2026.10.04.21.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:38:19 -0700 (PDT)
From: Abdul Wasey <w453y.me@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	razor@blackwall.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	horatiu.vultur@microchip.com,
	bridge@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: bridge: cfm: notify userspace on CFM config changes
Date: Mon,  5 Oct 2026 04:38:12 +0000
Message-ID: <20261005043812.3106517-1-w453y.me@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179117378916.434549.16185635728868721491@kernel.org>
References: <179117378916.434549.16185635728868721491@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 05 Oct 2026 04:16:29 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: High]
> Is the skb that br_info_notify() allocates large enough for a message
> with only RTEXT_FILTER_CFM_CONFIG set?

Right, this is a real bug. br_get_link_af_size_filtered() never counts
the config attributes, so the notification only fit for small configs.
I reproduced it: with one MEP and about 32 peer MEPs every config change
hits the WARN_ON in br_info_notify() and the notification is lost.

v2 adds a patch before this one that counts the config attributes when
RTEXT_FILTER_CFM_CONFIG is set.

> [Severity: Medium]
> What does userspace receive when this request deletes the last MEP?

Right, it gets an RTM_NEWLINK with no IFLA_BRIDGE_CFM at all, which
can't be told apart from other bridge notifications. v2 sends an empty
IFLA_BRIDGE_CFM nest for a bridge with no MEPs, so that case is visible.

pw-bot: cr
