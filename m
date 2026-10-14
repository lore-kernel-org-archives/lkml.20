Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877A23C456B;
	Wed, 14 Oct 2026 20:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010123; cv=none; b=Myw9irORkR0ZP3ax4FItWwXRgLKRfWKSvFyTqPyOmrXcdFDa9nMgOZjKZId11Lzwrw/K92qWhsSLWuXTxfutMvqcep9BVwdTbEcF/80+aLrxP2Tgbh6jWNVIlO6+QFXwR3oVwDjbyEmHqKffdOI0bB7urrHFGmTcPjzy7dfVmhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010123; c=relaxed/simple;
	bh=4jfIxgaYuuxGtKKXGj67AL/UZbb5YunJtiHuZLPJ6XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k7ULtuJMZmVQTmeRF1cmcJEUmulU+cPBmXkC/Cbw/xHcRnCO0dpEtMb0WdtKLvwxPzXTxVlQc7T4j0CvR0g6WyzjTDuJ4SVCqu7i6HyqIT0KR+GLIkRZVB9YY76jNCgYDl/Utz92rUTE/R7ORaCBmYqXgw3m3PICa2WFXkUPVnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=kRKoCPKW; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="kRKoCPKW"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2033582A88;
	Wed, 14 Oct 2026 22:35:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5g1n9puZ_pU; Wed, 14 Oct 2026 22:35:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792010117; bh=4jfIxgaYuuxGtKKXGj67AL/UZbb5YunJtiHuZLPJ6XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kRKoCPKWbUP0Zl0zox6JGQQUxcgQ6zWtFP3FSPin2Z0hmviV8/jvrus+oqWN/W/9a
	 HchypNwVweZBaGxWBeqLr3z/D2xpYcvYf/cQrKQIlh6CYwny6l3pXvDiPNp4lU+p7l
	 KYFJHCpcR1UU3gHInusv0MsjYG/iQQfShTzYnyGfFiFkDXnTjfJ+kVXU9v9uot7kqH
	 k6jnGEm9Lc3N0ry55eLrldU8+bMhGRGJof3cT9l7M9C03bl9EARpIKsSbxUrPVsBk5
	 H5dyX9I+KY0zBcrfnm4SEzqbimhHr+app/39JIiO+8a2MvhLROyFgo4fEBa8CXOYww
	 Vw+P2e/W1VXCg==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: Use the allocated major number with major=0
Date: Wed, 14 Oct 2026 23:35:07 +0300
Message-ID: <20261014203507.166042-1-aliamemis@disroot.org>
In-Reply-To: <CAABR9nHp0jL2fQ4w6rkd8Avfj9eD2=05TnxOYeOqGDWDqD=9jQ@mail.gmail.com>
References: <20261011221350.1690703-1-aliamemis@disroot.org> <CAABR9nHp0jL2fQ4w6rkd8Avfj9eD2=05TnxOYeOqGDWDqD=9jQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Note that major=0 has never worked, even before bd8f21876189: the old
> code treated the positive return value of register_chrdev() as an
> error and failed with -EIO. bd8f21876189 only changed the symptom.

Oh, you're right, I didn't notice that.  Sorry about that, and
thanks.
