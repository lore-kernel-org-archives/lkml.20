Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376489;
	b=W/GDx4VKsQKU9/omvynDT7lG41CrSgjhHflvmDVouOxPhhDVJ2poXZKkozTuMvGTbomU
	 bY7fHaw5YtsRa5VjATgTOVUHRVBIHXbVInAIc53Lt5N5IVYCX4N59aE/zKabRTHwZ03P0
	 4SLZy+Z80amimnMDMQo3TC+EjUdM1LcdVqsV0gi5kdSxn2hMA3y4XldfSO4J/RlSGt981
	 lCk6GYRc/JkbsHC0ARtnH2VKPYZ2sD0z4GhvJ+ITWNsIi6uGy28Me5FXPJNPedII8GLyA
	 43ugUMuTgPb7aSUfqS5iGzGV8Gm7q4HlTojy8/k71fHZp3AO1Ry9gZe995OWUg9ZABA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376489;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=oq+g4iZ4UYrYnPbI/L10PT/jx1+ddlD+1MAkqGEt8ys=;
	b=1/Q4geA6GcJc6vPWlYtnsX/LPRnXfEihEmYDvrUq/iEFFPLGbt7VsF35Dg+svebjvJPD
	 9TmNZhWvd1tq2dmCGg5MgsS8/ZJSZ5vvLfT1srMp3KBVVkjC6Sl0/3mA7P+IuprnlDAuN
	 qleORXMlCyJF6/ggBBQsxgZKfE7V5d3fT1+JEDeDPllAMB+uTrxSFJA59YQgVlx+5txg9
	 azafncT5i1AlsQHINzsZfGTaIEuTgkgqWnlk05O3r/bPpCMujSyiHhmlyGpPmpzWADXXH
	 P208y2iTfPVat/+wMzjz5VOd9b2rnoWUWaf9GAWjpK4diwaSVzi5E59ebBK+U0nrpYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.13
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3BC606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE3BC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf17.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 4A739407A5;
	Fri, 30 Oct 2026 16:08:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id 5A4A518;
	Fri, 30 Oct 2026 16:08:00 +0000 (UTC)
Message-ID: <eb8d1fb4e2a8a32ae1b71df686ed65be800e2918.camel@perches.com>
Subject: Re: [PATCH] get_maintainer: lazy load JSON::PP only when --json is
 used
From: Joe Perches <joe@perches.com>
To: Oleg Nesterov <oleg@redhat.com>, Sasha Levin <sashal@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Date: Fri, 30 Oct 2026 09:07:59 -0700
In-Reply-To: <auS7NOsyw7pJ7rbF@redhat.com>
References: <auS7NOsyw7pJ7rbF@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 5A4A518
X-Stat-Signature: 3jwum84oncjd48msaqehe69sqy7u6xyy
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/FLhzE5OZMEsCLqZHHsJJLJ53tyLcnIp4=
X-HE-Tag: 1793376480-957440
X-HE-Meta: U2FsdGVkX1+s58IwUau2pyt4IigCVYrgUc1YTvzxMLaa1Ile5D0xq7Oi15jT3QpbfLGqklH0eTkQAybsnWuEYwnv80QSBH5L9A04/ULOvfIBaswZd/3+ndcIDnfRrCq2163oaARSMnLV0LRdMxC1BGVF1WMSxoaKe/e50APR1iHSUt/7Y7hCGXD83EW9FKibYQcHaC5phABxqoX7iRVcG7Bqtj/MgbdOzbNjDb7jl4g3L5EJp7436tEYmfmzKo2N0jG2LPHVRWMSem7UTNcv43zjdf6dKaF238wFodxruQ7RPYfInZj0hRG4BbLFVp5m

On Fri, 2026-10-30 at 16:43 +0100, Oleg Nesterov wrote:
> After commit 09d8b39563e8 ("get_maintainer: add --json output mode"),
> I can no longer use get_maintainer.pl; it fails at compile time

?

Just verifying that you mean when using perl directly and
not something like perlcc.

> if JSON::PP is not installed even when --json is not requested.

What version of perl are you using?

I believe JSON is bundled since perl 5.14

> This module is only needed with the --json option. Use "require" to
> load this module dynamically inside the "if ($json)" block instead.

The patch may be sensible but could fail the same way
if you used the --json option with your version.

> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
[]
> @@ -21,7 +21,6 @@ use Cwd;
>  use File::Find;
>  use File::Spec::Functions;
>  use open qw(:std :encoding(UTF-8));
> -use JSON::PP;
> =20
>  my $cur_path =3D fastgetcwd() . '/';
>  my $lk_path =3D "./";
> @@ -685,6 +684,7 @@ if ($json) {
>      $result{web} =3D \@web if ($web);
>      $result{bug} =3D \@bug if ($bug);
> =20
> +    require JSON::PP;

style nit:
I likely would have placed this require immediately after the
if ($json) {

>      my $json_encoder =3D JSON::PP->new->canonical->utf8;
>      print($json_encoder->encode(\%result) . "\n");
>  } else {
>=20
> ```
