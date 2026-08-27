Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FA73A168E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817056; cv=none; b=E4Oy3YT9tuBVUwfUPFU04fd1H5wHHnx6D8Q+g9FijmspXZvXUO4CHZ7RwKgMg8cWbonhp09lvdG+AaVw2Pe5HzrWSeVqAoPaav5wrU5COrLQqRNFY/lFQ9YItyUm7QLMJOeUr8SeC2fzdGG99C9Uh835d4iLZSXHFNgJrMgYm6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817056; c=relaxed/simple;
	bh=o9SfOayrWajRW/+NG/zMKHW/ffcQ2S0g3uodt2BKZtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGwrqdEpy7uLakORI1wFtY/yTuZ5PtXcJD3dLrfJ07TbxwH0xUIiKBNJn7hIaAdU+5AogM9sXqU44+xqI57QaIuZPLfTdGOvWncp2LgwYWgJa4yUtK3LL8aVByytaXKb6CRQ5rtyZdzO045D4sEXqFR61RchFm/Q3CYMyPrh3ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=Us1jmtvQ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="Us1jmtvQ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so290196766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1787817051; x=1788421851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TC/uq2OAWBJlRWDS0+FgLZUaW3+hNg8rcbu4E+WX7w=;
        b=Us1jmtvQ5pmBNvHxw8AS0DXXd2Q63sIGJuBeYkO4Qz3HOZFdHzVohMwPxz9Y0xhPQx
         FXcGbF2HavRovHFtKDHIMgYQY1qzvIzhf/6NuYLMuZdg4neRhdtKMV/Q56FtL1h85Vcu
         g/ID7qaw6izcA8x/+7gLznEmxsDrwSj5Ng8P7knMZu51YjVizOTwQDkRumMP9uOXYRfd
         dyQKdLLfSvUVs52Xb4a9hu4li/+HWs/YmhagFrWH+bY1L9u0SRSYK9n0ResDrDPU53r3
         3nz0B59yvpWSlt5OBbTU3m0QDvhx2sbDwfRmahfUaEPncykrolIpuUG0Ayc/EPZlNDUM
         kscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817051; x=1788421851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TC/uq2OAWBJlRWDS0+FgLZUaW3+hNg8rcbu4E+WX7w=;
        b=FKRnceIJMY6jYlt7O/pEpEOZKPYxFFOSWbaRABZBcBZS0A3FBQBlOXslMTu6M86uR6
         ugOaClLanKDPPSdzEo93nDyW8R7Vb3pSumI9DGQs40MGc69MKV7RhI1a6JNLyPj+x4zj
         b5j3/cIHgs90PlGC2+bl8jUKHaciFxTF09mf/YuO7OeiTIUL4QWW9T/f7Qv74qEgx0Pb
         qhhM0Rq93AC4GwNkOLzwNj9JT+PLsrMni95H6TZ1/XgQzkeNPzvNyGA7ifSmcN3WR6Sc
         PyafIB+3ZIXZ1yBctaiAISgBFBo3VP51/FiNJFVrqxLhdoMOuowHwSYbt9RovBoposMm
         iZtw==
X-Forwarded-Encrypted: i=1; AHgh+Rrzxn+AI1oZ1TyIHhM18csPRbBF0Q2yPoyEG2UYxVvcS8/zc/ODR26WCTd15pP9UgnFQxuHjRVMm+mF19s=@vger.kernel.org
X-Gm-Message-State: AFuF++kE68iOo5H9slXg08FKAVki9XC2dRx5vLqwOvto9c1qwTR6E3b5
	9LoI/S5IrqQ14kw6HqiiaolP0Ja83hHqEIgw0Xlg9NCjVhRvNf7diZFTabJrxl5piQ==
X-Gm-Gg: AR+sD11mP/RaNQWqGQFSmf/GCazb6Nt7foDdIDtxxpLt3ujFYJDrn0KVZpcwluyLn/l
	X0drJTKsZm/gvIZL3yQq/4YinKrXtRwdsViQOPAvPEo8cEjbcPR+Y05dscMG2/gf/dcZAtV+7jA
	08J9L2C/Qi0qiTX5irOY3CSt8E2X90FmK9JmjtPLUONYLIKBQyISAIAyppw6BS16xk83xFypJ+T
	gT05UN5UnxK6F5b7vxyfnLZoRFSefgAAg1rg1eb7tJl8+W5gLO5hZHLUIq+fgy2BAQjpObnlGcs
	PU9VFm9TSar70vzy62wSg2sgbS9ck2+LrzHM0vXaDFih68tsa9Nk+ntRAUs9vz7jivxH205oIOt
	zGfJ/PsH8DnjGnNKLA5JQQfsg0G93choP1LuBaiTEoSa5gesE16Nlf+xhOeQO59lHWSRTDjFaxw
	Hyu3i1gTxCbbniPo4E6abX1ELbTsLtYakMOUjADiiziHUazmQRgBMnb9vVHbqNpWTTC1lKChZJx
	nGMNSFghy4LPa7pcDU7ew==
X-Received: by 2002:a17:907:930b:b0:c24:680b:3944 with SMTP id a640c23a62f3a-c250c330febmr1350343566b.13.1787817050958;
        Thu, 27 Aug 2026 00:50:50 -0700 (PDT)
Received: from [10.254.183.223] ([149.199.62.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a722400sm652641166b.23.2026.08.27.00.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:50:50 -0700 (PDT)
Message-ID: <702a199e-6439-4890-9dbf-0111aa76aee1@monstr.eu>
Date: Thu, 27 Aug 2026 09:50:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] microblaze: Fix MB_MANAGER build with older binutils
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>,
 kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260813024026.5402-1-kmehltretter@gmail.com>
 <ao-3jrT0aP0_fSBA@gmail.com>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <ao-3jrT0aP0_fSBA@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/27/26 06:06, Karl Mehltretter wrote:
> On Thu, Aug 13, 2026 at 04:40:26AM +0100, Karl Mehltretter wrote:
>> The suspend mnemonic is an alias for mbar 24, and both encode as
>> 0xbb020004. Use the underlying instruction, which GNU as 2.30 already
>> supports.
>>
>> Fixes: 88707ebe77e2 ("microblaze: Add custom break vector handler for mb manager")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202310310151.UhB396Qs-lkp@intel.com/
>> Suggested-by: Michal Simek <monstr@monstr.eu>
>> Cc: stable@vger.kernel.org
>> Assisted-by: Codex:gpt-5.6-sol
>> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> 
> Just a friendly ping in case this got missed.

will look at it after rc1.

M
-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

