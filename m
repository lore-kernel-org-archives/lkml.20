Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741730;
	b=ykWGlxcF8S6SWfbq9ocOAnF4WFw2sjUSEjaUwlJyXuw3YFaYKCXidfFT8sls2ZTcXn6D
	 UoAK6pKWHiK2I+JMB+NbzWtdbcGFvmXBM04ohoVlg+IhCtVbAz8n4K8ZD9W3pVagkYOCB
	 w1euOl1AroYezID70K5qpTQSOP/+csEPd2xpLZL5GmgfZictRBzat7Suq7RDhd4kq0lzD
	 5D3Ns5hmCTX1IuZqpo4NXag+su6kGfGsXPoefttsm+f++Ne68gMDSbi7Rfo/0fa/1bDcL
	 Fb/NFm2kZOOQsBkoHhukw2nZkpAAI+TlnNoFEfG/NlVWE8bg9owYWBjCegEJ6XFK3HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=00MVwHilTRsBhBbdEgHHR8aMOg2Z+5Tl+P6nDXwfFAM=;
	b=CmIiTLtkoVrHxNaUvT6j87LaRV+wJ00ZQSC4CfnsIBE9GDF+jfWiTPVmye0p0uVTj2UH
	 sXhHRHWUGBnbM40DTD7K6CfddkkLAfqzTL7XPpaI/C8ukmE9e9KYhooCT0vNw6NlgfvpO
	 6Jzas+gEeJDzolxtCvxsPaUNuLYXMi9FZP7Y21AtE3EaP+X4mh19wROe5MpQfvPoizRaO
	 oPYMqAGBO+O5GulUuZI2vqaSWMJVMh+P0Zg2o7n6qqcYZWNGNi2C6dlhDG1fs3YB63O/r
	 buoKunE8H4jHX6kSgUQxVZYY4MaJQKAhFI5rSMuQS//6Z2okxBCn3VATNVxgyFScEJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fwAHax5i;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00F7606A336
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C00F7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fwAHax5i
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-188406bb948so439165c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741729; x=1793346529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00MVwHilTRsBhBbdEgHHR8aMOg2Z+5Tl+P6nDXwfFAM=;
        b=fwAHax5iQGGUgoYbSzCa1ibvgzwxg6lBd3IJ52t06wOM24SN1CvJDwFWu+EEyKSu7h
         WyFRmZr97hdACv5Qknm/oneHxpqy3VnSkERpLLdUd64x827R+6K0oMf3cpyIu8Z8GGWq
         gD9W8nExco+z8csBk5xvvRytSqcOWRFen6UaN0Yp/+/z+iq4TiyUotR4c1/LgeIFloAz
         vVzzhE8ovxLWOXfke1lbUrfBt1alt5X/iopSxLHkC0Hy2anPTMoW7VMmMBZY8tyDRAzz
         7O9kcCXK5RLOaS/zZFM35wk8AOU+/A9KHHie8SlqhGov3/aV+3lMC5wiQXoIghCA55RX
         etAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741729; x=1793346529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=00MVwHilTRsBhBbdEgHHR8aMOg2Z+5Tl+P6nDXwfFAM=;
        b=MZ/4N+NE1fb0r2MfiBwXI04N2IcI0HsiFxBaOg2u5a3reGUWpxY34YhasxraiV6Pue
         vqXcQ4FbfLjR5EvzRE9err56F7e7WJqi8Md00Jq/Gajw2DlWXbWwrPEWFs1sU5wmLf+v
         mZUUz5cbrPM2BAMK6rrMuEus2gUvQgk+pqUwg8596dwtLqonyA02Al6vEBirRHQleIFL
         lDno8S0iE1ZRY8K8RuTkU1GVJClfTG27r1UA7QiyLNl2CQySz7JWKHaxZSygIweV8XUE
         YK/8Tuxswgo3NpM0Cg3Uk+6HlWhU/+XoU4CR4fMG8CfxKV6AK0xXgd7BtGfR9b6v/34Q
         E6Kg==
X-Forwarded-Encrypted: i=1; AKwUvBztDfvcFhSMyYLulirTL12MJGyPGV/mSJtKWCM+DD2ai/Re4xnCBgzZe8keKVVXjWFcwORJsfI9dNqCN1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBi8f72cypYNvBzN+8417UZheYUsMQJaHVXOQomqnhndlbcUby
	sFAqdkEOr6eJhXAIahXJUlwS1DcvRueeEpaNsUQQUAg+eiNvtCA0Rp23rsNS3BqrPGzRbcLOoak
	=
X-Gm-Gg: AYBFou0nNT8PoIQvh0WU1i4L09ChN9X3o83Ref9O9OxPm3N8Ct1uZmb1MVXK10mNzdX
	bwqWwWN251yzFv6QfO9yt+0Xl5qAisr6sHrQ1rdAOtANgZhSV2qLiXrF8XXH72fzJLjA7at87Gi
	rzT6qc5mkQ5HFCaU8F8VR3OfZgNj+ykRPP+dsfIM5cyFS/2HYwxb6W75Kc36DLdu6DDQefYqB4q
	OthKRV7lhryC/xZCdGqIZFg90kYv4fdwpnJMrqj0+nB1O8FrFy0caO3cJBnBtnDMK/1k0DNR4lV
	9v2zGywYrgBJoYtekuPTooY9LTDvFayJuS+WncJQuYkj92u3r9ca/WpEXT7E+lgW94aQq97gfzw
	OqMStbvvteAkyOXHlizbnbiwg5RYTeUEQvs8gZV+2TObse9OPvpTNGKFBITuLeSw7GIC7hs7fTG
	0TybyiHcVIDZ6N0ULu98TsY0jtSGPngk1ydoEM/LOCLPE0iDUXbJ4cU3diRetSXzLwbjvW7p8VY
	0PTbPfbECrdAudUEQZSoIspBruxKYtqnPCIigHDa7AI0wD9g8A5ubXaYoqtUocTNZ63
X-Received: by 2002:a05:701b:2059:10b0:16e:c820:b20d with SMTP id a92af1059eb24-195c02759b3mr2129883c88.5.1792741728538;
        Fri, 23 Oct 2026 00:48:48 -0700 (PDT)
Received: from Mac.lan ([45.112.71.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm8402854c88.19.2026.10.23.00.48.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 00:48:47 -0700 (PDT)
From: Kanishka Chakraborty <kanishka.developer@gmail.com>
To: kamal.wadhwa@oss.qualcomm.com,
	maulik.shah@oss.qualcomm.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] regulator: qcom-rpmh: Support RPMH address reads and use it for rpmh-regulators
Date: Fri, 23 Oct 2026 13:18:38 +0530
Message-ID: <20261023074838.29254-1-kanishka.developer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

with this series in v7.3, SM7150 (Snapdragon 732G, Xiaomi Redmi Note 10
Pro) no longer boots. SM7150 support is not upstream yet; I am running
v7.3 with the sm7150-mainline patches on top, but the problem looks
independent of that and may affect other SoCs with older RSCs.

Symptom: the boot stops around the time the RPMh regulators register.
The display (left on by the bootloader) goes grey at that point and the
initramfs never runs, while the kernel apparently keeps running (the
watchdog keeps being serviced). The v7.1-based sm7150-mainline tree
boots fine on the same device with the same DT.

What I checked:

- Reverting 09d99ff7fc3c ("regulator: qcom-rpmh: readback
  voltage/bypass/mode set during bootup") and its follow-up 216e8873bc80
  ("regulator: qcom-rpmh: Fix coding style issues") makes v7.3 boot.

- A log-only variant that still issues every rpmh_read() but throws the
  results away (vreg->mode, bypassed and voltage_selector restored to the
  pre-readback defaults) hangs exactly the same way. So issuing the reads
  is enough to break it, independent of what is done with the values.
  I couldn't capture the per-read log lines: the display dies at that
  point and the boot never gets far enough for USB or a log.

- The apps RSC here reports RSC_DRV_ID = 0x00010100, i.e. version 1.1.
  rpmh-rsc only describes the v2.7 and v3.0 register layouts and uses the
  v2.7 one for everything below 3.0, so on this RSC the read path writes
  CMD_MSGID without the write bit and later reads RESP_DATA at the v2.7
  offset. This SoC has two active-only TCSes.

I don't know whether read requests are supported on RSC v1.x at all, or
only need a different register layout there. Would it make sense to only
issue reads on RSCs known to support them, and let rpmh_read() return
-EOPNOTSUPP otherwise, so the regulator driver falls back to the old
behaviour?

I'm happy to test patches or collect more data on this device.

Thanks,
Kanishka
