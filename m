Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F397E39A4B3
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.210.214.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789290047; cv=none; b=HVNRRpIQm3XValnemrzeY7di6jTy/EOHws6BQTwL8WlmPLnh8wcOs/PWwfuXnfVsYhTXGofd2FXJ+aCnwoZKfwEsqn+/8SfrlQa1Wkv8OVQtN4BE+gsDcM00sw+NdJ0hGrACbz2wl9cKbK506vo3dWy848eG7A2Z6ziyLcpMIe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789290047; c=relaxed/simple;
	bh=ZnthWg3tr7K1TeAvNey1R+1tzZe4MttgCl5TXKKVQXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eehwOKX7JhhH6GJH9w6anv1rs/UZLznNglOla0OEUqliQ0K6ZKwHV2Enj+x6DentcgrBItCvAiMxAjJTkCnJTkK/ZvQn5b9gswSBrtGDPCb2Z/selaKGrLut8FvNoGNn7+7kpY1JJ3LXmmDpmZL8Rlaat4nMUdjaXB2v1OPrMMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org; spf=pass smtp.mailfrom=codewreck.org; dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b=o4erzm2S; arc=none smtp.client-ip=62.210.214.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b="o4erzm2S"
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 1C22314C2D6;
	Sun, 13 Sep 2026 11:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1789290043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6yA2eqbkLXN/fFeIKB+1tip6C8Cs57+WokGJxo2MfsE=;
	b=o4erzm2Sox5wkll3vOxHG9eJLxzJzXTwx+S6fJMzLkvveIunRhCuYZRS1u3KoSijThK66R
	2PKWh8zKsFC7EQVW++GwrLy7rrAdHsNmmoBHwA///Jup8B+m/+tFByBRxh3JbknklXSMKQ
	Y3wKwdQRCBBD1uenC8kkOIuORqL7k4J5HdCbqrPHwavBigZi+0YldFHurNPp7Pj33VVScJ
	u+YEJczOx7Q5JP6qMhqerEy9swQXN/MTViYeRIvhEpsfF/gFHmTz6R0PbzQ7HMYFukkHwv
	d9FB0YNEX+FuN9vBMdGkrYE+y8QQoXBeFPaO6FftFVY+vyLgkmsfnoGaLsVcdg==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 0eb0065f;
	Sun, 13 Sep 2026 09:00:40 +0000 (UTC)
Date: Sun, 13 Sep 2026 18:00:25 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	v9fs@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] 9p/trans_virtio: reject mount tags longer than
 NAME_MAX at probe
Message-ID: <aqZmKUXnYKgXpniu@codewreck.org>
References: <20260626111906.801890-1-michael.bommarito@gmail.com>
 <20260627211012.4042372-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260627211012.4042372-1-michael.bommarito@gmail.com>

Michael Bommarito wrote on Sat, Jun 27, 2026 at 05:10:12PM -0400:
> p9_virtio_probe() reads a 16-bit mount tag length (tag_len) from the
> device config and kzalloc()s tag_len + 1 bytes for chan->tag with no
> upper bound. A malicious or compromised host can present a tag of up to
> 65535 bytes; that tag is later copied into the single-page sysfs buffer
> by p9_mount_tag_show() (memcpy(buf, chan->tag, tag_len + 1)), a
> host-controlled out-of-bounds write of up to ~64 KiB past the PAGE_SIZE
> attribute buffer.
> 
> Reject an overlong tag at probe time. A 9p mount tag is a name-like
> identifier, so bound it by NAME_MAX (255): that limit is independent of
> the sysfs/seq_file page size and is far above any legitimate mount tag,
> which keeps p9_mount_tag_show() safe at the root without hard-coding a
> seq_file implementation detail.
> 
> Fixes: 179a5bc4b8cb ("net/9p: use memcpy() instead of snprintf() in p9_mount_tag_show()")
> Cc: stable@vger.kernel.org
> Suggested-by: Christian Schoenebeck <linux_oss@crudebyte.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Thank you both, I've picked this up for 7.4

-- 
Dominique Martinet | Asmadeus
