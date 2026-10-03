Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B45C2F87B;
	Sat,  3 Oct 2026 06:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791008515; cv=pass; b=toemrLfMJEHVI+EbTGbTdpfhRERXQzQSWGS3JXzJVTKHHlr1InZGKxYNsMFi0RN2amiGr4kfXxjtTVh0M67EcV5mt6GpBlz/VxOQssY69SYguZbmmdiJFXtyOJee8eMXqymU1JpbLtPi/fdH4EZ6lH9nUR9VWMtCYuhamJB+jgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791008515; c=relaxed/simple;
	bh=+JQa/E1lnnOrXkIShXybWfk0cHsmxc1amWRIMUAaLxo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=V51aKqkXMnT1FM8OPbATtbyS9iRoc2IHkyhxAOqiP/z6R8VoE7qxV27W4GHgmUHV/vVwGkbByFsO1ekzk0QcZLSqbLFuvTWR07XKSHFz4kmRgdrFHBVKcrQL8kSgujyOoE2j1vNd4UneeBZsYdBd9s8BKDQ0yMA0xoHAXfnvXZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv; spf=pass smtp.mailfrom=iav.lv; dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b=I598eWbh; arc=pass smtp.client-ip=136.143.169.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b="I598eWbh"
ARC-Seal: i=1; a=rsa-sha256; t=1791005524; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=XMD02msfBzu3lk7YxpQ/2gFieTVQMdqjS+jiAhUHtFQWI34FEXMmQeFq4nybWYye07lRHwVwgtnYFclgrHlqwby0iCLU3H0L+jToYeVSUSJMGa6Y1ypBztblunnoZR28Yy/0St9QF4Fw56wDybt61f1S1C8ILIH0C16HVmFapzk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791005524; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+JQa/E1lnnOrXkIShXybWfk0cHsmxc1amWRIMUAaLxo=; 
	b=lR1EHWTzTeV7IU2Z7pz08bIfHhxExhBBlgyyygX7AM1iGTp2fGQ0efMDMDajg6OUJospmG3jU9LhRZ20WgKFoQkrUfHR++7TMCl2XRWleDYH8a5m9nv9UKa7GR7EqMLMfJmmuE9GYu6tfT5ht23043wty+A0HIWMw89VprFCm8k=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791005524;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Date:Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=+JQa/E1lnnOrXkIShXybWfk0cHsmxc1amWRIMUAaLxo=;
	b=I598eWbhyEZ8j+5Ye1iPv+yAC8bH2lRnI5iVytv6b+5x7feSiHoilehd+jYWknwG
	BcdNgzqBDgYBDtXbdd09yDfky2cZUCxEu7vvnMqWcs1BkPJzU9W44Yhn7YTLfyzgaxh
	NStvMPLaJCeI8aNv3vHXXMf9uLbAp46kUlMRrVBo=
Received: by smtp.zoho.eu with SMTPS id 1791005521533518.5421443074531;
	Sat, 3 Oct 2026 07:32:01 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Dongjin Kim <tobetter@gmail.com>,
 Eric Neulight <Eric.Neulight@linuxdev.slmail.me>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: let the SD card be
 powered down
In-Reply-To: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
References: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
Date: Sat, 03 Oct 2026 08:31:21 +0300
Message-ID: <179100548183.3372253.2014593916926884551@iav.lv>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Please drop this patch. With the SPI flash erased, so that the boot ROM
loads U-Boot from the SD card, a warm reboot with this change fails 2/2
(the ROM loops on SD:800); compare dc7f2cb218b5 for ODROID-N2. The
4/4 reboots I tested went through U-Boot in SPI flash, which powers the
card itself.

--
Igor Velkov
