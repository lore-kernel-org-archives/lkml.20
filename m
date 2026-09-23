Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DED5235045
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158062; cv=none; b=d2oVo4l28Y+9ppyA0HvKiN+cgkwJkhtIRBMbOjYVOwZzT5NUfw16iBQxGmsoJSo3RYzEL7MwXk+dN/bvUaseB3rsyXsXG8v0he6ghoN6IQL2ZfjLxeHp6XPUB56XtQj99o+j4W1mfVG6Daad9OKNqq85HPzt/XFWUDkYr3xM8oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158062; c=relaxed/simple;
	bh=oF4Kl8JfVhfUU0dj2/ZVkmxW4BeWTvV9sPnJQM3i1Jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIEWQsvZdzCf2/feb6ImBPm75jtKsizPLLc56pRnr5bV4D9L1A1W+MMcSiLHVminWftiKr+WGM9/+xEsbAeHzQaeqwB7pmXH+nqwhZu5QqJD2P5JRNMgDTwl8QHjW+CuL2Ove2yZhUbqhFOMaJHPHOz2OqzXtOeEVHvqtVz1LUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MG9ESs+1; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MG9ESs+1"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so775945f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790158058; x=1790762858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3HwIHpPDnN84lvdPQSb4nxQoj1g+sKDTa/uOr7Nwwc=;
        b=MG9ESs+1DhZn2l7svedZCGdFQAmHP5vCCACZN+EtC3wXaB/z31UrHOUUjjYzF9HhLt
         FPWrNdUmCNfyIlfOE/s7icwBTtv6bSea8IAbJ8tCb41eDBEHcQH/WRAzEoz7V75dGcCN
         iYzR5Sv3pwdaHdmJKmt9YbwPdnyVj3e3TrBDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158058; x=1790762858;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3HwIHpPDnN84lvdPQSb4nxQoj1g+sKDTa/uOr7Nwwc=;
        b=u0sG2Tj9zBmtH+15YbfySfMKwGUwS2q3exTI4D/6/SIyJkaciYzrd2Wd7rxzbuPJ3u
         f5SDhhaUBLo1apNv02Iw3HgDlIijsNxlnxAIwOzkR56HDRio4+rjBLW8PbdU/o6VPCOw
         fr+IM1+XIxtszjaL4itdZ+/03D1Z+ZPaDsXHovENZRSZNtPBK87Cmam0deQe/3BSTJNO
         9ypXHuOevtG5K7e11sX2rsghZfZIE+V+jmBzWTApte0x/sw6psbmCsUZELDTQTQg7eUp
         DDOBPOQ/GzaQSsuOGYzJLa8gBEMq+zVoG+qt/ELp6lj4eLAMvxoVlH6VKb3Pmd5/dPgE
         gnqA==
X-Forwarded-Encrypted: i=1; AKwUvBycD9DUcK2wcz5yjeSMz96Pa5eyWxyUrlPJP5Lry1aE+rHzR6bqdzcrLjbjMk80QhgTarbLJ1sDxVtnjdI=@vger.kernel.org
X-Gm-Message-State: AFuF++nceEIcHUi278VzGSgHh39iRDRJ713x71kUJkVjrQWtpFm9SfIP
	B7vkuC6sy4LCYzBvWNBCIcnddY7FPHGSeUZDO6kpPFAcYAVuk7+AhUyQGt2QYI1f6ElXb3lItpp
	UIOZ5wWmr7g==
X-Gm-Gg: AYBFou2UbjZDJrgHRlo7vs3i3byDKwpWdiWLgaq/62WOpr08tN1KnvjLQMNeyBJ9e/i
	H+b3p4iWyvI7n5F7bl9cJGF00/AUxZSM4nET1Dhc/t2XowBiu47BLrm46HwuE7n7+eDewYkIbYU
	xKNSCV+6FRP82+9kwp1WL1RCa7Jny5zu37NTfFnSZd2DvIrqMpgQHweKN6nkE5L2adccuv3aftx
	OZs/xQkOBy7ptzkayjHZGiNf8cKW6GFZz1aS6U5ySyLpAiNURrBbxG/HekMpkq9Tt2GEy5XaoEZ
	wECDe71XdhUHpIXllvuH1YZneNag8T1Hnv3I7ksvNZavXYx1Di6KfzdPk5yqtNujcBFsK6GC0xu
	W85LBVYj9Hlp+PE3lg1lcJWhadg69i95/XbvRDJeP06SwrVZFtM6RJbycE+W322Fu/5bIkFnFyk
	ee7/5yR13LaDFdwIJHSRSElOo4LPAQ0FsSb3CtgqUk7jIG1jo8RFqjfQbf4sZgadoaiSKKZt3RU
	di/Xw==
X-Received: by 2002:a05:6000:2901:b0:487:a3f:1ea6 with SMTP id ffacd0b85a97d-4886704a159mr3802209f8f.11.1790158058311;
        Wed, 23 Sep 2026 03:07:38 -0700 (PDT)
Received: from [10.214.128.75] ([149.7.5.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c267sm6058984f8f.16.2026.09.23.03.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:07:37 -0700 (PDT)
Message-ID: <ed2f9269-0428-4dcf-b6b0-d7b6eb0b140b@linuxfoundation.org>
Date: Wed, 23 Sep 2026 04:07:30 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: Reject unterminated strings received from peers
To: markdamirkan@gmail.com, valentina.manea.m@gmail.com, shuah@kernel.org
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260903-sympwn-linux-005-final-v2-v1-1-f92548abf9ce@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260903-sympwn-linux-005-final-v2-v1-1-f92548abf9ce@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 04:05, Mark Amirkan via B4 Relay wrote:
> From: Mark Amirkan <markdamirkan@gmail.com>
> 
> USB/IP path and busid fields are fixed-size strings and must contain a NUL
> byte. The list and attach clients and usbipd use fields received from a
> peer as C strings without checking them first.
> 
> A reply with an unterminated field makes both clients read past the end of
> the 312-byte device record. ASan reports a stack-buffer overflow at the end
> of the record in both paths. In ten normal attach runs, the busid error
> printed six bytes beyond the received record. The server did not send those
> bytes, and their values changed between processes.
> 
> An import request with no NUL in its 32-byte busid makes usbipd read past
> the request too. ASan reports the access at the end of the request.
> 
> Check the strings after receiving them and reject messages without the
> required NUL byte.

How do you reproduce this problem? Can you elaborate on the setup you
used to reproduce and test the fix?

thanks,
-- Shuah
