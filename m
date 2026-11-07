Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794045938;
	b=TfrmPcpn/PT9MclBy43LjmrIIMap/RQuaJztDHNAvnSspPy87LD9BJYM0iIOIzT2ojop
	 Sb4ZdCfhEvhRi7NXNIk8vHkyk9C+90pZgQs5VaRjpVJDUkjLCBDNJfWmVnGmUC5sdRQGP
	 aqym/+76xgX87SWifvjRD8dpOqcKMQsCmR2DLZ1HnL2kB07uVTdJKKy37YeSS6IM741AM
	 qDDJfWi6cUf1Jhv7oZuWJdFGMtpM3jqiPgwQI7uYDx7xbkILNvBotRA6IL3z4ZShll6ev
	 pkN9xHRyXXRCC0qobnYAPf3mV9B8UoWb6lyjsn62PFycN1XNJnYdD76SQUlKn+pff6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794045938;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Spam-Status:X-Rspamd-Server:
	 X-Stat-Signature:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 X-HE-Tag:X-HE-Meta;
	bh=m0kerLlbT6AjFU23WV/S8d2Kq6T8CJ3BQ/lv3b/4+nA=;
	b=lBgap7UY6nWDW6CpN4hjG2a34L6f81tYnL19aPU0qDDv+04dSpv9qgQQTK6MQQMbkGWx
	 W6kq88nhh8VAkw2mVmi0gLJBv/WBwgmLmrVuBob7d5HF1Ob7uCEaxhnusP4w546bPUaty
	 j7BcGrZc5g2hJg+4MJ0jsNDBQnIhFAevEZ4S3cKlWit0fy8wPdGvtnrCAR8eHEZ/szKLD
	 FZs+2kTMT1K+3uOjFDCpl192A+iTPpy2kZhY1dfW5FbqZmyQWwIr3Y8rOc/T71IPOso/7
	 SFKEbCFCP8CZ5MQ/OgopDKtkAWrUCo6zk+xEwTQdYWqEVDpypvGwz7kK9QsADbghawg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.17
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0EB606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D0EB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf03.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 81A7AA7155;
	Sat,  7 Nov 2026 10:05:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id C41E16000A;
	Sat,  7 Nov 2026 10:05:29 +0000 (UTC)
Message-ID: <32fd1f6ad824796b525ffaa3ebdd8d2610858bf3.camel@perches.com>
Subject: Re: [PATCH 03/18] Squashfs: convert SQUASHFS_FRAGMENT_* to inline
 functions
From: Joe Perches <joe@perches.com>
To: Phillip Lougher <phillip@squashfs.org.uk>, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 07 Nov 2026 02:05:28 -0800
In-Reply-To: <20261107052843.725239-4-phillip@squashfs.org.uk>
References: <20261107052843.725239-1-phillip@squashfs.org.uk>
	 <20261107052843.725239-4-phillip@squashfs.org.uk>
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
X-Stat-Signature: h4i3nyk6rtfcqk37ryd4o5d8end6ikbd
X-Rspamd-Queue-Id: C41E16000A
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19xFb1mqSm3jyCdWAuxUsH6+y14DisHuDM=
X-HE-Tag: 1794045929-603438
X-HE-Meta: U2FsdGVkX19gtfwwViullJg7nKo60gvEH98thrl+saFM0fYUY0mCGpQxEluD7feRVZGLhGpMF1p71O08kYglAz9+lWG2VzbKrWQAitY3oDXE4ZLd/VBBkfsH8LaQ28+TcmL8qHoRkzahUIeuWCaqspWdZhCRzvJKjXGg8ebrAxUSd/bxlQEMTdv3iV3gTiF9aASBFALvrdPbTU778GZKVMoKGJtyXGE0E+fY+lCyn/oW90Q4HH5XYpqcdW2cRSkWtfgycQyZyg+CinX1BohHRrya03HjIQ5p4xcChHg6NV5lovI4OVyXlFb4Az+vt6Br

On Sat, 2026-11-07 at 05:28 +0000, Phillip Lougher wrote:
> Convert old fashioned #define macros into inline functions.  This has
> the following improvements:
>=20
> 1. Inline functions are typed, which makes the width and sigedness of
>    input and outputs explicit, which reduces errors.
[]
> diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helper=
s.h
[]
> @@ -51,4 +51,31 @@ static inline s64 squashfs_mkinode(u32 start, u16 offs=
et)
>  {
>  	return ((s64)start << 16) | offset;
>  }
> +
> +/* fragment and fragment table defines */
> +static inline s64 squashfs_fragment_bytes(u32 fragments)
> +{
> +	return fragments * sizeof(struct squashfs_fragment_entry);

Needs a cast to make the multiply work properly no?

	return (s64)fragments * sizeof(struct squashfs_fragment_entry);
