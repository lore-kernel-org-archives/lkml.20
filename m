Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196C33AB5AC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199871; cv=none; b=jS7og8J/Oi5TuAK/4b1ftaOhjO2m9XBANZueDAvRL9jJP2mXkD4VFplfWmXVdP/2vzS2i3+o1uHQ7N2rBVDupjeQsrgijGVwSV1MGq/uAE33tiLqzfEkAr7QUonRV1yBZ2jAqsDh8y64XYNOJl0XYJ7X0S/5mFO7pVjXw5QElsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199871; c=relaxed/simple;
	bh=JSKfE3C5hEzTaLOsncNZxFU8cYHA1de8CIzwYuA0+Ik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oD38j2d8zhqd/m87PBokNqxHJERsfR8xF4vz0ktEUjZoCoBEm36L4vCY3OwvYNAU70h3IHxG848woNYtyrUwYt+qd8SqACKwCxI4B0f04fyVlYjYAtyeV3ZvtFIGd0tAYNNUQQPROkUH2K+02KzAIP9Efg0LHZQKBMF9L8BcQ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jfVSY+Vn; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jfVSY+Vn"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca80d708489so121109a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199869; x=1788804669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9iKASRZYGsmUrW8F/UJhakBf/TxAKXi0Gw9hlqUJM4=;
        b=jfVSY+Vn7NyUew9E8Wt0ktg0nHNSUCOTtdu+pChNuA/N7/u4S0e5bPCe3HQyUoGZ80
         kqTGjnS2d3iKkw3shuBS6fGi4b42/21uimnPDlHLUrFJqm/sstXQqQn/FUdSO4+qV2QE
         DO1CWZxtTQsxwsdZjkFBplW4wG5q4lmqMfevX5LtDbSciDbWLT6m8/UfOuI1mhA2zfdt
         8TvKQh1iFK3SukMGKj9Lm2zspfUO0v0TDhHqx5iwPaUS7DYDVI50FueJqqRStDPclZMF
         4DTNrOIfTu3y6FYYo1zrK2L8RpMrVjHy0jfvcrpSmUrgOsYX4AgVBGeecgJQNeLiukNI
         YDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199869; x=1788804669;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9iKASRZYGsmUrW8F/UJhakBf/TxAKXi0Gw9hlqUJM4=;
        b=a2iF3W7H3HLSFAzlzncX3DnUC4MZmuZXWmqwbECMFebvDynwqHpn+CyeT6fTm7GZPa
         bMYZNve7RnK0clseuHctbDNOKkv2lSxXg8P2E3Pt7ICL4M+kWTM646a5/n65CXHLaCgI
         YIjUUQ1gJ/dHsviz5RXIaTf7gmWpev30G7/X4Ea51TtXruRV7VCdzwmYiMS7LGaiej06
         TaPf8s6VLSlNQaYV7EeL8B4qtZ4ku6IKcN5EQqYcaAjYf+Nb6eDXqbn3ZRCl4OhOJtYa
         yW53ksKKzEqrdjSFu/BfmdJdDc1k0D+R/b26co7aqmE3btwwUDLxRPpXfgbh+wFJpOar
         aH1g==
X-Forwarded-Encrypted: i=1; AKwUvBy+yQjmNt7c+sFOcGSNCZrQZ8DSyfy4ol/E41jKGdX6aFK6OrteqcekkpCInHLA/YrJ5XQLDiTtjUXHYlA=@vger.kernel.org
X-Gm-Message-State: AFuF++kfE7rQAuZHHKE4JmWHQaz+cR6TpW5g8FDVVOg1BVQi59c4Aepa
	LHVhnDnz3+yE7Kg0FWfInIO/yd7SguexqdXKvqn+NQbGrMP4Y7tSttl0s5UehpF7gOZ6sm4eKCi
	+xloL
X-Gm-Gg: AYBFou1esHtnBq4LJQFBxnWvQaCw7CAw3Aa9nDup6Q+2CnImWJrLL55Yx4K2yUsuBPC
	vCsylwU3StK9v5szuGYyhpnpS3qeTIpjDVI2tnWSVrXdwZyCWuxOJsI3NYJjzbLCygT9K9OY2bB
	lZMhoJ+Om/rCMMEiDYfhXxzbyKDA2aPVJFl2z3FNQSDp6U8IUgqwPUQ4vexngM8MyFyTbSGIuYB
	0L4laB35yf4J1Q5esMY/MFjzIO9+EmJ+6j7FxBi0vX+mL8Qj+12ijqjuyOcS/SktNquffUR2wDy
	8eO+KesHxf2F52Q0fVRxWmonIT/FZiGeN9eY/A/jj3sYLmfvAfJudthZp0P0gmuip/RZ68/iu11
	Bq6t9oR4Bv0pFQSjcER0uc8Gz0JU1x5f/aP7iafeyp01oPBoOpAHF5xA3m0RinLY6QHtcHhiVrp
	X8rxn0oqlZVVtwJS39WbushM3QLsfXL1tHbNA2PVBh0qb3qi1jSt/MFilu+Q==
X-Received: by 2002:a17:90b:3808:b0:398:ba46:1d9f with SMTP id 98e67ed59e1d1-3990f88aabdmr64927a91.13.1788199868925;
        Mon, 31 Aug 2026 11:11:08 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990d76622csm765959a91.11.2026.08.31.11.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:08 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, tony@atomide.com, rogerq@kernel.org, andreas@kemnade.info, 
 aaro.koskinen@iki.fi, 
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Julian.FRIEDRICH@frequentis.com, upstream+omap@sigma-star.at
In-Reply-To: <20260716113947.92513-1-david.oberhollenzer@sigma-star.at>
References: <20260716113947.92513-1-david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH] ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider
 definition
Message-Id: <178819986814.2869653.16668434348928229188.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Thu, 16 Jul 2026 13:39:47 +0200, David Oberhollenzer wrote:
> Commit d0bdd8bb7f35 ("ARM: dts: ti/omap: dra7: fix redundant
> clock divider definition") removes the clock divider definition
> from optfclk_pciephy_div, reasoning that the table is redundant,
> as it contains the values 1 and 2, while also setting ti,max-div
> to 2 while ti,min-div is implicitly initialized to 1.
> 
> What that commit missed was the fact that the values in the table
> are in reverse order, i.e. first 2, then 1.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider definition
      commit: 2fabd2f406d0cf787be47b3bbeea99b30004033d

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

