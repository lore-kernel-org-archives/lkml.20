Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049089;
	b=hpBg4XT77M5EaR1HB1u+x2F61tR7AOom/LZJSKPflGRDl/J5w94/RddC8uq6IMu2RYu1
	 BBcVeZhWWYai73C0uzQ3ysL1KlruPlEv+FjXLJcVXjGoNrGqfgEeVZ/QqiaMmyVIogqiZ
	 RRXzx3ytKOEnatYtH5HY3uIUQ/YrhcxfaAnyyIIiSLN/ArJQqvw03Uxld0BJh6la375Zh
	 fSNOJN96l8bacoTsPkNrJYfeEXV3oqZdIKswsg8rIiQtUHXTfOXqbc4fZ41WqesLHa6rX
	 HOaKJkphP717cotfhUjsg11EtCeBK43YWjZYLN90iosCAICSi9M0ZwzdSVBa2DN38xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049089;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=88cOKsgzBHwFaeGHE90s/Hp3sATSOyhOlDyqPfKvTro=;
	b=SrjvVAVpekfh6genp9whNPsfnw4ZCJTmVu/lbrP4Cydyd/aj9hmWkyvw6y8N+Of3TBCH
	 yFA5OdjkIZR0eFK7aUDh1a2jqx05f+l2ORUraPgmAJUjIm7O5HTJ1QRrfgyyQ+bHFopyf
	 RwpY3wPvocNBOD6JaWbZQODlwENDaBYPdSdUG+4FDoE7LjPpzUU2CUaqD5pYWafKwzsP9
	 RzOkTfQ0VOLvvp/8ZWt6LcyMjBuiFJecj4lfUY/sus7GNerUHOa0C0YQJeVdcuH00Rig0
	 3wn4EHUeCmuGHLoBbCUTIeGn+j/jU437RYdlojWZt3mY2d7kZAbzOdmXK1MHtfOd03Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o2hwhDZO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088B3606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o2hwhDZO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBF41F008A2;
	Sat,  7 Nov 2026 10:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049088;
	bh=88cOKsgzBHwFaeGHE90s/Hp3sATSOyhOlDyqPfKvTro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=o2hwhDZOeqvqKqrC6smIGGNwBCWOy73kQPVHQ4hDf8zhs731Or+6/0MFanFM8HZ1d
	 3DS2iqtx18ewjMxNwZPsBrxwP3X3cVp5uGjulFw9blzJ8U9x3K99+RMZFClrDn9PL6
	 5tD80HEbB7OCihts7dF/CqgHIW/U2vySiC8+fXU8dq0E1xYe/3g8x8FbfazjokhQD3
	 A5FOpZ70stCEmB3pUSyBvqgf0c6wwrji3dhPqRA2Uy0T8Maj8bs3pJLDzA864gsanM
	 5JdOMRN+WOaITRYKpq1bTqgvLOIOvIM1eM2EOdOg7f+IyaFQ5uJAgWFxvY22NiPWdi
	 OAcEeV4U6zuNg==
From: Mike Rapoport <rppt@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	akpm@linux-foundation.org,
	rientjes@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mm_init: avoid overflow in percentage-based core sizing
Date: Sat,  7 Nov 2026 12:57:59 +0200
Message-ID: <179404888292.1473634.16271793133324936667.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106072354.2234189-2-thnkslprpt@gmail.com>
References: <20261106072354.2234189-2-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Mike Rapoport (Microsoft) <rppt@kernel.org>

On Fri, 06 Nov 2026 09:23:55 +0200, Avi Weiss wrote:
> The kernelcore= and movablecore= percentage calculations multiply the
> total number of pages before dividing. On 32-bit kernels, the
> intermediate unsigned long product can overflow, producing incorrect
> memory zone boundaries. With 2 GiB of RAM and kernelcore=100%, a
> 32-bit HIGHMEM kernel incorrectly creates ZONE_MOVABLE.
> 
> Use mult_frac() to calculate both percentages without overflowing
> the intermediate product.
> 
> [...]

Applied to for-next branch of memblock.git tree, thanks!

[1/1] mm/mm_init: avoid overflow in percentage-based core sizing
      commit: 36557d74a757a4bb71bb1492449680177687f5a1

tree: https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock
branch: for-next

--
Sincerely yours,
Mike.

