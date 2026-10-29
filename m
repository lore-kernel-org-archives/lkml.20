Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284794;
	b=qw4fLDUdXKDry0PGhM7W3diz7FjRgF52lYH+JkLfXnc3wUWWdv0jh6qJd6knL8vz4jwx
	 HiTCXG/hwjAO5ZSwII999gkFPRmvWXARDX2dItDgUkoVQ6pSslahGa0+DBROq/+tYt+KF
	 LGiRl1JTbs97LHeX6dbzboaplAEeXyDx1i7oqmRONMeSWle3vGz8vOd953iz3mcxogn+m
	 eihrKpxBlQvwODlJsQT1ka0MnVmPxfNbO2Z7kbTuPp2tASDlEuSSEo4JWXD4caOAOPnoX
	 A5NHM3e4oJlpP2A758x4CZv0zPuraPu4uvIdpHuW/UKTbGpou5i0IeA4SCHSud1224Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
	b=0NPTYYi4ZPi77qm5TYrzfnoFnno8l4YcbW6gXi9uhGzXtr87YQ1XBbEfLw0bXvLSAuws
	 Z91KNoHH5mYTZ8jsOSJQD9lOwtVNH4E/3ZYfBOUnH5vbA7wDfonZgyC7v9O6bNk8QWI6p
	 nfl/KAoytkbDWyWmZdkuA0gCcTeDO5JFCWqG1JSxeOzfpAc4HwXYq2yCSKYymWbqpCmZ4
	 DPjhHubs3moIb9lOpJOnvXUyrYpBjqQxUMT2NonjhG5ciJCLfwoCrPv5NGdAo0juAH8y2
	 R2j8hwa2NOVsVqBWG3NyOhYrSpx3ZPxZXBb7Y8iv9Sqgi1bGMRdr804b6Jb+oAnAIlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPTlg3YK;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E4E606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E4E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPTlg3YK
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1846bc43c28so2543446c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284788; x=1793889588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=fPTlg3YKi8LCEYl7MWaRXbl+fOsMT8EooFaEX/qteZRl8FsZt88RyX9Nz4rh62atDU
         N2mi9nkHHOJC4qFeiUXhTHbjbhHQHXOF+NhhfCQK6iUf4J/Q9ypFok7z2wgCKAPn6EjK
         xZ9kY5ZnP4n+8lX6/VsHr77Tn99+eesUK7yOJOQntEtEMQGRE1D1vlqqCLeQI7lI9/6d
         T6b6GWLz4O6TATQ+xATuCOZzKNxV75JOEocPZj36+KoGY18UuoHpbDZjja7BkGHZcM0B
         8XE+KTQjlqXnRe4OF7u9IeoFkO5y9EWni2EDctTAKHudHO9Rp8OhbT05Vxxf/IOtY+cj
         QvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284788; x=1793889588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=164NcwrlQDCPLPBBP9BYS3dRuE/SlngYd5DDh3tJQAKhTfzdoc9yvY4sie1W1/Z2lK
         TCKq/HuqTdkxVSVmf6cABSSEJOYe0X778PFNaa/SCXYTJkZuBflSsAMSb44WS0EFPGMO
         hfaZLB+wgdVhcTEj5UJd/kerJoFc8F2nGlOYIuRQN3qtmwLcSV21GFZV30YpSUY0tqq+
         J4JYJxvMrXtFYyrazd2avbmOyXpaKrMutOCilWb7Pe9ZPgU6rG795jVahzflGg7q8JhA
         gg2UBDLQ1zuRFw8n8A/Lh6+Q/jE1Ck8ae2pFqR53+Z6JOGVcqGdvgmjJ68Xdnx9wMawP
         rOvA==
X-Forwarded-Encrypted: i=1; AKwUvByHmcJBowgfavYGE0U9NLjj3mOKmtaPHJSHalooRQzbzkAJwX2My3O5w9ZSmjLjDG3gLY9TMQwzKOIoLQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh+0OjEkAlslQsiuhYE/lbSVWMA/7saNh/wwVG87NBvygqrtyP
	YGKQU83keBJoJnxB53izRjHoowiVMuDM7FLygWlJ7akl7+6m8/ZkmKY=
X-Gm-Gg: AYBFou0BAc4NYLqqq6S9xOwClXWNV/yHCW6ERwnQzzQCcDBKg54M5ggKlMlfKwvbLqQ
	F7LbW6hNWy265vWpxvfvrX/yF/M8s4cs1JaacvNritv4etPNlCXgmUQJF4nBG89raiR6zvbt4pR
	D6HKJ5JnQ2hZQ2jYbi83aFXgEim+RJMkwl2go7Ew9HnGwDcav5zFMHAY8UsnmfimPaz4Dji5BWv
	J92cF9vo9i0sC73hjO7tbBOqwBydg5sbOx+jO0b7708guHABp8XUfQByMtErUYxP3Am5/NJPPB3
	ADgTf0nc7eLsFanzb02D3a7cIHD9DIRhNYQfTTw2lf00vIaoRAg6llvtB4BGbcA4Z1r4xdJAkdT
	gauvCsv3rZyB0HrF1VlaetrNR02knArkH/vxDhWmUeIlYlqcJ1V9hG+n6oE2FSs+t+NIKzXNHDV
	d9bXXDO4cDv7k2VUUdvoPxzBbrMiBlx34P3zbgpllflu7IFBdt16FQZ3gDwcwnxV3tM96GQS6xd
	fKgrjCCDQFI4exCSj0sdttSQHMwAKnduAkjn8VTsqk8HPsQKqBBtdawXCZhRE4sHTsqMlX1rGqv
	yXBM5VgYQgyja1EK+cf6Vj/ZVX9tpofY93gaiue0ewbtMjrSjkYOh0+xuxNXYOQmnvc=
X-Received: by 2002:a05:7022:ed07:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1a6ced8e7afmr7393000c88.29.1793284788293;
        Thu, 29 Oct 2026 07:39:48 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.115.216])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75cdd21c3sm15396439c88.4.2026.10.29.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:39:47 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: k@chaosmail.tech
Cc: alexandre.belloni@bootlin.com,
	andy@kernel.org,
	asahi@lists.linux.dev,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	brgl@kernel.org,
	dave.hansen@linux.intel.com,
	dlechner@baylibre.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	griffin@kroah.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	j@jannau.net,
	jarkko@kernel.org,
	jic23@kernel.org,
	jmorris@namei.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	mfd@lists.linux.dev,
	mingo@redhat.com,
	neal@gompa.dev,
	nuno.sa@analog.com,
	paul@paul-moore.com,
	pavel@kernel.org,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	sre@kernel.org,
	sven@kernel.org,
	tglx@kernel.org,
	wim@linux-watchdog.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: Re: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
Date: Thu, 29 Oct 2026 10:39:26 -0400
Message-ID: <20261029143926.1246-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
References: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
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

> This should either be dropped from the series, or be hidden behind a
> `melt_my_mac`-style module flag, or switched to a whitelist approach.
> We do not know what keys will be introduced in new smc firmware
> versions, and there are already keys that should not be randomly poked
> at.

1. The patch is required, atleast on intel macs, as without writing GPU and CPU
	states to smc, the system gives PROCHOT signal under small load
	, and heats up a lot.

2. the smc dosent expose keys of nature that can physically damage the system
	it only exposes power/volt data, and the most you can poke is reboot
	keys and gpu/cpu p-states.

3. If a person is randomly touching keys, Its their problem and not ours.

4. There are a lot of things that can mess the system way more and permanently
	than smc (undervolting for example), but they are not safe guarded, why
	should this be then?
