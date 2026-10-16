Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C8F4734C7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145748; cv=pass; b=pEPWLXiTdFJSHDF9y68rT1YJb5yUXid0slH4jh/GJDOKCx6X9F1RShzqeXHqd2BFcys92pAtrGUOXDueyrwKxVnUwxXf7aJFfxXcWQmYuwqBFlBdvuM8ZkNrilz73o7WO/RPXxP3cxx9mYaV+SCAxyNSz4eTEB4iR3QXludBlso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145748; c=relaxed/simple;
	bh=m+EcWpb5wUHZA4l/YIOJiWupQfQ1DWz+cRbbdR81dXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p38MzgsfxiSxhtFeOBgmRIaNdFRwgiMhpFOuBQ048ZkR8mgNr76dTPy8LZqzx1Juf2vlXPgAfMBiZIj3RMit2H2uU94XB/A375Xqj3RAGYgODc//ST+hjciehgE0JFR3EpUhQzKtKlJ49ecuvXS3509bRZmdcEOmn03kBEj5ZAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddnIV5G+; arc=pass smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddnIV5G+"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6cfed5dd071so4755739eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792145746; cv=none;
        d=google.com; s=arc-20260327;
        b=nIvC+CqrYSzvvBrd/cWNPuSYbm32U1bowfTPAj4+uXu+iwP0LbV+CPEhj4+RIQOrIo
         Bj/ZIdyE21uTbA9WiNvuQyugzZ2cZHYEF8y1ULMM3vv72lPvtS4nyX+ZETRW0lAugCMc
         2kWWfLogdgwhrQ+rPZxhbqwCOuHPyS5k4O5vGnkXAR2GTdfsQwI5WeGAsXkwMaKibGmG
         sEiWKZWJLc5Z8iRJESDutjB0T7YfzjBISIT7/FXWCGRH9IbL2VBRiyaX/3gzKN3VMPlY
         vSMBX29DoUHzB8kdjFHfoiU8kQDKqPR/sQqylSnQy5fqymcoz7r7/fjDywiOIpcaUct/
         l7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ixHThCS1DziF7jaaEn+F+nAUwwMRbRLnCSspBqixcY0=;
        fh=BstGhfCC73/jHfb372mEQ2AXubd8WUiHvMKjQDiPl64=;
        b=DmX84MA+tIpJnL5AeAH2L0dE7QcpZCOtfWjBX7UY4H9PxSFXiB3ALeADNqI/7DpZL9
         Ly3RXOkLH59X6Z5w8H2NqKrujEgA/ornxAH/+F6+jhNoqGekvYcWeNrPJwtjfBPCxCOF
         Gc+coN5ZQS82tb+RJElkrWuPbdsWAgFvcYFvCAtN66RiH0faYpDuYxUKxPLwtK7IT11B
         Ok8BM8mwzBrPuB/5OGz7uMosJ6STAayOwe4aolqHpVPGjCHTOkkV79Li/3bw56F+cH2f
         CIIFNWNQVz9p4Fp8Mv1rjj9I6bQF5visSJ8LrqAT0GYjgusnVap6Oa1zuKqGjfije82x
         DYkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145746; x=1792750546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixHThCS1DziF7jaaEn+F+nAUwwMRbRLnCSspBqixcY0=;
        b=ddnIV5G+MPUuwl28rB68ANwYcwzAr7ZMB9Y4bpeNDcP37X6s5Ko+mbFVUA+LlPVhAl
         gng60D798KVW1mCeyC8PiMiVgLXZH0IvBWhqc5O+6Jbi82wfjJZ69uSwbb+tJD2bbqth
         DgzjnQEUVy6ZihuNUdjyaphal9JXOdrfq6vzMRwlJvMfH5YD8Xar8ecBdvnfNjOVZ96L
         wNgRPv6PQz4Sajx5JE9KALU9/UyyZhrlUUM1RySIug0vH+EsfXWj2Kj/O87CzOTBa6D6
         2ipOGU+2LRk3DUIe9uyd7YG1R1lxNpbIYx/Au4/SvRQNBXD14pSAAC6/ZKAlaJ5zD3Ar
         VKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145746; x=1792750546;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixHThCS1DziF7jaaEn+F+nAUwwMRbRLnCSspBqixcY0=;
        b=P0cs2CPh6BOoioOg7OCtsVb9c1hJwJ4nbVd/VTpZTRpk0WoINBdwFTDgjD3FWZNv8U
         ujvWXmXL6Nf1cKbqmUnQxI3m/G0ibUHwAXzqm8Fy2ZR01VBc2NhCxhsds8mBT+k3U+MJ
         nW2TOR5bVyysuVTB9HIuLQnvCayp/zSQEpDcOsuijUaPBS5EJW4hcFJ0NTQTv75HA36W
         P8n1tWaZbmN1fSMMYQc8DojvOtL6J89gPAO4E4uUSKyf4JNwkSzeNYeoyhf0JAKQNCMV
         TcR+lJCX/Wyf6Pnn4c7ofWzlg+UTlWFoaT2bDgo/3D19ISbp44K+DE9AZup5M2RjR/5k
         Lb0Q==
X-Forwarded-Encrypted: i=1; AKwUvByCCHHX5xZnPyOX6WWcOlMYGLn9QhtGw3calA4w/V/fO9zf9OpQbJOE/TJVd8w5KFwCdeIGsLJi8rcZMY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/xSSAmFmuzlu+8FBljsCiuKIPU4RUlWyJmR5H8sS+kh9jJCbq
	/DcJ+ZQvT2yLw/IvF1b5dZJeakhx61dAza050LFjHExbdP/CgpRhbQymLksN1zke/li2+lZJPhE
	vbZGR31tgU/a6cbTi78hDPgO63zsAegw=
X-Gm-Gg: AYBFou12NjSJZowHXX0VBdWyuUqki+aP72kNUh5Yb0jmFunk2e+Ho0YcO2MuTvQGMMQ
	cuy7jtzglpaC++5ghMYo6znNUyZCxLYJegVEjFQr+NTymTgSz0pS0LkHjYsdLaAMy5ONZWSM8KQ
	s9fg3//KhICcgiXAbRyjDYlCH2PJ9eMlqjJelWP5TfkXdfs0JFAnf19FR36F1up68Sytjca45EM
	gnSZXGIJx8gLA7uSRyQR2cT1DqOR4qtJ4oxM1S8BB8SbB31U0I85E+6etGBP0nmIxwYlvWyHG3k
	4qsbblkOlFGExccxxpGzo8Oa4O2V5jtd39075z+swbbCfyFN3T5iTTEof52vroed9MaM0yQ7Qeh
	sPFRNbs868/DvIKW6Yo8ailaYC21uFvnpSu85gaQjEQ==
X-Received: by 2002:a05:6820:1382:b0:702:af73:be5e with SMTP id
 006d021491bc7-702af73bee0mr327002eaf.37.1792145745743; Fri, 16 Oct 2026
 03:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003184217.34671-1-mikhail.v.gavrilov@gmail.com> <65584p23-91oo-r3o9-84po-7r7679278pn8@xreary.bet>
In-Reply-To: <65584p23-91oo-r3o9-84po-7r7679278pn8@xreary.bet>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 16 Oct 2026 15:15:33 +0500
X-Gm-Features: AclHuK_jxLyvBoyWgfXad4Q9KbjUS7aENODGbRm3o0iIJWM09iFwu7vz4AngPWA
Message-ID: <CABXGCsNRqYPtKFMtmcREH+Dti_wSRCBb9iCSEg86zVBJO5acyA@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] the Topping M62's vendor controls, on the
 component framework
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, tiwai@suse.de, tiwai@suse.com, perex@perex.cz, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 2:50=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> Acked-by: Jiri Kosina <jkosina@suse.com>
>
> Takashi, will you take the whole lot through alsa tree?
>

Thank you, Jiri.

Takashi, please hold off on v8: v9 goes out tomorrow and replaces it.
Its 1/8 is v8's 1/2 unchanged and carries Jiri's ack. Its 2/8 is v8's
2/2 with changes a user would see:

  - v8 treats the M62's Mobile Mode as Pro Audio Mode and writes, at
    the first bind, two output selectors that Mobile Mode does not
    have; v9 reads the mode from bcdDevice;
  - in v8 an input gain the card has not reported reads 0, which
    alsactl stores and writes back at the next connect, muting AUX, BT
    and OTG IN; v9 writes every input gain at the first bind;
  - "Mic-1" and "Mic-2" become "Mic1" and "Mic2", as every other
    control name in the tree has it and as the M62's UCM profile
    already uses them.

The other six add the E2x2 OTG, the M62's battery level and port power
settings, and both cards' MUTEs. Two of them, 3/8 and 5/8, are HID, so
they will need your look as well, Jiri.

--=20
Thanks,
Mikhail.
