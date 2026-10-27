Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088785;
	b=i9O5jrC6MARmEnaAWN5SIYPBAZCY6iMyEoXuoKdJ74NHBY0mamY8AfuVcfVBFPNIUZ8G
	 6JtS81D23+K7WiYaJlaErz9SbiXlzEW2Q1pQGQCDLa/GMKeDrVzZnCnDyvK/fNQuSUJyG
	 nh/s39p90zb7i2cBc8VEbrNbWCGCU/ikq3J3PPiY/R7dBfXRXtt/u1eC5FBkOeyR6wN2M
	 5JHPQn5jiU7JGr8oyhfq4fLAUbx3xxbi/YbdTLxlfiVmg7L3CUd9EB0RlA9leeqNIE3l8
	 a5iNi5oSkJYrx/5bD28uzxdX3pTQ7LzoS4qx1HxXzlZ6CyIOCjpBDvPM+RjIsQeco7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088785;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=THQua4clYvPNdy6wHNBZuEjVBRJo1LGp3/AaVDxlCMU=;
	b=aJUnVFST3h2X/aK6dPYcQx45cLXsA3Hb1dlBmfgH/tXVn/bIFwATa0PSqE5Kts+geqoD
	 l2ILWjAKK4nG0rzRFBguYwRk1WH+rf55VkjlQx8SgYyv3E/hph3ywLNGNoxuuzGLFCvLb
	 ZwVwjj5sjqeuhbYhT20yCxSyJ6Wgogv0a1b/o659LFjQAhgHwDP68GbTpMoJA9cIpBtyJ
	 FR3VRN/KOyDoYXf0AVF9d0yZE3IBgbaUa8dLcWa21dLzo5B07SiCouy2nRR6nYZs3PTNt
	 PazHOEEfza2lhHI7EIGgoDsKGkP6Gf+syzHbNsOMMmMIioSJt6VgVoz2fEDZSW5FNTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	arc=none smtp.remote-ip=79.135.106.29
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA73606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA73606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793088781; x=1793347981;
	bh=THQua4clYvPNdy6wHNBZuEjVBRJo1LGp3/AaVDxlCMU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OPJbHUV7wYdJ+zGvFhv553AWN4aw99E5Za4NodjVC50omROwPXZh8lJob3nlz5bwD
	 05lsC16l/Ji6lm2dfFe37Ic3FW5rNMew+DI7kPEx+lmRWsY0m70TeEPOAgxlDNbwn2
	 8RYYi7kylWcEDbBlXH3/Z9AuFeamKTGKs41TLNJTfs/gmfQR5uSCfQC/hEVgMmqeEA
	 ZJ5iSlmauNOYZlFqQxSwBou0KwGlDlA96D5IPWN9Rq+JUOh87z3++PVBpk5CFqHyhS
	 P1KbAI0tziaXFXkGOBb0LXqPd6Ym6JNMqbjSbrXijHxAk31A2P5xO/WfwKjAf0Cdo5
	 78Ceyu4CGQTHg==
Date: Tue, 27 Oct 2026 08:12:57 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Simon Kruse <simon0x+git@proton.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5693: Support control events
Message-ID: <20261027081219.27126-1-simon0x+git@proton.me>
In-Reply-To: <at88-MnXMFopRLl-@kekkonen.localdomain>
References: <20261010142042.23253-1-simon0x+git@proton.me> <at88-MnXMFopRLl-@kekkonen.localdomain>
Feedback-ID: 50827409:user:proton
X-Pm-Message-ID: 133e29a63fe6e001844b8505fc18ad25a2807add
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Mon, Oct 26, 2026 at 11:43:52AM +0000, Sakari Ailus wrote:
> Could you instead move the driver to use sub-device state? See an example
> in commit e8a5b1df000e1a23c04dadbe99621441e0889f88 . You'll get control
> events as a bonus. :-)

Thanks, done. The conversion is posted as a new patch that replaces this
one:

https://lore.kernel.org/all/20261027074933.21921-1-simon0x+git@proton.me/

Regards,
Simon

