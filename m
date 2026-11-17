Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883273;
	b=omLUJWAV+cPTyd8aabiDpJO9QYTekfEnDeERqv9kP1BM+kRKfuunSz0+/JHoUvputv1d
	 daLIFBPHXiovAi+RsLwslJtqQbLsPCdsGSISLvXcXT804f07Z6ZAHLvk36NjGJysPKgP8
	 DigXA/JQkS8azOrXFpeYMMZuJ6OfTZrKioMf4Xrv9yPR6XB610XQGyDLSth9PM302bPOf
	 Hmf97vONEXWvE1HiVVMdUzjXYwGWqI8EyjY8by2HybwXArMFdkRVYpicHO0ZD7lmINXVH
	 BwQu3ncbL0jltnzf/wfTls4Q4RilvFsWBXxbOB9y193W9KGrXG3pX+iN57hJUR6VqJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883273;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=ytDTUkiUwrOfBSNk17TqtXGuaMsqxDXcepGOwi0TLRc=;
	b=nzaklWlX9GgKeHGMtf9Ipo4afHSiivnAigTeRFSs8G8hqfEsRtv4EFjFa2moLbKp/Pwm
	 DfXh7MVe1jeNdXIUaTqaRP24yiK2zhX3Nz485Lk5zb+f2LlYU2br1YkFjcfwT6JFl6UeZ
	 Zo3NKRR7j3qjAX90A3qq4qcw882VTOenAQjiE3X+QiSxmCBwjJ5VlGLsLV0c0+IfdmzLZ
	 fNyQjkLBQY6RD0aoeDCA6KZPgs/vzjAlGFj5cYa8hsdqkLJtsZChu+9vOw9bIsyeckO8k
	 y5SCaGbtmUEHDA2dFdIDdF9aLFtdXQiH7dGs0AoHA2iUafbuppVWlq/zj3mPBPXskvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=iFSv5s7N;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D9B606A330;
	Tue, 17 Nov 2026 02:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D9B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=iFSv5s7N
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH2f8sA53993578, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794883269; bh=ytDTUkiUwrOfBSNk17TqtXGuaMsqxDXcepGOwi0TLRc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=iFSv5s7Nq3KgdS+trBgIzGma46kn6ywmRMkDnBksC+KHIWgB7uewJyJTVIooI0mde
	 FX7Ur5PQo36AnOrbqtfReGkHQPwcO92/xOnW2rJ+c14qYQeJvuSBKzvEtacNvmNQVk
	 l59CRblvj1bMQ/OVaSCJVvk042JklQnT2lP16hvSSvUv6QbviSGSq1jLa8ChTGMpK2
	 yhDpZ659KOkSAN6LLCjw1ldMlblUnvtuPDNIjRvj87oZ/VYpZdh4LAdhYWWa4j7n/f
	 7sjCrGU5xzP9izwHpmNUEfr4yCxX00OCS4ou9khx9JwK8uF2bgP1qboiHf/k+F04so
	 bNePg/26FYd9A==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH2f8sA53993578
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 10:41:08 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:41:09 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 10:41:08 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Rishik Yechuri <epicrishik@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rishik Yechuri
	<rishik.yechuri.code@gmail.com>
Subject: RE: [PATCH rtw-next 4/6] wifi: rtlwifi: rtl8192se: use ALIGN() for
 the H2C command length
Thread-Topic: [PATCH rtw-next 4/6] wifi: rtlwifi: rtl8192se: use ALIGN() for
 the H2C command length
Thread-Index: AQHdcUN/nKj5Y1zQLUeHbHCCUhGobbcxlj+g
Date: Tue, 17 Nov 2026 02:41:08 +0000
Message-ID: <9020f387fe56447d9255a1c6db0a9a1a@realtek.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
 <20261110184409.42205-5-rishik.yechuri.code@gmail.com>
In-Reply-To: <20261110184409.42205-5-rishik.yechuri.code@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Rishik Yechuri <epicrishik@gmail.com> wrote:
> _rtl92s_fill_h2c_cmd() and _rtl92s_get_h2c_cmdlen() round each command
> length up to a multiple of 8 with N_BYTE_ALIGMENT() from wifi.h. The
> macro spells out the rounding by hand and special cases an alignment
> of 1. ALIGN() from <linux/align.h> gives the same result for a power
> of two.

Just say N_BYTE_ALIGMENT() is identical to ALIGN()...

