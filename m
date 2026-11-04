Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796946;
	b=Tc7rVkPtyn7BpkpAq6kHxFcE1TeZ2WlswInX1JmnprxP5UAeOEIrooFqaAizobHZHkN4
	 /pv1GrOLOx59sPrEulMkp/D6u/cec7p6GBbxrrJK/apvOEx2bX56qdb2Xn5y7UKyisK50
	 9yTVVIie3kNwUGlAnf3zhDdccT32xF9s+hI99F1MA2gHcs3/TMa/Fy2qrwY1rEmvMm47F
	 +ZgHbflOsKXqLNS3Gfq+PsG7Pve22cpd7pQLQQbnNz6coByQJCMSRbmQJg4W+dXoRG4dh
	 ABUUJSQA/NDwN6S4r/lSjeGX4KweSZzlylBZ2ftx0s73UiL6LGLRc5GrnUx5L+qV44A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796946;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=RfmhEDWALpgS2EXFfftnFtCqGMsUIbsJKbabdy+AJI0=;
	b=ozU/r/KaROY8uHH6igMo8HIciyWEa187EbFQS9uxti/bLI03myZnSsxasSLs8pSruBWb
	 bCzlnQ1pNLQy8bvkgWEbxYtJO1pfsgE8iwWOZ8YC+q7URDyrp+P/fmJdfOJMp0MImlBMn
	 9eElM4xNOgNPc1b1GzpvbJzAB8iV3RyEcdk3tPSSvYIM8GUt6c1+OsdhRyg/T143/Nfoh
	 5lE5sEvgf8MuOPbT3SW6n5tF+qcNumZCB+q5jqE0BFuwK86EQ+SzE+fIARWAEygPtHNpa
	 RIIXNE+4vqQw5XKz+dP37svx3HrQAJojZ2CbvXRHs30ddfFjmXKFcyvFaw5lhdT3Gug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j9zqD0eL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48169606D82E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j9zqD0eL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A131F00919;
	Wed,  4 Nov 2026 12:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793796945;
	bh=RfmhEDWALpgS2EXFfftnFtCqGMsUIbsJKbabdy+AJI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j9zqD0eLub84mZA4uWHnkPW6JkhCBye8DfEQynWUCfHu+d/DcMbCKHthwK4nc8+/N
	 QMWZOfGuUvAe7G36XyBZxicuNj91zifJlVeQLlinHjF3qFtYUzqlLKrLDNveWTExVu
	 GB+5rX7yQR2z3vzcNh1vX5x2FLxC9MBYshverAJ1TdFMEvLqmTRV1Cl+yeGEOoEB0S
	 kIOAA8fh/G0C5qotBtZr9yHvOz9W07crol4UFQVu3Tw+x4LaFcn0ONAYbCC4OFyOs7
	 16D6CqDOw/LVDIpx51naeaTJ2dLqVb/LcEboPzCcx75PgOQcJb9ogVkoIWWNbda8qY
	 NMsnmD2bhimfw==
From: Sasha Levin <sashal@kernel.org>
To: Hamdy Abou El Anein <info@daylightlinux.ch>
Cc: Hamdy Abou El Anein <hamdy.aea@protonmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scripts: git-resolve: search beyond ten body-only matches
Date: Wed,  4 Nov 2026 07:55:44 -0500
Message-ID: <20261104125544.3769405-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104054340.10911-1-info@daylightlinux.ch>
References: <20261103164202.129634-1-info@daylightlinux.ch> <20261104054340.10911-1-info@daylightlinux.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 04, 2026 at 06:43:40AM +0100, Hamdy Abou El Anein wrote:
> The forced subject lookup asks git log for at most ten matches before
> checking their subjects. Since --grep also searches message bodies, ten
> newer body-only matches can hide an older commit with the requested
> subject.
>
> Match commit subjects directly, so body-only matches cannot hide an
> older subject and grep stops at the first matching subject.

Acked-by: Sasha Levin <sashal@kernel.org>

--
Thanks,
Sasha
