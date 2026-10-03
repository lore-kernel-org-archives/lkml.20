Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F00B39B949
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062803; cv=none; b=STqUKVNThwobvowcXDpAw+0YXBCzwxacMtibR/ttFqSVDyPZ+FuOCBPw6M8q721AeOBmnfm974Li5S/wdk/siId1A013XPZ+98CXZFWFqe9Xr2JWwRUAu6qnS6vAXiKOiVOnaeTv7ZussBs17PcyUhL3juwiM2FQ7dYl7jV3K5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062803; c=relaxed/simple;
	bh=LzFiQl8bwVu64pib461xDglWtTiMKis3bISpk0GovKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xj3/TvGU2Zbc+WqkRQBPU0nR3gbCtICS7y7W9sFWDuXOr2b1kDY2yUtYY5HiKfsJ+VK/BeT80P9DVLDsvaVWaTr5CUyEXDm9vF92wAPdBKUK7LMCLHBZ7/aGkh6UrN6wWk5j9npBNQS9ws+V8Qtqz1nTAfJt0pZM5cenQ2yK8ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWCvYIjY; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWCvYIjY"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afe75f055so519387f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791062800; x=1791667600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFHjf2Q3g1zZUehYCe+WnP73DnInh4b61zkJGLZ1HT4=;
        b=jWCvYIjYbmD0JXV69YD4WOpRv6MLW6f4IMZ7InaVTNY76H43dyWB//wHfhZlehcG7j
         gzR6oXFhpWUIFYlJ/XIDEZtQC/4lI7BPx+QKhjw7Rk5sQ69JznQ00aRBMochayO3tClg
         HopGrqpZc7WtejXqIj3Qf8fAvMXgkdAglsXIML7F01JAze2hJT6j1+FNAgGu9Ez6ujTD
         bHuNEo1Rjx+KmBzqV4JHIQM5hxQd1ex45UNd1omWW9OHBgDUPej9PIGDfUNFBZUE7NyZ
         ceJH2KhGUBed1qQcJDLTSBk40R4HrMrC6MSNL/Fnt9ovfnIaB2WH5cNSA+YGYyEt555P
         qqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791062800; x=1791667600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFHjf2Q3g1zZUehYCe+WnP73DnInh4b61zkJGLZ1HT4=;
        b=Ip9PGekZ7iBf3m2WDsYTpqaKlNYbOQ4EMVCcKOzgl27qqEfs4J7ottwVeCbtIakQzB
         R3gvV4oJaVvis7s4VgtVMAKpjbCV8PmytpQwEGbdfMJ+7eHSavER7Q7OyyhCJFAoclu4
         BZwJCEvt422EruIYFJBwEMFlRvZWy421q7Lpgc4p7DITuEt/+yXJXEb+4ciuOFK9zOH5
         8aZ5CP682pvVEcx5QvEbL4R6qHKuuytNiqONWs/AW3Dtfey5v2X93CbVQ+Bx7Od7ovwI
         BD/qTmHKvQHukVEbG8nkeTFy+PC/P1mvnC0tPmdjq5ILCmi0ELKMDB4JTIz90I5/aUnU
         O48w==
X-Forwarded-Encrypted: i=1; AKwUvBz3W2y1YsOYetEPfUpNkah8MIUkyGHwf/Jz2a3QwPnCGE6Jp/w5WzHEl5lwMPcAkYZ31II6krGlZMCNoDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkXuPvgh1g211K2IG6o5ed/7M39RQqJskx0InO7S9SX733EsVc
	eEF6YpCqTAohloa30UHWAe/JJ+S6EpviL2z/pyn968p9069I2ow957hW
X-Gm-Gg: AYBFou1f/pYSe9vhFL4Mq3unYvCDkXOnZxRMXjxWztwe+DrS+e6+aYTtuFP7Rwd2FD1
	ogggm6ImLuzred06d2SE9muoeB9UITKfRWlgzQawvQwMI/E5rL+1Cj+mbFynJeCu951VHYYMEXa
	t7fAAp2VXC+8OkkW4U1xPj7B20g3j6r8eBGg9pAKG91hyugMTpHAFmW+XPiY2MXhA7pd9GxueuC
	ZN6zEWpHsa6UecKQ000OSEe2RoyVj2vdtgk8gv+jcxgh8mUOkng0ea6e4qBEdS2tQ3HRx5F0RQv
	sn8eU5M9J+Io49mMkD66quK/DP+eVRxhjXfXexJ3WeXHBF4m2lW0VsXVpzqh2ctRnwZU5YoEno/
	ybkQx/zs4i8GlNjyV/tpJsoSmTQGYBqpZja2x3cgWZrG/YNN7FvGgipsDif49U+eiINQkZvNcYI
	C8ceEIZrcVAb9gC1sYK7XtEl6hXsEXYqlKrAwz0/hfevESZiG8M2rTtxyWMB/BN6X2VJFT++YfO
	SGm1g==
X-Received: by 2002:a05:6000:2c01:b0:48c:a08:5858 with SMTP id ffacd0b85a97d-48c47fd0eb2mr6201736f8f.23.1791062800034;
        Sat, 03 Oct 2026 14:26:40 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07a9sm15698119f8f.12.2026.10.03.14.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 14:26:39 -0700 (PDT)
Message-ID: <7bfa286e-50f5-4da7-a8df-0f7e743780b3@gmail.com>
Date: Sun, 4 Oct 2026 00:26:38 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rtw-next v7 0/6] wifi: rtw88: add RTL8723B/RTL8723BS
 support
To: Luka Gejak <luka.gejak@linux.dev>, Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Straube <straube.linux@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>
References: <20261002073845.31486-1-luka.gejak@linux.dev>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <20261002073845.31486-1-luka.gejak@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/10/2026 10:38, Luka Gejak wrote:
> This is the second of two series adding support for the Realtek RTL8723B
> 802.11n chipset and its RTL8723BS SDIO variant to rtw88. The preparation
> series has landed in rtw-next, so this series carries the chip register
> definitions, the BB/RF/AGC tables, the chip driver, the SDIO bind and the
> build glue.
> 
> The first patch is the only shared-core change. It moves the CCK power
> detect setter out of rtw88xxa.c into phy.c as rtw_phy_cck_pd_set(), so this
> chip can use it without pulling in rtw88_88xxa. The six chip patches apply
> on top of it and can be read on their own.
> 
> The driver supports:
> 
>   - RTL8723B / RTL8723BS, SDIO only
>   - 2.4 GHz 802.11n, HT20 and HT40
>   - one spatial stream
>   - station mode
> 
> Only station mode has been validated. The common rtw88 core advertises AP
> and IBSS for all chips, so those modes are advertised for RTL8723BS as
> well, but neither has been tested. An out-of-tree tester has reported AP
> mode associating without DHCP completing. The five additional SDIO IDs are
> included for parity with the existing staging driver, and only the 0xb723
> device has been exercised.
> 
> The chip driver requests:
> 
>   rtw88/rtw8723b_fw.bin
> 
> This is the version 41 firmware extracted from the Realtek rtl8723bs
> vendor driver. It was submitted separately to linux-firmware with its
> extraction provenance and carries Ping-Ke Shih's Reviewed-by. There is no
> known native rtw88 RTL8723B firmware.
> 
> The implementation is based on the initial RTL8723B work by Michael
> Straube:
> 
>   https://github.com/mistraube/rtw88/tree/rtl8723bs
> 
> Michael's Co-developed-by and Signed-off-by tags are present on the three
> chip-code patches containing code derived from that work.
> 
> The known limitations are unchanged. Bluetooth coexistence depends on the
> BT firmware's status reports. During A2DP streaming those reports identify
> a connected link but do not expose the active profile, so the WiFi
> coexistence logic cannot make a correct traffic-aware decision. WiFi
> throughput can fall sharply while audio remains smooth. This is documented
> rather than guessed around in the WiFi driver. The intermittent RTL8723BS
> firmware failure to leave LPS also remains, and instrumentation shows a
> firmware stall rather than a polling timeout that a longer budget would
> fix.
> 
> Testing
> =======
> 
> The exact six-commit branch builds with W=1, with no new warnings, and
> links all rtw88 modules with real modpost. Sparse and smatch were run over
> the rtw88 directory. Sparse is clean. Smatch reports nothing in the 8723B
> files, and its only output is an existing container_of static assertion
> from include/net/neighbour.h while checking usb.c. checkpatch --strict is
> clean apart from the complex-macro report on TRANS_SEQ_END, which is an
> initializer macro that rtw8703b.c already defines in the same way, and the
> "does MAINTAINERS need updating" reminder on the file-adding patches, which
> the existing REALTEK WIRELESS DRIVER (rtw88) entry already answers with its
> F: line. git diff --check is clean and all six commits are GPG-signed.
> 
> Hardware validation covered module identity, boot, scan,
> authentication, association, WPA2 key negotiation and DHCP, TCP and UDP
> traffic in both directions, ten scans while connected, and twenty module
> reload and reassociate cycles. dmesg is clean, with no warnings, no errors
> and no TX-report, H2C or leave-LPS messages. The extended soak added six 30
> second TCP runs, UDP saturation in both access categories with no loss, a
> 2000 packet ping run with no loss, and three idle power save periods with a
> clean wake. The test machine provides only s2idle, so suspend and resume
> are not covered.
> 
> Changes in v7:
>   - dropped rtw8723b_sdio_restore_pad_ctrl() and its two remaining call
>     sites. The register it adjusted is only written by
>     rtw_mac_pre_system_cfg(), which returns before that write for 8051
>     chips, so nothing in the driver sets the bits the function cleared and
>     the hardware default already has them clear.
>   - rtw8723b_fill_txdesc_checksum() now uses fill_txdesc_checksum_common()
>     from tx.h. The now unused linux/unaligned.h include is dropped.
> 
> Luka Gejak (6):
>   wifi: rtw88: move the 88xxa CCK power detect setter to phy.c
>   wifi: rtw88: 8723b: add the RTL8723B register definitions
>   wifi: rtw88: 8723b: add the RTL8723B BB, RF and AGC tables
>   wifi: rtw88: 8723b: add the RTL8723B chip driver
>   wifi: rtw88: 8723bs: add the RTL8723BS SDIO bind
>   wifi: rtw88: 8723bs: enable building the RTL8723BS driver
> 
>  drivers/net/wireless/realtek/rtw88/Kconfig    |   18 +
>  drivers/net/wireless/realtek/rtw88/Makefile   |    6 +
>  drivers/net/wireless/realtek/rtw88/phy.c      |   39 +
>  drivers/net/wireless/realtek/rtw88/phy.h      |    1 +
>  drivers/net/wireless/realtek/rtw88/reg.h      |   34 +
>  drivers/net/wireless/realtek/rtw88/rtw8723b.c | 2550 +++++++++++++++++
>  drivers/net/wireless/realtek/rtw88/rtw8723b.h |   14 +
>  .../wireless/realtek/rtw88/rtw8723b_table.c   |  861 ++++++
>  .../wireless/realtek/rtw88/rtw8723b_table.h   |   17 +
>  .../net/wireless/realtek/rtw88/rtw8723bs.c    |   59 +
>  drivers/net/wireless/realtek/rtw88/rtw8812a.c |    2 +-
>  drivers/net/wireless/realtek/rtw88/rtw8821a.c |    2 +-
>  drivers/net/wireless/realtek/rtw88/rtw88xxa.c |   38 -
>  drivers/net/wireless/realtek/rtw88/rtw88xxa.h |    1 -
>  14 files changed, 3601 insertions(+), 41 deletions(-)
>  create mode 100644 drivers/net/wireless/realtek/rtw88/rtw8723b.c
>  create mode 100644 drivers/net/wireless/realtek/rtw88/rtw8723b.h
>  create mode 100644 drivers/net/wireless/realtek/rtw88/rtw8723b_table.c
>  create mode 100644 drivers/net/wireless/realtek/rtw88/rtw8723b_table.h
>  create mode 100644 drivers/net/wireless/realtek/rtw88/rtw8723bs.c
> 

Looks good to me.

Reviewed-by: Bitterblue Smith <rtl8821cerfe2@gmail.com>
