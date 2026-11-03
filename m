Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689485;
	b=lnfad5QCdgeFySKtBhT1xUaWieUBTK5LCkkOATj4A29ItC1aBz9Ji5bXxZxlo383AupP
	 831LtmwUmHSXvQtv8d+x7FUKZUnRveaZBeVNMpSq4AIwlNEO5OzODoEyYz8EQfitMGZL1
	 w3Euu7t9HSWVy/+A9CvuF4RezNhT212MvZUdX6XRRvMo1Y9w2iFztW+VBr8MGQhJRqrkD
	 fucwUh7htn0vytHG2D442nj7G/dBJHDgxjed1QOBV3CFZcorDWXgLcho3UkoiDJJ+vtHm
	 Q53teosT/1xd6Px9gjIZtRkyei6QQcBOcKrZVz3AAA9ZijrgELI7bDAjkK7N0tUR2wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689485;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qnKFWaTMlKg8cnc365pJfluJbbcRNfyQiKe0ltMyRy0=;
	b=lgvYG4Afm6+2pt1+0JAw+i/wIKJHpjXkoU3LmVNt/XUi9dKlPIOhOwnYMmsKpoug0PZ5
	 xfRDomeJW3CePaq2NSdT7nW7EbASbC8hgn2Pdm15nk6kvmcr9EWaa+XF9sQeAIRIIdgUy
	 7F9onxCiW0jd3i+FIpFwRppRK7B3dhsPzcsRMzrfqvosjBEg2xNkUI3lB1+hCdKMoUTDX
	 XxVsYzyR52GwUMdRvuyP9MIKakTmPhixad8q9SdZS/qOlg3aagZ0xaH5jApBjQjZSkv9z
	 /EVlMdBruTUkbgd9szmT+d2usLe/pnKmM/FUP9JG19eU5bcXx0NSpdyCaOkzSXBu0qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TG9AqJwj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7F606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TG9AqJwj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7121F00A17;
	Tue,  3 Nov 2026 07:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793689485;
	bh=qnKFWaTMlKg8cnc365pJfluJbbcRNfyQiKe0ltMyRy0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=TG9AqJwjIf3mk9M+xf0FEcLn97U3fKCOSBYeGlcMJzI55nkpEierH2rRieb4IHfV1
	 mRLjPIfdBu0GKBMiRTi4LzRvP6pQhR+Ftq8mY5W5DopvLQKsx5mPtAlcAqVPTA59w0
	 OFkhlj14/oYTeVPJtFBcXGSQFE1Lmu9dJjKt3rSCbIsckOoFjIWcQl9yozjDCApHos
	 HQVFF1QDetcndzdz53Tcscg/6semEOZzBT3vV6JhbFhma62wYM5APQJ09DyzrajjBx
	 sMjN+GJtAqNK/3KvWlBM/r9nX37mm4kgJ3Bjl6egqO+7gfzDadx/h16w3BqsKhJh8a
	 +L2YE+NlWFKzQ==
Message-ID: <6d951ed3-2d4f-4bf6-9243-ee392e423744@kernel.org>
Date: Tue, 3 Nov 2026 15:04:42 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH 01/20] f2fs: use block-based index and size
 calculations in remaining paths
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261102193952.3002018-1-daeho43@gmail.com>
 <20261102193952.3002018-2-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261102193952.3002018-2-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 03:39, Daeho Jeong wrote:
>  static unsigned long dir_blocks(struct inode *inode)
>  {
> -	return ((unsigned long long) (i_size_read(inode) + PAGE_SIZE - 1))
> -							>> PAGE_SHIFT;
> +	return F2FS_BYTES_TO_BLK(F2FS_I_SB(inode),
> +			i_size_read(inode) + F2FS_BLKSIZE_MASK(F2FS_I_SB(inode)));

Equals to F2FS_BLK_ALIGN(F2FS_I_SB(inode), i_size_read(inode))?
