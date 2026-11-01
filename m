Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793574060;
	b=5OJgn0vHfGJEqo6aiLvFycK4wBNaOfXpjsuv+oxz/pdCUeCDT49v0rM4R3aZzGmCM0FA
	 DGN40Fkvo4KyUYZMPQ+jT6aEB6ofBGsqKjjnUM/ec9V7/b44JvyFccdS3mi4rVa0Y56hB
	 hlgGbRUE20dk0PffarqeGp9EKpcklbi+d+WKAwqd7SmruRI7VK/ElXM511di981PyH8z1
	 vIV1j6fQ568DKVBHamlrP3GfOR8tvb3CMhhJeqYT2qwiOKbLU5r9d5KDyeXb0JwDmcI0L
	 VzYp1dti1J+ipOYd82yFPkMnDt5EtCd1y0Cjb0TMl2K/lHFMIa5LuTHn28Rul9SHMcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574060;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WX2F145DmNnWNKyO8kav9VYCsTOxrh1LqXN9CUJ8PfA=;
	b=0MyWZVh25X2zYHhfPp89MimLQM6GLLWekL5hVWyrs2sfzjYZ4VoOBmTJpHc8A++SDvJF
	 MuNCWowypxXzXYAFVkkoen/B0Tz0Bh/DPfgdWYibX1W5gmxVIr3pj6zVbxWbkoPgIXPR0
	 cT+wIWuQlbuuxY3BH+JIvKn7CWJe4NPr2LfOXwTcwjbIq28WDA454gHS0a2jy9HNiGCZJ
	 YnQTPgh8rhIEUzr6Qd1IfyNZYjeCDX/jgGWd07VBvnNK4Fy6vhDkSGXgVpYPkueCqs1m/
	 Aibe+4k3iL28woVgU5EXHXHqac99QOYDidPlh1Byw2fdODvvE34c/EAAZV+wm9/pIMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fgM9SoY8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C7A606A324;
	Sun,  1 Nov 2026 23:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fgM9SoY8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769DA1F000C1;
	Sun,  1 Nov 2026 23:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793574059;
	bh=WX2F145DmNnWNKyO8kav9VYCsTOxrh1LqXN9CUJ8PfA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fgM9SoY8R7tcstnRez/BdlKIO3DCsflQ78QVcOLuZ9R4EzO7L6LbvxwaoyjLxPouc
	 KS5CCaBmwDoDeur7amu10YrRu1EKesjq4HRsSzlEPTKG1I0aKUuV9UU76dCmh5ly/V
	 PF6dmk41Jr3iXgmWOFxR0piK9duLurBzvAmwEdPCG8GhxUl7kLVjG7e4NlaSmdpUs/
	 TjcdBEfjy5Alc/PhRMKhrbU/GTknNoZMHi2rSL/9ld939J2j6VetERz6MQRyRp9QaZ
	 /OOrjl6abKyJCa+zxPMk/wnnz/ZBZJmwTbYnraxK6E1H9hF5SA3DoEVmPWeWq6tbc+
	 +4aYGMpOV7ZGQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id D582E208F436;
	Sun, 01 Nov 2026 23:00:56 +0000 (GMT)
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
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Stop the controller before
 freeing its DMA buffers
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261028144446.992948-1-sashal@kernel.org>
References: <20261028144446.992948-1-sashal@kernel.org>
Date: Sun, 01 Nov 2026 23:00:54 +0000
Message-Id: <179357405490.1679716.7958054921741157139.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=485; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Pg4hrzRr5VUO6qkDDViQ2BcjDmYibLs67oDx3fEdgH4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKeH1nx91uk7KkZV8N2PH8z67eDptDqLMP8TZt/TRQOn
 qgdrtu9o6OUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATmcLDyLA+icXqdkCU/+mq
 p1+Zv2e8KjzNka4U5Z5+27fiSUbhcXeG/7UrO/bdPCeR/27l9InRiXUml277CG9ZNLP9VOap06o
 C+1kA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> hda_dsp_probe() starts the CORB/RIRB DMA engines through
> hda_dsp_ctrl_init_chip(), but neither hda_dsp_remove() nor the error
> path of hda_dsp_probe() stops them before hda_dsp_stream_free() frees
> the CORB/RIRB ring buffer and the position buffer.  Unsolicited
> responses also stay enabled, so the controller can keep writing RIRB
> entries into the freed page.

This doesn't apply against current code, please check and resend.

-- 
Mark Brown <broonie@kernel.org>
