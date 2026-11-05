Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904378;
	b=DPnrJ8k6Mf8kvht+Hq5rhZsw8MTZJ4VhodPduMVaw+B2kNrgOUaGoTulV+CH62ldheFb
	 tZ2twaq3/uURoIKBlTPLOHdD7oa8kEnJSex6gDhxQNi9uqDIARp7XuABFw88BFjRTeaXD
	 YKoSbudKN4xTmqDX0/xpbMUVQQCMZc9JfrVqRy5IXmgnYvBn6xsxkzkELb4Dg9TnUG4EV
	 UYMF+J2RuOYX2SgVv8Ysi9cZEpF7O2kAOvtA9u+5JIECuBf3JdlrjEPYokhi5UTroVnY4
	 0Vj6Gpx2XOVm2u8dfsrYRQiAj8zf4fICwik46xmzODHQ1KTXgUx5krbkpouzTWIayRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904378;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=OGBXiISFQJNpXMcFIvcZoWdT1NviZwaZmLgFctGBVXA=;
	b=nZd2RBBe9X/TswJinpeAZkbcPpaE/NAIPEodvcL6Y6Q4olRSakmPyV3aDaThKmAhTo5n
	 tkRT9b2m3hCZRSTQazLKjulhIHZVhr6smRdZdiJ25dxAhWflcNMqFcgcvLBZLTKYER6gp
	 gZj276tNuO0lRW+TdSv0M0KFPW2NXDxY4OMmCsKVIzSYzw7NZ+UMY4F8E0cH/zVPeMgPA
	 SeZxSbroflbEVtcwzufHhjd1FWStJ8zqbEtIpS6aKNCBHwT5xmq8Or/IYhoBfsSMau8It
	 yczU4nncLNkI3EAYuIv1XAecamFQKcBw7qErOmo7zcg5hv6GJwaeDh87h35FMNuc6Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RsR0gdNM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9815606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RsR0gdNM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4423E1F000C1;
	Thu,  5 Nov 2026 18:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904377;
	bh=OGBXiISFQJNpXMcFIvcZoWdT1NviZwaZmLgFctGBVXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RsR0gdNMWA2+Hh13K1JImi7Ix4m6oPKIJqQKJ9musGyFXT1+Fjt7CDyVFz7D79zPt
	 0EH37aMx//RPtNbmSYG69WaA7mtvBvnG0+PCXQ1pcaebPu3mArfuUMfDvqL2fgKG4L
	 B3qKtoE/erq9+MTqV0DUbVAC1wgMn5zPUwQEDSWdd2THoDleUidgG4iyShSkRGdZGs
	 4t5ucWe7GKgSUVKAqrimm9byiFzTF6S+NiI0sYtk9Ub+cYeeXpZMlZFNnQRl3fbj4X
	 plDto4ILvOcErA7ZBG0068OrG1sr3BWbycM9sv6IvSAgHoVamFMUXB1mXqhZKBWo/M
	 pKYTa+PeFQLRg==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>
Subject: Re: [PATCH v2] cache: sifive_ccache: Enable all ways on EIC7700
Date: Thu,  5 Nov 2026 18:45:55 +0000
Message-ID: <179390433157.1480517.11122116729400118033.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023134801.108890-1-pinkesh.vaghela@einfochips.com>
References: <20261023134801.108890-1-pinkesh.vaghela@einfochips.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=656; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NuezYmKgcL2Dr2rYuLWBXyuuiVgm0TOQRxVpctpRhWo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzj2afNHllVJAT5djSN3c+przQqseMljFFv9Y7eO9U ZzrdXdVRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACai9J2R4WmayqN/ymr831du uj47ulmHwWqC1VZe7do3a+9OYRFOnsLIsKt87/Oy/7eC9cWdRH5kT8/JPOKkHXjuSW7sqYY3h5P SeAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Fri, 23 Oct 2026 19:18:01 +0530, Pinkesh Vaghela wrote:
> EIC7700 firmware leaves only way 0 enabled when no LIM is reserved, so
> Linux can use only one of the implemented cache ways.
> 
> Add an EIC7700-specific quirk that reads and validates the implemented
> way count, then enables all ways when the cache node has no
> memory-region property. Leave WayEnable unchanged when the property is
> present because enabled ways cannot be returned to LIM until reset.
> 
> [...]

Applied to cache-for-next, thanks!

[1/1] cache: sifive_ccache: Enable all ways on EIC7700
      https://git.kernel.org/conor/c/4d61dc7a31fa

Thanks,
Conor.
