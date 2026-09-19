Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E482D781B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789848507; cv=none; b=EhQZY1KVcjzlG2tqIieRGfPYPgFOkZjyZo50tsf/TiPSOYt6nRLwvA2zxjEyBGjqSetEqbwtEFoGmwmzexm/z/ozEejiDuYnNO0rxmnpX56A/2+2Kv5K2GcQqJ7XhuyK/DUdnpmmCFuTfdFJRpy2t1dyDTJ9ejsexxx1SANRwYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789848507; c=relaxed/simple;
	bh=fxNmcfC0DUxhlW8yN2jFhiaC+jhCzmca06tNl7zU15M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlDLh9Vly3p1l3G0nd10iitW9H1+i4Juqbvh7uUgMm0PzQUYpv/6mRyzkCPHpUhJWkiRzmLNEy8CE3JPpl+EEd66ARf9HfVgNENa+4xqsTlqfmxzIOnpbzFrryOytsl7R8o/5Z5n5AmmJ+mfwpTjeJa3qs14JlT8gTP9PccuLPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5NfJNad; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5NfJNad"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e620fa473so10535945e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789848504; x=1790453304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zH2coYvkCFk4ebyaBOaXh6iikHxkJzRaCpn2ESsA3w=;
        b=r5NfJNadSFy5iI4y4muIH8DqIaupr//bGVz6zz4DIFjemCIBMAOhhOQ24eKw4mVtHe
         vnBsRoem4iNHNVPutG8QiFoIHA/ZaiGt5FHQXZSi5rj7KDh5lvYh8wVCrd38yyriE1Gw
         xZBh2AgKPTgNrCzs2PsUO496PnCEY4kcxMxh7vgUx5B95AFFjqy5KcRwRiePve4Kz9rM
         PkqYBNReZ0m3qUbWd5nIxFGb47ZWkrN9Y5hrmn8cPik3sSaMLT6/dTOgz8vIGcoRttZy
         1RA8Jbjqwdp/2xrqq+2c9LwSP7CB+XEx2v+Flxw30f9sfMYoM7o0rhz4XYKssHncUJyM
         WQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789848504; x=1790453304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zH2coYvkCFk4ebyaBOaXh6iikHxkJzRaCpn2ESsA3w=;
        b=O77RUI1wprOeLzISDPuxFSzDJwm49VJR2VwPhWcoBQcas1kjfbnxzo6jkeJWbArI+Z
         EXCmGHb4Ghrokp0TV3JY65bDbXS+G7wp4daPBD9E7+dAgSSWm9R3kyV71yn8PiM0AFFJ
         UBbiJgVt37wCDR8QATcWg+dZuLOVb9CG26B2CKi81r9OpDnEqtXmnd6dF94BvfBlApw1
         25WDg/dLWgYZ26taLRd4ySIy4s5mKhRRg08enXQfJq98NwWYX9JrXBW9nKWXndD5b4vD
         QzEG6I+0E/3clv7yNVF0rAvKjVmMLjrfiXV3ZRrynJwbrIotrTC9KAXV47D0aZ0zXPsG
         stzg==
X-Forwarded-Encrypted: i=1; AKwUvBxQhoHorTB5/wn6+vi36xHkCb/pt9hsDVnpdi8uQWsi5chf5IzgwlZI8canaY2RYS9Y6BXiqWT19wwP8AY=@vger.kernel.org
X-Gm-Message-State: AFuF++k02iW8LfOzmPQC+poEKE0GiVgnt9yJi6GaAF9EltiIxfGdkOZY
	DSdXxamJ1+g3fuQm/Uv1k0QCHnDIBMZC4juOGk0mUDU6+KSYAXhZ4v0R
X-Gm-Gg: AYBFou2HQG36r0JC8/UtwE0QRnAIblyD0pktJZeDAAeiLeSKXAV07CKjGRjrBbAXFRT
	JDHiN9HW/NOE3g1dZRnxptKlDzcefW39r3f/K/+n8G4jRcNt5LoS3a92LJ5uqykSJZ8fqF9ZMOP
	wAwc+J+dTClU3z/hjWAlWEC6Ir6xsQIY/hhSHkI7s3xoqMCE5iMtifr8dTryS57DjzfFzweiRjz
	QvXs2mAc514nFoFK5YfeDip9FpjTn4Ue8Wv9pmTn3r4PGb3qd0c6vx+4OzxwXOcvDzBTKLM8ptq
	XklzyU4Ipdf2WEisAlcALIuvbU2lLDEt+vthdk5q1X0tooYUD3CeQTHJI0nkw3lhuH3M9z3PkUC
	jj/s8unhfBc8vihXXEvoF1gUsSQuiryx0svk+pqe3zAdJcmPOt72NpjNjwWx8G0SUhI+Ktlyypq
	98SyQYth6GjxpKU1/4lLc/lOUSnwNHcAvtLvcioEJ+dikJdTU64Yk7UXmLVeEhqwiRHU+DhRMgU
	qgm7aXEs1+v1JqCcRABcArxs10vTcryMTq9masVbm4QB/ecLjm50n88bSuLao40WzFPxbg=
X-Received: by 2002:a05:600c:1989:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49fc5714d14mr89393375e9.11.1789848504060;
        Sat, 19 Sep 2026 13:08:24 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm115777395e9.1.2026.09.19.13.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:08:23 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	George Zhang <george.zhang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION 7.3] drm/amd/display: single-frame scanout corruption on DCN32 at 120 Hz since a637a140ab86
Date: Sun, 20 Sep 2026 01:08:20 +0500
Message-ID: <20260919200820.799243-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902073222.206801-1-mikhail.v.gavrilov@gmail.com>
References: <20260902073222.206801-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following up on my own correction: the attribution to a637a140ab86 is back,
and this time on a comparison that does not have the flaw the first one had.

In my previous mail I withdrew the 90x figure because the rate turned out to
depend on the machine's recent load and my two runs had not controlled for
it.  I have now measured the commit against its immediate parent, in matched
conditions, and the difference is there without that confound.

  parent  1d8327353de6 ("drm/amd/display: Fix VABC Init and OLED Support")
  commit  a637a140ab86 ("drm/amd/display: Allocate DCN32/1 dmub memory to GTT")

Same machine, same display, same 3840x2160@120 mode, same .config, ordinary
desktop use, no game in either run, about eleven hours each:

                          parent            commit
  observation             11.0 h            11.6 h
  eligible frames       3,019,571         3,632,444
  events                        7               293
  per 1000 eligible        0.0023            0.0807
  95% interval      0.0006-0.0040     0.0714-0.0899

That is 35x, with the intervals more than a decade apart.

"Events" counts only frames where all three CRC registers moved, which is
what the artefact does.  The single-frame content flicker that moves only
the luma CRC serves as a built-in control, and it did not move with the
kernel: 0.0020 per 1000 on the parent against 0.0008 on the commit.


The load confound does not reach this
-------------------------------------

Both runs began immediately after a reboot, which resets the state, and
neither had any load yet in its first hour:

  parent : 0 events in 434,204 eligible frames
  commit : 52 events in 349,718 eligible frames  (0.149 per 1000)

So the difference is present before anything could have excited it.

The shape differs too, not only the rate.  On the parent the worst
five-minute bucket in eleven hours contained 2 events, and no bucket
reached 3.  On the commit the worst contained 30, and 28 of 138 buckets
reached 3 or more: the excited state comes and goes by itself there, and
on the parent it never appeared at all.

For completeness: the commit run does contain three windows where almost no
frame was eligible - roughly 14:30-15:25, 21:10-21:25 and 23:45-23:55 -
which is what fullscreen content looks like in this data, and the parent run
has no such window.  The first-hour figures above are free of that, and the
rate is normalised per eligible frame throughout, but I would rather point
it out than have it found.


What this does and does not settle
----------------------------------

It restores a637a140ab86 as the point where this starts on DCN3.2.  What I
said in the correction about the state machine still holds and is
independent of it: heavy GPU load excites the artefact, a long spell at
60 Hz or a reboot calms it, and DTN snapshots in the excited state are
byte-identical to quiet-state ones.  Those were measured on kernels that
already contain the commit; the parent simply never leaves the quiet state.

I still have no mechanism.  The commit moves every DMUB FB window out of
VRAM into GTT, and I cannot see how that produces one corrupted scanout
frame while leaving every register in the DTN dump unchanged.

The GitLab issue has been updated with the same numbers:

  https://gitlab.freedesktop.org/drm/amd/-/work_items/5714

#regzbot introduced: a637a140ab86

Thanks,
Mikhail Gavrilov
