Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3429839023D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365562; cv=none; b=qvJf5vsOlDHLF8xtdHK0PgRE+kWHnvTp+JLkTo2/K6BiCq3SIf0NCysqA/bIRJw4E6dR0vCiiLOBy0F2YN8LYpHukrib1ZRKcOlBLcACBNHZrN+iE8CU3BuRVDYMCYsV8B2v3rAEwzzCMDWjDHH3xMcfjWh6R+MC+KZOvTYsWjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365562; c=relaxed/simple;
	bh=h5I9HY19MpQ1lCvPUIUC1hs9lEXfo8z79X9TxaWr7/g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cKSxoSQf+9Bbou1xbPIoDkeFtMHHeUfBP1YljPngVIBNVMjilHxPODZ+22UTvTRo9TZXVHvvD1oBlAR1lrQrMzOJ8MLIosMUVPGGAJ+U8pt8XEWhICJigz3H3ztvmhAVtusSUDAU+gYL9YzlV0Ma/6fcjNIZ0904I6vBdzqVN5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYOs2YZu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYOs2YZu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78291F000FF;
	Mon, 14 Sep 2026 05:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789365557;
	bh=HwgDrDnEblWNsNQxUseFgLL3m5bnPaTZRpQzIjhhgW4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DYOs2YZuT0+Mxf3rfQU2AC8D9wUnr9Dv5XkagKJFBm6H/vdGfb4pyryeRsY6wvk/L
	 BMAYEEjQWMOqNvf7kxPafTXsBN4hLTchDtouZI2R5DGxCaZuVdMT5QRR1jU04OGmtK
	 Tj22GgN05jvO77EO4Sz/oxdR+qdjNmxEclHBpLYM7l77sZ3SszCWkeIBeioToE4/iT
	 Q2U0c8MUdjsqSUXkHuZjnoUzLxEf44WnRW1gbpNqlnTjlnmqLk4D/AoJtaIb/Na0bK
	 xg/b7GTDy7XqYcZU86lwN6FEmC07Cx+RDajeIp0Wlj4s+pjuAfqlS1yf7d8KKq3HJh
	 MU/AD5w0odFKQ==
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
 Samiullah Khawaja <skhawaja@google.com>
Cc: David Matlack <dmatlack@google.com>, tarunsahu@google.com, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>, 
 "open list:KEXEC HANDOVER (KHO)" <linux-mm@kvack.org>
In-Reply-To: <20260910173659.1945246-1-skhawaja@google.com>
References: <20260910173659.1945246-1-skhawaja@google.com>
Subject: Re: [PATCH v2 0/1] liveupdate: Add documentation for file
 dependencies
Message-Id: <178936555084.3691424.8106623729087785082.b4-ty@b4>
Date: Mon, 14 Sep 2026 08:59:10 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Thu, 10 Sep 2026 17:36:58 +0000, Samiullah Khawaja wrote:
> liveupdate: Add documentation for file dependencies
> 
> I sent out v3 of liveupdate_get_file_incoming() and
> liveupdate_get_token_outgoing() series to add documentation for
> dependencies.
> 
> https://lore.kernel.org/all/20260820191854.1642931-1-skhawaja@google.com/
> 
> [...]

Applied to luo-internal-api branch of liveupdate/linux.git tree, thanks!

[1/1] liveupdate: luo_file: Add documentation for dependencies
      commit: 38dd32f08d19beb441f202e61d9dfede3b7f055b

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: luo-internal-api

--
Sincerely yours,
Mike.


