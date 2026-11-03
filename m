Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726802;
	b=SPHSr7g22abPgTIy3QbWQFnEe3OUJivdDeWymrKChmKvmGgGAcJyryXw0XhgKIGuxwu2
	 OBgBvDqAuPVSVdqlsF7EX+B9J6p2RSvgUFf8rWoArAI+PhitcFiJ7pjVjNsqvK5usbDZS
	 ckr8m9PGgUwlFYdn4BzsMe/yQFBrERAH+IjbNz7opPRN62UZnlRYgtIbX8SORYqypPEoJ
	 Y3TWSqG5c3m9CxPXKU6ymnsTB0qkEdK9W/uMxzHC2sM0mIoXfflIq2uEEwD3WOVzgiz2W
	 oD6v0rpgFIEWqeTbQzeAHM8ozRffhQts9erLMaecp/igTYGzhOEZKmOSylBg8VL6Sig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726802;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+7J9r15vwiMx7UdjeL5OaML5I4QPNOMEKMrFPfyBq4A=;
	b=OI39ypV94mIS91ExYV0hqCXuLT9xI9y6rmgYqlggD+9UOQSBXzMP9YvyQphdkDX0EN88
	 bGxozaAXXPs/qBlSrGcuyJaiZeuq9S3RfP5FrIT6lfv1xWddEG5eYLabZAYwhZpYfcVL2
	 OlHe2rsYMWXA7qf70DLPAy53V688Y3WS8NVl3YbzBkDNHUEucUxRzH08d7Hff/So6W7Lp
	 U3Dd+HcFjT1moe+SrbB8B8UBW9u/C0/4KbosEA9UIxkDViMMo4MD4jk7b9wpMHRD+WuRy
	 mwmLL6Q2HKQZguwRj8iwIEqyAFl4mZrquJHn4EPxDCwm5mx170WrXbYKo0uTomy49CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="V/sCDcX+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3618606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V/sCDcX+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D87A1F00A17;
	Tue,  3 Nov 2026 17:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793726801;
	bh=+7J9r15vwiMx7UdjeL5OaML5I4QPNOMEKMrFPfyBq4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V/sCDcX+zcTjiFMvQBOkx+Sn8+CjMV48I39sTvQuDo5av0PRLtnBsOSpad1+tf/jr
	 AlotCVvAgr8nAV0vGoqm+mlIGr+sgKPIfkkwS9VFpaawzPNk0w3FnFabAKxLL9WCJf
	 IUckC6flAEaTsY1yhHzSBwcDsLFnluyx3PNHTS8tP1ao9d8MnesHPk1GedTDNjcd/d
	 /6yMYmx8luksixFJs52/GjTfTZqH6cICLEKNM7aEU3zrZFbJuX+PGlPVKIuvmf9RC+
	 MBtVj3TU3waAigXGDm1POZMkh1vxO9bU25eDL7RsIefJTbTjd30tQSpKG7e7X7uJ0/
	 4vXkHAS7Fwo0g==
From: Sasha Levin <sashal@kernel.org>
To: Hamdy Abou El Anein <info@daylightlinux.ch>
Cc: Hamdy Abou El Anein <hamdy.aea@protonmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: git-resolve: search beyond ten body-only matches
Date: Tue,  3 Nov 2026 12:26:27 -0500
Message-ID: <20261103172629.1393309-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103164202.129634-1-info@daylightlinux.ch>
References: <20261103164202.129634-1-info@daylightlinux.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 03, 2026 at 05:42:02PM +0100, Hamdy Abou El Anein wrote:
>The forced subject lookup asks git log for at most ten matches before
>checking their subjects. Since --grep also searches message bodies, ten
>newer body-only matches can hide an older commit with the requested
>subject.
>
>Remove the premature limit. The existing reader still stops at the
>first matching subject.

The fix is correct, but without the limit a broad wildcard that matches many
bodies and no subject gets slow. In linux.git, --force 999999999
'("...Tested-by...")' went from returning immediately to over a minute, since
the loop runs grep once for each of the 78000 commits whose message matches.

Matching the subject directly avoids body matches altogether:

	match=$(git log --format="%H %s" | grep -m1 -P "^[0-9a-f]+ ${grep_pattern#^}" | cut -d" " -f1)

No limit is needed then. It gives the same results on the selftest and on your
eleven commit case, finds an existing subject in 0.1s instead of 10s, and takes
12s for the wildcard above. It also resolves subjects with leading whitespace
or that span several lines, which the read loop misses today.

Could you send a v2 that does this instead?

-- 
Thanks,
Sasha
