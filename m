Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878049;
	b=JUbFGHoVlrryc1e1DSmLNsRlFgk9y2kZgrLsgv/IxlVoM5zxfEd+/ITo6r4RyUtbktS5
	 bbWH1tWgx53R6V+iMfoCCB8N0m4I8MMeZj6IR8eE3EcZMm1lZux9DYXvDQ3yETmZqiHCH
	 Z4/o0SXSLSTE3CajrpNhfGRCucnA7nilpHUjSEV9PqTYazbhECNGlLB2NqUjNy26JMEHh
	 /t+Q59Z6BjxVtsQbOehjOiZfAPQVmnB6fgJXfC3bGW2+3IsmN3HvbhWbfa+fJqFxXjWsZ
	 Pzpxp9hsqcYBa2/kGk5afc49MCupaX1llE9sNFzY0ROu3ijUzwC6vEbbtcN/GEO+wBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878049;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NQPVtiUOdmtprgIoq/7tkRrSqEY/EcD/1oU7hgjSWf8=;
	b=vfS3pEKRjOot274wP/26hV88hG7rmgKrmjH4hfXqf5J3j7lcHrUxFJfWX/AYZBXqBhiJ
	 bVkf8w4hPmZOWps8RSZnRAOImrk/L3MVXAlXKV8Q54eusRm6czE7hmx8vh1b/AXiu3/kE
	 XaGMvX+sG9iDmvW9GavO6GSAZxMkgG/H5NuIdam8j9SVr69K7nGFv/2kF1Vu0XWuLHZbw
	 aQmCxTIB2EO/M9vjKQ2o8vM9tYHrMOjUpQLNdOOjGsO0VQTh6OziISLnVje6d4nnJkNW/
	 AwYYSyTXZ1sjJYvhwtlmfUwB/RIW4ub+6yuChqdDegR3ZlFZTNmGXQMs++J6n0PJKUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=gc33LAXr;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E67606A323;
	Tue, 17 Nov 2026 01:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E67606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=gc33LAXr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=gc33LAXrFkd4rRWXqDEVVKO7Dip5KxuG3rBP3WMnfVrohVf+VIMtFeul8waYMdwpXKNiSqOjdzKkV
	 M28pfKxOfTwg7sO8fAkLOhv4gcDtv/D3FWlp303blJc9LvsEG2Gog8L1LjopeB9rMEZGOwyw46ZEH3
	 6BbMGTvgIihqO/G0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26afbaa560db-3f3d8;
	Tue, 17 Nov 2026 09:14:01 +0800 (CST)
X-RM-TRANSID:2ee26afbaa560db-3f3d8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6afbaa58828-9ccea;
	Tue, 17 Nov 2026 09:14:01 +0800 (CST)
X-RM-TRANSID:2eea6afbaa58828-9ccea
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: sti: hva: Remove bogus mutex_unlock() in hva_hw_get_ip_version()
Date: Tue, 17 Nov 2026 09:13:59 +0800
Message-ID: <20261117011400.1667-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261103013440.1138-1-laixiangwu@cmss.chinamobile.com>
References: <20261103013440.1138-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

gentle ping for:

  media: sti: hva: Remove bogus mutex_unlock() in hva_hw_get_ip_version()
  https://lore.kernel.org/all/20261103013440.1138-1-laixiangwu@cmss.chinamobile.com/

When runtime resume fails, hva_hw_get_ip_version() unlocks
protect_mutex, but the only caller (hva_hw_probe()) never took that
lock; the line was copied from the encode path which does run under
the lock.  The patch removes the bogus unlock.

Is there anything blocking this patch, or does it just need more
time?

Best regards,
Xiangwu Lai


