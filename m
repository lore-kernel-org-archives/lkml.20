Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310214;
	b=W4jVj8ul/1O8NbpQUh8609e2g1rI3JP7jZMkkft6eAxjS6NATjhW8JNxHti8OKWvqv5Q
	 5otLR6aawmizEB/k0mPvgEBj5/pnMd3UUj/9VE1nrKO7WkEfS3Bk9uBNviIbbgdAqD3BP
	 oo37YMof2tE8megCff9TOQqqD4vrdBNwLM1i2ia4fak08XIwrekDFePyIYpk9PkR+vg3e
	 lufvlfpCMyiutDuAKqBwW8LB0aD8MgxDkNv3D+rcX/tJ8XayxB3yMqqnDxDzmbXQx5DGF
	 tJ19nDfmuFaypHzsqq6dfGA+iOm7SOfPYF1avp92+CGbaI4fph+4yNneS9CM4yCaOYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310214;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=K5H0dz5dbsDGoWuCekRcv1POB5vy3nZkuRXCnhU7kPI=;
	b=rDwbceb9LIj+8t20ZChFosHtKHLv9EbHbkau5AiWhYy9YHF1/eFwz30SZ52A7GU1D5JR
	 JwAOlZ+pWg13DY7cJq0+l+AliWxdQfDf6Wj1X2QtLeVchORkrLk32Pf2d6+E3jEMbbqvt
	 1FM75H3zLkjxdTSdPr1Zwfm5WsT2JqelB0PjAmww/+9MBWkZx/pziubZdqwrUPIQd1Yse
	 Zvjr2VHBqIHnqVusDvgAc7Ute3/HD0pnaIr9x/rqDvnSSFX0v/+bLE6G2nqrlIX50v2Pi
	 Ynu2yunS+j39wrOz2EezGeyuOjJPO27HHFnl/Nq8SSBC3Y04gMt8lH03OJGG6/B9yAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="ixmJ/hV/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F74606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F74606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ixmJ/hV/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E89C1BF3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:30:04 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48E243F882
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794310207; bh=rsCGYOGTSBUcdVShCpc2QjxywBTq8SQYSTxbo5VBt2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixmJ/hV/1ezStHTDHdBf2V1LO4mJz7XW03BLVeXs4cMDh2n9ssT5JBiaeqtEtpBGt
	 RcTXDrUJlZ43N2kmYEhzLkTr1sbZtK0zlO9IJX2R8F5fnTApTFUW+ZGWbVKw5hKU32
	 kF+ZXAL/+pz+OueuSmYKRWj8H7rTZY1wkGP4kH0A=
Date: Tue, 10 Nov 2026 11:30:01 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Chris Diamand <chris.diamand@arm.com>
Cc: Akash Goel <akash.goel@arm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Karunika Choo <karunika.choo@arm.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Florent Tomasin <florent.tomasin@arm.com>,
	Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v2] drm/panthor: Add more reviewers
Message-ID: <avMAOa8ujH5Qrf7D@e142607>
References: <20261030144305.666845-1-liviu.dudau@arm.com>
 <20261030144805.667158-1-liviu.dudau@arm.com>
 <6ce83db8-f696-4507-88e1-0e113b8da8a3@arm.com>
 <42f8e9e9-858a-4a0a-bbf7-daaeba368736@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42f8e9e9-858a-4a0a-bbf7-daaeba368736@arm.com>

On Tue, Nov 03, 2026 at 12:40:54PM +0000, Chris Diamand wrote:
> On 03/11/2026 10:58, Akash Goel wrote:
> > 
> > On 10/30/26 14:48, Liviu Dudau wrote:
> >> We now have more people that can do reviews and contribute patches
> >> to Panthor, so add their names to the list.
> >>
> >> Signed-off-by: Liviu Dudau<liviu.dudau@arm.com>
> >>
> >> ---
> >> v2: Forgot to add Chris Diamand to the list, fixed.
> >> ---
> >>   MAINTAINERS | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 89ea35a35c680..ef92c462a8381 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -2321,6 +2321,10 @@ ARM MALI PANTHOR DRM DRIVER
> >>   M:    Boris Brezillon<boris.brezillon@collabora.com>
> >>   M:    Steven Price<steven.price@arm.com>
> >>   M:    Liviu Dudau<liviu.dudau@arm.com>
> >> +R:    Akash Goel<akash.goel@arm.com>
> >> +R:    Karunika Choo<karunika.choo@arm.com>
> >> +R:    Lukas Zapolskas<lukas.zapolskas@arm.com>
> >> +R:    Chris Diamand<chris.diamand@arm.com>
> >>   L:    dri-devel@lists.freedesktop.org
> >>   S:    Supported
> >>   T:    githttps://gitlab.freedesktop.org/drm/misc/kernel.git
> > 
> > Acked-by: Akash Goel<akash.goel@arm.com>
> > 
> > Best regards,
> > Akash
> >
> 
> Acked-by: Chris Diamand <chris.diamand@arm.com>
> 
> Thanks Liviu!
> Chris

Pushed to drm-misc-next.

Best regards,
Liviu


-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
