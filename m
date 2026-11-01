Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576368;
	b=G0zpc70CkouTnaR1gwXgIFSgHlxuLOYyjAITRvU7ANLgHM19ygR546U1ChT6w6I0n1Y4
	 LK5zbFLBqXc29ocZyoijez30MNpAAJVUePiG/FUc06GoPnkqDi4RZnON98CH1RPbE8xLb
	 /ww2UEaMYVSfRwZqnx4n3LG/l4qm2+SKnJSKvpy0E5QyF9VfjEZtegrcQc2dR0wY/XUb2
	 j1wFg5zp2EdtaDBo6CX/kIjaW1S5BA1bOsM5AUBx1NjcFrpZn4fzv/L5TV4D/RK3tHiiz
	 rL4nz10XJNLEgM3oVWGQ7yZMkEdUGZfNzbUbE/M5hSwHCScgpCDd/yvLuBfrObU9E1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576368;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Q5JNKCwvfIl1wXozL7u+neqgmd50Qxk2iwM31esSMlc=;
	b=V/5IHmRdJK5cQMvkqHD8bYALE9l4am4Ueu4xZqhDb8oct4fZK1tcPbjuPt9WHI8LjxyM
	 55kKOc8RLTCca38e1++nQyWwJomXb39QfZnDTL65wO7t48SS0Rzp49HmC2Pxm30OJO3RG
	 H3ARWnaayBGKKc9pOPbtWMvB2iIREVdilp5mvr406oSJp+N5y30U2s3uJYpxFJ5j22Bf+
	 LenleXvZMuR7CCUKLeki8mNticDhxkhM2FhpVO5IYiXQP98ASGbOxecnQyuX9aPbCWf82
	 ydKlUg0+yN+DQw8W+Tv7dlszsvhqUpEmzNaQ8/sBZxEg6xZClv7ZBN53O1506iPgV+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cX9PI0CZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EDC606A327;
	Sun,  1 Nov 2026 23:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cX9PI0CZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFFB1F000C1;
	Sun,  1 Nov 2026 23:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793576368;
	bh=Q5JNKCwvfIl1wXozL7u+neqgmd50Qxk2iwM31esSMlc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=cX9PI0CZcjICKKnMCUa5jh4oLTuQjEXgzcXNTWdoFglI792LafFDR+D4Rhxc3jGHk
	 +AyFYwh4RezpZSNdeH75+g66LfhnjiHwyl5lk3yLH4VtiaRLSjO2z+gHOzbnLbKPRn
	 QccPB/PHyP1yp/pV0TWKWBJ4MCdrnxyOzxAL54L4FiF38MIdfyNYiGmUo2LdT2cVC0
	 cqznffCjvVbG7N0HKKQ029dJwxcoQ1bFHOT8Z4MzOEPdfSRD79xw56vsl8J2cVf08b
	 dyjI/Egk69CAePSa6nLOuVAL+lj2fTapp9Xy2raEe8nPzWk0qx1uyGMtLs7jXuBX8O
	 8XMkzmo8LMXkw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 577B820F63A0;
	Sun, 01 Nov 2026 23:39:25 +0000 (GMT)
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
Subject: Re: [PATCH] ASoC: qcom: qdsp6: fix device_node leak when parsing
 "iommus" phandle
From: Mark Brown <broonie@kernel.org>
To: Selby Mashiki <mashikiselby@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261025190340.449613-1-mashikiselby@gmail.com>
References: <20261025190340.449613-1-mashikiselby@gmail.com>
Date: Sun, 01 Nov 2026 23:39:22 +0000
Message-Id: <179357636299.1716893.5266083194003598259.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=356; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xJXHAEaMrD7QUxGGvMCAcch2qte5IjifZkbGrlkI5eE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKen1177IpgpOi8+yL3v1z4t+xWx9KASfMuz18tmGEbM
 Udxjs1Xpo5SFgYxLgZZMUWWuCzul/Ulr9fwHVzYBjOHlQlkCAMXpwBM5NJ5hv+ui11f+njMKAxn
 +6h/9ausgSu35to/+z3me37kjWtlWdvK8D+o7Eb8xc9FirskmfTdj/+2mz0//myk3u0DH2Qc9f7
 8PsIHAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> q6asm_dai_probe(), q6apm_dai_probe(), and q6usb_component_probe() call
> of_parse_phandle_with_fixed_args() to parse the "iommus" property and
> extract the stream ID from args.args[0], but never release the reference
> acquired on args.np.

This doesn't apply against current code, please check and resend.

-- 
Mark Brown <broonie@kernel.org>
