Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684263;
	b=wAk+2pWMsxCo+mu4QORi4oJw+QWdhcW6JE1aVJw2lm/eHrYpNU3bBRmlRFAJpH7fbng3
	 K/0YWtkFjU89pNYONwlNrzHTMf3C7R4RztnqOEU+bDCri0sj55GIf+eahjoBviqiwCdZc
	 ShKIOpDItaPNeUjbHxo/3krD8hV6Cupz5y8CwtaNb+LKvdMkDIrwlR2XiOaeFLMEpsfvX
	 t0mNr5cFa3Qn8FVNbmNmCcqIGBg5ELjmBUuHUKwU8lO3ugpc2jz5e4s9MywdrRJJGAdA9
	 z3220CRuJIGZ5B1he9oOvEbQp924RMhSO+EMp/o3N/pstCyn7oDr0MTMN2YI2xyqZBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684263;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=1dsQcG/xRxkwASF5f3rK6MWB7/uttInbTcYfUaLqxI0=;
	b=r30sS8zrJEOMGljWGV3atnXd1VhKi7fGQdK2eqjrC4j0LtZh06G43V9PJvhFy424smTv
	 L5bK7PBfKlV7fmfUKOmIXA1nZSXj3emoB8i5gGd8LBw+wL5+/TYQQkd//Ky1816oXJNTO
	 5SwuG9KfmkWbFWW3snqQwRqnn2xiOqusENEVJ3D8YDzQg8azVXrV2u81Iv5g68pGSHJna
	 0nTTnpfUrlFa/afYYk/Dbw5R+vDM8mskqwoqZbICWOH0G5qAaN7cUwL1N7sL4pRb4ZYU+
	 H+L5ppw8gHu5HWibL14DzijypGa+AZqDM9wRGcCVERDq1BWvUNljbMegBb6t3Lm9xQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=WBtw6YoF;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A08C606A319;
	Thu, 22 Oct 2026 15:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A08C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=WBtw6YoF
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 83085408DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792684261; bh=1dsQcG/xRxkwASF5f3rK6MWB7/uttInbTcYfUaLqxI0=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=WBtw6YoFez051Ywtntsg6uu9wNOoQTzrRvfwI+fy0sH3M7wgtbwbKIUVCCloU1/Zf
	 nBjBIzpYwaPKPCoyfUf9CR5R8tAfTCs+vb/Ul1Nbr5so64sC8OnX9poKe/9z7Vz/rn
	 NynpI6SLmNp71KN/bgCFnmBO37aA2YENtX86+zKSlTd5nok7lR4gCR9KZ/hJH4GFhs
	 Or31EAFIlfPNbMw7WG1AabTFZjlpm1+sbpFFhPqW0Cc7LiBM/CVrvuHNOvAieuIuga
	 6/qrNMRU0iiwsYj5tFeiypB7YxsPXo8EW6wy5xH45ABB95Ev9JbIUgEtcbBaMPOBWN
	 A0B3r9nzsmF2A==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 83085408DA;
	Thu, 22 Oct 2026 15:51:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, rppt@kernel.org,
 tudor.ambarus@linaro.org, mchehab+huawei@kernel.org,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux@weissschuh.net, linux-kernel@vger.kernel.org,
 pasha.tatashin@soleen.com, aleksandr.loktionov@intel.com,
 kexec@lists.infradead.org, pratyush@kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH v1] docs: xforms_lists: Handle DECLARE_KHOSER_PTR()
 struct members
In-Reply-To: <20261015020313.946940-1-pasha.tatashin@soleen.com>
References: <20261015020313.946940-1-pasha.tatashin@soleen.com>
Date: Thu, 22 Oct 2026 09:51:00 -0600
Message-ID: <87y0bp20pn.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Pasha Tatashin <pasha.tatashin@soleen.com> writes:

> KHO ABI structures declare their preservation pointers with
> DECLARE_KHOSER_PTR(name, type), which expands to a union of the pointer
> and its physical address. kernel-doc does not know the macro and does
> not see the member: it warns that an unnamed member is not described
> and that the description of the member is excess.
>
> Translate DECLARE_KHOSER_PTR(name, type) into "type name", as is done
> for DECLARE_KFIFO_PTR().
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  tools/lib/python/kdoc/xforms_lists.py | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

One note... these:

> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> prerequisite-patch-id: 557b4f406b7530b8be07d3e3aa6015ad89ceaa6d
> prerequisite-patch-id: c0430a4f0096e4be93a6200aa4e8a1d392238ca5
> prerequisite-patch-id: 524c71eab38a9175f9920f38717c8ed3b157299f
> prerequisite-patch-id: 61cfc274edef2fb23a1b867c9e0d063578387c45
> prerequisite-patch-id: ac022b05628f8e495a224216352aa037a022aae4
> prerequisite-patch-id: 50668baf257da9873190d08f21538ddc453261a8

...make b4 go off on a wild goose chase and caused the application to
fail.  They aren't prerequisites at all, I'm curious about how they came
to be here?

Thanks,

jon
