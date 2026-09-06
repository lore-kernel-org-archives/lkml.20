Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816F83CE495
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 23:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788735639; cv=none; b=FUPAYT90oWPXD/8Nvx2HcqvXZh2pIzRx7dJEttKCURYguHjA0zyiPEUkTd0VzXkrX0VmSFDOE49CJihTHXqnIGcKKmp4wUP7g65Nq/GQLI27GDn2HGSH9QlgetPRvtAxDLWTN4jirXtEFBgJi/mlo1aGpilBStkgKxVqVJxUxU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788735639; c=relaxed/simple;
	bh=OoqW51NcndbaQSGiIVU8Ya5rJKCis+Gi9XY3OSSexvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltxv53oq3qyeZRMRD+C6zQX8JEpNi8oI4rZyH6VfIt3FlfPkeaLi76c7Qo4KYEztyKa4lMsmIXUcluxAPCdotBh/gxti43jlQ3N4SxqQtAYZJKl3hUlGwzLsqGjZulmxvq7V2Isy2I8N4km4BgvV4J0Cb1DdW7QK2+BdSHbx+xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hi7r48zZ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hi7r48zZ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2566so485449a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 16:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788735636; x=1789340436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoqW51NcndbaQSGiIVU8Ya5rJKCis+Gi9XY3OSSexvk=;
        b=hi7r48zZBbppeJY0dLrbZ7V7YozEdTXzeP4lcedoX5gmfTemT+NPFB/uXp5KYy93xu
         34rgD8BNPoTBdh9V3XS03iRq4a5mLGYYdgEuAjJGlr7/JtQs4uMeXtsukyJydh/0E95b
         MV3vegNMA9r/QoZLDtF9/SJft6xuZXIM8p7l0FeAyvimRftjWttLW1IFKEif+gedQdOC
         y6aKFVd0F1y+m2SlKRwhXpDmCoWjUq2ThCNFzL0QBtkEXdjYVTe350sh3a1agSzGbS96
         BVYOf/pZS/Kxsi3SgIMPbgiIVyC/1lxlLsnFXSshVjFR1MMVejo43T0RVXchD75gRkD/
         yulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788735636; x=1789340436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoqW51NcndbaQSGiIVU8Ya5rJKCis+Gi9XY3OSSexvk=;
        b=s+hqHyylPrNHLpYvaxYJkp+dPpJcEiKuEIesbjO5kVj7x7fPPv4aYt00WsbicF8whb
         zbZNOdWzXaedGGXfSUAsDCMjtaKEKAAeNTJdQA7A/Bh9/QMyRmZbaDkba4+dUHsdHEkn
         nXl9U115Y2tgWm/dbo/hkdWyM90CVTR/3t0vgHChfwBw+rBeP84XyXZRxIn65sNY61XE
         OI6bIkx/t5fa7MsQizVwoPb61D6TQaG9+Ugwwcmxt0O9FtLC2zMi88ZVVs3/6QEEOBsZ
         gHBSqEVxraHIOebRpiq5Hh1tPeJ9+ZLPF7wEmR8e5T/mlmDedwbxLUD/PHwZxf5VxQUT
         ai0w==
X-Forwarded-Encrypted: i=1; AKwUvBycj2gKK5Jt6F0k8xvWM3mECv5r0doZUxXPJUHtcCBEpZ4axVAVmivFa1zZ93pBtNnPfd0SLZYGVvIDwt0=@vger.kernel.org
X-Gm-Message-State: AFuF++l9zvbJwQvSe0F8CnH7KSKR2Pk6zNHPAZJmZ6wMGWyyMKvIvyHQ
	K7kaOoyxQ5IpICDrNr9kWCuikpYwDGetBUpJ1N8KbrO/UYmQnde3RNk5
X-Gm-Gg: AYBFou3caFxitLVnWyvLEATIUlWW+MvoxCS145SLnS1qWWfpf00k1bSkI+v4vCT2gQ7
	ysVgFEudxFSw/CDygz1N5NA3tIqgSlK1b9M0lrb+t+yLQwhHyK/g3EA5TnBmAhOrvLjZ9vo9tN+
	oH359AAuIkvP+4tFxMSlrjV6QUf0DLOYvbrc298aO1zzDMKVxGFw0Ax3IWlFF6VAkjba7rbxgN+
	rVO2NOWn40Uk94Nqtn5X4FVWOC8JavnU6+cxn30Yienxe+4zcrJ7nEsWj5QxyVrB11+6cyS2NB2
	wq3gBUMh217vPURlffeZar7+UnWQBYBzXUpJJF9Rkmr8RIryqYuwh72Zx30ktcC4gv9FKLv/uib
	X9fyAoh1ct02Jz60piXjQ983thdVVgPlC9FiW2x7vkgXCmPKJy84I5/zo19r5WCHBUwnSFHurwy
	dP3L2pBZJ3amizbrWVf4lee5+UCo7HM8MQDPyC33ObY0w64h3MVNeMTu0h9qnbgsz9o7aIOkQI/
	/Tb66dq6OttRcUJtgT02Rcf/KFRyg==
X-Received: by 2002:a17:90b:2786:b0:395:4df3:8800 with SMTP id 98e67ed59e1d1-39b3d3eb82fmr11742650a91.0.1788735636298;
        Sun, 06 Sep 2026 16:00:36 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm22359551eec.9.2026.09.06.16.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 16:00:34 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: linux-wireless@vger.kernel.org,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Nika Krasnova <nika@nikableh.moe>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless v2 1/3] wifi: iwlwifi: pcie: don't infer CSME presence from a failed read
Date: Mon,  7 Sep 2026 04:30:22 +0530
Message-ID: <20260906230022.148733-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1a2c11d47b27dfd8a246300ac158d25cef5abf35.camel@sipsolutions.net>
References: <20260831130332.323549-1-navonjohnlukose@gmail.com> <20260831130332.323549-2-navonjohnlukose@gmail.com> <20260901154828.GA1879052@bhelgaas> <20260901161736.GA1883420@bhelgaas> <1a2c11d47b27dfd8a246300ac158d25cef5abf35.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2026-09-01 at 19:02 +0200, Johannes Berg wrote:
> I believe the hardware itself never generates ~0, so yes, it probably
> should use that.

I'll switch the tests this series adds to PCI_POSSIBLE_ERROR(); drv.c and
trans.c already include linux/pci.h. There's no non-PCI transport to
worry about: Kconfig depends on PCI, and iwl_trans_ops went away in
0d91a2bfc3dc.

I'd be more careful with the helper itself. iwl_trans_pcie_read_mem() and
its _no_grab variant run it over dwords they're copying out of SRAM, and
~0 is a value the driver writes as data (FW_CTXT_INVALID fills unused
binding and quota slots). iwl_dump_ini_dbgi_sram_iter() is the sharp
case: it gives up on a single hit, so one all-ones dword fails a whole
region. I haven't seen it happen, it's just what the value means.
Widening the helper and taking the SRAM paths off it would work, but
that's more churn than belongs here. Your call.

Separately, the test at the top of iwl_pcie_irq_handler() (rx.c:1948)
looks unreachable: inta has just been masked with at most
CSR_INI_SET_MASK (0xBA00008F). I'd move it above the mask, unless you'd
rather drop it. I'll send that and the PCI_POSSIBLE_ERROR() conversions
separately.

Thanks,
Navon
