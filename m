Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789102AE68;
	Fri, 18 Sep 2026 02:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697671; cv=none; b=RYm296ma8TQ8S7RYDeRVw6RvrrW+xGxtSXrJJQ0y0lnVIDHQ1syKYTjOxwmcjqRmW+rimCM0kj4rcjgOrA0QGTCs8SMvhYffEZctELsE3CVUC08buznZwN2xeKxz6mn13KmYdJZM4i6CS9VFysTeM+GWy7FY6MDngQYyKJqdyEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697671; c=relaxed/simple;
	bh=niN93rAd+GMr85+QGZ7HayTJiVAapuHOcG9jLiCvBuA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N4Cztv+N53C/gKVdehc0PDiijxZnK8TV3CP8ExThh+qQnpJT6eDYcCKGYq4XKqTA1rpj7GC7ftwwQ6iZHcwI+5ohGLvm16TopaA/oZrg/eTBHnbxM0krYwiAvMKU1cRyHIZOr6oVDnOMmx92oOjiQJBFH/beCIcz8zFMHdX9W/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=QUJli5F8; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="QUJli5F8"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68I2EKP303823523, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1789697661; bh=wvZANvGzmh9F5bllY/qp4dg9XRDXCdSUnWOB0mdXQPE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=QUJli5F8+E90TkQfh1rifC3z4+CVhFAS6PqkResb9WjFf0hdc2CEkkkz970hB8FDN
	 UW0O/ZH9XwAeUBwgsVFgmgMZ9bBXfuxNL7iO81Sw6de6rSEjV+RK76WFb3vVGPHtE5
	 bWO+vcfxuFkmoCGK1FGKv/UAX+6ixAftUu8JmgVmKovsFd4HfI1rOAnOI6p0/KIsrv
	 12bjAaBSeGvTQ6NiDhJ1Yxs65vvPnGHWLb5ofLJENtY5nWQDt3MXOmu0G02Zrf0Df6
	 z0wYUCqc5nU7nyFxvnvbZnRf1F+iLDzS7riRGEXM3ekp1JS/qKn6Ml/cfWmH0iJsXr
	 9u9y8HQDz0Qcg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68I2EKP303823523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Sep 2026 10:14:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 18 Sep 2026 10:14:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 18 Sep 2026 10:14:19 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Fri, 18 Sep 2026 10:14:19 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: kernel test robot <lkp@intel.com>, Johnson Tsai <wenjie.tsai@realtek.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: ld.lld: error: undefined symbol:
 led_classdev_multicolor_unregister
Thread-Topic: ld.lld: error: undefined symbol:
 led_classdev_multicolor_unregister
Thread-Index: AQHdRuta99v06zoV9UyIQIR254skCLbTmEzA
Date: Fri, 18 Sep 2026 02:14:19 +0000
Message-ID: <98a3ae2c705b4465b98c64c4b661ff43@realtek.com>
References: <202609172315.ZYoKvKBS-lkp@intel.com>
In-Reply-To: <202609172315.ZYoKvKBS-lkp@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   b5a051f6b840d48f159166ef073d3021989bfb50
> commit: 721d90c8509aee195c3714b70c4cff612fbb3a1c wifi: rtw89: add multico=
lor LED support for RTL8852CU
> valve board
> date:   8 weeks ago
> config: hexagon-randconfig-r072-20260915
> (https://download.01.org/0day-ci/archive/20260917/202609172315.ZYoKvKBS-l=
kp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project
> 6009708b4367171ccdbf4b5905cb6a803753fe18)
> smatch: v0.5.0-9187-g5189e3fb
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20260917/202609172315.ZYoKvKBS-l=
kp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: 721d90c8509a ("wifi: rtw89: add multicolor LED support for RTL88=
52CU valve board")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609172315.ZYoKvKBS-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
> >> ld.lld: error: undefined symbol: led_classdev_multicolor_register_ext

Thanks for the report. This is because multicolor is kernel module

  CONFIG_LEDS_CLASS_MULTICOLOR=3Dm

but rtw89 is built-in

  CONFIG_RTW89=3Dy
  CONFIG_RTW89_LEDS_MC=3Dy

Correct the dependency in Kconfig to avoid this case. [1]

[1] https://lore.kernel.org/linux-wireless/20260918021113.25481-1-pkshih@re=
altek.com/T/#u


