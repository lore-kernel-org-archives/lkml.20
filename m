Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589788;
	b=aCQS1lGJ/WwKDR4Fx88GXDGG/ga257vFFmY66Ci4AxJXi5R6g79FUqJmyKrTfxynXN1k
	 WScBSRmz6G6Cs+bnGnhz9aaSoKTNCyVplYdY0PUM+RfxxnwdCxfwD0BMBqhKjyBspDGJg
	 jX+r/SvQNzeGMpR612+qx5G13UvZCyM9M7ggcz6Sex179BolJFdTo5EUEZX+av80alEz3
	 g+a83gt7ysZunZ37rTycvLs9WvUo2W8MwjGQL16f0/pCkez9zm3x+OqgQa7TK6A0pyxdP
	 1T2Y9YUNcCYflBBUGDFZpKZheHNshwF6rPS7xi9vTYsJLBi5rXA7IDlF3XoJCS9JK7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589788;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=hZq9Kthp8ipPqLrvtlrtHP3VINdl+d2/6W8RxuLZgQ0=;
	b=Zlb4zSGi2KXwXrj108CK4hXju7IBfBFjoR9kobqe2J1oP74n3lDguefy1TXV6Z9NvtAT
	 Ov8QkitSzcc67Y+rKP1u3yFrD6aJ55YUQmBMvTWPoosQWh27Rw1+K//6b4G6nahTsxO3q
	 w2FzvrwgNNG5iWzbq0/Cab868AXdJIz4/bHFWPrY3NAsFGwOL/zNW22gRls8t8GPdzsng
	 6e2sYbmRKvRIwQXl18sryej6fAJnteVcNQFfzuAfCkaEhnNNqS1VdQS3N6y3MAoRsU+18
	 E3QA2NA7lKdccgnOGkaPXBzKv0M6swwuToBIG2OSOETRwRymZj9+wlsEOynsu8hAN4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z+2J68bb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CD4606A319;
	Wed, 21 Oct 2026 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z+2J68bb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038381F000C5;
	Wed, 21 Oct 2026 13:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792589787;
	bh=hZq9Kthp8ipPqLrvtlrtHP3VINdl+d2/6W8RxuLZgQ0=;
	h=Date:From:To:Cc:Subject;
	b=Z+2J68bbFYMpPjHblrdFxnkhweqI0G44lqlqiL5+r2MtoBOYkwsU366Y2ivmt/clD
	 jZ1c8oy1v7fqF9E7smJV5ttfGDnYxg2LC59eNI4nS+G+Khz5WYMoAM/9v4aGTJd70R
	 tqwFMPzYTmBXyAu8Of5Rr50giOSmRFCeeH85VN08vWTiCVdrrv3xIO16T8EL0asyOG
	 OVQ26IzZVWTV7XPqBwkh0sxLLYUSjONjTY8xmFgNQCItGoYNvZSq290JoPotxzQOSz
	 Hcc3kLqo2GvXux2YSwx/+3E+twqMcpNCcKJfLH4fm28VFKseTC788ZMIP8t70I9kVz
	 wYjCXLso5wagg==
Date: Wed, 21 Oct 2026 15:36:05 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Subject: man-pages-6.20 released
Message-ID: <ati8omczZdbbd9jz@debian>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b7fmjxjtnr7kbsqc"
Content-Disposition: inline


--b7fmjxjtnr7kbsqc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Subject: man-pages-6.20 released
Message-ID: <ati8omczZdbbd9jz@debian>
MIME-Version: 1.0

Gidday!

I'm proud to announce:

	man-pages-6.20 - manual pages for GNU+Linux


Tarball download:
<https://www.kernel.org/pub/linux/docs/man-pages/>
Git repository:
<https://git.kernel.org/cgit/docs/man-pages/man-pages.git/>
Online PDF book:
<https://www.kernel.org/pub/linux/docs/man-pages/book/>

Thanks to all the contributors to this release (in BCC)!
And thanks to our sponsors!

	$ sort --random-sort <SPONSORS=20
	Hudson River Trading <https://www.hudsonrivertrading.com/>
	Google               <https://opensource.google/>
	Meta                 <https://www.meta.com/>


You are receiving this message either because:

        a)  (BCC) You contributed to this release.

        b)  You are subscribed to <linux-man@vger.kernel.org>,
            <linux-kernel@vger.kernel.org>, or
            <libc-alpha@sourceware.org>.

        c)  (BCC) I have information (possibly inaccurate) that you are
            the maintainer of a translation of the manual pages, or are
            the maintainer of the manual pages set in a particular
            distribution, or have expressed interest in helping with
            man-pages maintenance, or have otherwise expressed interest
            in being notified about man-pages releases.
            If you don't want to receive such messages from me, or you
            know of some other translator or maintainer who may want to
            receive such notifications, send me a message.
            If you want to be added to this list (which I store
            encrypted), send me a message.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D NEWS =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

We have a new script which is installed as part of 'make install-bin':
git-bisect-rebase(1).  A few people have already experimented with it,
and they're all delighted.  It helps rebase very old branches over
thousands of upstream commits without pain.

I'm working to get it merged in the git.git project, and they seemed
receptive to it, but for a while it will stay here, so that it becomes
useful to users before it becomes part of git.git.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Linux Software=
 Map =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Begin4
Title:          Linux man-pages
Version:        6.20
Entered-date:   2026-10-21
Description:    Manual pages for GNU+Linux.  This package contains
                manual pages for sections 2, 3, 4, 5, and 7, and
                subsections of those.  Only a few pages are provided in
                sections 1, 6, and 8, and none in 9.
Keywords:       man pages
Maintained-by:  Alejandro Colomar <alx@kernel.org>
Primary-site:   http://www.kernel.org/pub/linux/docs/man-pages
                2.7M  man-pages-6.20.tar.gz
Copying-policy: several; the pages are all freely distributable as long as
                nroff source is provided
End


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes in man=
-pages-6.20 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Released: 2026-10-21, Dongo

New and rewritten pages
-----------------------

man1/
	git-bisect-rebase.1

man2type/
	file_attr.2type

man5/
	proc_sys_fs_inotify.5			(split from proc_sys_fs(5))
	sys_block.5				(previously, sysfs(5))
	sys_bus.5				(previously, sysfs(5))
	sys_class.5				(previously, sysfs(5))
	sys_class_net.5				(previously, sysfs(5))
	sys_dev.5				(previously, sysfs(5))
	sys_devices.5				(previously, sysfs(5))
	sys_firmware.5				(previously, sysfs(5))
	sys_fs.5				(previously, sysfs(5))
	sys_fs_cgroup.5				(previously, sysfs(5))
	sys_fs_smackfs.5			(previously, sysfs(5))
	sys_hypervisor.5			(previously, sysfs(5))
	sys_kernel.5				(previously, sysfs(5))
	sys_kernel_cgroup.5			(previously, sysfs(5))
	sys_kernel_debug.5			(previously, sysfs(5))
	sys_kernel_mm.5				(previously, sysfs(5))
	sys_module.5				(previously, sysfs(5))
	sys_power.5				(previously, sysfs(5))
	sysfs.5					(split into many pages)


Newly documented interfaces in existing pages
---------------------------------------------

man1/
	diffman-git.1
		--

man2/
	fallocate.2
		FALLOC_FL_WRITE_ZEROES

man*/
	landlock*.?
		LANDLOCK_ADD_RULE_QUIET


New and changed links
---------------------

man5/
	proc_pid_smaps_rollup.5			(proc_pid_smaps(5))


Global changes
--------------

-  share/mk/
   -  Improve portability to systems without gcc(1).
   -  Allow printing the commands with make(1)'s --no-silent.
-  src/bin/
   -  git-bisect-rebase: Add program.


Changes to individual files
---------------------------

The manual pages and other files in the repository have been improved
beyond what this changelog covers.  To learn more about changes applied
to individual pages, or the authors of changes, use git(1).




--=20
<https://www.alejandro-colomar.es>

--b7fmjxjtnr7kbsqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrYv8UACgkQ64mZXMKQ
wqnGIg/+Mydj/Utr/NZuDbMklIJ3z1hVesFPXvuLm1EeK0m72Yg1FbZvGg1O558F
i0EeKu/dMzMv73pG4bxOxERNVbh3l6nwPBCyyEmORNIIZPgNWQuoC1Jq/03itMl8
qRYo3SskHmMGRM+hfR4FRwanBgruaB+AVGC5cbGI863i/H2HpflHGHSgc2k8VHEv
Xg9OzU5jiMD4bMX8+jM2bllCWPCb1Ut1wIj0ItFsj50yMN+UqRvwJkRmj+NbRBHX
M28zi3axqXb4yQ/nCBG/IQewbqFiZlgmqpsWypK/90tu5FbmAyR/TsRQ8Mhmu6Cy
eG8LDHWxYNbgqZxBvGR3v0wP3anE9r5zWb6+Zq9V5q9uc/iSHBq/eeQI5z7NLqr5
ooS9eOaHdSSOQ2NMR53flN8jU0B1g4XQMeBfQeqo90E7Q/PZc8iw6CI6OyHtz5wa
HjMfDX+PZBhF34xcS6yoW8IVGOvAOqrjHjQfSoB6qAHDmEhzVfUIe0KItC4a+y6w
DVIvElphXUTA78Rpvi9zdit2yC4GzXwOMXek85tuusbaAlXzwznfTodCNogNhkmF
j1fhoU4yh3ns+SWLY314S/unlGIQSlKgXOYEm+UWU3NOkAmqt94OYBPDuz9SmqMi
NAzaTbdY7g9m1Db/yDYUbXyHeSltdWCjKYOdVL1U7LBDLQDHMIA=
=oUDd
-----END PGP SIGNATURE-----

--b7fmjxjtnr7kbsqc--
