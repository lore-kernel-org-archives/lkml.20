Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530288;
	b=EZr6/EvjLUdHZTogztX3YqzD33PJ05k+maCAetg1j4YLSxrjmJWmd5LOWT7AGujEfV0a
	 +SxJF5I0eG+r81w7VMlerY7it8wU1sC8Y8iseSRTH7mBh/hQrgFzKuWDmvd7TcGNP7kG/
	 x2ut+aVqq+SEZ0i7oCzXfhWxdYbuWZn8aOWwsMW6syd9t/xOnWK2aDhaGbBln6irfz9KP
	 BCVTXb3ytPxXALLH8z71EnXiM+k0m0yk/D+GNEexmTEWGd1FIm85T4uIs17fvxiqVSY6p
	 SNztpAwbjx6feIncwY6CqzQXhAnPQLf5L04zMgg6uFYxtB0VlZpEzfeMrNvBSDYsj+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JrLg/6b9RqsXrMXKx+iE2vsv7SoB1VWe2RrESbsV7DU=;
	b=fWSNJ35ey+QYCwKeZf3fIzOku4Gw/VOsyaa3VMjP7T8FB4Fs7smkrAeh8njfSvWNxfLr
	 3Q42tAhcla5ZXZFUKpP8kaAWsLso7+AshdgVy3RoNRlh5/fIjtODg7Mhx9cQLTswC4kTF
	 ywAuJgvPv53VSQFu9jWIFSOqiTlDd/pzIgtVkkJXXhUJYOiKYuBJCzu2CQ3EGP4r/bvDb
	 63eIKBFBLfqtAe8A662BI7gFZISTnPhk114pA2/9pJn1mazd/30jQ4+LrlcT0shBpWku+
	 xlABjZM/eDfqP19ujcwXWeIpcp44/cIytICs9KM5SQtDorGrUQtnqE8DBgfC8A7mHZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jqaEO2p4;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E22A606A899
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E22A606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jqaEO2p4
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490d59c3edaso191755f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530287; x=1795135087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JrLg/6b9RqsXrMXKx+iE2vsv7SoB1VWe2RrESbsV7DU=;
        b=jqaEO2p4KozWg3cT0zJJyyU2ju2gxQwzUpzu/yvEpYiKjul+s5I5Eja2hKy1ZNdrF6
         IzK0faJLnWokqfoPXOybeTmYYscgl27T97r2C2TqaAeln3nT0yDS2TBfrgaE6iZSqYBd
         P9l+Z3e0obV5O/nAIhal2/s/UvQuwKUn4auZlloLAYJOsLoEfHSjWBmoB3cKnDbZ+OYS
         r5YWrp3O7wQ1iDrb9dYa3zultLU0KMRwOSZi48xIYOlwM4toJBPjaou+Qz+oyDNGHW7L
         Z/s2AI0yFlLJDdIK97iF5lZ64dtvK4H+H7eiO7/twhkt98ULk94K0L9yZC3DiYVg3Ato
         KZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530287; x=1795135087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JrLg/6b9RqsXrMXKx+iE2vsv7SoB1VWe2RrESbsV7DU=;
        b=YV0mVxFiYrYWe/sC/DOSK+QMG6xjrY8NZf2wz7Lfkmh3jMmQGxIvftsYKwVTOYDAA7
         uGjTzE5LABzw7jUeFM3i4QrIT+D/TfiEkseYOeebcXYcwS3bLP/JIz316OshSfQIpVcw
         AFxj0qraU7VWyEAH/45CjWiXAPoMBVOW+6+5ZZnGl1TG770i1WRf1Z9V9N+ewkDg9ASJ
         Iu4LqS4c1uOt2ZPrTZnF47WjseloeIG0SJxQ3MH2QAz+4RSGGXfV2b/qnA75wEMD/tG7
         CpkSccHcjSSSikTlnyHSLLGqv4kG4nwxX9btiVEeAh34AL9rS/C2G8E3vNPasaomaj5X
         2I8g==
X-Forwarded-Encrypted: i=1; AL+hErFTIp06b75l11FPTCaKQTkE7wO6m4maLu1/RWKN1rS4UOOJT9vEwM/0SMZT6SkXaulTQ1pUF/lYdLqNxqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xW1hUjxmhTRwRrAllGuaCAa3y6sl5+Mq2Ru/NNFYpeioA7M9L
	FuvB64AzGc68NaUuCMByE+FC4uKSyJGiZslNfsthlyeZ8ED4c4i26yq3
X-Gm-Gg: AYBFou18gO9EXjGCzPdhvVqNoGm7GIh22AIjhh9MUMLtN1yQyBAcMw4G4NllQI0N4o7
	H46qzGUEBxCjOt5XZuu5XbJyK4uSi8UmvH8Kx4TD4zVxyF/1af6zw0uhoX26m4qkT4mhBxeQ06n
	LgFh8bUCFQgN5eIWX7Pbpw09bPH5yRO4241bDyRJYO1QnL5xDvRjdSyU3h1/NZBcVTCazQYYDTX
	dhI7TPd3x5aiKcQn2fr0VXa8/TKr0QxqtGEAXnkQ0LR7qobZiOeecwJTBRqPZUzu81iQDyZTgz4
	H9PdEnQbUaem55OGiGqzY7EakNNhTgXH6wrvtXA581x8SaG6WzOBW65lYH80EfObEaHlWO/SiNi
	V+lnJ5pPeF2EtC0ifekxDOT5cdX1ZloHca+a3kL6eMDPdDir6m1KYmfeBYVkwXBL+X4wcdl6/ZK
	B6A0fRQO/+5w3QIKuTFESummi/yLlGJm+RWOkwVU+Ul6bH2hrPbPbNLVneZLpwQN65ApfCZCwTc
	7uOZs7uZVL6j9JBcj+c7EYD5hP4OqD6XyD6k6dUI+bmBhm97His3B2Zld8BiZPf1xwB8zWKXqkp
	gMhCOpuIyEc0iwaru7zKBpealn69aHKrIkgjxq161v8/omvpXyND3OTA9rZoN6YfY2SQ+jOP7N6
	6M/f0j8n3x4SylhmDjOY2KXWbb6iQMeDc0m2ZFEUDmFcj5thGfDGNNjWqT7OnLhOOJu0EsxLh/E
	3LIw6c8szyAkRqEZAG
X-Received: by 2002:a05:6000:4718:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-49b0287cd7dmr8979495f8f.21.1794530286812;
        Thu, 12 Nov 2026 16:38:06 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223b21sm2410376f8f.2.2026.11.12.16.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:06 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Fri, 13 Nov 2026 00:38:05 +0000
Message-ID: <20261113003805.3669702-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014131954.GA1623979@bhelgaas>
References: <20261014072109.1759502-14-ghahramani.navid@gmail.com> <20261014131954.GA1623979@bhelgaas>
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

Hi Bjorn,

Bjorn Helgaas wrote:
> Suggest making the subject line:
>
>   PCI: zx: Add ...
>
> or whatever tag you plan to use for the family of hardware this driver
> will support over time.  Future changes to a driver typically don't
> include "dwc" because the name of the driver itself is more useful.
>
> I see "zx" used in the spi patch and "zte" used in the clk patch.
> "zte" might be too generic; there may be future hardware that requires
> a different driver.  "zx279128s" might be too specific; there will
> likely be more SoCs that share this driver.  Same consideration
> applies to filename, config symbol, struct and function names, etc.

Thanks. I will use zx for all of them in the PCIe series, so the
subject PCI: zx:, pcie-zx.c, CONFIG_PCIE_ZX, struct zx_pcie and the
zx_pcie_* functions.

> Capitalization of "zx279128s" here (menu item, help text, comment
> below) should probably match the commit log and marketing materials
> for this SoC.

Stefan suggested lower case for these SoC names in a reply, so I will
write zx279128s in the commit log as well and the two will match.

Best regards,
Navid
