Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317004A8FFC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364195; cv=none; b=XIJI4A9DFVFQRBRUsRQNzhpmqjG/7l3JbCYEUib2CVGmfJaYdoUJJ4MHQwlHMlA8eSckgvEQlSNp+5rJifb1iP0Rrnw1enCUByWC1CrzVpyvcMlNMVtQ6yGG/kw7fYlKz1FfO5HqyV0mUgf6on8FU9NUhyehmm2qCgeEvtuy8mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364195; c=relaxed/simple;
	bh=ZFUyQ3mpVFiKVb7A5VcBIH1Co5Fvu1RaKkX3s7o6tGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3RdEU/h7ALODgo2IKetR4xeUoZ5HRbDndibmYO2XJp695CpXIX8wpuADVj95/6WntzYXwBz+u2uZulVmPdik2BOS9Ctedfp8/MIyDxngZlJR0a5qzW7XMFMK2U4BWZX/FV6UPDomEdwL1SS5MVv/gK81aPacHxZy+THZb7xSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2KduuWA; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2KduuWA"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1c7364550so1423745a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788364193; x=1788968993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z89yPC+uk4DMPmL1ApFKYR0uaTYQLE6V3binhup5tUc=;
        b=O2KduuWAfkVdRWxD+/ksCFlj5vrWDHcc7Si9jr2crMQwMHIoolozIBSnd2el5Gqzln
         XrLS7ak+muLUiKyKp3G7cbvYR2yl1f7qgpeca31GqeJRo6svtxnPpnMzyvKKMx3vHWKs
         CbOU7ddc2h5GS1/oz8+oF4vPU7leqDiCZkekuqca7O/BZBiIrgT1gynJsaaxXi2uJ0/K
         xG4832qlyFbqomLCx/FTMCXf718LehgaJqA5jN1OODFXDKl68rQJi94/PTqRzBAg426a
         34G9UhcmtURSXhIzAiOg0YQXFHM2xSq6g+JIz9/TNRrYAtnP4MFVc9nH+/LsypkGEhhM
         YgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364193; x=1788968993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z89yPC+uk4DMPmL1ApFKYR0uaTYQLE6V3binhup5tUc=;
        b=bN/qvBlt2AmZaNX31F1DZCogWlmCBrWGME75uuPxteoXzXd7OL9/nJzVmaqxvG+cx6
         s8twUNJeXf9+OTebPg/K6xmTnFmBlvGQrMwZo3TCQ7712W3jZ7GDCvAT3Co8U1vQLKIH
         VbjFSpYxWYwwcKGsrvnBJkeJi83lDoZ5+bKXRoTE3j1Ls+B00I+o00Slb65SK1MnM3T+
         YB7jygR/Ta2WOM8Bnwwg2y9/5uTepzS0bgT4EmTU9pZ6hd/meIjr+vgpjzhKZxN6dkvA
         6uq5tdtwnARDiKEyTcwJTgrKvmqMC57zxNF/uoWidvCjRsPy0O8hA9d8nJ+asyzauUjT
         pmsQ==
X-Forwarded-Encrypted: i=1; AKwUvByxkK8sQ/J9T8rYwl8FvUbyzcV5mfbjl27Gs5RrXZ9UffJ0uyY0ewNHAJ2TR9cLK3AwscbluHw6hH/U4Es=@vger.kernel.org
X-Gm-Message-State: AFuF++n9etVbchaFfNbhvmmwptAUPhs/aZTdSrPkFlyMO8VUrrlVMkaK
	fHe7XHl/n3AUgWkYK2pBus1HktmjZorRKtPme/2F7GlkAgFUgQ/Trnhi
X-Gm-Gg: AYBFou2no2tVBII0f8ELDOhLWMZ9fiGVqv86gKftl81OR7Vi0cVCoG7wkjSvqHtYbJf
	zfIZmrr9ZcJiF2XZepJUiFoejlwy5tRdS8lqIyV+gOKpsFkazzvmpSuNOa/rYULqOCssizsgQVS
	q4bpbZjKHf0uz1M9DkjnoOBof9RMR5fZ/UEcl9crWOy+45u1Dmul2ID/o4OLEHIprm8IzRHM426
	GJMLSBQRn+M9O4fgYQ+Iw4oZ6PzZUdwoAX6kPykrPj5+XU+KGMpoSZHUDmPxeoRyq5hId140g3w
	s86/lgOZB2Erprcds0SEigX5IBSQY8hvCY3KJtAxZJnuysfR5CX4L+5H95S34jbGPGBhsSjZC9P
	VqWuryEeUmugVFusp1lC3fBf1N/M2Dx2JUQHbcE+kkUTcaUojhcrSP00HkoSQLvv57D20fLq1js
	vwPVXI76L5zwtKgP3n6brCoRNAVPWxtxPgRvTlAeBYGMalkOyGlgILGYZIKVk=
X-Received: by 2002:a17:90b:57eb:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39aedfcc06amr9073487a91.6.1788364193126;
        Wed, 02 Sep 2026 08:49:53 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08300ba2sm81417a91.1.2026.09.02.08.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:49:52 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 09/12] mm/damon/tests/core-kunit: test damon_nr_samples_per_aggr()
Date: Wed,  2 Sep 2026 23:49:42 +0800
Message-ID: <20260902154944.4035059-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902151955.88892-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  2 Sep 2026 08:19:54 -0700 SJ Park <sj@kernel.org> wrote:

> On Wed,  2 Sep 2026 23:08:41 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrote:
> 
> > On Tue,  1 Sep 2026 22:47:42 -0700 SJ Park <sj@kernel.org> wrote:
> [...]
> > Both `sample_interval` and `aggr_interval` are zero here.  Since
> > `sample_interval` is the denominator in `damon_nr_samples_per_aggr()`,
> > would it be better to keep `aggr_interval` non-zero when testing the
> > zero `sample_interval` case?
> > 
> > This would make the test explicitly cover the divide-by-zero protection.
> > If the `aggr_interval == 0` behavior is also worth covering, perhaps it
> > could be tested separately.
> 
> Thank you for your review and question, Kunwu!
> 
> Yes, that kind of additional test case would be nice.  Please feel free to post
> a patch if you'd like to! :)  And no pressure, no rush.  I will also consider
> doing it myself if it seems you are not interested.

Thanks for the feedback, SJ!

I will prepare a small follow-up patch for this test
clarity improvement.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

> 
> 
> Thanks,
> SJ
> 
> [...]
> 

Sent using hkml (https://github.com/sjp38/hackermail)
