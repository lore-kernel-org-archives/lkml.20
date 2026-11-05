Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842952;
	b=VWjM/VQiMHZsQQUrmbrtyQzVeCFQFlmF6mKfQ4V4pMaMaKsHD53ylHzBTH+n22xu+QwN
	 4IvS/hp5iay3gOQb6vPaMyC/WqYKlYHiDibV6EwJVru1KqyYXynSN7Q4xIZFkCnonqjrX
	 QWYM8sH+vjng3BneZfvppSX7vxyhxW1lXuSQtdJMnBMzIEhIKmaUSt1VrSC1e7IuaLrm3
	 vPQ1h6jDIWGOZIsyHeUNhsw/TOs73Yty6Aq6Hvsk5DtTXwubzMlB8qP/tMLpBtVP3nNrC
	 qZ17D6NNMpVLV4sENXnhe9WC8gZybM0vIgrMfIRUQiZRC7Pk9b7VLg09+XNreowPATg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=z9y+op9MwcAYKiVxV6x1Polc0TJVtfhV5fChD4LyxGU=;
	b=otZKef7QYKj8lQ0+MrD74/aj9ivBGjTyMEgdtTb+XM18Vo1bolciaw+UW9zf9UdtZsNZ
	 rEjIBBFnN3NsMA3WdmsgDA7BSUFLL90pMUx05SV2g9ZQ4aTaEWBPTcsB+tJszYgg0BooV
	 MIOcfS4M1aYKiKxJ9Y/YvW56SX+x5wbqKZAUrNf6UrMDX3NxFOTEd+T81Ah2dkJq3D+fk
	 uyAyLe9F5wzmbM5+fChFS4nGmD1HItInxv8oGPgOMFHyuzK4qmf1pv9b9bqcb1848Fc0J
	 9VXvAbGlGftBS/zcjN09QGobCtbU0EiNjlxvUoOiNtjv/JBMD/S7NxSbsvcZbAg5LBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=RzVtavYk;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A082606A338
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A082606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=RzVtavYk
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 99F843F87F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793842948;
	bh=z9y+op9MwcAYKiVxV6x1Polc0TJVtfhV5fChD4LyxGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=RzVtavYkE/LBMxpLKB6QGcQKcna+jHZBHZlBmThLYzqMGoIRU3ImDyxu0guCqITMo
	 1eTiTck2Q1vsq8KW7GRcZCEOtnHGWaCZi4rk4cFEoMMc69lT6Yh691ZABf7DsakKqz
	 iyIB0ekVqFgCJlXYlHWYMa2mpnlQbZpKa4e1pK76R0MtJBN0J9RFHLHX3tVGFzzOnP
	 xBANUb2YsSym8zl8ao97CXb1wvT7eNVhiBPw36eW1PvLwFTUrpxgnePVbPXbo53B8i
	 4isztSi/ujZGsKjwC7zZ9jrm8Qgs3kUcXMwAjZwUaJQ5gNUv6UaSIZ61FT/VasXGcO
	 Rs6UaqOiE9Nx+x2Lr/k5oW1f08JL1YNEjDQK+fnfkcrxXy25dGIpaYLOfw3/cLjUn0
	 6JUIYm1SSAV0lAE3yVIwdGgc9mO0QTb8jjEVR0FUjMCCZWaqP1O1euNBFq3DoNvSTd
	 vLHzbUh/SiNzgaBnTkE5fDvUd9oDV0ctvrRmK4PF6FzaSDWWULYKdcfSgi9A44mrIO
	 DU5HtQX7fJ5keKbmbq3LA6sWemlfErQwfVn1dAFMNTrOvXIcBCxI5SwUzR8GNj5OHg
	 WEV35Uyc2fPyKEWqofJC+HMYp7pwKHsI9El4JLf2lTVuGHrjkcf9RQfcUydXl6Kkbn
	 wqw9dLFexkl5BN1HI96ZQ3CE=
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a0f2237afso137062eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793842946; x=1794447746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9y+op9MwcAYKiVxV6x1Polc0TJVtfhV5fChD4LyxGU=;
        b=g0hspe9XiTj72+laE41ShY9aeAkmrZQDfpfVPv1fy/BLzoswrYqfFxfOtSTJ73Gagq
         VmSeKv8pSn2fjG/ymy/JhobJ0TWSwBQczzowuS9kLtcJru2gNo+chYvJzbsJFiyAVfs9
         onS4MT1HvIff2/TGUnDg81qjBSIr18rHXc8PSz7gEY+VefQ2MdJOXN3Ve8EhGp3ydDAP
         TZ7fBmrO8WbKvvbnLKFg8HDjIQl528fNqMs635cHgtOBm9IMrqtCJ5s8ENxBR/h9GX0P
         8ogZGQkwFE3n2sxherWF45P/3vNDcvY7kXRV5ZiQ95eWji1mQCLNpmZ4Qo25LJlne8uf
         5ADQ==
X-Forwarded-Encrypted: i=1; AKwUvBznllYmxKxfkXwmBCb9yQWFbMZYis3y0rdDUS79fxGJsMVc+NuIy1HneykWIZLIzeTf3K+RUFw73S0UxVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zsYFSDoMWqb/RHnU1E1tAVp2Od91FsEFJw8UR+qZjJyQkeXhJ
	vhmR3KXcugY0mBHOOXh5cCI+W01IplMC514yhxsr84TyY9U2FcpgUfPH2QAsoTw9/a+twqa4PZT
	ckW/+3NTnpG3djvze5QeZ+2F5t+U9SOoa+rOUYXf8fAL87RsXiYxoW8DWlg7Ca9n0WEV/lkmnef
	vluxFNMQ==
X-Gm-Gg: AYBFou1eybi2N+i5IFmIhjmdbqL1bdmGncIY/9GL9wVGY//4pp7Q/CfFvI6PYXja/qN
	+XdjY1uzf/P6lYt9kFOAKAN2jx7w+AMWY0fIEGjaGpba8dvKKsEjiJHfT6UFrtqYxoJdLW4BBEg
	XnZS3/Oi+5IGpvijWU5UjJjJvOSSVek8EUN7a31pGp2LPzNemsSlr01ZnhvOgV7w5RFSN+ysWQB
	IC+JbcZY3KQAg4GyNjBv7p3CiooJcdRSkzWi95Us2epNmeOVfOXQb3GSsBNCgbaGnoWdFjDx9Pq
	jxLnj6lUslNYvIjQB3eRJdN+TIhD/bRD+WIBnzcLk9qmNFo1zqNFA2cAwTApNV/pyX7dDMWqwb9
	OQ8pvUoxgqo5ORrKCLWVcXSHbBqFKR2BbVVF//056e66EB8AWD7AFljEeUc/Nrmn1i/1ZC7uyHJ
	7n89tHcJhAUeTqkvXbcDv5/6UcuCgBvYNSlq/Kdiuqegr5VtS436eH5RjWXxoc1zQA3gu5OyMcM
	+17qPgEMDN96vjZ/AJmP4x59xI5ftqlgW87nHxPD2mW5imLMjs6py85vWzV9BTcelIhAjcl8Zw=
X-Received: by 2002:a05:7022:7e0c:b0:165:be2f:c56e with SMTP id a92af1059eb24-1ac5b7dcb2bmr43089052c88.2.1793842946363;
        Wed, 04 Nov 2026 17:42:26 -0800 (PST)
X-Received: by 2002:a05:7022:7e0c:b0:165:be2f:c56e with SMTP id a92af1059eb24-1ac5b7dcb2bmr43088986c88.2.1793842945775;
        Wed, 04 Nov 2026 17:42:25 -0800 (PST)
Received: from localhost (2001-b011-2008-445c-f38f-16e4-9788-cb61.dynamic-ip6.hinet.net. [2001:b011:2008:445c:f38f:16e4:9788:cb61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1bcedsm11629150c88.7.2026.11.04.17.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:42:25 -0800 (PST)
Date: Thu, 5 Nov 2026 09:42:23 +0800
From: ChunAn Wu <an.wu@canonical.com>
To: Markus Probst <markus.probst@posteo.de>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com, Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, cocci@inria.fr
Cc: linux-serial@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6 1/3] serdev: handle devices without an ACPI or device
 tree node
Message-ID: <auve/wI4t7A+2G5W@an-XPS-15-9520>
References: <cover.1792856688.git.an.wu@canonical.com>
 <263a607c3602f31a3f6fdd245e3c2008cdf97abd.1792856688.git.an.wu@canonical.com>
 <75e6d86340073638d966acb85465c28e6a08ceda.camel@posteo.de>
 <20261027214742.3624605-1-an.wu@canonical.com>
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
In-Reply-To: <20261027214742.3624605-1-an.wu@canonical.com>

On Wed, Oct 28, 2026 at 05:47:42AM +0800, ChunAn Wu wrote:
> On Mon, 2026-10-26 at 13:59 +0000, Markus Probst wrote:
> > Reviewed-by: Markus Probst <markus.probst@posteo.de>
> >
> > You should add the maintainers for the modpost scripts to To/Cc.
> >
> > $ ./scripts/get_maintainer.pl scripts/coccinelle/misc/of_table.cocci
> > scripts/mod/file2alias.c scripts/mod/devicetable-offsets.c
> > include/linux/mod_devicetable.h
> 
> Hi Markus,
> 
> Thank you for the reminder. Adding the Coccinelle and modpost
> maintainers to Cc now.
> 
> BR
>     An
gentle ping
