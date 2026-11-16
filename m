Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841511;
	b=STWSKHDypyRdelpCA54UlSzGQz4nnED/lyDE8gdMcmu42Y7/V75+mf7c8NOZtQT7Vel/
	 fmNki4ykdR853JnZTc/xG4TJw0Eunl4U5OKSC1nR9qNTndIO1whxq1yPcMltXXRtDg8wp
	 +ohqhVW8Y7eQnOtBILiIHYURPEhqpGPs65BsfRavQbdH/92KTVN3Uj5qka3yNZbhhXhSQ
	 lx/25so8mUm9V70UZka8xpD97nTFXs/9m+BvxVYRBIWZLOnE1loOnzS+CGQ7InAyXWiVU
	 i7DZ3aXFr7bzVyIqWYMZ6Qww7xUC6z9nXf1H5AUN4Xpx/MbFzKKU5LjcpGnI4aW3Vmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841511;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=KICP/Ss9i5Yu9rb4QYTKDFqmmySsxrWKlRBcqpcDoRg=;
	b=eeb7KKfZUiE/qBThxfm/SZ77UfLD0nGm5XRtKYctooPjGQX/STok8BYatX2r9rR4DMa6
	 UarsiEvw5RRNqyV0KJeCTw1yuQGvs9mYtulqiPWFJadJZhSj1OG3xn4MfRw3kgrxGhfCA
	 3OZbKE8oRdwrND6DDZIZc9beJ2czjlDRqvUzqRSKabKc3KKjTDP7bWWzn9/gotZ9fiESD
	 zkyYjfVSDZh+Cr+kY+CyT0ip5zAyl7Y7I0g/lGQxtR6J/oPJdokkl+yGLAlH+DX3+Oz+4
	 4+ko52yYx9MwlCqdyppQBTioP9rsGy5VQ9fMOOYny/A3M90Ah0mGrOEDPpEVC4v8qIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i2kOQ9Fo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265ED606A880;
	Mon, 16 Nov 2026 15:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i2kOQ9Fo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE6F1F000C4;
	Mon, 16 Nov 2026 15:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841510;
	bh=KICP/Ss9i5Yu9rb4QYTKDFqmmySsxrWKlRBcqpcDoRg=;
	h=Date:From:To:Cc:Subject;
	b=i2kOQ9FoncqWqO0TlOgnVMQs3cNPTHg5h11nRDgJmLy1H9iAASmpA0Mq1j3mYEP3z
	 VEo3O2iQJQli5sW0Ds/5PglzDAngToozZ6I3fWnyr4D2B/zAlNyTTLnk41Yrv36kMj
	 mKsSB1XWa6W5QFzAATd2KN8kcBooAjWJFDdwybHS8an5h+8bsnZiE6u9fC6fi/n8tP
	 rqyzhjB1aeH0SVG26ye//8BJrDqgcNyMIFjdAhgAVXUrF0i1syNL+nEOj80TQBNdG4
	 Y3Fg++pyvqwlTLEEuMd2l/Sd4pCF5t69ahoIdH+ghqU0nxaSwRqB7DcQFxYcJtyaKd
	 uiRZr8AJVHo7A==
Date: Mon, 16 Nov 2026 15:05:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the
 vfs-brauner-fixes tree
Message-ID: <avsbojA2X_4w8M7s@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="IXXWIKLaNu3YMOnR"
Content-Disposition: inline


--IXXWIKLaNu3YMOnR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got conflicts in:

  tools/testing/selftests/proc/.gitignore
  tools/testing/selftests/proc/Makefile
  tools/testing/selftests/proc/config

between commits:

  f0e0ab5050ec5 ("selftests/proc: check that a faulting readlink() doesn't =
hold up removal")
  47b64be3c6b5e ("selftests/proc: check that faulting sysctl accesses don't=
 hold up removal")

=66rom the vfs-brauner-fixes tree and commits:

  9fad20fd1f32e ("selftests/proc: test which entries can't be mountpoints")
  305f53d9e68b8 ("selftests/proc: check /proc/<pid> files across a set-user=
-ID exec")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/testing/selftests/proc/.gitignore
index 3fa89f46b9c7b,41f0103840c98..0000000000000
--- a/tools/testing/selftests/proc/.gitignore
+++ b/tools/testing/selftests/proc/.gitignore
@@@ -8,8 -8,8 +8,9 @@@
  /proc-maps-race
  /proc-multiple-procfs
  /proc-net-dev-lseek
 +/proc-readdir-churn
  /proc-empty-vm
+ /proc-pid-setuid-exec
  /proc-pid-vm
  /proc-self-map-files-001
  /proc-self-map-files-002
@@@ -21,8 -21,7 +22,9 @@@
  /proc-uptime-001
  /proc-uptime-002
  /proc-pidns
 +/proc-remove-slow-sysctl
 +/proc-remove-slow-readlink
+ /proc-unmountable
  /read
  /self
  /setns-dcache
diff --cc tools/testing/selftests/proc/Makefile
index df02699a3587b,a718c83c71a15..0000000000000
--- a/tools/testing/selftests/proc/Makefile
+++ b/tools/testing/selftests/proc/Makefile
@@@ -30,9 -29,8 +30,11 @@@ TEST_GEN_PROGS +=3D setns-sysvip
  TEST_GEN_PROGS +=3D thread-self
  TEST_GEN_PROGS +=3D proc-multiple-procfs
  TEST_GEN_PROGS +=3D proc-fsconfig-hidepid
 -TEST_GEN_PROGS +=3D proc-pidns
 -TEST_GEN_PROGS +=3D proc-unmountable
 +TEST_GEN_PROGS +=3D proc-sysctl-readdir-churn
+ TEST_GEN_PROGS +=3D proc-pid-setuid-exec
 +TEST_GEN_PROGS +=3D proc-pidns
 +TEST_GEN_PROGS +=3D proc-remove-slow-sysctl
 +TEST_GEN_PROGS +=3D proc-remove-slow-readlink
++TEST_GEN_PROGS +=3D proc-unmountable
 =20
  include ../lib.mk
diff --cc tools/testing/selftests/proc/config
index 1504a761b39bb,249cd78908da5..0000000000000
--- a/tools/testing/selftests/proc/config
+++ b/tools/testing/selftests/proc/config
@@@ -1,10 -1,3 +1,11 @@@
  CONFIG_PROC_FS=3Dy
 -CONFIG_KSM=3Dy
 +CONFIG_NET_NS=3Dy
 +CONFIG_IPV6=3Dy
 +CONFIG_TUN=3Dy
  CONFIG_USERFAULTFD=3Dy
 +CONFIG_SOUND=3Dy
 +CONFIG_SND=3Dy
 +CONFIG_SND_DUMMY=3Dm
 +CONFIG_MODULES=3Dy
 +CONFIG_MODULE_UNLOAD=3Dy
++CONFIG_KSM=3Dy

--IXXWIKLaNu3YMOnR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7G6EACgkQJNaLcl1U
h9B0cgf9EYVWuDlx7vNim/gdrgYPTBjMn0Rlqrs9Dit1BTq++Va/rNhPOJ/FQgjX
h0MpC1KAjwlmQ4aZQsb1m0GwlZLi9SEMyhzNkZOd8HnU6/W8UYD4JTD6bSdEodtf
gjXvIVJzeuiGU5v5rBQHMwLlVxiSrqo9JfgGSssA65SPfN5ItYWVDg3qTnBMI09N
PhmFmIt70vop64ewIZMIMwZT7XsMzHZmPNS7uAwtTW7x/vzariFplCOf1Bn56gW0
hxm/f+PyRrogAf4K77Cziu6LKLlfortyUk3y0XzXf3yId8681doc9HeAJW/O9ILt
hwRTc+tF7qi9Ywhyr8Xi5UTigAwdzQ==
=VYlr
-----END PGP SIGNATURE-----

--IXXWIKLaNu3YMOnR--
