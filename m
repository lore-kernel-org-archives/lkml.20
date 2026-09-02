Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB8F4A6CC0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362476; cv=none; b=mMg/CtM0qvicO+5SvLY5rJgp9vzEzrDEc3Vh6Pj6CwNT3L/oGeyK5zQlMBjZLGiZMHK0BJJvVahewcN6b6gNfCDPdUBwihoRNHLWb00V3KFNVu3C/dyCJPnnstVsivPuVMeKvOqgm6nDlR5L4vrb94Vs5Qw+CIevlv30sZCUiiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362476; c=relaxed/simple;
	bh=/Rwo4LDhZUjIbFRPjUjS6LJ+Dmkr6YTUn1svaPRl70c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUAxWxn/COhtneah9jlDVD2zJb9+/B3VI4oOoGMS9uBGZpp89HsvTQaG8oHzA5kEDwEL/qP26nu36FSL/Yh21QO3TAgj4Zl1Til+nIyhtYsPxrnr9UAy3gqggm42N4BX3I4A9z/JW9zO0d5EZIQd6CYO3C6npHkMM9b0/PsOdZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKPCuv5Z; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKPCuv5Z"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b4ae3e201cso1146436e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362473; x=1788967273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZnwvwUXRAcxB5889VVTWnxerlefp4zNk2iq52AaEUg=;
        b=XKPCuv5Z/O3h/3M7R1jhTtq90+RKO+Eg96kMSRwnbOnbOuFqpKCZwTA/em4+FcSE5O
         wdmkM44qzW0uwCbkjF1ZsCzF+EvRZH3CFNDDfyoUzRWUjtVaV0XfQPXJQHPbywxsxlkH
         I8oc99S1ZH4hLMOgo1S3mXkk8l+nBJpZGuXObgJpRXi7Tla5NNqaSrcsxKik/iBD4v4q
         0oMsG5tPf605ud+cGkgV8X89Gs78wv/Tjs3f2hwDorH5WGGG7q6TKhmnF+8+aqtq9A7N
         wBqLqdBvhTKntMa8X2B5cxTWXfPKho0vyBG98M4nNWMWO6y7QhfbLNXaGREy86Fiewwo
         0P5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362473; x=1788967273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZnwvwUXRAcxB5889VVTWnxerlefp4zNk2iq52AaEUg=;
        b=gMi1J28ImUQvBbt/MHGcVJWXOLiW0hnnUL+9nRMqmEj7YQK10fo/Zv8kJvfInP75vD
         YBPGZkmr/15VNj3GJo6p5nOP5fypKvIlVt/7Urjff7gwI9/lqDl2J1a9WU3GHPLcZakp
         g3h5QbyEVWqGEV5r/UynTWXCQ944c4rJYfY7M4zeNfs6u5cjVsEhJxdQPZMqsahlXJ6m
         C2zGerijUo8Uwkzt8ssH1jgxzuYT1MYTIxRSsZVcVqMb/cveXSY7hg1+I+uVaD8JXS9z
         sxUsCDooZA9r+w4IfbJcInUTGMA4Mn99Gftk0Gf/PiEMghVjrl3XFaxCxDLenK6x6foC
         iSOA==
X-Forwarded-Encrypted: i=1; AKwUvByZhWARNAoaQzXsZ10ceaGwGMG4GSn928ePmM2/ANYJm1CgJN7rEE31pD2i1yJTZI6H+nxotMo+C6wwsB8=@vger.kernel.org
X-Gm-Message-State: AFuF++kgUHQF39jaU/BDktFST0/kW9/nVqQIIbOBIChts2ThrLAEoHDO
	d/tUF3TGj/jobNPkIRUXYbid6eKkWVp+UegoPtRkJwem1fkwYPwSwp9K/ll9UPmT
X-Gm-Gg: AYBFou1V2uRkuXnSH6tSt/vb7/uO/3mITFeSKdfweMzRnGtLNOE7COrc5HmalI/QOAI
	TbVzFjCOu1STZ/pCqdQWGxm11zQittgMQmQcq+vxvm3pAGoIbya0ooEEZGVu/JQ+E9BIsrj3BsZ
	vRLhOqkGy3r5KX/ajNPwiX5me3cqD5TO3TMmhHd/Y2j3jzG7iwQuf8mDRGc3SHZrj/Ymlkzhq/t
	C50X8L+KljR24+taW4r2xFSVi6ugZ3msnQZbJywZeACMnhGojcjVvjuPLBHl/9X7Ljg1uikbcfj
	jiJMt+LRZtYRLsFOFd/maxANwYXSdcR0UHmwPAYPl7fxzHowESxUjIKtMiyrkRGP51nW0Ybm45H
	20d29FDvyFrJn6QtXSR5HdJ2euqNwW2OllDV25tjwpuNsOlMcxPHodZFHjtmI002vFa/XguyUII
	L2Mzag9KFwHDu2w+H3ALshgC56FyU1taARSngRcBHx0PIZzvQT53zagSK5psasVzuyiSjbpNRL+
	PD4wA==
X-Received: by 2002:a05:6512:6d4:b0:5b6:4ae:3ff2 with SMTP id 2adb3069b0e04-5b6095ff621mr1814965e87.26.1788362472358;
        Wed, 02 Sep 2026 08:21:12 -0700 (PDT)
Received: from localhost.localdomain ([195.149.108.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b23fa3sm688086e87.32.2026.09.02.08.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:21:10 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: Remove manual ifname allocation
Date: Wed,  2 Sep 2026 18:20:50 +0300
Message-ID: <20260902152051.2661-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2026090252-reformer-kosher-c6b5@gregkh>
References: <2026090252-reformer-kosher-c6b5@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 02, 2026 at 14:40, Greg KH wrote:
> After this patch is applied, what is the network device name?  Are you
> able to test it?

I don't have the physical rtl8723bs hardware to run a runtime ping
test or check 'ip link'. Sorry.

Based on the code path, since the driver allocates the net_device
using alloc_etherdev_mqs() (which sets the "eth%d" template),
register_netdev() will initially resolve it to eth0. From there,
standard user-space tools (udev/systemd) will take over via
predictable network interface naming and rename the interface
automatically based on system rules and hardware topology.

By removing the manual renaming, we stop fighting the core system and
let standard networking and user-space rules handle the final naming.

thanks,

svyatoslav
