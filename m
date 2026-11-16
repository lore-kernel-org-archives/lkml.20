Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794016;
	b=RLHc8QG+AWfmCX/EtN/uVRKu+vd1C/Y59JXxFc+cI7//xe5Qd2I3ibHH8mOu5ex57yTV
	 zANghLczddFx8WkBg9AlvkF1y/RjCo9UF+4Hj1hg83VcixdVAtmNx/ih30u7DvcC0Hc1B
	 DQM5ARqMGJCAe0IVGsnQDArIDCLJ8X4wl44t7NjWVdEw/rUyhWXR0QxDIxTwtu1CU40Vt
	 dQnGBygvgWDUvQdwY6ZawxoRjOeYuYr33cTTD14V98SoF2GKWivVi1TiOccw4BIBLZd6n
	 DTKokfzBeMbxKqf6H7WlzBZ55szsQCfFP0SkKZC4W82kVrapVjYQqupAMxaa+99tWYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794016;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=FaMF9q09Bw2LR5DsSGZbxIphg1AfJ/shA1S+4rRhPAX01OOSBEip+kMHX9u3NA3zZ8Nw
	 /ZJLVayKJWT4vezQPsAva3KWMVTag5P4GETuQJCbLv0oI+6qWxA1Zq0Suu1En9u2i+HAS
	 LF0YZUzB+R7TlE9aVdku/GBcf0Nfo+epYbUUq3iCwUFfkLBDifzIGGgysCb1XezmMBj1L
	 OesIGImSvst+UlIPP/m78jIZsmXhhCujxtAkiIXMBVpdFTfzgy4MjFMWx+qMlu8KEd5xi
	 ADuBm62pBdjbNa+XmzANBBdfY97O72tnsQfP0AUHznqDBNm8GmZY9mRQ0p6ukrh9GqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Re1xpfAR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DE5606A333;
	Mon, 16 Nov 2026 01:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Re1xpfAR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B621F000C5;
	Mon, 16 Nov 2026 01:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794015;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Re1xpfARMmkV01o0MDBkpGmtGAocM3j+kx+eaBC5ZWZ2U27Vy3wmLZAuZPlbVBS/j
	 JB+4pfA/9XkXfioUeaT56A2qp+o9TIhnLE/pBX/ZnI9PSDlK3S0nR92WHD+7wCozCJ
	 rvnKdAAQPF6XVh1W5EUEtVaA7LBRRB72OVBwdCNerGT4Ne3+tSrHZjbUzbzyLWcBk+
	 byf/W6gM1oPG4VEz2gKtARa4eG0leoQYx8uvrDzRqf3Klm8YAb3tlBvTzE9ExHakgn
	 1oySDGz133bBTOlC9XaTkVaKLig0VxAvyUyRSlQNj/uAITFZugX1vtPbEZrgCLELK0
	 4Z3SyERfZo8RA==
From: netdev-bot+sinfo@kernel.org
To: Aibing Chen <chenaibing@cmss.chinamobile.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: hso: cap the MTU to the mux tx buffer size
Date: Mon, 16 Nov 2026 01:53:34 +0000
Message-ID: <179479401486.3291.17345716560777690357@kernel.org>
In-Reply-To: <20261116014904.556-1-chenaibing@cmss.chinamobile.com>
References: <20261116014904.556-1-chenaibing@cmss.chinamobile.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
