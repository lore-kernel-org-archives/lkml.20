Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E1835F5ED;
	Tue, 15 Sep 2026 07:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458064; cv=none; b=TVlMOLREJM7iCXStu0WEmYVB7Q0y+oh7CeKolsKFhwUz7xhDnsH6A4xjaperNbmYl8IGdvo+nK+E7CUEJYW/+9qhmMxcM3m3cvdIX58vBtLY0mL3N8h/+25+hhoC0TvpaIwYBtQJOpC0ChUOlZk1WMFrOldipb0LoB0mH8YKFBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458064; c=relaxed/simple;
	bh=qfDWUeRelUxKXgNRJ8+qbWmR+Gvpk1QYDIF+nJ+BzN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/CtGgGhVKDIHE71IkwfbookIfg6ZoxCvNWY1shwGzjEGjb6z+3/lbO6euCNqlq0MeesJqxnarDUP0tgGak+vyva42OmH1yjY3yWonc/PEzoVmEjKlkccn2xGaNlQ0az91qfubJdO6wpjqyeIg1WKrCD2fWCl6+0K0UXC7L22Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lqCPmnNn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lqCPmnNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789458060;
	bh=qfDWUeRelUxKXgNRJ8+qbWmR+Gvpk1QYDIF+nJ+BzN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lqCPmnNn94nzLoeRNuw5t6W8Y5wfP4BuOKrFNlYN9Q43mnNVjgMnXkjvoCRw/mFgZ
	 eXw56YNhPC/0u/UWTj0AE5m7EJA4qaqgepo4oAbtZuZhUydGptEpA+JS32J8sYLk0X
	 wgup3gAAUn4Xdqx4yv4k6lae6MMSWQ6u8lyX3NwCyukJHs7aeNy8vk6XxDa6yej8ou
	 ychnDDqQzDkKt4j+CLHL/lIu8QAWf6hSsO8NZvfv3QjKwD5DEHFzsBCR/nzDDpCylO
	 jNN9r/ZXWQjkazZ5rs3nyQnrBgDz2wSP+uP8A0HNgXhkIjEPyyU12WZKr84kkW8ZI8
	 3pqz33rFZHgzw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF2E317E090C;
	Tue, 15 Sep 2026 09:40:59 +0200 (CEST)
Message-ID: <351ce005-b7d9-4333-adce-896248c2d7dc@collabora.com>
Date: Tue, 15 Sep 2026 09:40:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the phy-next tree
To: Mark Brown <broonie@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aqgKDgDpqlnQPgDz@sirena.co.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aqgKDgDpqlnQPgDz@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 16:51, Mark Brown wrote:
> Hi all,
> 
> After merging the phy-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

There's a fix already:

https://lore.kernel.org/all/20260913172930.1150324-1-sashal@kernel.org/

Sorry about that

Cheers,
Angelo


> 
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:761:18: error: incompatible pointer to integer conversion initializing 'u16' (aka 'unsigned short') with an expression of type 'const u16[4]' (aka 'const unsigned short[4]') [-Wint-conversion]
>    761 |         .off_ana_lane = (const u16[]) { 0x100, 0x200, 0x300, 0x400 },
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:761:18: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>    761 |         .off_ana_lane = (const u16[]) { 0x100, 0x200, 0x300, 0x400 },
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                         {                                           }
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:763:18: error: incompatible pointer to integer conversion initializing 'u16' (aka 'unsigned short') with an expression of type 'const u16[4]' (aka 'const unsigned short[4]') [-Wint-conversion]
>    763 |         .off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:763:18: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>    763 |         .off_dig_lane = (const u16[]) { 0x1100, 0x1200, 0x1300, 0x1400 },
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                         {                                               }
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:776:20: error: incompatible pointer to integer conversion initializing 'u32' (aka 'unsigned int') with an expression of type 'const u32[9]' (aka 'const unsigned int[9]') [-Wint-conversion]
>    776 |         .driving_params = (const u32[]) {
>        |                           ^~~~~~~~~~~~~~~
>    777 |                 [0] = 0,
>        |                 ~~~~~~~~
>    778 |                 [1] = 0,
>        |                 ~~~~~~~~
>    779 |                 [2] = 0,
>        |                 ~~~~~~~~
>    780 |                 [3] = MT8195_DRIVING_PARAM_3_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    781 |                 [4] = MT8195_DRIVING_PARAM_4_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    782 |                 [5] = MT8195_DRIVING_PARAM_5_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    783 |                 [6] = MT8195_DRIVING_PARAM_6_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    784 |                 [7] = MT8195_DRIVING_PARAM_7_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    785 |                 [8] = MT8195_DRIVING_PARAM_8_DEFAULT
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    786 |         },
>        |         ~
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:776:20: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>    776 |         .driving_params = (const u32[]) {
>        |                           ^~~~~~~~~~~~~~~
>        |                           {
>    777 |                 [0] = 0,
>        |                 ~~~~~~~~
>    778 |                 [1] = 0,
>        |                 ~~~~~~~~
>    779 |                 [2] = 0,
>        |                 ~~~~~~~~
>    780 |                 [3] = MT8195_DRIVING_PARAM_3_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    781 |                 [4] = MT8195_DRIVING_PARAM_4_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    782 |                 [5] = MT8195_DRIVING_PARAM_5_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    783 |                 [6] = MT8195_DRIVING_PARAM_6_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    784 |                 [7] = MT8195_DRIVING_PARAM_7_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    785 |                 [8] = MT8195_DRIVING_PARAM_8_DEFAULT
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    786 |         },
>        |         ~
>        |          }
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:761:18: error: initializer element is not a compile-time constant
>    761 |         .off_ana_lane = (const u16[]) { 0x100, 0x200, 0x300, 0x400 },
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:791:18: error: incompatible pointer to integer conversion initializing 'u16' (aka 'unsigned short') with an expression of type 'const u16[4]' (aka 'const unsigned short[4]') [-Wint-conversion]
>    791 |         .off_ana_lane = (const u16[]) { 0x0, 0x100, 0x200, 0x300 },
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:791:18: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>    791 |         .off_ana_lane = (const u16[]) { 0x0, 0x100, 0x200, 0x300 },
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                         {                                         }
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:793:18: error: incompatible pointer to integer conversion initializing 'u16' (aka 'unsigned short') with an expression of type 'const u16[4]' (aka 'const unsigned short[4]') [-Wint-conversion]
>    793 |         .off_dig_lane = (const u16[]) { 0x1000, 0x1100, 0x1200, 0x1300 },
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:793:18: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>    793 |         .off_dig_lane = (const u16[]) { 0x1000, 0x1100, 0x1200, 0x1300 },
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                         {                                               }
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:806:20: error: incompatible pointer to integer conversion initializing 'u32' (aka 'unsigned int') with an expression of type 'const u32[9]' (aka 'const unsigned int[9]') [-Wint-conversion]
>    806 |         .driving_params = (const u32[]) {
>        |                           ^~~~~~~~~~~~~~~
>    807 |                 [0] = 0,
>        |                 ~~~~~~~~
>    808 |                 [1] = 0,
>        |                 ~~~~~~~~
>    809 |                 [2] = 0,
>        |                 ~~~~~~~~
>    810 |                 [3] = MT8196_DRIVING_PARAM_3_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    811 |                 [4] = MT8196_DRIVING_PARAM_4_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    812 |                 [5] = MT8196_DRIVING_PARAM_5_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    813 |                 [6] = MT8196_DRIVING_PARAM_6_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    814 |                 [7] = MT8196_DRIVING_PARAM_7_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    815 |                 [8] = MT8196_DRIVING_PARAM_8_DEFAULT
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    816 |         },
>        |         ~
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:806:20: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>    806 |         .driving_params = (const u32[]) {
>        |                           ^~~~~~~~~~~~~~~
>        |                           {
>    807 |                 [0] = 0,
>        |                 ~~~~~~~~
>    808 |                 [1] = 0,
>        |                 ~~~~~~~~
>    809 |                 [2] = 0,
>        |                 ~~~~~~~~
>    810 |                 [3] = MT8196_DRIVING_PARAM_3_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    811 |                 [4] = MT8196_DRIVING_PARAM_4_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    812 |                 [5] = MT8196_DRIVING_PARAM_5_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    813 |                 [6] = MT8196_DRIVING_PARAM_6_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    814 |                 [7] = MT8196_DRIVING_PARAM_7_DEFAULT,
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    815 |                 [8] = MT8196_DRIVING_PARAM_8_DEFAULT
>        |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    816 |         },
>        |         ~
>        |          }
> /tmp/next/build/drivers/phy/mediatek/phy-mtk-dp.c:791:18: error: initializer element is not a compile-time constant
>    791 |         .off_ana_lane = (const u16[]) { 0x0, 0x100, 0x200, 0x300 },
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>     6fe4d5beac728 (phy: phy-mtk-dp: Add support for MT8196 eDP PHY)
> 
> I have used the tree from next-20260911 instead.
