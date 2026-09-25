Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A014DD3CE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361641; cv=none; b=gtJinTB4QL/uXV5tIvx9BLSEwv7e3iM3Kk1fZGgr1CWgYS7Pp9zK5tI46pAaaHsBirdd63+F3/DofTqms2ZXxIFoEftsfWNsPKYrmtLL8eJ1kRSHWKgPg0zMSY5ZF/wWoN0Xdf4mgO4nopWYzoJHhDp9JBYANKha4AWJ0NB7tr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361641; c=relaxed/simple;
	bh=yrjRdIB7yjKDF8p4IRGgdzlMJsmvNcqIa92mC7S8Hd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sVy1Bkm9rPdwpOjeYOqULurAsMi1IN8DLm8nLohdgW4VmJVT9g7IkLjo/PdrYIu6ocziuSufMk7Qn5+iRxBaIhjBJVXDhZo4aBnvuZxxVw/9i3AldV6FuR/suUhHTn+QljJSuEJALgy97I3xzpMIpwqo5X5DFYpqnVS7OSasNCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRMbGF/9; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRMbGF/9"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so6606315e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361638; x=1790966438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDHeyPGukZAAVeAXsc+OzZG9tX2u373beXPb2WPyRAw=;
        b=JRMbGF/9Tm1JRfTKrpS8UVzpqO2aRCKsDQ5fAwPSAX3/RjPkhl0QKwQEjJ7JoaRptf
         n2T603/AVgLHqO6vkrp2/I7I6PZ1PAoCCQNhvclXca8xz/peApZ4gzZiFER3QfuSJAXp
         Cf2HykQJwafV7CoymaKKfHS6XBsgdW9XoZnRwmnRgeQv3Y4ZZ8HBgBbXYVfJM/qSaYcS
         rk4yCmW90p7tXklS0CaE04HwDv3cJvHHZPDw5a5E3fI5HVj9Jkkxme2mpSO1xucKUPyG
         iB0hZng1tg+YSXIa+jpSWYvpf+i/qbNmvcSt0BvZX6cRMNwZaXK5gzKjIGZjdsosf6Zh
         plIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361638; x=1790966438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YDHeyPGukZAAVeAXsc+OzZG9tX2u373beXPb2WPyRAw=;
        b=oA956khxb2PMMRX4LSTx7AStTCdSwSZaxvLmwLmcmGMoKsA5jiYZoJg3NoFRMcs4Yr
         CwdgvXNfTK+HlZOs5n2vsNXgPJiEqXyep98/qN4MZnCGMyCih5CLG17ovb2MYS5CSael
         2CiHtotssz4kr/wrXG/tjSy1vpvLwyhP1Z2FkBplkhnt1+N0uzkMAxfS7KepdrwyIyzu
         DZd69XKCssi7NcnQ0sJ0IztPVybuEXL+njzdHOHGgCq+vs4GHFsCf4vigaE/LL6tefPP
         9UXu1nPGlQMcsvntAw5rqSvG1MtVRuskgEJjBy3CX0UR30GWTlJQ19hmS7D/NeqhJGVX
         Au2g==
X-Forwarded-Encrypted: i=1; AKwUvBz/MvFm++fGXysZhTY63GLZW5ujH7n8h9oNJYvwPbcPMypP19ZZSZoGRa6+ByLH3wTuVNEf28qxIYvRoU0=@vger.kernel.org
X-Gm-Message-State: AFuF++kG7cLYhydebiHnDM39iBtX8eL6gFscPF7PxbMA3PjCFPrxAxQT
	bgvUqDGW/vrsnOc/p6P/xOdECf5nGfxtqez8zkO2bXj14hiM3jzihqm6
X-Gm-Gg: AYBFou30NtNJtSmHSRRWHUWlZ+cQbT91UyQhD7TJFWJ5A0xaqFJCClPSTPK7Uyqtu8m
	szNgkwgPBsmpZ0vNP0m1ue6tm/8yb9c4nlIwv2NPtszYBhw4e0gahGDtE1FataofYrdwocIEGtL
	8CV/nrNoOcH6esVjf5VnkHw7qA0vvpzqN29pCwE8Tj0cubTcUz86B1wwqVILKmr0CHF3ghGW99Y
	KXsCRZ2pUbVF++VIfzOyi1P0K4xZBBaR+ZDGC4L8QnAlLbE71w8Qih2NBXEP9Daju+1nNOrJvRr
	iBDciwrFmAfbYP3KFDxNWO39qKigaGBfXSlKwXmH5ZsyqLGe68OqyQ1A2SGz2VcB2YIhuKCJevj
	0ZUz3w7ItB9ul7XzXi8v96bmVYk7yncCaDb1vTAqo20hdTJm/u9dDarUtuZl0Vak7j/3mM52KCH
	rZG14BG6DRkISQRPlQ0Zy/I5lysdNdBgxE3/tA6JzxwwBm/8pju98X0L0xC/4PCniOq3To+bfpE
	HfFWJ87tJsgwiYrbR8I/bG7KN7f7wsh9YK8BRqtbO5k1mEWCzZwImQvcpZsFIXgKyhptK8akF2z
	tnM=
X-Received: by 2002:a05:600c:4f0c:b0:49e:8418:389d with SMTP id 5b1f17b1804b1-49fe66c6160mr133308955e9.9.1790361638463;
        Fri, 25 Sep 2026 11:40:38 -0700 (PDT)
Received: from ?IPV6:2a02:2149:8bb5:f00:1efa:94a0:1c23:6934? ([2a02:2149:8bb5:f00:1efa:94a0:1c23:6934])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm80630395e9.13.2026.09.25.11.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 11:40:38 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <5697b1a1-56b1-4807-9686-2ef768da929f@gmail.com>
Date: Fri, 25 Sep 2026 19:40:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] kconfig: add prop_err function to simplify property
 error handling
To: Nicolas Schier <n.schier@fritz.com>
Cc: nathan@kernel.org, nsc@kernel.org, grahamr@qti.qualcomm.com,
 rdunlap@infradead.org, nico@fluxnic.net, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260922163749.2031594-1-julianbraha@gmail.com>
 <20260922163749.2031594-2-julianbraha@gmail.com>
 <179024742686.3875862.8878765161331000985.b4-review@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <179024742686.3875862.8878765161331000985.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/24/26 11:57, Nicolas Schier wrote:
> I think it would be better to keep the space here and add it to
> menu_warn() and prop_warn() output instead.  Then the format matches the
> warning/error format of gcc:
> 
> $ gcc -x c - <<<"main() { return 0; }"
> <stdin>:1:1: error: return type defaults to ‘int’ [-Wimplicit-int]

Ah very good point! Will update both of these to the gcc style.

- Julian Braha
