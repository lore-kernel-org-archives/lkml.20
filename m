Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677184;
	b=Go6AYTLeaoJ+PKr76Z1UmjZXlxM3Yir9HfHJsed7Gf4hRP3cSJ5No0WOkSZsXK7uSXYA
	 g8l/5trY6Z4Llgp1LOMXfkL2T4QUdFYjobgo4c3OQp3dpO0Z6jpCEW/8LENrDcXNQJZAR
	 +55T+o37SvzVSRdgyQFEwFOa1Pw5rydGbK3uruVAmVEChUqOGIbr06DsLktCqrpaBaxP+
	 EXC74EU32QzyplPQm+wQIQySEHGn6LchpUhYlWLlNDlrSbBFZUjvdrBS0X54jL+NkO2BT
	 rN59zTK1e80bn7+AmmOGAZ3Ye9VbZpm4KQ2lnxlkLFErl/6h6wB45DRtpK2n/xddUxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677184;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=2FM3uj61+Ni8BLhGtFb0V45ZpJiq8UU9qvJcGre1ZMI=;
	b=OJmofIiTmsnhg76WoFogn+EdmN39QF+WrtgDIU4TAlZ6W6dQZIxvsItvkaPE+AzCw3JL
	 nOJGBEUkpVDHxnI0RjGJjrjOvqXtmHUtwsfl5l5GB7HpEoyqZigx1tncle2Y5iLNnFYxk
	 aqrP1e9WP6xyjJLRrQrOo0+XrL/TcTXz1OyZPuV1bw4EEXkku4SC5MTXeZWoDnauyO6a5
	 xLwEB4myyfef2X72ct3tZOz5djy5DintCQZcVWCh0vhutWZI3zbFz1m9ZDqCn82ZIq6qj
	 A5eV4Yy/vUz1MzyPKIL28aU3pN7a0V5pftmRMgpo7NqvXy2E4ivaLL5AM8uzPw/Ladw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qsB6SGVW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBF0606A31A;
	Thu, 22 Oct 2026 13:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qsB6SGVW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0D11F000C2;
	Thu, 22 Oct 2026 13:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792677183;
	bh=2FM3uj61+Ni8BLhGtFb0V45ZpJiq8UU9qvJcGre1ZMI=;
	h=Date:From:To:Cc:Subject;
	b=qsB6SGVWgcaoOfEaZdVOnjNAK024h0LH+VW0bTpwb5qbyVT6zpMHkzY2w8x4YyxE1
	 V1qram1IEr1RNEGE+6ZQhoXG97esVwXmOPOtT9C1NCXsWeB1QjoFPPQ+MCbXflsk46
	 GTNUx7ZzI0xiytSaO4EIBDa0O41TejGD3vclzJJk=
Date: Thu, 22 Oct 2026 15:49:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver updates for 7.4-rc1
Message-ID: <atoUedBI3u813dYW@kroah.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.4-rc1

for you to fetch changes up to 4a177d5e688e8e82113f7a32d6f75f0bab9658c4:

  staging: rtl8723bs: remove unnecessary parentheses (2026-10-17 13:24:01 +0200)

----------------------------------------------------------------
Staging driver updates for 7.4-rc1

Here is the big set of staging driver updates for 7.4-rc1.

The huge majority of changes in here were to the rtl8723bs driver, which
ended up being deleted entirely through the wifi driver tree, so while
the work here was nice to have done to get experience by people, the
overall goal was achieved in that we have a solid working and sane
driver in the real part of the tree now.

Other than that, included in here are:
  - some greybus driver removal of broken drivers that no one ever used
  - minor coding style cleanups for other staging drivers

All of these have been in linux-next with no reported issues, other than
the merge conflict of the driver being removed, but that's an obvious
one to resolve :)

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Adriano Cordova (4):
      staging: rtl8723bs: remove dead beamforming code
      staging: rtl8723bs: remove unused chip-type enums and defines
      staging: rtl8723bs: remove unused AMPDU burst mode
      staging: rtl8723bs: remove unused field in false alarm statistics

Alexis Buttler (1):
      rtl8723bs: Remove redundant macro in basic_types.h

AmirHossein HajiMohammadi (1):
      staging: rtl8723bs: remove unused monitor interface name

Andrej Dusanic (1):
      staging: rtl8723bs: remove duplicate blank line in sdio_ops.h

Ashmit Kumar (1):
      staging: rtl8723bs: rtw_ap: remove unnecessary parentheses from return

Brian Norris (1):
      greybus: Discard pm_runtime_put_autosuspend() return value

Cen Zhang (Microsoft) (4):
      staging: rtl8723bs: hal: fix a multi-line comment in hal_btcoex.c
      staging: fbtft: update outdated struct fbtft_ops comment
      staging: nvec: fix GPIO descriptor documentation
      staging: octeon: fix misuse of kernel-doc comment

Dalvin-Ehinoma Noah Aiguobas (12):
      staging: rtl8723bs: renaming variable pbuf in rtw_mlme.c
      staging: rtl8723bs: renaming variable pmlmepriv in rtw_mlme.c
      staging: rtl8723bs: renaming variable pdev_network in rtw_mlme.c
      staging: rtl8723bs: renaming variable pibss in rtw_mlme.c
      staging: rtl8723bs: renaming variable padapter in rtw_mlme.c
      staging: rtl8723bs: renaming variable phtpriv in rtw_mlme.c
      staging: rtl8723bs: renaming variable pregistrypriv in rtw_mlme.c
      staging: rtl8723bs: renaming variable bHwLDPCSupport in rtw_mlme.c
      staging: rtl8723bs: renaming variable bHwSTBCSupport in rtw_mlme.c
      staging: rtl8723bs: renaming variable bHwSupportBeamformer in rtw_mlme.c
      staging: rtl8723bs: renaming variable bHwSupportBeamformee in rtw_mlme.c
      staging: rtl8723bs: Removing unnecessary whitespaces

Dhanush Muralidharan (1):
      staging: rtl8723bs: remove extern from function declarations in header files

Dipesh Chaudhary (1):
      staging: rtl8723bs: remove unused EF2Byte and EF4Byte definitions

Ethan Nelson-Moore (3):
      staging: greybus: remove empty TODO file
      staging: greybus: remove driver depending on nonexistent config option
      staging: greybus: remove camera driver marked as broken since 2016

Feiyu Wang (3):
      staging: rtl8723bs: fix logical continuation style
      staging: rtl8723bs: remove multiple blank lines
      staging: rtl8723bs: rename CamelCase variable wRxSeqInitialValue

Franco Hector Hugo Montenegro (1):
      Staging: rtl8723bs: fixed camel case coding style issue.

Gabriel Changamire (1):
      staging: sm750fb: fix kernel-doc comments in sm750_accel.h

Gabriel Windlin (1):
      staging: rtl8723bs: remove unused SSIZE_PTR definition

Gowtham S Bhushan (1):
      staging: rtl8723bs: rename dot118021x_UncstKey to dot118021x_uncst_key

Greg Kroah-Hartman (1):
      Merge 7.3-rc2 into staging-next

Hank Yang (2):
      staging: rtl8723bs: shorten long lines in update_network()
      staging: rtl8723bs: rename CamelCase variables in rtw_mlme.c

Hungyu Lin (9):
      staging: rtl8723bs: convert mgmt xmit coalesce to errno
      staging: rtl8723bs: propagate errno handling for mgmt xmit
      staging: rtl8723bs: make dump_mgntframe_and_wait() return void
      staging: rtl8723bs: simplify rtw_free_xmitframe()
      staging: rtl8723bs: make rtw_free_xmitbuf_ext() return void
      staging: rtl8723bs: make rtw_free_xmitbuf() return void
      staging: rtl8723bs: make xmitframe_swencrypt() return void
      staging: rtl8723bs: make rtl8723_dequeue_writeport() return bool
      staging: rtl8723bs: use errno in rtw_register_tx_alive()

Isaac Aneek Sarker (1):
      staging: rtl8723bs: rename CamelCase variables in function paramater

Ivy Lopez (2):
      staging: rtl8723bs: define EEPROM_DEFAULT_DIFF as -2 directly
      staging: rtl8723bs: use kfree_sensitive() for key material in rtw_set_key()

Iñaki Sobera Sotomayor (3):
      staging: rtl8723bs: remove unused NDIS association and auth defines
      staging: rtl8723bs: remove unused EEPROM definitions
      staging: rtl8723bs: remove unused PCI ASPM OSC definitions

Jennifer Guo (17):
      staging: rtl8723bs: remove commented-out code in HalPhyRf_8723B.c
      staging: rtl8723bs: remove commented-out code in HalPhyRf.c
      staging: rtl8723bs: remove commented-out code in hal/ header file
      staging: rtl8723bs: remove commented-out code in include/ files
      staging: rtl8723bs: remove commented out code in rtw_recv.c
      staging: rtl8723bs: remove commented out code in os_dep/ files
      staging: rtl8723bs: remove commented out code in hal/ files
      staging: rtl8723bs: remove commented out code in rtw_mlme_ext.c
      staging: rtl8723bs: remove commented out code in core/ files.
      staging: rtl8723bs: delete empty comment lines in core/ files
      staging: rtl8723bs: delete empty comment lines in hal_com_reg.h
      staging: rtl8723bs: delete empty comment lines in rtl8723b_*.h files
      staging: rtl8723bs: delete empty comment lines in header files
      staging: rtl8723bs: remove comment after function closing brace
      staging: rtl8723bs: cleanup comments in rtl8723b_rf6052.c
      staging: rtl8723bs: delete empty comment lines in hal/ header files
      staging: rtl8723bs: delete empty comment lines in source files

Jeremy Dean Clifton (2):
      staging: greybus: Remove unused function 'to_fw_mgmt_connection'
      staging: greybus: Remove unused header declaration to_fw_mgmt_connection

Johan Hovold (1):
      staging: greybus: uart: fix racy TIOCMIWAIT implementation

Jonggeun Park (1):
      staging: rtl8723bs: fix stale file name references in comments

JunHyeok Seo (1):
      staging: rtl8723bs: align AES function parameters with open parenthesis

Kirill Repin (1):
      staging: rtl8723bs: remove spaces before tabs in hal_com_reg.h

Leonardo Martins Martins (7):
      staging: rtl8723bs: replace N_BYTE_ALIGMENT() with PTR_ALIGN()
      staging: rtl8723bs: remove unused macro N_BYTE_ALIGMENT()
      staging: rtl8723bs: remove invariant parameters from issue_probereq_ex()
      staging: rtl8723bs: change issue_probereq return types to void
      staging: rtl8723bs: remove invariant parameters from _issue_probereq()
      staging: rtl8723bs: coalesce issue_probereq functions into a single one
      staging: rtl8723bs: rename PHY_ConvertTxPowerLimitToPowerIndex()

Luca Hernandez (1):
      staging: rtl8723bs: remove unused driver_stopped pointer from HAL

Lucas Costa (1):
      staging: sm750fb: free cmap on framebuffer release

Lucas Jeffrey (1):
      staging: axis-fifo: use size_t for write size calculations

Malathi A (2):
      staging: rtl8723bs: remove unused NDIS_802_11 typedefs
      staging: rtl8723bs: remove unusual 'NDIS_802_11_RATES_EX' type

Marinela Tatiana Selseth (3):
      staging: rtl8723bs: Eliminate dead enum hal_status abstraction
      staging: rtl8723bs: condense NDIS encryption status enum
      staging: rtl8723bs: remove dead antenna diversity infrastructure (FAT/SWAT)

Matheus Alves de Almeida (3):
      staging: rtl8723bs: use bool for rtw_endofpktfile
      staging: rtl8723bs: remove reduntant externs in rtw_xmit.h
      staging: rtl8723bs: return bool from check_pending_xmitbuf

Maxim Codita (1):
      staging: sm750fb/sm750.c: mark g_def_fbmode as const pointer

Miguel Garcia (1):
      staging: rtl8723bs: remove unused phal variable

Mirza Ishan Beg (1):
      staging: rtl8723bs: refactor traffic_stat access in collect_traffic_statistics

Mohammed Momin (1):
      staging: rtl8723bs: remove unnecessary braces

Mohammed Sohail (2):
      staging: rtl8723bs: remove comparisons to true/false in rtw_mlme_ext.c
      staging: rtl8723bs: remove extern from recv and sta_info prototypes

Muhammad Israr (1):
      staging: rtl8723bs: add braces on all arms of if/else in rtw_mlme_ext.c

Myeonghun Pak (1):
      staging: rtl8723bs: disable SDIO function on block size failure

Nawar Alsafadi (1):
      staging: most: video: Remove unnecessary blank line

Nikolay Kulikov (2):
      staging: rtl8723bs: remove unused 'pwrdown' from struct hal_com_data
      staging: rtl8723bs: remove static HalDetectPwrDownMode() function

Okhuomon Ajayi (1):
      staging: greybus: uart: fix argument alignment

Olivier Tanoh (1):
      staging: rtl8723bs: rename mBratesOS to avoid CamelCase

Orgad Shaneh (1):
      staging: octeon: schedule the TX cleanup tasklet every 1024th packet

Park Tae-sun (1):
      staging: greybus: gbphy: use sysfs_emit() instead of sprintf()

Pedro Amorim (1):
      staging: greybus: fix checkpatch alignment warnings in loopback.c

Philip Nielsen (1):
      staging: rtl8723bs: avoid CamelCase in rtw_efuse

Pranav Desai (6):
      staging: rtl8723bs: use explicit types for lengths in rtw_security.c
      staging: rtl8723bs: use bool for flags in rtw_security.c
      staging: rtl8723bs: use u8 for frame types in rtw_security.c
      staging: rtl8723bs: use explicit types for math variables and iterators
      staging: rtl8723bs: use u32 for payload_length in rtw_security.c
      staging: rtl8723bs: use u32 for length variables in rtw_BIP_verify()

Preetish Amballi (1):
      staging: fbtft: Fix wrong controller name in fb_bd663474

Rahul Rao (1):
      staging: rtl8723bs: align arguments with open parenthesis

Rareș-Mihai Vladu (1):
      staging: rtl8723bs: fix lines exceeding 100 columns in rtw_security.c

Riccardo Oliva (1):
      staging: vme_user: avoid iterator variable access outside list loop

Rishik Yechuri (3):
      staging: rtl8723bs: align function parameters in aes_decipher
      staging: rtl8723bs: remove unnecessary parentheses around prframe->u.hdr.list
      staging: rtl8723bs: remove unused BoardType field and its parser

Romeu Gomes (1):
      staging: rtl8723bs: remove unnecessary parentheses in ioctl_cfg80211.c

Shyam Sunder Reddy Padira (1):
      staging: rtl8723bs: Remove redundant else block

Siho Kim (1):
      staging: rtl8723bs: fix block comment style

Souag-Ahmed-El-fatih (1):
      staging: rtl8723bs: fix comparison to true in dequeue_xmitframes_to_sleeping_queue

Steven Sierra (1):
      staging: rtl8723bs: remove multiple blank lines in rtw_recv.h

Svyatoslav Nikolenko (2):
      staging: vme_user: Use str_enabled_disabled() helper
      staging: rtl8723bs: Remove manual ifname allocation

Tiago Panizio Gottardo (1):
      staging: rtl8723bs: use bool for PMKSA flags

Tianchu Chen (2):
      staging: rtl8723bs: fix protected RX frame validation in decrypt path
      staging: rtl8723bs: fix RX buffer OOB write from device-reported length

Timo Joannin (1):
      staging: rtl8723bs: rename phy_status_rpt_8192cd_t to rtl8723bs_phy_status_rpt.

Tomasz Unger (1):
      staging: sm750fb: fix typo in comment

Triet Hoang (1):
      staging: sm750: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Wang Yibo (4):
      staging: rtl8723bs: remove unused defines in HalBtcOutSrc.h
      staging: rtl8723bs: remove commented out code in hal/ files
      staging: rtl8723bs: remove unused defines in odm.h
      staging: most: fix typo in driver_usage.txt

Yalagada Pavan Kumar (3):
      staging: greybus: replace PTR_ERR() with %pe in error messages
      staging: greybus: Align function arguments
      staging: rtl8723bs: remove unnecessary parentheses

 CREDITS                                            |    4 +
 MAINTAINERS                                        |    7 -
 drivers/staging/axis-fifo/axis-fifo.c              |    6 +-
 drivers/staging/fbtft/fb_bd663474.c                |    4 +-
 drivers/staging/fbtft/fbtft.h                      |    3 +-
 drivers/staging/greybus/Kconfig                    |   19 -
 drivers/staging/greybus/Makefile                   |    8 -
 drivers/staging/greybus/TODO                       |    0
 drivers/staging/greybus/arche-apb-ctrl.c           |  490 -------
 drivers/staging/greybus/arche-platform.c           |  653 ----------
 drivers/staging/greybus/arche_platform.h           |   28 -
 drivers/staging/greybus/camera.c                   | 1367 --------------------
 drivers/staging/greybus/firmware.h                 |    1 -
 drivers/staging/greybus/fw-core.c                  |   23 +-
 drivers/staging/greybus/gb-camera.h                |  127 --
 drivers/staging/greybus/gbphy.c                    |    2 +-
 drivers/staging/greybus/loopback.c                 |    6 +-
 drivers/staging/greybus/power_supply.c             |    8 +-
 drivers/staging/greybus/spilib.c                   |    3 +-
 drivers/staging/greybus/uart.c                     |   34 +-
 .../staging/most/Documentation/driver_usage.txt    |    2 +-
 drivers/staging/most/video/video.c                 |    1 -
 drivers/staging/nvec/nvec.h                        |    2 +-
 drivers/staging/octeon/ethernet-tx.c               |    2 +-
 drivers/staging/octeon/octeon-ethernet.h           |    2 +-
 drivers/staging/rtl8723bs/core/rtw_ap.c            |   10 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c           |   50 +-
 drivers/staging/rtl8723bs/core/rtw_efuse.c         |  150 +--
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c     |   14 +-
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c     |   21 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c          | 1028 ++++++++-------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c      |  224 +---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c       |   16 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c          |  166 +--
 drivers/staging/rtl8723bs/core/rtw_security.c      |  167 ++-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c       |   36 +-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c     |   23 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c          |   79 +-
 drivers/staging/rtl8723bs/hal/Hal8723BReg.h        |   17 +-
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c    |   16 -
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h    |    2 -
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c    |    8 -
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h    |    2 -
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h       |   23 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf.c           |   11 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c     |   77 --
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h     |    6 +-
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c       |    6 -
 drivers/staging/rtl8723bs/hal/hal_btcoex.c         |   59 +-
 drivers/staging/rtl8723bs/hal/hal_com.c            |    6 +-
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c     |   10 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c           |   15 +-
 drivers/staging/rtl8723bs/hal/odm.c                |   72 +-
 drivers/staging/rtl8723bs/hal/odm.h                |  153 +--
 drivers/staging/rtl8723bs/hal/odm_DIG.c            |   16 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.h            |    1 -
 drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.h |    1 -
 drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c |    4 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c       |   26 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h       |   20 +-
 drivers/staging/rtl8723bs/hal/odm_precomp.h        |    1 -
 drivers/staging/rtl8723bs/hal/odm_types.h          |    5 -
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c       |    2 -
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c        |   14 -
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c  |   76 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c    |   36 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c    |   30 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c    |   13 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c     |   16 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c     |   31 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c       |   74 --
 drivers/staging/rtl8723bs/hal/sdio_ops.c           |   24 +-
 drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h   |    2 -
 drivers/staging/rtl8723bs/include/basic_types.h    |   15 +-
 drivers/staging/rtl8723bs/include/cmd_osdep.h      |    6 +-
 drivers/staging/rtl8723bs/include/drv_types.h      |    6 -
 drivers/staging/rtl8723bs/include/hal_com.h        |    7 +-
 drivers/staging/rtl8723bs/include/hal_com_h2c.h    |    2 -
 drivers/staging/rtl8723bs/include/hal_com_phycfg.h |    2 +-
 drivers/staging/rtl8723bs/include/hal_com_reg.h    |  148 +--
 drivers/staging/rtl8723bs/include/hal_data.h       |   25 -
 drivers/staging/rtl8723bs/include/hal_intf.h       |    4 +-
 drivers/staging/rtl8723bs/include/hal_pg.h         |    2 +-
 drivers/staging/rtl8723bs/include/hal_phy.h        |   19 +-
 drivers/staging/rtl8723bs/include/ieee80211.h      |   10 -
 drivers/staging/rtl8723bs/include/ioctl_cfg80211.h |    1 -
 drivers/staging/rtl8723bs/include/osdep_intf.h     |    1 -
 drivers/staging/rtl8723bs/include/osdep_service.h  |    4 +-
 .../rtl8723bs/include/osdep_service_linux.h        |    2 +-
 drivers/staging/rtl8723bs/include/rtl8723b_cmd.h   |    9 +-
 drivers/staging/rtl8723bs/include/rtl8723b_dm.h    |   10 +-
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h   |    6 +-
 drivers/staging/rtl8723bs/include/rtl8723b_spec.h  |   72 +-
 drivers/staging/rtl8723bs/include/rtl8723b_xmit.h  |   12 +-
 drivers/staging/rtl8723bs/include/rtw_ap.h         |    1 -
 drivers/staging/rtl8723bs/include/rtw_cmd.h        |  463 ++++---
 drivers/staging/rtl8723bs/include/rtw_eeprom.h     |   14 -
 drivers/staging/rtl8723bs/include/rtw_efuse.h      |    9 +-
 drivers/staging/rtl8723bs/include/rtw_ht.h         |    2 -
 drivers/staging/rtl8723bs/include/rtw_io.h         |   14 +-
 drivers/staging/rtl8723bs/include/rtw_ioctl_set.h  |    2 -
 drivers/staging/rtl8723bs/include/rtw_mlme.h       |   89 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h   |   46 +-
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h    |   26 +-
 drivers/staging/rtl8723bs/include/rtw_recv.h       |  107 +-
 drivers/staging/rtl8723bs/include/rtw_security.h   |    3 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h       |   62 +-
 drivers/staging/rtl8723bs/include/sdio_ops.h       |   23 +-
 drivers/staging/rtl8723bs/include/sta_info.h       |  108 +-
 drivers/staging/rtl8723bs/include/wlan_bssdef.h    |   42 +-
 drivers/staging/rtl8723bs/include/xmit_osdep.h     |   14 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c  |  213 ++-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c        |   63 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c       |    7 +-
 drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c  |    1 -
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c      |    3 +-
 drivers/staging/sm750fb/sm750.c                    |   22 +-
 drivers/staging/sm750fb/sm750_accel.h              |    4 +-
 drivers/staging/vme_user/vme.c                     |   24 +-
 drivers/staging/vme_user/vme_tsi148.c              |    3 +-
 include/linux/greybus/bundle.h                     |   12 +-
 121 files changed, 1597 insertions(+), 5804 deletions(-)
 delete mode 100644 drivers/staging/greybus/TODO
 delete mode 100644 drivers/staging/greybus/arche-apb-ctrl.c
 delete mode 100644 drivers/staging/greybus/arche-platform.c
 delete mode 100644 drivers/staging/greybus/arche_platform.h
 delete mode 100644 drivers/staging/greybus/camera.c
 delete mode 100644 drivers/staging/greybus/gb-camera.h
