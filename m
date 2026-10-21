Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591325;
	b=bM1H+aN560UfPpttagXmlKBpsf6g/uJ81yVWdYAZRbxpz+aj7sK74LZ2IhQtnFYHuJAq
	 xpV+szPy50rDDI6SLnNmmpSC8gE2CnWJN54fONdhX34Uhpjs5p3E2NWQUowL2uxEEn6gR
	 oLuKe5dD/nAgyK3Ctjzr8o78ZHnNUmvat+WhayJ9KS3odhEB7WV5NgsWh4zYvToOnT9l5
	 qfk2SP2mVRUE+6Q4gWshOfdvcjNgU6ZgdFgZVJYgJNfc8l9jlGhCr2xW9cEgPDkLlg86e
	 8Z+X1aB9RuTAMh2IIpGJq4tVDboXrkyWK4xiZyz4QhTj1dAtM3MUM5aX392bYpNozeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591325;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=y8EXR/mN2zgSZu2NIG6Gyr+KRwV6cbuWGUZVTS4cmy0=;
	b=QK4zJLLr2NXJ9QP3sv43CkD8Ruk9dVzdAF8rXapbZ25l2oaibXcvjXbegoy5NE0j70gr
	 HchdN7yInSwZGhDEKSphZAahESoFT4lSXPZG8qWBP4zxkosOBAhajIcpDWs5RaATxvvHP
	 vGPgMQabXqvpm1w/wnXglmXmDVA5PSGX0UvMm0KRUEHpol6C3jsEkbawK5ujaLF72bfzz
	 Y68CZ+048IlemtNG/JAYjwYICHIbHjRUsWU9/tbJtbEdOFg0xYyTIL1yc0XKfvQ5Qm3Zf
	 6uoc91OaTBhj7DJR5PVyTtnB1JggJVwMu0/c5K+1MmD/uoc50aWBjECXlKq9uyGtw8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=apTt82Jm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACC5606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=apTt82Jm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8673D1F000C4;
	Wed, 21 Oct 2026 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792591324;
	bh=y8EXR/mN2zgSZu2NIG6Gyr+KRwV6cbuWGUZVTS4cmy0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=apTt82JmS7zwDQYm2ZYDb4s1C1m71P1mgN4AGcA93ZjXP0Cb2eXr++ut1e3aTAUmX
	 TgqdcanTV3pEAkqZeumtUcQxSunTk9M7BUoVjNalajdwXRLw5MICz48HqwtGSNHNSn
	 0kxw+86W4YOOe0wVYAOti24wjBL1N50etuv+E8xJaxXjPwKM6zKLWKw4eRLB6mU/Yn
	 vJKuWzIyPdPOJ9Wgzx17Yk5y2CETHzWPBmBNusGhQT/Mt7cNRtJw9CoqjGT/2JnHCz
	 EEk3OeM0lqAQmixQTKdjWdu+ioidRxej980ZNlAeMJDrAMhQviYdq4st4FyN9cO6r3
	 ljbGtLjM569OA==
From: Christian Brauner <brauner@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Jeff Layton <jlayton@kernel.org>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 Serge Hallyn <serge@hallyn.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261017033538.793280-1-nickolai@csail.mit.edu>
References: <20261017033538.793280-1-nickolai@csail.mit.edu>
Subject: Re: [PATCH v1] nsproxy: Fix cred leak in the error path of
 prepare_nsset()
Message-Id: <20261021-tendieren-abwinken-inbrunst-ae1779c11ecb@brauner>
Date: Wed, 21 Oct 2026 16:02:01 +0200
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-3d1b8

On Fri, 16 Oct 2026 23:35:38 -0400, Nickolai Zeldovich wrote:
> A task that calls setns() with CLONE_NEWUSER together with CLONE_NEWNS
> and at least one more namespace flag leaks a struct cred (and the
> user_namespace, ucounts and group_info references it holds) whenever the
> call fails at the fs_struct copy.  On a kernel with CONFIG_USER_NS the
> leak is one cred per failed setns(); under memory pressure, or driven by
> a fault-injecting attacker, it accumulates and pins user namespaces that
> can then never be freed.
> 
> [...]

Applied to the vfs.fixes branch of the vfs/vfs.git tree.
Patches in the vfs.fixes branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.fixes

[1/1] nsproxy: Fix cred leak in the error path of prepare_nsset()
      https://git.kernel.org/vfs/vfs/c/486e02e391e6

