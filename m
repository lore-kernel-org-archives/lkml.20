Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042079;
	b=URjtzjArJW4d96HO4rqADpnnJkYlEXAeyVAPVY0xnThSjeJCWLR9kCuTtybrZaT2oNKw
	 2JZT1XKFR1xQATZvOhKvQ4y0ylQGtAolWsifQnC73PsMQ+PliSXqyF9BA2Ca4Ath8g+rE
	 fBIBAChC4H4o69PvUoC4pj0EIGlKjdK8m56z36N0hJn639B51Uegzj4I7gqyLk9uD+lMh
	 l1D/+b4oGUEt8AYBL9k2PqlcMhxeqCQS7gGpexzm8R00J93MsE0KZ5A+Iy1O39dF/w5M4
	 +hxKp+G/Jlx+IFVNVUDNEH77LiWZe+Id974p23YVbVKR7P2KTnMplmr3eNHmTxi4rxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xYd1AfKqcl+9tRJkqB8FFaIjzuEdllawIMWqWesHJnA=;
	b=fwecidAtcH+BM16ZDNgZjUO8KI27p3kFgmrnA31dBXObdb9PTJ/f7Ttx82L7B9HDEif5
	 ajnn70mWxIRybRVlZ5/NQemr7OH83KtD74/cpjnq78kg4W6eVvsuTGSZCr5U6krYOfdKO
	 RF8rouWSKdklu2bIKl3Jt3x4nKkCyp6zuItjRySmk7Ys/EJ8hdTOaPTCzBRGodv2E/F2x
	 rbRfvU2YANeVNsc5VGsDTsqwEqTYahso0f7PE1OucpGLuxXlW3fsdMHjQarj94IrkrIQp
	 ZFNh1fzLYFmM6Pv1rFP04I5EdCFOSXIvrivlSIjYOjfj9XguLTZF5LRzvCmdpNpbNZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k8IAvO4R;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A051F606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A051F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k8IAvO4R
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3514b90bb89so7783007eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042077; x=1793646877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xYd1AfKqcl+9tRJkqB8FFaIjzuEdllawIMWqWesHJnA=;
        b=k8IAvO4RvXOI4qstAapQi7ZztKLiZvS5iYhzCyqZlUyegpcJPXdEfn3HNC+IByLvLo
         2QcUsv/9AeemW48Rkcen+gEew6+zLRnsIbBaegLEy9Rxwah1P/GDv79WiHPZVHk5uwyx
         qtGVsofaF0s+TydBCzoU1UNRIWJ2lpzvJTRjr01tOZvUyylQGRuTcNxRJkLQlitgj942
         sPBxSxAlG1A4LssCZ+83sn+WhxGBbVc+Rg8+XA5OLbvAkOn9gaYCSMyVAvW1gV5R4/Nq
         UD0VZzxhPTODb3Fsle4SoH0Q0z+H6H7hpnNjWJiBSQNZkYEedPYZHlCz0P3Mi2ndcGB9
         K5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042077; x=1793646877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xYd1AfKqcl+9tRJkqB8FFaIjzuEdllawIMWqWesHJnA=;
        b=0tm9Q+BCMH3hkpV9R5H9lsVX1+IHFTThOfQIJSyAAb64XMOwTZrq+tJ7jbQiIGWErq
         aVCGLPF6WSBdpBEpTqha3WvbuVpcShWQS+46lIBYpJVAEE2VD6ZNiuUMKNRkUXJq/Zdo
         6PtOlgCDhe1pQMLGTj+Vb0sYQanyLhUVK/tRS8eNx2NxSXK7BGU1MYgRQu2so+BMKH8i
         cm4No8sfMrbhrHoxVALcqww3+4BgJBbF1PpJA3qLpJogXCfxegWD3WR5NsOe8lWta0qs
         d8oIXMVhRGyptWcPYrMmSH7VJXOc14h9+YoJOQDs4a+YifadKLzUQlcEODVe/njxuFnD
         ZnzQ==
X-Forwarded-Encrypted: i=1; AKwUvByJQtBLLD7Eyu9G6yQmnCT9Xfc1Z52XNCl/uIXibsZMP5YUPNrwfcrzN0SECCN6MNlBWHkuZ/gPN8WVcdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/gGqOovJll4kkdpj7lCELGdEjRBf82Q4eCAI44z/VopQUxAyF
	Qw+7J/dbYz8Wz0fZgtmOpkZbngpleL/R4Rbftud6+TBQ9JFbURxNcdF6
X-Gm-Gg: AYBFou3X/53jKt+D4sVBeyUblJNqJGBpmrC2lkKdD9v0M+wsgR/DVUv5ts7wvMSycZN
	cPHlOFs81K4fBLka1AKYab38BbuudEpYbgy6bGog6LP+A/Z+03/hhkXB45lLo6iMUWd13cNqyUO
	JyQbXTxso43mKTn92t05XAi1EhveHuVgCaLpXntXThlXE/MH6fuKU8olIljG0OcY+dmiUZ0HX5s
	8+5VTlQvtGCq8eB5ZeVq937ZKwY9MuxA8kO2+l2aIBAavs6yhHs9pUIYO1E1Q3eoR7Q2iyv2EFQ
	eiW9p65jc755Z+lAnd7l/WpO3v3MJB/3AwpUcwCUcUmpqgGm8rToIqsi46Fd6eczxLI8q54qpCK
	4jmFIOjhAtt7BWkgDr+Cs8aSDwGKKLL5NPZpoOw2YXjcqfwDVigADt3cZSRWPR68DTNS5SaCMhK
	5S9q2CoQ0nE0kkCQNk6QN4thoYoUdvD8NSCTsPfrxWCQXLurI2/IQ4QLUUJxnv/r8O/wE5UwxOC
	e7QSPddNdjNmLwaRGr17iA2e/aYAFoHadsgrPcKc7nKpiorXEVM57iXrtvhZozG/tpPYA==
X-Received: by 2002:a05:7300:471a:b0:369:e8b0:af85 with SMTP id 5a478bee46e88-369e8b0b5acmr12248693eec.36.1793042077191;
        Mon, 26 Oct 2026 12:14:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8afd64fsm31480019eec.0.2026.10.26.12.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:14:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 12:14:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (nct6683) Add fan control support for MSI
 boards with NCT6687D-R
Message-ID: <c302d22e-6ef4-409c-8f9c-28922afbad59@roeck-us.net>
References: <20261004153250.516730-1-someguy@effective-light.com>
 <20261004153250.516730-3-someguy@effective-light.com>
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
In-Reply-To: <20261004153250.516730-3-someguy@effective-light.com>

On Sun, Oct 04, 2026 at 11:32:50AM -0400, Hamza Mahfooz wrote:
> The fan control registers of the NCT6687D-R used on recent MSI boards
> (customer ID 0x20d) differ from the ones used on Mitac boards, and
> changes must be made in a configuration phase of its fan engine.
> 
> Add fan control support for these boards, based on a reverse engineered
> register map:
> 
> - Manual mode is selected with bit (channel % 8) of register 0xa00
>   (channels 0-7) or 0x80f (channels 8-15). In manual mode, the duty
>   cycle is set with register (0xa28 + channel) (channels 0-7) or
>   (0x260 + channel - 10) (channels 10-15). Otherwise, the fan curve
>   configured by the BIOS is used.
> - A configuration phase is requested by setting bit 7 of register
>   0xa01, and is entered once register 0xcf8 reports that the fan
>   registers are unlocked. It is completed by setting bit 6 of register
>   0xa01, after which the EC checks the new configuration, locks the
>   registers again and reports whether the configuration was accepted.
> 
> Fan control is supported for the CPU (channel 0), pump (channel 1) and
> system fan (channels 10-15) headers. Add pwmN_enable attributes for
> them, with 1 selecting manual and 2 automatic mode, and make pwmN
> writable in manual mode. The behaviour of the driver does not change
> unless pwmN or pwmN_enable is written.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>

Applied.

Thanks,
Guenter
