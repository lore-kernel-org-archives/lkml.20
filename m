Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940253D8133
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598738; cv=none; b=RYYoBQkXrCAgEwT839RG8Z3H4/iXnkJTFblkcAFIkBI+U/m96df5lDnwYMLscrzBx+RgxNyfyllRGr97MdjWN9iZraaa5iGCxpyKZ+S/tCEEUb39gqHibsQuS0Io5QHgbl15LZjwSAxQOK98QWy2Q+BCePHBKbxDMVnTJbdySnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598738; c=relaxed/simple;
	bh=GM53c5bDaqujucxbxaxGpiG4wy3NyirQxLZiAGL0gAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SQ+9kOOYSeBNxJevcrR2TA4n0Gw3D84O1MXakJvmddbKE57KsQ3ZfLhha9a8lfN88KmLsZMQ5Lotcp+p8AyUE3eOnTsf8vQm4OMADEHa7ZYfPLgvgbVRGZb92SP+WJq0wJ6F8K9suJq+xWaAfluAJwR7xtU/qxx5/zXUwsaRERU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RswzZy0o; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RswzZy0o"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso20730805e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598733; x=1789203533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rRYnCyD6UDzDv4ELVSWA0Rp0mK6cDy5rp6eJ73k+jLw=;
        b=RswzZy0oYXVY06Qh7ikRBMPnAGnCIChvYEwaxHClBfuR8jic3igYCq3WcyKLEN4KLD
         5GZW+BeinyCKc1u7F/TpuhNaMDHByqM5il0YCc6tLS2v7r2o1V6C2l9ZXRGXW0BejqgY
         MBG6kpcNHEt/0NcHBQHXiesBuywGHw27RvLCA0PRo2WoQu8DD+GNeLeklP5e13XhDFBQ
         hUyj/voGbJYjtGhsnwi4oS14EpdAtfKjT94y1uIvgrEZ2D79xLL/IbEnaePc8Rj48s7Y
         i72gLRys8XP9NNkAGbMX0EzzMIEma9APICYap4D2Ras0/sv2gNHU6MGOC3zwgsXdq/7t
         c3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598733; x=1789203533;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rRYnCyD6UDzDv4ELVSWA0Rp0mK6cDy5rp6eJ73k+jLw=;
        b=HNCq9rq7oK/tdhSB9Z1F6FVMiV+0uX9AVwfdWHO+tPL2GroRiKmN0mwjntrbt+2z1l
         tZWZW+vznvZTsZ0avLDNSKcaPTyYXTceH4mjehxXjB5Tw5GCoYKR9gyu0c0SiNrWwVZc
         AdFkwTgztpZvTRM2UlR2vqH7Hui7TqjCyV4ry8ZAvGsbDcZdOBWgEocLhxBugg4+hRMN
         ZGYlf0rXC+JBdmZDY2dNVkmeI0orj22u6/FWi11hP3gNUKllRQ2ETM6DQWkXVBS43u/4
         09rxfoOC5FftwChpm/N6VgE3e85u02IR3r/XkmxXWAnicij0Z9QfSRWQRtVhgPNWLj+Z
         +gmw==
X-Forwarded-Encrypted: i=1; AKwUvBy2ng4DWQjhaQL/4Txwf2c3oDAkVBSWIqTOmmo4XtnDj5yPUTkqyC+4h1GfygSFb72M9/FvZM/hm3r9tHY=@vger.kernel.org
X-Gm-Message-State: AFuF++nPv6ynj7c+K7BAGI6+ddExmLCLdz3VHAnWoQFWeHitjS1TMjXw
	XhIL0ZQGSgGoHCJ+iiasK0KSKmMpCQT153JGnEgrmvUty6lDUvKbtrM=
X-Gm-Gg: AYBFou0NJGtLnhWuILX13GLPm3CGVQd/Ex8PIXgnF6C5dwxwPurXcHYzBATlPCd3gOM
	Hfg8HHS7prCJAXvoIJ0wQ8rrNB2iMnK5AC27T2uZA9HKkfEwZofmPDrQHbhoLIdKSpZ6Jq2ZZNU
	lWcDeluCY2os/L12qyzEcZBz3rWyI+GC842Gp9+QYL03JlbolOvVyFoyX/amXOVcvQljcbAQaNY
	MPoO4Yn57Ff7f0FykVvAg9ZaVYzh/Ubwyywi+Ch75TkWbtOkpIWlYdYYmWJoMSfSpSMrcGSkOUW
	kLnDpdA3BuXkk01apxuGySOTx3GNU2diSIFQ5+rAQ81osb3Z6EVMicMw2VXozo3X0dkk4dKRPqS
	B1qBDztH6BG9sTae8xfTN98qmMCbzyYFtAVdIZrlovmacQBcMGpwjV55OmFYzBRN1Cqf/d8p5Dg
	CLoIWR3Yc1fPst8p+9WqpDRjjSirEd7IvDnsqdw/koY7xI60Nk1Q/yweOm2FDwp6abY8iQBOD+D
	wq9sZRDtnJWBhpCXNj3pWnWltLcgw85sbLDQnsC/c/gDIKpqMm6cSO6rzluznvvNL7AcKzSYoJv
	3dx4Lw==
X-Received: by 2002:a05:600c:c4a7:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49cf823d0dcmr127115825e9.8.1788598732765;
        Sat, 05 Sep 2026 01:58:52 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm228306435e9.3.2026.09.05.01.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 01:58:52 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
	Oleksij Rempel <linux@rempel-privat.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] wifi: ath9k_htc: keep WMI commands off the 64-byte packet boundary
Date: Sat,  5 Sep 2026 11:58:05 +0300
Message-ID: <20260905085807.384488-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v2 [1] must not be applied. Its message said no caller fills the RMW
buffer; ar9271_hw_pa_cal() does, on every AR9271 reset. With the size
corrected the flush is a 192-byte command, three full 64-byte USB
packets. The firmware ends a command only on a short packet, so this
one is never delivered: the device stops answering WMI and stays dead
until power is removed. This happens on the first interface open,
with the linux-firmware 1.4.0 blob and with an open-firmware build.

Patch 1 fixes the size and caps MAX_RMW_CMD_NUMBER at 14, so the
buffer can never produce a 192-byte command. With the cap, 120
interface opens ran clean: 60 with this patch, 20 of them on the
linux-firmware blob and 20 on a second AR9271, and 60 with a bench
build of the same wire lengths. A 16-entry, 204-byte command is
delivered while the 15-entry, 192-byte one is not. Patch 2 refuses
any command whose length is a multiple of the endpoint's packet size.

With all 15 writes applied the PA calibration reads offset 30 on 40
of 40 opens, where the truncated command gave 32 on 78 of 80. A
firmware with fixed reassembly, given the full 15-entry command, gave
30 on 19 of 20. The on-air effect is not measured yet.

The firmware rule is usb_reg_out_patch() in open-ath9k-htc-firmware,
target_firmware/magpie_fw_dev/target/hif/usb_api_main_patch.c. A fix
for it exists and goes to the firmware project separately; it does
not reach devices already in the field, so the driver has to stay
clear anyway.

[1] https://lore.kernel.org/linux-wireless/20260904180849.775404-1-nerijus.bendziunas@gmail.com/

Based on ath-next, commit 1d8e73163ef9.

Nerijus Bendžiūnas (2):
  wifi: ath9k_htc: fix the byte count of a full RMW buffer flush
  wifi: ath9k_htc: refuse a command that fills whole USB packets

 drivers/net/wireless/ath/ath9k/hif_usb.c      | 7 +++++++
 drivers/net/wireless/ath/ath9k/htc_drv_init.c | 2 +-
 drivers/net/wireless/ath/ath9k/wmi.h          | 3 ++-
 3 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.55.0

