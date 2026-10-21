Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601209;
	b=lfrCQghImGFnPtHAm3pNSfthHKXJFvLFUs+OmmtD9l3Rph8CM6ImVNeIS53vLcTPEjid
	 JcQk3ZPw4Lys6YLc90TOWbcBZTbDd7qbdYvpIGz7n6Ll0KcOuSfh/zxdt+nzybZZ+8mO+
	 Q4TmNsxOrxL5fCJi/5BDHI/ibj8gipMWHv27qboXHTBG8knw2Fd2BSXGXDSpCsjUq7ABZ
	 KXzLgwLa2+gVZe3SBLiWgVsC9SOrPD69SnhGPb0PcGuZknTvpNw3oIDalT/b820JLE6om
	 S3uwV7n2U+JhbiiKzowPG/D88upfkTabDTneQjWOPLU8eA5qInrp57mri9knT9fyc/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601209;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=hGsPFTGhuD+EFAfimhKxcuiQsF37YjuNCeWNcqrULNM=;
	b=Z3emUtyMnq4dqYf7u0Ue2K+capou2BL8FseqXYQrffK82lEmQx51s3AYhx0lNARiYOWD
	 TPq2qPQkTZhBLv/eVVBcDwsm1Z5e/LdCDPXRQb8LBx6t+5fGr9tvWOyP7ab+o9j8fMeTF
	 9IeYEWndogvfzoVWQU2NcS8V4/XaYRZYSihhv6/zpSxyfqQlD2eGm3gARukGeRsPpAo7e
	 3OR0w1jqVKkZ4TdzKZFhjQXCxR//7PtqKtYpXlAXUsy08RVniTA5fjGAmGwcVcxy4YaCG
	 +thkN50AtS4Td7nltz6Dr/UOpvx3a+dFpysod3Y6Hllk2r/O4JwkLUDQDm/PP2JJTsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ohly365r;
	arc=none smtp.remote-ip=91.218.175.122
Received: from mta0.migadu.com (out-122.mta0.migadu.com [91.218.175.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B04606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B04606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ohly365r
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hGsPFTGhuD+EFAfimhKxcuiQsF37YjuNCeWNcqrULNM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792601205; v=1; x=1793206005;
 b=ohly365rP5YicHkWTVDpFseAOTBH+m/HVliNR75JliuqpE3dQhk4ytqKdHmYjY7mM3B5ZRR+
 KQkkgOCIIri/BLYC2o8WfWMLBiQ2foG+c8MlscfFlYXeibcpiTJ7Esqi/0YWWdZMXsGbRZC5g53
 0CO5ArzG5yERDhVzE0U0/ns0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 79a4c6e5edfa86ba;
	Wed, 21 Oct 2026 16:46:44 +0000
X-Mizu-Trace-ID: 79a4c6e5edfa86ba
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
 =?utf-8?q?Nicol=C3=A1s?= Antinori <nico.antinori.7@gmail.com>,
 Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Benno Lossin <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Jori Koolstra <jkoolstra@xs4all.nl>, Miguel Ojeda <ojeda@kernel.org>,
 Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>,
 Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject:
 Re: [PATCH] rust: i2c: remove TryFrom<&Device> implementation for &I2cClient
Date: Wed, 21 Oct 2026 17:46:43 +0100
Message-ID: <179260120355.752.17615461362324987926@linux.dev>
In-Reply-To: <DMAIXJB74Q1O.9A03KK0SSDLH@garyguo.net>
References: <20261019152329.620610-1-nico.antinori.7@gmail.com>
 <179258597583.20422.10358976352101642829@linux.dev>
 <DMAIXJB74Q1O.9A03KK0SSDLH@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Gary,

Understood. Point accepted.

The case I was worried about has an alternative resolution that doesn't
need anything from kernel::i2c. Proceeding with this patch as-is.

Acked-by: Igor Korotin <igor.korotin@linux.dev>

Cheers
Igor
