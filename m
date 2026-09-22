Received: from mta1.migadu.com (out-205.mta1.migadu.com [95.215.58.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DE239A4CF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048917; cv=none; b=jeoyng6NKSRbdI2r8dT5Qd4g+tNE9RbifDYOpRahBhBpdi1zM706ZJQXoNfhblqx8VrRujGTtlmc0Vh/WQz2FDLd5b5vDteZM1n1pIb21aglOIgsRlPbul7LIcS7/fHgK2TurFK0cBzM7nT+xRE+BCcIWjLIw/LcgGUQY8UOFf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048917; c=relaxed/simple;
	bh=qjEB8CG00z+rb0Eckb5vU5Q0rLTkaQK7eKWMgJ/oCZw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=osJZxifVniN6it2rPgABGBixywYOtt029oPEHjIbWLvOGkVOz+oS6towTbacaLwmJDKBvlSUC1oYyZb4kzJdmnwLYPWDDUbfJC0DKZuiRzb03UaoxyTr36/v4EWX1Wdt8pbCM74zbVFATRG9COeH7/WH0yv61ZOrwqTsFkjXYbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AD9VWmAx; arc=none smtp.client-ip=95.215.58.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AD9VWmAx"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qjEB8CG00z+rb0Eckb5vU5Q0rLTkaQK7eKWMgJ/oCZw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790048913; v=1; x=1790653713;
 b=AD9VWmAxPqsHQ54P8fTv4eKNEMRGWVX2eQaBHHHjLUnD1Wg0ApHbro167CffYmZDnw2w8W44
 sWmwKdMzVrCb2RybFUgr4Oridk9Nweo446he1sf03FAfUTECk+56fPwXyfEO1onc9dHlTStCowm
 /Lv3E0jnyS2nxLmx0F0El5zg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id d63a82b7a813fa63;
	Tue, 22 Sep 2026 03:48:33 +0000
X-Mizu-Trace-ID: d63a82b7a813fa63
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=315d13795fb467be91a82ce8ee58bffca282a3e2479738386d43492127ad;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 22 Sep 2026 11:48:23 +0800
Message-Id: <DLLJDLKPZ4S3.1KQ5O4OQBBTEW@linux.dev>
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: <shao.mingyin@zte.com.cn>, <pjw@kernel.org>, <mikey@neuling.org>
Cc: <jiangfeng@kylinos.cn>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <zhang.yue5@zte.com.cn>,
 <david.laight.linux@gmail.com>, <qingfang.deng@linux.dev>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>, "Troy Mitchell"
 <troy.mitchell@linux.dev>
Subject: =?utf-8?q?Re:_[PATCH_v4]_riscv:_lib:_Fix_ZBB_strnlen_wrap-around_regressi?= =?utf-8?q?on_on=C2=A0huge_counts?=
X-Mailer: aerc 0.21.0-reader-ipc2
References: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
In-Reply-To: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>

--315d13795fb467be91a82ce8ee58bffca282a3e2479738386d43492127ad
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 15, 2026 at 3:26 PM +08, shao.mingyin wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> The aligned scan boundary is derived from the last valid byte,
> (s + count - 1).  When count is huge (e.g. SIZE_MAX, which FORTIFY
> strcat/strlcat pass when the destination size is not known at compile
> time), s + count wraps around and the boundary lands before s, so the
> ZBB path returns a bogus length.  The original implementation
> (5ba15d419fab) had the same wrap-around in its (s + count) & ~7
> boundary computation; after 5d588c684833 the wrapped boundary is caught
> by the pre-loop guard "bgeu t0, t4, 2f", which then always exits for
> aligned strings of 8 or more characters and strnlen() returns 8
> instead of the real length.
>
> This silently truncates strings built by fortified strcat: the dm
> sysfs name attribute shows "live-bas" instead of "live-base", the
> truncated name pollutes the udev database, and blivet/anaconda (as
> well as LVM/dm-crypt/multipath userspace) break on RISC-V systems.
>
> Detect the wrap-around and saturate the boundary to the top of the
> address space, making the scan equivalent to strlen().  The saturation
> clamps the increment to ~s, so it stays branchless and wrap-free:
>
> 	s + min(count - 1, ~s) =3D=3D saturating_add(s, count - 1)
>
> Normal counts are unaffected.
>
> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
> Cc: stable@vger.kernel.org
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Suggested-by: Qingfang Deng <qingfang.deng@linux.dev>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> Acked-by: Michael Neuling <mikey@neuling.org>
Tested-by: Troy Mitchell <troy.mitchell@linux.dev>

--=20
Troy Mitchell


--315d13795fb467be91a82ce8ee58bffca282a3e2479738386d43492127ad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarH6hyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+YjAD9FDuL8GGk9nGD
AuMDfrGSpqKOkmUteU1PhJ5/ANGz25UBAJd6WAztjmhW7qsMzTjAUuVxMBaERCOS
egaKs+itVEcH
=+47f
-----END PGP SIGNATURE-----

--315d13795fb467be91a82ce8ee58bffca282a3e2479738386d43492127ad--
