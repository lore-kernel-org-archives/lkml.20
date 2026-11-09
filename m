Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227546;
	b=r9/PmDtF2O8GIE7WVvpEBpCVGUEr3/hW7LJ7eVZxQeTWsRSa3xF4XMJv1hFtDDfp03eU
	 GKPIf0++myDICGGD/a/7LJjv6C50q9fpEub2teQptzCPyJRqZoaBmbtLGOvBKsGXnrBEO
	 b9uA1wlcnYQZio7wMrTRFqRsNg3dk2IJydRByDEtzjcOJ/mmGA8A0SFwXp4HpYLjQIR9v
	 9iZv7nO2C7VOzX7pyNJiRKf1qz77SaOnW+klDxY5SBAbVcKDz0rw5iCmg28Dgnwh2TC77
	 xG7TXXGxsfwFyvTEFsN0iB/VQliZX30X7q5jvboCPjm4fUVLCxLRONbYfLptYT454Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227546;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Udmccze+zEanKUPWVBdY9ea3z20SVh/JQ2hv1/0uQrs=;
	b=epLga8xzlcKq0ld98+pYnX3FPQZoK7Ig5mIIbvrFH/Dpf7zsatmb6hEjZ0rcBqO3K2j9
	 IEaQBArkFcOUQ+chgl32QYVN4fm4Xcd2Dbkh6xQoUq1DXA5yGf/i3gouJgiye+/Khxvmt
	 MUCgwiXpUqO89z1BMq0ZCZkWCIeMzXNrXH98IILRnPesy3wbng/STHrrpDgxhFH2IN3My
	 coVFdjXoS7Ewvb8yGei+QLrrY+6wzTpncHlMDJ+bG8/0/0NWeboGDHOEayUyOOYGkYOcv
	 njrj+SM/18WQ6VqY9AJf65rOfH8ydACiQaHe5Aps3vOysTxL4tkbCX+aswxerEUlsNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2uAQNvu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F195606EE8B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2uAQNvu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A291F00921
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227546;
	bh=Udmccze+zEanKUPWVBdY9ea3z20SVh/JQ2hv1/0uQrs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=j2uAQNvurfz6hqPo8AX7nyJWh6yTaZ4yAuFyY5y46qObrXnVyBfeOxM07RoqO2tnN
	 TsfTi5Yxvx2ZCgIF6MjOPXzgER8N05yBcQIcgtUKSv5EB2d8pJsTY/CRvASfiQxQXz
	 FJTllwJ+0nrzCupCfmgv+3MsoehzdmHbklEm1UJjtZMumXXBCR9DS3hRUUEFewn6OP
	 K4r6vgDwNMcbUx4lgc9SW3cUkomwfVGq5SVQ1R3IoNZKO+qwdaWQVSCfxBNplOd1qp
	 dbQGspErS1dOQ1URxoYBAHZlIlYsKQHp/bc5f0Kdxtri7t5567dJA6+mMAQHvdbSdO
	 vHtCKGOzcnWYA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be416e603cso524798e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:32:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEPkI88yDYxPV8EZd1QdjPUxDAe0RwK6Q9+ecZWnXzd/cH2nEl/tvR+TovRM/37/18sC1EMz9LfITxyTpo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZiJzPUs1ikPOhuNDg6q4Q5/cxBscxj0s4y+5ikD2dCQcfA51q
	2xVEft4NI8LsgpX3tVqTrwG0rXBa2KfFz17HB3DZMdCSfRvLMniHYVDpjI6U3+Gm9phPKAxZrvq
	yaXfcjukl9BInRb63CId4Ehr5Gz8xwAo=
X-Received: by 2002:a05:6512:31ce:b0:5be:4386:8072 with SMTP id
 2adb3069b0e04-5c14c042497mr1063807e87.56.1794227543795; Mon, 09 Nov 2026
 04:32:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104110355.1437249-1-pierre.gondois@arm.com>
 <7c59eada-ea8d-4b04-a24b-9ba6aa2a6c64@arm.com> <62430a5e-1e43-45de-9f8b-f0fdc826f38b@arm.com>
In-Reply-To: <62430a5e-1e43-45de-9f8b-f0fdc826f38b@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 13:32:09 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hGEa=ZBLcJDGfbL5S7C99Kj8JJpaqObMj1RZZeLn=puQ@mail.gmail.com>
X-Gm-Features: AclHuK9C0VgmSOJIoZ6xy9CAOcwTI4p77cqP0wxSxIc4pGinWekVEQNGKsbwnGQ
Message-ID: <CAJZ5v0hGEa=ZBLcJDGfbL5S7C99Kj8JJpaqObMj1RZZeLn=puQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] CPER: Add Memory Error Section 2 support
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: Ashok Raj <ashok.raj@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	James Morse <james.morse@arm.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	Pawel Chmielewski <pawel.chmielewski@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>, Breno Leitao <leitao@debian.org>, 
	Terry Bowman <terry.bowman@amd.com>, Dan Williams <djbw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Morduan Zang <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org, 
	linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 11:58=E2=80=AFAM Pierre Gondois <pierre.gondois@arm.=
com> wrote:
>
> Gentle ping to check if there are additional comments on this version.
>
> (Thanks Mark for the review)

Sashiko has some:

https://sashiko.dev/#/patchset/20261104110355.1437249-1-pierre.gondois%40ar=
m.com

Besides, for CPER and APEI patches, you need to get an ACK or R-by
from at least one ACPI APEI reviewer listed in MAINTAINERS.
