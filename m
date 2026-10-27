Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126463;
	b=BZyBwx7IzvDnBkih2FHKqEv8sCpZCEnanFWjVOAw01nZqs8zIYhlxua+UUQX9qIu+doj
	 SdZPh45H68joE5cwOCswoN4kMh0gxS7RP6DFOpFuMrE8Ze8nBXL3GuT8wxctFeB9ZXeKx
	 pB2s5+lFpQiqoc6HFvZFwNIlo7keTQJ1yHsvL7CIBry/aLwrv0RHrMnjzp7mCIg/oloyx
	 5S3HpswgfsuRzoMhf9Jb0jzaFJzDhpDWhsgcWXNWecBfUW15t7+MY7ZB2nX2eEYLG16nV
	 H+f4lSrJCJTkWt4vZ0aP8itGfo1bIqBNaD10fLmoImAD//RDyMTyI9C7dVxQPrh1biw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=MGa+01wbtNyQ/XVL80uNubXFCRJ1XOxsv/KCxmazccc=;
	b=42nfeNt9qw+zPc6T2szwak9W1YweW1KVJ7lgwfhHrM10q5I/6v9KKoQw8AxikFJ9SakK
	 KZmieNpYq/3PtNK0tu87zj5RRJWJDyTJsv7ExSiuTLvMuInvjPhT3AzHXF0U2LYzPP9TA
	 rVs6OyGOcMLtOsZThIdIyT7nsUYo23SqCii4+xS5IQ+mFcJWFzfbhppUW3sWQmiMv5lwC
	 Ka77VLv+Hv6/s+BB4JEfK+CMrRuH8Z6xv3E+M0h7V1VF+2NwTHGMgQGCr2c6rgxoNEpn4
	 Mg9zsTfd9ZUSGtZzw1pxxNKbHVWMnvL48IdZjetVd5bo7Ne2fVZJT/dli5WP5y6U5og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xRwwEtg8;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C4B606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C4B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xRwwEtg8
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-18cdcfc05ffso197968c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126462; x=1793731262; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGa+01wbtNyQ/XVL80uNubXFCRJ1XOxsv/KCxmazccc=;
        b=xRwwEtg8lVhrxd6fBgm2ijlywYQUnCNmHSjhNeIl098SYXq/KExi1Bdi0xvA5yzn9T
         Aviojnxm0v0ZDOIE2Jb6PeoYlvoBzI/0q+bnrUsrRYb4Ug/TyDmane9YiFz+2gngytg0
         pKuzr9l6Qt8AWppgOc7GYx97mjwyyzjgI44qlHc8xpjo2T+6xPwrw+nGHfDpHWuS9UPd
         leJp9poolLSIrZBCeTRCC0DEu5vYbKSGFHeqmdXksR2KUft9LjSXWNh7clIPNKyxZ53n
         rvUUktHK18LsmGHj+rahmkhp04vSqCrAoB7KX0NsIPtCymwlf96nRKySygVld62PJZ9i
         gRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126462; x=1793731262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MGa+01wbtNyQ/XVL80uNubXFCRJ1XOxsv/KCxmazccc=;
        b=l3W8KHoXAScKNDbs3eKZbM4Qq9cxt66J2RukbkJtO8sLTCHmT6gRyWrrWPVot7w+Df
         sXBGqCyK1I5Q4exTc8qN76bcwhWQ7Qbi3m+bkz1ESRsc3F5wKSPK9XfLxArTp2n+zYeL
         rCm/0lEBF3VMdda42Yf67v6Dv20c2rmk3XhizCjJknM1Pr7pGIebIFGW6XKYaE3CpP9v
         U4jRiLrlzzbbZIPZygCtNVzBeS5kqWj0tId60pirta3qoXPMHtoFl4EAXfI7lTw0GpRl
         ScGeOA3w7VmVwjnPO1wYc5kVt1zuFL+d5sLQ7gIVhZKQCnm/kB7XjmYQHV9BxQmilHNC
         wm6w==
X-Forwarded-Encrypted: i=1; AKwUvBx5pDDe0RSk6P8K8rTxYsZyTfCIFcwlEOrM0rRcyvF1+ZyJYDVF7bo522a1t6kyp8R8osLGYKKHQr+Xfrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaoZ3gFRZ+oCutCxzta5P8lKRmqgqvo+w7kqs6SPiqbeCDHfWr
	gFw9bRAxuHQxDWq3/d/OLhnQCvai1klYZ55LidqtWcSBz3golyK5XoJ/
X-Gm-Gg: AYBFou1KsgfwLbBvxtNNgH/qv4hJtssLpSa4LpqI3S2YCDracNUBnUI/1+YchnVVzqf
	K7ToofHR2vvKG8CaiHzIL3mevBAISmDabqi6taf4LrKDOiPHcHAlQeA0POTNS4YQ4XkiCwxwYID
	df9WbeAgw3rHf62Z8ypUjoSUsAuqRf55XJg2E+x8o7ulGL9E1wv1tJstFVjUYW+uv2obgJ7N656
	bdgtf6mciTFOJs3AObXIfyS1OJPHsfknNxs4gylx0ULcUT01Y8bK39LYBiHrW04wV4BfkJ4E/35
	lIMMXsiQPEMnkr+sFeyX/7Nh+RaVBnEZ7/0oI6NOsCS14W0bxPC3BFH0RVE/8bLK2qyTG7RBuO/
	Ao3HyEmYqsQOr4D0XMZ+uTa90xu2332kaQ9SoycmtXtFNwg6swD6y3CZ6aeDcAkHovj8fwZFpqt
	eMeyM/o2iv+JdMNEJ8JT+V8Vupy3AHhXmAlVQ4EQ2RVtkdnPBpzmc7aWFQZysKaE0BXmTZljisw
	l3dIJt/jvZRY+SSfrgIrRZpUOhIaXyvU//+3xJVvQgjc+y0mgCue4hEZncDDMA25m82cjGuTj4g
	LGW2hf/8DyXrNHd/FLm05GFFDpsnftuavTL2667Mrs4=
X-Received: by 2002:a05:701b:4203:20b0:160:a80f:3ed2 with SMTP id a92af1059eb24-1a6cbf75033mr124085c88.10.1793126461616;
        Tue, 27 Oct 2026 11:41:01 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c9b00sm46942c88.15.2026.10.27.11.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:41:00 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:40:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?utf-8?B?SXbDoW4=?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Input: uinput: return -EINVAL for out-of-range
 UI_ABS_SETUP axis code
Message-ID: <auDwDT29Y0Ru-iEb@google.com>
References: <20260831152156.166514-1-ivanrwcm25@gmail.com>
 <20260831192752.258550-3-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831192752.258550-3-ivanrwcm25@gmail.com>

Hi Iván,

On Mon, Aug 31, 2026 at 04:27:52PM -0300, Iván Ezequiel Rodriguez wrote:
> uinput_abs_setup() rejects an axis code above ABS_MAX with -ERANGE, but
> the UI_ABS_SETUP documentation in include/uapi/linux/uinput.h states the
> ioctl may only fail with -EINVAL, -ENOMEM or -EFAULT. An out-of-range
> code is exactly the "incorrect values" case described there, and every
> other validation failure in this path already returns -EINVAL.
> 
> Return -EINVAL so the code matches its documented uapi contract.

I wonder if it would not be better to update the documentation rather
than change user-visible behavior.

Thanks.

-- 
Dmitry
