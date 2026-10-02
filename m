Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7054944A417
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929779; cv=none; b=U3jnLpT6MMnp8gmkDnQtnMwES32YyiTTBH3iVYk8Q0nOLn9mEJN3rWyRUoXtfvqrzO+xWQZfNxaM+oHs0X3BnV3vRw+ryF0RcSx3BD35dIZqmrq8tYNQcA/yFLWL4upkpgFHuG/xP9CWP3rHaPyxTi2khAVr+K3DAo0DLR2f61A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929779; c=relaxed/simple;
	bh=4fs/VQZKtb98+M3k1wMj9HBBcIArXcqoyONJWXODarI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+aZRKqa5QVL5UbUDmdBegNsYXmmJ0WGraHFLP2tNgWEDfytEwQx9ePq8aaZs9h0u2nD1R/fC/NdxDLpG/GL/JVdTb7E02BGLYOehDob/9pjpPiKuX68EvGYuV6R6LFg95vk8IPeBQEec7GhW+GgaDRMs1qZ1POjQz5LTth2O/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6Gm9VT3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6Gm9VT3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d391aso56176615e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929777; x=1791534577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HxFyK1o2cNI+UQbuw/QFce5jwNiOPgdR3iM+OqmqoDs=;
        b=p6Gm9VT3VFUcTbQMFn99A2tQcwrShXNDFqwAHoFUfwZkeIxC37ZcuvuF6brPRC65V3
         vqUW5OXP16Qpl4xjMqpchCGHDLlQgr2OGm4DoiVRelacW3Pg/tXtc5GR71fiqjs1CH+7
         hZqt/ddk9fu++gvBYTC7lhGlWiB4suMZa7lbnI6Gfrl+IoFDQKmJ86W177U/cGHTBGJP
         f+9psgxZBJmjXaBAvXxDC5VQWaWEjTYC9e76EZuhOtaRDx1V1o31RIbNqc8EClbWNlMr
         CST6sx2TsCnXwyylmmtEgv58J2YLxvfKp0Mgm3nQYcDQb2c56QvFHDHQL1WDRqFPCS5/
         T7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929777; x=1791534577;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxFyK1o2cNI+UQbuw/QFce5jwNiOPgdR3iM+OqmqoDs=;
        b=0aP59j4b6UI9S8uH7XXu3AVo9IktCe7Ss2hETj+fIOgo4lewK/qH3q0JCZ/Hc8trrJ
         GgtsL/1fG+PG9K866n8fiLUVBGx/NspwHMdPPLAkzYFaHUXKlEO/XbJt1aS8X0Vo8UtD
         wIHOReifqQCSYvpXXHoPc5ZJEGttAugvf7G6O+jeZKgVy8ToqsdkdcH6TRMeGG1qkgZX
         mcNNj28vZzkJ/OGH9vS4XceL8SULG5KMoHU7ayZ+ED4wfU6dvjNkksqpFjyLZkqAtaPo
         /TrTgNLsOSKAyEn3VTkUGLHo3ZrOi6qLTSJQ8YYzvxk0ocStwigPTayO9PFrhMjd/k5h
         ZuHg==
X-Forwarded-Encrypted: i=1; AKwUvBzk22LkZzqDeF1PSGGMrlCzGqtpVY2wdwaGycwfEgoEi+tOCLe38HEYW04ttSBtBu2YLNyiUEFsmi1V9QM=@vger.kernel.org
X-Gm-Message-State: AFuF++knLLwozQu+CNGlGb5+AYcP0YaDnc3BvLPl9zwQLrn7O9jpAoVu
	Sj8YaAEvK/YJS6BJtLUunPYaqlWtb1MqvW/fdqUms7NZj4KVhcgCjaws
X-Gm-Gg: AYBFou16py4mu/jZOqkjoXslnjosbgXwXt3ny1dMVqc8Ez84LLmFqN+Ux1Gi01QYohF
	dCLC1UyP/wfFNGJqjfS90hip7VbVlOSvOd9HxRvUe2i1kvOVGSHftF4QGpJh7DiX3lVQI4X5gAM
	2Mv5koMQUkA9NTja0ouP/VwlOKG2VtlA81e1YbylQb3+Iz7KBfln+7VeszpuNJtoVn9rqb2x5R6
	OfzX66W58zMZjdGf6Y5VkcAAVFAytNO5ZGtu1SEUTvZOmJ3nse2/2Y4FpIv7v32BDm4buTZ0MqA
	8kcXPOtGltMMNFIPodlihfdB+Y1u52WezMHUGX1O1WH5eL31/V/6Qqjh6/2M+Fok7kuy9qHaKBH
	RizFo53H1zJJ3NmOr2LR7vOSuTwIoNo/NQjR/eJimBk3Mby898HzCTmOC6ymHPjXSheauQIQ7e7
	pGf27GgKogfTDDOT70wCvudcom2NDdOnfGFHMtMiKkR3VrXJ86JsFhIN7k10prsq7+slUFj0Ca1
	Cy4oo0iQA==
X-Received: by 2002:a05:600c:19cb:b0:4a0:98c:e082 with SMTP id 5b1f17b1804b1-4a02759fc4cmr37942775e9.13.1790929776330;
        Fri, 02 Oct 2026 01:29:36 -0700 (PDT)
Received: from foxbook (bfj133.neoplus.adsl.tpnet.pl. [83.28.47.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm71100105e9.8.2026.10.02.01.29.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 02 Oct 2026 01:29:36 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:29:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: wenxiong@linux.ibm.com
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, wenxiong@us.ibm.com, Brian King
 <brking@linux.vnet.ibm.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] xhci: Reset controller on xhci shutdown
Message-ID: <20261002102931.3cb06009.michal.pecio@gmail.com>
In-Reply-To: <20261001222527.11742-1-wenxiong@linux.ibm.com>
References: <20261001222527.11742-1-wenxiong@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  1 Oct 2026 18:25:27 -0400, wenxiong@linux.ibm.com wrote:
> From: Wen Xiong <wenxiong@linux.ibm.com>
> 
> Fixes kexec boot. Without a hard reset, some USB chips will fail to
> initialize in a kexec booted kernel.

What exactly happens after kexec?
Why a PCI reset in particular?
Are we sure it's not a bug elsewhere?

Regards,
Michal
