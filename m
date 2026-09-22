Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032614DA9B8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071473; cv=none; b=AmX2NEo8YEkrPFZjdLV9r6nyuhwGpCiEM7ogFNJKJdiudGm3VX/IjK8KqVqX+VPEITS/iQuoVTG7clFifFcZ+wtXfEYEV505pCrao74EJOIw8MrwfPaQtgBEgmZlW/wF+jJsGd13uiDmofZVf5U7KL5ffn27UoH5pzocLJjbwDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071473; c=relaxed/simple;
	bh=+/p4Q0sgN1gCnPeZQ7lrLCym7jS74y6M4D4tNMXfdHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KeUD6meYsk6gIx2nzKhc3/QtRnxRbe0lT0r32YX6Keg2E8eryMIceJP75fVouNowbf9pn5dgPw9x0hHFJUo6BEilczvdAZKbBpIjayCK1DrjGWgSh+u0z66zVGwAuXM+lN/wKw1GbTM0+lx5UxFfCl5QwBrRlzUa3I78Lv48s/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XdPA+spD; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XdPA+spD"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb796so536124766b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790071469; x=1790676269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ips8FL5qQlrZs4lRamhBauIUV4D+6bxULsoH9iHoMk=;
        b=XdPA+spDZmMIGMsVeP4gS7fqQDoUJkMNKFvyFUWUYNBY8mo8b9lCDLOX+r6VDwIcwJ
         HTYpfmEk+zr4aDfoQSXTzAVzLAVTBDQ2salABtXGjvEhQlLmCwuezcGxZsQdrivcaqeM
         fP/VOJ70rdFAPENbXQnfkkmHnGLJbXaRdaopg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071469; x=1790676269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ips8FL5qQlrZs4lRamhBauIUV4D+6bxULsoH9iHoMk=;
        b=WcudHhD1ufXpNC3zbftMVCRBstymGmEmzq9D/K/MRgcs1SFFJOIuJO+oMVAkSvpEG5
         DBf3D9BY5CTTkddjRGtNXbqPMdYDDTsiKlSLpWJzxvFl5S0OGkryq3YrIxo3BOGCQ/ec
         440uuhjlUrXxbsK4prQsxGoOehTQri5c4ccbbOq10rKhSQG3CR6zJZckFCV0G8GDdlPx
         RvPZdmiLusGv0LQWUhhk5Xgg4BaUWSXK6T09zZRVvad4wFPbxsD+psG0KWUn1UnodAi4
         NDyIooXxCXdaJrt8Y0WZjp/yimM33rgTTpi8MdlwVVdwB7IAzN9LTlsj5PwW5WKDVnD/
         8XTA==
X-Forwarded-Encrypted: i=1; AKwUvBx5nLmJoiC0oDi/2CT20Pcv2JfOhj1zh9luE0iLaHT7NCh2dF4DRLyaLdP60zZ+6eTCUEaWd+YCAlfFv0E=@vger.kernel.org
X-Gm-Message-State: AFuF++nWsr6FNMpu/yioaRlrvk/p45ePgWw78a81qG6YY8qyUV4GTDJk
	4TTnEtg3l1tN+7w0+7LquabCORO476ATW6gOgvVsdHQeBz90ZWeG9IWaoIQbI/0jWg8=
X-Gm-Gg: AYBFou2ySx5xHZ7hJPWnse6w7Ml8UedwfQnr9L3q8a/Ba2O9n4FtfywW3TSdwrTnwy2
	25esNjN97b93Lf1Jh7aVNs9WOCrtxxgTDDeFcRIBBo57J34EIeDsfRVyBbBNLjmhaZZJ0sZSJTv
	GbudLXxYsx62UnUwLYWf9tr8JJR5FoUlWAmyxxwp4Ih38BENBejjI9ny+Rl0QDifqF61LthP59L
	392Kj/A2zk6sO00Qcr4AZLfN2lgB37LXA+qQPv+7uEORDovM5nwsOd2jlWUkVQqs4vuWZ2CzjwO
	Sr6NPUix1uYdnsg1JXj2Jzfk5N0PJhB3+BBMbbxxDj1A0DO2f7lKjNp79C/XjHnEoFiQMqe5bn+
	gng3SJcsGClwKcbGFirLn0ZgAw/wj9Y1G9mcCa6278ezYuqCLae8Shj8RbcV/f6UnlaX9djn9dd
	c0o/3uNOgHKliAxOJEZsqp6/ek/cTv8sOtNstfM9DQv6fvi87jj9QGhkWW7yjrSuWrYFs8MaucM
	gQIUVV73Kc=
X-Received: by 2002:a17:907:9703:b0:c26:219f:6f74 with SMTP id a640c23a62f3a-c2a15846232mr1049317766b.5.1790071469048;
        Tue, 22 Sep 2026 03:04:29 -0700 (PDT)
Received: from [10.214.128.75] ([38.97.137.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f32esm60622866b.15.2026.09.22.03.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:04:28 -0700 (PDT)
Message-ID: <b37401c1-b6db-4746-9f6a-af25e9f30829@linuxfoundation.org>
Date: Tue, 22 Sep 2026 04:04:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: add NULL check for calloc in
 usbip_exported_device_new
To: longlong yan <yanlonglong@kylinos.cn>, valentina.manea.m@gmail.com,
 shuah@kernel.org, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260817060618.749-1-yanlonglong@kylinos.cn>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260817060618.749-1-yanlonglong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/26 00:06, longlong yan wrote:
> Add a NULL check for the return value of calloc() in
> usbip_exported_device_new(). If calloc() fails and returns NULL,
> the subsequent dereference of edev->sudev would cause a NULL
> pointer dereference.
> 
> Also fix the error path at the 'err' label to check edev before
> dereferencing edev->sudev. Without this fix, if calloc() fails and
> jumps to 'err', the code would dereference NULL when checking
> edev->sudev.
> 

It is theoretically possible for calloc() to fail, however how often
does it fail and were you able to make this allocation to fail?

If not, how did you test this patch? In any case, I am not going to
take this patch and all the other patches you sent adding checks to
calloc() calls in other places in usbip tool.

> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>   tools/usb/usbip/libsrc/usbip_host_common.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
> index 01599cb2fa7b..94762bc282eb 100644
> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
> @@ -71,6 +71,8 @@ struct usbip_exported_device *usbip_exported_device_new(
>   	int i;
>   
>   	edev = calloc(1, sizeof(struct usbip_exported_device));
> +	if (!edev)
> +		goto err;
>   
>   	edev->sudev =
>   		udev_device_new_from_syspath(udev_context, sdevpath);
> @@ -107,7 +109,7 @@ struct usbip_exported_device *usbip_exported_device_new(
>   
>   	return edev;
>   err:
> -	if (edev->sudev)
> +	if (edev && edev->sudev)
>   		udev_device_unref(edev->sudev);
>   	if (edev)
>   		free(edev);

thanks,
-- Shuah
