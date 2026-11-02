Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618340;
	b=MEbfyx2j6DcaAjCQA5Unvp/Gq+p7tcfnWfHFaGfEvQTYLsFDhoU6BVGyLG205FzojSdz
	 9dlfXCFmk7Hhzhg15x6tDXVhLyWnzzMNteBjYthaqRAzgOIf/w0+aC6fW0NN67VwkLH8i
	 0pihtXOobMUtqXTAI5aHU9z3rSzDHBmnBKVj/HO+NMr3ztNs7QFu2vrQaQrBKDFSgP0Ae
	 fy+Fd0qxV7t+9aXJSumcr/B4yBI8YSUWlWLKf1X7rgkCO2BUbZc/d9jMvy0H9XtUHMozv
	 WvMwgoN5psXcUyKgN6Sde7unlAVbH6VdxS/gYEbudS0FyoctI0zwGmPYnb3tqj6ga4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618340;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=vnJm24LtIoW64foUZ3HslKViWjmolC2clyIZxVS023k=;
	b=O9GjhW2SXeWQyepr+TW65sGh+97so9EtN0Tf0YpBFofZTt72Wjx4cWXL899ZO7dBsaT/
	 pUzdyUgbDfs9iJMUctnIi2tCzCvW3HpTqYXfGGaiHSnh4a0byVwgbVyrCLumlet0M41SV
	 dWWbx/KAhatXWo+jYkEWdJYvMBb6wQJaM0DWeRFFgIgGAoEuzz6i/Tr6Po/wO/DI6T7YU
	 8D0rwWaa3IGyyeC8Pxk3IL/97cSkl+8+yMoTTMwIDjQ0XkrOtYYfXUEnYPdZwnyMJ5x92
	 ZAqTArXgpcejGZPHE9UvJMEXTGI5HsigIXNncbRZ3vawsFL5lYlc6yzx/sEZU9TYnig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AG54iTMz;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pkd0aHQI;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5A9606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F5A9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AG54iTMz;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pkd0aHQI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793618339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vnJm24LtIoW64foUZ3HslKViWjmolC2clyIZxVS023k=;
	b=AG54iTMzrli7mySglnJjxfY8CrLK+UzxGkEqU/ssrSTgF93sn57YMEEhprHWoNfRBtoJ+y
	TxSw935MFMlGqggjlXmdm81kDdwZrs2p1/JzLlL6pI4cQMYLAxDpISGeaxaWLqGGZyx1Hz
	I23VY7sfSUvBzYHok1AlulFSrcNRQOU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-TWYcss4UN3y7OR-TkntoDQ-1; Mon, 02 Nov 2026 06:18:58 -0500
X-MC-Unique: TWYcss4UN3y7OR-TkntoDQ-1
X-Mimecast-MFC-AGG-ID: TWYcss4UN3y7OR-TkntoDQ_1793618337
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0c896d05so2496205f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793618337; x=1794223137; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnJm24LtIoW64foUZ3HslKViWjmolC2clyIZxVS023k=;
        b=pkd0aHQIB3PdbsD351BnbhHY8QgXPSK8Q9cQDgvNciOv2urG6TUmOFh3p4dwObr05e
         P2dzS0i9MKz7uRACXfQcnG8Sd+cYeclMN6XmIOpMAIix5v15cAwZeQFlB1QM4SL/XHWF
         F1M9nN7pabMI7nP8J9Tx+ehXJGC3vNmGU56xb7f3NAWJwjM8zDoUeMvxMMlcULpFIhAC
         1u+Lkv6mm2SHfNgQS2S9Hu7FQLCIG/m0DNpxX3Z/Q+5odgAbESBnyvXPvy5CulUJiLcL
         zJ3QBbiJF3iubPAsq5wOM82Cp51PoFFpx0gmQDqpLgStcZnizTEffiCvISHbSU2K7GLN
         66ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618337; x=1794223137;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vnJm24LtIoW64foUZ3HslKViWjmolC2clyIZxVS023k=;
        b=wadPdU2Ajz/Rr9/Gn54QaJVFnVwHGbSpV0fZYQ4BLJwScotl6tEZTulrE1F9+JX9hY
         xmwuHbRHCJCPa1EkI0KZrD+vEWYCaOZkQfvUiF3FxgiELxm3ScpewqZpqsIlEjcb3rDf
         RHdgDeARrqpwWcJyNsWgOxYWC82tA3FIXs9bzSUuNLx7AWekmweT6od9mnhFwWXil88o
         qQoBJX8Ym2X1gvWG4MynkHx+W2QRCtzrWBUTCXhU682XpdgkM9RC55z5XNHTWFaTsNtC
         AguejjZ8HkF4v2VFLiZZehv/PWua+89FlNBfSgU1sw+Z1Ch/2aWm6TUQVYDvgfypYS7N
         h7Rg==
X-Gm-Message-State: APuU4Z88B6zITnjzQzCjUGpajZfGwbV5JBq0TksLV/WGo0HKBv8r8xh8
	bEK0Y/5ZZAqJhBfk6SuFqTcfdE4F8erK7jFSB8FsGYVyXyEvBLaoD4WVili8Esv8KvAE/SCNYkz
	2TRWcTRh63kzAUCDRBkPj9tfTY1WSjp1kAzG9uTFXFy79eB/JFw8lZilJu3ohM+GxZQ==
X-Gm-Gg: AYBFou00onsCdvmIEgdLsyCOqIhpqvvf4zHn/UrBxjXV0jwi9rMjdwkSuQfNx4IMKmH
	SIGbPpsrNi1u53nwkgD19e9jToLArHX3SlTwF5UkbkbnOIY7Jk2ZecdPsv3eOGzXE02Ck7qJ4SB
	Zbvj87MzyQrBq03a7gO33UWeiBRhdY/Dx1JYZq4T514NndoaJ8DqCHGck6jOx95rYftTzULsEFJ
	FOEClMoUp8bPxlCrAXSaWhZFT21wLm9VIy2InQ58N9d8zxvpzuxTZ6Jkby+B8mx73p92vHd3NRn
	t4FFvb1zNL4v949PUtxecgo6Lj/E3N3NKgk1Sai0iP42cdVqe0MoLMzS0JT6BS4XU7kJ8NB6TES
	OyrrjvaxxMOjh3HaaJ5j88B5HwPB2mO4LgYohK55Me0gb4jE1yq1Y4yMuyjJrlvmoVPoWlfWV96
	YQrNYz98lTTylu+ogdfTo1ZzTLWOidVzXpRsTF8Xg=
X-Received: by 2002:a05:6000:40c7:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48e6e5016f1mr22957262f8f.25.1793618336581;
        Mon, 02 Nov 2026 03:18:56 -0800 (PST)
X-Received: by 2002:a05:6000:40c7:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48e6e5016f1mr22957205f8f.25.1793618335982;
        Mon, 02 Nov 2026 03:18:55 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c0b6sm18790562f8f.41.2026.11.02.03.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:18:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Dave
 Airlie <airlied@redhat.com>, Peter Robinson <pbrobinson@gmail.com>, Hans
 de Goede <johannes.goede@oss.qualcomm.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Luis Chamberlain <mcgrof@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Russ Weight
 <russ.weight@linux.dev>, driver-core@lists.linux.dev, clabbe@baylibre.com
Subject: Re: [PATCH] firmware_loader: Expose requested firmware names as
 sysfs entries
In-Reply-To: <DMK7KD9A3LR1.25UWRP5SLKQDD@kernel.org>
References: <20261017142826.2668881-1-javierm@redhat.com>
 <DMK7KD9A3LR1.25UWRP5SLKQDD@kernel.org>
Date: Mon, 02 Nov 2026 12:18:53 +0100
Message-ID: <xlv1fqxjfplu.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

Hello Danilo,

Thanks a lot for your feedback.

> (Cc: Corentin)
>
> On Sat Oct 17, 2026 at 4:27 PM CEST, Javier Martinez Canillas wrote:
>> Most initramfs image creation tools (e.g., dracut or initramfs-tools) have
>> options to create initramfs images that are either generic or tailored to
>> a running system. For example, dracut has the --host-only option for this.
>>
>> That option allows to have a smaller initramfs image which only contains a
>> sub-set of the kernel modules, libraries, binaries and configuration data.
>>
>> One thing that can't be queried in a running system is the set of firmware
>> names that were requested by the kernel to support the different devices.
>>
>> Let's expose this information as sysfs entries to allow initramfs creation
>> tools to determine the set of firmware names that are needed by a system.
>>
>> On an AM625 BeaglePlay board, the following will be exposed through sysfs:
>>
>>   $ grep -H . /sys/class/firmware/requested*
>>   /sys/class/firmware/requested0:powervr/rogue_33.15.11.3_v1.fw
>>   /sys/class/firmware/requested1:ath3k-1.fw
>>   /sys/class/firmware/requested2:regulatory.db
>>   /sys/class/firmware/requested3:regulatory.db.p7s
>>   /sys/class/firmware/requested4:ti-connectivity/wl1271-nvs.bin
>>   /sys/class/firmware/requested5:ti-connectivity/wl18xx-conf.bin
>>   /sys/class/firmware/requested6:ti-connectivity/wl18xx-fw-4.bin
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> This was discussed before in [1]. I rejected it back then because userspace can
> already collect this information through existing interfaces.
>

Oh, I missed that patch from Corentin and I did search if anyone else proposed
something similar before...

> However, I can see how having a queryable history could simplify automated

Yeah, there is clearly a gap or otherwise we wouldn't need for example the
70devicetree-firmware [0] dracut's module to query "firmware-name" properties
from the Device Tree that was added by Hans, Dave's proposal to add FW group
MODULE_FIRMWARE_GROUP*() metadata to the Linux kernel modules' modinfo [1] or
the Fedora [2] effort to split the linux-firmware package in several RPMs.

> tooling like dracut. Has this been discussed with the dracut maintainers, and is
> there a concrete plan to use this interface?
>

I haven't discussed with the dracut developers yet. I thought it was too early,
given that I didn't know wether this approach would be acceptable or not. I do
have a dracut branch [3] though that I've used for testing purposes:

  $ lsinitrd /tmp/initramfs-hostonly.img | grep firmware | wc -l
  11

  $ lsinitrd /tmp/initramfs-nohostonly.img | grep firmware | wc -l
  61

> [1] https://lore.kernel.org/all/20260715131325.26099-1-clabbe@baylibre.com/
>

[0]: https://github.com/dracut-ng/dracut/blob/main/modules.d/70devicetree-firmware/module-setup.sh
[1]: https://lists.freedesktop.org/archives/dri-devel/2023-July/411884.html
[2]: https://fedoraproject.org/wiki/Changes/Linux_Firmware_Minimization
[3]: https://github.com/martinezjavier/dracut/tree/hostonly-firmware-support

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

