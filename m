Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492986;
	b=ml642QbtciZCsTrWOxF9cNSIR3RX9LlfsWbWi2TNcVdk6yML6xtv5a/kVp9HRTDoVUQf
	 cCpuceS8mZ1/aBvRPZSSgHYjR/UyHHEwQf0HIGmNMtzjUTKjWrXdqghgCFtie/A6B28/q
	 SgNrF9Q2PjOre79ySucAOKwguMZfbwVnt5KTmGo5KK2eodk9AszqpkwPvowwqYD+3ay3e
	 Md7G77hw18Wp/yya8WA6I/77d2tgXuo1o239ZEnAoCTOJ1QY1jtwkf0IL0Ot9Tbb2MeCp
	 qvZTxhB31xCCRn8/88bFH2t2pePH2bhZWhOVgBYHlbS/r4KZsz4sE98GBhPArdyL6hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492986;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=q7oRBLeDwrt9uyhNlPp9kzD7zICpjE995RMRkocsOTU=;
	b=rWKvJlwHfXdViEnwg4q8Hb0YLkejFM6Gb66OPh7HqiW7OhT5hBXwX2mk7aSVGZkg255M
	 VRObXLJBO2wAe4VKFiRc/ysj2rQ3jpv+qldVJciYRryVsmF1Yetrn8mRRw95HT384Z1Y/
	 eohsI6+s0sT3taSBNxdNCN4FnlmiwZsUHR59OtotauNZVIlkfSixsBoLYJOESDyQlG7zy
	 vomJLRZbhWDQpcP3mtXe29FWj0bDw6RFaOo3rcKDmVdTwqGAzo9qET3CkMfWKIiQk5ILb
	 GfeNq/uI8O/Eg17yVEdFJXIwjL7tEMKfnYNjzmInkqTjDm2soOoO9sXAGDVwCalHhnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=FN2+87nO;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AFB60A2604;
	Thu, 12 Nov 2026 14:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85AFB60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=FN2+87nO
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0E9AF40920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1794492978; bh=q7oRBLeDwrt9uyhNlPp9kzD7zICpjE995RMRkocsOTU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FN2+87nOa57H3OWzebvwwf/8b7uHu/5Wzk0NwcN5Ouxd4YDqkKxzFHD2CSyzOJoaY
	 REEcN+E9DhgSkf/reFW3Or81vZGtIMLz4KqqCgAv/X3iA+5kVgy2oYUZFCOpZrVvxz
	 sSkoU/IdPlrkdEglnluN3GIafHtrpIxiFZb0fwsEtyadL8VUKt70K5LJX/sk18ZTSV
	 IFd4aqFzXz8LS2cNrgeIEgn0c/TWLd0PO/wDH8zBnZ2TkWLrmklxVBwxL7JYeFROqg
	 l3bwSN5Mgww4YrHCHkkzVKmtqioT4I3+XD+s0ZM5hlNTCuTu5VFqnDHgsgP4AmMsYq
	 QwzdaV/2BnS8A==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0E9AF40920;
	Thu, 12 Nov 2026 14:16:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>, linux-doc@vger.kernel.org
Cc: danielmaraboo@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, sashal@kernel.org, kees@kernel.org,
 linux-kernel@vger.kernel.org, ic.gabrielribeiro@gmail.com
Subject: Re: [PATCH v2] docs: translations: pt_BR: add init troubleshooting
 guide
In-Reply-To: <20261103033349.908133-1-ic.gabrielribeiro@gmail.com>
References: <20261103033349.908133-1-ic.gabrielribeiro@gmail.com>
Date: Thu, 12 Nov 2026 07:16:15 -0700
Message-ID: <87tslm6spc.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Gabriel Ribeiro <ic.gabrielribeiro@gmail.com> writes:

> Translate the init troubleshooting guide into Brazilian Portuguese
> and link it from the pt_BR admin-guide index.
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
> ---
> Changes in v2:
> - Add a commit-message body.
> - Match the punctuation in item 2 to the source.
> - Translate "painless" as "o mais simples poss=C3=ADvel".
>
>  .../translations/pt_BR/admin-guide/index.rst  |  6 +-
>  .../translations/pt_BR/admin-guide/init.rst   | 58 +++++++++++++++++++
>  2 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/pt_BR/admin-guide/init.rst

Applied, thanks.

jon
