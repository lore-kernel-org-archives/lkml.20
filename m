Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328431;
	b=nD4uRTRC8dW+K+khOsx6lj5uScv1WGZI4Yg9V5IhUUhQrANWZSr+ZyrMDNADETHKLUW1
	 8NpxXa2qIwsQDyUMNctmyIlGJZ6qbf5NStKAbvM2f7LQ2l7ScoNQV00rS/XdUasilCk2Q
	 RiF12pvcDA9lMWv/Fw+/cxEGb3jy/EbReaVu4Jj38dppud1u/ftWL7CAApyrIpYDZEmAK
	 UzwbIA8sfppeBo7Pjp1Ik2i8xCzgWmDWQqI9NuwwKi19/yh80pcsBoRTcD/UoytDeCCIe
	 bTxl1urVOlcSELf8IThw97ayPuS1DL8HCKWr/fXX8fB8vr2vumLa2y1bWkOdwa1JU3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328431;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=wATMwc+Nopy7p1jw9Idnz++o2xgmCuU4ve89ngyyFtQ=;
	b=u7RyG/pOihkNuizqZxVm+55/UcXfOhds6KD8IcgfwqovjFaFqN288QVthKxg6l4HiF+B
	 iOC3Mjqg53Phf61KoqA76RdX9wN1PRt3157DmRSoRU9Y9/vSo+xyNUL3OA7s3bkFVlMTM
	 5A67KlHaHWJ81cE/iqcdwM5+mogVC0pak1U2Igj7qIiiSjbVKJwlpDzCE32dKPU4SJscd
	 0o4hwsMqcwmIaNtk0deo+lq0DKGQfZHlig8aC8pNHiOWMKF1tBWNJWc6QwTkvxXNXeHde
	 eYtNbgWsedW33PIj1jr4xYxvheNFk45nr7qaeUkTSuuP6kQgG9zgYZ/xj0JcFE3YO5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i3NtryTA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F01E606A22E;
	Tue, 10 Nov 2026 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i3NtryTA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316F21F008A6;
	Tue, 10 Nov 2026 16:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794328431;
	bh=wATMwc+Nopy7p1jw9Idnz++o2xgmCuU4ve89ngyyFtQ=;
	h=Date:From:To:Cc:Subject;
	b=i3NtryTA/n+j7FEVf7BpaD/AjqMciu19BprXIWb9f9Bvua7qLb+zN6wW1Lrqn3wZe
	 Dq3fgbJtr1fUpc6REJ2KTi9NwOtGkl3lTxnnFZFm6lJDHcKCjM0hIoK4smznuQmYN6
	 +mLaHnH0Htc12hVi4ekzOWWPy/ugyoIdEpGRjLfuWHzU6sxhLQ9ry25umCpdTJOHfS
	 Bt76+jwjSZx6MKii2kNjhF++edPw2U0+jYUtDx/m9615B0MY7F9welOuT7keIzISyF
	 1a/Fdw2XyP82W+nYRIo7UKUBYt9DiUuWRwJ2BkbNbJi466WOd7B5H8kdDyggODDH4g
	 IAnrsd2XZsbCA==
Date: Tue, 10 Nov 2026 16:33:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pmdomain-fixes tree
Message-ID: <avNHazNbGtMQJ5pV@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="vO54vPDY3ueugrok"
Content-Disposition: inline


--vO54vPDY3ueugrok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the pmdomain-fixes tree, today's linux-next build
(arm multi_v7_defconfig) failed like this:

In file included from /tmp/next/build/include/linux/device.h:32,
                 from /tmp/next/build/include/linux/platform_device.h:13,
                 from /tmp/next/build/drivers/pmdomain/imx/gpc.c:11:
/tmp/next/build/drivers/pmdomain/imx/gpc.c: In function 'imx_gpc_remove':
/tmp/next/build/drivers/pmdomain/imx/gpc.c:554:25: error: invalid storage class for function 'imx_gpc_driver_init'
  554 | builtin_platform_driver(imx_gpc_driver)
      |                         ^~~~~~~~~~~~~~
/tmp/next/build/include/linux/device/driver.h:294:19: note: in definition of macro 'builtin_driver'
  294 | static int __init __driver##_init(void) \
      |                   ^~~~~~~~
/tmp/next/build/drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_platform_driver'
  554 | builtin_platform_driver(imx_gpc_driver)
      | ^~~~~~~~~~~~~~~~~~~~~~~
In file included from /tmp/next/build/include/linux/printk.h:6,
                 from /tmp/next/build/include/asm-generic/bug.h:31,
                 from /tmp/next/build/arch/arm/include/asm/bug.h:60,
                 from /tmp/next/build/include/linux/bug.h:5,
                 from /tmp/next/build/include/linux/instrumented.h:10,
                 from /tmp/next/build/include/linux/atomic/atomic-instrumented.h:17,
                 from /tmp/next/build/include/linux/atomic.h:82,
                 from /tmp/next/build/include/asm-generic/bitops/lock.h:5,
                 from /tmp/next/build/arch/arm/include/asm/bitops.h:245,
                 from /tmp/next/build/include/linux/bitops.h:67,
                 from /tmp/next/build/include/linux/kernel.h:23,
                 from /tmp/next/build/include/linux/clk.h:13,
                 from /tmp/next/build/drivers/pmdomain/imx/gpc.c:7:
/tmp/next/build/drivers/pmdomain/imx/gpc.c:554:25: error: initializer element is not constant
  554 | builtin_platform_driver(imx_gpc_driver)
      |                         ^~~~~~~~~~~~~~
/tmp/next/build/include/linux/init.h:265:55: note: in definition of macro '____define_initcall'
  265 |                 __attribute__((__section__(__sec))) = fn;
      |                                                       ^~
/tmp/next/build/include/linux/init.h:275:9: note: in expansion of macro '__unique_initcall'
  275 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
      |         ^~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/init.h:277:35: note: in expansion of macro '___define_initcall'
  277 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
      |                                   ^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/init.h:306:41: note: in expansion of macro '__define_initcall'
  306 | #define device_initcall(fn)             __define_initcall(fn, 6)
      |                                         ^~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/device/driver.h:298:1: note: in expansion of macro 'device_initcall'
  298 | device_initcall(__driver##_init);
      | ^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/platform_device.h:345:9: note: in expansion of macro 'builtin_driver'
  345 |         builtin_driver(__platform_driver, platform_driver_register)
      |         ^~~~~~~~~~~~~~
/tmp/next/build/drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_platform_driver'
  554 | builtin_platform_driver(imx_gpc_driver)
      | ^~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/init.h:176:30: error: expected declaration or statement at end of input
  176 | #define THIS_MODULE ((struct module *)0)
      |                              ^~~~~~
/tmp/next/build/include/linux/platform_device.h:304:41: note: in expansion of macro 'THIS_MODULE'
  304 |         __platform_driver_register(drv, THIS_MODULE, KBUILD_MODNAME)
      |                                         ^~~~~~~~~~~
/tmp/next/build/include/linux/device/driver.h:296:16: note: in expansion of macro 'platform_driver_register'
  296 |         return __register(&(__driver) , ##__VA_ARGS__); \
      |                ^~~~~~~~~~
/tmp/next/build/include/linux/platform_device.h:345:9: note: in expansion of macro 'builtin_driver'
  345 |         builtin_driver(__platform_driver, platform_driver_register)
      |         ^~~~~~~~~~~~~~
/tmp/next/build/drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_platform_driver'
  554 | builtin_platform_driver(imx_gpc_driver)
      | ^~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/pmdomain/imx/gpc.c: At top level:
/tmp/next/build/drivers/pmdomain/imx/gpc.c:503:13: warning: 'imx_gpc_remove' defined but not used [-Wunused-function]
  503 | static void imx_gpc_remove(struct platform_device *pdev)
      |             ^~~~~~~~~~~~~~

AFAICT this is caused by commit

   d7262971a2acc (pmdomain: imx: gpc: remove all initialized power domains)

though I don't really see how.  I have used the tree from next-20261109
instead.

--vO54vPDY3ueugrok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzR2oACgkQJNaLcl1U
h9Cw8AgAgDy5eaivysF0qOF3s0gSIkO3V24Q/fU+aO1rLzqsiQY+uVnVt8nKB0LG
YD9ro0WQ+Ma6Sx/NvoGm/RgQIXgTb0lVCxII6ITBmFMZ3QLIxril5MUyWMp0biJg
zlxxrGTLlAy3p3k9T/vile0JL3faCDR5sbEfVf4u/kbmA4QTzBDKxDefhtiZfaAs
GxHQBVSpdmqcGJpnQreGTSVd77bCUjw6sFmBCp6+RB7oj0nXfsSwX0FVDysnnkSR
0KloKCZC6mv3d2vKqY7PgjaG4UZ73CtiglqN99IU+O+F7FvhiJxjzAEJ5389HAXD
v0yBMMcB9R1dzq0PsNXJf7M6xf6ifQ==
=r964
-----END PGP SIGNATURE-----

--vO54vPDY3ueugrok--
