Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F3B3C9898
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790897895; cv=none; b=Coh0BQtBYUJPzvEGRlQHFwq6e2isEdLdFfOZea5L/GIjlWeYN3dP0nttZT3FF64/R/riaNMB9BIMfxxwZHgPD6ZRxNH+8PdYHVP52V2FiBAv0y7Oi6c7HrqEz9dtwuxtE7acMo1iYx8y9z+Ay6k+vvaVQmFwig2kODihcc1OzEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790897895; c=relaxed/simple;
	bh=w138yJmKql9CsB3j6NeuLwJiWYTSGe9wiSiVMcaP8hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqRah4N4oZgSVMwcRqie8ahlBGzM4APGy7x6E1aR9tGDzmMrgJPwN8QAlH2BMj/f5Lgd0ThTWR0lFv/9AL+RLT9KlK0xXDq2RsdxDWKbncVq2o4Y1huBPcz/jaRVDc2trlqRUTxXZVEiiUPVwpxk5uQ0PK0+RfcpUqplCZJc+M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAok20QT; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAok20QT"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so4021033a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790897893; x=1791502693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w138yJmKql9CsB3j6NeuLwJiWYTSGe9wiSiVMcaP8hQ=;
        b=CAok20QTcEL+UkMAo7F9++JNNsODxVrzmFiO78jNj+tx2Ds7OlJ5WwAlu/L18im028
         9o8g0p+s56nHqYw3biYEkbTOhJczii4iJtQI1cT8dfebfas8FW0G04xanps7ZDv/vLLC
         tjaLkFjXF2NFPyH99/awvT7mnD+AM6FHSPycTeIaUvD8lIG3ZPZnIt9WbhG5TJ3ln1Tx
         eUpZdU8IJSR/wPvZhwZ5NJLZegbLRC6rsotpY9cx5VsO6OgHth9+NpfZ4UWhyHskWD4Y
         nkI+x8jyg2Kaj5psP2NJT1BZY9ruiOsG3U/x1Ijf6BZZvr+ZPFf1knuyIoOAzbc/CaJj
         WAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790897893; x=1791502693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w138yJmKql9CsB3j6NeuLwJiWYTSGe9wiSiVMcaP8hQ=;
        b=bYXn86PWoDcL2/rwD4ElCFv4td1SHKLPIKHNItthl34QJMLwJIdIQTIUOlIr+gcemu
         CxlsqkzTU9cTGZ8+yc9k5/zFzYCcOpj4+U92aADaKI34MOCLfWxK47b5ljPCodQTIdah
         I2qD5zYnwD8PxiNzioKSptJ4lWhvk80lu7YOj/EEAPoMchcZbetiVLhJv+vAE5kqG1U4
         gxHPMcaBV/KE908UEtNStXI4SMUc9Vsnc9ebEHTRmJ4o9SOtHqSOcNKZMl1wpLCGEfCh
         2D/6vFf74X2cp55EInVrXQ5KtE0txXg3w7DG/HcItearxUFa/5BikdpLzkAhXkFBS/rh
         ufiw==
X-Forwarded-Encrypted: i=1; AKwUvBxUkgmrbCu8Fq9k+QMKXx37+E4ARWd3f/wQxY/A8i3B9Gy8kPrk/wwdcT4M+ISwfenbtxUHv9AN21s6hsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgF+UIPn8afhzmqM24TJA3bj0TtgK1Co/ghWD8sOqvoZBWheS0
	ZQET95mis+Rer2ps0QSAt1FcvyPQo6JpMWvg14WXBjGIeBBsYpguf1o7yz9zUS64Ve3Ktwl1
X-Gm-Gg: AYBFou3LrgoBKV9Nx+7tdbicfvK2SVj22+PuNzTODRIDHwyVEJ9hKXwv9VFEAXN7+of
	3ckin4IwriO2WqPbRK5ZzW0QmatX9nZYWvIq8sZHoAxskD7INCStj8w5At66nelLuijq6m7x8yK
	f+YflGofGyHpdxKl4qSJktL7A6JzfFI71Wcw9FgoL4GORn5jKrOM+2elVFQ1bj6SBG1PGwFtUyk
	uUOyM2t2PvDLC/PIcDoB7brZtIKCk9ZADFbt2fAsc8K3gUqkEsGaX5AttVHVUgiyBdHswvCTtVe
	e1LjrJyEhVlN8IafsXQU2lt1qCImBcfUHKjWZwCsrNGjhj7cmGu5ziFSCdQ2BZiYP02M2nZhAeM
	fqfz7Iexhw63HnrTH61wR1RwMInbQaWppQypBecL5QCZf0vGrkjXwjHiP/e2NmUnF0bYKIG0NaD
	0hvwPfP9Ue/7JCp9h3txU0xv9VAN4l9I0Pggll2e3Ow0coftjWSG/UMmtktG9POdg/GyAStHWBX
	joXSny4
X-Received: by 2002:a17:90b:3a0f:b0:3a4:d476:e10c with SMTP id 98e67ed59e1d1-3a6ce79667amr848084a91.28.1790897893326;
        Thu, 01 Oct 2026 16:38:13 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ccc92646sm1284785a91.1.2026.10.01.16.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 16:38:12 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Purism Kernel Team <kernel@puri.sm>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	kernel test robot <lkp@intel.com>,
	bbnpreetsingh@gmail.com
Subject: Re: [PATCH] power: supply: max17042_battery: Make the fractional LSB macros safe
Date: Thu,  1 Oct 2026 23:38:12 +0000
Message-ID: <20261001233812.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915052529.7-1-bbnpreetsingh@gmail.com>
References: <20260915052529.7-1-bbnpreetsingh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

Gentle ping on this one. It has been a little over two weeks and I could
not find it in your for-next or fixes branch, so I wanted to check
whether it needs anything from my side.

Thanks,
Babanpreet
