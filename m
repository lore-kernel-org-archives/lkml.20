Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055660;
	b=q+Aie5l9UGgAqje2FdJs81PEdbSgERFgURwOY2H7+tUkTa+lTeJV+KIAVwN+PD/HpPPt
	 Wvhitolq18ckprKcMRvbYyQSyVX0aneGoxSRk+7A2/rgPbZQmNHl9CCDRncGqmX60Od9E
	 +yp0S5G8dgyy+NpZjD4F6cZUdFMFgMIns9P/CRFS5qCjvvKfxEKxYbaB3Epve9bj6tc8B
	 JsYFNWI+eRobD02XHjoGmMnSEAXlmDp8Cp+lvsy3V31ao6Rmi2LD5Jhv48tgkptI5qeD1
	 DPr/x0nVqi+USflQM6N618acnu8HdT8mTBItmJNnk9X/PrtY6pibgaCEG4talWuurbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055660;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ZS1PHJd/1kfglLt+YTBZHOFCcwN5pAQrZFvDsEPdmWI=;
	b=05oMTgGdjRKkYNVojNqoPJfsnIlLZNnPjhIrg00bXX2egCUJg4Zjdl9k5GNWv9C0Xf2z
	 n2Hki9f4mw/vrgvj+RXBZHKy6w27HvhmTIRfBGiNEiD0XNseRjGoT6jWJeMuFYj6WLpv6
	 NlikWZGJR6mpLoOkGWkPBB+Zwx9YkadDiF8Xku5O1cQC2bPKdxY4HwBNk4tUalRX7De4/
	 cJ/DjHzARqnc4f3oBqotsGiANNZi6093JU4NSkcf98zEUuT9mPkjygsKAypXxHdeyUCms
	 Q6AthxpfO746XAtgWGtKZs7907C7+kju89YCPokwFyR1srPbnTFHRa8OgKlDqLEhMiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=2jM83HXB;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E28606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E28606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=2jM83HXB
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id LSjfxkxwIusRSLTgZxwEWr; Mon, 26 Oct 2026 23:01:00 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LTgZxj2l8oYFCLTgZx9RGM; Mon, 26 Oct 2026 23:00:59 +0000
X-Authority-Analysis: v=2.4 cv=b4Cy4sGx c=1 sm=1 tr=0 ts=6adfdbab
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=Sy_gwa-xmTSU6y4k134A:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZS1PHJd/1kfglLt+YTBZHOFCcwN5pAQrZFvDsEPdmWI=; b=2jM83HXB819/h3xM9KjgljF/9n
	vL2UCLcg9ZQhTotDPoROs33v2zgPEpqR1FAuAaPhl8HH7Vvn45Q2NGKWthn3/S8ttfDtgv95ZRfHo
	MnxjXy41RHg59ViklqyAaS6yWuVN3PaW+dnjBnHBmg3feGGI/dkm/epTXwfPjZ1X9SkVi+Bziyb/S
	XlBAWZoTUzdxdvMII3DZNMTU5WQnv7bPWUL7Ev+x1qA+BqIpcfPH/LwMCOoQ4GkWaRKU1sjH/i+/2
	JcZybELE0P9vbERM3XUdgFrvuWq5vGR6e/13oHONEYwUU9b8bRv30nUZuTxDZScL7IBav5kctQVgB
	1sIcCFAA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48364 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLTgY-00000004JNJ-3Igt;
	Tue, 27 Oct 2026 04:30:58 +0530
Date: Mon, 26 Oct 2026 16:00:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: p.zabel@pengutronix.de, Sergey.Semin@baikalelectronics.ru,
	mika.westerberg@linux.intel.com, andi.shyti@kernel.org, iav@iav.lv,
	tzungbi@kernel.org, wim@linux-watchdog.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] watchdog: dw_wdt: use
 devm_reset_control_get_optional_shared_deasserted
Message-ID: <ae899e5f-dc86-4fcd-a706-b096ef766c38@roeck-us.net>
References: <20261024140854.25664-1-a.shimko.dev@gmail.com>
 <20261024140854.25664-2-a.shimko.dev@gmail.com>
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
In-Reply-To: <20261024140854.25664-2-a.shimko.dev@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLTgY-00000004JNJ-3Igt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48364
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIWavC/Rr8crCpzTUgEnnMB/BiqR980DUardfeoezFo2zXqT2c8VNFf4jZpaV8IrHn2rIJ75kPRUYYIO8GNfHYrNJwWu9BtNYPdM/KhHlYZFuMhR9es2
 qG6cDL/8z2LquOr9mFnAAIdhQgV5ZJGh5pZm0fniD1R7+EXE+4epSlmFJwwflnk2VPQ0b+hDGCjQ5K7nrJRiSmEQz7L7r9COYAi7ggOlx7JujLFrUhEVxv3e

On Sat, Oct 24, 2026 at 05:08:50PM +0300, Artem Shimko wrote:
> Replace devm_reset_control_get_optional_shared() with
> devm_reset_control_get_optional_shared_deasserted() to let the
> device-managed API handle reset line deassertion and assertion
> automatically.
> 
> The driver currently manages the reset control manually: it calls
> reset_control_deassert() during probe and reset_control_assert() in
> error paths and remove. This is error-prone and requires explicit
> cleanup in multiple places.
> 
> Switching to the _deasserted variant deasserts the reset line on
> acquisition and asserts it again when the device is removed, which
> allows removing the out_assert_rst label along with the related
> assertions in the probe error paths and in dw_wdt_drv_remove().
> 
> Tested-by: Igor Velkov <iav@iav.lv>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Applied.

Thanks,
Guenter
