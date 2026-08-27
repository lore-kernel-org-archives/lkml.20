Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808BF86341
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842950; cv=none; b=J/FoD1H5hmozfdRE2mLwNzw0/vq2YPlu4aI15NyaBVW5Ys8FPg6jtMigGItvN7W/3au3YOsFbjV5KNAs7YOZ/KtDJx+rS8Z8ASKQrtIOa41NvnreJJ9d3IFsq8KIKTGytu7eQ9CEED7Ug1ODb1lFA2oyfETlMKkfexMnLf4qqRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842950; c=relaxed/simple;
	bh=ObIQRn/vjtcvL4sdmG6ZiBqkBLodyvFTNyqP+glWGbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIwPNycnyo9Fw9ia24j+KH3q8QWg1shNm5BNf0xg4II3GAfbGrLX4X9JuK5/CNWioD78wgFOI0fItUUf/VjPiPqbPZRbVvL8C+4ir5Ch5h1m5Z9NPdEJSZ8C00fN9dlWVWFQbUHr5tmas0FBeNeV7b5ETOZWk0CTuRqIgojQh8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I0ATv8O/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TE5TEgrd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I0ATv8O/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TE5TEgrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787842948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PUTGt/6T2857LdQnAot7vE7NZU52FC/fuVGXZNjR5lw=;
	b=I0ATv8O/fesqn3cms+ZN3Hf8b+zwRh9uDdXjfqXuMz1nliIRrrZvjS1Ks1ruSg0n/FsbTA
	0MFDKIk9bHD5X97+lOvwRUwkckyndVMfd0kpm0Oz+pPLgIU1m3JlNAqO0u/b9X3p6EcwKh
	TwFiG62wPO+tcoFgxLQAFWUGskOPkqA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-n2Efcd_nOeGJUGMv0Z15yw-1; Thu, 27 Aug 2026 11:02:27 -0400
X-MC-Unique: n2Efcd_nOeGJUGMv0Z15yw-1
X-Mimecast-MFC-AGG-ID: n2Efcd_nOeGJUGMv0Z15yw_1787842946
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836d23866bcso44576397b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787842946; x=1788447746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUTGt/6T2857LdQnAot7vE7NZU52FC/fuVGXZNjR5lw=;
        b=TE5TEgrdQXhC6HFlhBLTeAJ9jenuMY3OxtZSirL6KNM53pZY8MoWJ1eba1kQkWefaO
         DdTD+Y6shJsW7j3S4UfqRMIC8hMvHo9MUEKUlkVOQTv/s9cqW7q1hJgUSoM7PluQRiRr
         GbeN63g6DJ+WWJT5wKCw5wcXSfvZwWL3ChCIS8RXnX3kycPevynLf2D1vSyAHqzT7zLs
         7jidKwfhdoo6yRaxTg3s9xg+HO07rLoc8Ku2n+TXMsCk8s9bhzrr4zCbfR2h4zFcjzqV
         hnrQ/awh+BUVVIEd67iZdXx553Y3tYlHcEZ3UB0/fAYPEKXhfPLIRxhUDXlzsdi1bWZP
         C+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842946; x=1788447746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUTGt/6T2857LdQnAot7vE7NZU52FC/fuVGXZNjR5lw=;
        b=O5MzrSsWtpgHsxXQN+uK2zAjm17Mqfe8fQcghEBXPqTnZXpt4CKtNj/mzIJBPwraQ3
         HyY68FzYGVt3Mf24pLu1KL2vGynr7B7NbSGgdK9vZDEpkkrzgyPhMCuwftUkHp2wXZA9
         d53OW6cxjwj0LHrYfWcm3Wpotv7LsRtNOQowjlY6xBNONHpMAYU0SGSz2x+3UoDLiPG1
         93evapuKOj+d06y6mG074PwrERStNnHsj1x7YLfPvsxNJ96ULlMgX/3YPWQjQLqiJLkT
         myAh6BQDqt8xcHfiBpeHkRQSot+ILFqIgdelVRZRzBeEbR5RXuh+Tt+Nqd8YOrM9dCWR
         /8Jw==
X-Forwarded-Encrypted: i=1; AHgh+RptadyiQO7LHVPaLY2vbICj+U2V6tBFC6vRG2aiO2cu2b/XDaN68KTGi1/DpTs85JflX5x6upzgsNwUNRo=@vger.kernel.org
X-Gm-Message-State: AFuF++nwrrVDLI2/kSorSZdgQ+5qzx5D4azDoxf0UG6hXpkwrQIp9JXr
	IL20RV4TQnmvgFCgRVx9Q99434UXJVEmE3AgB5AnSyYiUNq3Lbp3TVNnVqw2fTxBZ30zQ+ytV8s
	k5ZmlHy0+OyfynFxIhnrTDbY6EJ+3zDYvjrdq7DxV7kGYD9P89sV7YzOaDzrhkiu3Nw==
X-Gm-Gg: AR+sD12qz/1+5R8+mOy0P+xk7SGr/iojUFYcJeYmYoDFucbEaIEDEO3KRQMxvTfxTDd
	04ztREJdMznl4oGzrTNU0GvRnZCcXn7b6p9RcvRIutWrnQ67j6vgh2oB7bNj/Ac7osZLksEICtC
	3BKb/xMWDiLzT51tSHrpiYUaNX/7TByVwFwnXNhT9Cc3gx076oTsYhgaEPDKn7DmR4J6V5rTP+l
	CtAfDpTYyxuB4LEL2f4JIYnG7PFpyBgOxoDgSyZhd/8rpyZwyRT2fBFhm69wgduaTfoXOpj9f7E
	7sReQibsD/JSoeu/77jqLiraCbMZuqhFroZfovDt6k9lzk+JzQLqiZrwPOgyG5exjdAJRW6Tcw5
	KjohPQTdwX9XhhiBvtPvoZH/YPySC4yACSG1iIY8MAzjg3G/9j1w=
X-Received: by 2002:a05:690c:6f04:b0:845:ddf4:a399 with SMTP id 00721157ae682-8573eb29e82mr76831767b3.11.1787842944167;
        Thu, 27 Aug 2026 08:02:24 -0700 (PDT)
X-Received: by 2002:a05:690c:6f04:b0:845:ddf4:a399 with SMTP id 00721157ae682-8573eb29e82mr76828737b3.11.1787842942569;
        Thu, 27 Aug 2026 08:02:22 -0700 (PDT)
Received: from ?IPV6:2603:6081:6e06:8bdb:3863:7a4e:feca:4412? ([2603:6081:6e06:8bdb:3863:7a4e:feca:4412])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85b5bc331c5sm11402857b3.3.2026.08.27.08.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 08:02:21 -0700 (PDT)
Message-ID: <bd7734b4-b68e-4fa5-b6bf-433332c5c9c5@redhat.com>
Date: Thu, 27 Aug 2026 11:02:20 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: gpio: Clear error pointers for skipped LEDs
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260710150841.19669-1-sdunnaga@redhat.com>
 <20260724180412.43150-1-sdunnaga@redhat.com>
 <20260813154559.2407-1-sdunnaga@redhat.com>
 <20260827143631.GD2943942@google.com>
Content-Language: en-US
From: Steve Dunnagan <sdunnaga@redhat.com>
In-Reply-To: <20260827143631.GD2943942@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry for the noise, I missed the applied message.

Thanks for applying it.

Steve

On 8/27/26 10:36 AM, Lee Jones wrote:
> On Thu, 13 Aug 2026, Steve Dunnagan wrote:
>
>> Hi Lee, Pavel,
>>
>> Just checking whether anything else is needed for this v2.
>>
>> Linus Walleij replied with:
>>
>>    Reviewed-by: Linus Walleij <linusw@kernel.org>
> I'm not sure what you're asking:
>
> https://lore.kernel.org/r/178602432127.2934315.922699465700010447.b4-ty@b4
>

