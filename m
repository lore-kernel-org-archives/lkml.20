Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044513C5DD4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791395898; cv=none; b=uYdhIPyoB99l9O1tCJnVGm38iJkGDZWcaksgjN4mX5urPfR0h4P3RGv5cpyR6y3/QWwdMq27jgfqyzdxtkV1kEPEFjT2VDnP8Nw3nfxW69y2UMKT4AFHvPYUYVAg0VmkirfqASutv5QFuPC+Kp+vQfcZzzsqTkSJQVqDYR8cCcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791395898; c=relaxed/simple;
	bh=OMDTexuXlMdy+pYBRsRZ1SmmcrlQIoRYTAAIh0ehtfE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KTd/Fmdb/5aRa8TUKZNrZjij/5ggIV+WiuwhqV5SX87YKYyet0CCk5/v3APlUw5Eqk5NBEsdVUjYIeUU47SjDzd2pp+P5qNTfbm0hhYZ1h7F5P0LwN0I1f7T1xPcYfHqkSdc9mMwN2nGZ/x5++aM0zGCfZ1pxyWRI7k3GrJ6Azc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id C0C4F160306;
	Wed,  7 Oct 2026 17:58:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id 07D2230;
	Wed,  7 Oct 2026 17:58:07 +0000 (UTC)
Message-ID: <74db124ccadbe552e2344c4a26d97cdc23de3abc.camel@perches.com>
Subject: Re: [PATCH v2] checkpatch: report warning with files ending with
 blank lines
From: Joe Perches <joe@perches.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org
Date: Wed, 07 Oct 2026 10:58:07 -0700
In-Reply-To: <6ac678df.04a8e9ff.23fe56.b815@mx.google.com>
References: <20261007122837.2995-1-ansuelsmth@gmail.com>
	 <e8ef6959a0cb7093cfe4933da99fdfb5567f5354.camel@perches.com>
	 <6ac678df.04a8e9ff.23fe56.b815@mx.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: pntxh8qy7t8expkgmfkrn4qgduuntfrg
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 07D2230
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18DfaJ8ykImRfQIo/ztmGANkSVtVVwjgms=
X-HE-Tag: 1791395887-304156
X-HE-Meta: U2FsdGVkX18hQ5+Gvm8L/QS+vWuQwzyWDt/5yQSGdWhwhK11HlWdY+8JYg1rMPxgV2jH7LAULGgpzG/CLHxljPcdA/ctStOGdaMGTsNfDKf62YjtFTN1w3pU29excvA6rYnTWsgzJmIenu0w5cLkWeCFNTsTtB8wEDbY9zB+Rcgm9gm4llSS0aFK24crFSNN352+TmAf0cytpraY37GaW384j5zHVEppZ26p9Baqd+Mu1MQalPUGOExjuah72BOTaek3bOJsSOwuiRUwH/dPro+M1S0F7GHbME9qd3lr0mRkuunK7fJ7ijFDMUN/Oq3DB6+eozbybHKsCdXvIRYcSvsoMRDTjn+/fSiApJ/P43bR2BhZ6EcD1o7ZdXABmcHAkz3L3c8k2HnOs867t7NJZg==

On Wed, 2026-10-07 at 18:52 +0200, Christian Marangi wrote:
> Yes I also was with that idea but then I quickly figure it out that we ar=
e
> not testing if the .patch have blank line at EOF. But if the single file =
of
> the patch have blank line at EOF.

A long time ago:

https://lore.kernel.org/lkml/b5e2a4d9eb49290d6dc3449c90cdf07797b1aba6.camel=
@perches.com/
