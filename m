Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F80384CE9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076577; cv=none; b=iyh6LYAJb2xIlauBpRuk7ZOZxwdFhzlna928hF6N8TZ5Wh4AEQEXFVOdDi/88+iCQBjJjuMOFExnG7lm+yIE+WT9fgHIqTKhSTzfE4SPp59HxqXtYm0rMJ9QIap3rfHHxAcSis0wsa+1IiIADHV57DJeIsQZmLDP2aTAhUinAM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076577; c=relaxed/simple;
	bh=Gqvs8Zitp9rdySWTNS69UwjGy9zRzNMt8sbbkn5ao3M=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=ibO8SLCuoKZWD8wYyf2tOeJ/z7+gKpZtJQtF2GnF/A6Ke5GvSxGF66koNA2LRZAQfhGgcyy5j9i5tiDiU3+oZ4MvR3jhM+8RhDboQ2iIXkoa5+9dZIjryT1P4US7XONXMPeZDsf3agl8uPD9OHL/HA5zIc8c5euK+wtZ4q/XBGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+KDSLYl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+KDSLYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207F21F000FF;
	Tue, 22 Sep 2026 11:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790076569;
	bh=8e4F7Ymdp+LqtyK+mxtu8SfeMd8OaNaf4nNVpx0vfF0=;
	h=Date:From:To:cc:Subject;
	b=G+KDSLYlvbyKSjlpQ2f2fSarHr2DiTZPMRFBak1zdDT2F1eEFs4LKN2ZFeyeL+FRK
	 I1rYTxRTs4Zmc0zErshJUKQD477VSS194shu0SBMyB1a7+9+B/hh6EDPhYeRey7gz8
	 AqCh6kCKBF/RaLF6HrGeEsxR0ryg1ouHf4GPSlD3kpVcVyhHs6GOeagn642GiRkENt
	 EZFTg6RXDSzc09+ZgJKvcN1o8DlzLlUt+5+rGUbYa1lkSYMJqilI9eNtcQmZN5eVJ4
	 dHm6s4p6utyr16Y+MLZYT9EMX07WLuZwjeR3ATsBVyGK8iuuLXofAtgZspjgfJ7uXk
	 p+wMxTQoRl85g==
Date: Tue, 22 Sep 2026 13:29:26 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Subject: [GIT PULL] HID fixes for 7.3
Message-ID: <0s2359n9-n77s-1nr5-4sss-r4900p89o5sn@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

Linus,

please pull from

  git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-li=
nus-2026092202

to receive 7.3 fixes queue for HID subsystem, namely:

=3D=3D=3D=3D=3D
- new device IDs/quirks (Logitech G502X, Elecom M-XT4DRBK, Steelseries=20
  Arctis 7, Asus Rog Z13 Folio, Lenovo Yoga Slim Gen 11)
- fixes for various code issues found by LLMs=20
=3D=3D=3D=3D=3D

Thanks.

----------------------------------------------------------------
Andres Diaz (1):
      HID: logitech-hidpp: Add support for G502 X Lightspeed USB mouse

Benjamin Tissoires (3):
      selftests/hid: add define for commonly used buf size
      HID: bpf: fix __hid_bpf_hw_check_params report length
      selftests/hid: add unnumbered variant to the hid_bpf tests

Berke Durak (1):
      HID: elecom: Add support for ELECOM M-XT4DRBK (018E)

Chen Changcheng (2):
      HID: alps: unregister DualPoint Stick input device on remove
      HID: alps: fix use-after-free on input2 registration failure

Dmitry Antipov (1):
      HID: roccat: fix locking in roccat_connect() and roccat_disconnect()

Erik H=E5kansson (1):
      HID: steelseries: Add support for Arctis 7 (2018)

Julia Lawall (1):
      HID: fix semantic patch and improve its performance

Junjie Cao (1):
      HID: quirks: add ALWAYS_POLL quirk for SDINNOVATION gaming keyboard

Lovekesh Solanki (1):
      HID: multitouch: Add report ID mismatch quirk for ASUS ROG Z13 Folio

Oleg Keri (1):
      HID: i2c-hid: add reset quirk for Lenovo Yoga Slim 7x Gen 11 keyboard

Oscar Priego Verdugo (1):
      HID: elecom: fix bus type for M-XGL20DLBK

Ren=E9 Onier (1):
      HID: winwing: fix use-after-free in force feedback teardown

Slawomir Stepien (1):
      HID: amd_sfh: Validate PCI BAR size before mapping

Stuart Hayhurst (1):
      HID: corsair-void: Fix firmware event packet description

Tristan Madani (1):
      HID: hid-oxp: use cancel_delayed_work_sync() in remove

Wei Jie LAW (1):
      HID: wacom: fix OOB read in wacom_wac_pen_serial_enforce()

Youth Cao (1):
      HID: i2c-hid: Add i2c-hid-quirk-bad-input-size quirk for 0911:5288 de=
vice

 drivers/hid/Kconfig                      |  3 +-
 drivers/hid/amd-sfh-hid/amd_sfh_common.h |  4 ++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 10 ++++
 drivers/hid/bpf/hid_bpf_dispatch.c       | 12 +++--
 drivers/hid/hid-alps.c                   | 25 ++++++++-
 drivers/hid/hid-corsair-void.c           | 15 +++---
 drivers/hid/hid-elecom.c                 |  6 ++-
 drivers/hid/hid-ids.h                    |  8 ++-
 drivers/hid/hid-logitech-hidpp.c         |  2 +
 drivers/hid/hid-multitouch.c             | 29 +++++++++-
 drivers/hid/hid-oxp.c                    |  6 +--
 drivers/hid/hid-quirks.c                 |  7 ++-
 drivers/hid/hid-roccat.c                 |  8 ++-
 drivers/hid/hid-steelseries-arctis.c     | 44 +++++++++++++++
 drivers/hid/hid-winwing.c                | 10 +++-
 drivers/hid/i2c-hid/i2c-hid-core.c       |  4 +-
 drivers/hid/wacom_sys.c                  |  5 +-
 scripts/coccinelle/hid/ff_race.cocci     | 11 ++--
 tools/testing/selftests/hid/hid_bpf.c    | 91 ++++++++++++++++++++++------=
----
 tools/testing/selftests/hid/hid_common.h | 25 ++++++++-
 tools/testing/selftests/hid/progs/hid.c  |  2 +-
 21 files changed, 259 insertions(+), 68 deletions(-)

--=20
Jiri Kosina
SUSE Labs

