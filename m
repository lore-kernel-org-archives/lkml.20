Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB7D413782
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148174; cv=none; b=EAFh4VUH509IuFywxXLF27VSgHTbvU7LR8RmqfV5EiCSTg99+r/vh5TUK/cTsz5eTBIS1BTvOaurESwc48ZmMjIpLb3HtToxAgd+q/gMgqbYYY4LPhzBsOp+undlWONtrkwljXT0lrFuAHfGAH6ceBsvjaYQiHcr2wXmNkbOkxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148174; c=relaxed/simple;
	bh=mmR9DUspbsTUnp3RqcIlue/4NJROcEYrbOZvTy8cSd8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BOWX1+7diObIH3HUJbVwqxfZDb5gxiqyf5Ihcb8l4dpM0zaRASyO2Pf5N7Ibzqn/wwdyt6JUNdzitU0bUngJ8jpalT2rTHvC2EcTtG64IsjhJDvNXOJbvtff8DY3Pi8O9t59vPpFBmw0eBMLAmCyaqPCIMQCPxB4qL3wV85fqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPn7D38z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPn7D38z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B121F000FF;
	Wed, 23 Sep 2026 07:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790148173;
	bh=P98aXVbnTVCIn2RLl8j/V+gbDx0DMTPfumfUioCK0H4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=jPn7D38zZATIIjH4keWV7URVeLakgdYo79VDeRv7ysp+33dKlrXd+G4O0JmKD1YGo
	 o37sZ4iQRGowecUIXgnxxTVa4BMc3OF6o2jpul1w17SKa8uxu7WklftTB4HSt3b133
	 WEgvke3wUmJf6qbZ57ZiRrNm/pBpgPbWZocuzSzYx5EzNGfYGSVrlvMHOGg4Td/7og
	 djx2+yTOVU+5zsMxBsMv5dr+SwfJPqhiCIP/SS0MZdGBz9WRDJFHm7hZvB7Y8aqEIt
	 DKpdHYB3wrsk/0/aAtMd7clJKKe3Xo2YbdRZui9QKJjM7q3JxnS1jLCvDsTujSvMlK
	 vhmJWX3eIdShQ==
Message-ID: <5f954f1e-c4b8-4565-a2f2-04d4067293d2@kernel.org>
Date: Wed, 23 Sep 2026 15:22:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daeho43@gmail.com>,
 Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org,
 David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH v2 04/14] f2fs: support atomic file large
 folios buffered write
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
References: <51c3f1f9-7e91-4f9a-9f22-d1ba8df357c6@kernel.org>
 <20260923032131.2227703-1-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260923032131.2227703-1-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/26 11:21, Nanzhe Zhao wrote:
> I think I can extract the duplicate logic in a helper and the full change
> may be like this?
Alright, is there a way to relocate below code block before f2fs_balance_fs()?

	if (folio_test_large(folio)) {
		if (f2fs_is_atomic_file(inode))
			err = prepare_large_folio_atomic_write_begin(inode,
					mapping, folio, pos, len);
		else
			err = prepare_large_folio_write_begin(inode,
					folio, pos, len);
		if (!err)
			return 0;
		if (err == -EAGAIN) {
			f2fs_folio_put(folio, true);
			goto repeat;
		}
		goto put_folio;
	}

Thanks,
