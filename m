Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513024;
	b=c7/H8Er2PRLpqYPPVay0MOfoLZfB+hunQvH3eJlaH0k8/a/By3RjEouis7EQ5J1qfGvR
	 MVLUHBN2Bn8iTZJqYVpHi5ZMh7RRXnQSV33vkjRxlVRVWT+T/zTz1Gn9OUn8I62IgqQu1
	 gOXOh5KOayfnN0oBxDm904SP5fl0KQGYe7AW0jbLvxO/ooeR6fJFnboOp3GqUO4cJKjKy
	 V5eawiYRPPGGPDLZiztGIMG3R2q0R9nT9hwMbSWBjwh3OdnmdqZ4mH2c0PkyVRaFNLTGB
	 ltxa4X2p8Cs+3NnHaASX62ME7+EX+rqieP3vxpvITLZQu8hJUckV/eSONroGqyJBCSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513024;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=7RGixTCgzsSlxkC99NGoPdbhFp+AvQL9jZysNiju/XE=;
	b=LFgOEYKmCHODGYFTN8xwGGJGEggN+dbv7HnjBYoauKQy0DWJ00TlqG746yFiTjoVOgaT
	 6TZSRGNVcJ+VGWxf3mI8XPiAz0xqE23tvQcsYFakADNzfbRtD1ZDhg13NsxZ2whH3ckVx
	 dKf6wi28/s8bkN3akHqZTvkMbVLoj9jLK+5jaO3iILDxPs7X2sTRB4buXioEWKfw8ujpk
	 IoEjI3IHjREq4mgpKtEIspUW1VZPk4keuD3ZZDAiOoYfHl0k2v4Ee48aTTvovlCkpsVn6
	 sjefkhHCsBPdX6rMyQ/Usy3rwafQxeBdEFJHW0LKyon+FwOH9rCzmF9Z0mi2JbgRFSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vi2XcOX6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947BD606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 947BD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vi2XcOX6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 807461516;
	Thu, 12 Nov 2026 11:50:19 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32D1A3F632;
	Thu, 12 Nov 2026 11:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513022; bh=FZAyPa/YmgZTqYnrEwVqlpbAp2XgXISE2pX5Y7rna8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vi2XcOX63cJmICBTAk87VbYkZgEcmYpH0QO8F2Zq+oWrs1a8JO2Lel1CCGgq2R6gM
	 +nhL2WsOFCNwLwe++RcLrV5Vr3l2Pg2j1Zv/I4kEIyUPT/FVY/DOjUioWjOh+aBjWF
	 L8qnQRGCSCwczSaV9rhHuBiwINTW9eITOalI029k=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Beata Michalska <beata.michalska@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Vladimir.Murzin@arm.com,
	suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] arm64: errata: Update AMU workarounds
Date: Thu, 12 Nov 2026 19:49:28 +0000
Message-ID: <179451296804.3304937.3878967781756339834.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111124005.2688820-1-beata.michalska@arm.com>
References: <20261111124005.2688820-1-beata.michalska@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 11 Nov 2026 13:39:26 +0100, Beata Michalska wrote:
> This short series updates errata for AMU core & const counters.
> The last patch in the series tries to optimize a bit the paired
> readings of both counters, so that the workaround checks do not
> skew the results. It is also intentionally the last one, as it
> will not apply on older stable kernels.
> 
> 
> [...]

Applied to arm64 (for-next/fixes), thanks! I left the 3rd patch to Will
for the upcoming merging window.

[1/3] arm64: errata: Extend the workaround for broken AMEVCNTR01 counter
      https://git.kernel.org/arm64/c/139a9b7d5a07
[2/3] arm64: errata: Add Cortex-A715/A720 AMU core counter workaround
      https://git.kernel.org/arm64/c/be7771458582
