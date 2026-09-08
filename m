Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8D138F633
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850482; cv=none; b=ffVRs07qug7dlBy7haK/TkQnETP2szZiM+Z6NEgPupUWw3t1pLYKRuQufiTt9soQ2TyYOWY4h4qW0J8Z1x6En/0Hgt0ErhNU+BCbbAly0LuBRz1hEsVinP9uF9G9im2C+HQUbEdV7wovSP+jnSKwroGE5yQ93AIUBqfuJlD+Ctk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850482; c=relaxed/simple;
	bh=8M6z+qNZsXjdHj1Arq1lJ4ckmm96BUf5o7TGzy5MZkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBQadyrqk0mvNFl00u/j8W9WWCWtefyTqePD3br5xv3pqWfMRtI+n24a8rWRaj6os73WrUIW08FFE5ZGyN6vuS872NiHXH4pQCVcjA6C/z5tKfvpCOrSKC31XUq9laSKPHcqfDNlmW6uv+sNpV3MfatYCCO4rqgWjOGlfnZ2LM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IOKrvY2K; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IOKrvY2K"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-484374f54d0so2682637f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788850478; x=1789455278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSW1BLEU3v6mP8//6sbr91+EPSlg8/lSl3HQ6CfDTOY=;
        b=IOKrvY2KryBIWChEm92ybolZrxZrL/G03D8evQV42Xb5dN28oS0hKtwqx9ZX9u99hj
         398PG5DKK7xB4uso1JyQFQjkhnE3XB6+A7IWicnomvur+A+Rl6SKFxgGkw43YDFHVWWi
         PiAz/YAOppRxa+KhF9Qbsaln/CQG6daj0cp98POv1QYq8o0+w/hSCK99UT6a4jObVkKz
         k/u4KwAgLifyoQKdl6GlcOuHqRzjOJUhQTQbn8K/XM7pGM3Xy+GtEPqDMCSNuTpzj8f0
         QARfIz1AmMq1eY+qRrEE8ksqUPVl8AiC5EksyQnpEoiTp1FwI3JuOYNNzX7d/6FnlQec
         yjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788850478; x=1789455278;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSW1BLEU3v6mP8//6sbr91+EPSlg8/lSl3HQ6CfDTOY=;
        b=nJC7wKPbei7L34kCv1piXkwSb+vbQrSk7RMcN//qbCdrAPtlfo23sgfGQJICOwry0F
         /PxQxG2emaW/m+uWqLnE0Hu5sOhQjdYt9737bph8mdy4C0/F5Vz2HU1UoEpEkaOXTEjg
         IUyMLUAcyxbB7oAI1IB4EqcsW16P/z+IhUvn78EJOU7oD2fWUUxL/WZPGow5mcpBag2e
         LnLPjPqxsRCigXo1coCFRkesAR2Z9G9djoW1Qww5S84A288QZJHYHjsdZ7+hpU4YA9Nd
         Cccdycql/mzT1xAVsFPGM+Srxa4YRsP8AbVk44j0nEzakVAVPan/XCKkuaeHawUxWF3S
         4YZw==
X-Forwarded-Encrypted: i=1; AKwUvBwDunecVh36t/pPdvukhtxcC1VGeP0/jpVIDCcYrKSezwHW+ZgyYLAgxdL7ZrdBbny25y+N15xlKuzC9MQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lKwnr95waE1Pv8Nk7iczgfrDOQjjiCs0YnoWkKtSyM+IVwZa6x
	vRHRQnWNQqyRGGq46RgxV4E/XUmgzP2SILBL9DLPMyj/anpmLG4R13snPTFeTQqc884=
X-Gm-Gg: AYBFou2B4diM9WmIwu40hTzz4oW1fkcum/6yR4ZojkjpUKpPMm7RPjwrrdaf6I48fgJ
	9YG6j1ScB6BFh7oqOcSa3/U5Xrf1tAFvdYSSQYejt7PCNZFc/z253n9IXGoBVMkAqvIqV4dSJuJ
	273M4GuCmUT8sIQbFfzxcJVsNBBYk410qdcJjYtWX7CLfgCg+BnY16Ma1GjHfOlY3OTd4TuXXmg
	Si6bYs3vgkglvE8ZaP1tvo8PdTc2IPd6pqUKztEYvLFBVPEerMjr3xBXi2dr6wIzzv3evN1UKvz
	J8+40BcNfmS0nSrhW0tPrmYEjHPy9n3xljquWq50WyNlBGSGu9RCX40w75LNM7Xq3v3g06MJQFy
	mzRETILkyoPbkwM+Ez0eNmWBuND3+HhTlBFbOWcgkyPi4aM5p16yORD+eRpgcl4fSwysYTZ87DA
	QOs5dsx5oqyAPOcTKcoTWOuUVWVRSWc3JdbejXdQulMhaHIVZF1JPoI3/oulxLn07QYEvpsaGE5
	deK3u3fWdkujpeZ8tXhcz1NzM0=
X-Received: by 2002:a05:6000:29d3:b0:482:eab2:a752 with SMTP id ffacd0b85a97d-48587046b42mr42417146f8f.1.1788850478324;
        Mon, 07 Sep 2026 23:54:38 -0700 (PDT)
Received: from ?IPV6:2001:a61:134a:e01:4312:e944:2d81:13bd? ([2001:a61:134a:e01:4312:e944:2d81:13bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm32167817f8f.36.2026.09.07.23.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 23:54:37 -0700 (PDT)
Message-ID: <a9db0fce-2a2d-4896-a3c3-2afff4080168@suse.com>
Date: Tue, 8 Sep 2026 08:54:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: cdc-acm: fix racy TIOCMIWAIT implementation
To: Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260907065501.101013-1-johan@kernel.org>
 <e231a7e9-7aa9-40ea-8ac6-57855b4ac811@suse.com>
 <ap56NTVMq8GlbjmR@hovoldconsulting.com>
 <72615ee3-46eb-4639-a408-ba29c1235d08@suse.com>
 <ap6LcHWDvIWF3oNK@hovoldconsulting.com>
 <bc055887-3029-4740-bec5-7e2fe4205992@suse.com>
 <ap6iJ6vkVIaxXFwn@hovoldconsulting.com>
 <f642f815-df4f-473b-aaa2-89153c08bc05@suse.com>
 <ap62IbbQti28M_SA@hovoldconsulting.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ap62IbbQti28M_SA@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.09.26 15:03, Johan Hovold wrote:
> On Mon, Sep 07, 2026 at 02:46:16PM +0200, Oliver Neukum wrote:
>>

>> We could do that and it would indeed be simpler.
>>
>> But it would change the semantics so that past status changes
>> no longer show up in TIOCMIWAIT. Is that really a good idea?
> 
> Yes, as the current behaviour is both non-standard and inconsistent.
> 
> If you have multiple tasks waiting waiting on status change, then only
> one of them will detect it, for example.
> 
> And if there are multiple changes (before or during TIOCMIWAIT) events
> may be lost too.

Very well. Ample reasons. Do you have a patch or do you want me to fix it?

	Regards
		Oliver

