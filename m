Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738079;
	b=QYqqbMWVwOT2dKozHgACD+9JAVUGtu2AFsmjaKsmL+rD3zkyc5DBngXpNXdPwGj96xHM
	 d5/lQqqEGFfuj5Bp8jF3eXG3Oq/0Nc9T0YvYYjXShhnPu0YWlWes+YLIz1/cSn3uzlAYX
	 PwTD5cd95ZPDnKeY+bu/47B/j5AWBpG9UKp6PzMGt6kdWuk1A8kTzKaScNVgSwDzFMlnb
	 EyJIBgfbrylNJkpqEBaizfP9TRuKDXAbaHTq9oMHS5pJUe3Q9PJIBcq8sjc0mBouh2pHL
	 Ti+PYLVIsatKyc6ZYzopbPxntHVSSkyf2xGnX/3iZ3w22BvMsSUBkLINa/8c4o5FPPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738079;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=brBjDwzWi/lNl7usD3o63k7X0qpFlh94zsNOVSBPia4=;
	b=UEzSB4Sba0ykAEHO5EnzCyfrpXa3Fx/y6qK6pDHn+6TDzyCy50PdEXdtUp7Mk8D7/1qv
	 iDFLlbxQ/wywkfHGLjtKJ/mws9rYDcPYJjALzVLlFiqXYkHW4QfK5d4rVWdwGvv6zWuhK
	 I1L8fjrzAMVGzpQNGNbjVI9jTWwMtLMk3ZvQyrWwp/8AFBQe0Y3dYy+Zrp0bcc4AOILLS
	 1YCZThT+vayFXr13NwWlgOaIb6Vn+Y6AuLrWM+C5NabZetKCFwXC2Gtc2ikWBiE+NE+8K
	 IcScYLtmGXdK7etaQrTuwHOcGthCeHDNVDv/ckyaNwITh13fooc7DE1iDRjNzkC7CGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W96cMTL1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1D9606A31B;
	Fri, 23 Oct 2026 06:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W96cMTL1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33C61F01825;
	Fri, 23 Oct 2026 06:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792738078;
	bh=brBjDwzWi/lNl7usD3o63k7X0qpFlh94zsNOVSBPia4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W96cMTL1/iu3Dzj4dhAXJdcNIG17fkWxp8GkSeGtX4d5NoG9YS+cNMrAoCz7ox7lc
	 TFC0WK4BYccBHTewTBQBqpRJeUBlXXMaBFIsyCRS1feTJqQ9ki7swKa7svUlAQOd0A
	 VmE8FapU3REQZD5WTY5v6t3Uc7nZSh0V/8dIKB1+8l/Aq2xbx1lQmIn3yIqCMa24AV
	 eEokEP4EraJRfzWZGKGKF+FyHvWOCk6GCk9PFVWzz1KrD0oCMcjrEWuzJw/eFqlMkW
	 ksUs8QRVh4NKHqMCh3wivnhzn13MbW4km9jo5cCmL496eqIlWVxngRsURWH4VpHvcz
	 5naAFWKrRke0Q==
Message-ID: <d14e954f-d7ed-493e-bbbd-8a4bd780332d@kernel.org>
Date: Fri, 23 Oct 2026 08:47:51 +0200
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
Subject: Re: [PATCH] Connecting the SB600's i8259 controller rather in
 pasemi's pci.c than in pasemi's setup.c.
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "(open list:LINUX FOR POWERPC \\(32-BIT AND 64-BIT\\))"
 <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>,
 Damien Stewart <hypexed@yahoo.com.au>, Christian Zigotzky <info@xenosoft.de>
References: <20260701125941.906-2-chzigotzky@xenosoft.de>
 <202608142355.4AeDorvg-lkp@intel.com>
 <5ad17e60-7c02-2cd9-7cad-0c14896b8f3d@xenosoft.de>
 <aoFPwEi0iQRSmmSu@rli9-mobl>
 <9baed4e5-2bc2-c3f9-9a27-24f7ec8dcbd9@xenosoft.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <9baed4e5-2bc2-c3f9-9a27-24f7ec8dcbd9@xenosoft.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2026 18:49, Christian Zigotzky wrote:
> On 16/08/26 07:50, Philip Li wrote:
>> On Sat, Aug 15, 2026 at 11:56:56AM +0200, Christian Zigotzky wrote:
>>> On 14/08/26 17:42, kernel test robot wrote:
>>>> Hi Christian,
>>>>
>>>> kernel test robot noticed the following build warnings:
>>>>
>>>> [auto build test WARNING on powerpc/next]
>>>> [also build test WARNING on powerpc/fixes linus/master v7.2-rc7
>>> next-20260813]
>>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>>> And when submitting patch, we suggest to use '--base' as documented in
>>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>>
>>>> url: https://github.com/intel-lab-lkp/linux/commits/Christian-Zigotzky/Connecting-the-SB600-s-i8259-controller-rather-in-pasemi-s-pci-c-than-in-pasemi-s-setup-c/20260813-054214
>>>>
>>>> All warnings (new ones prefixed by >>):
>>>>
>>>>>> arch/powerpc/platforms/pasemi/setup.c:217:6: warning: no previous
>>> prototype for function 'nemo_init_IRQ' [-Wmissing-prototypes]
>>>
>>> This is the old patch.
>> Sorry about this meaningless report, we will improve the bot to check
>> new patches to avoid such report.
>>
>>> Here is the new patch with pasemi.h: https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20260801043458.12500-1-chzigotzky@xenosoft.de/
>>>
>>> Thanks
>>>
>>>
>>>
>>>
> Hi All,
> 
> is it possible to add this patch to the kernel 7.4 too?

This patch received reports which basically rejected the patch for
inclusion and we wait for proper, fixed version, as explained in
submitting patches document.

Patch also did not follow standard naming rules of commits, so again,
please read the docs (submitting patches) how to properly describe and
send your contribution.

Best regards,
Krzysztof
