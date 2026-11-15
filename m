Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757978;
	b=FXKVynRmSr4fIgCU0UZ99jxdY9DZqHCkl7G2i2nXHGLb50NVG8ocv97HGBFnJ92UBx2v
	 0PCvqB+DwH6y+DcNCtpdpTEN9d2586F350J0vzVuySLB5wJ4GZx0W09nldPAPpwLL9NWy
	 lq7+w1QLEZ9WD3DGs3ndcoKUvDftnlA3NCgnd8gQwW8XUTSCbieEOhOA1+EWnSiT6shbS
	 hFzOYq0lco9mca4UKogl6ES0RGUr6LZZ2iC2pybdZJIOVNEhychH2r13Fn686QvsXAl2y
	 qbcCAGwpg3Ya1PWESKeI/PslVnKlpb55YUH5PeZlcGWDpJXSXso8xULWxOVcBCsFOAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=zYLg9CDhxj90tCxncwjOVnCz5bkJHfzwDw5ixcwSYAY=;
	b=20Rs5dmhUsgk5Y2k4mQxZHbYJ2L7aN8iLndGbUMqZseQs4+YiSiB3g32RKXNYtNikY9c
	 HSPrUqiLJsFeqSr2k1sM5Bqdoyvpu8DwuZyAgD9uAflUdlfRlLJBPCg4EY93b4X4hMuo/
	 8Ou7ms9cbsc7NUyQHMT4FB+NxPAJifVdq1Jod+R/fGNbiAIjDF0fN3rTUNFxlWMXo8uiy
	 YUPsiuobIeqNA1UoAd8QxDamPy5ytC8L7G30pTlU31PBLc3hHN1OQF43U3/XzxVndiNVb
	 2aU/80f17f2CKFVmKmI1mIUVUqy1Iwyc4ihVMzPTwaywEzkKIAhl6oy7UYGGifH2Wqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=rdlVdlY9;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC58606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC58606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=rdlVdlY9
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-94961bfe1a0so92714885a.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794757977; x=1795362777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zYLg9CDhxj90tCxncwjOVnCz5bkJHfzwDw5ixcwSYAY=;
        b=rdlVdlY9zP8I5QcooO08a+w2q8HrBN2sNX3xECK2d+eML/sd8Zkn48dk9ZCC/IcWQT
         ER71faOAqY3oRAmrF+dwHSqz2bJtmOiZ1t3IeLlN9U/KJWP2ZUqCFSUtAU4bkZOACKyD
         3/ezPyBoMo2gmXrrMoNCMPaCXieQbH4Zuo26ev7oP4AfbpSwDQnnBsFOqAlhdAVcqDlr
         /WTrhv34lU+FmEcw7nCcr7TmHmTkty47Xq3euFu9M3akOFgdJ9qb1v3zdyiKFdkIAtXe
         ydJN/oR2QjSzMGDJmVcfSTeT2V6jqSA90xz5ZleQ1LMy9ACXbwC9GezebVKpZMYKfK1a
         O/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757977; x=1795362777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zYLg9CDhxj90tCxncwjOVnCz5bkJHfzwDw5ixcwSYAY=;
        b=zeKQB17M1dNDitK1zPg4OPrEs63FlWBfX4hkqE+eTHbqg+qVhRFbzIcgL1cSSqm7Ge
         PReQz+nT582nZjPhnG9URFBPgDAurMT/0yyuj8UyPZcIBvb4LsXguxNfwPYOt4fL1bXM
         TZhrljv/uWYZMsvJK64/qOKGOK7FkAD76WWg9N2kOU1WdiUCj5qXJjMo1CxT27lOm7mQ
         UrT4S7vavdL+XCJ4DiKVzbIhBghRUxZDr6a3BkA35CEqmPF9ggyRb3YApuyhvffKQ4Vf
         ll2iLDJWazQzD3mUe26gkoXVQpIt6DqyknfPLNhrxWFbACl3GTk8a1vI4c29NPLK70W9
         /Eeg==
X-Forwarded-Encrypted: i=1; AL+hErF93xROmiobBvcDjF+Kkv/SmYZgWCfeC7TvT0MUmFK4xDXWGy5PMVLfTm/qNyOTUXo1fMrVKYNOuWWr/N0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ALky5H6dblQ3l/GItPKVcTrNHXNs7xKwI/0hOgpRaFdYTUYY8
	71gonadOal6ng3bC8wCo4+dAWOjuQ6T96NSWL30QFgyZB6WTsC816cJnob/S7FhbkQ==
X-Gm-Gg: AYBFou2EIC9rzoZputkb9j4naP8SjH8js2Qm+IxlIT3Bl5XmBijFgJnnwu/nffqhxAh
	wo8nCPAjriiFIY6YSTv1d44M58Df6Ei5dpqaI4R1FQXgYtKIxZE1sdCPWb47U+lzNVgDb5VYd8h
	kqhLXSND98nyIB8lVNFiKJVCbC6HtzJQfJmIbh6p9miL1ZF1Bj+CEoHzShdk+EsxpYFpJGItZKt
	OPMB9sgP7YrnCaM3MNq5lmRwbezzoEePTJXYMoEfaTRv8Np1FdnOaGl//EXKBeD3IPB3/8dwveW
	M7K6gGoHx566MdOz7klKOnDLRbhxviTJEOrUyaQD8Yi5MhYZ+n3BT4MV3UmwjKneIrt33UfXmcb
	AV6BSQLGC8+HxFQzGbVWNqfhoR2uAXLMTZHYBI5ToVtDO4ffDJ69Mx8TZUEGGnHtiy94++47fUf
	U0IOoCndDh1ZPqHf2D79zKNVsAiQjwB9rskaTuqOtO6QlOt83lSW+E5M317qEeKbVJecRVUmeh4
	UdP2chy92NBqYOF2TC2vvvgdWomfc6hZqSkp8WyK+EgjS2EqKGGSUatgUB1sE7lxpI1Z4jGuZYy
	d8nFQQYjzJwVIQPYiSd84w2pfQ9TG/Y=
X-Received: by 2002:a05:620a:2994:b0:949:7069:3faa with SMTP id af79cd13be357-949706943e3mr449902385a.4.1794757976522;
        Sun, 15 Nov 2026 07:52:56 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db8d26sm66871726d6.43.2026.11.15.07.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:52:55 -0800 (PST)
Date: Sun, 15 Nov 2026 10:52:53 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc: Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	smartmontools-support@listi.jpberlin.de,
	Christian Franke <Christian.Franke@t-online.de>
Subject: Re: [PATCH] usb: uas: expose US_FL_NO_ATA_1X in sysfs as
 deny_ata_passthrough
Message-ID: <1e731b43-93ad-4230-833a-df6949c7d4c6@rowland.harvard.edu>
References: <20261115124046.5286-1-mat.jonczyk@o2.pl>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261115124046.5286-1-mat.jonczyk@o2.pl>

On Sun, Nov 15, 2026 at 01:40:46PM +0100, Mateusz Jończyk wrote:
> The uas driver blocks access to ATA passthrough commands for some
> devices it considers buggy (via the US_FL_NO_ATA_1X flag in
> unusual_uas.h and uas_detect.h). However, it does not expose any
> meaningful information whether the command was blocked by the driver or
> is genuinly not supported by the hardware. This creates a problem for
> the smartmontools program and makes it difficult for it to provide a
> useful error message (with instructions to disable UAS on the drive to
> get SMART readings).
> 
> So, expose the information in sysfs as deny_ata_passthrough. Other
> quirks may be added in the future if there is any demand.
> 
> Link: https://www.smartmontools.org/wiki/SAT-with-UAS-Linux
> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>

Why was this change made to uas but not to usb-storage?  Was it because 
some devices can handle ATA passthrough commands over the Bulk-Only 
transport but not over the UAS transport?  Note that the 
US_FL_NO_ATA_1X flag applies to both transports.

Alan Stern
