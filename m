Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505157;
	b=htAA1V7x8IWvdG7wILzW+QrgD3ykKVPQ/Zn/7LtnVghqxGJa62c6PDG2LHdrPyn42X9c
	 yL3EmE1d7O33vAbIkKDO3ackSWBapgRA2ytS+Up079nV4NoHExu72SmG7Flc/+xhK+KBL
	 7j3k8Z2rOer8HvZjqQ4e+gj7M6hhZqbapOanJC0e6lWt7gwtV6jPAxyjPamwFIXgPL28Y
	 6bklDPCvdDwm3/ywaN83pPf6PHYtO4TFSgJ4k3kbCSfQYw/RDA6q44h80kb4zhMCGr0BB
	 ee29G2jHejD2BvV4lcxBbImQ3QDQXUJk2k+3B1BIjFy+RD09cbuU2UEPqSZofPd5syA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=LdMIhIlvZTbrlYO+3j4hIx5IHxpdtNc/p0dXdNrCqlg=;
	b=pR7xw4l5gnYjx5ItnHBZ6R3/0JGaeswk0rXnZ0qGlKluE50/l7Ep4AOGqf+S6gedOKTk
	 ysLsEtEX5b1YDAaqL51azjljInxTonZ7smpcfbKNQxRDrYJHdU0vU/gGyBGehd0iMy273
	 yjfRXYzBWz8PX6mVAS/2MFXzorN6fJKYJRxx7PvUHfP8v8hgV5AE761HzYJiSLH2sXYeL
	 5M4SXDf7tlBvr6CdJ+JN9jpTLveNuCvp5E6BLLRRuXg1j30fpx31Lm+tE0qD1/D9s+owi
	 lWfI97jlb5Q4jpTPLQAhCzXCmGx3zjIryobogkJCbg/LJMqNnkXxSZXturDFpY0Gw5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NU6pBVdp;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29733606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29733606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NU6pBVdp
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-675676afc3cso3270656d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505156; x=1793109956; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LdMIhIlvZTbrlYO+3j4hIx5IHxpdtNc/p0dXdNrCqlg=;
        b=NU6pBVdpXdS4zzTYissdBw/MDiiN5o5TlNwj//ZWFnIayDvxx9gDu9+hdW70Te0AMR
         lJOPDNX3EmmlHKf5SjsRkfUSpS3+vwRua3DVosyQsGKHGKo8S+9RGOYoBbLl8ZOPexOA
         xzzglLS59r9xTw+UX43wdSNz+zCsYBznrlPO1wxAJjJ4ycSSJkzbxvTL8dKWPvUT1ygb
         zxmJFdEkKjhoPc+3QVIuFZWAzX+hKcUJT4cDBEGwXNO0XgunVCxvpiHtJFEnynNZm9WC
         9StBMW9IYTJjpXxeP7pcleHsubJyMN/oKAkLJ5fmcxcdypeboIphMuGXqduwxNwTdvi8
         u7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505156; x=1793109956;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LdMIhIlvZTbrlYO+3j4hIx5IHxpdtNc/p0dXdNrCqlg=;
        b=e00tMkV5tfHWJkIkrb7eMjQf4XnbKLPAZDu3RPuzSj5xbkFvlhcCd0YWCV89WIf8Wo
         vEt76F7luQvQYkx7p/BhaPwHbSeepatyj9dtT6XFnXKDfLuTFdvEOsFZ8XIz6ANiuvse
         Judx9kYc3Mhf+gJMi+L/kmVkebE7Jlp0wB+41iUXCaCTRYA/VUnsblNFHfuf26qJanKi
         YxwbDOnOX7uMEA4HRdCYrh+TWNc11bOyJQjseJX965DkmO6GPWRApRG56yJIBy2+z24N
         ZsGigoLj2USBo6yDstt9hwrvBwcisIymWgjuKTEtgYG3hkKt/+KLcAZpWs+GA4lwlk0G
         Xytg==
X-Forwarded-Encrypted: i=1; AKwUvBzTVKN8jFWjQTuULIRtIpIIojFAvN2IFpoF4IHiV259MpRDkA06GUzH4LG4bhuqni5kUBP58CSzyB/POOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbTq7s/82EwQDwsWFBcABkObxdSQ8zoHLAE+Tkl2Cr9qqKh2Gl
	4A4PIYDdqeKqLwdBSgLnu5D6xYYJO71wbyPQWPKPHMzo7X4ufzYDcNB0
X-Gm-Gg: AYBFou1pcuPNBLtk6wskziOehqzrFBKmOL0A3WJp88JZcBSwDWwTH7F52rzcNsazOFD
	HbGlC2elRyeR4qdWHC9QoswDmioAcdtA3ZqeYXGfgo5lMptJwAvSQ2quItGWyX7ySJ8Ti6+V2uY
	ov+93MdYLRynpyEjhnwpTy6ARAKRmUt/uCEDziK5KZLqiCyHuJOoSsCQ5lLT3yp6s6y+Ldap408
	dnlQQGCiZCY9I5ctomTVzF0JrAfbPjrbu+TURaO1gqVYxYUrxt8s/YXkuQ/G0GOWfpmpJkaEdBc
	VqqV6edVwCQEy1bAwe+8DSfp0C90saXJE4MWtczV+9STM1TbRaUliX6OFAMSMWFzvJ8MwxM6B90
	+U11L7rddF/LJHgzbzy8EV5iRlrpyqkrTJYaL79H2oVLK2BtgkfW6Z9mdirn94LnvBGo4Ekpb0b
	rHCZHrylEZo1V8uom2GGuhDaRVbfT0QI8JO9ymTbAn6f9QHgT4CgZnSgW2TnqPpAZsTe/p81w=
X-Received: by 2002:a05:690e:1443:b0:679:aeed:8900 with SMTP id 956f58d0204a3-679ca7343eamr4757054d50.22.1792505156161;
        Tue, 20 Oct 2026 07:05:56 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:8701:205:573e:17eb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1c94c25sm5269200d50.3.2026.10.20.07.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:05:55 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:05:54 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, linux-fsdevel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Mateusz Guzik <mjguzik@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Tingmao Wang <m@maowtm.org>
Subject: Re: [PATCH bpf-next v1 00/11] fs: unified VFS ancestor walk for
 Landlock and BPF
Message-ID: <atdw4wVVarvwgRH0@zenbox>
References: <20261013164800.2906577-1-utilityemal77@gmail.com>
 <DM6PICFFAU5Z.14KOZT5YJO7MA@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PICFFAU5Z.14KOZT5YJO7MA@gmail.com>

On Sat, Oct 17, 2026 at 01:02:40AM +0000, Alexei Starovoitov wrote:
> On Tue, Oct 13, 2026 at 12:47 PM Justin Suess <utilityemal77@gmail.com> wrote:
> > The structure is unchanged from the RFC [2]: a stepwise engine private
> > to namei.c, a callback front-end for in-kernel callers (Landlock
> > is converted, fixing the follow_up() race Al reported, hence the
> > Fixes: tag on patch 3), and open-coded BPF iterators over the engine in
> > referenced and rcu flavors, with bpf_path_ancestors_legitimize()
> > escalating from the latter to the former mid-walk.  Patch 1 is carried
> > from Song's series.  See the RFC cover for the full background and API
> > listing.
> 
> Song's series stopped at
> "It is a conceptual dead-end to expose these two modes via separate APIs
> and leak this implementation detail into non-core code. It will not
> happen as far as I'm concerned."
> VFS_WALK_RCU, -ECHILD to the caller, two bpf iterators and the
> legitimize kfunc are that leak.
Following up on this, plan is I'll submit v2 of the verifier fixes
series and get that finished first.

Then after that I'll do a redesign around a single iterator
implementation that decides the walk type and abstracts away the details.
It will be KF_RCU_PROTECTED and callers will need to break out of the
loop to do sleepable work. They'll be able to acquire the path
references with a kfunc to take them out of the loop.

That drops the __uninit iterator changes and the legitimize kfunc as
well.

> Landlock still passes flags == 0, so nothing in the kernel walks in
> rcu mode.
Mickaël would you be interested in the hybrid walk conversion as part
of this series? Or prefer sleepable walk be retained for now and
converted later?

Justin
> Patches 1-3 fix a real race and don't need bpf.
> Send them to Christian, Al and Mickael on their own.
> 
> > Verifier fixes propagating the RCU-ness to trusted fields can be done,
> > but it's best as a separate series where the idea can be examined more
> > closely.  Then marking the dentry as trusted will allow you to use the
> > dentry xattr kfuncs.  Nothing in this series strictly depends on having
> > a trusted dentry, nor will marking it trusted require changes in this
> > API.  See my follow up [4].
> 
> Then what can a prog do with a position?
> pos->dentry is untrusted now.
> Marking it trusted will require changes.
> d = pos->dentry is not linked to pos. It will stay trusted after
> bpf_path_put(pos).
> pos of the rcu iterator points into bpf stack.
> MEM_RCU propagation fixes neither.
> What next() should return depends on how the verifier tracks it.
> Let's do the verifier part first.
> 
> pw-bot: cr
