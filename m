Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588031;
	b=kYmDLTCImg/YHr8yxJitRyW4Bwi+Rl6EoEFzSluifOuhmS6yMse3sA8/qHsVcRCo8rMz
	 o+tZQpuIPlTQp1wcIk79D7scSLaz0oDaC28+49UgQvulfbkiyJYkrF7PrtrZfcW5gORco
	 sbYGui29gHV0ZCMXjqoDNYcTXO3PShtJ6pM7F1QfhJOKO9ezMPrkD2bS55s7fS4pf8Ch5
	 848yzDSt8Cx0oHiTe47/++j9+vR9c1rbS90t28j+Ti3UiSXi0PJjpgZVnUp6d5mORh8Gl
	 rx5oqrBp6GsPXhEx/OPO15qqgGvTAPr1wasGlB2M8se1JE4qW/+H/0YbWcFLuQ6YX9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588031;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AKWmQQaJZrRin1ijj0h1+B+DC6ILOCapzeEVxgTxLAU=;
	b=AuqBBSvMZLxRIhv9f3aZa7+0jbcdHS0+aLqD2B0r6xF9V9aQelmnbMnsyW+tjt2O8+9g
	 a3at7e/HtkVaQfD0Md/yxxqv0hw4QjG2SCo4MS61VK51Vzdd9v5v8zFzjeNJN+ADTHNsd
	 StA0O6chDfQZ86ka7bgkpc+2eI2WuO19pCfYE84KoPu2Udldv62O/N/SX652IE/kKE5G4
	 uWjMnWzrBKgOlXsx5s44hSkhJYUmSrsayJ4CMv9eae7xP+IiSPOIIuxkGW5c6v+k4wkCA
	 WUhfXVDkQOGiQA3p+01RiGGlKWhTazyQo0Uv3FoBYTlZ1bo9qZPyEZ/jbY/kaN04xZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=KolMkFOM;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E9760A5BCE;
	Fri, 13 Nov 2026 16:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64E9760A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=KolMkFOM
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2B75E40E021A;
	Fri, 13 Nov 2026 16:40:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1bXSmL9ef7ef; Fri, 13 Nov 2026 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794588025; bh=AKWmQQaJZrRin1ijj0h1+B+DC6ILOCapzeEVxgTxLAU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=KolMkFOM9elkMDZMyKfeEREC9NPppZ1mSB/KzP9TEny7mYsBq9/Gb0VqnotWYLfMu
	 oUAw68x3r/ZjQFzJ8q3pmelBzdyLoafiPWPHkdTKkEl14RUgNTlRz/rGg8pAkP2Ifn
	 Wghq8XeTTawMKBG+syEfblDqdSuOrfc9kl69fAekB7rWsNaxpCblCDCZ2ZB/rL3d0h
	 gOKbRskp1XZXzan5ZX/OCvajxvlJorKEcBoW1ylshTqSCMkPljmXQtzQLzDFpfow9v
	 /2B1SDS2sqRIp3Cuei6iXwEuTaryoNQpMzJW8tDocxcqI8O7Q0qG5cQxWY2r2g0gTi
	 IXkCUr+xH+5e0Var1ze8iwB2DyJlAn0UQ0xVixSpoUl1WAxyMRxFrdMO7RqzHdQ46F
	 iCqm+Ehbm5+Qv3LVMqRwcO7I9gIN1L1BJJMwrvfiHiLdnhc2mi9gw3ksW8KR/MrBAM
	 JMQuskBXdSAIZ0r/MMn9x9BqTJxv3B7YIJkitNHTr+fk9BAZ7sF8fWNEmY3yr9Fk9x
	 OLKGRmU9MBsG8xOtGCSGHYf1KnmTJv9jvdEtBAPTZx+A62zLIQ7rwg5lgAtnG5WQhC
	 MKDIIaj/b5DlktsCEX4etDc2UqMbHqOwQN1spIyxqP/yxSGZnAJxBH7D0ob1IwcEPd
	 AiBw9+w0vfsqVK4M7YKt0jiY=
Received: from ehlo.thunderbird.net (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5F66340E019C;
	Fri, 13 Nov 2026 16:40:12 +0000 (UTC)
Date: Fri, 13 Nov 2026 15:14:38 +0000
From: Borislav Petkov <bp@alien8.de>
To: Lin Wang <wanglin@open-hieco.net>
CC: Yazen Ghannam <yazen.ghannam@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Pu Wen <puwen@hygon.cn>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 4/7] RAS/AMD/ATL: Match AMD CPUs only
User-Agent: K-9 Mail for Android
In-Reply-To: <1824e0de-7011-4cb8-837f-0dc5a47e46e1@open-hieco.net>
References: <20261029053313.46323-1-wanglin@open-hieco.net> <20261029053313.46323-5-wanglin@open-hieco.net> <20261113050924.GDavabhDniAGJMUgtH@fat_crate.local> <1824e0de-7011-4cb8-837f-0dc5a47e46e1@open-hieco.net>
Message-ID: <056B4598-0AAC-48A1-A730-325836892464@alien8.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 13, 2026 7:56:37 AM UTC, Lin Wang <wanglin@open-hieco=2Enet> wr=
ote:
>Hi Boris,
>
>On 11/13/2026 1:09 PM, Borislav Petkov wrote:
>> On Thu, Oct 29, 2026 at 01:33:10PM +0800, Lin Wang wrote:
>>> ATL matches Hygon through X86_FEATURE_SMCA and X86_FEATURE_ZEN, but
>> Ok, I had asked about it but that ask wasn't met with a lot of enthusia=
sm=2E
>>=20
>> Before we go any further here, I would need you guys to go and define
>> a X86_FEATURE_HYGON and convert all the matching that Hygon does with
>> X86_FEATURE_ZEN to this new feature flag and get off the _ZEN flag=2E
>>=20
>> Because the _ZEN flag is an AMD one and you have no place piggybacking =
on it
>> because when we go and change it, we will break you=2E
>>=20
>> And you don't want that=2E
>
>I agree that Hygon should use its own feature flag=2E I'd like to
>handle that conversion in a separate series with the Hygon CPU
>maintainers=2E
>
>This series provides independent Hygon node/SMN paths and makes AMD
>NB/SMN initialization AMD-only, without depending on the new flag=2E
>The flag conversion also affects CPU and ACPI behavior outside the
>node layer=2E It requires reviewing the existing users across
>subsystems, updating the affected paths, and testing the changes on
>Hygon hardware=2E
>
>Would it be acceptable to merge the node/SMN separation first while
>we work on the feature-flag conversion?

I would love to say yes here but nothing really moved since the last time =
I asked and that was a while ago=2E

So, no, sorry, please prioritize this work first and other stuff goes onto=
p=2E

Thx=2E

--=20
Small device=2E Typos and formatting crap
