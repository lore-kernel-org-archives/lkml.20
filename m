Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC89A47CA87
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432256; cv=none; b=F8/tMw6xlJTZ5aVL/nf9cUPBTvmMaH35p2NxIo6FywCNmzx+AddRiEreGxz743EViGqIOZmAa2WBroszVhzxrv6pklpKan2UTNOY0ofOjmi5NgTu67klQYPhiBfRJVz++T82zVLg53+DbJErn/dvSmpL45f7UrvmYtXGRb3ypGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432256; c=relaxed/simple;
	bh=XTqKzmV7VxnasmpJxQyETqVUoujV7aOZTs0rm3GRHgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kcVtkRGxuH3B+pGeU2SZHUgHRN0iA0esIXl7/Yi8rVVqyAEqL0Pi1/XszbVZcXfnW2GlzGFS09E1XuMKicugUrVAVzfWGs68yeSIGOIFWr8AAjh+FXZ8DFAqpj1h+szuDhEYBvirF6CmWFT/AztqcZ9wMFV04r6fYCVMGDFL7rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvZwt5Em; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvZwt5Em"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so19683305e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790432248; x=1791037048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VmTGYpF8CzabQa09lpZc3NRMpwPBoSugzXL/c7Zqv4E=;
        b=fvZwt5Em4GkIogiWrJGGAhzL64neDuB72yz5llb2AkFvLPNAczIx9DmR4tvwAsjfhc
         9/1fEx5nqztf7AYargp+kO8zn3sPYDpdeYgDrcFKM6+2xbB58BYi7dJTd4OVXIwukhhR
         CFlokuqke0YpBOrrBJcTrklDIIClBACrfZoC+Dgyb5OtwJDHaSOD07PUgRkrlxWhn8C/
         65KLV09c8JZ3u2rKxru3OF5V90DvX4wxYsOkl8s6Lp+bA2PxJXJlKWl7fKcOyNO6/PGh
         g30RHt6IHXAlK/YMHMZgkqEYzsUFROzpX1qijhwu06oDwFwoiIBr/+TejcXjgFOfim6f
         woBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790432248; x=1791037048;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmTGYpF8CzabQa09lpZc3NRMpwPBoSugzXL/c7Zqv4E=;
        b=pOLmh35OJlFkImJyecfUvYIIfVNSMNnsVzyv4f70iX4mMGVvZtiCZnVOjINl5kFDZ7
         wzYfW783OCQ6fRRPJM1oNGBi+T0AmdrN5gHf80Y8k6LVcdPAZoXIp8iGGWo90X6IWd4A
         qbjh084sad5xFnNqO/HV3ThgDIElgVVpsT9j4nbcwe7dPEfpyb5BDMAtGaY9x8/Cx/Lj
         Fen1ILqbxpw6mJX9HAe6OhjPBnRIHXgH+P+IUDzBAPqokJBhaa3n8o5beEmPg6zjVUav
         +6PMcAuW3kv87pbEwJF3SDsxcdFlbufLsejAQFX8hQNYG6jBbATWN0J2bDtS9dtqoy4M
         QVgg==
X-Forwarded-Encrypted: i=1; AKwUvBw7omtRnUcdZOu5I66ny/QGw20TNkJLFEKLPo5x3dHxeaGVvp0F0vRuIJJZ7x+Go7Ex4xnVm9AmBV9TD0U=@vger.kernel.org
X-Gm-Message-State: AFuF++mAdnZtoHBvuR1dK7JZQYDc7FKWaCOzH1OO56ZGxFPngXz96xL9
	qhQ9UxDbGWxy6xlXAhgpc/IFWuKfpAFmUJ0nIaYJrugcMSxgEwErzQ+Oce+NUM52
X-Gm-Gg: AYBFou3r65F+1Ovh57fTHA1W5jievWreKtPmbei2EMI1LrCNCq4coMKp+jYrZ9nMPew
	wniK5PL7AT53/fN4P56wakui9v+jkSwiwqd8XJBr3Kwenk7BveUm1+9bYkVBPag81poNEGfEc6Q
	gU/K2pWXpyNHCJTjYZ6STwGM6kBmAx70avXJQt4MQb88jyDAVrbx7c4ZeEqO4xuFclg3AmfuDez
	bo9m2HaA3BwB3avMhPQPz8yey2/155cXQmJekCnzMyEx6O+BE4RdnJ/vL7d8kJPS9Si3/cSS9Fh
	voswnIc6CMnCbhBMtaau5DYf5POLEum8OPfBbP4Btfiu81huf4gp0GQY2MPUniba+FzpfUevEaH
	azalyk14PehJTh9a2X9zjp2ZtPsBdFwm32ma8p6EYEtckRug+ODDU2IOnFxbCiesAj5LxDKd6fi
	tYvIMLRSPqawjq5eUqei82eIIRRJJDdoqVJRX84zmyN4T1xCrutiQscpw6pv/QPnfFOao=
X-Received: by 2002:a05:600c:4745:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49fe66abd7fmr160275245e9.1.1790432247505;
        Sat, 26 Sep 2026 07:17:27 -0700 (PDT)
Received: from kali.local ([5.27.43.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84205esm14154940f8f.37.2026.09.26.07.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 07:17:26 -0700 (PDT)
From: =?UTF-8?q?Veysi=20=C3=96zg=C3=BCn?= <veysiiozgun@gmail.com>
To: Hilda Wu <hildawu@realtek.com>
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alex_lu@realsil.com.cn,
	jason_mao@realsil.com.cn,
	zoey_zhou@realsil.com.cn,
	max.chou@realtek.com,
	kidman@realtek.com
Subject: Re: [PATCH v8] Bluetooth: btrtl: Add firmware format v3 support
Date: Sat, 26 Sep 2026 17:16:53 +0300
Message-ID: <20260926141653.4994-1-veysiiozgun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923104521.1706251-1-hildawu@realtek.com>
References: <20260923104521.1706251-1-hildawu@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Hilda,

I tested v8 on a Lenovo LOQ 15ARP10E (83S0) with the RTL8852BU
controller (0bda:b853, hci_rev 0x000b, lmp_subver 0x8852, rom_version 3).
With the current linux-firmware this controller never comes up, as
reported in [1].

Setup:
- Kernel 7.1.5 (Kali). I applied v8 to drivers/bluetooth from that
  tree. The only conflict was in btusb.c (btusb_main.c upstream); I
  applied the btusb_recv_event_realtek() change there by hand. btrtl.c,
  btrtl.h, btrtl_enh.c and the Makefile applied as is.
- Firmware: rtl8852bd_mp_chip_new.dat from the Windows driver
  18.4032.0.3008, installed unchanged as rtl_bt/rtl8852bu_fw.bin.

Result:
  RTL: subsection (0000:00), chip id 20, cut 0x04, len 0000f070
  RTL: subsection (0000:01), chip id 20, cut 0x04, len 00000238
  RTL: subsection (0000:02), chip id 20, cut 0x04, len 00000b54
  RTL: firmware section payload total len: 0x0000fdfc
  RTL: Watchdog reset status 00
  RTL: fw version 0x3c91950e

The controller registers with mgmt with its real BD_ADDR. I tested:
- scanning (nearby BR/EDR and LE devices show up)
- pairing and connecting a headset (Galaxy Buds4 Pro), audio over
  A2DP (SBC)
- cold boot: the firmware loads from scratch and the headset reconnects
- suspend/resume (s2idle): the firmware is loaded again on resume and
  the headset reconnects
There are no btusb/btrtl errors in dmesg.

This also answers my mail in [1]: v8 already implements the 0xfc62
sequence I saw in the Windows USB capture, so please ignore my
question there.

Tested-by: Veysi Özgün <veysiiozgun@gmail.com>

[1] https://lore.kernel.org/linux-bluetooth/20260926135219.13925-1-veysiiozgun@gmail.com/

Thanks,
Veysi
