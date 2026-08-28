Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDE937A843
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787886012; cv=none; b=RpRt5utwhxQp7wVgokQ/f5yxGA9RVUDX/5I5uo06PTfrVZ866UGcEhZ301sGjJwGSJHG2gDLLmaf72wYIyS6Y1OjeUoDhrvUWoBPSoo/ATzA6KnvCjLzoqIXj3QHr9fNnQ6EjZrRT3U2XFh+0FnFTavTCofl9cS1iIQjU+9BlSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787886012; c=relaxed/simple;
	bh=kaIgm9xItqVDHCw3IV7XYryNu0fKs/pvEeq3wEYycFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/IEOAPIWDQD4PTkABErf01OZ49gEvEO4sfnf5DIyjltw31HHJU5c+fKTYBh5ashAuft/der4xcY9WpUoa59mnGlIE17fw6aPK3f8qSTBRblKheZ4yuc8RL4arfCsC0e/cQtkzgSzmeRyi3vkDrsXG7mQ7wVl7M/WQ8Ddb8PB0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2pvPgDP; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2pvPgDP"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38759bcd877so478654a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787886010; x=1788490810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaIgm9xItqVDHCw3IV7XYryNu0fKs/pvEeq3wEYycFs=;
        b=f2pvPgDPjAQ8KDj2m2/vroYny8rFIZBZBF4zz1dNspSNLL7BhV383OlKkr+Sl3CoyS
         1THO0CYIq2hkScVOnTUcFG/ULJQLYCkRZMyG+1WGhuTv9vi9+NSYtfpRgqxlPbtQqFTO
         RsmxDuj54KNUd+uyWnQjGZDcZV5D59JkDK432TDcBE7o07Uy8kebJTMl/PDkgti2xYt4
         JwGaV1jdvFnPzBLxhHkVdWAiSYkTbosz3sY78I8OsHC/yyLagETetMVw5a4xEVixNkDG
         LcqIkbVdcWAe/u3oaAEyBtopIc7854FFK6qkKaaqfhzg/bI4C+hvtiosZNKarFd9mGEo
         p9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787886010; x=1788490810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kaIgm9xItqVDHCw3IV7XYryNu0fKs/pvEeq3wEYycFs=;
        b=U+1X9/JU54tE0QG1bZIGpHG9lR2NFAl87AknIvrexgVv7JRplCw3rrZIZU5xbPZ/Iu
         kWR74AKpjUuLLSIQKr3ISy+08dBmj48ClC+O1VNCJxNq7lDsOdglKrNQSJ3sf9dyT2T5
         qQttoTffREMecWgobR5P4MQIxW6khE57uPX/3WHFk4sTRBPus6sXwtro+74Lmk12de2Z
         FeYs/UQPYuNP5m741OU+vLC4ciqflPOhfGoOfwHLWYH6QlY+Q+yyzEmHT1u+Vjw4zoS+
         zJGNFlFs8ULkrBvtVD5MqH9QmzaWdDV6hOd3kKN/AvTVK5zeLZftpG7qeYDoeWV8GVSZ
         VmiQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAvYJW6mW6CYAOMty3Prh73et80OJvzYOB5dXeC8mLwoElhi496pi56op4KPOwvlpE75X5chnTOH3heG4=@vger.kernel.org
X-Gm-Message-State: AFuF++n7Lo38MiZQCmB7wZ7qqsTdUU+rGRzytQy0J97Ji08490kWMiAO
	eg6zzJv6nfvQudJXxWNFLH1uHU41poZEMVomQKR6m7t8TkZr2/5Aooen
X-Gm-Gg: AR+sD13H1e0gojZq3NNF4lox05VthzSg5bQ4G4rs7m3YfGqz03e/U4CjwO9pIOVLfka
	POurwpVpac3LWaUgLCt+KG3lmRRQEDNiH3EguiFT/9vW0jMIqSRBOCBGbFQUD9L511r3MHZ1x1s
	4d+pygeWq1rauFHyG+o1inNOIVsLNIk+wBiW9xfkucBbeYwkg8En9dkE4/aoKrxwY8/rGRonq7q
	n4TT1q6ZjEtJTSUYYztPxZphhXZZ9AcKy8uF/Pkl+qJ5Lmg+iAvzC0C9w3ijg+FpRu2a2kxUVXl
	Izb/7nyKqCdeZeJWA1SVTLzpR/onB+p/KPk6D4fY0LWuFwnaEctpUIjlBquWebrTSG0Ac5gLwJQ
	WRsk0NxNLnfs9lQndYG/VKsvYWZBMtF0wDYdgSYG5H2qSUL0EVp5bJoBCPNWLcwA7+z0x/c3BgM
	/syMhVWxuAXLmffZCJLWIAtt3vkP27OTEmT54UBGO49ZJQsPE8rl8C+lP/RqFRyCQexA==
X-Received: by 2002:a17:90b:4b05:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-396d0fe2140mr7009774a91.10.1787886010175;
        Thu, 27 Aug 2026 20:00:10 -0700 (PDT)
Received: from DESKTOPHOME.lan ([240e:3a3:9304:9820:f4a6:931b:cf31:308])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd55a4sm5237878a91.7.2026.08.27.20.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:00:09 -0700 (PDT)
From: Ziyou Xu <xuziyougm@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net] net: phy: air_en8811h: restore LED GPIO output after MCU restart
Date: Fri, 28 Aug 2026 10:59:55 +0800
Message-ID: <20260828025955.412696-1-xuziyougm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827083319.391122ea@kernel.org>
References: <20260820141034.1400439-1-xuziyougm@gmail.com> <20260824185043.2701718-1-kuba@kernel.org> <CAF2gcSXK6H76A5Z6-k-D04VaCR4QXNiWLmbQmcCBpsW=L+Hwyw@mail.gmail.com> <20260827083319.391122ea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Will do.

Commit 03b4702fc5e3 ("net: phy: air_en8811h: move LED GPIO
configuration to config_init") has landed in the meantime, so the
EN8811H path is already fixed. I'll send a follow-up against the current
net tree moving the AN8811HB GPIO output setup from an8811hb_probe() to
an8811hb_config_init(), mirroring the EN8811H path.
