Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250225;
	b=UO03zG1GvtSsage1rQLB5NKfhXUQiNJ9DkdaW3ZD6XIDGJYWQOKP3D/rJxwVVcFWpflH
	 tlD1LkA74XZOTdouVOrIpu82+oBIonTWPuAsjr1uEG15DuDuexPQaoT3M1TWYBNb0RS4f
	 loQtITUdWcJUYC4XouWsdxdQp0g01kSs6nW5tgHVeLXly5OkSloXb+Wpf7Ru+W6HQMzCp
	 kW8BYvPKcOa+yl3g2uK4/x1UrYPavgnuOVhvdxI+EHohWbdFAn7t4IOfCuDLAGCpxqa43
	 RtG1fvbicnHhc/4RTSsMzdk8hu/zbxocTsYZcCGOH3q7QFqbWDaA3pATUHqqmuj4mzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8/fxKRCZaCOeOulCmaTvLZ28A39abdCnwM8N6Db8ONk=;
	b=i0vYlzjZjmmUyDgqyqjVxo5KIXHIrEm3nrLkz2c8hFSOE70Ee84ykG7QNh6YFx9E60/Y
	 kxQyBj6WXGK/m3DcdDZuCdbt8yeZ65uiJQc83MPFBnZZCJbXXk6QtbmhUa1hZSdB4lXCx
	 HQtiazfQIBD9WubGyFI7ncSLbRTnovGf1hOI5HCqtSuJNgAW4e00BQKQtSU28sUCHBfOl
	 fBJ8I4bXxxHOcwGo9k9Qi1A1rWiN6qzSp4/DNv7tyvXxMx56t3h2Pjp+ZHvOQ8NYbP8BW
	 z8I00jXitkRo1VCuI63SjXTpluPyp6D4+5wfqo+VWRLWvZdzd5TPgQvKZ8reCTGPiOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvVXCUZ+;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C968B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C968B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvVXCUZ+
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1228770f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250223; x=1793855023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/fxKRCZaCOeOulCmaTvLZ28A39abdCnwM8N6Db8ONk=;
        b=PvVXCUZ+qRZ1JnX/sjIDzxzn7w71dzK3K+6Tbdx9ESaYuFm5k4phpsM2ZANzO+Q8ny
         +CVK+w4TiPt9kg3cv2RYfMO3sMPDRqyf5AwOHOGGUIKNcV160OanrReqqANsnfPzv18R
         6GjYFTT3VhjjjAynAHJjOym1nIku2x+Qr5mB+ZkrZOT6qSl3AG0fn6+kzTc+9uHsojhw
         KWrwfTVylPLdYVe1Nq/EDCoZNOeqjM2DTIOvd9pwEzMc7b/kp5WXTpee01Kr9tRGr1PQ
         UU4cpXbWGJXvIpXaMQT9iShKipc19kAFk09A+X1GJd34JwH2b2V6MzOyc3hLkIlk+Wn3
         30nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250223; x=1793855023;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/fxKRCZaCOeOulCmaTvLZ28A39abdCnwM8N6Db8ONk=;
        b=d3q7h3548Mf0FYHxzCknwOS7A6pSJQov+vz8e9jA2YiyStgnvXWq7Nt+Pn2F7nV5BW
         82HLDtOdQV0cBwunPPju6mVCvlCvAqTCuU3I8OIiP66EX/zEzTopYDPOOOWcETiqm3Qk
         iCBknMS9wMqOY3+T/By2QXs2Wow9L3t9gaKd6TOBjH6M3votL2wJXFSXZ+u8jpHwuuc0
         suepKQ7ff09d9g60iDA3JM2rl6RxEoRzY6DFSgGjo8cCL+7IkPEkh6urRqBZ3Zz4KWtg
         4/z8+bT8lYL4N4JzzVSsYLdlhi9WbrrKvitKOPc3pFMvXB4d8oehmdP+4pRsb7OOVpwt
         UzSA==
X-Forwarded-Encrypted: i=1; AKwUvByb5mKhRE2SNcUlmsIcsypAOKwvI4y8nG6smpHeLZeTuWAOIqYD5hnfkEtrngjomRpQtpBxYszRwlNYAXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2K3V+BXb9wBe0SYRkragqIO7RDn4Bzy3usMHZ0TKArW8CZav9
	QqaSTLH7rZQO7sqziUt6QE+7NuDjLfylAQw3AnVAaX4LK5ktt805UtVP
X-Gm-Gg: AYBFou3aQeEIkte0/A1BzslTuYqoGDBA3Ao6SMuZ5q4OTpC1WETtrrnOADqM4POEk9U
	xOWRDFCdgjkZEVTpazvo7xbItuP9zPv/Nt1xZeK0o2IbCwvBFlmlOoEzqv/1kNHlblMf/gBQmzQ
	wEUX0SUfho7FFkQr8jf2CQe3nmJ9hRcNgWJfmHRcohEj/8sk/xWzJl8E8W03i4VfDExGZnWWn+K
	NAPmgbClaphqlU7n9uD8+m1HO5hEu4bxFkaLrBTbZ8VlRMJAujVLxaxw9SpaXUvyBigm9xzIYKK
	j3b8vJSh4Lp88NhgIF0RB8+w5KajpJew7Y6fPqj3gyiZnessr3RwTCs2UGMq/SISzDUBf6W7hy5
	Qf9M3MCsJu4NmlILW9op9OuBLcXE0uIoKGDWI7T70W5F7IikNxR8KvCG4CHqXaY2TDvuuKDF2Uk
	bvBAaaoO0FD4N/ROe6hiIMZe2zFqugRowNRanC0vj/2n13zxeYWWAnkVdHQJGOsb70nINFt5e2s
	WDSnQc0nBwBfQxs2OrH+JR1vgSGPyeUluAQKiOnUzzFiMBAuF77XI3dbRkE8F9vHrETDGqlNw8Z
	bEsRCI9NCo30hJlHX+t5ewqdD2XPqKnGqwtDxw==
X-Received: by 2002:a05:6000:4382:b0:48d:ed96:e995 with SMTP id ffacd0b85a97d-48e662e7cbdmr2677377f8f.28.1793250223048;
        Wed, 28 Oct 2026 22:03:43 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm33774966f8f.28.2026.10.28.22.03.39
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 22:03:40 -0700 (PDT)
Date: Thu, 29 Oct 2026 06:03:35 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Kuangyi Chiang <ki.chiang65@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
Message-ID: <20261029060335.3ed1fbcf.michal.pecio@gmail.com>
In-Reply-To: <CAHN5xi1M+g3Sy8YkRKpZuU7EtTxiyi0ZD6y5TCcAZTrpxUpHNw@mail.gmail.com>
References: <20260914013033.3938-1-ki.chiang65@gmail.com>
	<20260914130907.749cd8e7.michal.pecio@gmail.com>
	<CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com>
	<0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com>
	<CAHN5xi0tN2iWGVfH18SASoP0HVvAaDY4Kgq2U6LCCznGg-1o9w@mail.gmail.com>
	<CAHN5xi1M+g3Sy8YkRKpZuU7EtTxiyi0ZD6y5TCcAZTrpxUpHNw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 10:25:17 +0800, Kuangyi Chiang wrote:
> We did some more testing.
> 
> We don't see this issue during device enumeration.
> 
> We also found that the timeout is not limited to UVC control
> transfers. In one failure case, the first timeout was observed in
> a UAC control transfer, followed by UVC control transfer timeouts:
> 
> [  961.127402] usb 2-3: 5:2: failed to get current value for ch 0 (-110)
> [  971.367443] uvcvideo 2-3:1.0: Failed to query (GET_DEF) UVC control
> 2 on unit 2: -110 (exp. 2).
> [  976.487473] uvcvideo 2-3:1.0: Failed to query (GET_DEF) UVC control
> 3 on unit 2: -110 (exp. 2).

But that's the same device and the same control pipe, right?

So it just failed and we don't know why or whether it was the host or
the device. And this is all during UVC/UAC probe, before any userspace
begins using the device? Or could userspace be involved?

The UVC driver has some aggressive PM; for every userspace ioctl, it
calls usb_autopm_get_interface(), submits an interrupt URB which almost
never completes and unlinks the URB before usb_autopm_put_interface().
Repeated periodic unlinks is a known problem case for many xHCI chips.

FYI, I found that 7c0c31c66a7f9 in v7.3 reduced occurrences of periodic
unlink failures on other junk HW like ASMedia and VIA. Some of those
failures, on ASMedia, resulted in control transfer breakage too.

Have you tried 7.3 yet?
Do you see any interrupt URBs there, using usbmon for example?

> So far, we have reproduced the issue with these xHCI hosts:
> 
> ASMedia ASM1142 (1b21:1242)
> Etron EJ168 (1b6f:7023)
> Etron EJ188 (1b6f:7052)
> Intel xHCI (8086:8d31)

I don't know that Intel chip, but the others are quite buggy.

Have you tried other HCs? Any successes?
IME, chips from NEC, Fresco, Renesas are more reliable.

> The camera works with the EHCI host we tested without any additional
> delay.

That's a little suspicious, it may still be an xHCI bug.

Regards,
Michal
