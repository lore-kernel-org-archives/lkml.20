Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CC13DB625
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884104; cv=none; b=OeToJdxEJcZBkkGeFuoSuulsVXnT8kIeahrAtNzYAAsTZUzzXQz2ajybDj+Yq+3pitbWMAMfDkFCVCn04CiaAlcsgsoOybz7S09MtjxmijToe0b3RHfoe8D1UA0I9vZIPkfTgUe/YVTempfUaaGK1o3570Q9ZJZ8du4Ilg4oR0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884104; c=relaxed/simple;
	bh=WTd6RDcQSe4g1DBW5bmql3wwxey6/81WlmMPeti+8qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ur4Rj7c4ipwEWkqKWW2gM5ElVMXbAQqMhv+xiKbl/R/E4CR1CbSap/OMJnhnGPlqMWZ3/wIp7PGIcSkMd45YWhcPzUAMKAH5KK3SmyV2HRqYBDemqybOKQMnJ30vFjEWofsFKAw5/jG9gQslBX/U9tzOjuybDuFASrrijyUFpNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cQbhz5NP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cQbhz5NP"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1909238f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791884102; x=1792488902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7oKHBU8P6VVCJPEp5uLiJNA6l4tFvXP4QYcJqDIB14=;
        b=cQbhz5NPJJUlZinEE9hb1rfy7fGObYKSZVWXxxTL/zc0w5fYEV7Odn+xXKSfMQaQNf
         uv1Y3szrfbz52Py/uyEN1kkeRqR/dDn3NYmy20pJeBdkYoSsYoDfPn4tMcpszwA6SbAV
         GqrDjMs8KGfm5QHDYseOL9H0a5hAv5//AD6Vuy8S75AUZWufS+hXjmBTS0kBoVAODlnP
         Oi6KO1HSL8YcKL4cr4k3wdsDwhxISTnS1SpA08NRFee0iB35jZQtJgf5NdNnGJjuY4gU
         ZxGHRnthluZThfAqO1b3BiU6BLiifJwjL3T3aIkZzJaTxIhB2uQ+805LjdM1vwCm3xD2
         OkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884102; x=1792488902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7oKHBU8P6VVCJPEp5uLiJNA6l4tFvXP4QYcJqDIB14=;
        b=qrErvuVnRu7Xf/wrRaOzht3GfkFKDc0rSjpXfsNHCR0uT4v8JsmV3kcLqchGiIqph5
         CMfkswpqZJEXok/awmFe+KShdWPOQhbFnznFAP0pP76hhJ6CYBof+rvJVocJWBKtb3I2
         0/z/x+emFBO3FGRXfKw0H44XX/BtLGS2uZeDGHA8B/kBjmsMXWUbSgClITa1FY9sjOgY
         l2CePh379Rn5VwjprhZXsJFDqLBwJg7L2SsdLXwIF5ellbtLBe5pRCOxrvlOtlR7D1gK
         W66t56oYTbqTkGKs2G5RQMQLSg0SWZJ6wsVVbA4+gImYJya7yn02JhLW55OjsvOPHUoB
         kmlw==
X-Forwarded-Encrypted: i=1; AKwUvBwil73VTmANGmzF/iOXUuBc6mYRxjbapGtdTsjQ8sCo0GR/U+SD8B7JpUlX+vY0nqz3ex7CrKFjf6Wq/Dw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy6rzPN9WGeOt7XPpMESleU4jL+DlIOOQTwLyLmsa/c9fOALyZ
	UttS+JFt5Bd5i4G3aRR+KsbrnC2lrQJ8d0ektQ+CygVu1oKLahzHE+V0UHF1MXaE+eg=
X-Gm-Gg: AYBFou1LyyDgUjK0WEWt7DQd+FrbF/uUxnRTbnLSVcU1ZPDCgi/JfvnZdo6T5IswqIY
	C8rRHwrDPtWwJWEe0iNUu8at5OwgVtDskxMxZVVlT3VjQUZsuNedK5fFauYDNbxZrNNoOtnOeTe
	/JRpFoGyccW4FpE2QVr9JjqRSEty7s9vDqWVKFivuwTh7JnXux9fmLWumYLxhi7FVZU8Iff8o61
	Cb+VcB5yMc+FzCeuY59BJK78dz/30uh/RXDx0C7qrgBAvfiKSZvUVzIi1I9KGnSLvS7tJMTAzvY
	aUOcFsen9Qt+9w6KfI6wfore+K107pccI5gYRrsN0zCfU7ozvaT++hVBUZoybeaOAsqNu4jwcxK
	90fVj/iLamk65kHM1PGptY5pE+bwK9WKXemgyCRrLhsM4Xp3bkiKXYWZp+xB6IOcPTrJuEytWwh
	BrBl0Zh8nJlH6fo8XuLMssitw79W732E+lpdo+gOYY2IhmErdyzVJ/PiQb2pLPLlMWg107AkQd+
	QBoL5igT6ufVz4Z2x486+iMbDbmnauFYtqmrMly
X-Received: by 2002:a05:600c:a088:b0:4a0:333:253a with SMTP id 5b1f17b1804b1-4a18e49c331mr234770065e9.14.1791884101673;
        Tue, 13 Oct 2026 02:35:01 -0700 (PDT)
Received: from ?IPV6:2001:a61:13f5:2701:b3a3:b9f5:f3dd:ee85? ([2001:a61:13f5:2701:b3a3:b9f5:f3dd:ee85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5262sm4167670f8f.22.2026.10.13.02.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:35:00 -0700 (PDT)
Message-ID: <b819ff38-6916-40e0-b2f3-1b19876971bd@suse.com>
Date: Tue, 13 Oct 2026 11:34:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: Emit KOBJ_CHANGE on unbound interface
To: Fabien Sanglard <sanglardf@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <b7c2f7d1-40fd-4d83-8ced-5fc27e3be051@rowland.harvard.edu>
 <20261012171609.88273-1-sanglardf@google.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261012171609.88273-1-sanglardf@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.10.26 19:16, Fabien Sanglard wrote:

> As a result, userspace clients like adb only see UNBIND and must poll
> /dev/bus/usb to detect when the interface is ready again. Emit a
> KOBJ_CHANGE uevent when device_attach() finds no matching driver so
> userspace is notified that the interface can be reclaimed.

Hi,

why do you want to limit this to that specific case?
Why not not always tell user space tat a device has
been reset?

	Regards
		Oliver

