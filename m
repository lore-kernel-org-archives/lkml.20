Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935735;
	b=eI33F164yrbIsTRLmWEMUG4A+B0sl5irBgeOrKQATIwTwqmnbCvV7s1Gf+MqE5Awaioy
	 rl5TaJ02YjzIDC1s0iF7Qpffkgx9qXPwh55CYwDa8cncuBtzuCcBxVgjeVpxZd8kRJRxg
	 pFCNemTdjgS3A3HLWBQcFxdPY/d/yQclCHpKxNJvQkXiTAU6lEjl+9vHuuVc8ZAzqFaI9
	 Db8uT1JX9kmJqqwKYffuTGzGwLtb5yqCxutiRS463a9W2RgUe2ANTupJH0w3+3c8AWgSr
	 2N1SRxChNZG7/wG+/v4ZzbVUzb+UJlahC/q2CfaALxrDmXQwf7rkN7u63qpRqUfg73g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jShjFF4Sq6gPLLl5+8nJzOEA7mRuIBIl4olxLWqQ+z8=;
	b=Bn1pqECLHlGiFN8qav4cVZGk8UQxvBJqI4YTfHkx1Ce4iByRZSTegse5ZEvqb75p4KHA
	 MzSzm3Ed7UCuYZIb7Cd5rNoUtVLjAUpKBERTUe847mjXIeQMqI51RsYaGYE5Y/g9ZOjlh
	 ZZH7YRahIZ8FvWG58yWHFRxN0xIy+VDZfTLuy5Zq4Jar8JcduXomtfJRN5sODTFxMDHko
	 pJ2s/OaGRXn3jS66XOc+Y86tl/vPsa3nXAurFO+4XPwb7DYMHuDWhDtmsEPgr67q6UK7D
	 phWjzmIluF0POgHRE1ws6Fw4JGCHaOkTBDmI3pzCKeVA/dHghoRqXvTSN1g3J95Sn5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rKqT+MaY;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BFC606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BFC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rKqT+MaY
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-716b58a4365so12018eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935734; x=1795540534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jShjFF4Sq6gPLLl5+8nJzOEA7mRuIBIl4olxLWqQ+z8=;
        b=rKqT+MaYydX0PsyeQqfFKGGm/slS3UpjlNun4tLMIpYejfEiygK8/IBn1vvUiQtrlp
         yR7GoCUu8LtosOIWFz2oIBYH9sZO3U1TnnrrIKGqm2EK5L0qPNHVFIUmOsD4JkwkzCgj
         /cJrY3sFHyQz4DusZL1fHtuLBw5b8UVPQTtoNcHRzGeagRJhAgIaaaqSkKxA2ryf0mal
         XtT+WkZotBUFNS4hDJ+oivVgmP6RRNwOJl5TO5xIf/BXFqVvhvyBR8ePn9tuF4V4n4s5
         NQsePix3m/QplEFRDNBW2AzSh6UVM2L1wUKraim4QKsqZLloPcgxY4OE2AGgPZ3nU39o
         xaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935734; x=1795540534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jShjFF4Sq6gPLLl5+8nJzOEA7mRuIBIl4olxLWqQ+z8=;
        b=kX+9YLjQckPEElJBxw/Fv7/vanYvtjoXMjt36xtAgHMGEWmJcQLBmg23pR5bVdyylh
         6Ft4n8oUKTheArgHfdub43HfFat3YTP8xjc+8Vuj6eNWtDKVfhKHHG/h0BHKHf/dFp1U
         YPF2po6bA7CzlDrV3+w/RPYrXY18Xki5+prE9MjWnaqfoEgnVHLjpG/sYFNSHznCnNZ0
         RicpOjLF1f5NMf/y8FZkByN1r3CU3cVjIx9oQf0gYq7yGl4/NejHOMOnqbCXAGykU52s
         4K2ze197Q1dHLoHqklB4HOXTkAtKyZRDvUcFh+VBdX6maVpmHHAGxk4wchVtsCmcXBK7
         YLOQ==
X-Forwarded-Encrypted: i=1; AL+hErEVEzW0vS/eULwm92CYVFpQ9LBPjFKDMITkGDtJB7siEnQlrh+748muTaTPIT1UEgikBzJFRYjNs1V03kQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EbHXbpoXlhVwxo0ipD9J4t4Xi25btT21E5jv9tPNIPie6bLAs
	ZF/sdCPeE1G3fUnum0uesTnSJsu5hwb9SEGw5iHr+KHLkoSEI+Ubqykr
X-Gm-Gg: AYBFou2pNEOekRfCZkSiIzRq9qiMOMMm5SM0Nz3EQq69xYUocX7KL8+PHuiiHI81ihI
	0uLV9c0Rn/lk4HnQDT2GLmrxnfS/CCnlpIYoqcitNoH2iw5fClG+YFHaHQFxARWd5eDyPZHa36S
	HvRAok9ibtSEkjxm+9J+gf7OxtvJ+z7EQLRYuk3vjLsawU6W/9Lby7pl7r93w/M4+n58EnpFP9m
	YdUxJF0TFcoECtEXlDo6qatfNgmridkxmAO5R0Vvh1ztzX/s6lvwvBn2jOGZLBAUiMI4iCpDzE9
	2pFbq8kuFw1E70E4rJiSSlFBU6lepqFl9+HOob2E3klJUGJ4q33Lm+v6eMSg74pp/kXhjzoETAm
	vHL6gKItg6rzgp3cNglhg0nS2jKiryxB6kUrjFQE/dEDYl5DOFl+H0JHeP2AZ6HjIR1IPqX1Y22
	EAL3Izw0nB9i3AU3Hac++XOy0JySXjAIm76c/jBXA4NbfZ+ltNqigyGYK05mXb2C6ezkWnHb/1Q
	9Af5E9IzjpSQY+1qqP2Y+nfdoMLyRJ+u/6KT1GkXdoCd7EFoVqZIOl0f7wgzmHxXzFp107ayH4P
	R1tBXq3wDWvtVh1Qrqm1cA==
X-Received: by 2002:a05:6820:2203:b0:6cd:3ffc:ad01 with SMTP id 006d021491bc7-71ace39b3b4mr7492285eaf.81.1794935733793;
        Tue, 17 Nov 2026 09:15:33 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:15::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42cc12dsm11351357eaf.7.2026.11.17.09.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:15:33 -0800 (PST)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: dsterba@suse.com,
	linux-btrfs@vger.kernel.org,
	mason@kernel.org,
	osandov@osandov.com,
	josef@toxicpanda.com,
	fdmanana@suse.com,
	boris@bur.io,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] btrfs: fix bytes_may_use underflow after a failed tree block allocation
Date: Tue, 17 Nov 2026 09:15:26 -0800
Message-ID: <20261117171526.1083793-1-vlad.wing@gmail.com>
In-Reply-To: <700e302d-c85e-4bd8-84b1-0e6eb8565740@gmx.com>
References: <700e302d-c85e-4bd8-84b1-0e6eb8565740@gmx.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Nov 14, 2026 at 08:05:47AM +1030, Qu Wenruo wrote:
> Can you simplify the commit message, not only by a little but by a ton?
[...]
> To be honest, most (if not all) of your commit message can be extracted
> into a single call trace graph:
[...]

Thanks for the review, and sorry for the overly long changelog. v2 will
follow with a much shorter one, built around a call trace like yours.

Vlad
