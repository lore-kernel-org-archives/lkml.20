Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629187;
	b=iod4RsL4BPquP5apAFbhAZnxNgxJgKSxLg0rpT2+sq81MRgi8AMdTV1hvShjl1Phqocf
	 dCKCj87ityjbsSVQXWloDggBT2lCksXDh/YHgmevx1QiCLkb56QAnVWxub2G76VgMndEv
	 c9DY+lmBdghdx+n8AyptuCT2RKEjvTdumItHwrt/pk4dffZJ0DSyKaQzknXklj5Wqdfus
	 mjLCf+Y1rVZT2+yiVpF/VdDDLJdf4sU1UjHfvME6ee3yByiLr/O7BspWl1KfibuMlRUL2
	 39uqc8fvSyCE065Wonxq5/bQjTPgXqSbfzPLnM91rI5YE5So0IY1HbWaZx/bg2tFOGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629187;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=n3ciRURaXVBvFyB3D3wVCBa0GVxxBbIQQiHpXx6YrIw=;
	b=dazlEim4xyH1q/XuXhkq5Y2QmeFFf3nFmMvfioAYYBBh2R2iD7O7iFt4EQONejd6p8lU
	 xChGTWybk/uj1hYG7OZbJbJdeeB4rW4I/YbURRb4xvLgvh5NbNyT/0bx9ZQS1t5QIi49y
	 B2GLUON9Qk+9nWMjx6zk46AfJPxFLO4GHgqmcHvuYlz/okf2Zcw0hoR+Il9RW1ABkm6mk
	 M7iWElPRwIg1ANWxUIyKU+VUfXy72PUCtwTlHOdot8afiUtcdvgSXl+jKCKQOmGyd7ehu
	 NAfSfE2Y4VzTAQCD9T3w3T1+K7UxBVNiGHsYKrDEm/6zDaKXUiUKYPSNYPPrihUk/mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bEwlkROR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361E5606A326;
	Mon,  2 Nov 2026 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bEwlkROR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFF21F00A16;
	Mon,  2 Nov 2026 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629185;
	bh=n3ciRURaXVBvFyB3D3wVCBa0GVxxBbIQQiHpXx6YrIw=;
	h=Date:From:To:Cc:Subject;
	b=bEwlkRORRG/A9iguyC9crzQprfyGrNtAjFtmAO+9+MJ7eJMvKYXDJGbnOybIPyM/h
	 ITY8FtR7b2mQnCOmVI7LkY06XOtX/+HDTX+WzDfewKa+AFJZWHRmG2TmuB3EVkzZ1q
	 Gnrhk6ZtuDBAwQIlGv/FV43j5dnh4H/+lJvvXVFo1Zr4z3w3ovzOKKSakOYT69LCWm
	 oiKxpyTjyTaZix9F/c+zR9QGc0TrzsGLWxgfx/06d3B3Xuj41SNCMk5KWAkCxGb+fE
	 40PT9eU2imyhYerqNmNUK5oe7i/qbYw/+xXTAwmKH8byou4t+DVVFpTKBkMW8RtEW2
	 3jrxMXdmM9X1w==
Date: Mon, 2 Nov 2026 14:19:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	LiuJunyuan <2058432396@qq.com>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: linux-next: manual merge of the staging.current tree with the
 mm-fixes tree
Message-ID: <auib_crbWYfKZw9V@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="CTusaMK2yIR8PQ5i"
Content-Disposition: inline


--CTusaMK2yIR8PQ5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging.current tree got a conflict in:

  MAINTAINERS

between commit:

  88c41b4cb3432 ("MAINTAINERS: sort component entries alphabetically")

=66rom the mm-fixes tree and commit:

  24934cb6b8cd9 ("staging: vme_user: delete driver")

=66rom the staging.current tree, the rare delete/delete conflict.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined MAINTAINERS
index 223c1d331e408,da8cf5fcf9089..0000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -350,15 -350,6 +350,15 @@@ S:	Maintaine
  F:	drivers/acpi/arm64
  F:	include/linux/acpi_iort.h
 =20
 +ACPI FOR LOONGARCH (ACPI/LoongArch)
 +M:	Bibo Mao <maobibo@loongson.cn>
 +M:	Huacai Chen <chenhuacai@kernel.org>
 +L:	linux-acpi@vger.kernel.org
 +L:	loongarch@lists.linux.dev
 +S:	Maintained
 +F:	drivers/acpi/loongarch/
 +F:	include/linux/acpi_iovt.h
 +
  ACPI FOR RISC-V (ACPI/riscv)
  M:	Sunil V L <sunilvl@ventanamicro.com>
  L:	linux-acpi@vger.kernel.org
@@@ -1400,13 -1391,6 +1400,13 @@@ F:	Documentation/devicetree/bindings/pe
  F:	drivers/perf/amlogic/
  F:	include/soc/amlogic/
 =20
 +AMLOGIC DMA DRIVER
 +M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
 +L:	linux-amlogic@lists.infradead.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/dma/amlogic,a9-dma.yaml
 +F:	drivers/dma/amlogic-dma.c
 +
  AMLOGIC ISP DRIVER
  M:	Keke Li <keke.li@amlogic.com>
  L:	linux-media@vger.kernel.org
@@@ -2078,15 -2062,6 +2078,15 @@@ M:	Jiaxun Yang <jiaxun.yang@flygoat.com
  S:	Supported
  F:	drivers/rtc/rtc-goldfish.c
 =20
 +ANLOGIC DR1V90 CRU DRIVER
 +M:	Junhui Liu <junhui.liu@pigmoral.tech>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
 +F:	drivers/clk/anlogic/cru?dr1*
 +F:	drivers/reset/reset-dr1v90.c
 +F:	include/dt-bindings/clock/anlogic,dr1v90-cru.h
 +F:	include/dt-bindings/reset/anlogic,dr1v90-cru.h
 +
  AOA (Apple Onboard Audio) ALSA DRIVER
  M:	Johannes Berg <johannes@sipsolutions.net>
  L:	linuxppc-dev@lists.ozlabs.org
@@@ -3534,7 -3509,6 +3534,7 @@@ F:	drivers/watchdog/gunyah_wdt.
  F:	include/dt-bindings/arm/qcom,ids.h
  F:	include/dt-bindings/firmware/qcom,scm.h
  F:	include/dt-bindings/soc/qcom*
 +F:	include/dt-bindings/thermal/qcom,pas.h
  F:	include/linux/firmware/qcom
  F:	include/linux/soc/qcom/
  F:	include/soc/qcom/
@@@ -3981,15 -3955,8 +3981,15 @@@ L:	linux-arm-kernel@lists.infradead.or
  S:	Odd fixes
  F:	Documentation/arch/arm/zte/
  F:	Documentation/devicetree/bindings/arm/zte.yaml
 +F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 +F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 +F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
  F:	arch/arm/boot/dts/zte/
  F:	arch/arm/mach-zte/
 +F:	drivers/clk/zte/
 +F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 +F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 +F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
 =20
  ARM/ZYNQ ARCHITECTURE
  M:	Michal Simek <michal.simek@amd.com>
@@@ -4189,14 -4156,6 +4189,14 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml
  F:	drivers/usb/gadget/udc/aspeed_udc.c
 =20
 +ASPEED USB3 PHY DRIVER
 +M:	Ryan Chen <ryan_chen@aspeedtech.com>
 +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 +L:	linux-phy@lists.infradead.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/phy/aspeed,ast2700-usb3-phy.yaml
 +F:	drivers/phy/aspeed/phy-aspeed-usb3.c
 +
  ASPEED VIDEO ENGINE DRIVER
  M:	Eddie James <eajames@linux.ibm.com>
  L:	linux-media@vger.kernel.org
@@@ -5454,7 -5413,7 +5454,7 @@@ F:	Documentation/devicetree/bindings/us
  F:	drivers/usb/gadget/udc/bdc/
 =20
  BROADCOM BMIPS CPUFREQ DRIVER
 -M:	Markus Mayer <mmayer@broadcom.com>
 +M:	Markus Mayer <markus.mayer@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
  L:	linux-pm@vger.kernel.org
  S:	Maintained
@@@ -5486,9 -5445,9 +5486,9 @@@ F:	drivers/net/ethernet/broadcom/bnx2.
  F:	drivers/net/ethernet/broadcom/bnx2_*
 =20
  BROADCOM BNX2FC 10 GIGABIT FCOE DRIVER
 -M:	Saurav Kashyap <skashyap@marvell.com>
 -M:	Javed Hasan <jhasan@marvell.com>
 -M:	GR-QLogic-Storage-Upstream@marvell.com
 +M:	Nilesh Javali <njavali@marvell.com>
 +M:	Manish Rangankar <mrangankar@marvell.com>
 +M:	GR-ETH-Storage-Upstream@marvell.com
  L:	linux-scsi@vger.kernel.org
  S:	Supported
  F:	drivers/scsi/bnx2fc/
@@@ -5496,7 -5455,7 +5496,7 @@@
  BROADCOM BNX2I 1/10 GIGABIT iSCSI DRIVER
  M:	Nilesh Javali <njavali@marvell.com>
  M:	Manish Rangankar <mrangankar@marvell.com>
 -M:	GR-QLogic-Storage-Upstream@marvell.com
 +M:	GR-ETH-Storage-Upstream@marvell.com
  L:	linux-scsi@vger.kernel.org
  S:	Supported
  F:	drivers/scsi/bnx2i/
@@@ -5729,7 -5688,7 +5729,7 @@@ F:	drivers/spi/spi-brcmstb-qspi.
  F:	drivers/spi/spi-iproc-qspi.c
 =20
  BROADCOM STB AVS CPUFREQ DRIVER
 -M:	Markus Mayer <mmayer@broadcom.com>
 +M:	Markus Mayer <markus.mayer@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
  L:	linux-pm@vger.kernel.org
  S:	Maintained
@@@ -5737,7 -5696,7 +5737,7 @@@ F:	Documentation/devicetree/bindings/cp
  F:	drivers/cpufreq/brcmstb*
 =20
  BROADCOM STB AVS TMON DRIVER
 -M:	Markus Mayer <mmayer@broadcom.com>
 +M:	Markus Mayer <markus.mayer@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
  L:	linux-pm@vger.kernel.org
  S:	Maintained
@@@ -5745,7 -5704,7 +5745,7 @@@ F:	Documentation/devicetree/bindings/th
  F:	drivers/thermal/broadcom/brcmstb*
 =20
  BROADCOM STB DPFE DRIVER
 -M:	Markus Mayer <mmayer@broadcom.com>
 +M:	Markus Mayer <markus.mayer@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Maintained
@@@ -6182,8 -6141,7 +6182,8 @@@ F:	drivers/power/supply/cw2015_battery.
  CEPH COMMON CODE (LIBCEPH)
  M:	Ilya Dryomov <idryomov@gmail.com>
  M:	Alex Markuze <amarkuze@redhat.com>
 -M:	Viacheslav Dubeyko <slava@dubeyko.com>
 +M:	Xiubo Li <xiubo.li@clyso.com>
 +R:	Viacheslav Dubeyko <slava@dubeyko.com>
  L:	ceph-devel@vger.kernel.org
  S:	Supported
  W:	http://ceph.com/
@@@ -6196,8 -6154,7 +6196,8 @@@ F:	net/ceph
  CEPH DISTRIBUTED FILE SYSTEM CLIENT (CEPH)
  M:	Ilya Dryomov <idryomov@gmail.com>
  M:	Alex Markuze <amarkuze@redhat.com>
 -M:	Viacheslav Dubeyko <slava@dubeyko.com>
 +M:	Xiubo Li <xiubo.li@clyso.com>
 +R:	Viacheslav Dubeyko <slava@dubeyko.com>
  L:	ceph-devel@vger.kernel.org
  S:	Supported
  W:	http://ceph.com/
@@@ -6662,7 -6619,7 +6662,7 @@@ M:	Jerome Brunet <jbrunet+clk@baylibre.
  L:	linux-clk@vger.kernel.org
  S:	Maintained
  Q:	http://patchwork.kernel.org/project/linux-clk/list/
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-ne=
xt
  F:	Documentation/devicetree/bindings/clock/
  F:	drivers/clk/
  F:	include/dt-bindings/clock/
@@@ -6859,6 -6816,27 +6859,6 @@@ T:	git https://gitlab.freedesktop.org/d
  F:	include/linux/cgroup_dmem.h
  F:	kernel/cgroup/dmem.c
 =20
 -CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)
 -M:	Johannes Weiner <hannes@cmpxchg.org>
 -M:	Michal Hocko <mhocko@kernel.org>
 -M:	Roman Gushchin <roman.gushchin@linux.dev>
 -M:	Shakeel Butt <shakeel.butt@linux.dev>
 -R:	Muchun Song <muchun.song@linux.dev>
 -L:	cgroups@vger.kernel.org
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	include/linux/memcontrol.h
 -F:	include/linux/page_counter.h
 -F:	mm/memcontrol.c
 -F:	mm/memcontrol-v1.c
 -F:	mm/memcontrol-v1.h
 -F:	mm/page_counter.c
 -F:	samples/cgroup/*
 -F:	tools/testing/selftests/cgroup/memcg_protection.m
 -F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 -F:	tools/testing/selftests/cgroup/test_kmem.c
 -F:	tools/testing/selftests/cgroup/test_memcontrol.c
 -
  COREBOOT CFR FIRMWARE ATTRIBUTES DRIVER
  M:	Sean Rhodes <sean@starlabs.systems>
  L:	chrome-platform@lists.linux.dev
@@@ -7342,6 -7320,25 +7342,6 @@@ S:	Maintaine
  W:	https://docs.dasharo.com/
  F:	drivers/platform/x86/dasharo-acpi.c
 =20
 -DAMON
 -M:	SJ Park <sj@kernel.org>
 -L:	damon@lists.linux.dev
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -W:	https://damonitor.github.io
 -P:	Documentation/mm/damon/maintainer-profile.rst
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 -T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/n=
ext
 -F:	Documentation/ABI/testing/sysfs-kernel-mm-damon
 -F:	Documentation/admin-guide/mm/damon/
 -F:	Documentation/mm/damon/
 -F:	include/linux/damon.h
 -F:	include/trace/events/damon.h
 -F:	mm/damon/
 -F:	samples/damon/
 -F:	tools/testing/selftests/damon/
 -
  DAVICOM FAST ETHERNET (DMFE) NETWORK DRIVER
  L:	netdev@vger.kernel.org
  S:	Orphan
@@@ -7542,9 -7539,10 +7542,9 @@@ F:	drivers/dma/dw-edma
  F:	include/linux/dma/edma.h
 =20
  DESIGNWARE USB2 DRD IP DRIVER
 -M:	Minas Harutyunyan <hminas@synopsys.com>
 +M:	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  L:	linux-usb@vger.kernel.org
  S:	Maintained
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git
  F:	drivers/usb/dwc2/
 =20
  DESIGNWARE USB3 DRD IP DRIVER
@@@ -9917,7 -9915,6 +9917,7 @@@ M:	Jeff Layton <jlayton@kernel.org
  S:	Maintained
  F:	include/linux/errseq.h
  F:	lib/errseq.c
 +F:	lib/tests/errseq_kunit.c
 =20
  ES9039Q2M AUDIO CODEC DRIVER
  M:	Karl Asseily <karl@asseily.com>
@@@ -10172,7 -10169,7 +10172,7 @@@ S:	Maintaine
  W:	https://f2fs.wiki.kernel.org/
  Q:	https://patchwork.kernel.org/project/f2fs/list/
  B:	https://bugzilla.kernel.org/enter_bug.cgi?product=3DFile%20System&comp=
onent=3Df2fs
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev
  F:	Documentation/ABI/testing/sysfs-fs-f2fs
  F:	Documentation/filesystems/f2fs.rst
  F:	fs/f2fs/
@@@ -11133,7 -11130,6 +11133,7 @@@ M:	Peter Oberparleiter <oberpar@linux.i
  S:	Maintained
  F:	Documentation/dev-tools/gcov.rst
  F:	kernel/gcov/
 +F:	scripts/Makefile.gcov
 =20
  GDB KERNEL DEBUGGING HELPER SCRIPTS
  M:	Jan Kiszka <jan.kiszka@siemens.com>
@@@ -11237,7 -11233,7 +11237,7 @@@ R:	Manivannan Sadhasivam <mani@kernel.o
  L:	linux-phy@lists.infradead.org
  S:	Supported
  Q:	https://patchwork.kernel.org/project/linux-phy/list/
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git ne=
xt
  F:	Documentation/devicetree/bindings/phy/
  F:	drivers/phy/
  F:	include/dt-bindings/phy/
@@@ -12164,6 -12160,17 +12164,6 @@@ S:	Maintaine
  F:	Documentation/ABI/testing/debugfs-hisi-zip
  F:	drivers/crypto/hisilicon/zip/
 =20
 -HMM - Heterogeneous Memory Management
 -M:	Jason Gunthorpe <jgg@nvidia.com>
 -M:	Leon Romanovsky <leonro@nvidia.com>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	Documentation/mm/hmm.rst
 -F:	include/linux/hmm*
 -F:	lib/test_hmm*
 -F:	mm/hmm*
 -F:	tools/testing/selftests/mm/*hmm*
 -
  HONEYWELL ABP2030PA PRESSURE SENSOR SERIES IIO DRIVER
  M:	Petre Rodan <petre.rodan@subdimension.ro>
  L:	linux-iio@vger.kernel.org
@@@ -12317,6 -12324,30 +12317,6 @@@ F:	drivers/power/supply/huawei-gaokun-b
  F:	drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
  F:	include/linux/platform_data/huawei-gaokun-ec.h
 =20
 -HUGETLB SUBSYSTEM
 -M:	Muchun Song <muchun.song@linux.dev>
 -M:	Oscar Salvador <osalvador@suse.de>
 -R:	David Hildenbrand <david@kernel.org>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	Documentation/ABI/testing/sysfs-kernel-mm-hugepages
 -F:	Documentation/admin-guide/mm/hugetlbpage.rst
 -F:	Documentation/mm/hugetlbfs_reserv.rst
 -F:	Documentation/mm/vmemmap_dedup.rst
 -F:	fs/hugetlbfs/
 -F:	include/linux/hugetlb.h
 -F:	include/linux/vmemmap-optimization.h
 -F:	include/trace/events/hugetlbfs.h
 -F:	mm/hugetlb.c
 -F:	mm/hugetlb_cgroup.c
 -F:	mm/hugetlb_cma.c
 -F:	mm/hugetlb_cma.h
 -F:	mm/hugetlb_sysctl.c
 -F:	mm/hugetlb_sysfs.c
 -F:	mm/hugetlb_vmemmap.c
 -F:	mm/hugetlb_vmemmap.h
 -F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 -
  HVA ST MEDIA DRIVER
  M:	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
  L:	linux-media@vger.kernel.org
@@@ -12325,6 -12356,17 +12325,6 @@@ W:	https://linuxtv.or
  T:	git git://linuxtv.org/media.git
  F:	drivers/media/platform/st/sti/hva
 =20
 -HWPOISON MEMORY FAILURE HANDLING
 -M:	Miaohe Lin <linmiaohe@huawei.com>
 -R:	Naoya Horiguchi <nao.horiguchi@gmail.com>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	include/linux/memory-failure.h
 -F:	include/trace/events/memory-failure.h
 -F:	mm/hwpoison-inject.c
 -F:	mm/memory-failure.c
 -F:	tools/testing/selftests/mm/memory-failure.c
 -
  HYCON HY46XX TOUCHSCREEN SUPPORT
  M:	Giulio Benetti <giulio.benetti@benettiengineering.com>
  L:	linux-input@vger.kernel.org
@@@ -13216,8 -13258,9 +13216,8 @@@ S:	Maintaine
  F:	drivers/platform/x86/intel/atomisp2/led.c
 =20
  INTEL BIOS SAR INT1092 DRIVER
 -M:	Shravan Sudhakar <s.shravan@intel.com>
  L:	platform-driver-x86@vger.kernel.org
 -S:	Maintained
 +S:	Orphan
  F:	drivers/platform/x86/intel/int1092/
 =20
  INTEL BROXTON PMC DRIVER
@@@ -13739,7 -13782,6 +13739,7 @@@ M:	Srinivas Pandruvada <srinivas.pandru
  L:	platform-driver-x86@vger.kernel.org
  S:	Maintained
  F:	Documentation/ABI/testing/debugfs-tpmi
 +F:	drivers/platform/x86/intel/tpmi_common.[ch]
  F:	drivers/platform/x86/intel/vsec_tpmi.c
  F:	include/linux/intel_tpmi.h
 =20
@@@ -14261,6 -14303,23 +14261,6 @@@ S:	Maintaine
  F:	Documentation/hwmon/kb9002.rst
  F:	drivers/hwmon/kb9002.c
 =20
 -KASAN
 -M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
 -R:	Alexander Potapenko <glider@google.com>
 -R:	Andrey Konovalov <andreyknvl@gmail.com>
 -R:	Dmitry Vyukov <dvyukov@google.com>
 -R:	Vincenzo Frascino <vincenzo.frascino@arm.com>
 -L:	kasan-dev@googlegroups.com
 -S:	Maintained
 -B:	https://bugzilla.kernel.org/buglist.cgi?component=3DSanitizers&product=
=3DMemory%20Management
 -F:	Documentation/dev-tools/kasan.rst
 -F:	arch/*/include/asm/*kasan.h
 -F:	arch/*/mm/kasan_init*
 -F:	include/linux/kasan*.h
 -F:	lib/Kconfig.kasan
 -F:	mm/kasan/
 -F:	scripts/Makefile.kasan
 -
  KCONFIG
  M:	Nathan Chancellor <nathan@kernel.org>
  M:	Nicolas Schier <nsc@kernel.org>
@@@ -14577,7 -14636,7 +14577,7 @@@ L:	kvm@vger.kernel.or
  L:	kvm-riscv@lists.infradead.org
  L:	linux-riscv@lists.infradead.org
  S:	Maintained
 -T:	git https://github.com/kvm-riscv/linux.git
 +T:	git https://github.com/kvm-riscv/linux.git riscv_kvm_next
  F:	arch/riscv/include/asm/kvm*
  F:	arch/riscv/include/uapi/asm/kvm*
  F:	arch/riscv/kvm/
@@@ -15045,7 -15104,6 +15045,7 @@@ F:	drivers/usb/misc/legousbtower.
  LENOVO drivers
  M:	Mark Pearson <mpearson-lenovo@squebb.ca>
  M:	Derek J. Clark <derekjohn.clark@gmail.com>
 +M:	Rong Zhang <i@rong.moe>
  L:	platform-driver-x86@vger.kernel.org
  S:	Maintained
  F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@@ -16881,17 -16939,6 +16881,17 @@@ M:	Sean Wang <sean.wang@mediatek.com
  S:	Maintained
  F:	drivers/media/rc/mtk-cir.c
 =20
 +MEDIATEK CLOCK DRIVERS
 +M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 +L:	linux-clk@vger.kernel.org
 +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git
 +F:	Documentation/devicetree/bindings/clock/mediatek,*
 +F:	drivers/clk/mediatek/
 +F:	include/dt-bindings/clock/mediatek,*.h
 +F:	include/dt-bindings/clock/mt*-clk.h
 +
  MEDIATEK DMA DRIVER
  M:	Sean Wang <sean.wang@mediatek.com>
  L:	dmaengine@vger.kernel.org
@@@ -17316,6 -17363,23 +17316,6 @@@ F:	arch/*/include/asm/sync_core.
  F:	include/uapi/linux/membarrier.h
  F:	kernel/sched/membarrier.c
 =20
 -MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 -M:	Mike Rapoport <rppt@kernel.org>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git for-=
next
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git fixes
 -F:	Documentation/core-api/boot-time-mm.rst
 -F:	include/linux/kho/abi/memblock.h
 -F:	include/linux/memblock.h
 -F:	mm/arch_numa.c
 -F:	mm/memblock.c
 -F:	mm/memtest.c
 -F:	mm/mm_init.c
 -F:	mm/mm_init.h
 -F:	mm/rodata_test.c
 -F:	tools/testing/memblock/
 -
  MEMORY CONTROLLER DRIVERS
  M:	Krzysztof Kozlowski <krzk@kernel.org>
  L:	linux-kernel@vger.kernel.org
@@@ -17335,6 -17399,21 +17335,6 @@@ S:	Maintaine
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
  F:	drivers/devfreq/tegra30-devfreq.c
 =20
 -MEMORY HOT(UN)PLUG
 -M:	David Hildenbrand <david@kernel.org>
 -M:	Oscar Salvador <osalvador@suse.de>
 -L:	linux-mm@kvack.org
 -L:	linux-cxl@vger.kernel.org
 -S:	Maintained
 -F:	Documentation/admin-guide/mm/memory-hotplug.rst
 -F:	Documentation/core-api/memory-hotplug.rst
 -F:	drivers/base/memory.c
 -F:	include/linux/memory_hotplug.h
 -F:	include/linux/memremap.h
 -F:	mm/memremap.c
 -F:	mm/memory_hotplug.c
 -F:	tools/testing/selftests/memory-hotplug/
 -
  MEMORY MANAGEMENT
  M:	Andrew Morton <akpm@linux-foundation.org>
  L:	linux-mm@kvack.org
@@@ -17358,15 -17437,18 +17358,15 @@@ F:	mm/alloc_tag.
  F:	tools/testing/selftests/alloc_tag/
 =20
  MEMORY MANAGEMENT - BALLOON
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
  L:	linux-mm@kvack.org
  L:	virtualization@lists.linux.dev
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
  F:	include/linux/balloon.h
  F:	mm/balloon.c
 =20
  MEMORY MANAGEMENT - CORE
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
  R:	Lorenzo Stoakes <ljs@kernel.org>
  R:	Liam R. Howlett <liam@infradead.org>
@@@ -17376,34 -17458,27 +17376,34 @@@ R:	Suren Baghdasaryan <surenb@google.=
co
  R:	Michal Hocko <mhocko@suse.com>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
  F:	Documentation/admin-guide/sysctl/vm.rst
 +F:	Documentation/core-api/gfp_mask-from-fs-io.rst
 +F:	fs/proc/meminfo.c
 +F:	include/linux/cacheflush.h
  F:	include/linux/folio_batch.h
  F:	include/linux/gfp.h
  F:	include/linux/gfp_types.h
 +F:	include/linux/highmem-internal.h
  F:	include/linux/highmem.h
  F:	include/linux/leafops.h
  F:	include/linux/memory.h
  F:	include/linux/mm.h
  F:	include/linux/mm_*.h
 -F:	include/linux/mmzone.h
  F:	include/linux/mmdebug.h
  F:	include/linux/mmu_notifier.h
 +F:	include/linux/mmzone.h
  F:	include/linux/pagewalk.h
 +F:	include/linux/pfn.h
  F:	include/linux/pgalloc.h
  F:	include/linux/pgtable.h
  F:	include/linux/ptdump.h
 +F:	include/linux/sched/mm.h
 +F:	include/linux/vm_event_item.h
  F:	include/linux/vmpressure.h
  F:	include/linux/vmstat.h
 -F:	fs/proc/meminfo.c
 +F:	include/trace/events/mmflags.h
 +F:	include/trace/events/pagemap.h
  F:	kernel/fork.c
  F:	mm/Kconfig
  F:	mm/debug.c
@@@ -17419,31 -17494,14 +17419,31 @@@ F:	mm/mmzone.
  F:	mm/pagewalk.c
  F:	mm/pgtable-generic.c
  F:	mm/ptdump.c
 -F:	mm/sparse-vmemmap.c
 -F:	mm/sparse.c
 -F:	mm/sparse.h
  F:	mm/util.c
  F:	mm/vmpressure.c
  F:	mm/vmstat.c
 +F:	scripts/gdb/linux/mm.py
  N:	include\/linux\/page[-_][a-zA-Z]*
 =20
 +MEMORY MANAGEMENT - DAMON
 +M:	SJ Park <sj@kernel.org>
 +L:	damon@lists.linux.dev
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +W:	https://damonitor.github.io
 +P:	Documentation/mm/damon/maintainer-profile.rst
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/n=
ext
 +F:	Documentation/ABI/testing/sysfs-kernel-mm-damon
 +F:	Documentation/admin-guide/mm/damon/
 +F:	Documentation/mm/damon/
 +F:	include/linux/damon.h
 +F:	include/trace/events/damon.h
 +F:	mm/damon/
 +F:	samples/damon/
 +F:	tools/testing/selftests/damon/
 +
  MEMORY MANAGEMENT - EXECMEM
  M:	Andrew Morton <akpm@linux-foundation.org>
  M:	Mike Rapoport <rppt@kernel.org>
@@@ -17453,14 -17511,15 +17453,14 @@@ F:	include/linux/execmem.
  F:	mm/execmem.c
 =20
  MEMORY MANAGEMENT - GUP (GET USER PAGES)
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
  R:	Jason Gunthorpe <jgg@nvidia.com>
  R:	John Hubbard <jhubbard@nvidia.com>
  R:	Peter Xu <peterx@redhat.com>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
 +F:	Documentation/core-api/pin_user_pages.rst
  F:	mm/gup.c
  F:	mm/gup_test.c
  F:	mm/gup_test.h
@@@ -17468,79 -17527,15 +17468,79 @@@ F:	tools/mm/gup_bench.
  F:	tools/testing/selftests/mm/gup.c
  F:	tools/testing/selftests/mm/gup_longterm.c
 =20
 +MEMORY MANAGEMENT - HMM (Heterogeneous Memory Management)
 +M:	Jason Gunthorpe <jgg@nvidia.com>
 +M:	Leon Romanovsky <leonro@nvidia.com>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/mm/hmm.rst
 +F:	include/linux/hmm*
 +F:	lib/test_hmm*
 +F:	mm/hmm*
 +F:	tools/testing/selftests/mm/*hmm*
 +
 +MEMORY MANAGEMENT - HUGETLB
 +M:	Muchun Song <muchun.song@linux.dev>
 +M:	Oscar Salvador <osalvador@suse.de>
 +R:	David Hildenbrand <david@kernel.org>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/ABI/testing/sysfs-kernel-mm-hugepages
 +F:	Documentation/admin-guide/cgroup-v1/hugetlb.rst
 +F:	Documentation/admin-guide/mm/hugetlbpage.rst
 +F:	Documentation/mm/hugetlbfs_reserv.rst
 +F:	Documentation/mm/vmemmap_dedup.rst
 +F:	fs/hugetlbfs/
 +F:	include/linux/hugetlb*
 +F:	include/linux/vmemmap-optimization.h
 +F:	include/trace/events/hugetlbfs.h
 +F:	mm/hugetlb.c
 +F:	mm/hugetlb_cgroup.c
 +F:	mm/hugetlb_cma.c
 +F:	mm/hugetlb_cma.h
 +F:	mm/hugetlb_internal.h
 +F:	mm/hugetlb_sysctl.c
 +F:	mm/hugetlb_sysfs.c
 +F:	mm/hugetlb_vmemmap.c
 +F:	mm/hugetlb_vmemmap.h
 +F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 +
 +MEMORY MANAGEMENT - HWPOISON MEMORY FAILURE HANDLING
 +M:	Miaohe Lin <linmiaohe@huawei.com>
 +R:	Naoya Horiguchi <nao.horiguchi@gmail.com>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/ABI/testing/sysfs-memory-page-offline
 +F:	include/linux/memory-failure.h
 +F:	include/trace/events/memory-failure.h
 +F:	mm/hwpoison-inject.c
 +F:	mm/memory-failure.c
 +F:	tools/testing/selftests/mm/memory-failure.c
 +
 +MEMORY MANAGEMENT - KASAN
 +M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
 +R:	Alexander Potapenko <glider@google.com>
 +R:	Andrey Konovalov <andreyknvl@gmail.com>
 +R:	Dmitry Vyukov <dvyukov@google.com>
 +R:	Vincenzo Frascino <vincenzo.frascino@arm.com>
 +L:	kasan-dev@googlegroups.com
 +S:	Maintained
 +B:	https://bugzilla.kernel.org/buglist.cgi?component=3DSanitizers&product=
=3DMemory%20Management
 +F:	Documentation/dev-tools/kasan.rst
 +F:	arch/*/include/asm/*kasan.h
 +F:	arch/*/mm/kasan_init*
 +F:	include/linux/kasan*.h
 +F:	lib/Kconfig.kasan
 +F:	mm/kasan/
 +F:	scripts/Makefile.kasan
 +
  MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
  R:	Xu Xin <xu.xin@linux.dev>
  R:	Chengming Zhou <chengming.zhou@linux.dev>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
  F:	Documentation/ABI/testing/sysfs-kernel-mm-ksm
  F:	Documentation/admin-guide/mm/ksm.rst
  F:	Documentation/mm/ksm.rst
@@@ -17549,145 -17544,6 +17549,145 @@@ F:	include/trace/events/ksm.
  F:	mm/ksm.c
  F:	mm/mm_slot.h
 =20
 +MEMORY MANAGEMENT - MEMBLOCK AND INITIALIZATION
 +M:	Mike Rapoport <rppt@kernel.org>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git for-=
next
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git fixes
 +F:	Documentation/core-api/boot-time-mm.rst
 +F:	include/linux/kho/abi/memblock.h
 +F:	include/linux/memblock.h
 +F:	mm/arch_numa.c
 +F:	mm/memblock.c
 +F:	mm/memtest.c
 +F:	mm/mm_init.c
 +F:	mm/mm_init.h
 +F:	mm/rodata_test.c
 +F:	tools/testing/memblock/
 +
 +MEMORY MANAGEMENT - MEMORY HOT(UN)PLUG
 +M:	David Hildenbrand <david@kernel.org>
 +M:	Oscar Salvador <osalvador@suse.de>
 +L:	linux-mm@kvack.org
 +L:	linux-cxl@vger.kernel.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
 +F:	Documentation/ABI/testing/sysfs-devices-memory
 +F:	Documentation/admin-guide/mm/memory-hotplug.rst
 +F:	Documentation/core-api/memory-hotplug.rst
 +F:	drivers/base/memory.c
 +F:	include/linux/memory_hotplug.h
 +F:	include/linux/memremap.h
 +F:	mm/memory_hotplug.c
 +F:	mm/memremap.c
 +F:	tools/testing/selftests/memory-hotplug/
 +
 +MEMORY MANAGEMENT - MEMORY MAP
 +M:	Muchun Song <muchun.song@linux.dev>
 +M:	Mike Rapoport <rppt@kernel.org>
 +M:	David Hildenbrand <david@kernel.org>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
 +F:	Documentation/mm/memory-model.rst
 +F:	arch/*/include/asm/sparsemem.h
 +F:	include/asm-generic/memory_model.h
 +F:	mm/sparse-vmemmap.c
 +F:	mm/sparse.c
 +F:	mm/sparse.h
 +K:	(?i:vmemmap)
 +
 +MEMORY MANAGEMENT - MEMORY MAPPING
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +M:	Liam R. Howlett <liam@infradead.org>
 +M:	Lorenzo Stoakes <ljs@kernel.org>
 +R:	Vlastimil Babka <vbabka@kernel.org>
 +R:	Jann Horn <jannh@google.com>
 +R:	Pedro Falcato <pfalcato@suse.de>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +W:	http://www.linux-mm.org
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +F:	Documentation/core-api/protection-keys.rst
 +F:	Documentation/filesystems/mmap_prepare.rst
 +F:	Documentation/userspace-api/mseal.rst
 +F:	fs/proc/task_mmu.c
 +F:	fs/proc/task_nommu.c
 +F:	include/linux/mman.h
 +F:	include/linux/pkeys.h
 +F:	include/trace/events/mmap.h
 +F:	include/uapi/linux/mman.h
 +F:	mm/char-mem.c
 +F:	mm/mincore.c
 +F:	mm/mlock.c
 +F:	mm/mmap.c
 +F:	mm/mprotect.c
 +F:	mm/mremap.c
 +F:	mm/mseal.c
 +F:	mm/msync.c
 +F:	mm/nommu.c
 +F:	mm/vma.c
 +F:	mm/vma.h
 +F:	mm/vma_exec.c
 +F:	mm/vma_init.c
 +F:	mm/vma_internal.h
 +F:	tools/testing/selftests/mm/merge.c
 +F:	tools/testing/vma/
 +
 +MEMORY MANAGEMENT - MEMORY MAPPING - LOCKING
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +M:	Suren Baghdasaryan <surenb@google.com>
 +M:	Liam R. Howlett <liam@infradead.org>
 +M:	Lorenzo Stoakes <ljs@kernel.org>
 +R:	Vlastimil Babka <vbabka@kernel.org>
 +R:	Shakeel Butt <shakeel.butt@linux.dev>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +W:	http://www.linux-mm.org
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +F:	Documentation/mm/process_addrs.rst
 +F:	include/linux/mmap_lock.h
 +F:	include/trace/events/mmap_lock.h
 +F:	mm/mmap_lock.c
 +
 +MEMORY MANAGEMENT - MEMORY MAPPING - MADVISE (MEMORY ADVICE)
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +M:	Liam R. Howlett <liam@infradead.org>
 +M:	Lorenzo Stoakes <ljs@kernel.org>
 +M:	David Hildenbrand <david@kernel.org>
 +R:	Vlastimil Babka <vbabka@kernel.org>
 +R:	Jann Horn <jannh@google.com>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +W:	http://www.linux-mm.org
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +F:	include/uapi/asm-generic/mman-common.h
 +F:	mm/madvise.c
 +
 +MEMORY MANAGEMENT - MEMORY RESOURCE CONTROLLER (MEMCG)
 +M:	Johannes Weiner <hannes@cmpxchg.org>
 +M:	Michal Hocko <mhocko@kernel.org>
 +M:	Roman Gushchin <roman.gushchin@linux.dev>
 +M:	Shakeel Butt <shakeel.butt@linux.dev>
 +R:	Muchun Song <muchun.song@linux.dev>
 +L:	cgroups@vger.kernel.org
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/admin-guide/cgroup-v1/memory.rst
 +F:	include/linux/memcontrol.h
 +F:	include/linux/page_counter.h
 +F:	include/trace/events/memcg.h
 +F:	mm/memcontrol-v1.c
 +F:	mm/memcontrol-v1.h
 +F:	mm/memcontrol.c
 +F:	mm/page_counter.c
 +F:	samples/cgroup/*
 +F:	tools/testing/selftests/cgroup/memcg_protection.m
 +F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 +F:	tools/testing/selftests/cgroup/test_kmem.c
 +F:	tools/testing/selftests/cgroup/test_memcontrol.c
 +
  MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
  M:	Andrew Morton <akpm@linux-foundation.org>
  R:	Kairui Song <kasong@tencent.com>
@@@ -17711,6 -17567,7 +17711,6 @@@ F:	mm/vmscan.
  F:	mm/workingset.c
 =20
  MEMORY MANAGEMENT - MIGRATION
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
  R:	Zi Yan <ziy@nvidia.com>
  R:	Matthew Brost <matthew.brost@intel.com>
@@@ -17721,10 -17578,10 +17721,10 @@@ R:	Ying Huang <ying.huang@linux.aliba=
ba
  R:	Alistair Popple <apopple@nvidia.com>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
  F:	include/linux/migrate.h
  F:	include/linux/migrate_mode.h
 +F:	include/trace/events/migrate.h
  F:	mm/migrate.c
  F:	mm/migrate_device.c
 =20
@@@ -17748,20 -17605,13 +17748,20 @@@ F:	Documentation/admin-guide/mm
  F:	Documentation/core-api/memory-allocation.rst
  F:	Documentation/core-api/mm-api.rst
  F:	Documentation/mm/
 -F:	mm/char-mem.c
 +F:	fs/proc/page.c
 +F:	include/linux/backing-dev-defs.h
 +F:	include/linux/backing-dev.h
  F:	include/linux/cma.h
  F:	include/linux/dmapool.h
  F:	include/linux/ioremap.h
 +F:	include/linux/kernel-page-flags.h
  F:	include/linux/page_idle.h
 +F:	include/trace/events/cma.h
 +F:	include/uapi/linux/kernel-page-flags.h
  F:	mm/backing-dev.c
 +F:	mm/char-mem.c
  F:	mm/cma.c
 +F:	mm/cma.h
  F:	mm/cma_debug.c
  F:	mm/cma_sysfs.c
  F:	mm/dmapool.c
@@@ -17774,26 -17624,7 +17774,26 @@@ F:	mm/page_idle.
  F:	mm/pgalloc-track.h
  F:	mm/process_vm_access.c
  F:	tools/lib/mm/
 +F:	tools/mm/
  F:	tools/testing/selftests/mm/
 +X:	Documentation/ABI/testing/sysfs-kernel-mm-damon
 +X:	Documentation/admin-guide/mm/damon/
 +X:	Documentation/mm/damon/
 +
 +MEMORY MANAGEMENT - MMU GATHER AND TLB INVALIDATION
 +M:	Will Deacon <will@kernel.org>
 +M:	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +M:	Nick Piggin <npiggin@gmail.com>
 +M:	Peter Zijlstra <peterz@infradead.org>
 +L:	linux-arch@vger.kernel.org
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/core-api/cachetlb.rst
 +F:	arch/*/include/asm/tlb.h
 +F:	include/asm-generic/tlb.h
 +F:	include/trace/events/tlb.h
 +F:	mm/mmu_gather.c
 =20
  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
  M:	Andrew Morton <akpm@linux-foundation.org>
@@@ -17801,13 -17632,13 +17801,13 @@@ M:	Mike Rapoport <rppt@kernel.org
  L:	linux-mm@kvack.org
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git
 +F:	include/linux/numa.h
  F:	include/linux/numa_memblks.h
  F:	mm/numa.c
  F:	mm/numa_emulation.c
  F:	mm/numa_memblks.c
 =20
  MEMORY MANAGEMENT - NUMA PLACEMENT
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
  M:	Gregory Price <gourry@gourry.net>
  R:	Zi Yan <ziy@nvidia.com>
@@@ -17816,11 -17647,11 +17816,11 @@@ R:	Rakie Kim <rakie.kim@sk.com
  R:	Ying Huang <ying.huang@linux.alibaba.com>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
  F:	Documentation/ABI/testing/sysfs-kernel-mm-memory-tiers
  F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy
  F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy-weighted-interleave
 +F:	Documentation/admin-guide/numastat.rst
  F:	include/linux/memory-tiers.h
  F:	include/linux/mempolicy.h
  F:	include/uapi/linux/mempolicy.h
@@@ -17839,22 -17670,19 +17839,22 @@@ F:	include/uapi/linux/oom.
  F:	mm/oom_kill.c
 =20
  MEMORY MANAGEMENT - PAGE ALLOCATOR
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	Vlastimil Babka <vbabka@kernel.org>
 +M:	Johannes Weiner <hannes@cmpxchg.org>
  R:	Suren Baghdasaryan <surenb@google.com>
  R:	Michal Hocko <mhocko@suse.com>
  R:	Brendan Jackman <brendan.jackman@linux.dev>
 -R:	Johannes Weiner <hannes@cmpxchg.org>
  R:	Zi Yan <ziy@nvidia.com>
  L:	linux-mm@kvack.org
  S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/page_alloc.git pa=
ge_alloc/for-next
  F:	include/linux/compaction.h
  F:	include/linux/gfp.h
  F:	include/linux/page-isolation.h
  F:	include/linux/pageblock-flags.h
 +F:	include/trace/events/compaction.h
 +F:	include/trace/events/page_isolation.h
 +F:	include/trace/events/page_ref.h
  F:	mm/compaction.c
  F:	mm/debug_page_alloc.c
  F:	mm/debug_page_ref.c
@@@ -17871,51 -17699,6 +17871,51 @@@ F:	mm/page_reporting.
  F:	mm/show_mem.c
  F:	mm/shuffle.c
  F:	mm/shuffle.h
 +F:	scripts/gdb/linux/page_owner.py
 +F:	tools/mm/page_owner_filter.c
 +F:	tools/mm/page_owner_sort.c
 +
 +MEMORY MANAGEMENT - PAGE CACHE
 +M:	Matthew Wilcox (Oracle) <willy@infradead.org>
 +M:	Jan Kara <jack@suse.cz>
 +L:	linux-fsdevel@vger.kernel.org
 +L:	linux-mm@kvack.org
 +S:	Supported
 +T:	git git://git.infradead.org/users/willy/pagecache.git
 +F:	Documentation/filesystems/locking.rst
 +F:	Documentation/filesystems/vfs.rst
 +F:	include/linux/pagemap.h
 +F:	include/linux/writeback.h
 +F:	include/trace/events/filemap.h
 +F:	include/trace/events/readahead.h
 +F:	include/trace/events/writeback.h
 +F:	mm/filemap.c
 +F:	mm/page-writeback.c
 +F:	mm/readahead.c
 +F:	mm/truncate.c
 +
 +MEMORY MANAGEMENT - PAGE TABLE CHECK
 +M:	Pasha Tatashin <pasha.tatashin@soleen.com>
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/mm/page_table_check.rst
 +F:	include/linux/page_table_check.h
 +F:	mm/page_table_check.c
 +
 +MEMORY MANAGEMENT - PER-CPU MEMORY ALLOCATOR
 +M:	Dennis Zhou <dennis@kernel.org>
 +M:	Tejun Heo <tj@kernel.org>
 +M:	Christoph Lameter <cl@gentwo.org>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git
 +F:	arch/*/include/asm/percpu.h
 +F:	include/linux/percpu*.h
 +F:	include/trace/events/percpu.h
 +F:	lib/percpu*.c
 +F:	mm/percpu*.c
 +F:	mm/percpu-internal.h
 =20
  MEMORY MANAGEMENT - RECLAIM
  M:	Andrew Morton <akpm@linux-foundation.org>
@@@ -17927,11 -17710,11 +17927,11 @@@ R:	Shakeel Butt <shakeel.butt@linux.d=
ev
  R:	Lorenzo Stoakes <ljs@kernel.org>
  L:	linux-mm@kvack.org
  S:	Maintained
 +F:	include/trace/events/vmscan.h
  F:	mm/vmscan.c
  F:	mm/workingset.c
 =20
  MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
  M:	Lorenzo Stoakes <ljs@kernel.org>
  R:	Rik van Riel <riel@surriel.com>
@@@ -17942,7 -17725,6 +17942,7 @@@ R:	Jann Horn <jannh@google.com
  R:	Lance Yang <lance.yang@linux.dev>
  L:	linux-mm@kvack.org
  S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
  F:	include/linux/rmap.h
  F:	mm/interval_tree.c
  F:	mm/page_vma_mapped.c
@@@ -17957,70 -17739,6 +17957,70 @@@ S:	Maintaine
  F:	include/linux/secretmem.h
  F:	mm/secretmem.c
 =20
 +MEMORY MANAGEMENT - SHARED MEMORY (SHMEM/TMPFS/MEMFD)
 +M:	Hugh Dickins <hughd@google.com>
 +M:	David Hildenbrand <david@kernel.org>
 +R:	Baolin Wang <baolin.wang@linux.alibaba.com>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
 +F:	Documentation/filesystems/tmpfs.rst
 +F:	Documentation/mm/shmfs.rst
 +F:	Documentation/userspace-api/mfd_noexec.rst
 +F:	include/linux/memfd.h
 +F:	include/linux/shmem_fs.h
 +F:	include/uapi/linux/memfd.h
 +F:	mm/memfd.c
 +F:	mm/shmem.c
 +F:	mm/shmem_quota.c
 +F:	tools/testing/selftests/memfd/
 +F:	tools/testing/selftests/tmpfs/
 +
 +MEMORY MANAGEMENT - SHRINKER
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +M:	Dave Chinner <david@fromorbit.com>
 +R:	Qi Zheng <qi.zheng@linux.dev>
 +R:	Roman Gushchin <roman.gushchin@linux.dev>
 +R:	Muchun Song <muchun.song@linux.dev>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/admin-guide/mm/shrinker_debugfs.rst
 +F:	include/linux/list_lru.h
 +F:	include/linux/shrinker.h
 +F:	mm/list_lru.c
 +F:	mm/shrinker.c
 +F:	mm/shrinker_debug.c
 +F:	tools/cgroup/memcg_shrinker.py
 +
 +MEMORY MANAGEMENT - SLAB ALLOCATOR
 +M:	Vlastimil Babka <vbabka@kernel.org>
 +M:	Harry Yoo <harry@kernel.org>
 +R:	Hao Li <hao.li@linux.dev>
 +R:	Christoph Lameter <cl@gentwo.org>
 +R:	David Rientjes <rientjes@google.com>
 +R:	Roman Gushchin <roman.gushchin@linux.dev>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git slab/for=
-next
 +F:	Documentation/ABI/testing/sysfs-kernel-slab
 +F:	Documentation/admin-guide/mm/slab.rst
 +F:	Documentation/mm/slab.rst
 +F:	include/linux/mempool.h
 +F:	include/linux/slab.h
 +F:	include/trace/events/kmem.h
 +F:	lib/tests/slub_kunit.c
 +F:	mm/failslab.c
 +F:	mm/mempool.c
 +F:	mm/slab.h
 +F:	mm/slab_common.c
 +F:	mm/slub.c
 +F:	scripts/gdb/linux/slab.py
 +F:	tools/cgroup/memcg_slabinfo.py
 +F:	tools/include/linux/slab.h
 +F:	tools/lib/slab.c
 +F:	tools/mm/slabinfo-gnuplot.sh
 +F:	tools/mm/slabinfo.c
 +
  MEMORY MANAGEMENT - SWAP
  M:	Andrew Morton <akpm@linux-foundation.org>
  M:	Chris Li <chrisl@kernel.org>
@@@ -18040,13 -17758,14 +18040,13 @@@ F:	include/linux/swapfile.
  F:	include/linux/swapops.h
  F:	mm/page_io.c
  F:	mm/swap.h
 -F:	mm/swap_table.h
  F:	mm/swap_state.c
 +F:	mm/swap_table.h
  F:	mm/swapfile.c
 =20
  MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
 -R:	Zi Yan <ziy@nvidia.com>
 +M:	Zi Yan <ziy@nvidia.com>
  R:	Baolin Wang <baolin.wang@linux.alibaba.com>
  R:	Liam R. Howlett <liam@infradead.org>
  R:	Nico Pache <nico.pache@linux.dev>
@@@ -18058,18 -17777,16 +18058,18 @@@ R:	Usama Arif <usama.arif@linux.dev
  R:	Kiryl Shutsemau <kas@kernel.org>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
  F:	Documentation/ABI/testing/sysfs-kernel-mm-transparent-hugepage
  F:	Documentation/admin-guide/mm/transhuge.rst
  F:	include/linux/huge_mm.h
  F:	include/linux/khugepaged.h
  F:	include/trace/events/huge_memory.h
 +F:	include/trace/events/thp.h
 +F:	mm/collapse.h
  F:	mm/huge_memory.c
  F:	mm/khugepaged.c
  F:	mm/mm_slot.h
 +F:	tools/mm/thpmaps
  F:	tools/testing/selftests/mm/khugepaged.c
  F:	tools/testing/selftests/mm/split_huge_page_test.c
  F:	tools/testing/selftests/mm/transhuge-stress.c
@@@ -18102,41 -17819,66 +18102,41 @@@ F:	rust/kernel/mm.r
  F:	rust/kernel/mm/
  F:	rust/kernel/page.rs
 =20
 -MEMORY MAPPING
 +MEMORY MANAGEMENT - VMALLOC
  M:	Andrew Morton <akpm@linux-foundation.org>
 -M:	Liam R. Howlett <liam@infradead.org>
 -M:	Lorenzo Stoakes <ljs@kernel.org>
 -R:	Vlastimil Babka <vbabka@kernel.org>
 -R:	Jann Horn <jannh@google.com>
 -R:	Pedro Falcato <pfalcato@suse.de>
 +M:	Uladzislau Rezki <urezki@gmail.com>
  L:	linux-mm@kvack.org
  S:	Maintained
  W:	http://www.linux-mm.org
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 -F:	mm/char-mem.c
 -F:	include/trace/events/mmap.h
 -F:	fs/proc/task_mmu.c
 -F:	fs/proc/task_nommu.c
 -F:	mm/mincore.c
 -F:	mm/mlock.c
 -F:	mm/mmap.c
 -F:	mm/mprotect.c
 -F:	mm/mremap.c
 -F:	mm/mseal.c
 -F:	mm/msync.c
 -F:	mm/nommu.c
 -F:	mm/vma.c
 -F:	mm/vma.h
 -F:	mm/vma_exec.c
 -F:	mm/vma_init.c
 -F:	mm/vma_internal.h
 -F:	tools/testing/selftests/mm/merge.c
 -F:	tools/testing/vma/
 +F:	include/linux/vmalloc.h
 +F:	include/trace/events/vmalloc.h
 +F:	lib/test_vmalloc.c
 +F:	mm/vmalloc.c
 +F:	mm/vmalloc.h
 +F:	scripts/gdb/linux/vmalloc.py
 =20
 -MEMORY MAPPING - LOCKING
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -M:	Suren Baghdasaryan <surenb@google.com>
 -M:	Liam R. Howlett <liam@infradead.org>
 -M:	Lorenzo Stoakes <ljs@kernel.org>
 -R:	Vlastimil Babka <vbabka@kernel.org>
 -R:	Shakeel Butt <shakeel.butt@linux.dev>
 +MEMORY MANAGEMENT - ZSMALLOC COMPRESSED SLAB MEMORY ALLOCATOR
 +M:	Minchan Kim <minchan@kernel.org>
 +M:	Sergey Senozhatsky <senozhatsky@chromium.org>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 -F:	Documentation/mm/process_addrs.rst
 -F:	include/linux/mmap_lock.h
 -F:	include/trace/events/mmap_lock.h
 -F:	mm/mmap_lock.c
 +F:	Documentation/mm/zsmalloc.rst
 +F:	include/linux/zsmalloc.h
 +F:	mm/zpdesc.h
 +F:	mm/zsmalloc.c
 =20
 -MEMORY MAPPING - MADVISE (MEMORY ADVICE)
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -M:	Liam R. Howlett <liam@infradead.org>
 -M:	Lorenzo Stoakes <ljs@kernel.org>
 -M:	David Hildenbrand <david@kernel.org>
 -R:	Vlastimil Babka <vbabka@kernel.org>
 -R:	Jann Horn <jannh@google.com>
 +MEMORY MANAGEMENT - ZSWAP COMPRESSED SWAP CACHING
 +M:	Johannes Weiner <hannes@cmpxchg.org>
 +M:	Yosry Ahmed <yosry@kernel.org>
 +M:	Nhat Pham <nphamcs@gmail.com>
 +R:	Chengming Zhou <chengming.zhou@linux.dev>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 -F:	include/uapi/asm-generic/mman-common.h
 -F:	mm/madvise.c
 +F:	Documentation/admin-guide/mm/zswap.rst
 +F:	include/linux/zswap.h
 +F:	mm/zswap.c
 +F:	tools/testing/selftests/cgroup/test_zswap.c
 =20
  MEMORY TECHNOLOGY DEVICES (MTD)
  M:	Miquel Raynal <miquel.raynal@bootlin.com>
@@@ -18920,6 -18662,20 +18920,6 @@@ S:	Maintaine
  F:	drivers/phy/marvell/phy-mmp3-usb.c
  F:	drivers/phy/marvell/phy-pxa-usb.c
 =20
 -MMU GATHER AND TLB INVALIDATION
 -M:	Will Deacon <will@kernel.org>
 -M:	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -M:	Nick Piggin <npiggin@gmail.com>
 -M:	Peter Zijlstra <peterz@infradead.org>
 -L:	linux-arch@vger.kernel.org
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	arch/*/include/asm/tlb.h
 -F:	include/asm-generic/tlb.h
 -F:	include/trace/events/tlb.h
 -F:	mm/mmu_gather.c
 -
  MN88472 MEDIA DRIVER
  L:	linux-media@vger.kernel.org
  S:	Orphan
@@@ -20134,7 -19890,6 +20134,7 @@@ W:	http://www.paragon-software.com
  T:	git https://github.com/Paragon-Software-Group/linux-ntfs3.git
  F:	Documentation/filesystems/ntfs3.rst
  F:	fs/ntfs3/
 +F:	include/trace/events/ntfs3.h
 =20
  NTSYNC SYNCHRONIZATION PRIMITIVE DRIVER
  M:	Elizabeth Figura <zfigura@codeweavers.com>
@@@ -20406,15 -20161,6 +20406,15 @@@ L:	linux-wireless@vger.kernel.or
  S:	Maintained
  F:	drivers/net/wireless/nxp/
 =20
 +NXP P3H2X4X I3C-HUB DRIVER
 +M:	Vikash Bansal <vikash.bansal@nxp.com>
 +M:	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
 +M:	Lakshay Piplani <lakshay.piplani@nxp.com>
 +L:	linux-kernel@vger.kernel.org
 +L:	linux-i3c@lists.infradead.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
 +
  NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
  M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
  S:	Maintained
@@@ -21300,6 -21046,25 +21300,6 @@@ F:	Documentation/core-api/padata.rs
  F:	include/linux/padata.h
  F:	kernel/padata.c
 =20
 -PAGE CACHE
 -M:	Matthew Wilcox (Oracle) <willy@infradead.org>
 -M:	Jan Kara <jack@suse.cz>
 -L:	linux-fsdevel@vger.kernel.org
 -L:	linux-mm@kvack.org
 -S:	Supported
 -T:	git git://git.infradead.org/users/willy/pagecache.git
 -F:	Documentation/filesystems/locking.rst
 -F:	Documentation/filesystems/vfs.rst
 -F:	include/linux/pagemap.h
 -F:	include/linux/writeback.h
 -F:	include/trace/events/filemap.h
 -F:	include/trace/events/readahead.h
 -F:	include/trace/events/writeback.h
 -F:	mm/filemap.c
 -F:	mm/page-writeback.c
 -F:	mm/readahead.c
 -F:	mm/truncate.c
 -
  PAGE POOL
  M:	Jesper Dangaard Brouer <hawk@kernel.org>
  M:	Ilias Apalodimas <ilias.apalodimas@linaro.org>
@@@ -21310,6 -21075,15 +21310,6 @@@ F:	include/net/page_pool
  F:	include/trace/events/page_pool.h
  F:	net/core/page_pool.c
 =20
 -PAGE TABLE CHECK
 -M:	Pasha Tatashin <pasha.tatashin@soleen.com>
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	Documentation/mm/page_table_check.rst
 -F:	include/linux/page_table_check.h
 -F:	mm/page_table_check.c
 -
  PAGE STATE DEBUG SCRIPT
  M:	Ye Liu <liuye@kylinos.cn>
  S:	Maintained
@@@ -21988,6 -21762,19 +21988,6 @@@ S:	Maintaine
  F:	Documentation/networking/device_drivers/ethernet/pensando/ionic.rst
  F:	drivers/net/ethernet/pensando/
 =20
 -PER-CPU MEMORY ALLOCATOR
 -M:	Dennis Zhou <dennis@kernel.org>
 -M:	Tejun Heo <tj@kernel.org>
 -M:	Christoph Lameter <cl@gentwo.org>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git
 -F:	arch/*/include/asm/percpu.h
 -F:	include/linux/percpu*.h
 -F:	lib/percpu*.c
 -F:	mm/percpu*.c
 -F:	mm/percpu-internal.h
 -
  PER-TASK DELAY ACCOUNTING
  M:	Balbir Singh <bsingharora@gmail.com>
  M:	Yang Yang <yang.yang29@zte.com.cn>
@@@ -22038,7 -21825,7 +22038,7 @@@ F:	tools/lib/perf
  F:	tools/perf/
 =20
  PERFORMANCE EVENTS TOOLING ARM64
 -R:	John Garry <john.g.garry@oracle.com>
 +R:	John Garry <john.garry@linux.dev>
  R:	Will Deacon <will@kernel.org>
  R:	James Clark <james.clark@linaro.org>
  R:	Mike Leach <mike.leach@arm.com>
@@@ -22800,9 -22587,9 +22800,9 @@@ S:	Maintaine
  F:	drivers/power/reset/qemu-virt-ctrl.c
 =20
  QLOGIC QL41xxx FCOE DRIVER
 -M:	Saurav Kashyap <skashyap@marvell.com>
 -M:	Javed Hasan <jhasan@marvell.com>
 -M:	GR-QLogic-Storage-Upstream@marvell.com
 +M:	Nilesh Javali <njavali@marvell.com>
 +M:	Manish Rangankar <mrangankar@marvell.com>
 +M:	GR-ETH-Storage-Upstream@marvell.com
  L:	linux-scsi@vger.kernel.org
  S:	Supported
  F:	drivers/scsi/qedf/
@@@ -22810,7 -22597,7 +22810,7 @@@
  QLOGIC QL41xxx ISCSI DRIVER
  M:	Nilesh Javali <njavali@marvell.com>
  M:	Manish Rangankar <mrangankar@marvell.com>
 -M:	GR-QLogic-Storage-Upstream@marvell.com
 +M:	GR-ETH-Storage-Upstream@marvell.com
  L:	linux-scsi@vger.kernel.org
  S:	Supported
  F:	drivers/scsi/qedi/
@@@ -23015,7 -22802,6 +23015,7 @@@ F:	drivers/media/platform/qcom/camss
 =20
  QUALCOMM CLOCK DRIVERS
  M:	Bjorn Andersson <andersson@kernel.org>
 +R:	Abel Vesa <abelvesa@kernel.org>
  L:	linux-arm-msm@vger.kernel.org
  S:	Supported
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
@@@ -23254,13 -23040,6 +23254,13 @@@ F:	Documentation/devicetree/bindings/ne
  F:	Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
  F:	drivers/net/ethernet/qualcomm/ppe/
 =20
 +QUALCOMM QMI (REMOTEPROC THERMAL MITIGATION) TMD
 +M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
 +L:	linux-arm-msm@vger.kernel.org
 +L:	linux-pm@vger.kernel.org
 +S:	Maintained
 +F:	drivers/soc/qcom/qmi_tmd.c
 +
  QUALCOMM QSEECOM DRIVER
  M:	Maximilian Luz <luzmaximilian@gmail.com>
  L:	linux-arm-msm@vger.kernel.org
@@@ -24308,12 -24087,11 +24308,12 @@@ N:	spacemi
  K:	spacemit
 =20
  RISC-V TENSTORRENT SoC SUPPORT
 -M:	Drew Fustini <dfustini@oss.tenstorrent.com>
 +M:	Drew Fustini <fustini@kernel.org>
  M:	Joel Stanley <jms@oss.tenstorrent.com>
 +M:	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
  L:	linux-riscv@lists.infradead.org
  S:	Maintained
 -T:	git https://github.com/tenstorrent/linux.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git
  F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu=
=2Eyaml
  F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
  F:	arch/riscv/boot/dts/tenstorrent/
@@@ -25333,11 -25111,8 +25333,11 @@@ F:	include/uapi/scsi
  F:	include/ufs/
 =20
  SCSI TAPE DRIVER
 +M:	Laurence Oberman <loberman@redhat.com>
 +M:	John Meneghini <jmeneghi@redhat.com>
  L:	linux-scsi@vger.kernel.org
 -S:	Orphan
 +S:	Maintained
 +W:	https://github.com/johnmeneghini/tape_tests
  F:	Documentation/scsi/st.rst
  F:	drivers/scsi/st.*
  F:	drivers/scsi/st_*.h
@@@ -25696,6 -25471,21 +25696,6 @@@ T:	git git://linuxtv.org/media.gi
  F:	drivers/media/i2c/rj54n1cb0c.c
  F:	include/media/i2c/rj54n1cb0c.h
 =20
 -SHRINKER
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -M:	Dave Chinner <david@fromorbit.com>
 -R:	Qi Zheng <qi.zheng@linux.dev>
 -R:	Roman Gushchin <roman.gushchin@linux.dev>
 -R:	Muchun Song <muchun.song@linux.dev>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	Documentation/admin-guide/mm/shrinker_debugfs.rst
 -F:	include/linux/list_lru.h
 -F:	include/linux/shrinker.h
 -F:	mm/list_lru.c
 -F:	mm/shrinker.c
 -F:	mm/shrinker_debug.c
 -
  SH_VOU V4L2 OUTPUT DRIVER
  L:	linux-media@vger.kernel.org
  S:	Orphan
@@@ -25916,6 -25706,34 +25916,6 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
  F:	drivers/nvmem/layouts/sl28vpd.c
 =20
 -SLAB ALLOCATOR
 -M:	Vlastimil Babka <vbabka@kernel.org>
 -M:	Harry Yoo <harry@kernel.org>
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -R:	Hao Li <hao.li@linux.dev>
 -R:	Christoph Lameter <cl@gentwo.org>
 -R:	David Rientjes <rientjes@google.com>
 -R:	Roman Gushchin <roman.gushchin@linux.dev>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git
 -F:	Documentation/admin-guide/mm/slab.rst
 -F:	Documentation/mm/slab.rst
 -F:	include/linux/mempool.h
 -F:	include/linux/slab.h
 -F:	lib/tests/slub_kunit.c
 -F:	mm/failslab.c
 -F:	mm/mempool.c
 -F:	mm/slab.h
 -F:	mm/slab_common.c
 -F:	mm/slub.c
 -F:	scripts/gdb/linux/slab.py
 -F:	tools/cgroup/memcg_slabinfo.py
 -F:	tools/include/linux/slab.h
 -F:	tools/lib/slab.c
 -F:	tools/mm/slabinfo-gnuplot.sh
 -F:	tools/mm/slabinfo.c
 -
  SLCAN CAN NETWORK DRIVER
  M:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
  L:	linux-can@vger.kernel.org
@@@ -27268,8 -27086,6 +27268,8 @@@ F:	drivers/net/ethernet/synopsys
  SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER
  L:	netdev@vger.kernel.org
  S:	Orphan
 +F:	Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
 +F:	drivers/net/pcs/pcs-xpcs-plat.c
  F:	drivers/net/pcs/pcs-xpcs.c
  F:	drivers/net/pcs/pcs-xpcs.h
  F:	include/linux/pcs/pcs-xpcs.h
@@@ -27764,7 -27580,7 +27764,7 @@@ TEXAS INSTRUMENTS DMA DRIVER
  M:	Vignesh Raghavendra <vigneshr@ti.com>
  L:	dmaengine@vger.kernel.org
  S:	Maintained
 -F:	Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
 +F:	Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml
  F:	Documentation/devicetree/bindings/dma/ti-edma.txt
  F:	Documentation/devicetree/bindings/dma/ti/
  F:	drivers/dma/ti/
@@@ -28333,6 -28149,17 +28333,6 @@@ S:	Maintaine
  F:	Documentation/hwmon/tmp513.rst
  F:	drivers/hwmon/tmp513.c
 =20
 -TMPFS (SHMEM FILESYSTEM)
 -M:	Hugh Dickins <hughd@google.com>
 -R:	Baolin Wang <baolin.wang@linux.alibaba.com>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	include/linux/memfd.h
 -F:	include/linux/shmem_fs.h
 -F:	mm/memfd.c
 -F:	mm/shmem.c
 -F:	mm/shmem_quota.c
 -
  TOMOYO SECURITY MODULE
  M:	Kentaro Takeda <takedakn@nttdata.co.jp>
  M:	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
@@@ -28641,7 -28468,6 +28641,7 @@@ F:	tools/testing/selftests/turbostat
 =20
  TUXEDO DRIVERS
  M:	Werner Sembach <wse@tuxedocomputers.com>
 +M:	Aaron Erhardt <aer@tuxedocomputers.com>
  L:	platform-driver-x86@vger.kernel.org
  S:	Supported
  F:	drivers/platform/x86/tuxedo/
@@@ -28825,8 -28651,6 +28825,8 @@@ F:	lib/union_find.
  UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER
  R:	Alim Akhtar <alim.akhtar@samsung.com>
  R:	Bart Van Assche <bvanassche@acm.org>
 +R:	Bean Huo <beanhuo@micron.com>
 +R:	Stanley Jhu <stanleyjhu@google.com>
  L:	linux-scsi@vger.kernel.org
  S:	Supported
  F:	Documentation/devicetree/bindings/ufs/
@@@ -28882,7 -28706,6 +28882,7 @@@ UNIWILL LAPTOP DRIVE
  M:	Armin Wolf <W_Armin@gmx.de>
  L:	platform-driver-x86@vger.kernel.org
  S:	Maintained
 +F:	Documentation/ABI/removed/sysfs-driver-uniwill-laptop
  F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
  F:	Documentation/admin-guide/laptops/uniwill-laptop.rst
  F:	Documentation/wmi/devices/uniwill-laptop.rst
@@@ -29948,13 -29771,18 +29948,6 @@@ F:	net/vmw_vsock
  F:	tools/testing/selftests/vsock/
  F:	tools/testing/vsock/
 =20
- VME SUBSYSTEM
- L:	linux-kernel@vger.kernel.org
- S:	Orphan
- T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
- F:	Documentation/driver-api/vme.rst
- F:	drivers/staging/vme_user/
 -VMALLOC
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -M:	Uladzislau Rezki <urezki@gmail.com>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 -F:	include/linux/vmalloc.h
 -F:	mm/vmalloc.c
 -F:	mm/vmalloc.h
 -F:	lib/test_vmalloc.c
--
  VMWARE BALLOON DRIVER
  M:	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
@@@ -30243,7 -30071,7 +30236,7 @@@ L:	platform-driver-x86@vger.kernel.or
  S:	Maintained
  F:	Documentation/ABI/stable/sysfs-platform-wmi-bmof
  F:	Documentation/wmi/devices/wmi-bmof.rst
 -F:	drivers/platform/x86/wmi-bmof.c
 +F:	drivers/platform/wmi/bmof.c
 =20
  WOLFSON MICROELECTRONICS DRIVERS
  L:	patches@opensource.cirrus.com
@@@ -30368,15 -30196,6 +30361,15 @@@ W:	https://x86-cpuid.or
  F:	arch/x86/include/asm/cpuid/leaf_types.h
  F:	tools/arch/x86/kcpuid/
 =20
 +X86 ENERGY PERF POLICY UTILITY
 +M:	Len Brown <lenb@kernel.org>
 +L:	linux-pm@vger.kernel.org
 +S:	Supported
 +Q:	https://patchwork.kernel.org/project/linux-pm/list/
 +B:	https://bugzilla.kernel.org
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git x86_e=
nergy_perf_policy
 +F:	tools/power/x86/x86_energy_perf_policy/
 +
  X86 ENTRY CODE
  M:	Andy Lutomirski <luto@kernel.org>
  L:	linux-kernel@vger.kernel.org
@@@ -30976,6 -30795,16 +30969,6 @@@ M:	"Maciej W. Rozycki" <macro@orcam.me.
  S:	Maintained
  F:	drivers/tty/serial/zs.*
 =20
 -ZSMALLOC COMPRESSED SLAB MEMORY ALLOCATOR
 -M:	Minchan Kim <minchan@kernel.org>
 -M:	Sergey Senozhatsky <senozhatsky@chromium.org>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	Documentation/mm/zsmalloc.rst
 -F:	include/linux/zsmalloc.h
 -F:	mm/zpdesc.h
 -F:	mm/zsmalloc.c
 -
  ZSTD
  M:	Nick Terrell <terrelln@fb.com>
  M:	David Sterba <dsterba@suse.com>
@@@ -30989,6 -30818,18 +30982,6 @@@ F:	lib/zstd
  N:	zstd
  K:	zstd
 =20
 -ZSWAP COMPRESSED SWAP CACHING
 -M:	Johannes Weiner <hannes@cmpxchg.org>
 -M:	Yosry Ahmed <yosry@kernel.org>
 -M:	Nhat Pham <nphamcs@gmail.com>
 -R:	Chengming Zhou <chengming.zhou@linux.dev>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	Documentation/admin-guide/mm/zswap.rst
 -F:	include/linux/zswap.h
 -F:	mm/zswap.c
 -F:	tools/testing/selftests/cgroup/test_zswap.c
 -
  SENARYTECH AUDIO CODEC DRIVER
  M:	bo liu <bo.liu@senarytech.com>
  M:	qianghua.wang <qianghua.wang@senarytech.com>

--CTusaMK2yIR8PQ5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrom/wACgkQJNaLcl1U
h9AUtAf/f77jzqNwAtHMG7ltcXGwWMa7VzHgWWuLkiM73wdnin8ilQ/Hb2R4fRQz
JPBMRX++WX3PcpX+MutlBM674tfxm9HF23GZzVA9JirT+H1MA4rZ+EztZjtWY3NO
SuKQYzL7LEfXW9c5P14lRFEYrOiuMHHU40YbR14qCwnH3scGJcrnrQ7Y9daDFbo9
tm6M6a1VAD9MmGkSI+MSsNxYJRzTB+tJU2IPt1rXdwmTamEUocEQd5WnSrB4DlQH
SGs6n6uEVjWKzbRK5FBMfLFbdLkQbVIX8dqRXQiOqBnj1bN4RqNTMJq2/xyzueWT
UQUnDrrLPsl1N+c9KdpiNBGUCEKWNw==
=2YPN
-----END PGP SIGNATURE-----

--CTusaMK2yIR8PQ5i--
