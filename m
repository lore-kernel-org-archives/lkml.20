Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE7A4C227A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644019; cv=none; b=l57uuIrZTTQHAKu7cR9P3kVacuNkxdpdAsEFpdS1W7OwPttXoGFf6Kra13CNd8rYnPS+L/TBnx1iNGWL66D9tTCtTTHcOjyFyT6lSkt5dPaNHb8OtczjK7WidZ4zddJ/jDuI3nvxyKePqeKZ3r5F0T+MlOcFMGCfK4FPIVZ21Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644019; c=relaxed/simple;
	bh=LlxGdMXHAdX8taCMIhqIXD7uLIJKX+ph9Ruyy3ooAaI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=hyRgSycjIOMSeMjlOLuK9uUIxz6JEFLb12qk6fkw6XW1gkk9ur7IxrumlHgoLW9DRBv6lVtXVk6+BYrAG/6kqIkxOZwIj4HThzp7qi9g8E1icVjhT9e/4k2eH7hsNa8xZ0MbWye13l3DNr45ykj50gcV5i1qA21m0r1lR1QJy/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ujon/4u9; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ujon/4u9"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48351e5bb47so232129f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789644012; x=1790248812; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+g+yvkGeEUlWNyJpsteUjFqXg2BUoy498hjd0wgzrh4=;
        b=Ujon/4u93dRla03uTYoS2izgIrqQkjHxlou7MTB/wEAzr+IzPSODRlWF2nWRYoKb+m
         fOgZbYgYv/oPcAy0mzvyti63Fm2nehNlvrXH6QT4w6d0ozwKAqto+SJQCPSHkOtWwZXP
         W6W3UMO+OxZG8MdLwNmokiL7mJZrJihJU7yL8mQT0WVc/UELvxRduWNXQQtEyG8ATpyC
         oQ/nmG3lBkjrL4RdMtvIjnM6eKvus1otUnPmJWldGLAPtDhD4/vEND4KK3Cgsx4IJcIe
         rArFOHE3zZVRZuuVtxXuW6uc5ZJinTFrMkAFa8JR4Qu55PlPVXogGWKPK75nJuITGTay
         RaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789644012; x=1790248812;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+g+yvkGeEUlWNyJpsteUjFqXg2BUoy498hjd0wgzrh4=;
        b=aW5f8LcdseoUd4iMSzcbs1DPEq7T3BIjMrnOBOapTDtxoT0BfLdIwqLiZ50BrSbWhc
         89VgonyPc6LPknfyjKQe9ntchJBW0wUpD4uezb0WggiXwrXAXL+diFpNAAFAZA3eDFCE
         v3Q9yM1pW7rDkDGdGPKOJvH3KOBCmYCqDENjJDkdTdJLZQtkurHSp5lyt6kVXaL92gZU
         Rgb3RSTyRKPAdGazeoaO/OFPWV2khKXX373J2hGMaJo934shM4bJy2B3q/u9P3j2X4v8
         Fl9JcTFRWUJ20IcRZoNvlbEGujiMeFIABCYarT+k0l2oacf9AgngfwH+9sLIaLKkWyMp
         QO+A==
X-Forwarded-Encrypted: i=1; AKwUvBwzniCStBZ0gFwL2QvhD5fZ/FvBVkQ0bhQIAxWYfHwlfQ8SGufRbVbtfSBJ2qAhAEr+GC9KTpujkGWo53g=@vger.kernel.org
X-Gm-Message-State: AFuF++nMLz+vdIT6lWTFAodri7UvfGqr2Sb0kK0noDUCfqhN2gPET6SN
	PzhXiyfgAwkvTKcaRgoQ4jY/v5CS/qA2LE2fWZAv+KC6diGEAmIjJWmu
X-Gm-Gg: AYBFou0x2twbmpbm1agUxHr60vjfJ869wOrOg52p3Salp+6+XB0iSxeLYfFYvrGZuUv
	C8G4/Q9A7k4GAq02pIYhl7I29JePKeiIaH6CH8dK/RZQK/T7OFPvBcRaRJCgJSkYE904kRyGuqD
	hKWoS98GcCv+QBm+y7IDsvfyDDmoIvcV46sfqjieJtgJXAB0cTwqaej2PBfCBgJ1feH2BacMeKz
	KZUe3YTahDlQ5cwg9HIZEnOqQutiw4cp3RgXO2yeogAtC5tU078fq/Wm4ZmAi/wBRwZ94i2rDeq
	wIUcNJ8bI8YH+vZxgy55FXE1/cb3Riz2ekYJvXTQe84t5JeSI/8hcW+LxliNzcOMKiIQvFAqY3J
	MMWCEoC0ASBdHpszC1hudfeaSKc5OIvAM6fu5aDcDMf/rCIyWzkSJrBntE+7vAQrs1RustGUQrM
	zGJV+gl7t6lWPhM/ayrAH3TdfWZZ+p2YfpeKFrWyhdW0xTHUwkXMXP5TJ+0LnpSTUOkCL17dC4f
	cs2K7kSyjR1HxKHwkurw1soccsSLAa8wKjtj+GnMT6CLn6WPAH+8s8Bgquw4EVO54TLqwCdH35K
	YEGf6p/VvEspXvhO9MvVlLskUhVDolGeS1ofiho=
X-Received: by 2002:a05:600c:620d:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49eac46430amr164310975e9.2.1789644012140;
        Thu, 17 Sep 2026 04:20:12 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23f4e6sm80589305e9.8.2026.09.17.04.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:20:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 13:20:11 +0200
Message-Id: <DLHJUSTDSQ05.28VUGOV7YPS6V@gmail.com>
Subject: Re: Missing signoff in the bpf tree
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "bpf"
 <bpf@vger.kernel.org>, "Networking" <netdev@vger.kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-next@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <aqvBPVcN__UX8P85@sirena.org.uk>
 <DLHJEZ0K0FV1.SCQLJJQNS1ES@gmail.com>
 <66d3f5cd-12df-4000-8459-360ba57cea12@sirena.org.uk>
In-Reply-To: <66d3f5cd-12df-4000-8459-360ba57cea12@sirena.org.uk>

On Thu Sep 17, 2026 at 1:09 PM CEST, Mark Brown wrote:
> On Thu, Sep 17, 2026 at 12:59:30PM +0200, Kumar Kartikeya Dwivedi wrote:
>> +To Eduard
>>
>> On Thu Sep 17, 2026 at 12:30 PM CEST, Mark Brown wrote:
>> > Commits
>> >
>> >   4499609f99fd5 ("selftests/bpf: Test global subprog callback contexts=
")
>> >   3506b9a2f1085 ("bpf: Verify global subprogs in each sleepability con=
text")
>> >
>> > are missing a Signed-off-by from their committers
>
> Does the contacts list for the BPF trees need to be updated?

Well, he's the committer, so makes sense to put him in the recipients as we=
ll :).
Once he gets to this he can probably force push to correct it, I guess.
