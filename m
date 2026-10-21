Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792565581;
	b=VHRMneEn8JcLJMhcfAjLG1IltFLdlJWQwezA2cC6KIVt6agFqf1ITsjnbVwmhMGijX/r
	 C9iihn8XyqkpG9RZyZnkopHgOWcEvSJbciuT4q+XIP2Af9/qWq4RcZPhd6RZZ5zyAvGXV
	 CuqRDDs3pIPN9wyw1KejDbqu0IEbaxh0E2Yore1VdcojGSj83iXT9ry42ivGGBTPl5pDE
	 WLifHWpDxLkA5zL8sx61wW10eIkGYfDQEL2OWj44jMU1xYJAaZuWviluQ7zpTIjwvatVL
	 sVkApKUoMoVfFsnBj8vaqmEIrLvYc6QrtYzr5mB2UrlLP2wHLdbp9wING8IMhWvT+FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565581;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TfsI9184Xy+Rusm9C16TfP+4O3sJDBWOPeJ1I88PVfg=;
	b=UWESyab0tqmp0sSlSikBI9V1s8DB4ThTexaFBtRLj5TAmklXIrZQL+m654tVOFysr0Sz
	 zDF9x2Rtxu5hJGesLtzXHX9o3SqjeSjBrE4X1ZzKFU6uiav7vKMmkGHOBldSYHCb1Puf+
	 Dghxt6Zsbb4DDzvo+PRbrWUrnmZOHfiN0ZMH4SQdc8AmonDran8NGStbjSVyPBsK/TYkO
	 MAA7QXl16TnfNI1pHGRbygpSdkSbNbOiqL4/KDOZxhRqAzbNn3V3URSlc/wcijc/JFTCl
	 zKb4g8mRs9UY5wbYJgt3MLLfpiUtHPvVO7btFi1NnI8OdpgZp13tX+9DEhE1g874Ieg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gyj5HvJu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5E0606A31D;
	Wed, 21 Oct 2026 06:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gyj5HvJu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAAA1F000CA;
	Wed, 21 Oct 2026 06:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792565581;
	bh=TfsI9184Xy+Rusm9C16TfP+4O3sJDBWOPeJ1I88PVfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gyj5HvJuc00eMOOdAkBiI0okDcX8YTerU+IjxjnQnOZX0MufyoTmNFxg6bqvliZWW
	 BT+Ucu3ufX3xYmjpxXLQS6OYgKbriX/f61yzrk4ANy/eTlVkMFIN6XCzx69OHDgglu
	 kxA0wD5rdEKxeVqbVv+kZYN3YXWkBmmLCwPOxsas=
Date: Wed, 21 Oct 2026 08:45:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dan Carpenter <error27@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>, SJ Park <sj@kernel.org>,
	Bradley Morgan <brads@mainlining.org>
Subject: Re: [PATCH v4 3/5] agents: add a skill to determine stable tags
Message-ID: <2026102130-settling-abdomen-7c90@gregkh>
References: <20261020161642.3713052-1-sashal@kernel.org>
 <20261020161642.3713052-4-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020161642.3713052-4-sashal@kernel.org>

On Tue, Oct 20, 2026 at 12:16:40PM -0400, Sasha Levin wrote:
> Whether a fix needs a stable tag, and which releases it should reach, is
> decided by hand and is often missed or left too broad. Add a skill that
> sends the agent to stable-kernel-rules.rst for the decision and the tag
> format, lists the kinds of changes the stable trees take and leave out
> in practice, and adds the checks agents tend to get wrong: finding the
> first release that contains each introducing commit, checking that the
> fix applies to the oldest affected release, giving every stable tag the
> same version, and following the subsystem's stable policy.
> 
> If the decision cannot be made, the skill returns no tag. Point the
> bug-fix procedure in coding-assistants.rst at the skill.
> 
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> ---
>  Documentation/process/coding-assistants.rst |  7 +-
>  agents/skills/stable-tag/SKILL.md           | 72 +++++++++++++++++++++
>  2 files changed, 77 insertions(+), 2 deletions(-)
>  create mode 100644 agents/skills/stable-tag/SKILL.md

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
