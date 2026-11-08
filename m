Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794104301;
	b=JyVF8xebBjIztVMQXMMHFBJy2oVDT5jkfbtoPatfzhKt4Plyw22Bfkz70Gof+Gk4QNKM
	 qzt6JcYqfkiKNXk3FGO0bPyV8ugYdglz3giLoSWoOl7QQ/kYbrGrk+SkM8Y7CU+JmuCDK
	 tR228mtmCYvg9uJ+d4aSGr/MbOfBbx2gEwb4dNXy28/6EHh32q8Lh2EcNMCOe9we1wLhY
	 sSSs4P8agnIQx+NnC0gAtYG+tmHIMg4jy3CUQp8ar99SkwwznvfVAXHOE1VokoTRxX1C5
	 w5l87mzncat4zU44eQqPCFqkSjhPtaipg4ccUiZzjFSdDsq9NB4ALgvFp6Y6pziuwGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794104301;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Spam-Status:X-Rspamd-Server:
	 X-Stat-Signature:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 X-HE-Tag:X-HE-Meta;
	bh=zYs3QAZ6lNxQw33r9L272lZm+etPpYC/6UsCgxidEY0=;
	b=DYGRxf8prIirSSYBjgqWjXBeaS/+pfvFfqEiweaynAXrBGAm32zAStqRbR4ehW4l/ne4
	 9bPFiv7IWB+d9Ur1Umqwqjd5AX389E9gyZjx2cXxG09BJqb7G4Jvx6N2FBu5GtbGdr8IA
	 JBzzxuVgTRia4JC0ndWdD84Epmumawe+zDoVdqYdDE8YPVuD/mwG1ZKKlf6iLuMyKiNgV
	 6NwFs6ZMOJJs2ixuwbnSFn+mBstXYTcBiX2S4LZf23gKQF8ccV/ZTk/goV+PE+VNXc6FW
	 R/HN+iBqG5+vcJRXRBAQacO75z2mOz1YY00rVW4mrMOmed7MfYeuj9ydOG66dSDXqFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.13
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B715606A31A;
	Sun,  8 Nov 2026 02:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B715606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id A2684402D7;
	Sun,  8 Nov 2026 02:18:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 8004020025;
	Sun,  8 Nov 2026 02:18:17 +0000 (UTC)
Message-ID: <5f6243cd0c0d26e89d9ef17abb68fcec240fa3dd.camel@perches.com>
Subject: Re: [PATCH] docs: checkpatch: Fix DEVICE_ATTR_WO macro name
From: Joe Perches <joe@perches.com>
To: Mauro Codella <mauro.codella@pm.me>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 07 Nov 2026 18:18:16 -0800
In-Reply-To: <20261107230208.326769-1-mauro.codella@pm.me>
References: <20261107230208.326769-1-mauro.codella@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Server: rspamout06
X-Stat-Signature: nbzfgxs4gfzk87ipjedsdoyhbfn89jcr
X-Rspamd-Queue-Id: 8004020025
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/G7ID+oJeKiuAmf8anonTtQyANb73atyg=
X-HE-Tag: 1794104297-59469
X-HE-Meta: U2FsdGVkX1/z9+anuCWnk9Eh+BcS4MQBRihKN84RhuF1u6P/XAFFHyQM0RfxCGK+a/UEsbzxZRWCZr4GKVTO3pxMLl2bMFrUHs3/kN17YcGSibPKZePqSlfff2vDynj3bWNPEgzBdUu2he4QsSNuLBhmG7OlTvQSUBOJ5wR3ZEhNyK2NsulztTVXwoGYx8Qgw19J2FZ8Mjfpu8ju+ektthSphrc7JBv7DRpc3QeexWDq/yGDpJlID8xH1LP1DIiTUAPd0SUINIKotJZELJOXwUU0TfLhof361EtFwFr1ZJESBNiDghMaItri0zuTrwWjV58HIHSiAWjZ+bGlAZQAo3BDoKk6WJkCmJtlsUGE31BDrxZnSxVSek1kT9qSMPwRxI9QhDSFFhxbVEhQR6i7TL2pLIP9LmNpuL2537oUsQQ+v1ldqoXZHWaNsdhrqNNJMULm+FTv/UE=

On Sat, 2026-11-07 at 23:02 +0000, Mauro Codella wrote:
> The DEVICE_ATTR_WO section refers to DEVICE_AATR_WO, which does not
> exist. Correct the spelling to match the macro in include/linux/device.h.

Thanks.

Acked-by: Joe Perches <joe@perches.com>

>=20
> Signed-off-by: Mauro Codella <mauro.codella@pm.me>
> ---
> AI assistance: Codex identified the typo and drafted the fix and commit
> message. I reviewed the change and ran checkpatch.
>=20
>  Documentation/dev-tools/checkpatch.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-t=
ools/checkpatch.rst
> index 6139a08c3..f8ab22c18 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -389,7 +389,7 @@ API usage
>      See: https://www.kernel.org/doc/html/latest/driver-api/driver-model/=
device.html#attributes
> =20
>    **DEVICE_ATTR_WO**
> -    The DEVICE_AATR_WO(name) helper macro can be used instead of
> +    The DEVICE_ATTR_WO(name) helper macro can be used instead of
>      DEVICE_ATTR(name, 0200, NULL, name_store);
> =20
>      Note that the macro automatically appends _store to the
