Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138961;
	b=DYg+FWSgTLJkvbLzc3155dMlgNj0Xm4nJo65LY8FDRGg4ZhJA4cYLLtuHLKgMzWIYICa
	 cUSOnhF31tBg3s0KPjxOeKzsz7rUFGc+TtNGjOZbVr1YuY8X/A7r33egfY256DKlzZZAb
	 2LGBkbFFcOXqMJaekSsoO/BRNLl6KzUTnAt5H5iUg39k8t8q3Y+geUnSN59yS18k7aj35
	 Vwn/GaNPPv4+sYOQT7cqobtDeUrjYys+lWM6Cg+xi4+RtqGOqqmrrTYDE+wAqQam8/zKV
	 v66SrtDaxWKCge59WqUzoBg+L0nF12slPmOgCL6vrLjZcBntQ86cti00VFhMwaXZT6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138961;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Dnv/x81d/ZCzqBnld2QHSYQVh99f6DhnYxfPhIGXJh0=;
	b=m/b3pYagfLOFFjXcD/P3IUgkhgBGiPoXB7AHP3DOLz2Wc5Z0A/X/4yuDyUW9PjQl8PaC
	 XBZtvbrhT3zUXUBR4qqQkKOS74vAtyxHHwXcQt43hTTO48kPen2X5SmNNWenA8k2CHRkN
	 z3OmGPEQiM5By1QpToDfYZ7hdAxJQ6pkXXjKz+RM+BcV6FUsgn0QOvXnH4cibF0AI94lF
	 4tckUnaMFZPDjM8Q9cBH51P4s6zLMKKcxhAX//MtnyKLvL2MZj/IoMVaruDDt///Pcl4H
	 ipCrcZ3QEl/Ix/wz1oy/K29FifedLllw9iPCsQF0GGz5iq/SywEzhmdC+EclH8/1IEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SqEtFdUW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAC6606A31C;
	Sun,  8 Nov 2026 11:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SqEtFdUW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7891F0089F;
	Sun,  8 Nov 2026 11:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794138960;
	bh=Dnv/x81d/ZCzqBnld2QHSYQVh99f6DhnYxfPhIGXJh0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SqEtFdUW/EgIdR+2a66WgC6xrJzeVFQCv4GthO+ieZDJDJfzJX16ADKwauxOXfnJE
	 HjYX6ugxgCd9B3ZRoDFO9lfy7IcbIRa4a0g08bnzusZfujlrsQDI0V/WxmkO/EpsxF
	 wAGR88WaW4MFNx1KpembXcIS8mSQ81d1bGEcTxw0xyTWW6ZOFj7JrEfWVW85g9oOA7
	 pKfdT3lfQj7pIpEc0usL5H5BYPvpH6HhwVIA4ylQZRnR6LJUOXEo5Bopiw6wPnF9YA
	 a0y+0AlK9kMPaKkA+QmrsWu7TQtyQOH6NVlNfA7vxfMmuzsMDsYHNnWTJ6ZEhx4vvs
	 CDvg3zNieWFHg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 66DFC2C2C274;
	Sun, 08 Nov 2026 11:55:57 +0000 (GMT)
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
Subject: Re: [PATCH] firmware: cs_dsp: Replace the obscure "invalid magic"
 messages
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20261106150005.2051611-1-rf@opensource.cirrus.com>
References: <20261106150005.2051611-1-rf@opensource.cirrus.com>
Date: Sun, 08 Nov 2026 11:55:55 +0000
Message-Id: <179413895599.3630016.7819456210760459450.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=304; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zk6Wd6a/sPvMmap08asNppIs8ja5EdORq6LjBMkBWFs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+JPtuNo/9cvPBCjYHocCQ+Ohlve8rjG8HO6kmpZunp
 Ijmind1lLIwiHExyIopssRlcb+sL3m9hu/gwjaYOaxMIEMYuDgFYCKFxxkZJj5jvVHhEy/8anaf
 9GaVJa/e2V4NkPxn1Haap8ic5+fppQx/ha4/eO/yMtLfZFLEd91Awwcps4TjJoetmlrGrHCgR9y
 EDwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Replace the obscure "invalid magic" messages with messages that say what
> the actual problem is: the file is not the expected type.

The flip side of this is that the error message no longer says what the
reason the file is not considered acceptable is...

-- 
Mark Brown <broonie@kernel.org>
