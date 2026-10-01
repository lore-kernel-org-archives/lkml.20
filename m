Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AA54D0CE4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848402; cv=none; b=axn7uw0pEMMmEpkzPcrDx/SCwdZLvzzqfnas824yieU8z/ijLYIjHF/BCVJZF9qYpqpOJfGijQ/WmJjcH4WEfPxRc4o9gRsNsX3lD6wq/nWqYe32sJ6nx2Ru2EywAD6ZPMdLqE5Rv1zA4Yn6TfIspj6KE65AaYNIgfBCSDPuKjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848402; c=relaxed/simple;
	bh=+WLvS2bPVxxTaSPdd4uobOzINSNDbtxNDh9qJn2EUjc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ui/A9wxkwwuydJ7vSKrQWgvXqdLxzuk7PSINvtclJDl2dA6ffy4J0mRmgxIsxSKpDx1zY8raB2rVtjGF0tGw/ItwYgWJHjNDnjYEjOERGv5KuGLZjZyaQtDUhf/Tnkyz8KJR3bwcdPXrrexYIs55VuIhXqYN7Nx0JV56QAnEf/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HTAB18qk; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HTAB18qk"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso3266419f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790848399; x=1791453199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QJ0zqYRdaf6SZM0JGYgcXH7jaR1ePmTYCcjY9AU/WA=;
        b=HTAB18qkRcBdR/GH1mUdj0K2S3B3o7qfm8lPJJgcMOlEHG2qiNhKkyALlwGKE+eZT1
         fSaottdDNIKXCax1WvAtIocfvyZVbSYuL0ZYiRwCq1BAUjJGUcfel+dVc4Rwa1L+Hcla
         wL8jBqMX7lqmc5LBAcEibPRTR7APVGKnMOwt+p147AYTZ6n5IqKCLCNtCMVTasN8vhvz
         nfJkPdSTb1NQytPztiMDmMTupihg1Lp1zhHtzFoPkGy89AyuEjMaOAgxzWAnXg2rwe4T
         ZdcM3RSEiIlyqPgrym7bYrwdKu3hWnuVKHsAm5GQxUGBA7uAsBUTFEmfW2ew15IAGIup
         tWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848399; x=1791453199;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QJ0zqYRdaf6SZM0JGYgcXH7jaR1ePmTYCcjY9AU/WA=;
        b=iGYUcv08KeDVmHgU9CKVP206fL5u3o9XIG/yW0ra+xc2aSFvijs5kpaJRWdJt7i2lk
         o+1HXHLNXraxYicA873mRwkmtM0Anj8PWwqnDau3SdwOE13xnvE/gt3tjNknwklOHrb2
         CJCpP0RPV4JMwAmW4cwFiVVCkz//zFZtakYmsue0T0yNX1vNgqtS4lmgd40SY5I2ljTH
         LLxCa8Y9sICjtvFagvZWmS+/CXmngi0ZiMsFnO3/eFvsCTHjZBSlg5BmoXEasjZLIDYI
         vLiloXMHBhqZKlfue5hYhhDtXdPsm5/c9ziX7glxBTtOsp2AhL8BcxDHqcLJn/5x13Do
         fTmw==
X-Forwarded-Encrypted: i=1; AKwUvBwUBiqMGUaatLbPFxGYRLMVBob58TkIAup6RzqbnkiZnwU2l992DLtIs/1q+NhHhbSGhrPjRymi7jmkMV4=@vger.kernel.org
X-Gm-Message-State: AFuF++npxZcC5QCWDHd0kfiubYy2PHek9NfG+VHazA972zzcF+ST9Y44
	mZGe6Y+s+41WOa3Lsvkrhf4bx4XDqMvQFhmMcTgOH9bjnGHEXw6EI9WeXy2Myf821II=
X-Gm-Gg: AYBFou0hTbos2nuAxQAZ/sz2Ks6Q4EdwTmJlAqNyQAaRXgaqK6/JDrsRY/odAvtGF78
	apF7MMddcpR6371NG17vxgIYaTJbnF47QYjS4uzlFtk3jmC8HDxl1wSWCXid2bJSHtBXlF8L7Qm
	gYX8sRJx/I/l5k/lAAcigmJi1uaarzJj/6TaLuMX394Y3PAQAxI1WeU48MR7ux4e7g064SX7tn+
	f+xfwHOPJp4B6TGY+e8xA4eMOyjGdMpWvRDMCpUbkfxi5pt4e9sreTKnVjTtI2O8mO3WbCr3+8b
	jx5jo7kgm7/849lPeEStRV6PJ/XS7nm3e/1NNA66jOSxvyQT93WNBPYAnpW+6l4FOUyhIlJD0D6
	C87qMCK1iczihrDnrEfGLqBcq2hXcp5+l9yu9I+2UqpPKW+M41fFTlQB1rFdiF1x+28GTIQ9gID
	yLKiszZXMG6Ow/E90rvv2GyMLSCIcuXOQTHcYaMEsREimFhWif4Htk/lRU3UoMLS2i80LIPsPyN
	h0Gqt15hzLMWTifq3+9scPhf+F0
X-Received: by 2002:a05:600c:3b23:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a01b119661mr72177145e9.19.1790848399085;
        Thu, 01 Oct 2026 02:53:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9248ccsm41237625e9.3.2026.10.01.02.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:53:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
Subject: Re: (subset) [PATCH v6 00/12] clk: nuvoton: ma35d1: Fix mux
 parenting and peripheral clock rates
Message-Id: <179084839794.49633.10441853107934842069.b4-ty@b4>
Date: Thu, 01 Oct 2026 11:53:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

Applied to clk/linux.git (clk-pile), thanks!

[01/12] clk: nuvoton: ma35d1: Keep the clock count in the driver
        commit: 6c8177988fcc07bcdf2991102638b7db80e92bb7
[02/12] dt-bindings: clock: ma35d1: Document the missing crystal inputs
        commit: 2d9a942a7562e3cde3c9de0335147c5faa8d1eaa
[03/12] dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define
        commit: c8a24538bd57ae545e7b8f9c8eb1c2f19a65a085
[04/12] dt-bindings: clock: ma35d1: Add missing WDT/WWDT parent clocks
        commit: a05842820a01081012c3df0db3fabe07e36b163e
[05/12] clk: nuvoton: ma35d1: Add missing WDT/WWDT parent clocks
        commit: e9b3fde31626b9c5725856417308598ce1cc8541

Best regards,
--
Jerome

