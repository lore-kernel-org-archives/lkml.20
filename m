Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726803;
	b=BhzYLgZTb0vZmeKZtKHZuRwNinWBBS79UZWgxJw846/8YZZ3+dcrd0S8AoQcVmy0dUGp
	 Vc7Z4QxGVi84dnU4vRUDt2MZ/c8M9bJHz/auBkagwahhuqcUn4ZNtgMfsJHpeXAkww2m1
	 Jnh1f/dK1OhsVxNNVzDeYd/xSfQV3QR1hJTkkLB4l61gjtky4lR682S+xEoqxj7DVat7d
	 gFjaUPPlLXf3aW8PL1gSdMV8L9t275t/FKod5LtYbK6CGkrrIYKD8LMBT5FXAo42G2cmd
	 y/8injadbBN8Qkq2JeFXQjloDnZGkTRi+Sgjtg327rm4hjEnHtLpdwv5zmKUFROP+iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726803;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nlAe4K2TmhRlnbynLgUFL+ZGkeyiSGQUdMYv4W4wB7g=;
	b=5tPGacTdwOH3V7Pjop1XYfeh7locZ4Qb7WPaD1mmEZ+yYK3/labmC7/R90d6EoVEDisG
	 9vIIyBWyS4FD+OW+HoOl07qwoSMSCi0RtoOe9BRR1D5ukoYuh5MivKUf2jPLIlciPN35P
	 iySGmUmwPE7AGRY48Vgj76zcB/fzB0GWQFYVISd+QqHJfQ/IZmZwns+72fJ1WbXarMpk9
	 v9BV1x2YqZhegVcMMCI1Cm7R2FWWP2GYW9VhoNWVenmRoTHgEjjmBSiJ47xQLGIE7CjCO
	 KjlvszANFWQ6MpR9f1zUcofrE4F0+vavyLhvXOe09hyTHLA4FnNJ6duSF5TrULewE+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d3Ew0Br8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3195606A33A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d3Ew0Br8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0707A1F000C1;
	Tue,  3 Nov 2026 17:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793726802;
	bh=nlAe4K2TmhRlnbynLgUFL+ZGkeyiSGQUdMYv4W4wB7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d3Ew0Br8L0aW6WGQQYlo/jC/aiTzNuimwfO+RuMQL1Np4f9zVN4PerCUakBZ0r8wQ
	 PPzFjaP682IBZ4UNn48aFj3+4AGXEgzsqQF2Gnfx5+Dq8VRSToN7EPNeJamp2Ywhf9
	 Sb0HqqsikhouE1eAZrbhLPHlWCCOSCZVkBZN4FzaJZNP0pflG7Zpv9m+n12P91AHEf
	 Slil/nnn75PeIAMGde+v16U9qK4n8RtB595QjEC0O6+KS7tezOzhhae6+g4ot3tyOO
	 vIOPG0lSBprvSpXs8yh9d0Q19vKvur6otB3/b3ZMCYAzFP1S/czhL1jGopmmro+72F
	 UD5d1vj23G6DQ==
From: Sasha Levin <sashal@kernel.org>
To: Hamdy Abou El Anein <info@daylightlinux.ch>
Cc: Hamdy Abou El Anein <hamdy.aea@protonmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] scripts: decode_stacktrace: preserve input while reading lines
Date: Tue,  3 Nov 2026 12:26:28 -0500
Message-ID: <20261103172629.1393309-3-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103164203.129660-1-info@daylightlinux.ch>
References: <20261103164203.129660-1-info@daylightlinux.ch>
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

On Tue, Nov 03, 2026 at 05:42:03PM +0100, Hamdy Abou El Anein wrote:
>Plain read strips leading and trailing whitespace and interprets
>backslashes before the decoder sees a line. It also drops a final line
>without a newline. This loses log text and defeats the alignment
>preservation in handle_line().
>
>Read with an empty IFS and -r, and process a nonempty final fragment.

One optional follow-up: debuginfod_get_vmlinux() takes the build ID with ${1##*
}, so trailing whitespace after the build ID now gives an empty ID and the
lookup fails. The kernel never prints that, since the build ID always ends the
line, so it only matters for logs edited after the fact.

Acked-by: Sasha Levin <sashal@kernel.org>

-- 
Thanks,
Sasha
