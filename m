Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A56148641B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792333678; cv=none; b=FZO3i1F5ZSHaNZseFvOj5WDqeIDm02KWeSbCO7PU9n4EXwKAfg0yU46wGyDYhEofTmNkFRg3MOP6m+OxtqZUvca9dDcLy39h18Kji9CLCLzH6KrAQ0o7NhhOklNtawd/cdnfZQnTePi08WCkZGLhSFvkuPmbjscPtZMdsZZEY+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792333678; c=relaxed/simple;
	bh=JrJwckTOeFLMYbWPldwO5xzUhS239iwNp6VMQuWtRPU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vF/v+5xUm1pml1WnfKu56d3wjT1Ql821jqVFXdmOExi+uCdF2x5t3oJIv6xHHbbDUBc4fWnexd6imx/ZhCwmLCuMOFjYCzL6oXMKzaf5WxZ4yHUOndylaPTRmyG6R3232kiLiDF1cT+0ZUtvEcd3r8Zpz33C9GlJhZrknhWZV4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiqgtfEa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiqgtfEa"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso14607475e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792333676; x=1792938476; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Eb46/O1NYU+eRR79pz07l5QZJgv8lcTTRms1awqeJB8=;
        b=fiqgtfEa9UbMN+z/IMwGxJt6cfCxFXqYk+9OdSIKNWLtf6pA+iEkppTuhvLZ1igsGO
         +7pROly4vdlvmL8DHVpJOPNuGN0nGUP59Xu5klUVXjCYD2PAPiwK6dcnDV6Z2ugpCwo+
         v2d+9hrseVqOjPoMvztYYVJ1gOmJ2l/dtsVTdAMzfofPTJQDJJPBAfVOa8Ithyo0eX+2
         H0MyIfXOkSNURqOv1WEZepff00BMFZaL9/rEvqqEtnlBN6huwoTwUStewuJnkHY5kVZI
         cI+nLgNmUEZvHa7gAdD+r7zyqAmyQw9EY5ja9aSGJ7aasPo7kD1jwuCBFvG3secBthJM
         9VnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792333676; x=1792938476;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eb46/O1NYU+eRR79pz07l5QZJgv8lcTTRms1awqeJB8=;
        b=RUBapVXPGnk2oWxHwF1v15yM0MWWSzlt1yk8LEcTQE8kjfrFcshV6V7zuNzMtEReXx
         I1wrhsVhjxd1kWfihVCpvd34uvX4CHR4D/MFzNXeNn+P0ctfPB7lqLQW8UGIkB1RPNwA
         2E8q8S6++sr4o1RqOUSE0DU+xAd0qa+iigPA8LdUmttz1OF7yOB2KzPZqbqR+QpcqJrM
         uxyC/tmCRl+FUayIbfN9Zy/ucePhka0B1FIVv/QABkpnrefES92DQkX8G/CLRXkF4wfd
         wHXqkQS8mcCGcX48XSUQgs3grZTnqJyiwUwlHIU9i+Qg5wfm7lW+C5nJpQryICX1ChWJ
         it7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzYCau8xkDrYgMYQDoR7WOOt7jq2UFVKbOXCxdrF2a0VDXIwdjnEfgJ3sw7ISV8ZPOGoZGjvuN8mNjIQj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7Tvk4epBCOW4QCQJp2N0HQM4hF55MCIEP8iHUWUxXWzMNLrWE
	TTkmz+dZW0GW+NsZvVwiF4n+nOxyKxz6abOrX5zbS/ArsL4TcCqMp2wH
X-Gm-Gg: AYBFou2asqL9Bbsr1zZp6I0dTHhOWCMTHrrFNHN6AS+91KSOci780eQLhhxzHBqb6/m
	+/k3yx+auXeHsdE87HhlqbikM1ohcJg68jAjZzcvYwA/kk6GVokHfRgXDJRvuKCSFg8A451V0Go
	sTP2LE/4OqnoLTXDyCnDO+kzM43vLAW4eBYBN17JB+OBap7TQ1ePNEPf+Mke0/P2jXhkxPZ2MPL
	Fgkd2FcYWTnSODSET4cLyzPD7c53wcwma3DF9zN8rIho3yPRQeeixB86SxL/19chTFl6tFVukgQ
	POPfO2krfo8YHojCdcygbqeZiYpkFf8+Guk9hlfZ12kmzpomrTsA9Akd6No1+YqOHUI3Vnz6dBp
	VZE9//kFG7q5YA/sp0vXKkPegvjTyDad5zS1P/YigRMr1r0sVe966mNzH9REb22asstZoAwKb9n
	mdRUodRuAFEzS6ZDFLKauoESNyN1w50mQc8OcC5tSZhQfibldofbM3dGCZtxpU1zskP4PUDmTPh
	g==
X-Received: by 2002:a05:600c:6297:b0:4a1:9ec4:d939 with SMTP id 5b1f17b1804b1-4a1c66cc3a4mr217236155e9.17.1792333675391;
        Sun, 18 Oct 2026 07:27:55 -0700 (PDT)
Received: from [192.168.0.50] ([102.91.104.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm19037389f8f.27.2026.10.18.07.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:27:54 -0700 (PDT)
Message-ID: <b7a4167f8e188d7a0dfe72c2a3e6e51337a33336.camel@gmail.com>
Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to match
 open parenthesis
From: Comfort Oyewole <coyewole7@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: abbotti@mev.co.uk, hsweeten@visiongravers.com,
 linux-kernel@vger.kernel.org, 	outreachy@lists.linux.dev,
 linux-staging@lists.linux.dev
Date: Sun, 18 Oct 2026 15:26:20 +0100
In-Reply-To: <2026101818-banish-scarf-eb6e@gregkh>
References: <atTFT49xpaBEb7Wn@ubuntu> <2026101818-banish-scarf-eb6e@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org>
To: Comfort Oyewole <coyewole7@gmail.com>
Cc: abbotti@mev.co.uk, hsweeten@visiongravers.com,
linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to
match open parenthesis
Date: 10/18/2026 02:30:28 PM

On Sun, Oct 18, 2026 at 02:10:39PM +0100, Comfort Oyewole wrote:
> Fix the alignment issue in order to adhere to kernel coding style
>=20
> Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
> ---
>  drivers/comedi/comedi_fops.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Why was this sent twice?
I apologize for the duplicate email. I thought my mutt configuration didn't=
 work the first time.
