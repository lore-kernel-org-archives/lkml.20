Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934224;
	b=JmpEGf+l8Ywqf+8bZNv/YJE8k6UW1ZFNZFKHcCReRwdDdWwC+FCYXAetglF0I2Wd7W2f
	 DKZh9QB4J/9X6k+l6AYXN6ixwN1kyaO5jEFC+huRH8ZvgnU89kI2lqQ548QyDAg/2lGTN
	 ANjetze+y1Tf3+NwnjetKV1VE9SjRvNsSAGEtvSlKFmhJMlIkPHrivIcF/23PKfDxmKYi
	 lvbCxbaXnJKVky+pfst+B+Zm0mjy4jAXK8LDELZXqBv+frYtmSBUvFZm34CyjoX9z0MAh
	 nwGIt2POHOMZXXLoPNFQ5dKzKACAcfvqNE9LdzVinPtxomL4XXNvuknC8J9ALNVOVgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vefK5FQVlJXzb3STeUejz070GYyJd6eyM7yi88g9v0c=;
	b=2ZbAMrWAXvM1LwHEFveV7sWK4N1zp0SK9TLj/JPfmKIp+XGZUcQ8lv2PLYJaaa6x69wg
	 W8TQMI7veEufyeJ+RaMBXfQMn4kbSgaJIHzijFpiWTU2gSdWG8R28G7j2gYJZ1j640MxO
	 FUAWijz0Qle8oXUAHTaajBsKxggZU5rZP9m8CtLDs8DfELiWcI03pFGlcCgaaTxnaKshD
	 q6WTO7SRlHLqroMIkSqIGnR5p94cYyCaAzsRYMKKZiQlA6lM1/+nYZ7nUtfnY9E45Fwcr
	 nUmP+bYU0ptsh5y3HIRjbFJJ8ihqlPQdwGvzG06ER6RCCWUBfmjcAbXv0TlyR5mrpOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O8bDpIHl;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB49606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB49606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O8bDpIHl
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso54822b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934223; x=1794539023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vefK5FQVlJXzb3STeUejz070GYyJd6eyM7yi88g9v0c=;
        b=O8bDpIHlHu/rUY/EkDpLpJO6ICFjEBrGp/2FqKaAX5TVdpUTuIqa7/mrAJmCBm11um
         H1eDmuvPSI6geaWapmT5IL9VEreuDEYbNkb6IlVeQI2JZMQ+U/+F9MrVzMd6HiGsw+7y
         YJKo0NtGi+kKn30f9KXFwKL126PuM65h69iq9M3nP2oGOrd/+k711SwvmMIz5CabIGO7
         PVRFGmws2/gDNKrd4oQBq5JMkU0tklCdxXA6aTOUTmxcSC3pc+ymfJwAsd2arB95d6ID
         QiG+2WWRdyhSWJaKQVUWPXp8Wqk/61Y7DxuoHuzDltq+CdetcBbkdF9VHi2sTVdPNRYK
         wqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934223; x=1794539023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vefK5FQVlJXzb3STeUejz070GYyJd6eyM7yi88g9v0c=;
        b=2eBVv/vlxJPuV0PcTT4FtXwudIxdKuAVEDmf9m1BVGJNsbCSeAqIZ7H7xw0+XFWPaB
         dRahP4JLz9bgEB/Iqn8skDZ7Ky/0SnnsSULSjj+SytocS56/pm7ryyFlcvFfIb0AyydX
         cqmUIjAxUdNcKLGg7ZCvajydKPR+7sF5GfynGnIauiVPViWrYyuALaPtiSJ8w9Uktpax
         tV7QRGyqYOkj0QpT+FfE28Xv0+kX3pr0S3xOGCrCc3cire6/OLZP9gN+0ww5azEols3g
         D51xaoVy9lVP7hsROFhb28kgXNQRho78GYFVpbZLWzMr11maHDqRmkdQXgseZ3xYp6H3
         CC9w==
X-Forwarded-Encrypted: i=1; AKwUvBy22IvAe2Qj1meeNvzNgd7UBAbaa+d38/nnEetmJHspulkda8BkKsnZUwAQqhq0qYsqTo3O/MESV9p329M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/id6akVpYykKGucbtiqfb5zMhHChc1FFYx5F+VRSyuFEQDTiHs
	WUiAZtqEGgw2hRc3maR2XvClgE75EzxUxAndrLvxg9pZvdJmGVWIqP0k
X-Gm-Gg: AYBFou3/FPZcgaB1NQzCDw6GTvvL6sUTuWGWCrRKkYuCk9VQ+XU6GpzMR/WFgzDkswO
	Ip04yc8AqcsE0cYIabLWn7a4+DBvSi9qoH9Dtk/r+d6EVWEsRu3k9M8cst4JCLwfdQ6Gsc95C1V
	Vbn8oT2ghnWD066FieMt4FSTpCMHssabPOmlUFmjXUiwHJ1/DRaeCrCs5ego7mru35NrlebtmBX
	yMoYKCiumYiqthBPCwbIYDhGTyT6QenOO/tnJDHZ+pjuiXV1EO9aMhE0qp3TscAewmtXHuCr8RH
	2yhFToUY352QCXFQIek8aGmUp+s3pV85ABf5ycFziO3700CWon8rUv+xLE6PBoO/dYlZIFbRyME
	N/ycgBZJ4GhniTOyVm9IIcmE3PC0L94Esoqtr89V1PjqUvAk+z4L0NUBGJRbvYJi8Nho+EKt3YU
	VNZU6pl/n/1523kW5Y9D59ap65Fv9H+0htIHWCNoIo5AGKgHDTlnWnqTGrvVCl3at87WJfBZ/+e
	hGSosBr52d1pX0b5KGdjH1bPisQPPS9fgOI2rlP4ZngcDQI+j8SHylP4+J+4pgVi0VCGS37QPDH
	w7xpqfeRMNp7rx0p/DtGW7A/zU7xhJqa6A7DYCTWrXEaEkogbd44VILqFhQIQpHMB+iVQhBgv4F
	0qPufkWYDKjMCwQ==
X-Received: by 2002:a05:6a21:6b05:b0:3e2:799:f2dc with SMTP id adf61e73a8af0-3ebb2a32f99mr1584310637.40.1793934223023;
        Thu, 05 Nov 2026 19:03:43 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a04a39sm118179a12.15.2026.11.05.19.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:03:42 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 06 Nov 2026 11:08:03 +0800
Subject: [PATCH 2/3] ARM: dts: aspeed: ventura2: Name the COMe presence
 GPIO
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-ventura2-dts-update-v1-2-b085ece9bf57@gmail.com>
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
In-Reply-To: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=4Jjy6nPmm/6tj8SAdf81ahe94whURxI1stwQZrqpyWA=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq7USVNgrr8sXF9pbSJR2rRAI+WNwaex/opd0PN
 eMqQVHYIh+JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCau1ElQAKCRClg0K3CVbE
 gVLVCADDgwQyaqhCkNk4V4yZiqInsNBqp1YSJdRkVsxHS3sXrdepMRzW399viEf0lzpq4iLclfb
 icaA9RyeB+vGZJ1EWW9ZSeLncM8W1RQp23YEIgE1qW95PKHE88GqxSleX8lRXKSd9IDffeu+lAt
 8tznjeEnV0RdpZw+T5s3e3hpJs6wenS+z+l7AqanMVTx5ABSYWgl7v93qDJ01nxd+qfHXauz5TR
 H6QK8SZTncBv+ULDWVrKSqyshWfqGnmrC6+umFUjSecbRL2mpBu3swo2YOg0ECurV9y7ldff4Bb
 zEQN7xfd4xJMUJBFPZk0L0ZWLUfeK4OZkluS3QH9/fmXKHKT
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Line 9 of the PCA9555 at address 0x23 on I2C bus 3 is the presence
detect of the optional COM Express module. Name it PRSNT_COME_N so
userspace can determine whether the module is present.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index 50e652cc37a1..a9c5990ef969 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -625,6 +625,17 @@ gpio@23 {
 		reg = <0x23>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		gpio-line-names =
+			"", "",
+			"", "",
+			"", "",
+			"", "",
+			"", "PRSNT_COME_N",
+			"", "",
+			"", "",
+			"", "";
+
 		interrupt-parent = <&io_expander7>;
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};

-- 
2.34.1

