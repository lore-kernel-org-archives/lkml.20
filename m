Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DD142E8DC;
	Mon, 31 Aug 2026 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197789; cv=none; b=jzryVQOZJR5zZ6Vz0kGv0JwTx57+I8KyOtVTGcfuHtzC2nJubsFZGrKmIvgQtPwBS2d60PZYo45zoOVPfolcrXNdVPFBPa8ng58dr5yNT9jBcTSHkl6u8XMQPZyUGGh8vi2DRstzEgc8zZ27Y7SQOB0jFOWyV32wZYpLEyWnkBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197789; c=relaxed/simple;
	bh=atUHWotjWj9I1zvE5CA6amrMEkKrBJMj4hGV69zt/58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvhoJnEhFyl5VvvkRRRf98K1HX8KtN+ndeMPPcOH9nzVQw1EuwqoA1J7eiP3KY0f0wPYQTk5AuXHbbv1gNJuvjQ+2KbIRdfCbs8rKO1CiZrKB9a8/ZTTp++gAhZYS4SQ9ZPvSehcIFJit5Ddd2cTZuiPS7oGO3xEphF+2aHJb2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Vp4EjFB0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Vp4EjFB0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Zt6jcMzTr54dgfKm/mi8S28qOdbp3Fz6tFvslmpKPes=; b=Vp4EjFB0t5HB2Nomo3USO9Kf29
	vEtCXm1gjnxqZBM+vabVi6din/5uQmUZvZ+SxEqlehnZXOjs7XQj7AalDoFXUXO6Iw5FRTn3fDkku
	xNvx6kmpPz/pOTzW+emJkKjS57BZ0yTJ+uDbhc55LmGQZxxQqllXHAfvC5lTEu8SalK5Dy4FCQ2VA
	Qx2/rh0StdGhOOwYiDcWmMJluZksk9RqAx53I3CcmvYc6xSdj71YUkHH/GH9dN6sRuUIuhYejIn9w
	OcGYjFZ2m+9OmD6kC2iiTcDPs75RcOhYbvOOF6eakNAwgzTQceusK2nOsoqrtrNW3OTWC3+2tSafY
	XvbXn+TQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15vm-0000000ACwD-1v2a;
	Mon, 31 Aug 2026 17:36:26 +0000
Message-ID: <4ffd85d0-05b1-4667-b972-de3bba0d2ee4@infradead.org>
Date: Mon, 31 Aug 2026 10:36:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] Docs: changes.rst, ver_linux: add tools
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260831151605.638172-2-manuelebnerli@mailbox.org>
 <20260831152256.638615-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260831152256.638615-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/31/26 8:22 AM, Manuel Ebner wrote:
> lzma is required with HAVE_KERNEL_LZMA set to y
> lzop is required with CRYPTO_LZO set to y
> iproute2 is mentioned in changes below.
> "ip-route2" -> "iproute2"
> syslinux is and genisoimage needed for ´make isoimag´
> mtools is required for genimage.sh
> 
> add tools to
>  changes.rst and ver_linux
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> should edk2/OVMF be added aswell?

                            as well?

> it would be for arch/x86/boot/genimage.sh

  when building an hdimage
  if the kernel is compiled with the EFI stub.

How many qualifiers do you want to include? :)

I don't know the answer...

> ---
>  Documentation/process/changes.rst | 10 ++++++++--
>  scripts/ver_linux                 |  6 ++++++
>  2 files changed, 14 insertions(+), 2 deletions(-)

-- 
~Randy

