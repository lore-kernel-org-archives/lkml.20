Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39569280CD5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945480; cv=none; b=daLGW2K3f5ELM8IZAb1I/2HiT7H9lWwxe52JIZFi6RaQGhUUVrAjkxZYI8zF+rxqohVbnUyqTxjuwQdJP/ZghuWiaVjpwDOPJ6Wd9RW9dn2UBNXG+3gEDnXI71x8JsCZX6hEiW4iN7ytbndCncGJ+B2jcpD54WmEYne5h+c9uAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945480; c=relaxed/simple;
	bh=DN6/7ue80IksIhGOseKIaTQF5vAzBuWQWJAIhb2gigY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pty+vBz/ISc3CERSd+s0zlv5Ak+Vjfz+FSIO1aAu0mw8FUZvsXFQCjdWoIjbwMuAI2zjZ2dCx5WmJgCL5MS6uW5awM1wUvS9iTQ7kx/6H17t4q6o0oWjqov+KcfLG9rAIUUgtGoblJ+BI3URif9JtSAjHBqd2eT/jdFrIWfaYoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMkaoAM6; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMkaoAM6"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b059eae96so1890322f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790945477; x=1791550277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rqy6pEqFoYmqvPw6OBjhCQ0EBbG6kK36+Qp0DgFgLS8=;
        b=DMkaoAM6GmoAt8hI+t7wqrwHgxmPhimZ6nn+DxUMD+/i8+QFk92p8mdNrR28ZOn9cG
         tDf9ok146VnXL6WWPaODUC3aLA2/p8ua2CDRaSrUshM12kYgS40nFauAxDE4nkSF+X03
         kAmefDb4z+uWW/9OPaHthro+MgOYwGMkKTEiVi8XNjjYHX6vR2ARfbgCUywh/HFkBmKE
         g8tVq9zBGY389cLOS7aaUq188HH9J6UWk5/VKgdRdolY+q+d1R9i4BUNmiJjb/FpQJ/C
         MZDizPF6Ll3p5gnkfs3BKGHS6yrTM4ViS+CglcvPQpc8ZZFzvj1AU28knoeLEn2Hm/IG
         rj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945477; x=1791550277;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rqy6pEqFoYmqvPw6OBjhCQ0EBbG6kK36+Qp0DgFgLS8=;
        b=yeGPHlBkms1IUeL2Gmhl/xSzcG09nfgWYvFWesuKFGWI8YBeNM3M2QHe+33e7zJOoE
         q3pX907FzqwFQZhyr1yhw9+6Eufslp1dN24Tz04eqTJDycoE/TLpIj0a1rvw9jmstP7u
         w859m5a5YT/7fmYYW6oCphcKZiDoEseW39qYqaSNH50RGwTPOchOxHbMfG0Yyj/WELgl
         nER6/mLQSHJ2usSddgnfQuKk8aGzlyijXgXuu3Rfkn6yw/lWArO/2JTe6WB8Gn5TRmDf
         dsmE6Vz/W5c1nFRdlBFEJUQALLYGS03iHyP8AurWU2IVxhCcpcIE2Vy57ftceDYpv77Z
         Lqkw==
X-Forwarded-Encrypted: i=1; AKwUvBxIv9xkmfS1B/zpWooYQDN7IoZu/TXtRkJXWYnttwibKsWYf5O+LPp5pBiRQya/nK0yfJsHiVAGrfW4ehk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCG54zVBhYMbp9KnuuR5OkWHI/oWKOP4Z4ggBss+X7Inbz+hqN
	+QTuspKy8jU+Zdoeam0QlodpDjUkiTgWuLrcMzAwLw9epSoD1dvwy06AEPwP1g==
X-Gm-Gg: AYBFou0icasqEqv00XSycdsPw/XJfLg2YZOliJTih4+EPo+T9zXoask0DScxqTb/Hjx
	cRHLbQW3LgVT1XuW5h7k5ZmnBHvUQkU07pxbDNenqLqVyqiClyOWIDYWAQwqmclXtGcOuq1fFfr
	SCzchodCzN0AKHR2x7Tb8MZ/tuYaz1tdv5cKSAAD5n+BTmsgY3vRMM2gngoIYGI6qknlCKKZzai
	LkdtCZAWj4ojye+vTeD3rLMoYOp02kj1r8jzM2PC65XwefZlkneqGqs0YTAPH8JCpd9VDv3PWze
	DfKg2P6KehPL5YE7/TkugK0FOb7OCL65wi2kScEuZFWm0cBgDVK4tkpFlw5mWh4iV8S69He+pEx
	W0LbGUc97uRKBzjiaf21ZgBbO0fSuZqH5wNi85/Y0D3AH5Js61rtknUVheOWWd0C0FdNnzzwhFn
	n6Uq8jRKRg71w8kDAaR8/Y6DNS17g/Oy1gl43lnDcNBsXDXsccbhDOn2QXJEkjtTyAhLpWScIlS
	1Iilp+/DQ==
X-Received: by 2002:adf:e009:0:20b0:48b:1283:bb73 with SMTP id ffacd0b85a97d-48b1283bb81mr3702420f8f.26.1790945477275;
        Fri, 02 Oct 2026 05:51:17 -0700 (PDT)
Received: from foxbook (bfj133.neoplus.adsl.tpnet.pl. [83.28.47.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f04e2sm4861703f8f.15.2026.10.02.05.51.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 02 Oct 2026 05:51:17 -0700 (PDT)
Date: Fri, 2 Oct 2026 14:51:12 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Jiayi Li <lijiayi@kylinos.cn>, Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: uas: quiesce SCSI before stopping endpoints on
 unbind
Message-ID: <20261002145112.3ee2b500.michal.pecio@gmail.com>
In-Reply-To: <813dcf3a-0615-4152-baa7-47b0046ca113@suse.com>
References: <d3639d68-0213-4b70-a771-aa5dc3ec9767@suse.com>
	<20260930013332.829717-1-lijiayi@kylinos.cn>
	<813dcf3a-0615-4152-baa7-47b0046ca113@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 09:22:49 +0200, Oliver Neukum wrote:
> > When URB submission or completion returns -ENODEV or -ESHUTDOWN,
> > it marks the transport dead, stops further submissions, clears  
> 
> Why this specific trigger?
> I am asking because -ENODEV comes relatively late in the process.
> URBs tend to fail long before that.

But it's sufficient, right? Apparently all we need is to detect
USB disconnection before disconnect() runs. This will do.
 
You may see -EPROTO earlier, but that's indistinguishable from
transient erros. -ENODEV specifically means "device is gone" and
-ESHUTDOWN is usb_disable_endpoint() etc or a fatal HC error.

These statuses should probably result in the SCSI command being
completed with error status right away so that scsi_remove_host()
called by disconnect() has nothing to wait for. Note that new
commands will be failing to queue due to usb_submit_urb() errors.

But UAS driver infamously has no URB error handling; if anything
goes wrong it just waits for SCSI core to abort the command. Not
sure why things are this way.

Regards,
Michal
