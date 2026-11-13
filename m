Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603240;
	b=S0+CWsTSg8QZ4Otltc9F6QBdG6FQ4gkRmnKUIOZq2LuksG3JFy2rB6HE7C0KwyGnM/Ga
	 PlEcceVMfvyahD48AF9Pmi6Zc9sIJFi02d5T8FMapYq0iSNDJ4+mKoVLoXwBU+oODe1YH
	 UUhcHuTid/kXk1F1wWoPjJRXUhC8qEuGIoPhopGG/F+ao0qwsAUwP2kvwL7pcyU4hYyEW
	 TQg2+VrpFi2dcpPVeWkB5NnwaTOkA8Y3ooTrrGlsdngX5YQigLjlvP5CoPhToipUHJ31g
	 OezMWVlKqKTw7AsPr74b2Ipeb46nKTxYZRqzSuziGVxhY3vJcYtyqlaC5lLVq6qCh2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=4O2iL3RsyxnZ9m4gGTzmFGBt6GQKNa857BfAv3d9rDM=;
	b=Css20jHr4t/5xvHM4suBqmdADGMvqRRPRpXsvlwrpXSZsGnz8PE7h0VyGtEhJnqT4wHE
	 1deYI93971oIta4FRN9IzPp1LdDmFc/kJldx+KumEvY4yiQstiRKsqqWDQVdou336giY6
	 wiXVDHdZkVI//xQwyzvVub+phraO6Yc2SwGIUeJlmGYmdyIazth9vmeVavwIxaZ73zNAs
	 c4TZoFAaeC6/WmeF5skGosy695ayINoqR/cdgNLwfe5ep0pNSXmBQZCZgwWFr6tfUvZqW
	 aSckN2cTnKnOVCxsyAiPGrD1TiT/PfMQqLyzARHuIrMIXsvkSTRPqduczEEdBX1yDWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxKUcFah;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A903B606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A903B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxKUcFah
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4918c2d727fso716769f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794603238; x=1795208038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4O2iL3RsyxnZ9m4gGTzmFGBt6GQKNa857BfAv3d9rDM=;
        b=vxKUcFah2dEJQJlVcolTIMkDEPayM416prYnDTnrH7qZ08MO5YuChzoPwsEuSiacH1
         fs5EIDUx35jOzPHdrZp6fYyozP3/YONkhrMV49J3e3xArKGBkfGwNNgGQX8SStI3ZGsc
         1fJLZgPHugoMNB/jIZV8gvlfcXgVUa5xz6xkT0HFSQIY2bIpBQvGEyXg/v41FUW/haIO
         12PITto3/lIkbeBoCBM+CBPOmsP6PbFleVv8H51mEfSxrdwPD6qPAsxdr+QKxS9RJ8qE
         p4l5rwKXnM9pfS1mpWMmdKyIziB2dVSW/CIX88ndyk/jvPczWks4Mfrg0+IVHdwURS+5
         BXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603238; x=1795208038;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4O2iL3RsyxnZ9m4gGTzmFGBt6GQKNa857BfAv3d9rDM=;
        b=jjAJ/e4iDTaJV2lLVvCHRznOGjoPe1sMD5nZsTwYzNyXC4tdTpjPBkVtYiJ0ihch1z
         6lREjJ23vUaBCIwg0zveFWR9VqMwkXHAUEOoF3vSk7awKpXQWtX+/vQdXxu/M2lHHkN7
         oh0nldPp0PBWsbPi5xQGJmYO4p7bYjbYN8DQr3EE4FlGXToiwv+ZwEflb7pe8M2lqkFd
         NBzrIzmh7aedxbQ977jYrSWtb88IS5Jg7v2BfNkyZ0SGfsFX90KEy9MOiSPW29U5I3pa
         dDgUMxp4jSuieM2iRZDwNobUq05hRdbeQtqBOhjbrgfNC/3Bg2r0J6Fblbk0DR9Kwcrf
         pajA==
X-Forwarded-Encrypted: i=1; AL+hErGgmREnJPKd5EdrOX3brIiAbUza08L/IHBerIbIXbfVmszbMYx3vPwixe0ewhuW2gyqCNRHcFVMaBvYHwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eZH5nJE176wtw0dGjAuQtCZz49ch/XLqWvmopKY9Ffw0xqrBs
	ogZD89agYT6vQF/1/SaYvHF6KqikgUX/+/ytAFjXiWpDgmSpwCWhafWmwLIvZOSQ
X-Gm-Gg: AYBFou2Y+5bLHiOwqHOiDl3B+fbdeJvNuOwwQvNUe7QL4uWbbQfJogoKuxwpbw62P9A
	uL078r9HLoZfQ6hf+dKc9Z4dHnWh5XGJ+Qprnzc0rXKg1Tm0wjpslWhCje5HPifuj9K1Nr19DP3
	yyWUtjWdRhm+WDOEzS8BwTxuKCR8WUD/lVn1K5LGaqRjyRIE3YN1wqcW7dG2iQcbCL5PIjtbzmH
	2MG7UBxNi9KgC5CVLt3T1vCNIoCKgQbiXit6bNMW1oKcoyq5aAQ6pxv/iR+5tl6o92hnFr0V7K/
	t4bpP91cVF8y4hyTcxMqKt4/VHLTfO24a+mgA7BCxhH7TdZiBOYHKGO5zYxgtqAkjfx9s3jwxIW
	gM7ktuDKeG6MZ6BsSvwmfwCg3OdRJIeGcs8f0Zu7ep5SEaVnEDw4EJlxzaxiHtg5DpceLVSv6xP
	51GLpu00UvPdSXg5G+koxlnuQNNkFfDZN9T5x+s2VVl2SVeczduP7oL7hf8s7JtrUhwtM/CIIJ9
	2X39dpSMbxm5d3jNYlCyLW59Bd65+5lPCp2b4z6VffVp3ivpNrxJzt1VIMsMi02YaLfR5ROgWZ0
	olH2T2oPkKesbdr2KTxTa4Q3cD04FIoRuqXFCWW+xlXuG18zLMlvWXSS2GLmVdtodYAV8QAI5mQ
	BtOJnmuzXDmDGAQ==
X-Received: by 2002:a05:6000:46c4:b0:494:bf39:21a5 with SMTP id ffacd0b85a97d-49c70ed910dmr5311677f8f.10.1794603237761;
        Fri, 13 Nov 2026 12:53:57 -0800 (PST)
Received: from ?IPV6:2001:1aeb:1005:d000:cce4:c8f7:ce4e:e9a0? ([2001:1aeb:1005:d000:cce4:c8f7:ce4e:e9a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm6789427f8f.41.2026.11.13.12.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:53:57 -0800 (PST)
Message-ID: <139f1f39-2e0b-4ca1-86bc-db9732f9d351@gmail.com>
Date: Fri, 13 Nov 2026 21:53:58 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: cs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miroslav Ondra <ondra@faster.cz>,
 hyblmatous@gmail.com
From: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
Subject: eeprom: at25: no module autoload for chip-specific compatibles
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I am facing an "issue" with the at25 driver. We have the driver
compiled as a module and load a device tree overlay with

     compatible = "fujitsu,mb85rs1mt", "atmel,at25";

as required by the at25.yaml binding. However, the module is not
auto-loaded. We have to either modprobe it manually or add a modprobe
alias.

As far as I understand, the SPI core only emits
MODALIAS=spi:<first compatible without vendor prefix>, so the uevent
carries spi:mb85rs1mt. The at25 module only provides spi:at25 and
spi:fm25, added in commit 9e2cd444909b ("eeprom: at25: Add SPI ID
table"), so nothing matches. Once the module is loaded, the device
binds fine through the "atmel,at25" compatible.

Is there a better solution? I thought of adding SPI IDs for the chips
listed in the binding (mb85rs1mt, mb85rs256, ...) to
at25_spi_ids, rather than only at25 and fm25, but I do not know if
that would be acceptable upstream.

Thank you,
Kryštof Černý

