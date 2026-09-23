Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC5528373
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790136108; cv=none; b=dOkhGQVZRQV4NWtg7IjiEmqgH3jyleIC1pb4JG+XqkaJBaaGSE7UpRse9X5RatzFRBGneKDJhE3V6hqutmP23dmkf1rO1WDT8DEQ0zDEwYRgYSz0cLK3fBI1+U28TW5wSsyCIZDpRXWHgRe1YlZVZl04KGCDrxFhKF0DeG2Eg+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790136108; c=relaxed/simple;
	bh=Aiui/GIoJbCp5ePGjQN2o24q/nO6aTBrIxDkg4ISXM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ArS4SvlhfhfOj1/7bqtuOfJ2Fi/Mwf+PU9kqZUWiosZg2hq+wjzbEAXLg7fLjXZuEL/BE+wKb/n+YI5iNjMnZYSovz8qtkSZE9QdotjSZdKeAKojIlYujjyx6TQFqrmNXOxndEhom9DoX7pBbgoQDJi7ril9r7cgOH67SLMTZlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKTiO1Cl; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKTiO1Cl"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dce6e237so359418c88.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790136105; x=1790740905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNH0I/YGSZc1C7h8dwe3uxAfPvi2kXhEcwNb2Q7F9uY=;
        b=QKTiO1Cldfh6IiupBczGedk8TcuH3d/+Ilc4weLHgSy7hRQpL5nSAmK3lTnsDc4hWW
         6eK+aOsdJ8IBJNP1UbIHjzVqhCAGkbWrCaWboazJODCTCYRRb72x8qpg7IdtXUSVEJ6J
         29VIE6D4DU/5yI5I7gv1Nzd2g0SIX7TUCP7EdnN3mkpPFwPhx94rF7e1pyKfjTTrwjkB
         FwLGujxUVrnGbaP1a4Tora/MjdH3zM6aJveNkiV+GpiBe2JLGzKedjS7Lli6sV2vcsXo
         dGFTrnGHwajgHe15xERAlkiK9H5qEqfMUanul16AEbK/GpM4uofBZPbfJ+9QXWE0gXcm
         3PFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790136105; x=1790740905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNH0I/YGSZc1C7h8dwe3uxAfPvi2kXhEcwNb2Q7F9uY=;
        b=I6pdZLaVUMgkDH4eJsVj8RgBhwIN81x3oV3X7A2ufsIEg0hQvxLqyMfu4G6m6AaIJP
         S/ZbeFkAyKvirpSprDn/6eZQrOwSyuijoqVqwNaeTTK/6xzJv9bwkfAZjCH9NEhCqyyW
         SUN3neONPx/BZy43oFnDsROWnT39wwpsW334/bSjwof/ign4aliDr+YzIviohT8sZvwm
         s9rJG0jrRq7UaIMGrNemEAeJeI4Soy6iF4ARoTMEfvtRv8Zv2pmMNnMcBDFF262lC3Zg
         OtPKvqYXk8qiHA18Y6F2kzvlXaJx8pyfieuKM6J26jDarCty7g9cXNB8OJhIH94rPZu5
         ep9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZuUVU6lPCnykJOGiRtYPvgIR/7cRU20pKHjR/yBQdaHq7Id9lAE+YaSxEUtsZa6TXPm+pRBHmCTf/Ak8=@vger.kernel.org
X-Gm-Message-State: AFuF++kTr2GL//XQ/19E/dWmoLzJLoYXMLSF2qpQ8zvPcfDT1skFPrp+
	3iyF3L/Sh/3z9+nPuylADDSCJNduRXLRvtT2xED5N6S9vWDZECPq6x6w
X-Gm-Gg: AYBFou1PGVDmDoR0yDzueRqpZswJ4eYFPnDEc18YHCSBTqYrQ+Tjq8l3PEI1N6m1l41
	0hg/i/0GjptjBu1Ro6E8viHL7pPDs6F5eB8hg5HOWsoQykz9WA8zJi42R+niyiW3yK2uAqa/lYd
	Vsd5dF72LThled0M9PKTjHklM/NWRp7QAgcy6XO6XjRw1BgfcKWETmnoZgTLEedMUNJdgj5f+bq
	P7ouFawYtloB9Z9CPlXlZATILSdlaaxNuQeZ+RInIOpep2nOOY75sgYUGdcPvap1ffLk+S92/ID
	aO8TCSYZUNeif5snH2EzVWXJ4dknbakycBEFCJZqoI2V9Hqm0AA4jkOWjteU55ilCsCD1YcgzYd
	bl6euJ3cMJns0XXk1katRzm7DZWO/4Lbn1iWeuIrPRUhcx8jEs6c1vuOg6nLzEUu8o5FWWdM/3Q
	4zo2KnrF249GFeTvpiZlUt22kpOkXSihnbvhxFU4285v53mTSiY9fjPHdYQ0fpssn6TLZj9xZeO
	0Zt0XY7TBUpYcqZWSKoIx0pRTtQV1H3ETz0TOZVBlTgV8LIbsbzr/HC2wAEPWkrV/WyGmAwVAE=
X-Received: by 2002:a05:701b:428b:10b0:141:52e3:85fb with SMTP id a92af1059eb24-144f90d9a4cmr1727836c88.5.1790136105360;
        Tue, 22 Sep 2026 21:01:45 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:64ea:2efb:709e:b783])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9390183sm2426374c88.0.2026.09.22.21.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:01:45 -0700 (PDT)
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
Subject: Re: [PATCH net-next v6 0/3] net/sched: sch_fq_pie: add per-flow class statistics
Date: Wed, 23 Sep 2026 09:31:36 +0530
Message-Id: <20260923040136.13432-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922180458.5c54ebb8@kernel.org>
References: <20260922180458.5c54ebb8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jakub,

We have vendored the temporary UAPI header changes into the GitHub 
development branch (https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats/)
as requested, so it should now build standalone in your CI pipeline. 

Please note that this header sync commit is not present in the official 
iproute2 patch submitted to the mailing list 
(https://lore.kernel.org/netdev/20260922211139.38570-1-hemendranaik@gmail.com/). 
It was added to the GitHub branch strictly for validation and testing purposes.

Regards,
Hemendra

