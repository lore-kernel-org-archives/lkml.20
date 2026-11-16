Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865130;
	b=lBySxWEFioIGcf0Ns3PjGA4wDR0cRI0oaOm7xpzTdfbDvbEiBQn56dJ39eF4T3JYkUK7
	 poy8zDIE0WupkEdPPOUNxvFjjw/AtmJ5v9orbeTW9/0t4wrHJph4GpyaAbDfHcdJ/G6k/
	 6kKKEBv4YFH03B9n/0TSxQ/UFCSbis6CljsbsWxEvcdVYgUeNLmdHbA/NyQ/izqRatSC/
	 QQvHXjuVrSYAu8NImbMzljqcBg7/4aLATNcx5SZB1f0Bzeve6R77ywjkEYzKzCfHIHUk6
	 CnbbChekuPuj/9GV1/heEVTr7eDCDfLvwRYOZvWQ8SCO5LHRGFVrRDodu1gn3/HdXBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:To:Cc:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=N/IRCZAR2uINU2Yz+quelX7uIQDJ1pWTDySOsZRw7Ps=;
	b=uxUt0zJCFCv/YZSSm3e/g/xMrP+i5JAdz4nCuLY4ZmVrlcjfj7SBKVtJn6uxBoyE6lkb
	 O4jsnygSivwMPmcspWdsFuqqO4mzOSohPwMCN/3555djMj4LTsLk1mxcWc5txbsbzifwF
	 w8fN85rU6vTt8vuU95Vyla7wvtYnnEBgsVDtd/Q8XQdxcU+n+2h9XS77EQRuTKJpCQfXe
	 l1OxrVV9zZvju1q0/WY8nGXc1IM598T9n/oF2u1IxQuUSrikjMOgik2Kg8Sw5OyKXjO/I
	 YnfIlqrldy/HNXuQIRjMwI6VKIZDUGYTnyr+iestPXAX36VUqolZayjVi+kbQL/1GLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tI8DQZF1;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236D6606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 236D6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tI8DQZF1
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0dba37a7fso37252277b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865128; x=1795469928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N/IRCZAR2uINU2Yz+quelX7uIQDJ1pWTDySOsZRw7Ps=;
        b=tI8DQZF1ueCSROoR1hS0wRY3UbfDhvHo6IbY5ani6kaucOW3vTxsx6DC6jqr5dWNvk
         Z+y+ZOEWCBdj3QsPRmYG2xWh9s1TOfDIQ65xYveQknHqaABiBzrW3q6w1O3aFx4rvZ4h
         +cU/wL6VnCTNUfZEbeR4LZCQK9SBiwopG9RmM2NJ4hwfsmYjhFvAOHNfoC5LJ0f7YE87
         h9aRQKhwLjVrsatU2452PoWvbI7iKB/T+/O7XppTumbF6NfbRdRm66rYxZ/zSEd7YwQB
         Xja30Cbn4zxleWKC6R8QIwJSyb14H1Ve2zp/jvZGnxQ1rR/sIDumbAhy5YglnjlDm9cX
         4lQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865128; x=1795469928;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/IRCZAR2uINU2Yz+quelX7uIQDJ1pWTDySOsZRw7Ps=;
        b=ajhk0WlVVCBahLZl9Uu3e3ZeJ7i2/jo7XfI1NtMxh3xmV/YzILGm+lJdg+Z1m6j54H
         XRNm4VtTbHoamHEysuLzi/ssKGEbmj9uP/SDZSOd+jyffhz80vk3J0ttGbEjoy8vLz6y
         tTV5o9zIbzdq6aEj2nK9rbeYQ+gDdhDQnhSgGZxeXEkSywNbMckBL7Wamq+ylhb6b9/9
         znlMtHm823eMb6G7PYQ7w0Ax4JzE1dKOzHZwxzch8aZuYj17BHZ7hCjJ4GfQ1dTR9Z6y
         GluU28fn0m+aG3wzmpoiTphtDUcl/ZmtFubmtLei2IJtmQXvLugheEMrUD6XYomzYrNK
         sjVg==
X-Gm-Message-State: APuU4Z8zX/hOt3cVSWt4TQ0tsFrTqon51U+dBELwP+lRvg9G1q8xbCot
	JltYPWg9qJB8Zd0aAbg2ushe9CugrM2712PSfnJmuH0a8F3XUpqu9D6P
X-Gm-Gg: AZFdTZf8811a8N44iFoBeJvR8EZlCF7XrrxshZbuarm7J4OwYjaROt6ogY4wGiv3IMz
	+V4Bjtrh5RveHB9/gXnr0CUcocM5RonMA02bTswgIxkTw18jtrzQKjla0sjRH2dQSGD19yTXLAb
	Ovswyfk6S0W9xs2ulCBmg/XrGILeavRCTfGm+zUAgtUOGhOJnKAfh9TpYGc1g7k1YBnQGwvXbqy
	i1e/iclzOeDroUmtY31cG2EyrLLs563oiZJXN+Uq6HUMBlYEjA91f/PY/Q9dZKdSfESN3i8Hqhs
	brQ7tku6a+4vEQOuv4N75ifcyrQWgk/zzalJbfOob5rVH3wwE3GV7iGzbocg/XK0NGba0x+fqVg
	3KwjpNv8yksHJzy0sZYaaI3n4Vpm0Rr0CAAfS3wjpsQyLjb2RzWKx1c7myI01c/4q6xzUYnBgBy
	iywXhm8GMys/tzIDi3YaUpxw971C3O7Q3A0KBXksHTscNAOn6o3EiUwU8rkcoqu4cGBYoxG97pR
	bSnxUvwTMKYmpDDWmr7gYgH9KMCB6KEnyMkChzoN2lTxP03k9bcv1H8JJCKMnmCyTvTOTOl6sR2
	D9RQkppNz10EKcrTbyhqzu1stgLe8PrXh62fdYKQMlN1pEsCk0FzTEFmcrSkcFBDl+LK7nQEbsB
	BMvZm0FIEAUs/1qajSU4fggZ8Hy1aAXKU1G+NwxYPKJU+JGMtjc9ANsbYFw0YRVO4npSGUVnOe+
	wefUfWj1xk8NCUzXBDoR8IMxOI0FpAeBOqYlACvTLWBGJ5LxMdyZzgYxzraMpiqiw=
X-Received: by 2002:a05:690e:1907:b0:67d:bb23:631e with SMTP id 956f58d0204a3-67dbb236663mr1529423d50.97.1794865128041;
        Mon, 16 Nov 2026 13:38:48 -0800 (PST)
Received: from [192.168.207.4] (104-12-105-135.lightspeed.miamfl.sbcglobal.net. [104.12.105.135])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec06ff89sm9325807b3.31.2026.11.16.13.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:38:47 -0800 (PST)
Message-ID: <4a1efe5e-ec67-4caa-bb84-35759e66ef42@gmail.com>
Date: Mon, 16 Nov 2026 16:38:46 -0500
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
From: Jason Perlow <jperlow@gmail.com>
Subject: [PATCH] Bluetooth: btbcm: Add entries for BCM4364B3 UART Bluetooth
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-bluetooth@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The BCM4364B3 combo chip on Apple T2 Macs, e.g. the MacBookPro16,1, has a
UART Bluetooth controller that reports LMP subversion 0x3032 (001.016.050)
on some units and 0x305b (001.016.091) on others.  Neither has an entry in
bcm_uart_subver_table, so the controller is logged without a name:

   Bluetooth: hci0: BCM4364B3 Trinidad Olympic GEN (MFG)
   Bluetooth: hci0: BCM (001.016.091) build 0115

and the firmware lookup only tries the generic "brcm/BCM.hcd".

Add both subversions so the controller is named and its firmware is looked
up as "brcm/BCM4364B3.hcd" first.  Tested on two MacBookPro16,1 with a
v7.4-rc3 based kernel carrying an equivalent change, one reporting 0x3032
and one reporting 0x305b.  They now log:

   Bluetooth: hci0: BCM4364B3 (001.016.050) build 0082
   Bluetooth: hci0: BCM4364B3 (001.016.091) build 0115

Signed-off-by: Jason Perlow <jperlow@gmail.com>
---
  drivers/bluetooth/btbcm.c | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 065536d4ec..92ba7aeac3 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -519,6 +519,8 @@ static const struct bcm_subver_table 
bcm_uart_subver_table[] = {
  	{ 0x2119, "BCM4373A0"	},	/* 001.001.025 */
  	{ 0x2128, "BCM4384A0"	},	/* 001.001.040 */
  	{ 0x4119, "BCM4384B0"	},	/* 002.001.025 */
+	{ 0x3032, "BCM4364B3"	},	/* 001.016.050 */
+	{ 0x305b, "BCM4364B3"	},	/* 001.016.091 */
  	{ }
  };
  -- 2.56.0

