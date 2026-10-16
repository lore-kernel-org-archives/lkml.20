Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB263EB7F0;
	Fri, 16 Oct 2026 08:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138941; cv=none; b=abF+twn+gjWjaF8948BcUTTOLwiaIJycG2ib4VzL9JCMSJYj9aY7L7LmGBZlH+W679a98f1oMxNgd6OvK9u5/kz6e91d8C+ENjoQHPCwevAzBFkp8AWTNKstdpyKxi3CXN3Xbl7yozraugZuZUWSXEXJ9VQZSwDAGEW+Uj9DsCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138941; c=relaxed/simple;
	bh=sfO6LCsGgF+OiKNkyO2VSvSNhYREPROhaSICrmDWiaU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B9M98UthaZgmS1kYCo1QL2Q2eLOG5X/ea9qMunj7ETuBFpD/ScIPJ2LysLWns6PoH9Vwy82ZBTrurbFrnkJZXgbWBc7+wmHtnAqnNbkDPZNrhkH9iyAiP0uMzVq5R9rQNbWJVhDirDd8uLpKbmbZwyqE3NRMZloiSRrzP8pl0zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=VZaggYG+; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="VZaggYG+"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69G8LYCL03356776, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792138894; bh=xy40lAvYmLZ+fYRL+/NhoNwZ5jC4w0xBwGVLPtkbokM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=VZaggYG+VmjYthi1QEQI1EppTuztcovyAQs7PlXpXBsFAQ7YKSm4DhlW2Bc1MyQ2I
	 j1AgoT4r95ITNcYstrGAP6Vv3X3fzS26ZOvdDSFdE8qe8T+CtpdG7z3u7Rq4vybTrR
	 q8DokoNmI8gprqVDTY4ehhC5AU1UyEVKwkeXH/QtOCtLoPSZiwmab4irZT7h7qyQE+
	 pIaKp3nv0k3xtWm4Otf8NJZiyhPHwVsLVa0BT96BSHLsPi7ZdXa+vKi3O81zx2/IVF
	 HoIOCt1Prcs2a1KAJ90OP0PygttusKNcPGmH7kxUPQHheipK0xNEXYI9kVuGYggwY/
	 qwg108OykkzRw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69G8LYCL03356776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Oct 2026 16:21:34 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 16:21:34 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 16:21:34 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Fri, 16 Oct 2026 16:21:34 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Dan Carpenter <error27@gmail.com>, Luka Gejak <luka.gejak@linux.dev>
CC: Ethan Tidmore <ethantidmore06@gmail.com>, "pavankumaryalagada@gmail.com"
	<pavankumaryalagada@gmail.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "outreachy@lists.linux.dev"
	<outreachy@lists.linux.dev>, "dennylin0707@gmail.com"
	<dennylin0707@gmail.com>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Thread-Topic: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Thread-Index: AQHdXUYKvJrQKS2gBUyEx7jfNjA3B7b/043Q
Date: Fri, 16 Oct 2026 08:21:34 +0000
Message-ID: <78e3ad912e994e77813cba1af461c7c1@realtek.com>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
 <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com> <atEtUV5q9MHRSTJb@stanley.mountain>
 <672f78b36290a4021d3f94d9ec401d23420febbc@linux.dev>
 <dec2320eb01dc6499948a936c94512ddfd47e2a4@linux.dev>
 <atHcT5GG8zzoH7kk@stanley.mountain>
In-Reply-To: <atHcT5GG8zzoH7kk@stanley.mountain>
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

Dan Carpenter <error27@gmail.com> wrote:
> Ah...  I didn't realize this patch was applied to a different tree.
> #Unexpected.
>=20
> https://lore.kernel.org/all/7e53bd59b7b146caabebeca4347674c7@realtek.com/
>=20
> That's a mistake.  Staging patches should go through the staging tree
> or atleast they should be Acked by the staging maintainer.

Sorry. I forgot to pick the ack [1] to the thread.

[1] https://lore.kernel.org/linux-wireless/cbf165fa6213c22e88559081ca1c1603=
75c9009c@linux.dev/T/#m6311fc160b8c020f7f87a3d9435ce02d69d07e4d


