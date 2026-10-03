Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0B8489873
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791047124; cv=none; b=rUVqFY7z4O45X3SqGlvD5sGGxfEFhB4Hg3yDAzF3da9xWE2D0w4U8RLwXhPkccqE31ORi8nTtvvKyXgbPBr6/r07mVWDVElTLjwHpzCNwVqPkSDHM1Sm4TrOju57m+bE4xLj7JJ9Eb4oe7oCbGHcI1Ep0omqkO5Y8gaztFjXg2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791047124; c=relaxed/simple;
	bh=GkuLv8sohC6Q/26XJMwu4gBJyw5znkiBZUe3IXWF3xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyiFieYlSuDeekIHKX6kC414oE9cAUCFioXeQXwXihCmX8s0z9E+BymbckpFsTleiQpDfaZ9Ykb2EFgVQmAsGV5ED807wId+kbTIR3Xlrd9oXCLDa8OioSQej1uFGpxLvLR1Z5xOcu73zW4fkO2xZ8RkQ3jbQaD8cXz4loB5e5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com; spf=pass smtp.mailfrom=truenas.com; dkim=pass (2048-bit key) header.d=truenas.com header.i=@truenas.com header.b=REb6kq1h; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truenas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=truenas.com header.i=@truenas.com header.b="REb6kq1h"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so6025515e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truenas.com; s=google; t=1791047120; x=1791651920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9/myqvD+Wu7dUPpez/fB+sxDbuYQxQUAR18f1smsBQ=;
        b=REb6kq1hDsn4cMgNteCzo1UW9/EGSRhPGWyShhvrwvgyrzfs+yzUoCStKb4B8YSnXA
         o6J5tkm+9EvkrQ9du/Ykrvk4wdMiDjX7FIbMAd7TvJ3GgJAB+CpTA/2ooaTqkOC4efJO
         pLSeCtLFXpSJgldghAGPFWQAHOiBXbrtbzNWUsNlb4CWvMmSYmOuM7Ya4ct7hG59Bs54
         2rcq0o1Gf6HNxYpgG1DQwwGjmVVA9feQ76X3UZWEqwgmFf1Av0qcVLDZbayFRsmTTfzJ
         mNx4gh5Adnh8biM2KwgTNp/ryZ9LOVZXJ5Wt1sruRhQC5DFFt6fWqdhnOhcfk+kLCudY
         FJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791047120; x=1791651920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9/myqvD+Wu7dUPpez/fB+sxDbuYQxQUAR18f1smsBQ=;
        b=yhVzd/fA3DJYW9R3EkumLsc+ho1cFQpwzPw69CoXsrfyG/ILzZVLKdOSyYf7+6hDVj
         xNgvJjhAc+E+OWoRrcauc7ld0IVV7UcbnMeAytYfvvbq7i1gsFZNXyUspIvzr97jmXXG
         qnl2e1pPhHvXWxkP+ToSA6AEkobYQt2dBw8TIxzVLe5AC9VR8QU3TG5MM9XJtW4yLgTX
         23DcWaUszDu3G6mXjspOHKSzMdqX1UtJ3L6g349DiH5Op41c1P/oXkRSumGfts83HxqK
         pOe0u00X9y2pXQsg5dlczKCvPN1u+efuU9ZlxG+aTXAWATHf9DiTszMHj75yQm56P3iq
         Abmw==
X-Forwarded-Encrypted: i=1; AKwUvBzr5Tce39czwvSdFuE8ZuXq4wPmb7DH/Sli/pciGmqjCKDyp5fKNbLflBqZEDVJDibrFz2h4u8mD8Q0F08=@vger.kernel.org
X-Gm-Message-State: AFuF++k+8r7sn1vjdnrz0HAqo1NVYxHRI866I2ODfZ9PzCEdjF5CGqLE
	ygfB1jjIDN8bfXnSzeuuYocH/kbjGz3JqU1GNW73/XxH0nifSzeKQy8Ic57aVftVNg==
X-Gm-Gg: AYBFou0mcmKSkJoNBdLd7uWlWNxLr2ch8DbqFPf4Swr69gNrhjU62A5YriiYYcg+UZv
	PGm6xM0YjZUAdyw+78HK0WHQGkFtabIRXBqVY79MihM1O0His5flxbcZjQFvQd3FM3XdO4Za+Tk
	7F27Y5XECInwn+fpNl6EeOAlaEtwo0ayTPCshc+HjQnGLngMp94VumejBxdWoPniGTQPQxjcdR/
	LfETtgA58CviT8ADyv08vw3EkJw4APNyRfeK68sY5XFzYJOb2S+zeE7K0V4QQ3bAyuOczOkI/lN
	N03uvbApNynh2IXB0MRlkH2TCHkBrj9JMgTxZ0+vdw9b78PVzsLmCEVKOEHrKO+FDyFDMQe9Wzk
	+1od+rNak51QqFgpt4iEN2C9K8Apw+OWEA1CUIok5+YqiT9G9X/bYkNh3dDW/gRaK4xdGW6qufX
	9hy95BFvD9NpJb1j5tXh/6BaDy3woEH2IjsOezeMC++cbUgqGIqQ==
X-Received: by 2002:a05:600c:c16f:b0:49f:ed8c:6cad with SMTP id 5b1f17b1804b1-4a027594557mr93542555e9.19.1791047119916;
        Sat, 03 Oct 2026 10:05:19 -0700 (PDT)
Received: from hamza-PC ([2400:adc1:158:c700::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm177013365e9.4.2026.10.03.10.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:05:19 -0700 (PDT)
Date: Sat, 3 Oct 2026 22:05:11 +0500
From: Ameer Hamza <ameer.hamza@truenas.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: ljs@kernel.org, rppt@kernel.org, peterz@infradead.org, 
	akpm@linux-foundation.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 4ncienth@gmail.com, sashal@kernel.org, 
	alexander.motin@truenas.com, caleb.stjohn@truenas.com
Subject: Re: [REGRESSION] secretmem: SIGBUS on memfd_secret() pages while
 perf record runs
Message-ID: <asE0ctESLO306qYs@hamza-PC>
References: <20261002175651.811343-1-ameer.hamza@truenas.com>
 <3c5b9d1e-5ed4-4bd1-b532-39f2d4612965@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c5b9d1e-5ed4-4bd1-b532-39f2d4612965@kernel.org>

On Sat, Oct 03, 2026 at 04:14:49PM +0200, David Hildenbrand (Arm) wrote:
> May I know whether this problem was found by
> 
> (a) A real workload
> 
> (b) A test case
> 
> (c) Complains by some tooling

(a). A root userspace process that keeps secrets in memfd_secret()
failed while perf record ran on the same machine. I reduced it to the
snippet in the report.

Thanks,
Ameer Hamza
