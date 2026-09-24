Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D75C42F6F6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233876; cv=none; b=nqAOP85PbB2bPqbVUm2ujrtwQkXLqyqQWrptAri8MbFFNnSE/3b3l0nSQBcJfy2zbinIZ6NSRtd03BY+b51qkfcD9xOqRPxNIglM3WqZEE1Y5CS6N8M065iZEVH8xtoXDZSK/k/PmobaRfMTL4puxK4i/NgQX9nUAGq9QAuB4/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233876; c=relaxed/simple;
	bh=ZuEmG6wBl2efC/945xSQ8zaEHszttX3U0I2BPYqa8Dk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jWuHMRkkPn8HcH/uKov8k+s0mt99ADP7TDfriwQhpKc67UDZ8YkLefgnGrMBQZ4seeSUGdbaoU8BQ8zvgkr+28HH4Ak3XobHwbxxuCWouncsFhJfn7Pd26tPGqHaqWiCXwvic6zcGXqGLQhVOLHPrFG2iiAZozByda1E4ueTCXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbZVe+Gb; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbZVe+Gb"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso1099170a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790233866; x=1790838666; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZuEmG6wBl2efC/945xSQ8zaEHszttX3U0I2BPYqa8Dk=;
        b=rbZVe+Gbn5WFoJNWmttbn9T/hrYcccuJLmz6b3bzQl6q2MqGIUboFWOOmhhTch1bzg
         YdebHXD2Lo8i4NywcmFbsCrZl92FnGBmPT0h2iB0adZsv3S4peYyAaH2ipwstoBOR9xm
         /YFPMuytnpUVsmCs0cJOG+iIOsWtcF4csBQhcGK4CorslU+0A7hh68DlIxalJgEks4L0
         XJEhblVZbug6X33LZNCMGEstqXkZ3q0aw5zIFXacMZylwMpoosVSmvtBeG/LB7PgidN+
         y7a84aLPMi/yfqx5QWIcxPSjvB3/RNrLzQY2bTYN3EAk5ibazlHpRFx1sUpnTj6uhU0W
         +yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233866; x=1790838666;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuEmG6wBl2efC/945xSQ8zaEHszttX3U0I2BPYqa8Dk=;
        b=fMNvKfmCk0wNhYgQygUdVcIfMaTl7L/a8M7PrTRlZyJ5cAjkYFJIs8uSe/0+L32CZI
         o0iEO9Bcv7NPtypnjmqUAIzudecxfUs3MvG2JwxZehoU5bWiI/hRCppObPwvawjefLaO
         7xsh7IzC1Y9clOzr+UNUv0EQgmal+o3infIKe3HMtqhjXCHi6eu3XijpiyCKVyk7uTys
         5H6wYE4ly9HxV+npVkqzE9tcb5GQmL4Vy2+J4Yrqaio+NRO13GeGqYUQA/vnI5OiNvaB
         dNtBRsbFWIaj+YqdsmWirNpi0GFMB2AA7j0xZkLYy8OeMr1LTRYPEY7vH8p5MOOOB+gr
         V7zw==
X-Forwarded-Encrypted: i=1; AKwUvBzDC8F8IdfbuN1I4N6z3UJh+CO3ooshclQr77hJxQoj6G8rzhje5lPSi0Vt9mXcr8+vgWB3c4DuofWTTxA=@vger.kernel.org
X-Gm-Message-State: AFuF++lMYRXFKn/umuGTys0EzHINkfamXrLg4RP+WcTEeHldilyTUAq6
	3JBixZ0Svf6nj/z3itMBosj9flYCGRf7qz59WujiIwvXTJBfrY41ZrmA
X-Gm-Gg: AYBFou0PDM2onM8qWhUkvxXRqoDaSgY7ypcO1MwmBPaas5oMtITXE7o/ElET4KRE3Az
	/EFhF52J5W924aXoCTVu2Z/hR/eGIinTNPaf/d3+6UVoh845D7J8HrRZZ9/bEvJPFsWTDpDWTXl
	Iv1AW6vivb1f3qc9puDdVo3QnKyQWms98Jv1xRYR11VOtzt68K3n5eO7JotjrejSgnHOhbkCaJj
	3uzD2KQYg/7Y3S6BT3XbBtohhH2gSB5v5Yq3rRR/u172kaN5kYq1U0dkxywnQRBFlqSC4DMSEop
	4hxZZya4/m1LUsAWHqyTPrghyx56V2GohCf/BGCxxm/gYF6m7X20Q4tXudloXHQopufJD237x3L
	hCuPoCtIDMf8bB1mDhdZNbcdTuyg6IdmuHMwm0NSX8SrjmHmIX9yuA+RxKs0MZE3ND7tUTzblNt
	nMoBhqJJ++dJsx7Jj5LrwHUmyKbyzmbtwZ1zuXP8UdUPtvBy8iFo4WDElI+V+YkPpJ2wdOfzBVs
	GQUa0lK1IX/BmutN027nrrA3e4=
X-Received: by 2002:a17:90a:1090:b0:3a0:a515:c480 with SMTP id 98e67ed59e1d1-3a0a515c8cfmr85375a91.29.1790233865909;
        Thu, 24 Sep 2026 00:11:05 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09738f2absm3113496a91.14.2026.09.24.00.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:11:05 -0700 (PDT)
Message-ID: <1eb267761bd627b63e5c78bdf76215c019aa3fa0.camel@gmail.com>
Subject: Re: [PATCH 0/3] selftests/bpf: Fixes for out-of-tree builds
From: Eduard Zingerman <eddyz87@gmail.com>
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>, "Ricardo B."
 =?ISO-8859-1?Q?Marli=E8re?= "(SUSE)"	 <ricardo@marliere.net>,
 ihor.solodrai@linux.dev, nickolay.lysenko@gmail.com
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, Emil Tsalapatis
	 <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song
	 <yonghong.song@linux.dev>, Song Liu <song@kernel.org>, Andrii Nakryiko
	 <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau
	 <martin.lau@linux.dev>
Date: Thu, 24 Sep 2026 00:11:02 -0700
In-Reply-To: <e4761ef3-4385-4ec2-ada8-70f293c14331@linux.dev>
References: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
	 <6f95ec90-194a-4304-9673-c7bb50065223@linux.dev>
	 <d3a251acf5131bea732e23bbd135a5fdebec9ad6.camel@gmail.com>
	 <9e055710-d607-4a4c-95c8-eb3a0b4aa1a1@linux.dev>
	 <2a1875a99b173fec18d214419efbe876dcd95ad1.camel@gmail.com>
	 <e4761ef3-4385-4ec2-ada8-70f293c14331@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-23 at 14:06 -0600, Nico Pache (Red Hat) wrote:
>=20
> On 9/21/26 3:42 PM, Eduard Zingerman wrote:
> > On Mon, 2026-09-21 at 15:15 -0600, Nico Pache (Red Hat) wrote:
> > >=20
> > > On 9/21/26 3:04 PM, Eduard Zingerman wrote:
> > > > On Mon, 2026-09-21 at 14:40 -0600, Nico Pache (Red Hat) wrote:
> > > >=20
> > > > ...
> > > >=20
> > > > > Given your series was defferred, and there is a "rewrite" coming,=
 what would
> > > > > be the best approach to working together (between us three) to ge=
t these
> > > > > fixes in that series too.=20
> > > >=20
> > > > The, "rewrite", as you call it, had landed today.
> > >=20
> > > oh thats great news. I checked on Friday and didnt see it. Thanks for=
 the update :)
> > >=20
> > > > So the series in question can be re-spun.
> > > > Regarding your patch on top of it, it appears you can just post is =
separately.
> > > > However, I am inclined to be confrontational towards changes like t=
his one.
> > > > The purpose of the selftests makefile is to run selftests as approp=
riate
> > > > for current tip of the kernel tree using a very specific kernel con=
figuration.
> > > > Main users of this makefile are BPF developers and BPF CI.
> > >=20
> > > Yeah we are trying to reincorporate BPF as part of our CI. It has bit=
 rotted in
> > > the Fedora env, and our large amount of build variant is where things=
 are
> > > starting to go wrong. We need to build selftests for multiple variant=
s, and be
> > > able to specify which variant we are building for. Hence the out-of-t=
ree build
> > > with specific vmlinux.
> >=20
> > Why can't you build the kernel and the selftests in the same out of tre=
e location?
> > The change you are proposing is contained, but it's a death by thousand=
 cuts,
> > the selftests makefile is quite a Frankenstein's monster already.
>=20
> Due to incremental builds, and tool building in different env's

Can you copy vmlinux to the output directory?

> >=20
> > > Is there any other approach you'd suggest? I personally dont work on =
BPF, but am
> > > trying to cleanup/fix our selftests builds for Upstream/Fedora CI.
> >=20
> > How many Fedora-specific kernel patches do you carry already?
>=20
> So far its just the series Im replying to here, and the commit I appended=
.

Okay, I was under impression that distros bear a ton of custom patches
and that adding another one adjusting random makefiles won't make a
difference.

If that is not the case, then I'm being unreasonable and the change is smal=
l.
