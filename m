Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5913D9DC5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265079; cv=none; b=CzbZ2UmgX8h3uNfO28RXiie+fSP1c3BJycndytZK6mpI226sguwpYtM0hfHI0KVlb48Twu/hJgtuP6dL+WQoKg2hUfp77WQDMFQRaGOU/mG/MyPGKfiOd1iwUYPfPgiAvsEEjmeIIXvRjgSLxkU4hoae29rrYRTjKQ88fTI9oUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265079; c=relaxed/simple;
	bh=SzCRutQlS/1vZ4F6M4z8R6rASLyArMeEGpVRwgSj2VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3e6eHmz5/Y7uK070W5yhjH3WHlrYbyzGojjUfcfMJ5DNB6gOz9hxbr+GN56hAFjFVSnbXY37VrjsaMVlR3C4mxS0TkH+Vz8wExiN21dhmuhFFTsauWk9rI06ugn21mPpkRW2kVJLwj/hssxVxfNwtlNpfhTxvju4hqVWOwo3jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b6C9v4xc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b6C9v4xc"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so9047755e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788265076; x=1788869876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0XRAAsunpmX/3gLlcIV5O7uA70HAg1kaSiA41/S29s=;
        b=b6C9v4xcgbROURz0qxNSAHOa363wGXNiFqHpdMGqvJqjR6Q7JDjffcS0/kruMclB2q
         xbfx6sgLhgLbqbCVNpe/BzNLFl5s4R0y0Jr+7goD8FIKoL8s8Lh9kWzJ9uDaNinmD1sd
         +ffSfTjBLmfsjmBywgMwZNn/0USBSXTiwWGp8USfziXZFHbSZhWpFKjV0XYTga+nlkc+
         4YaIT78fjp4nsJqgc+heYMgVWekuY7mxtCEWL66vGxQSOaqncXHq9Erop0AIn3OiTA+J
         +pFmVjohYSdVdSyth+BHjenq1zmLHw/eppM9yeOx5RmvRXUXY0p7MJEvebZdMmPFWpRc
         nV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265076; x=1788869876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0XRAAsunpmX/3gLlcIV5O7uA70HAg1kaSiA41/S29s=;
        b=gjoO6Dy2wN/qBGxUmIbwgq74sxZKMr9RNB8BdSGl7CugK+zB3Twq237Hkg4azRVf4t
         O15kupTRDaPW+eh2/EvHm2zbgtzqwOJ22D5c4KOmTYe/botURtufKuA1XfDxrYXdCSsG
         AtUwzal2w0fz5/1LEWCzp2eT0h/0ww4CmaSuPy7JjecfqSR17n8X3OwxylJHcvo7noMB
         6m+4gk/kYJmZQdyGnweqxhiZxigSIU7NBxTKp0eg78VTpU34ft+a4cBiA3HETlcTKJiN
         dYYA8MGqGZqBR5O8Zzx4i9yIN9jrovSdABe8uR2x3rgnxXCBAeBnKR2c7N2oBr4yeH6i
         ijew==
X-Forwarded-Encrypted: i=1; AHgh+Rpmf+dpWqvVOZqn8qq7nOJdlhAuqXC7pQ5MuVLzHvhVADgOKQLo8YQVgFACTTBLkJUNtzBEBHH4IcYRsKM=@vger.kernel.org
X-Gm-Message-State: AFuF++kG0stEtdfN1igfGYOiitJpk/xGqXK6UpFGTiXFjWGzG2Tp7SMg
	DbVL5mZGwSyQn6C60PATyhG2PyxLVODPDOs7ah0VMW4HbXrUbkHFrKvyY0ecA3BwXV4=
X-Gm-Gg: AR+sD12Ctyf9KfpTdkw92c4hxY4mvkx/KMpqLWszZSecrqNYsX1Z0DoLeeEHanRLJD5
	mEfsKtZkFV1KoBSp3wOcwsOj/B61Cv0dvtOfv4nEF0isGDC8d1ssQZLOLN5nTnrkMtbArS27roB
	KyPvMDfy4Tawj6drqqSfbbnScXNAwL7z27sVDT2pm1+oMMSe76S+guqUuxB1ewiKc/ycO4BJhSI
	FlBEd0JDXuQi4MTreyj2/WZ+kgnhyiWcKatRtnq6mzPFJjIAVnDWZzaStkXbSCcGgna009EBI2n
	RetNI8WzOTjOzRRl8C1pkuFkRd9I4ab7HwZERAb2Vyb1yo+to53EumBNaJnbhQtQlq6GhPPvfHE
	2q34AK0U1XhkhqKGkUtb65WEPMKZXMPDaYUAjFq22u2StbM/3gObgd0S1esJHwSBfKoQYKvBGtX
	O/3tOF0BqYHyAtOkWyEU9HVZinb9oGWS+kLPQcD3o2NJM8l6szKQ9EwgS8Y65JOiEQEVFRXR7vR
	9j9Z3wDC1CZJzIm1cKb35wkMQ==
X-Received: by 2002:a05:600c:5490:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49ccf18498emr365099655e9.12.1788265075917;
        Tue, 01 Sep 2026 05:17:55 -0700 (PDT)
Received: from ?IPV6:2001:a61:13f5:3c01:dee6:bd49:2b83:2f74? ([2001:a61:13f5:3c01:dee6:bd49:2b83:2f74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd8b9a2efsm175980885e9.3.2026.09.01.05.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:17:55 -0700 (PDT)
Message-ID: <0ff47679-3f00-4cb4-b1ee-2b3a0e15b13a@suse.com>
Date: Tue, 1 Sep 2026 14:17:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: image: mdc800: change kmalloc() to kzalloc()
To: Griffin Kroah-Hartman <griffin@kroah.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260819-usb_misc_random-v1-1-43a0dcee3a32@kroah.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260819-usb_misc_random-v1-1-43a0dcee3a32@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19.08.26 12:04, Griffin Kroah-Hartman wrote:
> Change the kmalloc() calls in usb_mdc800_init() for irq_urb_buffer and
> download_urb_buffer to kzalloc(), avoiding potential stack leaks if a
> shorter message is received in mdc800_usb_irq() and
> mdc800_usb_download_notify()

Hi,

thanks for the patch, but is this the right approach?
If we get too short a reply we shouldn't process it
at all.

	Regards
		Oliver

