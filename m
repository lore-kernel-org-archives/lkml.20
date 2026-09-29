Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EF55349B9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702561; cv=pass; b=I7hjE+1JGg71GIAN+NlIE432n5m8YzabWBRPS/nLxNQMNxz1FMtMdATm38F8v3AljPefMNwNzCBDinX+oi1Pg1hqZWhkKBWMV+7eEOmn2kqPQsg6VqGzNEf0g3QqOtOUQa3b2FiB1+bQSbjPiDta6dEwUUK5/fp6KxtrFxB1tGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702561; c=relaxed/simple;
	bh=eXyEWE550+ycqkkgf2Pb87Qz+oDiZBp//OZdYRPDZCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mL/cVd0kNWHZ+6EGZx5hR/gl4fzKrGoV2dJzldoaHDfqrhmG/dnFne8C4q5nv5YchMjueT/v3FGw2R/ew3pfsy0R8BK6PVlS197gbfNUGJlBVFs6PwHXlhnlsCxX4BS8fVYugjift5u4hSmhfRTM3p7c/FJbK1CguQlji2WESuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ON5ZjlVC; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ON5ZjlVC"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f490bb27so2187317e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790702558; cv=none;
        d=google.com; s=arc-20260327;
        b=mczXI2DXsjxgAmQxCNnspQB3WveOaGwG5EB/unNyixBaEkcp6LOkXEix9WlQiQFgPu
         UQTA6lGLo0N+tmCN/cK36mwFSkgvakCsXgVRoM+5vB0V8a6pZTopGYe0Kqccf9IDf85c
         VQJqdxUOWoQRS7H1LGXApOA3CEch2UZTny57Z9B1gFcLIc3iBFA7gtrxWeY2ukk7fjuH
         y1MZD6PRhrlMpAKL8UIo9y29ofLck9Fo5rwGJIsF7MaEmkQFVrQOKLzV4sPZrimBymin
         a1AzGrYBDtbReQCJDAvZfEMhuFl017CK5j06eN/UOxHk/YrpoFwnWhpbrDKHPadAv1iQ
         ZZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wC73nxIKsVnxmirOrWNj6owYWyTLWTGRvdPe/YEwMgs=;
        fh=PygpJDP5KFaumiIFap8koEQTbn1aS6EbA4JReCc7EY4=;
        b=qEpo+YeS+h2WUydppArD1txuGVgdhz7eQRuYeYF1YIywqif6ZbOUmCJ5INXlUI8CjT
         eOVDbCVgMx0mFMuPtNVchx3n1Ysq6A2s/MriKefQARzusfL6SB+r0ZEi3eaAL/B4qjXg
         omcB1IDcKyI3Zs2UIE6MYeLpL1OKXXslRqVhBLyYO3xL+BG7NMnCt2OiCx7LlV4/v2tb
         yyUQbFsORqx74dRK3QkQhVqZlUx+U+0l+6guiLcdeZKVBgwfbXHoo1J2OLiau0p6RZsz
         mAdoKYumxg/d0uOcj2gFeJ1xQrYqcWKoOyZE0VuIBMYTApnJvyFMcvUQp/9ZsvDhCp9Q
         vtXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790702558; x=1791307358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wC73nxIKsVnxmirOrWNj6owYWyTLWTGRvdPe/YEwMgs=;
        b=ON5ZjlVCqB/TYA5/JG+HIffUcoeWHrUc2YnR4RgoPO6MuTy4TVUSzDWTA8NW4GRVbl
         nygA/N/lNdMooKu58birVRuuHjv/jD9/SPXvlWO+7UtXhImZzyvHwy+EJPKFUiRsVRSB
         JLHTFE4v5Am8GIq0NyugClwC10zo2hQ6+1lPwpGIoqlbOD0k4KdQHogxTBHGk2fBRGzV
         uztfTA53KoFVgec9MCIRtY2KsluAdRAbUVgvc5evHqe2NQZ5+mZdnD/Uu0Lz+HdW9wmy
         fX4Z62p8IhCk+Ssh/y4zZcujA4e6Uw2u9D6PK0Z0479jvsVv2m1NIinONx4GrcxZTPnu
         IqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702558; x=1791307358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wC73nxIKsVnxmirOrWNj6owYWyTLWTGRvdPe/YEwMgs=;
        b=GU/yh2FUxxbyDGPoHx+dDnc+WYdrRigNBeE/S/gy1lT9ZMUh2t04PRbHjW+HhYq+J7
         n8mr+kRFzkyDgOx6ZxXsdkR4sM6JS+v4zpPidulnUlR8ZieNHLB9aFXh0dfPhsbzqk2J
         6oiyxzyuMxe+kTHfO97CXpcJ7jmQJhOwkJRym+9YS4TdCWF+wYiXiD4+AxY4wG/DvNMw
         Q4iYiCaZOxRb6fmqWz3H9THqIUU5rtCNcJY7RytuPQU5ZGgt3MTDsXpK6tgtsTEVc8qQ
         QodSYmFWy9d1v6wqt8nwv1+4hh5sIkGj2EznLErQHknP3QMNN9FDloI6ysZftZnwzn2S
         mKvg==
X-Forwarded-Encrypted: i=1; AKwUvBxgtM+OTKen/CeRRUrgm/MMAwkxb4l3lNQPyuC4DX8EXR6A/AYRT1Y5W/lfkDXDIO1Q0pWHfF/bjllbgwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2PQ4yYZopH8rdHevhrI8GsDVIsE4So6KD+R9mtEWkTd03jhN8
	YleQ4jjHB9/wFHEFIvREM+ys9XXETwJ9j1BlAWfdQgIst+baGl7lnmEO0QYHWtoNJ4VmeVqYfPc
	TY6qBX3T6pvYLvvfEu4sPYDSbtehycWM=
X-Gm-Gg: AYBFou13w8oHcjOIGg8WtKEnMo6/Rk9SdmdsFXOmh295/EB96PjNR+GjF1SIRqNQbJm
	vcVCR6S2g+kUSlpdU1PpQuwAq7DTwq/P2K5K+t883QqgNVEL8/N4+XZnDqAVW2iXYvRwTBhiGAf
	uCbdENqJKZFcS1tgZOCsuUqJxdkWTvsYJVsrkabvEILz4JAcwotsca8SQDUi2MDp610qu9Upsz2
	EaqsGTpzYG/9wbh1eufB83ePJfIx1s8NjiyaKV0qkFSr9OZicZeWckQATjbi2sfiz5qAXu7Zo3N
	9fOib3igkKVKSRsLR+wG9mKl+szYdKdpPjtrwwfppJaPLX/+IPJvxVag64IW2eVzh6VXvgYbxJD
	XcBK5y5o0uG9L/mQRExXwaou/GojfJ0dzCwaS5hVT9vqQ
X-Received: by 2002:a05:6512:2348:b0:5b8:edb8:fa41 with SMTP id
 2adb3069b0e04-5ba3beca9cbmr77162e87.46.1790702557344; Tue, 29 Sep 2026
 10:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-tegra194-hda-sdo-v1-1-f7a636a07a58@gmail.com> <aruc3qx7izFQYOhC@orome>
In-Reply-To: <aruc3qx7izFQYOhC@orome>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 29 Sep 2026 12:22:25 -0500
X-Gm-Features: AclHuK9LkfgEQsoTN_f-0RfKykcFSMYOYJZq1Uw5H4JV_On6s3wU6oygXAoVMzw
Message-ID: <CALHNRZ8RLs6mXkYiZ4qRimmf4WzpWpnJ9racWTPH__Op2Nk8kg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/tegra: Re-enable SDO workaround for Tegra194
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, linux-sound@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 6:12=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Sat, Sep 26, 2026 at 02:24:19AM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This workaround was originally added for Tegra194, but no longer gets
> > applied for it. Commit 615d43540043 ("ALSA: hda/tegra: fix tegra-hda on
> > tegra30 soc") changed the guard to tegra30-hda, which worked because al=
l
> > affected archs had the fallback compatible. However, commit 7f0ea5acfc1=
9
> > ("arm64: tegra: Use correct compatible string for Tegra194 HDA") remove=
d
> > the fallback compatible for Tegra194, causing this to break.
> >
> > Fixes: 7f0ea5acfc19 ("arm64: tegra: Use correct compatible string for T=
egra194 HDA")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > ALSA: hda/tegra: Re-enable SDO workaround for Tegra194
> > ---
> >  sound/hda/controllers/tegra.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Maybe we should move this out of of_device_is_compatible() conditionals
> and into hda_tegra_soc instead. That would make the checks for this a
> lot more consistent and robust.

I received a notification from Takashi Iwai that this has already been
picked up, but it was only sent to me and not the list. Not sure why.
But looking at -next, it's already there. Not sure if you would want
to have that pulled back for updates or do followups later.

Aaron
