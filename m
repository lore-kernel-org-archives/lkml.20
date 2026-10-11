Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E540547048
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791677220; cv=none; b=DlQN1qGpflQP+4IlpA0flujdxvDMCw11XrfCpNDbWShnIfgjYLxH4lpUo8LmXQxU2N11CgVbNcopCpXCq+yJZ7xwjMtvqVpBTWYys+itw89tYaH+Vh0bD8RTroKumZHBAUFme/AYRxKXzllOiy0DQHy19zdokeVKJa5BfytXaec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791677220; c=relaxed/simple;
	bh=CG0uTHItmcmhqt9Lvc+c/P0Vr5R14vyjB4XCP8/ZqV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghlBo5xFdHMSFMtWVZf/ZZ9p9rxw/ByMaG4dZt67PdGqC5g8RtklljQVoSnQ1lSDo0CLXDd2GU3juezKJ4Y6TDVw3CLFLwEV2rKg+SaJMRn5fv5Z1WWdUtKUJw9uM57Ag8tWlP5WNmU6DAmIS58AKL+soLLFTON/oauTjUlCjxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Sls0Sh1y; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Sls0Sh1y"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so249997a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791677215; x=1792282015; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSgUCpsH+Fb6uEES7mkxLJgbTP/ehiHu5SCQGcjmIAw=;
        b=Sls0Sh1yv8dx/igTfXAkGfe0Qqcbm4XA8+/HuG/ZWUE98oT6ZT9px5b5KzEN56fIjI
         +9/3f8vl3DsAjYZTmqHJJ7fGjLO5bijaE9mBSx+05Fg2OhU0nDiIbhT5Gdo88ONLAQoX
         tuoUTOco9vhptU5BR3CU/15KcY6gqEV2j+8cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791677215; x=1792282015;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DSgUCpsH+Fb6uEES7mkxLJgbTP/ehiHu5SCQGcjmIAw=;
        b=eI9hC+v5cEu+ol8cfvrrFjRS6voIzKhOCRelqk8om7ZTwGiaB3ukABH9yBLsmHRNFk
         od62mU/lRVbaU5t7qQ+Mh386DV+u8k0oAXtCZ9USuvOwSqAWLcBkC87P4jKelR+8Rk4P
         E/K223Ck4+DSJhrwuex3r5Ui6L8DJ+QaIFbhXKIiVVpJndzyfWiDSOHlhbrMwYSWvUsP
         Gge7h1nDdOWsNEV4TsdAp96Yap7jwAkfS9LEmXvBW/K0DCeZIIXcrWEwBKg44KOsocEX
         S7iPLjI1HJbUeoCU8JkTzEQXdVZOIoMRBV0F+4A2I0QFfXuLFSL5+4cl+h5UIm0xIhOg
         QUOw==
X-Forwarded-Encrypted: i=1; AKwUvBxqw6ZMleQ362VsValuU6j1U64ud7mxjgryYLTKitK4c98gpgso12f7s73mpSbY1NVJmzp6iCWHBDi4WzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9YkyYJEp0mQYhJ9Sfb7JiBT3en0u0DVD7P7KYLzkpEyvkb2AX
	JcuYFj7EECViF8EOEJYXcmoKRKaVOpombDN9L43fYVy9syFXwBGQOLkkWVQKq7SklVnvs/W2+nH
	mj9eei7PMNQ==
X-Gm-Gg: AYBFou1P12LHDn5d5pDbDS85b4UmNlueKxOMrSPm6faYc1X03bSjsk2xlJGlUuzJ8lA
	dgyhWWybtiaLyYaOEdf3RkzD0XOZT3fu5jxF7hqsrIvz7CIIqDaVsFXPhai8lKb37UVnbToLl5d
	nMbp3AWW0vySA/Sz0zrND+eL0BLLEK7DHohE6zL3JTWVGxu6BVYXWlThq51IIRXCCpvzUlDD7mk
	RU2utgqI/ZyJwPLXzGvWqO8OEf1Jwes7VPdDdXvsS3RyFkPbZijp5Ymp4aQIFkjO4mzXpsNqJV3
	79Rzqs/ud25t1UzrqcmKNPuWbY//WSRhXB5PcklSXx/3gVO4LGNcWqgVbG43L+tP1PLAxlxrnc2
	iX9cH+fOYqkSfKit408IN6WStcI1JbdBX/bAnH8JLzxR1POglHBQvJPZQcRnalPD/mfqBSF2V46
	5z339sefEO6AScYnB4BplARjcHbxX/8ZMbOAbN762td6480BgFuUo2r5cDJ57FL0NSN6U9FLnD5
	+h683cAGdY3TWbjh4OJ2R8VyVq48saIjODeJH5p9/boDJGP
X-Received: by 2002:a05:6402:1e96:b0:6ac:ae52:8b75 with SMTP id 4fb4d7f45d1cf-6b17c2c0458mr5273759a12.44.1791677215390;
        Sat, 10 Oct 2026 17:06:55 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1af0f1692sm243032a12.26.2026.10.10.17.06.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 17:06:54 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so249988a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:06:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzJxkH5s6G4IylYKpIy19jvuGzI4+m16AeeKVmwnmGyOfXaf7fe6vKFTnVy3NWaphZWNutPsFDortdtwrc=@vger.kernel.org
X-Received: by 2002:a17:906:7951:b0:c1c:4a80:30c4 with SMTP id
 a640c23a62f3a-c31a9fe8eb4mr617548166b.11.1791677214700; Sat, 10 Oct 2026
 17:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010234834.6C7001AC57D0@finisterre.sirena.org.uk>
In-Reply-To: <20261010234834.6C7001AC57D0@finisterre.sirena.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 10 Oct 2026 17:06:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiSL2hmOhLz6f_pY-SD+Q=2q+swkENsHhWvwtL8az1Wqw@mail.gmail.com>
X-Gm-Features: AclHuK8GyR5fBDbf-Z02MCF4fLm493K2cMbL4e2-7V5OoXoesVEFllLpKNpen0c
Message-ID: <CAHk-=wiSL2hmOhLz6f_pY-SD+Q=2q+swkENsHhWvwtL8az1Wqw@mail.gmail.com>
Subject: Re: [GIT PULL] regulator fixes for v7.3-rc6
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Oct 2026 at 16:48, Mark Brown <broonie@kernel.org> wrote:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v7.3-rc6

I don't recognize the signing key this was done with - and it also
doesn't match anything from the kernel.org pgp key repository.

Both of your recent pull requests used that unknown key. I'm holding
off for now.

                Linus
