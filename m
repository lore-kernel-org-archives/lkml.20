Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF973C3C09
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442915; cv=pass; b=CjFoq6EgtxgU59kqxAW6o1u+3BowiI8y7MgLKKsb+lnqp81zL0Zp/F22hGIcpb4pGaB+GykAMfL44VWdYftED98fZcOpe1J0C7Ocn2XQgIvZZ1lJKkiuYaOVLSdxz40ZV2E4DOx6X3jnCgMcrA+WLu1NQ7gjDUnAdhbNcKX/eC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442915; c=relaxed/simple;
	bh=1uzp3Fb+0d6QPyR+GAl8dfrDjhT+5ThKcgNipEuOz+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4sIvb++d86kTiteYczIqKTZsmpvVFJnMydKQWSlcSWMP/FXr/33GM5sfIlhDdk+fp2WISKSRAH2NImTTk8LK5ucwnqo/8J5gKCNi2VJhIoJFoYefTixizQ3gjbuvQgRgVFCMCDbWUTf3SeV+YetIr9PFnWnUUm8H1+krJWqX/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMAM1dV/; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMAM1dV/"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f432ac553fso3671297a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791442913; cv=none;
        d=google.com; s=arc-20260327;
        b=etJF1WM+onvzkjGINatCB1KpXSwBaIfILePG7/tyenRvyzTCcYx8jrGR5RWxljmSfI
         1IuYNwQMSWfo3Xu68wvg/RFscxzdJjYF1e7zYuJUfiDCiIk7BdvaO4UreoJMPpLhzT9f
         gbE0GwQQmYSCMuLXqrHc1ShGrgMHYN8ZLG5+ohKvQPQyl31BBp4yCjTOPQmXdnmBqNji
         gKbA2JzpBUjXXICq2RQLEuV7fAVGqZAT52mXW4I5ebU9Senxf4n9Pzh/7L0ilTmrRCIs
         1g2JSVlAtLJdhh52kQb6FL0MxPydEq1VckoO3YnndkXTaKoiUvtl4+e0WSffzwdaRd5X
         3zGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VnjgZpiqCBnWQmDzV7ayfji4vld+Ysm4KsVus+ufOj4=;
        fh=9/8co57xZYr++zBQlEjN5LHzImCTSyh/Onk7MOXCB3c=;
        b=huAIt4mf6ZybE8tZte1banpu07r4cAX05gntcqPRGLAZAFcu/pAswpITnvbtErhWEU
         U1bWJ/arasoNPODgA++Ve8KNxD62MaYeWSKg5+D+Xq0kgSGIuwZGMwcgov5dZtavH59A
         5uUGz0HxL8BT4NBTYw2jERGcJID3L4QNZact0nvxNGJzWcvyogeC2JhIN+dZ9JF7u4xX
         TItQ2I+kR2ZpjtecWM1WOsITJ6Rft1rN2fxNRTHFwrCzogrb1LOh2ZWHl1+OuOzx59Ry
         k1qcCYhn3QcfRuMQM9TomXP9puVxUwMKZ7Cv5qdfF4DapWSxvmNYooonXsKppS32jRyn
         F06w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791442913; x=1792047713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnjgZpiqCBnWQmDzV7ayfji4vld+Ysm4KsVus+ufOj4=;
        b=DMAM1dV/wGVjuIkn8Eejlqmx4tF2azNL1YyPWV2EXXhRxoeg8rde5zZMlHsnex+SNs
         0k4INUZu/rP8ZZNOT5Q45pQ5AfA7jVvSiJOcGeAu+ZEDnw7T/pwPMWHAcIYH++GUuJ6F
         IFjcDHlPMqwXi/z78eNcURsiD2lnkNuWX6RxqN6CcdV5zwQWVEyc4r27tG9vVsGn7qow
         E5atIbfTVIWGtmpt/f1x/QdPX7HdTw7j9ZlYLJva7lEe+r5jgQUCvPAvjdoM9M1TTKxb
         Nc5gqAAYIJIhFiPrQP8ecApgAbJVMZbzmWlZFHOU7UdOw1Rlw47eDa3/KU1Z/fB5yfCN
         /ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442913; x=1792047713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnjgZpiqCBnWQmDzV7ayfji4vld+Ysm4KsVus+ufOj4=;
        b=xd5V8Cqzhm2NQ/PgX2SzpJKbyw//wkjf9Wj7QiOOX6sznucnNB6TksXjMcwnUpjNoi
         FLyWSmOhaQ81wyiKiv4tE8Q9G1dBumM5HA9LlZQ3ArpETr5H6qgIo40t7z+w0a1z/X5d
         yT7F8C48QwaT2OvGGmcNBPT0zR2gy9ipGmAuqxE6VVf2h2WZn/PQw5Gzu4Eps615T261
         VknL6PYb2q/u6J8xQCFvbtvIduxrHAE0s7Pq4Y4Dpbql0NQyjoO19iDwm1J1bwa+0ZSN
         YZGJ0ZpL2fQdx/J/dx+oLQzDvhGT2qvsKhheFV7RI0N0zcdtDtbjjsuyOnTyWFGYdJBg
         o0pg==
X-Forwarded-Encrypted: i=1; AKwUvBwREYm/n71nr4D9uLakJ2r6+u0DEfvem4SfRBx3Keyapjy2oOaMiUgOpkYBAsna9sxhdrkpooD5bgwm1/U=@vger.kernel.org
X-Gm-Message-State: AFuF++mNllA6eu+B9Y9vzvQcI9tKV5Cfq3dDsO4oSBXXYI6O8PjaZblY
	LvAsYIK/AEI57S41Oag/jMdrzTEoUVWsCbGcCvv7frPsj2J7joHpBZArYmZu3khCdKypz6cTozB
	SRniwGkZR0ZPLFd7j7PotsBlufyAb0mc=
X-Gm-Gg: AYBFou0vAQX68OXFBvJWa5vAhLh3s2LmflwqTTd1M3D/7m4+T4+HON0Ia6+xGWbLgXB
	0ApXZgQGg04BJlbtfQOZlOCTxAqpJaiWAudJsox9cO2yg6YDt7+fbyMTisUjzpLa6X4fjUzavxK
	QDzt3Smue40ok3WiY2FEMfQXGsQJT5RhAABYHfDjcXtdOjQQ2xfGlYprcX0xKY1HeBSls6rfGhb
	YIuIyY23oOEyDfMvSPOw53gfDe9sOctl91Iu/uMaWrE8WQn6MkZGxhFIilvn66R7Q08CRsevEJt
	KouF097GDuPcfC8bjA3Bel59QHS10Z/elGMQ4oXjYeMAQ0XqFGELLwgk+hr7vQn15czxTg4oNDU
	2q5BmbWfJBFJgveIo7BdfyuQhrYlKeE2rRLAlDvQeNp2aYeKlsvXY
X-Received: by 2002:a05:6830:25d3:b0:80c:d30f:97d with SMTP id
 46e09a7af769-82ad16d6194mr5557685a34.30.1791442913372; Thu, 08 Oct 2026
 00:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829004608.25252-1-mikhail.v.gavrilov@gmail.com>
 <20260829085941.106318-1-mikhail.v.gavrilov@gmail.com> <CABXGCsNQZY+g5AB17yiZP4aD3eKBpNWWNqcOL3_eh5JLxp=H3A@mail.gmail.com>
 <IA0PPFD4454CAA918D3DA3D71405C9C7FD6FC932@IA0PPFD4454CAA9.namprd12.prod.outlook.com>
In-Reply-To: <IA0PPFD4454CAA918D3DA3D71405C9C7FD6FC932@IA0PPFD4454CAA9.namprd12.prod.outlook.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 8 Oct 2026 12:01:40 +0500
X-Gm-Features: AclHuK9yC09SUFDh4Mtny64tXmLQQDmS3U1PZKcvsixYfz550FQvCb7EW7S4RLM
Message-ID: <CABXGCsNGmbFYB2FtAi6Hzn-jPTy6YG7P_Y82Qe4hi42svcq4xA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: add missing CRC engine 1 registers
 and masks for DCN3.2
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Chung, ChiaHsuan (Tom)" <ChiaHsuan.Chung@amd.com>, "Li, Roman" <Roman.Li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"sashiko-bot@kernel.org" <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 7:25=E2=80=AFAM Lin, Wayne <Wayne.Lin@amd.com> wrote=
:
>
> Public
>
> Hi Mikhail,
>
> Thanks for catching this!
> Could I give another patch that will include this fix along with a few ot=
her DCN fixes, please?
> I'll make sure to CC you when I send it out later.
>

Sure, go ahead.

Please keep "Fixes: ef45aaf73717" on it, so that the fix also reaches
7.3 stable, where the WARN is new.  A Reported-by would be appreciated.

If the other fixes cover DCN2.0, 3.0 and 3.1, which the Sashiko review
of v2 pointed at: their offset headers define all twelve CRC1 window and
data registers, so it looks like the same addition there.

When it is out, I will test it on Navi 31 (DCN3.2) the same way as v2
and reply with a Tested-by.

--=20
Thanks,
Mikhail.
