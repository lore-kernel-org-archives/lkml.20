Received: from a4i546.smtp2go.com (a4i546.smtp2go.com [158.120.82.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B213BB682
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 03:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.82.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790825150; cv=none; b=ltTDCtYs5I32wlofsOqGZJJjVG7CpywWOMYcXxr0I63zyJNuhfshLQR7zaSRjkzXl54Rl31nTkYSMSbtgzTIIqPJbPHyvcGTRLCtPOkMnJgUK+GxgUrDgb3xhX6Eb4PrM10F6eH1k46gvAuvDMvYmv7fmi5aqd+V9/r8hTCdvWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790825150; c=relaxed/simple;
	bh=xqA3QX6RI/g9rQsSp6BuKiJ8V5fCg2WSMHF/VXcgMJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kIO8ofjxJLfbg5tmvm+eU4e5mqX8ZB/Pwxqp6GLNaEE/9wU5ox0bUX51JVDIe54v+CdGtu5q5wt2ZD+jxeeObLuvx6Pktom9tu+y5BYF5KrvPdXPsCCYzvxiK11vJuqTqjIFMeFLdqnIDg15Zxc5acP0d3Qce41EQ55wUZPke7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org; spf=pass smtp.mailfrom=em879706.shangen.org; dkim=pass (2048-bit key) header.d=shangen.org header.i=@shangen.org header.b=WdR+V/i+; arc=none smtp.client-ip=158.120.82.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em879706.shangen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shangen.org header.i=@shangen.org header.b="WdR+V/i+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shangen.org;
 i=@shangen.org; q=dns/txt; s=s879706; t=1790824236; h=from : subject :
 to : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=jNNFayBB3Yv9+kwgeyDtArfmNzv1qHd1IO8dcuBre4Y=;
 b=WdR+V/i+GkRHz3DUGrFSFDZpLA8ThmeBJjiBjnmubbXo6YEmqR3skpByb2yngD5JDEVPT
 cOli8xuPbM8kgJSgklq6ksoTB+IF+Q3wzSzdolACNcCaDHDDVt74MQydu/lqLERFIs7xTpR
 X9D5Nsfr0z5VhXF6sPG8p1pj0TvqMfWKgI9Ac2lPC+UOTtv/z7oU6qdIFGCr83RoPVf7BO4
 XvvtGDz+64IC+05rwOgsRizv8NhgGk2+hOhrDtSm/FdMrF/nEcUASq07Qfj3fMc02kT/HeI
 Qb5KaklGk5/W6K+CQwU4T0qUEVLD6ItxllQHsGzYouQBFbMwiBSytfKDZlBA==
Received: from [10.195.244.224] (helo=12458laptop.lan)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
	(Exim 4.100.1)
	(envelope-from <sim@shangen.org>)
	id 1xC7Bl-FnQW0hPswep-dGf8;
	Thu, 01 Oct 2026 03:10:29 +0000
From: Shang En Sim <sim@shangen.org>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Krishna Chomal <krishna.chomal108@gmail.com>,
	Suryansh Singh <technosfan14@gmail.com>,
	Emre Cecanpunar <emreleno@gmail.com>,
	Radhey Kalra <radheykalra901@gmail.com>,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>,
	Alain Cousinie <alain.cousinie@laposte.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] platform/x86: hp-wmi: Spectre charge behaviour
Date: Wed, 30 Sep 2026 22:10:10 -0500
Message-ID: <20261001031012.48473-1-sim@shangen.org>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 879706m:879706aL5FzMA:879706sFQvIPwayB
X-smtpcorp-track: QQM2jGW0VqFO.fcBk0krB9MYd.1x09ggTGuum

Address review of the Spectre charge_behaviour patch.

The hwmon keep-alive work is switched to devm_delayed_work_autocancel()
first, so the new error return from charge-control setup does not leave
that work pending after a failed probe.

v1: https://lore.kernel.org/r/20260812062113.27741-1-sim@shangen.org/

Changes in v2:
- Switch the hwmon keep-alive delayed work to devm_delayed_work_autocancel()
  and register it before the hwmon device (Ilpo Järvinen)
- Name the GBCO status field with GENMASK() and read it with FIELD_GET()
  (Ilpo Järvinen)
- Add HP Spectre x360 14-eu0xxx, board 8C15 (Alain Cousinie)

Shang En Sim (2):
  platform/x86: hp-wmi: Fix hwmon keep-alive teardown
  platform/x86: hp-wmi: add charge_behaviour support for Spectre
    8C15/8C17

 drivers/platform/x86/hp/hp-wmi.c | 265 ++++++++++++++++++++++++++++++-
 1 file changed, 258 insertions(+), 7 deletions(-)


base-commit: fe5030c8cc7156223f48530e9b49aa87c0305bcd
-- 
2.56.0

