Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F734041C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199868; cv=none; b=UTBZHDxMzml1lG1lXZAkOZUXuQ41ir1pKUAl9RWQxQ4V7WV2OJCeaPbHYcm50OOZ0c031GfaoJ3IUsZQk2BcRaENO/jL7mQL3x6HJHK+bD+bkWfQ6ZWE82MdtAKkf5IABGsDvFl6sWLpLf6ahB7Cc4AaHfVrrWAAbfB1vh944QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199868; c=relaxed/simple;
	bh=yjOLCTPmx4PvLECBxj5Od38tAnTgXsfngjPZ98hkwec=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HVXeGefjNSlfBMirtlTRZHwiMEPJSJna3eRRAqyjFIzXThLZbEG1Q9zf4GSdyACYNoRTwnTUCkPXpcuZH1zGxrxqcayEJVJIb4aAa77j9l1LhwpoVL5MktUJgVxlptQrzp8ubdhAWLy2rkwXjcUwNd35826DDjfaqWV5coI6qJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MS0ASUT9; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MS0ASUT9"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso56497a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199866; x=1788804666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EI2uoMQ2Bv4HGoXR37AMSbNrDmCDC9d8CsQuF9DQvSk=;
        b=MS0ASUT9+fY1Rq7jNo3uXDxumjWombEY2hSpbSmiMRXwrPoS0grGXQ9kcVThMYEsTe
         HDg+i+qSFC+Z+z5jvh34s48HqcYfx8wm29em31kbrH6Vlc6J9w5EgkCU+xGO7H/HjZPm
         DO1x74P61qjSiOpHi6qKU4Yh1StZ8lZ/V+ug/gWsBzswvmYrJrnS0ulYshvoSB5mGyN5
         Y7l/tqzkrFYOa24S3Rf9oOisb7fXcDSXPxPxZmXPH1pTbtYM9cvMI18d+IjAJIT6LY6Z
         p4vX0xTuKtAAi7JVGC10CrhL5WUuqnihzgRuG4iXsRQ0QUOiD2DZethI7wPig572YEqJ
         1MBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199866; x=1788804666;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EI2uoMQ2Bv4HGoXR37AMSbNrDmCDC9d8CsQuF9DQvSk=;
        b=OQpKGuytSTGuUzgcLkBqw38Mm2l+5QuzxPN6yKbzfOGfrmjwC9JZyINPWKP5D2S8Hi
         8r2Z5oND+EjRAQYx1qKJSdqGSxluU4uNLGby0IloRn5GlH2WrOlGkY6PWbl34C1KQNKE
         lCr0nOw8BIOpMuNAOzW/ejWcEPJmYHQvqGwq5lys2FQNFOrV04Ob4Qb/7/nvfS8AQqwN
         T3PccaiCrDAG69zGclVmTSEvPIqpUUuvC0LUEBdbtD1A/0FpI7PC3f5mQMwQctOpc8JP
         T2PETWEZSOeSzslnGsq+MjS8Qyc+ywuKHAN9vxd4YAnVFxTOxtOFu/fIjwOs2B2Bopwd
         Osmg==
X-Forwarded-Encrypted: i=1; AKwUvBxLgX6C46PQ2A3lEYUb8aezSo3RUA4YvGH0V2pSje+KpVY7xCgnyYW6tAvasUhu5X0m1Wp2TDdlgDY+1Nw=@vger.kernel.org
X-Gm-Message-State: AFuF++k9Cxn2p941ZLXuu4GNOb45k4UXZdGtnyvCdysGRbNsAlQTRD2L
	Y3ye+ZujWi3nww19brsOMOEVrc1RfQ3Qteww7JS5UCJUH8oii66dLGapz9yRzTNzkRPuB/683R3
	eynA4
X-Gm-Gg: AYBFou2NbSrvM6uHCODNB3mEzymQ+wXxT4e1iC1FyQc/meoAHJUXBFmHh7MVg5jZ95v
	PjS5p5sajfz5x2j8RB6FgSzElX9yCcHTfTSA++h81DkJEn6MI8ujEdmWV1HOBEb3ZRd9b4Ap4vs
	OF1GpoBfpYlkJoF8hKt7rJ2GdOwvuphI7v5qCXhExvFsfeQKVYk5qF49vDglqbQ3E1xJUHIrwGk
	UxS6dCpEc2zO6ztUbahn4uRuawQc6YMqNFMZpnHm6FB3q4eYXGPzA4YCMQ0gL+jrvrCFdqJgdgg
	YNEVFD4WGnFliLjfNj4cf9BBDLZCNKpMFcxT2eaPrJEoFK42RsnKPv/PaJhqrphfn2iLVzy5ksr
	B0nzpzJZH4B+Mp6iDmJEeOnORXs838MPrYjgYopetDHBpu0vxPtTKpj1cSiN5lCEHXbWVAmK50z
	18oiizaN74wZLNhQ4RUc5pLXFAyviqbce5weap1KE2kRxrhN7BW9Xa0pJ28z8KyskbzSYa
X-Received: by 2002:a17:90b:564e:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-396d0ee7010mr39640222a91.6.1788199865979;
        Mon, 31 Aug 2026 11:11:05 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990d802787sm821907a91.16.2026.08.31.11.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:05 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Yuho Choi <dbgh9129@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260615200540.770205-1-dbgh9129@gmail.com>
References: <20260615200540.770205-1-dbgh9129@gmail.com>
Subject: Re: [PATCH v1] bus: ti-sysc: Fix /chosen node reference leak
Message-Id: <178819986489.2869653.4530826376882355850.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Mon, 15 Jun 2026 16:05:40 -0400, Yuho Choi wrote:
> sysc_init_stdout_path() gets the /chosen node with
> of_find_node_by_path() to read stdout-path. The function then overwrites
> the local node pointer with the stdout-path lookup result, or exits on
> error, without dropping the /chosen reference.
> 
> Keep the /chosen node in a separate variable and put it after the
> stdout-path value has been used for the lookup. The successful stdout
> node lookup remains referenced by the cached stdout_path pointer.
> 
> [...]

Applied, thanks!

[1/1] bus: ti-sysc: Fix /chosen node reference leak
      (no commit info)

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

