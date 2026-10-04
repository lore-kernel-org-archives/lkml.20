Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4167C37C0EC
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791133586; cv=none; b=BFtfRYRh0X/f4AppbohCaSFD/bQK4Xk8dWsBr45mCVIkw5RX80ZzL9HNvsoXj2hLpboKO8BEoLu0Waadx7Tgcf0uUPG86WpyVrHwPFHbKUAVOLoJx/YKLP2kbfvlN7kWutvZI3LSk6ErNKSBOiOpdIX44hmrg8gPeEXMHQO/2/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791133586; c=relaxed/simple;
	bh=vEr4v5UzCxd7Q67cxL7C+j9r5X+UpcvxAXoDSa/XGrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OtpsMe9r4Jb9lGDoUW0DE930DRdU2AemBBUT6swscml3+Gh0SERoHyAGh3aRQaFnrcCo0It1tLoXleMOdF2E4Ci/A39hF6GoYFHzq8NuD1mW0BUA0IVPypkQBiIq8IN/B0cliWGxKmyXF+NgoS2HjQZj52sDja4nIeWDOOXp4No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqlYikaO; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqlYikaO"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49aa2fa57adso125689fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791133584; x=1791738384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEr4v5UzCxd7Q67cxL7C+j9r5X+UpcvxAXoDSa/XGrU=;
        b=RqlYikaOnxkDd6DbFJrHXtch1lcBXpVJyZqO2aJ7xM2QOZKTmcygg2u40hZOZgfs1N
         Mbm4jgiuGdCfyBS0VDO47O0OdRYuxAorVMYwiaWGtLlHz7oyFoEvwXZ2SbQkrueHhCT1
         mTESKW+zVXxLk23BeLti6t0Ais8X6jGTdGD5HoGrnEQEHmBIBayZYgddExZopd0bJ/zD
         +hNqzxMW5p2aISIEsoR/fTHbyUpjVroqYb4ZBZZutAlqr4YRzH0fhWrV7S5mzMSMZWje
         DK3Bida6sorx1VAD5nQKGeqdzIar0Rakk9/I3C83446nIysUoNy1dGzGlFGJx8H0MMod
         seLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791133584; x=1791738384;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEr4v5UzCxd7Q67cxL7C+j9r5X+UpcvxAXoDSa/XGrU=;
        b=gcZd97AQ56UALHUZu27ApsX7rWtvkuUh7JL8DXEmmkR4/HJojHZZOq7ULq0lNZ9CUj
         A7tZL8QuF9A+bXJjtY77Tq3CLMEYdXTzonETtu+psNgcgetNivbeTVDpiH9cOZ90zkXu
         hs1h7rCbLVQo30duLKZ2y/7eHAdpgeU983egsL3r7sLe0+/NvF8MGac5nbRq19yXHWp+
         ik1blcDvqCS5vKXJAcVxCsk8tAJ8TkQ3XcH3xHlNPgY4eH1CvxesTwqBzTOb5NyoUEbO
         kzoD4DLMN2W7N41NU3V6SpjrrUvZR1fID5gkiVuYdWOspVK4Yqmgc+InJqQAAV/a1yV1
         5o4Q==
X-Forwarded-Encrypted: i=1; AKwUvByzEboE4NnqieqaoFMXt5CwOKddmXIYTGbJ6GEkHxQe2q9xT2yo6BV29W8Smc7SB+MrZ4Yooz5a4NZrUZ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9U8/CiF+iJljFbLP2Jlmsuv1SdpJe+lh6OKj6l1mKHc4RWX07
	kL6DICfvsCaZ6q8t2mFgXoEgsuuDB5ZnKRtD/32rRz+Y/DwtlUSb74v0
X-Gm-Gg: AYBFou3UuSXU92iJ+aASrV7lrGuUcrG04JJ8XtX2DEkXTgxgbszIgrukTpIGGSDtAgq
	Oqr8DXcCjdC9SB732S5wwW1KNxLWPT4WRJ/sx1zB5BynYi61QyjNeMj7H3ZFgd0WquEqeUDGZ5Z
	FD/d+1oLySaAmNj7VTeNQ4ExXS77AYjgDvUzbPFWyZ6SMITsbLkB0JymKoEhzmHPNjV3zJW1rDr
	GBfvc3WZfpAnTMS6oPCoE5xt37QddquIn5G3xSGwZ/GsGCMYiaN7cYKM+GoHv6Zpxhh0Wv3OCtk
	zmPnQdNnO6R++gDFFyRSYxNNfgWXWr3oLAFPOkKSnX1ykwE924lIZ54NOFc9qecYFYLwBCHjbib
	+ndHjDALMXGGxXup1vCKMpXt10ci2seA5zoZoTwzafPMbjoe3vSiO1bzjuoVEbHA7zAOpkLxzEW
	eBviGWznq0H6KVnuoZewXUgkFXltdfCb6+UVoeFPrt5ZkOj60Bwth33kgwmQCW0J3omcOlJY/4Q
	2/oCIXUkIDfKEmOpqYSj5ZwikGIasVRLPeZaRCOP8tUw8PgOxiVUSdPXViV3D01t5i4VTbE0B5F
	yg7kF4n9DA==
X-Received: by 2002:a05:6870:c115:b0:497:2e21:f7e5 with SMTP id 586e51a60fabf-49e15e91b0fmr5947738fac.25.1791133584217;
        Sun, 04 Oct 2026 10:06:24 -0700 (PDT)
Received: from starship.unifi.local (107-216-42-6.lightspeed.austtx.sbcglobal.net. [107.216.42.6])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16545353sm7403626fac.0.2026.10.04.10.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:06:22 -0700 (PDT)
From: Lawrence Lin <deduce@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	linux-modules@vger.kernel.org,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] ftrace: Avoid quadratic symbol lookups in ftrace_module_enable()
Date: Sun,  4 Oct 2026 12:05:59 -0500
Message-ID: <20261004170600.1541723-2-deduce@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004100030.189b1c3d@pumpkin>
References: <20261003-ftrace-mod-bsearch-v1-1-92e2fd2d80ff@gmail.com> <20261004100030.189b1c3d@pumpkin>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 4 Oct 2026 10:00:30 +0100, David Laight wrote:
> Surely it would be better to add the sorted index as part of module load
> so that all symbol lookups could make use of it?

A sorted index used by every lookup is roughly what [1] tried, and its
review showed what that involves: aliases, livepatch's references into
the symbol table, and the lookups by name. I'd rather leave that to the
module maintainers.

For this problem, Steve's reply suggests something smaller. The weak
locations can be dropped once at module load, so ftrace no longer looks
up symbols per record, and no index is needed. I'm prototyping that now.
