Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C564836494B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 11:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791026252; cv=none; b=JVoeI6KbVpPadYd1Obf5CvCBwDV2vmAAGgeRcOgccLl8r0Jn/ZbYU/UcwFoGCtXIqO4u4EYFf9VBJa0qvZkc7EDDEc9s2zNIj/gWkrmwypsX0HgQVKFE/XlkyDTCS+10wSC33CjICK0q0HtZXiXm93rPXSW+w3NoabknD4hz208=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791026252; c=relaxed/simple;
	bh=3mUM4eWlKyYPxyDaXS7ik6dAgsgLmpn/ims08byN3U4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T2f7ezv3FjEjycyjz1XOxLKafUE1UfnxZMgzhXqrNWW0tPxAh/NKhIxPI0CJu+eoqaQYQdJpbYcrHWdSKPjG0r20EQ21vnF6UAFg41E8iHIYyKha+1GNSwvdXjhMSfJAZA5wC88lVsqOidh2sNvPB9fKRYAXZgq5U1ZGD8XcIQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=c25CTkjr; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="c25CTkjr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1791026233; x=1791631033; i=markus.elfring@web.de;
	bh=3mUM4eWlKyYPxyDaXS7ik6dAgsgLmpn/ims08byN3U4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=c25CTkjrA6BkIQbyTsi04nU/BweS6Js8waT7mjnY7XaWUxgSQHY22Cws9mRFbVTo
	 2KEwODDfLWVXHCIrYMSO8GTR44P2eA99DNqbrxYxamvlBA2kvdyU9mbhOI7/5ytgf
	 /uAjPo1OjIa1AIl3d+f4ybluJPA3Nqdt9UiyUuLCa7enrZvmCkjfgcVvfKzhgerIV
	 rNPGJRpuTan+XaWnPiEUaAVnkCSsjN7RGer2la9+AY7fnwjwudDt6LR9R8ljOmxee
	 TnWEX/0SflNUKBWj4nFYDI4JZUhsRyvV/0Z3Ac7rZmUFrutK+lY71gn9x4O0Q+oG+
	 8t6NWWJ+OpyyrWDnDw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M4sbr-1xEt141bIV-00HCKv; Sat, 03
 Oct 2026 13:17:13 +0200
Message-ID: <16e2af34-9db3-4167-b6ef-1b3751fec7be@web.de>
Date: Sat, 3 Oct 2026 13:17:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [2/2] firmware: raspberrypi: Clean up local formatting
To: Stefan Wahren <wahrenst@gmx.net>, Triet Hoang
 <triet.hoang.dev@gmail.com>, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260919034840.28593-3-triet.hoang.dev@gmail.com>
 <ce9aae9e-bb67-430e-9e2e-83b27265f489@web.de>
 <ef540a61-22d2-475c-a5bb-a7df8b44ee19@gmx.net>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ef540a61-22d2-475c-a5bb-a7df8b44ee19@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2IHL+pm0clhLz/xDSegsl5cvlZK46nQHDTQO0PKMgzNnOxUbLbx
 QudebdsheDJDJ9BY1G/KTAkbyJEhf9/m0AzJ2y7DNbgECJxMLh1j5C078tj4Vfa+MzGu25c
 VNdjg07FRBt7AKk967ocfD3j0Io0+wu1bbAOoPYt+Jf+kwOs2XbTIUJujXv9lgii0yjUGYO
 ZiQ+V2fbDyNxpwJojYC0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0v7QXlvTEW4=;Iv0GXSBLQbZxqG4xbE/XUwiGPCW
 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
 T1KQK9lme3bh/35II62VzSMTJeCjMFjsnfQ==

>>> Add=C2=A0a=C2=A0blank=C2=A0line=C2=A0after=C2=A0the=C2=A0local=C2=A0va=
riable=C2=A0declaration=C2=A0in
>>> response_callback()=C2=A0and=C2=A0fix=C2=A0the=C2=A0indentation=C2=A0o=
f=C2=A0the=C2=A0UINT_MAX=C2=A0return=C2=A0in
>>> rpi_firmware_clk_get_max_rate().
>> =E2=80=A6
>>
>> See=C2=A0also:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv7.3-rc4#n88
> sorry=C2=A0but=C2=A0I=C2=A0didn't=C2=A0get.=C2=A0What's=C2=A0the=C2=A0pr=
oblem=C2=A0about=C2=A0the=C2=A0commit=C2=A0message?

=E2=80=9C=E2=80=A6 and fix =E2=80=A6=E2=80=9D


I imagine that another known advice can eventually be taken better into ac=
count.

=E2=80=9C=E2=80=A6 Solve only one problem per patch. =E2=80=A6=E2=80=9D

Regards,
Markus

