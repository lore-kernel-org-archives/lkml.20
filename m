Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107765;
	b=EZfqWW0LgpaS4reMNZeIds9tYvFnKw2UaYW2hA5Xu/5V+6YNOnQZvVi8uYcioozmezzY
	 uad//9lZwMYFV0bfxCnZ8MgKVosPOoUqZk4++O0OCiNcW/sl9B6cG+Zhk3VrtuQfv94iS
	 3/mCyxvEsdx/oz1YAI3XS3gqyGI0KcthspwdXiOY7lhGpLz8hy7XjADw8bLdBqN9I25o+
	 23Mt7js33wtId9dKP91vEL7kAa+nTFeDituOo1Qhcktrvu/viepxJ23mjVEWj4XPgKCGc
	 5QY8jCpNhVSpQXM5jmNfltpck+QALkKTUzAgy4PxbfwtPcL8PFz9Glv952Xn1SseF2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107765;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Debian-User;
	bh=ItpFJIoixTUsO2Cug7y0WVzTGoq08vYriu7oet9iQnc=;
	b=3oAdstyW4mDYWmIVdnZE4a8Tt9qIrhCJd9za/1nof2Zb1KiS1OBlhLJKSIFbTFytPmFe
	 VRgp3p6VG4rXG2hQLpretzfIcQTBczSymEYZ3PPU9RhtHoN9CLvAT1hJNMi73ib8HzzsV
	 fSyvqiGNcFgASoEPP7IkhOBgE3jMVodPEEumNdTf/ZoXtsHsWowK0lne7zl2vF5U2tgPf
	 yLd2nL8c3qIu0FHumubvmvxCU/ztEa3hBIrL/KAHxC+tipgSYglUULzZ6K4aJyKXuoUdc
	 Cqa2OajAt1d9yXngvGhEDvVYgGN3lI3DZZHcAwzOWZyL8etoREQYMdNWoOpKcwTYWVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=n7yRjTye;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5B8606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F5B8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=n7yRjTye
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=ItpFJIoixTUsO2Cug7y0WVzTGoq08vYriu7oet9iQnc=; b=n7yRjTyeX/juZiJ9tYelbHo080
	DYxiqrZTsOFNIw0mSfD2XySlaMjJi/gr2YpJPsv739HzpioC/UrNsInb5v4XRHPHOHkMxegIz9sIf
	8sCBzj3cDuGgaT47Lb9Ir4Ah9s5mqcVBZxO2vtCNRwZvpDH4oThVLF7gS5y1udL+GrU5sppyLfXmF
	M5XWc5fr7YsnnRhFdZi6i7EHt3V5ni1GRo0amaazT40Z5E/GfYBIk+E+Zwj5CmrU1bERIAYZabl96
	+vnTxX9bntMW7b34z+BxS+Ka1X7vIUeAVd2HFKuw47YnZ+sarhciuhi1xU6rCTaECNDDw0B5E4L5C
	2FjLNw/Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xLhEq-001Uea-2Q;
	Tue, 27 Oct 2026 13:29:17 +0000
From: Breno Leitao <leitao@debian.org>
To: a.hindborg@kernel.org,
	k.opasiak@samsung.com,
	nab@linux-iscsi.org,
	Slawomir Stepien <sst@poczta.fm>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] configfs: handle unlinked target in configfs_depend_item_unlocked()
Date: Tue, 27 Oct 2026 06:27:51 -0700
Message-ID: <179310765197.1583788.9097000584348494794.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022134443.1122318-1-sst@poczta.fm>
References: <20261022134443.1122318-1-sst@poczta.fm>
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


On Thu, 22 Oct 2026 15:44:42 +0200, Slawomir Stepien wrote:
> configfs_depend_item_unlocked() starts by reading target->ci_group to
> find the target's subsystem and the configfs root, and dereferences it
> without checking for NULL. ci_group is only valid while the item is
> linked into the tree: it is set by link_group() during mkdir and
> cleared by unlink_group() during rmdir, both under the subsystem's
> su_mutex, which callers of the unlocked variant do not hold.
> 
> [...]

Applied, thanks!

[1/2] configfs: handle unlinked target in configfs_depend_item_unlocked()
      https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git/commit/?id=d678ac1c74dc
[2/2] configfs: give the root inode its own lockdep class
      https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git/commit/?id=e6f2f0945f5e

Best regards,
-- 
Breno Leitao <leitao@debian.org>
