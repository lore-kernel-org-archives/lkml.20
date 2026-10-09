Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7D49D587;
	Fri,  9 Oct 2026 10:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541710; cv=none; b=tIlcXxC5n3TFQVrJOfq1pZeIB3aM6h5BZp1PeQPkXDnyC9Do1a73ZCKqnfqfY/tAI5biMigXSD0i12rmTwwe1OkTQdKv1yh1+SqxZhwRPWE6JCOwrASmFnp1OQkbesnHm3pSuCg0dUaPgnUdYWP9bV2HrTrBU38gI3SB5IZDFos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541710; c=relaxed/simple;
	bh=6/orAGLQ8T/xkFR4vLcFKBBl9wxHHrbquIJ8CKPL8Gw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kbdj715hN0YBPimV+7jc3vGZpakXCag+zCS086knbhFlJaZvCh+8t4bbzflrt2y0suhqmBRP3Drp+uxfwx56A6rYGaVENSL4YPlF9q2n7ZX/bxZ42GEnJ5CbKP15Ua5EHOuGZCMvws92be7d2Kr3Px+kEwWQUpuw7wROIIty9uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=Hurp+6Tz; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="Hurp+6Tz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TXy/x2NFrFNXGhmNOm+VJhp2BCypGZ7yjbSpgqjmtm0=; b=Hurp+6Tzwy1YNIAPo1cfOwy5Xn
	nH8lDYuJ2QoIO9RxbJ9q1fixFVHGZ7Y36yHj14bKTXK1PLB550MZyKFhhva+qG6Vdi+BRqJs2ak8D
	fdrwi8qHiM/rmgb1QcszVQl2gkKqKN4XSNyk/HjsZPsZbfCcFtveTCkS9n/RK0BcwEMw6nYYTqdqL
	7QEJAvXYB5zVbiyyomaLrohePcpPfDjXRP1byJ7klArP/CbUYSfAtwEH0y0TzNfQuHMHqGqumJdNd
	UME4jFCgFWu8xJN2AyeUFA9BGBO4Il8BZwXoMsjaqR/CVg2tyWtjKp89zm4MUuZUEb3dZHkmIrLjn
	6ErTuykQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:58316 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xF7pu-0000000BsVC-1T8x;
	Fri, 09 Oct 2026 12:28:18 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 0/3] media: mt9v032: Improvements from PHYTEC
Date: Fri,  9 Oct 2026 12:28:14 +0200
Message-Id: <20261009102817.2421388-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add PHYTEC improvements for the Aptina mt9v032 sensor used on their
VM010 phyCAM modules.

Christian Hemp (1):
  media: mt9v032: Support color format selection

Jan Luebbe (1):
  media: mt9v032: Add control for row noise correction

Stefan Riedmüller (1):
  media: mt9v032: Add get_mbus_config subdev_pad_ops callback

 drivers/media/i2c/mt9v032.c | 95 +++++++++++++++++++++++++++++++------
 1 file changed, 80 insertions(+), 15 deletions(-)

-- 
2.34.1

