Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893148;
	b=zoRQQGsC+3YNeNq4HjR+Zm3Z1TRJnGHRPOovOxgFzPnSbW8z/ic9hgUBo7HqWBU8SK9O
	 /zrXUo+VvoKR3bD/oK4r6+5ncWuXBeqZtMt/wqvmkwvrSwMSXEjKHlP5QhR3eMTAFiTLB
	 Y13elvxGbJJGuz3Jts9tbhPNivcyuhfYt+Yb/DgTtWurkXxchSWp5UaUw92EDAivKZW/r
	 RUV/LPGMDFHHBIz/zfp3ao3aM1sHqBjSFYTugtFvwWDX8pkEMGGxi4dIRFFibMinqBgW1
	 bbK+hNtFwJtHkJVDa+JX9E1mi2YuIxu7aUmEdbXVxd/z0jymX6FFU3YznY5zJ+M/8gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8JkfHiQEMtf0YYgXubzDg94vF7YvHDx8RH2S+gQfkvI=;
	b=sCuFwhlEarE9SW1Dz93FFH3K+OEnPbvW4UUBet61ISljnQ3i0cKu9D6DsqVGnJPzOQAj
	 hKmHDZPNwTWIczGq0YNet6VaB3osrw/U65LoBL6SzpKRMRb1qayiLxm1xaiCqjk5WE3zU
	 3Kv62gM+2go599v73ZA39M0odsXWbNJs9mZN/UqeCujUsv6uwXDGPx9c37blnp4CnVE+x
	 K5C3FEJjyu9Ir3mYUc7+Ry8pnPknXTqMrXhqJ5UFS3pu3db5qRsVNLCRf8lHKW9sNhWHq
	 QnkgDy3NlFAMpOtuHctX5VXe6il7RrTRB9yjj0u6ByJpfNMFtydFEayfiULCuPFO9Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=VsxxJdLL;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470E2606D809
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470E2606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=VsxxJdLL
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-945ae2daa66so197224485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793893147; x=1794497947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8JkfHiQEMtf0YYgXubzDg94vF7YvHDx8RH2S+gQfkvI=;
        b=VsxxJdLLlfPOOtPonUHzniELq44+vkwx2NhzVYM+d/WiKtYn1rc2Dj9j860sK/BKYk
         vpoSTrlRbE1PuFq7yuccJcNQWfi3mzALQrIhPdBLpEJMBXoLnnMuwCq6vobOqzbGWQ5k
         hAIakt+aLJly0qKi/N4qCYMeUPnESlQTcefTHdav0DabkQpiBVclMiVRKw1mENC5bpXm
         HJcafXEvWzVgl8Rridpjy7bYk8xywjNJIjWqBD79E+fiCCRpg8lUQE+E1kOdznRdNqxK
         AsWa9Et5UIK66lV6BZ0MpPbkNGp9h3RzLJKoVMImgAstaLxHgCjJ/wbAh4b66Q9oG2x7
         MTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893147; x=1794497947;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JkfHiQEMtf0YYgXubzDg94vF7YvHDx8RH2S+gQfkvI=;
        b=MCE3XKejSyhpL5b5dUwraU1xuTh/XwU5KyysCUYWW9zPoyjZ8+HJNMTDGrDDkRZoec
         Nl27I7H1yvaF8G3Meen+h7V7bTYzPLZ3cP1WraUdTdoxFXNwzSP3xGa/Zt4TPfTzRcrM
         +Wqbqxtyy5MT1yak9IfHmnsuTZ8icpx3TbGbcOMQZMB1rwrwRY1hNl6SKv+5201cvpqk
         gkMq47CcTRZ3fpCBXfTCLwv/p61OCB7F4dlb5Bld7xi2mFvsGJlmXUaa2PsXXM4WoxTX
         2fNsowvI1RQi1sXD2aui06dl76x4+RzAdeJ4TyWZpzTp8tl5E1z+t+5ok6rc1SwPov1T
         drRQ==
X-Forwarded-Encrypted: i=1; AKwUvBztqjO4zewrZ5M+kW7YqqpmfhUfHMyikWLT/Hmf/7E3EIdSV7CZp4kJcSrtbKnMCynpfAcEW0lKebIqI6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AEmcbOVrxTewBQi/ff1j/n7+PtL8Q0JJeEQglqnsRnreBeacc
	NiRO/xzhBq29rcC6wz3IOCEZPefluKIwTHVuab02tqjewYBM9+rVtOjsqbHUpvlz8A==
X-Gm-Gg: AYBFou0mQJESRO9NG4Ja4pIGKIk22hBjF5HVP2BwjbY3JMIvw/Am9qZdaPz6Sqofgcz
	7T0+Jn5rM3t42qaP+ndhL37Zt8bOveT1IHm8wUG4keqNYE9EqbxfSnapfQKon2C7jgWFjq58QG1
	RY+3eSWiUhXV7ouheQSGLRn1tYvGhVYqmGS16A6K5/EV2QuM6kA6DCIUNo1JHWXWB1nc85WXlsQ
	JtVQoPVy1Er5m/LYHEHa4E2lfax8OS0GMStZrs+Rh8IebfnHNbY/RXzuyFqIHPQj4D8wOWbJMwh
	7zFU0fZDKx/6TW5tx8JYX7hIPuQOtbzQ24yqnBRaQzvALjWqVzGbuoWb8+WZtzQT3nDJD5NR/eN
	Jsbn8hG3LLvkCXJVqaBSBoFot7xbcFCIxDF2rFYebqugUM+TOpXzefuy05QpdB7FMNEU/jqq1tQ
	0CdQfJq5+OCsEU/zTdgFicXznczNaFJ/OE1olEO5XSDiz4d3D1eswcnintseOGiQKaYO2Xua8px
	6vjxf73+wtALH7iUI4oBmzR2Rff9avvlnYpJWqsPFy9cwneIlZ81PsvReQ5S19IxQ89SELLv5Ad
	v47qjezcBIrOsnmqCtZYDTrir7of
X-Received: by 2002:a05:620a:618e:b0:93c:6e1d:96b4 with SMTP id af79cd13be357-944217b4de9mr2981549885a.62.1793893147067;
        Thu, 05 Nov 2026 07:39:07 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d485a5fdsm488893285a.34.2026.11.05.07.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:39:06 -0800 (PST)
Date: Thu, 5 Nov 2026 10:39:03 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: YuanZhe Liu <25031212351@stu.xidian.edu.cn>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v5] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Message-ID: <a6a3adbc-bab2-4047-b417-5faff738f59e@rowland.harvard.edu>
References: <20261104000031.679944e7.michal.pecio@gmail.com>
 <20261104035637.3325-1-25031212351@stu.xidian.edu.cn>
 <b8ea2f8f-ff9e-4cc6-853b-114fe51173e6@rowland.harvard.edu>
 <20261104175949.71804650.michal.pecio@gmail.com>
 <d7448504-a63e-4f3a-a828-7656b1084105@rowland.harvard.edu>
 <20261105085238.337cb70c.michal.pecio@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105085238.337cb70c.michal.pecio@gmail.com>

On Thu, Nov 05, 2026 at 08:52:38AM +0100, Michal Pecio wrote:
> > I suppose we could check that there are no errant URBs still in
> > progress just before putting the port into suspend, but is this
> > really necessary?
> 
> It's already being done, looks like those drivers aren't *actually*
> trusted very much. But there is the ep0 loophole.

Well, we can always add a check for ep0, just before the actual suspend.

Alan Stern
