Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C866D3D954A
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792236975; cv=none; b=bgjdW8cOVBwsbI2tEoyhv86eDjcZ6GiRYP8D6Ko2A1TL7Oh0VCxnr9Rqbel28vwVHnvVQHEY1x6VLl8LlwV733NNDn0AI6OrF43RHQBN9r6PDaZyAwl0nUZ2APZZiZbNhOudy9FTemM4Mge92x4TDz5GvGzPembodWK5281mdrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792236975; c=relaxed/simple;
	bh=yNAJuYmjmAjUWtFgm4yj7+VgRbs02dwrTOWE3O4Hxz0=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EAUrXM5hY2F/IZiN7ar2C9H3of12lUsdkKi1ZaxWOFq+eu66V9EZhtVDKt3wnjbXanK6JYMEItfKvmni9+GQ8B9/ytv1x9H3wp8nwOEU8KoXrA4Kcb2RsYIkbetZpN7jK6N4J16whjOpvVP/uTVwZrp6FDMi0RKcaYaQJxSy1+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4aiWZ16; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4aiWZ16"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac7a053626so149594a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792236974; x=1792841774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y5lPor2Y39zEYus8yegDwQOLxe73Q923XLq/QXzQIhA=;
        b=P4aiWZ16cOwnP7tqUyRFrFV3f/GKp6M0UkToAch4MO1/NVa01HhsmyQrgOrbQB+bNe
         cS1RJLyi33Lwwz3+mDiofapf3Qe6Uwv5ooduXhh3rwnv7Mv3s62sMY07J8zAzaDf7tVk
         d+cSOv+ywyGvajfKfPiO6mfAdbqxtAh+9M3VWrrt7Jp1t0Q8Ud/xH/TaXWrQgceT6s/j
         zqWZZ9g3l0bcSTH2LUVpG/6D9hMWtB1ev+NFckNbPHyaBnEjiiiqJughOCx24XvDgyZ2
         ThDCl5BzPrOpBRYp6iyxW53YOcZMxwi80m/tXSp0hoCFjoV0xQaY/GO42GFZpvl3LjIv
         x3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792236974; x=1792841774;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5lPor2Y39zEYus8yegDwQOLxe73Q923XLq/QXzQIhA=;
        b=0vSWSI2Dz7MM3e6MQ7sHivGXXgpry+7L/kf0uJbaGzHIlIOiDGiuSmvLqiELVzXzam
         sZ+7itbwt+Q9fifxSM5t9UO8WSWvp9TOqTIYYDXbOw3x3iVeZtDYkIutek5JE0hiiVDq
         ughO545uUkPcfQWnxiPsIDi9E0cViAsB9Zal++9SPzUGRHUi5dcTxAF06Hwu7ePhQM1f
         IGmhH3iiCx251wlt4j1RXVeminfolICVjjwsBVBMfAVz3bxBYZVW78dFwClKDRYV6iyW
         M2hRGnPNSPV5rHXMI2HBiAt9vdEDX5Uaykc4bUxcRTP0CDRyJqF0/j3pZN5akNrYkFNr
         XxtA==
X-Forwarded-Encrypted: i=1; AKwUvByBW/Qto+0mjT3rndlIZxXpZDQgXervTG3MHSsOQjr/HFWOX0GCZWJe9IuXERH3QbjvgUbhAjvCptxBzWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTP/zBE+LkP+KGzNgGwvUTiiI/dFSoVsiMU4mxUjMyirVhUuSY
	pYYJ5tjvtA0iGCR9PKTKuuGNIOr0aBDdWI62jSCM2HPsy/mHqDOPUUHFpjgLAPDu86g=
X-Gm-Gg: AYBFou0BGYAJ6SqQBZihX568EXg3HRagN+VKUdm9tvLPT3zpXysO0mnTt9Ud8L7TJa6
	HVPbuxbflrbYNW9B5JXe/LpaWGOQVZ42Wmo+6iDcGqXhpd553vP0WsK+WxmqOt6YI7Q28DxZVb1
	rBQPshFZRag0j8WuHJoQfv/DzXC2rx50KkljkfyzMN4YtgcVEmiEHm9anzYHHKoYRIv8eK1QzJq
	aof0vhCiqPFG42biHNigW/qIuFszV4xMt5y2CaWcHDZZwiYwTQtLZd3WMiguSQ4Kccq4ARpJeCU
	SaQuUKu2xqVNkrTMBaqA9NOB3gD//PuKOXsCerTJ419UY9M4rprkZFCO0StuNvA63jZBRlFjwOh
	AkFZMnlpa9hVemz2kltSBgTDGtcrNuGSs/uNpwGqikhB9P8zCRF9JGFNyaUe9MpbnMIT47fVPYY
	srnAD9WsxrHf0GcSVBc4AuWs4Z4lqYchzpWunMXSEujoBVcJ4JoFHvzwSU6iRhmUq4v+TYamULK
	ZGFWQbjrGBijIviKOjs4A==
X-Received: by 2002:a17:90b:164b:b0:3aa:ff60:9bb8 with SMTP id 98e67ed59e1d1-3acef167affmr3313208a91.3.1792236973898;
        Sat, 17 Oct 2026 04:36:13 -0700 (PDT)
Received: from [10.64.8.87] ([61.171.228.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm12999321a91.14.2026.10.17.04.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:36:13 -0700 (PDT)
Message-ID: <6ad35dad.70c60f76.2e7ac9.12a4@mx.google.com>
Date: Sat, 17 Oct 2026 04:36:13 -0700 (PDT)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Rao <raoxu@uniontech.com>
Subject:
 Re: [PATCH] usb: xhci: fix EP0 context leak on virt device allocation failure
In-Reply-To: <sashiko-outbox-175494@kernel.org>
References: <20261017111114.1135-1-anferneemelokc5@gmail.com>
 <sashiko-outbox-175494@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

> Does jumping to disable_slot here actually disable the newly enabled
> slot_id?

Yes, you're right, and thanks for catching it.  The disable_slot label
should pass the local slot_id.

This is a pre-existing bug, separate from the EP0 context accounting
leak fixed by this patch, and it has already been submitted:

  [PATCH] usb: xhci: disable the correct slot on alloc_dev failure
  https://patchew.org/linux/6C94F1F35FF16E76+20260806084909.2959131-1-raoxu@u=
niontech.com/
  Fixes: 3ffbba9511b4 ("USB: xhci: Allocate and address USB devices")

I deliberately kept this patch independent of that one.  The decrement
added here releases the endpoint context reservation made by this
invocation, regardless of which slot the current error path ends up
disabling.  Once Xu Rao's fix lands, the error path will disable the
correct slot and the two fixes compose cleanly.

If the maintainers prefer, I can resend this rebased on top of that fix
once it is applied, or send both as a series.
