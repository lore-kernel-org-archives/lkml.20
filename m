Received: from mail.amicon.ru (unknown [77.108.111.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C56F379EF5;
	Fri, 16 Oct 2026 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.108.111.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168079; cv=none; b=NO2FY8Gzd0h459bewl0dB02htWuTEcbN/uFJ/Q+mdciR9Ey7L2U0B7LRQa507kyxm0Uq09C9bgnsdyXCeCIs3dcy/+MwBeOeOVk9EGSj7RNrfPy5lTATXRBDQsyZnOc9Kkszygcm/0R6ORHgvRRK7zLEvZh7TylHfNmXYehpQ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168079; c=relaxed/simple;
	bh=OqVW22h4KxufiNg2doJZMSp71dJ71zs9kRuX2gHd2uY=;
	h=Content-Type:From:To:CC:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=ekzZXGViUtmv+09Xxca1zbrEBaRSJtb/7Yf34K2moMq6CDUYUBL73nX4oyHnBkHXLvhrXPQXAlIGIvA1kp2dXiBoqEE08qPA73YXC4A13afqnCdBBtLufO5uCkOzyUWKrgndDfG8K1CBhD35CwfBYa8vqrKf29hcd368BF0C8b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru; spf=pass smtp.mailfrom=amicon.ru; dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b=UK0+Um+9; arc=none smtp.client-ip=77.108.111.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amicon.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b="UK0+Um+9"
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=amicon.ru; s=mail; c=simple/simple;
	t=1792167162; h=from:subject:to:date:message-id;
	bh=OqVW22h4KxufiNg2doJZMSp71dJ71zs9kRuX2gHd2uY=;
	b=UK0+Um+9S8b6f03tBf+N9zlMZpUxzLcVHaiqxdOSTwoT4eN/bUJEGFrpCqIA8kRMqxawIMxfOwC
	oipOKyJtWYsf1m05ZtHNNdTjpqcoanuG4KlN1hqRCk7E7e1O39ZEFuxT9FKGzIs3fVdcd44wh992d
	Tq2p25L0KIqtt63skr93oWtKyPz2LN6NsO8I/kori4idc3WUFhk3WSGyK2scwCD8JanMVqawmsv1R
	At22K+4VJraS0QL0QZAT8XoUSYehORXFzSI012E++MqFeQP9pq3t+as73WFLboahpGZWYV+gWdXfI
	Ysm1lGAOtjH0UCjRPt+1ssdOlnrdylJVPiMw==
Received: from dish.amicon.lan (172.16.30.10) by mail.amicon.lan
 (192.168.0.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Fri, 16 Oct
 2026 19:12:42 +0300
From: Daniil Iskhakov <dish@amicon.ru>
To: <vz@kernel.org>
CC: <ade@amicon.ru>, <dish@amicon.ru>, <jacopo+renesas@jmondi.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<mchehab@kernel.org>, <mripard@kernel.org>, <rrv@amicon.ru>,
	<sakari.ailus@linux.intel.com>, <slongerbeam@gmail.com>
Subject: Re: [PATCH v2] media: i2c: ov5640: Fix potential integer overflow in sysclk calculation
Date: Fri, 16 Oct 2026 19:16:10 +0300
Message-ID: <20261016161610.367524-1-dish@amicon.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <31a68e05-0200-4ef9-b31c-1f0e4ec1def0@kernel.org>
References: <31a68e05-0200-4ef9-b31c-1f0e4ec1def0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: mail.amicon.lan (192.168.0.59) To mail.amicon.lan
 (192.168.0.59)

Hello!

Could you please tell me if work on accepting the patch is still ongoing? Is there any way I can help with the process?
---
Best wishes,
Daniil
