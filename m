Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A55338F930
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308811; cv=none; b=ulhKKdL/TuxeDNL4SjKZL+G8c1j3e9VQv/PYuZsoDnToJzAXnG5KtXqOKeM0pmTV8KwDCtKV0ijLJtEJZWLMEgR3whJ7PjRwLBErPWal1qV3X88pHAZ7RlcYzf1nkiDF8wpwLUfJTAByrNswz3ognC8biJVfma5HyFQQZ0bH5MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308811; c=relaxed/simple;
	bh=4gKoPYrwSzNmHTffycoklo7nLWifj/XDDwKtEWEOMN0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f/hEVRgiLohdEKEHPLjPdZJc12B6QNfdFlYivHZB8OBaPqkZY/cvSEscTqyA3fjm4P1t/3uBtz79WzSVKqRNbrHEuRj31kTptEDMBxcKU9XOkMtJsFLOXkyEIfHKCvErgBbpKzq+rG16A8S/EH4RPRvrU6FKvuhZoV/27bwAwk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf04.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id A328AA02E6;
	Tue,  6 Oct 2026 17:46:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id 8F0CF20024;
	Tue,  6 Oct 2026 17:46:46 +0000 (UTC)
Message-ID: <be20c5a1617c7c5639a06d8d03e689541d359d95.camel@perches.com>
Subject: Re: [PATCH] checkpatch: report warning with files ending with blank
 lines
From: Joe Perches <joe@perches.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Vinod Koul <vkoul@kernel.org>,
  Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org
Date: Tue, 06 Oct 2026 10:46:45 -0700
In-Reply-To: <20261006102119.7695-1-ansuelsmth@gmail.com>
References: <20261006102119.7695-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 8F0CF20024
X-Stat-Signature: atxiaxa66ujpxqyycxzqkemd5hwkraph
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19sRjGfovsDnInHxrVocwRWauYZym9PlLo=
X-HE-Tag: 1791308806-550906
X-HE-Meta: U2FsdGVkX1/7hV+koBl21T9nfYKSCdRrrwIXPEm1KWLtE8wazdlvVV8LlfhNuZ9jtUxHb/wZtMdeTELUm7nLqXGLru1oSbWThJ1IZWI5+nbLpYBjTmIQatm+eDIqxYsulbl4wS63/9qo9A52uhwRLlx2kyEKNOg3s3mapKLHJcBLrUl6/Fq6oeBaXzysDdsiMnf/jnTl4NZPCHOlnGFJVzsV48qhl+N4yIL+Gib0PRKvIKylvIHbbL9Ju0EDT6x5Oo1KXjorBJ0DggYVRdCprRSww2SYI3MaGFyXvyCjPb7b+iGnBGcCLRqvWImBsj/y

On Tue, 2026-10-06 at 12:21 +0200, Christian Marangi wrote:
> On applying patch, git, depending on the default configuration, might
> complain for any file having blank lines at end of file.
>=20
> These blank lines can go unnotice by the patch submitter as they are not
> reported by checkpatch.pl with the maintainer only noticing the error whe=
n
> the patch is applied. This result in the submitter getting confused askin=
g
> further info to the maintainer making the review process longer.
>=20
> To address this, add a simple logic to catch this error and report as
> warning. Example:
>=20
> WARNING: blank line at end of file
> 102: FILE: Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.ya=
ml:62:
> +    };
> +

While this might be a good idea, the placement
of this test is probably not good at the start
of the process() block.

I'd place it so it's only checked once at the
end of the process() block after all the rest
of the lines are tested.

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> +# Check for blank line at end of file

[]

etc...
