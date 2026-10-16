Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B60634EF05;
	Fri, 16 Oct 2026 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162192; cv=none; b=ttlpoxGyaZjfnPJHe3A8Ypw9dyKzlFNodbIXzyMqvdgbP/QF4CqB57QExjc8Wved/3YTXPOK5P00bc5ixUDVlTCMAWQix1rvSJXie4l/skuy9WUAJUmdYkFY2i45ZtiouQtytgkoPyuML295wEpDcAO1kTLiNvG0cgs/KwlaAYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162192; c=relaxed/simple;
	bh=hiM7IQAVwtsiqq6Qk8g5K+CQEtzNX3uTaG2Qf9uFW+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VL1reZLl2A4joeOoNy3UvrQpH/NQkL/gLrRz0DI7X08izOS0AB5bySWO6/8d3Ys2Wt53pbTA6kG2k1j2diDWcRENLxRAViqgie+lqgD85bRMZspuihMFnEgwCtb2LL0hNIUBiICRV4ZSkchIwfri0Ypu2TfN6P9UaaleSsbc/Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpdMq1Ye; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpdMq1Ye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DCC1F000C4;
	Fri, 16 Oct 2026 14:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792162190;
	bh=yqXt6lpLaj6UPjxlhdP5l0JbPEHElrrrHrY+I0+u+og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EpdMq1YeI1Oxurg0JjSUD/I5FMLejyFv9/RHuR8pEVI9C+Cq/kIJ1LnlBcG39nD2l
	 hDaCPdD5argWeuAReHCCPyKuJ5z/86tyLy3Bp5zFCZOq+Rls4Qi5o+EqCeUEl1hkMn
	 0HaKRlqsvmjThFaCnubeJ8/1TpLaYUlGEM4ZHx01P0fhEjlb45wJwz1YFlM/QsbGRd
	 XAMkqubLBpZyGV9KWdZGXSGYI5QakyafLv/ftNkwQrDsgC0P6nhQFf3GTNbDVOiQUv
	 4xIsfkxdeVLFY6IxLV4mVYNpxZDaZuoHPFH6WDFX+lIszitakQ70JkYTb05F4QrSWg
	 xihMgSFzTIivg==
From: Sasha Levin <sashal@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/5] agents: add skills for Fixes tags, stable tags, similar bugs, and commit messages
Date: Fri, 16 Oct 2026 10:49:45 -0400
Message-ID: <20261016144946.3640829-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAMuHMdXR+U+pgyN+B=trSuPJuS5Kn1-kN=VMFPRSvSUiiwbqDg@mail.gmail.com>
References: <20261012213452.1863248-1-sashal@kernel.org> <87zewiy1sd.fsf@trenco.lwn.net> <202610122047.A9E381A@keescook> <CAMuHMdXR+U+pgyN+B=trSuPJuS5Kn1-kN=VMFPRSvSUiiwbqDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2026 at 03:51:27PM +0200, Geert Uytterhoeven wrote:
>The expectation is that the agents are becoming better in understanding,
>so more "instructions" can be shared?
>
>If that is not the case, perhaps we need
>Documentation/translations/simple/, cfr. https://simple.wikipedia? ;-)

Mostly, yes. v3 shrinks each skill to a short file that points at the existing
process documents, and moves the Fixes tag rules agents kept getting wrong into
submitting-patches.rst, where humans get them too. What stays in the skills is
agent specific, such as not trusting blame and not making up the reason for a
change.

So hopefully no simple/ translation needed :)

-- 
Thanks,
Sasha
