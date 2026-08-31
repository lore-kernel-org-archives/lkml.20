Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6F038F259
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187779; cv=none; b=Z1wth/nHM7hkuXNQGfcZTZ5In056rsv03IOeQRo+aHkma6URLpiE5Q7RU0YlzoT9Z20+jjRjH532R+En7/eQWDDBKFRJDGwtp0Z4+lbKod0QzGzyY0+C4eTWMBTXi+N0ka4Z94Bw9aA2C6hyw+JTw7PYp4CpHJczCGvEA3HBOnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187779; c=relaxed/simple;
	bh=Dm0ekLFcAj/yuxpG982vzpaIOyejWJrwUkJ1VtsbJUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOWK9pvGpqunN1c6OH+Qbt7gdx5fBUf9gA6k45xdM7bpw8r2ZYrKkuZ3ISvIc+D+Zyw1jO/6TKlzRhet+3vAWug4EU4RDxvs0QgoTN43Ttq8QAPJyjRfd0Ot4qjamnJjMGwY1YE9EvlFQ+6N1yUXjUwtATn5nnOVjzAMhE60zi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIXic2xJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIXic2xJ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso3371701b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187778; x=1788792578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kEGzi152LLFM3BvwWAWBHGavgBqFineRqvqnk8g7Y6M=;
        b=bIXic2xJtZZN4/tBG8Kips4QF2r8k4v3+XTTa3ZvhPC7xL3489PF0nGQQVVJykqJTI
         Pf6lAr5+jQ6bq/rpbJTvBuHURFk5j1zolPHHqcxmaCRfzT7ObG57Apz+BRnXbeYML21i
         cjJHBkqqHX2N0wrfg5YX9OUdbnwpYeQAWnqI1xoqOcodbSfcbbSXsqtg4+Xi+pYbsqt+
         36Dh+iI5K/az8GISgZegxj0ZPEKXOdY/1tzQp3PT3+BWZ1BaLPrD7O0WtluWZB11k2IE
         52319fVvC5ithdcl+1w+vKHDdyb/c/U9i61Cg2kDKfFGMB0ytE8e86421Xcpv8wi1doW
         TeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187778; x=1788792578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kEGzi152LLFM3BvwWAWBHGavgBqFineRqvqnk8g7Y6M=;
        b=lThF/om0UyKPPxNtqvO24c0XIkojCz11UmkGcGka2Zv4xeurrsSmS+0hYdByToxNbw
         rpRk3gyZJU/snhevtbz4Niq0+jMofaJo4TL45KuMl+trvOSPCSwZQK1Kg22QdV2X+9ZD
         tSCeRSikVbbu9eWbDQWDLqshYgd9fX4wiecjoQwZcyZpLDvQsynucNy/gJ9ejo/WtXCv
         f3z7vFzdF8SU2RaXB3aAkmWOfpgIQ5onM44fJNIJ4PQgDEiV+WNMuAQ1gJx0Aprey0aH
         ldCowVW8MBLiQnO6KlSVn9PxXDZkUjLK4oK9BU5P3rvibyGCycVJwnffFZz+MYWP2CgT
         zCeA==
X-Forwarded-Encrypted: i=1; AHgh+RoFBP5dzn70Ur3lhD/ZsDGz3ISbtmZPCZ19Isw6ick3tPgjP0dsYAPEfyl6oAjQKqjbKWw4XKlMbhFIk64=@vger.kernel.org
X-Gm-Message-State: AFuF++kgfxVvwl4m5eQdYrz2zI0NjGgeETxK/FonTUudO7lzml00x8Uk
	W4DEEIL2U7Yn5rbUSin6Z3zPKU2BTNay27Jd0Q50AwSwTKMSUymxGJLA
X-Gm-Gg: AR+sD13qoFvYvNkiUu27v81ksRXLkkX5CTPAjBYfwz4grJsVBjd/1k1aDwg+D2l8aUx
	WUzDcAPhnqfa321vAUqefm816lk56LyMmFpkDlD3r03o2A4nmt7hjFxUuuMJja3L3tQQEOnsKGL
	ZNr1+fr/5aB+vI0UDlCjpUl+WvKPWjzcR+fp30pVAb1dpQYgqO2GB7xKvqo3Jgf4j5AKr3R750r
	roNAFe9bFK7oQrMz9R+LRHK6UaM2svzkNLddj05aS2PhEk1XPtH7HhUIULgYJPyKntOu5VEgjaC
	8Q3L2n17CZlO+rWY1gdMerMqdn/pnKtsY4wnDTWA1/s05ndU/Jvxkm+he9ceDhUUEv1dN9YQN85
	Dk0eNH8LEXrcNvNbYVFMGB4Y4Vs2we0FvTd637WJX47KIzBtYsf27HjNWTtq6QVR/XSJWNbnnnk
	fSErOrXSVAWZ/Lh/jFMYloCp8QOx4+Rf2xutswFT4gNpeaBqwcYMidTviv19UYLQolXclsIVwki
	fsB3LX5eN4=
X-Received: by 2002:a05:6a00:3021:b0:84f:6f7e:493 with SMTP id d2e1a72fcca58-85994a72e99mr6514150b3a.3.1788187777559;
        Mon, 31 Aug 2026 07:49:37 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fa7ec2csm3892702b3a.18.2026.08.31.07.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:49:37 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: linkinjeon@kernel.org
Cc: sj1557.seo@samsung.com,
	yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	anmuxixixi@gmail.com,
	dxdt@dev.snart.me,
	chizhiling@kylinos.cn,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] exfat: doc: add documentation
Date: Mon, 31 Aug 2026 22:49:29 +0800
Message-ID: <20260831144929.1597433-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831105330.10449-1-linkinjeon@kernel.org>
References: <20260831105330.10449-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The option list and the defaults match fs/exfat/, including the allow_utime=
=0D
derivation and the time_offset range.  Three things the table leaves out or=
=0D
implies.=0D
=0D
Most of the options cannot be changed on remount.  exfat_reconfigure()=0D
fails with -EINVAL if iocharset, keep_last_dots, sys_tz, time_offset, uid,=
=0D
gid, fmask, dmask or allow_utime differ from the current values=0D
(super.c:789), leaving only errors, discard and zero_size_dir.  Nothing is=
=0D
logged on that path, so "mount -o remount,uid=3D1000" returns a bare EINVAL=
.=0D
The reason sits in the code right above the test: the old values are cached=
=0D
in inodes and dentries.=0D
=0D
umask=3D sets both masks, and the options take effect in the order they are=
=0D
written.  Opt_umask assigns fs_fmask and fs_dmask (super.c:289), so=0D
"-o umask=3D0022,dmask=3D0077" ends up with dmask 0077, while=0D
"-o dmask=3D0077,umask=3D0022" silently puts dmask back to 0022.  The dmask=
=3D=0D
and fmask=3D entries also do not give their default, which is the same=0D
current umask that umask=3D defaults to.=0D
=0D
utf8 is ignored rather than an old spelling of iocharset=3Dutf8.  It shares=
 a=0D
fallthrough with debug, namecase=3D and codepage=3D (super.c:331), so=0D
"mount -o utf8" selects nothing.  exfat_show_options() prints=0D
iocharset=3Dutf8 only when opts->utf8 is set (super.c:132), and nothing set=
s=0D
that but iocharset=3Dutf8.  Listing utf8 apart from the group described as=
=0D
"Deprecated and ignored" reads as if it still has an effect.=0D
=0D
Thanks,=0D
Zhan Xusheng=0D
