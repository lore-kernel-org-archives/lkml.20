Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062788;
	b=GPpljwRq8HcVs6gG5l5imXieXYUgm+HBqsU36NWfJcDrESCT0CvifUTRlCqBlGes6+XB
	 Xw7IuSFvFNAw6KkrrEn7b6LcVdD5wsI3kRJoNslkTvE190kL7hIgCllb8BLXVi1B1VYMs
	 jGU7+DKGiy7LbmYAu49dwcVYtS+wbLUj6Y/dDPcwAd4OePeoY6XT2bVHri4r6RCDKRlqL
	 gQJ52/VTND4Ymj95bQI/rFnTCXQ8z2uVpDo7d8EH3SLMFOkxMvHpXLvb+JyXPGyz7hlfy
	 XBU8Gl5pAzGra6ioMzUrcQg77ol3BuQah9IN8NY5b6dgDTg+dMPLyDmtQ6ZkEMLGn9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062788;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9g83XKjzZTeyLQGk1ow/bSkcIG4drLaeQk6IwDzT3zk=;
	b=I4+EIFgmttI7T6oOE/KIPXAhK5X8kctieiQROI13RIGt4ba8mPuKe7KIIhC9NR/BS0fF
	 TLI0xr43xgHQz/+yG3kFWakv81hoFxvI6HuI0l81jkSp+X3/7j+QxeCjoJYJTuE+U9jM5
	 oUVmXyB4hsDaIh6LvIGrkoEusIPCmU+sGXWJG7f34ZHz9qqrzAu2d1DnnWe2o+jEz9fk5
	 4H2kfTiqX6PYuczwmxcTm4MRKr6kjqfIoJpqzpJtAMP5YN1nz8Z36PAdXPn7+0JIPcOyu
	 ZDTup12oMKs08rq8QDSD55lYS3IV0D7cVr9yVHcLZi0QhXyvJ4OnnsT7FM8d9lHv8pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8gT+Gu1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47157606A32E;
	Sat,  7 Nov 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8gT+Gu1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17691F008A2;
	Sat,  7 Nov 2026 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794062787;
	bh=9g83XKjzZTeyLQGk1ow/bSkcIG4drLaeQk6IwDzT3zk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=P8gT+Gu1GC2EG6dx1GhPwtW3AQ3Hi4q1a36yNnYxJl/OLu+iwpl94Wvu16pzz0G/A
	 5QHRXoCjGTyAHWAlVIRj98TndteskmkU9ucNAkuJF36AxYUeGYbAUQTe8OdF5K4UiL
	 pahn+xp+m05p0CjJh06nXEREjaFb3fMbi1ZMVlNo49jgBWw/AkyMRL+s3d+PjhRX5h
	 Na5H8YE69MmuwpLVZaTe/MCkaS87gOn3m13CsP1Osfw6jm27xfKQXkQ++I+SERHIFo
	 ++SHDUAunAnEGUakSOBIeOQk48QsBUUnwbfJs0C8JTW6b3hR6hRPlidwKRAdEItGb/
	 Fy1Vj7ZsEuG4A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 99A242A4C627;
	Sat, 07 Nov 2026 14:46:24 +0000 (GMT)
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
Subject: Re: [PATCH v5 0/4] ASoC: cdns: Add Cadence I2S-SC and I2S-MC
 controller support
From: Mark Brown <broonie@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
 p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
References: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
Date: Sat, 07 Nov 2026 14:46:13 +0000
Message-Id: <179406277372.3424803.9881358554237732478.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=346; i=broonie@kernel.org;
 h=from:subject:message-id; bh=u/N0h64SRsZ/w9k8PNo1ZMh550o6eRNoHATFKEl4ACw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeW24/fGCKxyxVjrqtvQcjGH5M0Np/ZGbm/mc7+efaz
 rmlMDOroqOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQAT+fSb4X9i9Bd39RZRjiPy
 GhobP5WWn5403+JC7uGTC3W58h1m/vjAyLD4Kb9I66wH0THzJ+x/FhiWECJ5dOUqJVftsoaqPUk
 vGDkB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> This series adds support for the Cadence I2S-SC and I2S-MC controllers
> integrated in the CIX SKY1 audio subsystem, together with their DT
> bindings.

This is basically fine - there are some smaller issues but they can be
fixed incrementally.

-- 
Mark Brown <broonie@kernel.org>
