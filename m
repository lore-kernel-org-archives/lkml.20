Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE9A4CCDFB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788493814; cv=none; b=qrFf+vsQCxaI1sp+cqZpBvSTzAmeE992qWx3EjmBfNfxvBmx5BiyE7oyEPleFlsAsKu6jaJzgnbmri9YEAVJBcVygPnY9s7TG9WeCWP8msY1udYUM/x9qGF+pkb2zToafavBIyvXHb70P2MtkLVzhUQvf2NRQ5YfOsf+ej8yMfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788493814; c=relaxed/simple;
	bh=GI9qra2mc1OBA/mnKbX/5DgNvZ85PoXWaWJ7afr/iYw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=BURy7T0F6YJmKZYU63pQI4v3biZ1ybx2DAVwk+HKcCbXgDqdMJRMN/8MpbYjWi68s4ymFclqeT6vORFAMzdyME7xItLMRcnfrFxqMW9DdwlFlgqO9pNLnZ33q3tJ/Uv7ETBKAmf6qt24V2vC2cP8TeB0lyN5ldbOCLpec/DXDzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b163fddf0aso1744199eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 20:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788493811; x=1789098611;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:in-reply-to:date:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GI9qra2mc1OBA/mnKbX/5DgNvZ85PoXWaWJ7afr/iYw=;
        b=qER+f59/x0iUTnrR2obsKLp435TvviWmlvgmMsc9w39waoZBzCTZQLPr7KoHNQWsR0
         4PbXKeC2UFPWfuJCLZcNFlJoXLmlmYGD8jVTltpdaW5M1jcXDLz4Ax++DYuOQiQ2sMMe
         C3A6NGTxPMwniqAaZmEinMBtpME3UODsGW12aXcO6kLbIPcWur8hfV2Hu5yX8yXDRWAI
         HdG/RO97zqXwTmy3niZOFB9Ef/K4P/frzSdo5uMHW/z1N2WtMrwAH0okoCumKlrbzfBi
         XoVgjQ0l2FFkqXmJMpY6YT1Cp5myvdmpj7KbWrvqeivCelCBOdWyr/tiS3uob5fSA5ZX
         xE2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGQk13V13HzGkHSmoeR4EEDZ5qpsp0uy9aiyyrhCqzc4e5PwRLLQOYl16pbUh311N6D2zxkeX9lfMaBRA=@vger.kernel.org
X-Gm-Message-State: AFuF++lyW6swlVlJ1vLrvARvLcm3uDCtRuuuUnfkmcFH6GYQc72PjgV+
	+nDWageAJY5sPdt0mMQmMmy7jJKAvtXYQX991Gxca51KhlhGb3Es75f0aaVntux3dqYcN01j2wF
	XtyFUDWYU5aC1BljBmUjkmsuQrMQay56s+DuZEyz4a59sgNeHeqxtUciw95A=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1886:b0:6b1:3534:a5bf with SMTP id
 006d021491bc7-6b5854bb7c9mr4949767eaf.14.1788493811434; Thu, 03 Sep 2026
 20:50:11 -0700 (PDT)
Date: Thu, 03 Sep 2026 20:50:11 -0700
In-Reply-To: <a39a7d13-8f39-413a-95bb-74a86c2803f3@me.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9a3ff3.0b659fcc.16ebfd.0005.GAE@google.com>
Subject: =?UTF-8?B?UmU6IFJlOsKgW3N5emJvdF0gW21lZGlhP10gV0FSTklORyBpbiBjeDI1ODQwX2luaXQ=?=
From: syzbot <syzbot+9123948aef13fe92d706@syzkaller.appspotmail.com>
To: m.harisawan@icloud.com
Cc: m.harisawan@icloud.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> #syz test diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers=
/media/i2c/cx25840/cx25840-core.c index a8e21a28174f..6df912c9381b 100644 -=
-- a/drivers/media/i2c/cx25840/cx25840-core.c +++ b/drivers/media/i2c/cx258=
40/cx25840-core.c @@ -2298,28 +2298,26 @@ static int cx25840_init(struct v4=
l2_subdev *sd, u32 val) struct cx25840_state *state =3D to_state(sd); + if =
(!is_cx2584x(state)) + return -EOPNOTSUPP; + state->generic_mode =3D true; =
- if (is_cx2584x(state)) { - /* set datasheet video output defaults */ - st=
ate->vid_config =3D CX25840_VCONFIG_FMT_BT656 | - CX25840_VCONFIG_RES_8BIT =
| - CX25840_VCONFIG_VBIRAW_DISABLED | - CX25840_VCONFIG_ANCDATA_ENABLED | -=
 CX25840_VCONFIG_TASKBIT_ONE | - CX25840_VCONFIG_ACTIVE_HORIZONTAL | - CX25=
840_VCONFIG_VALID_NORMAL | - CX25840_VCONFIG_HRESETW_NORMAL | - CX25840_VCO=
NFIG_CLKGATE_NONE | - CX25840_VCONFIG_DCMODE_DWORDS | - CX25840_VCONFIG_IDI=
D0S_NORMAL | - CX25840_VCONFIG_VIPCLAMP_DISABLED; - - /* add additional set=
tings */ - cx25840_vconfig_add(state, val); - } else { - /* TODO: generic m=
ode needs to be developed for other chips */ - WARN_ON(1); - } + /* set dat=
asheet video output defaults */ + state->vid_config =3D CX25840_VCONFIG_FMT=
_BT656 | + CX25840_VCONFIG_RES_8BIT | + CX25840_VCONFIG_VBIRAW_DISABLED | +=
 CX25840_VCONFIG_ANCDATA_ENABLED | + CX25840_VCONFIG_TASKBIT_ONE | + CX2584=
0_VCONFIG_ACTIVE_HORIZONTAL | + CX25840_VCONFIG_VALID_NORMAL | + CX25840_VC=
ONFIG_HRESETW_NORMAL | + CX25840_VCONFIG_CLKGATE_NONE | + CX25840_VCONFIG_D=
CMODE_DWORDS | + CX25840_VCONFIG_IDID0S_NORMAL | + CX25840_VCONFIG_VIPCLAMP=
_DISABLED; + + /* add additional settings */ + cx25840_vconfig_add(state, v=
al); return 0; } On 4 Sep 2026, at 4:09, syzbot <syzbot+9123948aef13fe92d70=
6@syzkaller.appspotmail.com> wrote: #syz test: git:// git.kernel.org/pub/sc=
m/linux/kernel/git/torvalds/linux.git 940de590b839f71d6dc846160534bf202401b=
8b7 diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i=
2c/cx25840/cx25840-core.c index a8e21a28174f..6df912c9381b 100644 --- a/dri=
vers/media/i2c/cx25840/cx25840-core.c +++ b/drivers/media/i2c/cx25840/cx258=
40-core.c @@ -2298,28 +2298,26 @@ static int cx25840_init(struct v4l2_subde=
v *sd, u32 val) struct cx25840_state *state =3D to_state(sd); + if (!is_cx2=
584x(state)) + return -EOPNOTSUPP; + state->generic_mode =3D true; - if (is=
_cx2584x(state)) { - /* set datasheet video output defaults */ - state->vid=
_config =3D CX25840_VCONFIG_FMT_BT656 | - CX25840_VCONFIG_RES_8BIT | - CX25=
840_VCONFIG_VBIRAW_DISABLED | - CX25840_VCONFIG_ANCDATA_ENABLED | - CX25840=
_VCONFIG_TASKBIT_ONE | - CX25840_VCONFIG_ACTIVE_HORIZONTAL | - CX25840_VCON=
FIG_VALID_NORMAL | - CX25840_VCONFIG_HRESETW_NORMAL | - CX25840_VCONFIG_CLK=
GATE_NONE | - CX25840_VCONFIG_DCMODE_DWORDS | - CX25840_VCONFIG_IDID0S_NORM=
AL | - CX25840_VCONFIG_VIPCLAMP_DISABLED; - - /* add additional settings */=
 - cx25840_vconfig_add(state, val); - } else { - /* TODO: generic mode need=
s to be developed for other chips */ - WARN_ON(1); - } + /* set datasheet v=
ideo output defaults */ + state->vid_config =3D CX25840_VCONFIG_FMT_BT656 |=
 + CX25840_VCONFIG_RES_8BIT | + CX25840_VCONFIG_VBIRAW_DISABLED | + CX25840=
_VCONFIG_ANCDATA_ENABLED | + CX25840_VCONFIG_TASKBIT_ONE | + CX25840_VCONFI=
G_ACTIVE_HORIZONTAL | + CX25840_VCONFIG_VALID_NORMAL | + CX25840_VCONFIG_HR=
ESETW_NORMAL | + CX25840_VCONFIG_CLKGATE_NONE | + CX25840_VCONFIG_DCMODE_DW=
ORDS | + CX25840_VCONFIG_IDID0S_NORMAL | + CX25840_VCONFIG_VIPCLAMP_DISABLE=
D; + + /* add additional settings */ + cx25840_vconfig_add(state, val); ret=
urn 0; } I've failed to parse your command. Did you perhaps forget to provi=
de the branch name, or added an extra ':'? Please use one of the two suppor=
ted formats: 1. #syz test 2. #syz test: repo branch-or-commit-hash Note the=
 lack of ':' in option 1.

I've failed to parse your command.
Did you perhaps forget to provide the branch name, or added an extra ':'?
Please use one of the two supported formats:
1. #syz test
2. #syz test: repo branch-or-commit-hash
Note the lack of ':' in option 1.

