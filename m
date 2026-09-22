Received: from mail-dl2-f36.google.com (mail-dl2-f36.google.com [74.125.229.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9423A4BD34B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108464; cv=none; b=c9r86rmfSoQ6FIRm8ksTSooudmSZukwVQ/sX2nijAK1QbH4juWJgEO+x1rEFQcUd+c9mzY+kPAx9gTehpJvlzYMZtkGKdhnRviJ53WhqSWh8b/DhY0dnn1oQgDiLLQtEVLMgzKGIFnLPWISAMOFmAAtZtdUCy5YBb/ePcpHetRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108464; c=relaxed/simple;
	bh=NfI/Dm5EYDMnMTAl3fxv1BGBbGtmkx+otpGuTeOYlsM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vk3BHGX6hxH5GoLZOpUwdaYpbKk2wU0HbPsA4PxEocbV3IKaCjvd5PJvBsuUnvKCk5VXc9v32Z+kEfA8E/CrOesGBdrQMjGu0CL/SBlBnwsGFEpun840CpbkICk5rnELCofd2aZEj2B0DUEORWjkhxUEPSGdjzi0dhUwAnb0K8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DutUdb+W; arc=none smtp.client-ip=74.125.229.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DutUdb+W"
Received: by mail-dl2-f36.google.com with SMTP id a92af1059eb24-14373bcc010so289557c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790108431; x=1790713231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfI/Dm5EYDMnMTAl3fxv1BGBbGtmkx+otpGuTeOYlsM=;
        b=DutUdb+W7oH2y12F62WwZ+QfU9FlvnMneV5ybbYTeOtcQRuBTuoK0zjFFRIbH0Exu9
         Osrt9H7dE0A3nsvWeCtNndXvyy9hNpF25GQ6FkYFqkXijIqGbbeLFsihYTaFiLWMhy7P
         9gsq7zLcDqfPdH3RJ+pNC1+v0ala/csBN5/beWj2yba2sp9RNiOP66hVxLCt77O4akuy
         L1ZmB0/BdDtXf+onvJk4UKadegKtANfwWFCAZ1KUWZRBNSu7YS33DsyeX18OjoFXByU8
         coM9g8xvEp0LVOMthJQK4U65QCaurvEekcPomIes2OWcerYjaAVN2j5A5dptjTWnMeZT
         68kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108431; x=1790713231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfI/Dm5EYDMnMTAl3fxv1BGBbGtmkx+otpGuTeOYlsM=;
        b=mNJNYN1p3KD493bYHosCwiwzXa4aICELnC+B0VClzPc4VsVlUylBvSLFs0PLP/C70v
         b7GmcPe87MOJU8LssHuYbw1CHc62DthwXXCIrPOkfKAZTwPmd5ZSPXsX38T090XXQRVF
         fkc3AXI8bq7GrKDAEVRl/ga9YxZKIiup8fNWd5D2o0Sl6V+fTfvdFiMeohi1jLsdxV4C
         vCZLf08V/Ck/eg6TGWDvZmaa+Jiw9RukLXIJ5I2lv8k6An9ZhaCAbsqZeX6w5e2rFtVF
         9rRwOY1sk8ocAjuOUjjLSdImNV/wN+R08rObY361xh74PFDLwAOLZi6KA1JtCetRVkco
         Qyqw==
X-Forwarded-Encrypted: i=1; AKwUvBzNRJwzmwpMvM53JF32/6cKiXmMOuMU+1yH8yJ+l8IjgddC572WkpAxUpdfJKPaOBdznNnVfr+RswJtb1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mUy4wYFup9colWcsYUaYlzxB4A9E5H6GH7/LEq2dZ+sJuRWAGI
	MiCC5dQjZI5B8NCtEldyp+zXsklXgcFrRNF7DgPslqvkITXavoiYYFu/
X-Gm-Gg: AYBFou05oTFf2+0RCfHQ77yahy2pVmwO8RovQw7VJFDlVaiwYXVIOa2KDH8IE1a+3Uo
	PteXMyeWxZW5f5KWI1Pxxn8tocYfXkyAb65nL67ePbWG2nXMKnq9ySatIysuz0QOEGTeDGFWVoL
	ogcqTM3WNX329hQI1Kl5uXsMzyWOqw+oVmxcafrrLz2f1+Nckw58obAFvAa43CWWcTUaSyiNk9A
	Tr68ZNy7P4Q1o98VdVX4rhFZieX66rzWZE5iQUvqQAJeWS2VM4dZgwJgCWbXnOLcNM4BYnyf3we
	jESJkrZtJ6wBgQy/bV63F4AZsOn1mJlCqYtj4oE/3H/w3Fqa/Hbb3m43gFKQt0JVj+LYsTdqJfo
	aTqy7ReHn7r1bKQ8Q+wRUiO29jp7IOVSDXOpM3omCLhsuoD/Zsje8cRMuU0S1rbmK0Hs4PKIH67
	06UtQXUhQSuiLpD0mO2IGoSUEN29LbXyPQhOJHeKsutb7ppmVI9coSG7+sZZuas5u9Tv85nN+gk
	edXP+oyo6JpdKYvnlgR1gmBI5AedRrQWCceqFGVmDDN8pOkD7ml4AbfAubxAIBvXyf7oHo1+EOE
	58UODWXUIP1vk42mW/FQ
X-Received: by 2002:a05:701b:455a:20b0:141:4951:f150 with SMTP id a92af1059eb24-144f90adb56mr519266c88.18.1790108422631;
        Tue, 22 Sep 2026 13:20:22 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:f16e:2102:25ad:9cdb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9820ca5sm716854c88.3.2026.09.22.13.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:20:22 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	tahiliani@nitk.edu.in,
	vishy0777@gmail.com
Subject: Re: [PATCH net-next v6 1/3] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Wed, 23 Sep 2026 01:50:13 +0530
Message-Id: <20260922202013.25126-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179002340755.2160803.3742716999091408861@kernel.org>
References: <179002340755.2160803.3742716999091408861@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review. Replies are inline below.

> Is this paragraph describing a change made by this patch? The diff is
> purely additive and net/sched/sch_fq_pie.c had no delay or avg_dq_rate
> conversion before it, so the new fq_pie_dump_class_stats() is not
> replacing any truncating computation.
>
> The code that actually contains both of the described defects is
> pie_dump_stats() in net/sched/sch_pie.c, which this patch does not touch
> and does not mention, and there is no Fixes: tag.
>
> Could the paragraph either be reworded as a deliberate difference from
> the pie qdisc, or the series extended to fix pie_dump_stats() as well?

As you noted, the diff here is purely additive, so this paragraph isn't
describing a fix to existing code in this file - there's nothing in this
patch's history to carry a Fixes: tag for. It's explaining why the new
code uses div_u64() and a widened u64 intermediate: to avoid a known
overflow pattern, not to describe a prior bug in this file.

The bug you found in pie_dump_stats() is real, but it's independent,
pre-existing (net/sched/sch_pie.c, ~2014), and unrelated to whether this
new ABI addition is correct. We'd rather not fold a fix for that into a
series about adding per-flow statistics - it deserves its own patch,
separately from this series.

We can make the paragraph read as a comparison rather than a claim about
this file - e.g. "which can wrap" instead of "which wrapped" - a
wording-only change, no scope change.

> Growing struct tc_fq_pie_xstats from 36 to 64 bytes is visible to
> userspace in both directions [...] Does the accompanying iproute2
> change parse defensively, e.g. copying min(RTA_PAYLOAD(xstats),
> sizeof(st)) bytes into a zeroed local struct rather than bailing out?
> [...] Could that reasoning be added to the changelog?
>
> The alternative would be to leave tc_fq_pie_xstats at 36 bytes entirely
> and emit a separate struct [...] Was that option considered and
> rejected?

Yes to both. iproute2's fq_pie_print_xstats() already does exactly this:
it copies into a zeroed local struct and memcpy()s only RTA_PAYLOAD()
bytes when the reply is short, so a short/zero-filled read still
resolves to TCA_FQ_PIE_XSTATS_QDISC (0) and prints normally. This
reasoning is already in the changelog - it's there now, not something
we're planning to add.

We did consider a separate struct and rejected it. fq_codel can put its
discriminator first only because it was designed in from day one;
tc_fq_pie_xstats already has nine fixed-offset __u32 counters that
predate this patch, so a discriminator can only be appended here, not
prepended, without moving those offsets. A new, separate struct would
still need its own attribute and its own print callback wired up in tc,
splitting one qdisc's stats across two code paths for no added
compatibility benefit. Extending the existing struct was thus better.



pw-bot: cr




