Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792587396;
	b=e16NGSHVlcFOKuFeLA3jLPlrC3nBJmBHZXSDJ/F7Ssg9tq8PIbTozSosOdb7nSrdr/EM
	 zo1VZhwGri5NCzNHAO7V2ls5olDrCcp4kUPohGKo9Pl2o7zId8vjI05CiLAqllZZtzwFz
	 FRyn3++9cVgzqVmQu5sJW0PfITXU6FKCfGal6HrUa4uv0X/TQ9KyvXR6b56JfgoaEI/3i
	 7vmLrxB3kfa5p9b+WjNY13F9ZtyykcHh4w71pWn8lbK/Zul+COO0KHGD+zpBgN/p0AcwO
	 knO3AieTkAlgDm2Y8wnwLOf4ajfbHUlXoBYb2guhayjgAMgTx3t6Pey8BfdEoCDYIjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qi1H/TWXxLLxbGzzn39MIG1qXo5ZarlUhDNNloP8fkw=;
	b=2zrYUcdMk2nssEti0yE59or5+zkm4JObFUnXF7Wh9jeJn6vwe7oQZP8pUgF6YEp26qCN
	 VTLI1N8K+iGuSrgIHECchryBO2ov48qmrB/g+1pNzus5XjXrehFobkwXusrKWovTRtX48
	 cdnxnxoPPDFplRrhJ+Av0kFNbU/SAyzbfusVxoS4kK/kUVp8kmBJVCVBoS/8D0Ys+VtX6
	 d2+RKe6mr92AKMGouMi45l2spNNbUH12C6p0foE4GpDQJhXmkoWBT4dot2E1QroVhOa7B
	 HdbcIqcoVIpw/2/Tnfahhn0ZootgFDOWVZg4AZyPMN5XGSDGh7wTY3wbz++fE/oqMfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eaWpfOtj;
	arc=fail smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C11606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96C11606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eaWpfOtj
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35b2c599f43so1491942eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792587395; cv=none;
        d=google.com; s=arc-20260327;
        b=QurIafsJZR0hqXHRMZINobte9KN88RJUUsDj+tMzqGxY7+O7fwOwvpPo9tbixVVuPb
         xeiTgV53O2pNglwcutrhD8bACI/uG2HGw67LJ05Mo8nuh8igkSqa+ELzsj7Zgo4/CHTU
         EsYLBmqVv0o9+BY+JtPu++/ErZ9SHT5MKexPiUGDbxHpbI4tytdVbIUGpgy2JMl1v4Y+
         EvaZVU5BmP26QuGtYqro58nlZp0cfPdoAOJm16L9EY47KS6smQf2NiqBc2wH4JPewOJc
         /BdB5h7FrmL8A+XtrAPAIZsi0I2HN7RxYXHev8fezBYycDHcwvatEBbQS56Lnn1mus4p
         GXLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qi1H/TWXxLLxbGzzn39MIG1qXo5ZarlUhDNNloP8fkw=;
        fh=PB2BfP1pzn4VP59FZZ+TNvsIdcdqYbCDS3FdWAun52U=;
        b=puKCq+CE1dLfsDoCoBj1CAQ0kHf7bulZrWlP+F8W7aBqEC30OtStpfmOn6L7K/xIg2
         FXZ3vgWbuohwRq6Vmwg/2ivaKDa7ijap+XNKrwOsSXVKj96xgaTeioP7YgnuHNal4yCX
         mbwqHcDMcyBwFXwj3wD/+hY08XhtTuwJWMQS8/ERAnLM4kvJ7WF4w5zqL9zmM5hhI/aS
         XJ5eQOR6nntYXdfPly09dSCNn7HND2agaWt4ywzRJ/NpT3yC43JalwEAMus5DR2nK+M5
         Q1BacQytoxMQi/8mZwGJbda2iuEu/RH29YIvLmQFr6ndZodUNwaRWkfrCtHgrDRg3EZc
         +uaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792587395; x=1793192195; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qi1H/TWXxLLxbGzzn39MIG1qXo5ZarlUhDNNloP8fkw=;
        b=eaWpfOtjLbTltFIYf/0HgsAaZYh4+RqTlDSj7tec+v7r59/ApehwoK1nURlUiXfZZI
         6SvUMBsUq/rYIJ2m4EYj6MpF0D1fd4QbbPIdCzTMB2srLqC/nLlzHhK00lWQmivmySbJ
         2Yb3ypiJ5ZMEkdeNof/W6HbNryu+jNzZTG4mWM55NSpjQhv4wtN5CyFbL4N9dwmf+7Zo
         bhTwsJwPdOwmCyT8NIOy+c/QJFqiHwkOBt+KczPiwoiQMZGJnBqjgZn3jSxc2Pv98IJs
         YkQyd+++KsorzGb0n0lCa3AplzuhYkXMK+wkdLmfACy4Wtj976iBqGlnhCg3MzVIelkZ
         QQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587395; x=1793192195;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qi1H/TWXxLLxbGzzn39MIG1qXo5ZarlUhDNNloP8fkw=;
        b=TLGfc9TBRhMLfeixrc++M3ZzKAQIvkx6YKCKulkCvMhH2cT2GuzcwPEqNCBMiWbxfl
         mYVkOIH63eDVWldhboTL7uipKom5mdO+vS8jmLnA2RS+YUg4IHr+Aazyr9+pP+2B6iAm
         r7oL7QX6W7v556JWSDejATj2AGNFa/TCwUUVWREV5MSpHS4+KmtGEvPYm5ha6/Xy/7z8
         +7epGJ43l/fIJYbs3HwzRukVSSHIRaxquF6l1+d5IdDzIi5X81jR4W09rxeHeH/bSRPj
         4xfsqZYGIxqlu2VU2TNjzn4xAmGITt5IrjsTVHiIhiy6EkWaiIW2q1SV15AvPxYXACX5
         2Jpw==
X-Forwarded-Encrypted: i=1; AKwUvBzNU/kKF33fdwgAOMZ/bHmE2B5iaZAY/V2yh8bbAfORPsBp/rN5vAoyoJPMSpilxBSyp+nkz8mg5rts2vE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaFGdPEbMQ9tmrJLDgwDyhUbK+yqpN+JJq5dJVSasCxdZVOQts
	Bz0OB6M/0HA3Igu+TGd6K8vi1Xw8dB5VVcHglm8ucrutTI+lh0MysA1LMg4moVyDsuSJxeKVFQm
	eeyw8TLQzKi3Zzh4UFUAJv1E5un9cE+I=
X-Gm-Gg: AYBFou25Jgyl2+sp8u/5lASAyJGCm/qjIu+liN5TbwXxh0xRYJHaHdF/tHdz9P/kwbS
	V79+JDtWyN0SRAmcXw61+aYz50nuzO3+0n9VtPgbSe8eDoji+hjb0CG2qdkSuzdZDhfQtBZLe3q
	2itp4qT/IccwaBQ/cogHCHN5+zCTiiwm81RwmXyO1oeGndmAwv7ip7dey5ein11/z81MgaOE5Rh
	pcHUlk+mdnAwPLqpJybNXYPKW7iAbtUHt7zm0VsfDEIkxidUu8FGR9hP7+ZMVRGO77kPr0Mg3RR
	VXZc7WVQ8hJuJDUAoEj9OF1YQ1JAP5jtUAaTDVoJd5dUSLqsQwIMzX1G8CtBOlYH8owxUtRhMtY
	UwG8Pn22f1tVYgS6VaAIoqHpAH1TLHXguO5jo1UtGOMSke8T1R5+DMKpelIWpLrYPwNSEaZCEen
	f3vj7G/SoizFQ6vP2W7hc=
X-Received: by 2002:a05:7022:698e:b0:18b:755:ae06 with SMTP id
 a92af1059eb24-190a7661e5bmr3619854c88.37.1792587394516; Wed, 21 Oct 2026
 05:56:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-sv105c-retry-set-interface-v1-1-ab2f08bc3fcb@gmail.com>
 <20261019111712.GP595565@killaraus.ideasonboard.com> <449eb143-37a8-4044-a071-63fe495c0213@kernel.org>
 <20261019112726.GR595565@killaraus.ideasonboard.com> <CAAquLuDc==WsbOYTfuKV2tspTSQAvB7kg2r2aqbE2rs3tYx2LA@mail.gmail.com>
 <d2d5e53a-ba8b-4b66-8e15-0c45e08e0f3f@kernel.org> <20261019123803.GA855235@killaraus.ideasonboard.com>
 <CAAquLuBW3MaBZgxQt_Kr7L2jGQf6mXarRtKi729-44DqwC=CnA@mail.gmail.com> <f4c591d0-304a-49d6-8892-d28124767a55@kernel.org>
In-Reply-To: <f4c591d0-304a-49d6-8892-d28124767a55@kernel.org>
From: Ostashow Constantine <ostashow@gmail.com>
Date: Wed, 21 Oct 2026 15:56:22 +0300
X-Gm-Features: AclHuK9yOMjxMFyx5SOlfInswV2iCdARQUgVp5qEBKbxa42As5kbuxjFSrB3VSM
Message-ID: <CAAquLuAepobWS5N7CzwO4po2g+=CmtqDPZ9D1VQQiWfJFi6S7Q@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add quirk to retry SET_INTERFACE for
 SVBONY SV105C
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans,

On 21-Oct-26 12:26, Hans de Goede wrote:
> I wonder if it helps if you insert a fsleep(3000) here on the RPi case?
>
> So that is sleep between the Configure Endpoint and the actual SET_INTERFACE
> ctrl urb being send out.

It doesn't help. usbcore is built into the Pi kernel, so I put the
delay in a small test module instead. It has a kprobe on
usb_control_msg() that does mdelay() only for SET_INTERFACE with
alt != 0 on this camera. In usb_set_interface() that call comes right
after usb_hcd_alloc_bandwidth(), so the delay lands between the
Configure Endpoint completion and the SETUP. It was busy-waiting,
not fsleep(), but the timing on the bus is the same.

xhci-hcd trace events with a 3 ms delay, 5 stream starts:

  Configure Endpoint queued
  +0.25 ms    Configure Endpoint completed, Success
  +3.1 ms     SET_INTERFACE alt 6 Setup Stage queued
  +0.9 ms     Transfer Event on the Status Stage TRB, followed by
              Reset Endpoint, Configure Endpoint (Drop), Configure
              Endpoint (Add)
  retry       again 3.1 ms after Configure Endpoint, Success

The first attempt failed in 4 of the 5 traced starts, and the fifth
completed after 260 ms. So with 3 ms between Configure Endpoint and
the SETUP, the failure looks just as it does without the delay.

Without tracing, MJPEG 1920x1080, auto exposure, blocks of 10 starts
with the delay settings alternating:

  no delay      35/40 first attempts failed
  3 ms          32/40
  20 ms         29/30

Today the failure rate is much higher than in my earlier series, with
or without the delay. Every failed start recovered with the retry,
including the retries that also had the 3 ms delay in front of them.

> Can you try the camera on the RPi without involving the USB2 hub, or
> are all ports routed through the hub ?

All of them go through the hub. The VL805's USB 2.0 root hub has a
single port, and the VIA hub (2109:3431) is behind it. All four USB-A
ports are on that hub:

  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/1p, 480M
      |__ Port 001: Dev 002, Class=Hub, Driver=hub/4p, 480M
          |__ Port 004: Dev 003, Class=Video, Driver=uvcvideo, 480M

The only port not on that hub is the USB-C port, which is on the
BCM2711's DWC2 controller and not on xHCI at all. I can try it in host
mode if that would tell you something useful, but it wouldn't separate
the VL805 from its hub.

Regards,
Constantine
