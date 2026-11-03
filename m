Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719837;
	b=V+iMcXuhAiuSK+wBV0PfRR5chVu7vM0/TE6HduN8PB1GPsEfQdDo1OKsPH3blE/W9ytC
	 6CQcX5XJ9sofseuhF5wbatfFFME+jy3P/CdMelar4GMldu/FuCsmoYyHNoxy0LhYqWdj+
	 ucOpECnxpa3eynnGqhlKsx/DadLz4Hwm5E6eAFqYxto+Thag0lgAVvEiAkW39j8vIudZ+
	 ZDCzvmZL2EVuGSKZgFNLOWM4KpgPAFcXLU5vR9x53cvD89soN3ajzKBC6LpjCPXjrMbZK
	 R35/qD1T9vB6RgEeoWiRg/vnRXrs12vx0gqYKEJSA57P3mWfyWaFgXok9eywwmPrLNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719837;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=xHYrsreU3KfCokUCt/S3dePDuTst3M3T/UI3zk+KCh0=;
	b=kZdW8aWbWqpkIs7ybS9SntZhklLVzKUNbVybi9WcuYv0qHgA+sc755WV0eexWUgeZGYk
	 saNTI5iY48gBs+YTUNpcPdVYW7yb7s7PCYiP+N1iDA/e8bdn0ZXBZ3189AdM0QJwNV8Ha
	 TCDlpFfANk/OaYxLUHL1iPJXUlK39zeaMNgnkCI1zGSqSuupQ1Sq/F8+yFIgP+Z506fJ6
	 uY2hVSCc/MUDFJE8OEGL7uWTJf7DqLU9R0dRLY2E6CwGZ92WaIGFAE8K2RodDCoic1xZ4
	 EgsgcSHDqkPp0xo5Hjbsoc1F2W7PKtFKN6oH4Qvc12yW//ZthADBr9Y0RwCxefjsyqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ET8jetfk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15986606A326;
	Tue,  3 Nov 2026 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ET8jetfk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F461F000C1;
	Tue,  3 Nov 2026 15:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719836;
	bh=xHYrsreU3KfCokUCt/S3dePDuTst3M3T/UI3zk+KCh0=;
	h=Date:From:To:Cc:Subject;
	b=ET8jetfk172kSgD/HkRYRIpcnVb6eJHQlFfUESQAuj7/777qkWrzhn3pI85XF+BLU
	 zAgyjqgMtWIfmjsxpxE7axre0dDzYVVSSsOCyML2y2H3s/W46qbqXBSZl7JxKxUwKK
	 xQ3OzLRbtipQrGs+LS9eKIOvoTEKf7/YOaxGbx9YSrOFkZlpJgkzduEDX0GFZO/wz0
	 8KVpMCZnFFexOwNVeis57si6Icp1U0C298QcETksVCmoyf4mmYG5q82c78cBnS9oib
	 rekNd46tbaD5Vk22a/GZjp4kf+k8jW/Bq3yFDy//FaGFEoyDtILAeWvAfjnHpF96K1
	 02r/VWS1eDr2w==
Date: Tue, 3 Nov 2026 15:30:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 3
Message-ID: <aun-GfKUNuIe-YL-@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="48UiDok1pJGHOCMW"
Content-Disposition: inline


--48UiDok1pJGHOCMW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261102:

The bpf-next tree acquired a conflict with the bpf tree, I used the
bpf-next tree from next-20261102 instead due to the complexity of the
conflict.

The iio tree acquired multiple conflicts with the iio-fixes tree.

The nvmem tree acquired a conflict with the iio tree.

The turbostat tree was repaired.

Non-merge commits (relative to Linus' tree): 2597


----------------------------------------------------------------------------

I have created today's linux-next tree at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests, a KUnit build and run on arm64,
and a native build of tools/perf.  After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 436 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--48UiDok1pJGHOCMW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrp/hgACgkQJNaLcl1U
h9Ch0Af/WQ7Kys3ZGN2gnMNV5QdkqDjHK30tR7y4+hp9Y5z9Fn0v6L6HfU7HZygp
3EfZjen/ZAStgnFI9p3FsFUWrk1jQSP3+4pq9Jzdfjn9v810Y4QodQ3UncW3tL6I
bi4lNkLhIWIlSmfgJNvbCjBBPaKIQn1XkLm2UjeCiVU6r5YVhvd/V33bFez3ZhEV
21mc8BDdfSvSbRQFcZMtH3ZtXAyqpPZieiNlXPRvLORDwgZQI+xz21LblKJOhce3
y/6qNIc6yPHV5/esXzigwbh0eAsMdXwoEJ7Kug5eWFZtme3fAmSVRsMl10maebRN
bRzbmXBBbYOhQXaCQq7q/zSTXV1Cug==
=juWS
-----END PGP SIGNATURE-----

--48UiDok1pJGHOCMW--
