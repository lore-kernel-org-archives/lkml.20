Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243E435E1B8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788564226; cv=none; b=ORhOhidc3y6JWHsM/VLKZSIMja5rYrXATpQt1Kh1/7sYJmvl+BQrbjtfMYcXBbLm12EWSdepfHHAC5und5VuLOA54ToIEcCi8cEFDazrOU8hYuVtBMp+0C81raM+4r28+8Z2EwQLCpN3mBDldjYk7+mLCZSX/Zlj7ZzKTXijIPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788564226; c=relaxed/simple;
	bh=1D/6Tr5xBcXUuHizxCrM5fO+eUcmJoNR2aK9tSGyl/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s8mcADI1EeMH2bubjHvFJk3oQarEDc/NBH3dffMOBcr+E2jeL9hfu3cLX4Z9nAyhdR+jDL+0a3Y5L5mOzKaOERiDVPy8RQ3A4zeBLO5nzZTbHZSetjKtUfUb7wRSXOvdBczw0lqS+mwfMpEOkQDH4xAj38APUqCrUaoieO1y+qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=everpuredata.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=yAE/0u7+; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="yAE/0u7+"
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-8485b358552so1358622b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1788564224; x=1789169024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1D/6Tr5xBcXUuHizxCrM5fO+eUcmJoNR2aK9tSGyl/k=;
        b=yAE/0u7+VHGr4bWCbQNrzOItj33W7N4Ee3rgPgfi/NnNKw+gYNmyJq2lHHmN3sYeHe
         Q1Dcm/52Vb+E02e+3DQbMRaOP+JPdOVFYG9tCL3NTjqjfTdF20tJtbCf/rltRTykSCXP
         qfULlKkb/ljU8wRa/Oy0bZhOcqEOaZYohIDCLW5LfoDrYpkzR+D+rWCmn3SbKSa1uL2t
         1bS4sPJ0Tq1C25Skc+Pq5qBZVnUJWN0urOdSDND4y1aV8rRww3bDYdbwlflanwa67mGP
         AQ62U+H7Spc7pfbS0NEmODLfl4nob17Vc7H2T+oQ4j0BBrtzMohC418QFNNbWzapLMYZ
         nqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788564224; x=1789169024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1D/6Tr5xBcXUuHizxCrM5fO+eUcmJoNR2aK9tSGyl/k=;
        b=P6e5RLT5Db92ybHgomcx274cIa7LDGtsW2jj+4rU1LZS1f4FPtBR/z17RP/LUcfqcC
         uOA2NDiwXdAEaqR8cwz3f3IvchaZZqtXyYKhQLx4xWsDsg6DLQz59q0zcZeBdDKoBXlS
         a1dsIpr9dWNn2XhvlZHLfJUN1E9bcic/JmeOQ0TaGyFJCLOSXdykI/o13iO4INCh3qz2
         fhgW8K+zpsSww8pW3VNLuWQLFK0u9ICkrypOuuxuNxl1NozCH7t5Xfr+NV/MKDpmrK9s
         sDtdOkkLgctgNVLCusnvfqjolT3JcOiBcEbgCkFO0LjRC3UryMjrsZN8u/xB3VfM1uXx
         MwFA==
X-Forwarded-Encrypted: i=1; AKwUvBzP7LAA1cI+muM6DGTkCeN7M0EfUh2MLrGUypVUFDFi4jT3gW11PDXSv54+pycsR96bJmJhPkl5ciUzZ60=@vger.kernel.org
X-Gm-Message-State: AFuF++n0XqQqjh1UFpnQgOT4n9OCvcdS2Yf6KYMCpskZScbNTUPKewKz
	AoefXD8/VPk8ro5ncoQ/gg9ecWyw1OU8c/TUiSPpxCdxDEir/PQe/aXq6WqdKH6y9xgWTNihD91
	v78g9xvKYlsNJZjJtWd81Mus8O00FgQFkdHNO
X-Gm-Gg: AYBFou1PNa6Kx2O7Pv4xCkET0bQBDZHgIakpMVf+dASWtKoChpT9MdYT8r0k/+oXM3e
	0k/Uv580hnCEGg57m+qsWBg/TRmyCObqg/JIeKT8/GgblvY5AKi/1EziEH8yErhQG7d8Yx02kVQ
	CliVdm2QNHNB6NnbK4q866LSMwvn6+FV2oJiCBLh8B4Al0Uupct1dBll7eqi2LZ/qogZgAwFzWh
	YamJzPvHPHXlvd18jKucC6/QtKMa558CVT63yQ1wyR9Yz0xOVZrVeHnY7q+2HLSEO02hKxs3y63
	I6F+bmEUF8AbSQizd+n1Hz1lwCYTg5yFiC2U2vNVtXXoOVjnuBVVzIVLcXbkYG8iXtnJN74JNRI
	3RIut7DFD1Zlf7eE+fKOKCXyW9U5K2sHaKmiES4E=
X-Received: by 2002:a05:6a00:2c94:b0:848:3f07:c5a2 with SMTP id d2e1a72fcca58-86167aab584mr11848768b3a.4.1788564224491;
        Fri, 04 Sep 2026 16:23:44 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-86150750808sm1257514b3a.4.2026.09.04.16.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:23:44 -0700 (PDT)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 0239C340200;
	Fri,  4 Sep 2026 16:23:43 -0700 (PDT)
From: Tim Menninger <tmenninger@everpuredata.com>
To: Chuck Lever <cel@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Badger <ebadger@everpuredata.com>,
	Jon Curley <jcurley@everpuredata.com>
Subject: Re: [PATCH RFC 6/8] SUNRPC: Reduce rpciod workqueue contention
Date: Fri,  4 Sep 2026 23:23:42 +0000
Message-Id: <20260904232342.1907377-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <336623df-ead4-4802-91c5-aa3e785f2971@slotpi15m67>
References: <336623df-ead4-4802-91c5-aa3e785f2971@slotpi15m67>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I realized the bad state correlates with where the RDMA CQs' completion
work runs.

This client has 16 RDMA transports and 32 CQs. The CQs receive 32
consecutive completion vectors out of the mlx5 device's 63-vector ring.
Depending on the global round-robin starting point, all 32 CQ workers can
execute on NUMA node 0, or they can split 17/15 between the two NUMA nodes.

On unpatched mainline (940de590b839 without your patch set), I tested five
consecutive allocation windows. On three of those, all 32 CQs executed on
NUMA node 0. On the other two they fell with a 17/15 split. All five
sustained ~46 GB/s.

With your v2 applied, all-local windows fall to roughly 24-28 GB/s while
split windows sustain ~46 GB/s.

I also tested this by changing only mlx5 IRQ affinity. I redirected
completion vectors 20-34 from node 0 to CPUs 24-38 on node 1. CQ allocation
windows 5-36 and 6-37, which would otherwise be entirely local and slow,
then sustained ~46 GB/s with their CQs split 17/15 across the nodes.

So the CQ allocation determines whether the regression is exposed, but
mainline is insensitive to that placement. The series introduces the
performance sensitivity. This also explains why v2 appeared
nondeterministic with respect to the rpciod affinity scope alone.
