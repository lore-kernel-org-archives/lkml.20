Received: from mail-10698.protonmail.ch (mail-10698.protonmail.ch [79.135.106.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6601C47A0AB
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789213486; cv=none; b=LwEWxogPHlEA5eRmEDwwFz9PsbeS89G6yhhuAxPRzXXUtJUaa41rCKgX4s2TU1dz3DoITrKG0ptv9njHT8AmfzF/VD0yr30GJ/NYhBrwJ49XhQRgP6MqmH4nrSL2kz+Abn5OnGnVsFpJYTpcygR86s3I9RwoYAEQb2DOAZIBM6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789213486; c=relaxed/simple;
	bh=FLc/JbmBUV2/tnQnAHt38ZatpXwzNiotpOVK1PzaB7A=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qLFp7XTdLmpCdOzMGLz+2LPgcHT4nJy/iY8QQI4Wm9cI4Q5wR1jNyeKzCWrTNZmqW8xEczHRZZDDGTDlD13YK/vjAYq4UOA/4ets+XTjCrKnEu9g6VYt5fG0DhCYliKxMCJPdwu/2A5u78DJJsNRqHlvnPbZDtOOzsH0xMZG97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=gQO3Ccct; arc=none smtp.client-ip=79.135.106.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="gQO3Ccct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1789213474; x=1789472674;
	bh=FLc/JbmBUV2/tnQnAHt38ZatpXwzNiotpOVK1PzaB7A=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gQO3CcctxU3raZ2NxuUOHg0C0XTRZTL7tFyTi2Em+XoVpNdNsZSPGdTCg3uwIP85a
	 2xa4I6VGnSihY8x8BH0BalvFbcbUw+LlHJ/NMEuTWSbireigyWvGGAJ+f7MuQLyNb5
	 ZXm7XTO7zGJdL0FocQW8q05xjJdFk7yE8vQDIVm5Ltd0ZaFE5/qRx6SfQJzlFrDK3r
	 3Mkmm+D+EKpnceRxU8Ut6mUb+0Wg5vYmMJ1m06Ecodu3HxXENTeiv+V63kcugH5rs+
	 3605/lKX/oJpCjWqVLPAjkpfGjHMk6CgTCsUmcjEEaHFvnQbaHYU531KsSIvAutWKu
	 v1tZLcv/rgEsw==
Date: Sat, 12 Sep 2026 11:44:29 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Linux 7.4 To Support Realtek RTL8127atf & RTL8116af Networking
Message-ID: <6bll9EOVy7jxUteGUx-A3wJsjoGKRvtPgW7Qzpg24PB9G2QkaOlttrm2ZG0XWGiRz0toZR4IJrAc7U0suQ4s2Jsph-2-xooiz3g_LROhraU=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 64f3832dd04c8090c43792acaf44b3a624853a01
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Linux 7.4 To Support Realtek RTL8127atf & RTL8116af Networking

Good day from Singapore,

Here is an article which I would like to share.

Article: Linux 7.4 To Support Realtek RTL8127atf & RTL8116af Networking
Link: https://www.phoronix.com/news/Linux-7.4-RTL8127atf-RTL8116af
Date of article: 8 Sep 2026

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
Government-Induced Schizophrenia, Government-Induced Health and Medical Pro=
blems, and Government-Induced Extreme Poverty for the Past 20 Years (Govern=
ment Persecution)
12 Sep 2026 Saturday 7.44 pm Singapore Time





