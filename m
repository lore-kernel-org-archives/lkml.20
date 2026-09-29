Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F803B2FE3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715570; cv=none; b=DpWrJsGZwR+6Z3ZAJAihuTf2K64PmrpjDWIIX6Wjv9b70LdEJWkgeH3DW2ZH5DlqSIqyabhflVEl/I1r5ekD1DBQ+FMhKgZiBlp1uxWyqrljRAEW8VrXuEVVzheyFTpaRbw5CjL7BjhWnwwwrqCxXSThpbN0950fTe7D1SvHse0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715570; c=relaxed/simple;
	bh=M9xxP6XHlfNMV7GWnWZNCeEtckS3szign5mxnLwwcIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZ0RNkkOpsAnJSZJyGpFUC2TK23qWLuonASc/d2JYIEloG0doVE9l8F8RYv3nlf8Vrz6ENXWroeGaejmk/4llyM3Er5FM017b1tK20dpWb1AKXhUhd+kVjmOsTwmtYNqFTtWpIVD7Z2xMNU4s9jwOWatPTI5DT1LBO2v4povSC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqHWKVcq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqHWKVcq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso25742415e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790715567; x=1791320367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T6zBsYuvkhCSldzaWUb/rJ1yx0lBA5YccYiihjP9u78=;
        b=MqHWKVcqTAd/lgzgSnDnRSJMe0MOojiTxaZu79gll0d6Vw3aLWBERIj5aPOmzDeCea
         y/DbhQufOgDOf1mz1z9Kpuahhd6ndsnVudDVldGwtF8iF8gEMUk+QBrhKYQ6AaHphS1O
         4Gmk3f4KtMUNsmLRsMaM1beSQs7g87Ft7WWBLUEieRUXMeDCXM9ieuk5RNodPIDMaHRU
         ST74JNm4Gx5qBEYWCHq4rOTXiT+hHEvRG7jszFhCLa05RslRAmTvJ6bNNzyU0AVVhSQa
         8G3imAAvmoGGomB0G+DVKi/hvQXkvn32085FaMILJui5q2Nt7ARoaGeEFRuxq0ajontd
         XTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715567; x=1791320367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T6zBsYuvkhCSldzaWUb/rJ1yx0lBA5YccYiihjP9u78=;
        b=0I4j95DEdU8l5+qTcyhEYZ2KF6ZF5/vEtag1Hp/JjCl38gibM7brfhZPhRY4HprDXC
         TqhyDVxKW8iYr/x8zvlLmE5INn7OxBsm475WdkZRY9rv/FNGaDthKYXesWnCzu1mwWYi
         06rKaNwPKvV8gmmhpU0jwlWZcLE8K4P4eAHJAymWhxHv8mdf/Qj9DHG4pEufqZojthSq
         jHXcYnPR8nW/ChaRD1uJn8jqyY0dRQOUSoFYql6Mpsj/gFoo5ga+0Lll2XgD5Z4ChJsq
         +G5/O0yRy8bX2SfeUOK47zMF64uZMFWPl1Xci2OD87s1DpiZZHeDs/KN11jzkqrTztNH
         kCJg==
X-Forwarded-Encrypted: i=1; AKwUvBwJD0nOh+jtvnx0zL/1DYrje1ehFDvCuRDm7ifvFPrfwz2h85VdgLQMAyFco5MHSCnNMmkVxFrblnTuOSc=@vger.kernel.org
X-Gm-Message-State: AFuF++ls1ZNNzGy4zttM+l5RA97SOwkepDtIceA4BEPXMJw3SW09A+Ku
	TlOhn1Z4VeOlQVz+tHiAFJlvBxNwX/LgT3UoeTLMIcLBBwOUMVJXb2AWnhtI09I1+s1X
X-Gm-Gg: AYBFou2WZH8dJnGWpjVlrTkS36VzUdqoXybh4rnJplWQy8lcLrUb0Tk7V0K6H2p5KXe
	m7c8/zQwkPKAQUw61kBsbuzp5M+BqrSZX3SzSCPYXIrEES6RDZ6Qnql4PV5RPN9R7h/ezkVe/np
	SverAB+jIghfEhJZ0RSBZsT3IFvNHMODls88qmzlWL9NNngMuK79yFdsSFMpRCW1LWQYEBlU7Et
	Q407fgQtH16CjQhQfPSyEniEBIHy8hHzXK2vY/GVMVs/trT3naWXUAA3EGOV9AQQNOfG2GKefEH
	qrVLEiR+PWY4IBN8iVz5KfxJjFCz2+jaVV5hvO0aPFp4IgJykNlTtF6gn2FaEJBBkRIeSzoSaHm
	e4f7mwG8J5ybbyv9oAJQigEnx630DMbDZ9OHDRz5nuVLwmC8bDHF90V/J2MjE6KdJSFEa7c+AN7
	AZliv3xMESztoC2O8U70jXcQntsOOsqNkGB35D0lxT/mteZBG6mTd9BbDE3oVvsnziiItbXCFgR
	6E5mFXr1DiDu+vHXtctgE355YRC4jzzlpT7bbLRcQfJHd5WwpiHJp1KueAtOBbbOfKNJhibf08R
	r4cA/YM=
X-Received: by 2002:a05:600c:c48f:b0:4a0:dca:b78 with SMTP id 5b1f17b1804b1-4a0151397e3mr4412245e9.27.1790715566870;
        Tue, 29 Sep 2026 13:59:26 -0700 (PDT)
Received: from Ubuntu-2604-resolute-amd64-base ([2a01:4f8:13b:86d::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014217216sm26857035e9.14.2026.09.29.13.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:59:26 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: gabriel@krisman.be
Cc: krisman@suse.de,
	hnkz.64@gmail.com,
	akpm@linux-foundation.org,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	andrealmeid@igalia.com,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] shmem: fix unicode_map leak with repeated casefold= option
Date: Tue, 29 Sep 2026 22:59:14 +0200
Message-ID: <20260929205914.229355-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <878q4jyf1z.fsf@mailhost.krisman.be>
References: <878q4jyf1z.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026, Gabriel Krisman Bertazi wrote:
> IMO, nack, this is not the right fix.  There is no point in accepting
> multiple casefold parameters and we shouldn't allow it.  If
> ctx->encoding is already set, we should -EINVAL and fail the mount.

Makes sense.  This one is dropped, since Kazuki's patch in
mm-nonmm-unstable already covers the leak with the same unload
approach [1].  Adding Kazuki so he can adjust it if needed.  I'm happy
to test a new version.

[1] https://lore.kernel.org/20260827152516.805622-1-hnkz.64@gmail.com

Thanks,
Mohammed
