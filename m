Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED133C73EA
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791626821; cv=none; b=No1X/znvUKi74+8b7ILodv14xJYe19gAOiCNjLwONa+aLk5fyAbhM+6gbIMRXsFLXv/irpPXct0+r+1qoRlz3htP6k8B4kEcCY2faeG5CekYTT913LbWAf8jsInLQS2IBcEA4tq7N8/YhXiK++2ljlZLVrIpVPzevVgXEexqdMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791626821; c=relaxed/simple;
	bh=G+OmJo6KHk1Dz1mbCFgc9+lDQS9rLz/nyFsb9jkmjTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nxajhPou9gB9mZdFjOZUxN7NIU2+4krV8xwqvoU9Zybqf+dyUXelzN5Lmpw4pApRrXlBl1B3SXAfpwe6Z2acjhqN6otCz4U+Ml9jT5JHvufF5cBQvdaoJ8U1+NTaqfl06CBIlx4t55/muJL4vGlqDQp6MY0MIUcq8Nk/WoAeOzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=d68cN/PS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="d68cN/PS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso267539f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791626818; x=1792231618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElWk8fKGydcvVdEATDJFrXGRGjE67AASQOUO8YEQCOc=;
        b=d68cN/PS96BgvaIVEbW2urVOHeTHY7+qz2vq3ZYroJ7w6D2flGUHlTYleNncFvf4vO
         puUb3WbeX7NaZjNdQ17BYEefqc7aCo6zwUFZ//ichHmHw2uvxkUYlqip+MoobynRH+Ma
         h46VywE+M2rCQUhdXxzsXBSp2DNt5+uNyLjvoh0yGSVenUen61/flVwvUqVCr3FtKWKO
         zY96L61c0UjNnt1Sxg1utoRuwI4rOX9hJdDjmmXYXprqHZJ+4cF2h3Nbq8Oc+v51FzEa
         VjFySdR3C4kLh7p/pvbtWP0Lrnvl8JKnt58lPu6Km54GKt3h6KTjcga9YUY+czD/duZk
         7xdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791626818; x=1792231618;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElWk8fKGydcvVdEATDJFrXGRGjE67AASQOUO8YEQCOc=;
        b=slSSfW7UhlmZNqFuu2IfzIWWL6EcbWnqfTCHA+1AaXlae57P2+c//9dfYoMdxqRU3m
         Oi0G+tjDOB+qc4VxR5gz3fDIM1e9knT6/GF2HM1ip2wPE9uWPUlGuhNhiW5RnN4km7Cl
         GdOD6K6HvKwXWkvN9Vjilayw91QR0sOTEQCwUv8o2JRXa1inIz0bZJ+3STwhy2Qj6NnZ
         V2B4dywqI0v76pNmWkFtoT0EjFyyeWoj2DjcHcwvDZfYtG8SoCvKNMDuTtrQdNVXIuay
         F6RV6EwDaRjs3dNJpedWhBELY9kk/3pnbJtD+eWk76Mj8B9FhfXhmMuatqLueAqn4r5s
         WOig==
X-Forwarded-Encrypted: i=1; AKwUvBxeXQ0OvzZnbxo9pYbzOPh4bJzUJzo12HYp7kAF/pByGye3C5rRDYmBceQzDxZPlvJzyJuQU/S45lSA5m8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw+SlXaVskR2BPF2Lq+Bx+OPmVV/H5XkmWDYA20JRBiBJdjdju
	Rjd3386049+mW2t+cq25aylOh6tLz0tGosraNRHYlCOXEp/Di0BCxFgAW44LoCHbS6E=
X-Gm-Gg: AYBFou2kmwMZdkwS/pRgOdGOnEoECQB0p9kqWjyHbA9ogG54voPF+ixA6LDZcTOzKm1
	2iOn6diIcdTFFEJ1v3aRzVNfNFlMCEBzywP3rfLlQFT46v59Y02hCPE9u3sBvtyQpDfqUrlqvOd
	Oio8w2LEA0V67Ej4FCeOvjywb475KWUQRNFWlXq+6ub2/SgfX/+KrK133fl8QKp5pCFZEMBGTSv
	x23OqxaS3sBEkhpABi+agxB4EJiP/lqliNirwMNMoZuaFMh7K/LdE43bA7z3dMWfWCzHW+hB2uT
	vYdy7dIuHA6waWibhNufLK83DHn9zDYzKTmJ5wWviKEVzVzOCR0E52d9+vzXNfSJ+Y9Ghrzh0Sc
	rrGSFGSSrX2U90ybetlREYKO03E/BtC4xy4H4Q5enXEFuSra6zTX4ArzsWy7qUuBu0MMJ3WhNle
	HmdkjU/eE9Q3S8b15ma3RglOQY5Bf0GL84Ix2q/s5zQguDnJm79kf23n/JkndAjwSCoAIF4ROOh
	9fzlCatWQV7+p5GcQ==
X-Received: by 2002:adf:f2cf:0:b0:48a:fe3b:64b7 with SMTP id ffacd0b85a97d-48dbacf6ef6mr5914261f8f.53.1791626817764;
        Sat, 10 Oct 2026 03:06:57 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac6a91sm7389151f8f.41.2026.10.10.03.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:06:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lucas Tanure <tanure@linux.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Subject: Re: (subset) [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline
 clock real consumers
Message-Id: <179162681558.457042.13976808955805070898.b4-ty@b4>
Date: Sat, 10 Oct 2026 12:06:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

Applied to git@github.com:BayLibre/clk-meson.git (clk-meson-next), thanks!

[4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
      commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb

Best regards,
--
Jerome

