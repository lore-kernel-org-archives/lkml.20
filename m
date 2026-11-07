Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074770;
	b=fstIkXQq/VVOTuWjuekSrplDvv8LLtcIbPM0g9d6g6qUE9j9h3G0GAlH2HYoVGzjw1jh
	 q6l6RSpXFg5lgnH8G+KLQ5PjoAXjoyq1tgPUw2JD/Wa25OmK7KDQJTmrn7vTs0uUo7o+0
	 bQm6Je6JTv8xaJOiUvthEuR/mG7GGCqfePKoT6GKW8FEEld6vfMFWdNa8e/cESKK9jeC5
	 /V8PJH0paJID4eDhgo27hRfHKzX+HmFrUtTYuE9/C5NIhQsWiiOiGCOB/mnl+BzLDuk+B
	 NUJ2QsRc+nLhoKnCtV2MKHfbxGraNO1gxELufEKgjclU6r1QchbfQdc7iYTQaHDVpYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074770;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pqjxgeb2LvNzA5lyIDyXZ22UP4O9SLF5sZs86JhTX4g=;
	b=boSEHUo2D48DmahRyFZeJhUTs8pRoASOHdBHNN4YmmAyUp6ln+5mHTaG7YC67cjRXdIe
	 eOFV9GE7u0KhYDbJNfGt9Lk0YQioyMG31bhiFMz9aPbrj1c39SoR2W5F2Ae+9iiFsAq/r
	 c20Ze8iE6nRqUubhlR6fA/afBb5aLasbcTu8CnfXarGT51dyjAnznHzP7L6Ye98lgyPaF
	 zMjoe65Ug5wyVgU34VmXt7M6wHbZN27HhSJyG1qWvl7/o2oNr4iRbWxzR4EBinzFkHmp8
	 pD2oysDnEqDgtuhRqdnu+l2LxtSxmxTc53EYg9uVMh1eGnP23s3h+jQxaU1V1tD2yJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZHsiN0wz;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750A7606A32C;
	Sat,  7 Nov 2026 18:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 750A7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZHsiN0wz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794074767; x=1825610767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QUH3kL1d5cW8qdNODM5EpH+O8pqgfABidKcSlg6biNw=;
  b=ZHsiN0wzkGI0Q5h811ckNneB49tkXxR7hCJZu4Pm8IbH5dtqudXZ+WKI
   GlBESLmrrwmlXkP8rtHMkfmbhtnAHFgnZXvM1hJMyyyzPlvpb0ojt6iKj
   DZg0p6VtUdhXoOPKZ8mPnD+rfAsImKaT+j6UI/aKP3IYSClhyFQFHZcqb
   W9SSAGfL4EUUSxkIGyc74yzvJCkpRrtEPt9kxsjQa9opetT2+I55QSFkC
   SJb+DzfcmTLlZLFcCe3XMrrCLneIgvRkAmyFw17JQAsmb4Ehb9K5KSUTy
   dkModbb2PZY/8ZUc+wNhXaPJVI5XVu1TkTlueXYFMZLeOiG4Ou8QcCx0/
   Q==;
X-CSE-ConnectionGUID: pI6FogRKRDSV3OrWIRLn8g==
X-CSE-MsgGUID: 8e9TIBR0Saad3nqF5skYYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2906327"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2906327"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 10:06:06 -0800
X-CSE-ConnectionGUID: VJXgjaVGS1mBFaTiUWSFdQ==
X-CSE-MsgGUID: G87rpHNQTDSdSsZyvVi+qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7421238"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Nov 2026 10:06:04 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPknh-00000000rM3-1fFq;
	Sat, 07 Nov 2026 18:06:01 +0000
Date: Sun, 8 Nov 2026 02:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	gary.yang@cixtech.com
Subject: Re: [PATCH 2/4] usb: typec: add CIX Type-C PD controller driver
Message-ID: <202611080223.qvA6HnF0-lkp@intel.com>
References: <20261107011012.3655873-3-gary.yang@cixtech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107011012.3655873-3-gary.yang@cixtech.com>

Hi Gary,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-usb-add-Realtek-RTS5453H-Type-C-port-controller/20261107-091009
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261107011012.3655873-3-gary.yang%40cixtech.com
patch subject: [PATCH 2/4] usb: typec: add CIX Type-C PD controller driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20261108/202611080223.qvA6HnF0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080223.qvA6HnF0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080223.qvA6HnF0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/typec/cix_pd.c: In function 'cix_pd_probe':
>> drivers/usb/typec/cix_pd.c:628:17: error: implicit declaration of function 'irq_set_status_flags' [-Wimplicit-function-declaration]
     628 |                 irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
         |                 ^~~~~~~~~~~~~~~~~~~~
>> drivers/usb/typec/cix_pd.c:628:51: error: 'IRQ_DISABLE_UNLAZY' undeclared (first use in this function)
     628 |                 irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
         |                                                   ^~~~~~~~~~~~~~~~~~
   drivers/usb/typec/cix_pd.c:628:51: note: each undeclared identifier is reported only once for each function it appears in


vim +/irq_set_status_flags +628 drivers/usb/typec/cix_pd.c

   587	
   588	static int cix_pd_probe(struct i2c_client *client)
   589	{
   590		struct cix_pd *rts;
   591		int ret;
   592	
   593		dev_dbg(&client->dev, "IRQ %d supplied\n", client->irq);
   594		rts = devm_kzalloc(&client->dev, sizeof(*rts), GFP_KERNEL);
   595		if (!rts)
   596			return -ENOMEM;
   597	
   598		rts->dev = &client->dev;
   599		rts->irq = client->irq;
   600		mutex_init(&rts->lock);
   601		mutex_init(&rts->irq_lock);
   602		cix_pd_typec_init_state(rts);
   603	
   604		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
   605			return dev_err_probe(&client->dev, -ENODEV,
   606					     "i2c check functionality failed\n");
   607	
   608		rts->regmap = devm_regmap_init_i2c(client, &cix_pd_regmap_config);
   609		if (IS_ERR(rts->regmap))
   610			return dev_err_probe(&client->dev, PTR_ERR(rts->regmap),
   611					     "failed to init regmap\n");
   612	
   613		i2c_set_clientdata(client, rts);
   614	
   615		ret = cix_pd_init_ports(rts);
   616		if (ret)
   617			return ret;
   618	
   619		ret = cix_pd_event_handler(rts, 0);
   620		if (ret) {
   621			dev_err(&client->dev, "failed to read initial status: %d\n", ret);
   622			if (ret == -ESHUTDOWN)
   623				ret = -EIO;
   624			goto err_unregister_ports;
   625		}
   626	
   627		if (client->irq > 0) {
 > 628			irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
   629			ret = request_threaded_irq(client->irq, NULL, cix_pd_irq_handle,
   630						   IRQF_SHARED | IRQF_ONESHOT,
   631						   dev_name(&client->dev), rts);
   632			if (ret) {
   633				dev_err(&client->dev, "failed to request irq: %d\n", ret);
   634				goto err_unregister_ports;
   635			}
   636			rts->irq_requested = true;
   637		}
   638	
   639		ret = device_create_file(&client->dev, &dev_attr_disable_pd_interrupt);
   640		if (ret)
   641			dev_warn(&client->dev,
   642				 "Failed to create sysfs attribute, ret = %d\n", ret);
   643	
   644		device_set_wakeup_capable(&client->dev, true);
   645	
   646		return 0;
   647	
   648	err_unregister_ports:
   649		cix_pd_unregister_ports(rts);
   650		return ret;
   651	}
   652	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
