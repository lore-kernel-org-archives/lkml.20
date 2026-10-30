Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341860;
	b=qDJCeJ73v4ftS3SPamYMdFP0rdAOVkitHE8tEew8x5JlmtgQdZycHGRbIa5xy38qbXeU
	 7Fw6DZ3ELYrkz/0POGRFgKC66uJKu+oqBUwrhNsitqbo8SmX8M7jMDGIyuVlCAUNxescH
	 r7Lf7dJxz5p+UQwsifu+VdtWXKQo0nEC0TXE2Jn/63pjAXrPtYTfKiUXLogC3GiZGVuKC
	 WBl1tvPERAbtfDBtGRen4UgG3Y61H5KIBkVN97e9pWgbq8RtYvq08Ts5A29duWdxixGg+
	 Kvnaq1BG723gzpbP1uT22axXBbOuPCIUMAF/hciVG9rCtmaTtwCT180WAPontscwRKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UppOoST0Trl7TROBBYtHebLU93t2eXyMY6EcGmmSljU=;
	b=pubjymtcu7MNWo1ep2lpvKWldqaqTQYY6NaSHd0E0HWegO0LqxRW4Jwd+ODxZKC6+zm9
	 QvcwYD986tOf4ggdOLtBHgVZRmE6E0aDZRCI1UIALatCOjaQ9GnzyonbiU1RCp5wiqUXx
	 8kp7b6sNu3dLxiiD7mgvxG8ncbtd+i8EZkZwTQEqufOR0/hgzIvFlWCP7RhXlBbSg6zK8
	 d9IKtFojVeM84nxSTbBx9QxxDUdGIaIhGLHKe8QpT+Fza0A9EitkZ+U7sohWczPCvd0/w
	 6xEIP8GhTNsr4EpB7wf599uVeoIAa3zu4Gsd1MWqlnDk65AvSSNL+OIrDWo8Z3D6OEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HmhjGgHz;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20B6606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C20B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HmhjGgHz
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so978180eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793341859; x=1793946659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UppOoST0Trl7TROBBYtHebLU93t2eXyMY6EcGmmSljU=;
        b=HmhjGgHzKfVwRzuxoZn9FAH+hl9oEvGgNolCPK3hxscZsQxL9/qZaEgAYM63Mj08eZ
         3BkNCkGGqBT01aGnBhd1z05UHeOVYZ0PXB4Ve0u9oke8Y0kdiFOdiUB24aUgmGcE35YN
         x0v2ySqq5BYQa+n/YnWDJ8xwO4SeLmEowhO082yfGHONJVlJhdqc0WCclA//NQFwbGzV
         wQT9tTkTF91BmYJazkzHCQse8bQTQI563EugFUKluhZgZhbI+tSHvbQZTLO5a4yOgEEF
         rCAv982dGFLUqvoFRmmKJVeYUnbOamtcFiJfW1IOFmF5EqYgKJxGvaUpUGGxtafEyt1s
         QyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341859; x=1793946659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UppOoST0Trl7TROBBYtHebLU93t2eXyMY6EcGmmSljU=;
        b=WwGOTQ8F9fLBEOzUCNssEvf6ep5rJh63hWevtG/FwDHmeB0/Oa7X14IwnpnmiYOVLo
         YD22O9o/fRZUuhQk4TWnO+zmE8Sgv529boF+J8DxeGWnRGRMrRz4C68QD9EATCrd6j5b
         PuFC1sYbKTSKAqgebhllfu0D3ahYtFABk3yVMIHzQsbhsE5dX9GsGI2BHFdHoeunD6kk
         vdtIv8Z6Q3mpSaQirRQbbkIgms2fdwJt7DcHXbUo+6fdv7sYGAlb9graMGchJS35+REf
         XScLd9SQ6iG1F4hDvPkhGS1LowRSx6gJRq5b03gDjMZTMfrLpoavZpOtUQOQFo7kk7iz
         osxw==
X-Forwarded-Encrypted: i=1; AKwUvBxZuY6U7gkqFH73qrelnE+MrVs9gh5h/dUXaQ/XGRnytmUPA1hF2s9cVKNnBYVNTmsmn6zGTbKm2ErGc/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMH5edy6AMWicabtJisURAsU1/XvGB/qwaaMEu1/nYi75LPuXT
	LYmk+t/B9h8FfUFm4KSbBEf5Qykp2JrKYGkBfvPikSgYRWisZ6ez5ML2
X-Gm-Gg: AYBFou3PKqep+QH4rS7mO2RKK6rIfiHWbUxea/IOEFY+6CApBMb5l+tjNGJURnmqDUp
	Ipi183a2y/beU4MFlRyyzqR1ug36jXWYhma7grh9k3GUcaGtnfyIcuF6gRzsB2oIaBOh8ED+qPe
	YM1yzkOsUjm8hb825W4TTcty/myT+L7buYNEoHYTgPfg/9+qv3yaN3hHk/3Tp1eTq22TBINkHRv
	nCvFObVOdfwx+GSu3tI1arujnRNy/hSVRy5785QRdW1g7N+8RJg2wV0LXw96Aifm9PUmx2LSziN
	2Wkz5mZWvOQQT5k9r54XRKz/YKnGCSFUt4rX/cCz6R9OUp6W0GVihjXqEIyAId0//DCGbgKjhfG
	df1/vH4vAm4zog8b5JWSQKER7BOwIEA93RGuBquZRclIGd2SvA4unuBfXngUigYmXPCLOFcZ+dm
	6EgIp0ZJhOKGrgJEDFCyzkijoATGv0hauJQREnJXWpBQX5z/5XXPjMI7nY1KUEMLR+yfENR2QE7
	ypyTbfb6NHDj1Z59YnSwA9DexbTsxL93C5lYfWPTcpLLnH4uvEnneIULnX6gFaKVAt1wtTwyecH
	YupZ5a3j1EF0rQnRQ65LJCMvRctRFyIjG8oc/kAisO1B2A==
X-Received: by 2002:a05:693c:88cd:10b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-36a4238940fmr2362399eec.14.1793341858562;
        Thu, 29 Oct 2026 23:30:58 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1easm3914964eec.5.2026.10.29.23.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:30:58 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org,
	dmitry.torokhov@gmail.com,
	mathieu.poirier@linaro.org,
	linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH v4 1/2] tty: sysrq: don't expose a partially written reset_seq
Date: Fri, 30 Oct 2026 14:30:53 +0800
Message-ID: <20261030063053.170432-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026103031-hungrily-compile-49c8@gregkh>
References: <2026103031-hungrily-compile-49c8@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

On Fri, Oct 30, 2026 at 07:05:10AM +0100, Greg KH wrote:
> I'm sorry, but I can't really parse this llm-generated text.  What is
> the bug here.  What is being fixed?  And what is changing?

Sorry, that was unreadable.

reset_seq can be changed at runtime, but the new value doesn't work:
each keyboard keeps counting the old keys too, so pressing the new
sequence does nothing.  2/2 fixes that.

1/2 is for a race that 2/2 makes easier to hit.  The new list is filled
in one key at a time and the keyboards pick up each partial list, so
pressing the first new key during the write can reboot the machine.

> And how has no one ever hit this issue in the decades that it has been
> present?  Is this really something that needs to be fixed?  If so, why?

The sequence is usually set on the command line or in DT, and that
works.  Both bugs need a runtime change, and the race also needs a key
press during the write, which takes microseconds.  I only hit it with
an added delay.

1/2 is far too big for that.  Telling the keyboards about the new value
only once the whole list is written avoids the race with a small patch,
and doesn't change what the parameter accepts.  I can send that with
2/2 as v5, or drop the series if runtime changes aren't worth fixing.

Thanks,
Zhan Xusheng
