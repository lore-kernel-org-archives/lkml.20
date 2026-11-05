Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906339;
	b=eESpUjKuhvWKkFAt2VL1eTx7kZTVCW+e+dtlY37X37Tyq9h81W4mi0l3hhAI5hIq9Kqn
	 heF39LKmx7BMnyf6/D1TYTY2Vc69gUaoLZE+53MK01GXsvcSzOFql12AfSRtE1PdUquzN
	 yhW0ekDgzvxCEwvmw3MUZPGzIWuUCmyamhBVdo3b6eURkIWQPSxLIrR/a/sC6D2DX1nCO
	 A/TgcKHM+Bt3dnoU0NTsDO5dZh+TA933gTXE9BapoLkii/1HUbSrL5m26+l5ebRX2uxzC
	 Bzjj88XxDDiobbmjyjnALi15ALk8liSUQRtvZkArbEnWzqI60DOda5WbMBhQLEJu5Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906339;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 X-Mailer:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=/Hc98kGrq+9KqshCg8ArhEkJdKq50MUnXEsOBY3/Quw=;
	b=ITYUMKyvdysAARksgM93cpkOtRyDJDHj6pNTWYzxpL+Kj2QHPqZkqFFU7szkk2ks//YE
	 pRB/OXz5lf5byx7UFEpAaHQoD5q7ScbI04hrSCu2P97mbOnPYdWU9IQU98zx2WOTdtfGF
	 K6EpFLGccs5nmdwakcIUWE8/xiOWA0O7DBz/afZcZXBfFFkMBeUi5jeg/NYnF+v0B97Wl
	 pxyVTfwvnbC+pjHjrH2jltx+FRQVwcr6NcPMwiR31MbbGx2k0VFx8WXYOPHZN0IasIa0f
	 7Zf73u1qJV/0AGWPKbMbAv33Imh4t6NyZprWUsfcZxx4UuaHhgcH41bUHWyJqId7wEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=L4Z6mLC5;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b="Za/qjfDz";
	arc=none smtp.remote-ip=23.251.234.58
Received: from e234-58.smtp-out.ap-northeast-1.amazonses.com (e234-58.smtp-out.ap-northeast-1.amazonses.com [23.251.234.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712C8606A339;
	Thu,  5 Nov 2026 19:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 712C8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=L4Z6mLC5;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=Za/qjfDz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1793906338;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=/Hc98kGrq+9KqshCg8ArhEkJdKq50MUnXEsOBY3/Quw=;
	b=L4Z6mLC5J/zFHNuvrczV+qD6K7QJJwyMFTe8C7aXd8vZlhRB0Pv0EwTT/EBdsxbw
	v3HJC8X8cC17WoaiThjWm6lZplhx40YhcjPduyIZgjQVoWR+k6RYzOMOERWa9YqV3tQ
	C23DW0pwWUuQ6r5VD/2HSFPVrlQVFBHaMtspoxWc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1793906338;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=/Hc98kGrq+9KqshCg8ArhEkJdKq50MUnXEsOBY3/Quw=;
	b=Za/qjfDzAtWrn+xjs1dKadn1NoKnE6hOcEEvaSESDQZeAZqXbdyS1mLALKfh57l7
	4YqfyomGV/dJmDsA5XF0oU5gw1IxAwV8jK1T8BplieL1Mzcyab+r8Mwy8RThsirwGoT
	aTmpfLpWiEiFDiamH3hBrS3jgONY+8ZGPnxlicfc=
In-Reply-To:
 <010601a1333dc2ae-f24ce995-a0a2-4d38-80a6-43a3696713ef-000000@ap-northeast-1.amazonses.com>
References:
 <010601a1333dc2ae-f24ce995-a0a2-4d38-80a6-43a3696713ef-000000@ap-northeast-1.amazonses.com>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com
Cc: mchehab@kernel.org, hverkuil@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: i2c: vd55g1: preserve the stream-start
 error
Message-ID: <010601a1ad266928-36fea557-f1eb-41bd-bcd8-73d074ee6733-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 Nov 2026 19:18:58 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.11.05-23.251.234.58

Hi Sakari, Benjamin, Sylvain,

Could these two v3 error-path fixes be =
picked up? Benjamin reviewed both
on October 13, and I checked that both =
fixes are still needed in
media-committers next at 6628e7d4c6b2.

Patch 1 preserves the stream-start error. Patch 2 still attempts to stop
streaming if the exposure snapshot fails, returning the stop result.
The fault-injection harness is linked below the commit messages.

Patch 2:
https://lore.kernel.org/all/010601a1333dc788-a5673ae3-b4b1-44a3-b10e-9698fc=
58f2ea-000000@ap-northeast-1.amazonses.com/

Best regards,
Jizhou Tong
