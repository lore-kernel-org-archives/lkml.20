Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C870A381EA1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489564; cv=none; b=RFynG6d7LdBdRA8F5A5Oj5NuYRKOGWDn0Hb+Bw0RqZDv4Lkb/JA/dJ8gCFFmVoVKoA4zBsfVhAYKho45MXzCol5WMIxplq6pgLKQibFCXlt0X8bbDN4TBgsEoVIeCt4obK2HZpTI0iRLygtz3HpVNm1kePh2E7WLExQR26qe018=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489564; c=relaxed/simple;
	bh=4Hx1f7fe/uK0B/9gFaj9YZVNjCvuJAYsGadfbYtzQxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDikU1fjEIaeD24FPjPGmttfUW04jqfBW9pDzDO5GoZA7NT/nG7LcUZT3kGlWQiCJzdAWhKrsGGzbZdOpvl5CQJ8rT2/2Oor1VP9Jj0kiuYmOeVGJLBJ+/lMCuNU14aQab5QT0BxWRQfRw5hlJTcPe8dj9Ev1kMfh6/kShifN/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=k3fIHiuH; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="k3fIHiuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1788489551; bh=LPLklTZWfBkfurqp9l2wAavG13bqslQbCU8JCiFVHWE=;
	h=From:Message-ID:From;
	b=k3fIHiuHrOIDm6CWHHRkB5oFXzaGUqN8PlsIbTiqKBGogy2gvvzYR1HPvksfhdNLV
	 MtbIvwNet31GmRa5TbLb9LEuX2GptiTksdyfXAdY4XOaLQbKQGp50bjRTa+3AMJ1kx
	 T/6uyx4UldCNMpoH8nWDRWmi1FIw5Yj5IiseGOio=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 6ECC9C0091;
	Fri, 04 Sep 2026 04:39:11 +0200 (CEST)
Date: Fri, 4 Sep 2026 04:39:11 +0200
From: Willy Tarreau <w@1wt.eu>
To: Suraj Theekshana <surajtheekshana1111@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
        security@kernel.org
Subject: Re: greybus: CAP IMS/auth memcpy not capped to ioctl buffer
Message-ID: <apovTwHg1CwWuPHF@1wt.eu>
References: <CA+_JcNS4PREBDzqmnHSu6h5jqfK=NiX5J+14JY-JDaegoQ2xLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_JcNS4PREBDzqmnHSu6h5jqfK=NiX5J+14JY-JDaegoQ2xLw@mail.gmail.com>

Hello,

On Thu, Sep 03, 2026 at 11:35:13PM +0530, Suraj Theekshana wrote:
> Hello,
> 
> I am reporting an unbounded memcpy in the Greybus CAP driver.

Note, there's no need to Cc security@ since you're also reporting to
public lists.

> Product: Linux kernel
> File:   drivers/staging/greybus/authentication.c
> Header: drivers/staging/greybus/greybus_authentication.h
>          include/linux/greybus/greybus_protocols.h
> Tree:   torvalds/linux 8ab1afb
> 
> Observed
> ========
> 
> cap_get_ims_certificate() and cap_authenticate() do:
> 
>   *size = op->response->payload_size - sizeof(*response);
>   memcpy(dest, src, *size);
> 
> The response buffer is allocated with gb_operation_get_payload_size_max()
> and GB_OPERATION_FLAG_SHORT_RESPONSE.
> 
> The ioctl destinations are fixed:
> 
>   certificate[CAP_CERTIFICATE_MAX_SIZE]  /* 1600 */
>   signature[CAP_SIGNATURE_MAX_SIZE]      /* 320  */
> 
> There is no check that payload_size >= sizeof(*response)
> and no cap to 1600 / 320.
> 
> A 2048-byte payload therefore copies:
> 
>   IMS:  2048 - 1  = 2047 bytes into certificate[1600]
>   AUTH: 2048 - 65 = 1983 bytes into signature[320]
> 
> A payload shorter than the response header wraps the unsigned subtract and
> memcpy uses a huge length.
> 
> Expected
> ========
> 
> Reject payload_size < sizeof(*response) (-EMSGSIZE).
> Reject copy length > CAP_CERTIFICATE_MAX_SIZE /
> CAP_SIGNATURE_MAX_SIZE (-E2BIG).
> 
> Reproduce (no Greybus hardware)
> ===============================
> 
>   git clone --depth 1 https://github.com/torvalds/linux.git
>   # tree used: 8ab1afb
> 
>   gcc -fsanitize=address -g -O0 -fno-builtin -U_FORTIFY_SOURCE \
>     -I gb-poc \
>     -I linux/drivers/staging/greybus \
>     -I linux/include/linux/greybus \
>     gb-poc/poc_cap_headers.c -o poc_cap_headers
> 
>   ./poc_cap_headers
>   ./poc_cap_headers auth
> 
> ASan excerpt (IMS)
> ==================
> 
> CAP_CERTIFICATE_MAX_SIZE=1600 CAP_SIGNATURE_MAX_SIZE=320
> [IMS] payload=2048 dest=1600 mode=ims
> =================================================================
> ERROR: AddressSanitizer: stack-buffer-overflow
> WRITE of size 2047
>     #0 memcpy
>     #1 cap_get_ims_certificate  poc_cap_headers.c:18
>     #2 main                     poc_cap_headers.c:61
> Address is located in stack of thread T0
>   This frame has 2 object(s):
>     [48, 481) 'a'
>     [560, 2173) 'ims'  <== overflows certificate[1600]
> SUMMARY: AddressSanitizer: stack-buffer-overflow in memcpy
> ABORTING
> 
> ASan excerpt (AUTH)
> ===================
> 
> CAP_CERTIFICATE_MAX_SIZE=1600 CAP_SIGNATURE_MAX_SIZE=320
> [AUTH] payload=2048 dest=320
> =================================================================
> ERROR: AddressSanitizer: stack-buffer-overflow
> WRITE of size 1983
>     #0 memcpy
>     #1 cap_authenticate  poc_cap_headers.c:26
>     #2 main              poc_cap_headers.c:54
> Address is located in stack of thread T0
>   This frame has 2 object(s):
>     [48, 481) 'a'  <== overflows signature[320]
>     [560, 2173) 'ims'
> SUMMARY: AddressSanitizer: stack-buffer-overflow in memcpy
> ABORTING
> 
> The PoC includes greybus_authentication.h and
> greybus_protocols.h from this tree. It is not a live
> CAP_IOC_* ioctl and there is no in-kernel KASAN frame.
> 
> Impact
> ======
> 
> Local overflow in the CAP ioctl path if a CAP connection exists and a
> module answers GET_IMS_CERTIFICATE or AUTHENTICATE with an oversized or
> truncated payload.
> Not unauthenticated remote RCE. Same trust model as a malicious or buggy
> Greybus module.
> 
> Files in the attached zip
> =========================

Please avoid sending binary files, as developers are unlikely to open
them.

>   poc_cap_headers.c
>   ktypes.h
>   asan_ims.txt
>   asan_auth.txt

As requested in the doc where you found the security list's email,
please always try to propose a working patch so you can get full
credit for finding and fixing issues and you can save maintainers'
time. Please also see Docuemntation/process/submitting-patches.rst.

> Regards,
> Suraj Theekshana

Thanks,
Willy
