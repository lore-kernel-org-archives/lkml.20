Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502978;
	b=uDwEAlylmdj2J0EsH009f/KKrHPMoYto5SwfnFGM3tpNZG6F3W0NBhzDEfpSargZa4Te
	 EtuxomkLuCaZwO011CNqWwDQn9nOULGuDhsoNlx66XvGFfRSu5hQXNrfXjqUuNt5E7+vA
	 vzz2xu0pG4a3H2R+k3lrcOhVFAm3r2d+OKiRCJbHgq+F4Eihl2zBfLXm8C4+ihDxYWuGV
	 x0grfVqVF2iRj9bivWzVPAUnvdLcymwLrYac1lthP7v44PTWoplPj47bNOqRWqc4ixHDJ
	 wg0PGwIvaugSXbWTb7YKMXYdfu3FNZPUPlQbMty9vICDceSABGBcVEcfv8iLzHPHgDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502978;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=y62/TFsNcY79K35D7RLsZBrGqWIZx2AhdsHxBeOjheo=;
	b=MGAI5E9UK/YrrWKuVvAjF9Xdb9yhXd6i1b1k38EGFjnqFihinmpG4A2vV9xfVTL58sSK
	 IuaVmOiI6ywqDwSxQcy/UDiH5XJSAMDesEiMcw97c4j9pn5K/xeUXYidZ/0YWen/RMUZY
	 DEhdBuMdu7y0l4TU23YYgG+WQ0Apg/x9NXtzKh9RyjLQtua5Of/86ELG5OTcXoztV7wSc
	 hLjWfpkAGMuGIrSDlCeFzAeynTv4JcRYlzFtT8mYvcSxICIC8EV3G7V8wV5APEb/Uvumn
	 DY+790hgTNPrzUgpV50Qw5M+8d0yx06NlwTDENHN6/qq1xxghRDdUTVfky2Ew3sOcBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cK7SST05;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5C8606A319;
	Tue, 20 Oct 2026 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cK7SST05
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA881F000D1;
	Tue, 20 Oct 2026 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502977;
	bh=y62/TFsNcY79K35D7RLsZBrGqWIZx2AhdsHxBeOjheo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cK7SST05UcxnhpB4lJ+cWFJbwbFSVT0Nw93IVAJuBlGVjwjd5hPCbFIo9WXHQWMCe
	 2LdmPd4/BCzurtCHt4V2cV7es0X+4xOOT9QBjv9Emslle6nnoYXRKUUOeM7S7IyXVp
	 ilKO8q1coG4lJKOWhe3AfwF5mlE0iGZ3avmrvI3zaSAmB6estzo8OrbwSueqPPB+ek
	 K5+GBwiY6nZtMyN2J/HRlUdNMMbDq2tF5VmI6CDtJOse6LE9iD6GxLBDziH417vJfm
	 0qUsezgGgbgB0zaR5jewFafLNB3n2KKLhcdIVoC6dwlrvMRyUnt36UfKwgCj4VSsam
	 /nZLXZ0E+6Cdw==
From: Sasha Levin <sashal@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: broonie@kernel.org,
	corbet@lwn.net,
	error27@gmail.com,
	geert@linux-m68k.org,
	gregkh@linuxfoundation.org,
	kees@kernel.org,
	konstantin@linuxfoundation.org,
	ksummit@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	leon@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@leemhuis.info,
	mst@redhat.com,
	ojeda@kernel.org,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	tytso@mit.edu,
	workflows@vger.kernel.org
Subject: Re: [PATCH v3 7/7] agents: add a skill to write commit messages
Date: Tue, 20 Oct 2026 09:29:34 -0400
Message-ID: <20261020132934.3149120-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0CD32CFD-D3B9-4D48-A5E5-10C092719E70@mainlining.org>
References: <20261016152828.3765695-1-sashal@kernel.org> <20261016152828.3765695-8-sashal@kernel.org> <0CD32CFD-D3B9-4D48-A5E5-10C092719E70@mainlining.org>
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

On Fri, Oct 16, 2026 at 05:05:39PM +0100, Bradley Morgan wrote:
>This would be relevant to kill verbosity, no?

Yes, that's the main goal of this one.

-- 
Thanks,
Sasha
