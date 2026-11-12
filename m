Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497549;
	b=xCWsK8jN8VuJV5HGQtnzTrFWBEjPxsjBifg/TWqBZI9hiN6Bcv7ivcW42133AOjXW4N+
	 I6GPbF84easzFZzpkI+N/9/tcvm1M6+8ilYYzBDTvzOFsnc9um53DUoxUv139YoQA25N7
	 WLJT3LgwOK0zEeZoux1R5mGyIdJGBmBJyPtGSxDrebKnl2OWzZ+qYkzy8IDl+92TvaNqY
	 zokku/uLzx+M6X3ldTYRhnqxfV+TSBEVNue0A/prE6WcQ1dPkSG7dP/61WW28f50twFYL
	 P7qy5CYFQ7/i9Oj9GljI5oFVvLgZF+gGqBKl+gFVSPZ3+itOTO/GcMqGVmXermyOPxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497549;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2HV5pIaJUW+dUHHgRqv3PffptZav2VV3ztqio+cIYT8=;
	b=VZr7BhskciF8V4PaFTTjXHlQTcUhZKXpaYdvNFqTHSfpDNukYMbTQyK5Qbe52+zZU7//
	 jGyxiLjwHSCs66LAem1ikrweQYU4LpBx9yJE7SvRJYAlTl5BPGdt99pSZ1jiIm/JUFlxQ
	 AQnEKmIaQChyHi/6hnE29zqcTAPK06yOD78QpQXzLLLe5DOKFSWYvOB0vhWLHnFF5ZKBx
	 I04EgFwSj1ce1LDEZ4/DGkhvFBDXb0pl7DvhC3/dgYVKtfkuj+fMLN66/W3Wvg6U52IU1
	 ZA33d2rdMgYzpjTho/BlKXjl5bWVo/er1XsNq1mtQu3VD5oMeV9anFtHDzXiEk6mTKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Gyrw3yta;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5128C606A32D;
	Thu, 12 Nov 2026 15:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5128C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Gyrw3yta
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9B85440904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1794497547; bh=2HV5pIaJUW+dUHHgRqv3PffptZav2VV3ztqio+cIYT8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gyrw3ytaUjKDwqy8Qq8apj1ik68Yod9XT8x/HMQpLuFqxvt2nkgfUl8oYb+W4lElD
	 VCiSYqAfDMZnkaxJOSOby5Yrk/x1jxp/lXIROyekloHf7KWCR+KbRtaHVFIzltNmuG
	 hCE5WqybrvUoPFGd0vE+CP5VqCTTTlgE6reV6QiYrM0MstCbWL8z8kF+p17sTxxa0V
	 7H9vaEVM/rV/1K//q1GX95IB9Jr07LO319sm+o+OKHTkiNIHVgbl0P1ztrLJoGt0cW
	 SfuESgNllQiUzH3QdE6ZuGh77jpQcS/Kz5J7Gc4E/iGP2AV93L6IyN0CdqY6o05E1s
	 jav9t6+BrkgXA==
Received: from localhost (unknown [151.38.237.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9B85440904;
	Thu, 12 Nov 2026 15:32:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>, linux-doc@vger.kernel.org
Cc: danielmaraboo@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, sashal@kernel.org, kees@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: translations: pt_BR: add maintainer PGP guide
In-Reply-To: <20261029222951.19065-1-ic.gabrielribeiro@gmail.com>
References: <20261029222951.19065-1-ic.gabrielribeiro@gmail.com>
Date: Thu, 12 Nov 2026 08:32:22 -0700
Message-ID: <87mrre5am1.fsf@trenco.lwn.net>
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

> Translate the maintainer PGP guide into Brazilian Portuguese and
> add it to the pt_BR process index.
>
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
> ---
> Changes in v3:
> - Preserve source certainty, tone, scope, and emphasis in reviewed passag=
es.
> - Restore the =E2=80=9Call downloads=E2=80=9D qualifier and remove the un=
supported software detail.
> - Clarify Nitrokey eligibility and Git tag-signature wording.
>
>  .../translations/pt_BR/process/index.rst      |   1 +
>  .../pt_BR/process/maintainer-pgp-guide.rst    | 898 ++++++++++++++++++
>  2 files changed, 899 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/maintainer-p=
gp-guide.rst

Applied, thanks.

jon
