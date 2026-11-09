Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794268205;
	b=YWRjpVkcg+JVf124FNyLh/djncdBFxGFw90Lien5onXpl3xeMBO58+7KvAQG8dW4uYhj
	 Szgd7OiFDWDpS/Ee0ECc2TbWb3KsKz5mZInlqs7Ib9gatpnzS0RRbFU8le2vNEhcj4CN+
	 twasHmKmnPKV9Um4Jtke58zeRADWSnl7rNQnIQYs6jQF2YiHYVLYydq1wlkuipxCWi5FL
	 cvgMhQbVvaZDE8kJXLyenw1hmQe+EahhfPbjPR8AMpu+5fKOPqTylFDj4I0+NH/ciRXDD
	 SPBw6GZT+InPK4WZ/6eHPupY+/izHgwbGANJ1aE8fLBiNDAxNSNxCKPzsqwjRi/AOqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cm01sMqqIj/OrXGDnKJivC+LXfRPbTA7ayzBKhFeqVQ=;
	b=g/Xn+AIiCYz1kXN8UdCgs+Or5sIc1dqnse+ygs+yosCp4SbHxv23lifP7jpow8ZJO6cp
	 xi6NGDfL4U3EIH19P698s2eJGQGQ8e9bK3szE+zqFIeLgIiAk0FgOuLJYxkKgzJpFF4MA
	 c14UpFAg5kVzp4rYpUtrkEjWs+aa+n0gu8jsndVqKUFD3iPkYpAnskV2jaSPAfwNI6CKq
	 4Ph1PvcWe2zU7N4Wkstyr81JUlZaMvJ/guez7HWEBCvLHWElyUFytT6Fr4vDtnlZvamuh
	 2HeSpkh7A0/POrR9OeVE6i06g48mKCbkk5YI1Tg+XL4NjE3W+x+RDPWUi3ulHZX/vKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dPnHSP2z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023CB606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 023CB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dPnHSP2z
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9d7791b00so12363455ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:50:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794268204; cv=none;
        d=google.com; s=arc-20260327;
        b=HE9pW+6fjLn1+WY9B0rmdHYom2s5KR65MAFnsC1x/YNuxwX1vNIn0FdYMI7CPZ8y8R
         LWu4S54bRzX49m+FzogjYmJu0P57iy00q+pvGGzC1yw8aOhZ15QWJscreOBHMLtftTGZ
         SC1zM47uodQBobSDv+ef4ld3WJCgmgSH7FV4s/00Yo7j+jVf3HVCISEXi+yGKKwRYIcc
         +nEOP6nZGBwXZt5dGbGvcdXfVCZChqgbXkfMmqHdJBrv9fI4wJjMI9BNfdCdYokdlceX
         8cBDCIM/hDxauKr9taH48uExpWCslY+bzhyQLhdubvr47lkT0QsQP8umcj1W9nsiMpiB
         9W/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cm01sMqqIj/OrXGDnKJivC+LXfRPbTA7ayzBKhFeqVQ=;
        fh=+ON0rmx4oCyOFOIvTt23MT+0CWczwmn7J4E7FIerobA=;
        b=KszcyFeQpVnpZopXUVkgXjYPUrfj8XyKKYpEqjaRoiDoNxJc0l79d7DNjnDf2pt4D5
         3vbp3k00MhQxHfkgi2SVJtv83Ubw2E6E+Bm0rOHIpGPbz29T2S4ZarBcrNao8NgORpAV
         2Keb5PClKXa7+HFPl0UyY7aMOpznm3VD+gokaUUpazckpMSKbPVWvkHRIBDYHxa7G83O
         kJ1ewTBWsFr3/cZvwQZWMgNsatREYchAXi6kJmjNWm5V3T+xC9BwOMnRlrsffYBl9gB1
         8DxN3cq7BKjFANFvX18I61f1JaUpDit/kpN7LHn0gLHJK4u/JDKbjRA8OuaWj45VUo6N
         JGFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268204; x=1794873004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cm01sMqqIj/OrXGDnKJivC+LXfRPbTA7ayzBKhFeqVQ=;
        b=dPnHSP2zDpsF7kikfmEgH3jL7CZFLZKYBJdnKkb2xGHqFrC8NP7DLLKCY7QrXMn3qz
         jbY26tqVP0Jcfv/jq1hWlfs/9ySxxzoQ3NTN2zrHwCdyzfHRVcojykvalG87KZ9ITpNS
         MjWFsT2Qpae2/+rjBkUl7vibI9gv8yV5nxBH6dLNx/leDUbn4MFxkOlrZiToWCSZ7I9q
         jjbRumBC4xrwhNxqHdqXtXhgq8MM5ISZHF7Ih5K4F7IDLH96R/PIh3sSGJG5D0eGeGU3
         6+qQoVnezhB34FEl15Wz/qbk2Dme4Kvd4eTxdLMYVxF1RhdCDSnUevee/omaKOEBhMhx
         9oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268204; x=1794873004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cm01sMqqIj/OrXGDnKJivC+LXfRPbTA7ayzBKhFeqVQ=;
        b=byBizK/9QvR5X7OrHJrkZOtRwq2ILNl5SV8QgFpBLXzTZu9vPQpjz8FBYfoXtXlI4x
         difWFtKCGuKFCpNg4FaYOtplDbgEYOsKWelHhlqrhPPlnSgoGrJBqqfghUW+8JXbVyuR
         JQxyOustphlBSfvaKi41p6iuSqOOtFKSYEw4F57RkhOhp1Yb6uGIjetft3a9YMKZejLx
         5SFJV4Nj7xrrDElc0UURNhjco4ctUY6iKzzxL8soXxtX3+yx099NB1TlNtGHP1RuqqjS
         4SW0Azjbmj5GQq0slJ8fRavsIBJ0HBGRprCqrVHLsIXDS8U9t7FMX7nvUO0RkOl8ga0r
         rAag==
X-Forwarded-Encrypted: i=1; AL+hErG4yEMVqjXeBj6/k0f+YG2TenFj9DIxTSnYLKqw2Tvi0ouQUMbqjNkOLveroe4LsHXSqEFK39jvW0T/OmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yQzFJexTwD90x+y3ZUHZhe3klJhBqC/Yi3u/xiwDIujP9DBti
	Uc55B9b4RHOxkSv4xVRTpg4dFegSaqN8CtlTy98RpJeZSyeHcEGatOMTh3aY3opSpbY3i02f6+s
	XdNFUMbzYZ3TJgf5z654DUCq+ZkR0pVM=
X-Gm-Gg: AYBFou3bPg8GjyfU4IFJ9Nks5YzCt06T7KyQYP+WmB4fZ77vLLyqpQtlNo96BlAQEO+
	cUdYVhW8kovfZODiMnZYO3fYcLVgbLNwG2BZFAcVn/ry2ZcuLX/iqsjzYyEgogiGVC+PbEofNpF
	bxdH9s8q7qZIPl+viokRDDF7Ws8cb/67GGscIo3W0N52ohXeYeoE9LpxXdIPro1A1a0O6dGsFyg
	5QYzOpS7kmNlv0l2dqzXPnDgH9+oc9++xgARS3TWuNEzN9W62haWv71ASoQfY/IgqiXEVA95TGH
	BRroCmaOV0IqAcQR/gRvMmL+0CJcyNa7oaL5oRe5jaIIN5Xl7yGLDcryMqo/fcwm6IofEWzFYAm
	U2SYCChWmo3edh17MqwsAUSGqd9PWOkX8fEiAFiqC72DAJbjljxoeOugU8SWH1QD3uItU
X-Received: by 2002:a17:903:320b:b0:2e9:401f:f0f8 with SMTP id
 d9443c01a7336-2edb9253939mr6212195ad.53.1794268204263; Mon, 09 Nov 2026
 15:50:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAEzXK1pdhEyOgQ4owkeRmyEP6Pyfhk=OsMHdzU4xwNMCmCsd6g@mail.gmail.com>
 <20261109122908.GU2668804@noisy.programming.kicks-ass.net>
 <773C551D-6AFB-4180-BE2D-629B6C5D020B@zytor.com> <CAEzXK1p3SZdGHDxj9bnRU4NzK6Z8b2qFwg2z_Hz9yY2ntB10sQ@mail.gmail.com>
In-Reply-To: <CAEzXK1p3SZdGHDxj9bnRU4NzK6Z8b2qFwg2z_Hz9yY2ntB10sQ@mail.gmail.com>
From: =?UTF-8?B?THXDrXMgTWVuZGVz?= <luis.p.mendes@gmail.com>
Date: Mon, 9 Nov 2026 23:49:53 +0000
X-Gm-Features: AclHuK_pcx1MdpHVb2en-3CYgD-Cgz3_Dr3poSXVr6gLqXCbiqAFBW0V94L_bDY
Message-ID: <CAEzXK1rOrTEKDWojwFOf1ZBxhdVriZzotou=p+7Etskcp9zqmg@mail.gmail.com>
Subject: Re: Some observations regarding the ongoing x86-32 CPU configuration cleanups
To: "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, x86@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, thanks for your suggestions, yes ading CPUID, TSC and CX8 should
not be much of a burden.

On Mon, Nov 9, 2026 at 4:04=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> On November 9, 2026 4:29:08 AM PST, Peter Zijlstra <peterz@infradead.org>=
 wrote:
> >On Mon, Nov 09, 2026 at 10:34:54AM +0000, Lu=C3=ADs Mendes wrote:
> >> Hi everyone,
> >>
> >> First of all i would like to say that i both admire and appreciate all
> >> your hard work with this lovely OS. I do understand that maintaining
> >> some systems can cause additional burden on maintenance, but there are
> >> some aspects that i would like you to reconsider.
> >>
> >> I am writing because I  believe that some aspects have not been taking
> >> into consideration regarding the removal of the 80486 32-bit support
> >> from the kernel, namely:
> >> - There is this active Linux distribution:https://tinycorelinnux.net/
> >> and the Damn Smal Linux DSL (https://damnsmalllinux.org).
> >> - There are also these CPUs: https://www.vortex86.com/products/Vortex8=
6EX
> >> - There may be only a few vintage 486 systems still working, but there
> >> are also other new x86 CPUs systems, especially in FPGAs like the
> >> https://github.com/MiSTer-devel/ao486_MiSTer which is a 486SX core
> >> that operates at 90MHz and can use up to 256MB RAM memory. There are
> >> plans to update this CPU IP core to become a full 486DX core, by
> >> adding a FPU unit to it and would turn this into a usable Desktop
> >> system with tineycorelinux. There is a considerable retro-computing
> >> community that utilizes the AO486 core on the MiSTer FPGA platform.
> >> There is even a Voodoo 3dfx accelerator card:
> >> https://github.com/victor-fisyuk/voodoo-fpga-public.
> >>
> >> Overall i just want to inform you that some new x86 32-bit systems are
> >> still being sold brand new and can be utilized with Linux. I would
> >> like that you consider this with regard to how much 80486 support
> >> should be removed from Linux.
> >>
> >> Personally i do have plans to extend the AO486 core to have the FPU
> >> and would like to be able to run a modern Linux on it. It would have
> >> entertainment and educational applications. With tinycoreinux it can
> >> have a usable desktop.
> >
> >I don't realistically see 486 support coming back -- the thing doesn't
> >even have TSC. Getting rid of all the horrible (and completely untested)
> >code for no-tsc alone was worth deleting 486 support for.
> >
> >The other option is you actually implementing RDTSC, CPUID (and possibly
> >CMPXCHG8B) on your FPGA.  I'm sure that's actually a *LOT* simpler than
> >doing i487 support.
> >
> >Just add whatever instructions are required to get the bare minimal
> >32bit build working.
>
> It would be more likely to get x87 emulation back!
>
> Later i486's actually did have CPUID, and implementing TSC and CX8 (in a =
unicore system) is rather trivial.
