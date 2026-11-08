Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794170694;
	b=M+eYMnLlvvapjsfrcJJ8MxCh+EHM27Xu4xLSkgYDuMV9VqqWq4hV7tAJEjWBX9BEigme
	 15hWfk44Sjbx3k8z9Dwg9eoZbTtBdBJPcRCIsm5BoTqXEeerXD93D7CtjwqiPn8+lRDAH
	 bkXW1jTyrn0fKzNSYrR2Az1wqdeThkgXePAzxhLOauwTMWhCLqtNDui1bml0KZ32wLaGP
	 i/pYyMt/bS23XIxcw54bir5MaART8Od1QfqH3GeYY9V14izhNP+ZGfBf8UIf2D+6bSBe4
	 MygKPx2OwNRgwcYGQRBTA7XSSQjje7B0nI7TgZsuSDEix2D2nY0GguJoHAZ34tx4PTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170694;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=3NL27Sq59fgusG50w3jb4xrhXjLZpM4JpXEngiqJdhs=;
	b=Oj0t9wfspyoecUI2obePuc0azHMjV52V2nMI43/hDy2PUliq1Y4o2YjEKTrEJwgd6n6z
	 MKHN1ZhfsqUIYxXmr6K57viHECaWOqzpd4wivRlxqFaZj1YgOhyFdAe+6tKbe149nvJSr
	 6GN9DBVULVKPCLVZTwAuvF2mFeMVsygWwu7clWLctWw6fVb0iT0tFSelhMocmQ2KZFZWQ
	 2Toy9kH00yvFrKr//nvrvADJ/5VHdLJbOfbjJAQMV8l7Dv55+5BHpTC2t1k7X9u0U9swr
	 CcdLWssKiBWvqZ62fJa7+Uah+N95t+o9VrlUyk4nXYlb6x+fqCrrnz+TUGYvyuBkftw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ikQriAkL;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C609606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C609606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ikQriAkL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794170682; x=1794775482; i=w_armin@gmx.de;
	bh=3NL27Sq59fgusG50w3jb4xrhXjLZpM4JpXEngiqJdhs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ikQriAkLoqeP1/zAMVA+3LJpeimE0FwWe0MfP7CQdhV7QSFleXm09lEtAgMUE+u1
	 zi0XYFY+Od/F1mOUtEO4pOMp3kM7ii7Oyt2iiBrsaXqSB8GD4vWCmGJqTCiwddzOI
	 gM53bHL7NksU5cpCibPNGY3M1eOZTnN4gKZZ5rtUgXJMOQPKXtZOyn2mEk7+Pj254
	 h8mNSUO1CWcG6MyO9Kz3MhMAxLLjpnWTCswxV/BMkeDKQtxxdsJi2s6E1XbCWXKWZ
	 tE6Qyb9w0uIaEQFO3NmtE2jYBMilEMGcM0fANJYKggXo5AtcMmyQoNrsUd3vpMeXc
	 Jza4uaBsy90UjhDF7w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZkpb-1wxDxe3SCt-00QFpJ; Sun, 08
 Nov 2026 21:44:41 +0100
Message-ID: <77a55f5a-c040-4682-9c68-0acd18be97ed@gmx.de>
Date: Sun, 8 Nov 2026 21:44:39 +0100
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
Subject: Re: base.c:undefined reference to `wmi_has_guid'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <202611080829.SRhOjp4G-lkp@intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <202611080829.SRhOjp4G-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:65jeJO5afHr/+43CV6DEE5F6JisuXF0DPK0zALbHLbT8npBLtJ4
 JVoE6ULCv1uG9uvGcGRwcfCu6MZt/L9zbn/BjjNAj3nuzIGdN1lV5mOn35oX488E76qb8b+
 fP9X4PpZ/EoDXag8QgXslkTPQsu9Am8o1MSTDEvdg/h9pFsZrH/cv7yP0WNTer3XCrflPGb
 G8pJUsqzTUgSga5RcPQhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DeL4B4uG+EA=;Pfc5vec3U8dmS97kJA9iYO+ritB
 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

Am 08.11.26 um 09:00 schrieb kernel test robot:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   fa4ad798f6f681031775266044ba1b0cf3c670bd
> commit: 884d53763d304af64a9b795161f9fc3b83a5e3d8 platform/wmi: Remove dependency on CONFIG_X86
> date:   4 weeks ago
> config: loongarch-randconfig-r2105-20261108 (https://download.01.org/0day-ci/archive/20261108/202611080829.SRhOjp4G-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 16.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080829.SRhOjp4G-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 884d53763d30 ("platform/wmi: Remove dependency on CONFIG_X86")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611080829.SRhOjp4G-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     loongarch64-linux-ld: drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o: in function `wmi_wmmx_mxmi':
>     base.c:(.text+0x68): undefined reference to `wmi_evaluate_method'
>     loongarch64-linux-ld: drivers/gpu/drm/nouveau/nvkm/subdev/mxm/base.o: in function `mxm_shadow_wmi':
>>> base.c:(.text+0x1d0): undefined reference to `wmi_has_guid'
>>> loongarch64-linux-ld: base.c:(.text+0x264): undefined reference to `wmi_evaluate_method'

Hi,

this issue should be fixed by: https://lore.kernel.org/all/20261107001330.403365-1-W_Armin@gmx.de

Thanks,
Armin Wolf

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
