Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480145;
	b=kxIH5570NiXqrkglcE/zHLYU0p0+jGZZLhHqv32le9NSmZ6EQTmr9E6Xrm8hklQDZnk6
	 HMnjPG+f0AfFzYIleyfJvrsumMoM33z/4zgpa6fjENOKTfUdcT1JcwLiB8+Zi2pM722hQ
	 6hbp+bsobhYuoJ6fGG8d+Fd648T7/sli4UzcdikMJCl4MKklkJJ8XLOxvF7BjRAJjU/10
	 TVr4zxVXkvGVlarcvP2cr5Ua+1mP8WyNo7BVtXmCbpEXJFCV16bvukW8RM2A0sPzTL13V
	 9UeeDdf/r3lYtVC9fBfNJjJDNylhgMPg3nbX694sDQvdD01M4OE2q9z1VvGPyEacYyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480145;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Debian-User;
	bh=z+pdkc64KaJ1jMT3DWpg18KhwcKEvAJUMBG4qqLBy8w=;
	b=CJFYIlVoopl//zUPFXaKPtDez15zSpG/sFsWQZBM6REVqOXAEBRvb4tqvlfmH8HiSJsA
	 d07snEU5WkpCBaAhCpnontuQkHZnPIhc5goW2zLmsTyj2+1BcL4BIuCMwvMt3c8/QyJtQ
	 jdD/wEovil+TMopVjC9nT10q46pUQIVcXa01dGut/5p4j8QHDxgw7B9H/zBJQf+Gm1rHy
	 i9/UWHJJw6yQyy2RE1lnj93YhqgOHrHZlLPJks9woQzeES0w+3XVugdRdhV3LU5vKjQVg
	 yx+5k+zpKbtvmV6+OIyMUxmqxTITuPChB+f1grhBnlElEH+6685gFOO6NO7yeOdP7WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=ouuC5AAr;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C6B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=ouuC5AAr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=z+pdkc64KaJ1jMT3DWpg18KhwcKEvAJUMBG4qqLBy8w=; b=ouuC5AArnaXFNlnK/lfC9GQuKq
	oG0TabC11uixH1nBTT5shnqgLRuTC3L7V0r8TQZqXt0N64C4b513oTgW0T48QZR24UnQXKldgf1EB
	ahqEyebLCX66rRPSxL6V8clGzvg88w8c445WBM28z+2A2vZMEgyvn7NQVP0aiNfEKpTlAUKj3cOP9
	rGdyVjBWeapHEzhxifG5G9zJNttjHIljnXYrH/DrtSj6HrZXUkmBBDP+s3HlKoqPxwK+eJwMGEJWZ
	nyPNpEyVEfSY/YBKDd80JXwZkg8RTvnn8IqzLcjWu5oxO8WAGaIZi5J2wABbOpdu7Y36hhDsgrQPn
	fLG9X9hw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRSFx-00DuFT-0G;
	Thu, 12 Nov 2026 10:42:13 +0000
From: Breno Leitao <leitao@debian.org>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joel Becker <jlbec@evilplan.org>,
	Daniel Baluta <daniel.baluta@intel.com>,
	Breno Leitao <leitao@debian.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] configfs: lock the group inode in configfs_unregister_group()
Date: Thu, 12 Nov 2026 02:42:04 -0800
Message-ID: <179448011404.4055999.10507645600340773661.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-b4-configfs_unregister_lock-v1-1-040529e5c509@debian.org>
References: <20261110-b4-configfs_unregister_lock-v1-1-040529e5c509@debian.org>
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
X-Debian-User: leitao


On Tue, 10 Nov 2026 05:37:32 -0800, Breno Leitao wrote:
> configfs_unregister_group() detaches a group and marks its directory
> S_DEAD while holding only the parent directory's inode lock. rmdir()
> and configfs_unregister_subsystem() also lock the directory itself,
> and configfs_detach_group() documents that its caller does.
> 
> Operations inside the group depend on that lock. symlink(2) holds it
> once the VFS has checked that the directory is not dead, so
> configfs_symlink() expects configfs_get_config_item() to find the item.
> Racing it with configfs_unregister_group() breaks that:
> 
> [...]

Applied, thanks!

[1/1] configfs: lock the group inode in configfs_unregister_group()
      https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git/commit/?id=2e0fad9d2eae

Best regards,
-- 
Breno Leitao <leitao@debian.org>
