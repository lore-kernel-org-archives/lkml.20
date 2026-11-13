Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530315;
	b=DsAbmemKelIQNEhqU4yuVe4aWY2t7++fEX0uKvlpvioTwKPRUd9N/pIvD/6awQFRCDw9
	 j84Kl8O3F/af8aDTLw3NbfwCEFflhtDKdPzbm8P5Ng+U5F65Hwi+CL43fyVJsJMg43S37
	 0csAgF6CiyvYQHvpbBqdxoMzSRWog28JhqVlLdJNqBoaCgPVkZKD+60K8qRmNn2zWyjkY
	 I4tpD6zjteyw7WLVMsFnKACL6ZRoIeg241QjKaIU2JWvUFnhIcA5P9yDZf62yf7g6RAes
	 Mk+PQsXGxwhJ/hq4g+/06eeskMWtn7QsWOIPV4EOo4qzIUppt2qCPhd+AAheCuwXDlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0LgSlrMVwLd8foBqyEbXINOm3lQXBanGSAr9ob4I3Tg=;
	b=GYt8188I/7rFoEkt9v5CqwlEdjI6geMOmPoemDuSW/A/2E/sDfMxEyv1G0+FGrmp+s2W
	 3x0nZAjR2YNIVTTdshuRyZPpotZc1c8Y884RFRbYsAhuVYiRhJHzbebMIGA8BajgY7b7k
	 tZgFNUVup9ReGK/xrJq6RenUkYZr0dzD/SA4s9iPi26ssYZn0saFt1gWCznLGnfUyePYH
	 qC2JWgwurSPZr9jEbbnZF/tp4elTR1jWmBxxJdKQ4SROfmfbu2IIWkkxFXO9sf0cAq4nb
	 fb+qkZureAZdeStciM9i4CoYIBtt2R7T1tG9B1wyG+V5gScaFjpmKu9g4JNdM1PJU2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgWOPRXR;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA657606B7E2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA657606B7E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgWOPRXR
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so5572865e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530313; x=1795135113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LgSlrMVwLd8foBqyEbXINOm3lQXBanGSAr9ob4I3Tg=;
        b=wgWOPRXRMyrmHVF687KRGRjwDUGJboXACnWYKQha5FGu5ECX1vwJ4f0QpZbzBmlXHm
         d1vEBBnpBM3cVNmZVlb+lW87A1Cp2mT88WZGMXG+8dQaSLEoyoffbA8jvrk8aCw1eyvh
         CC6aHXXRH7nJbrWZRgLarBTChUXy5lEpZsJ9ELLzgZ/R7LLydbOlSkFdGpjOUIg+v2pW
         KGtOQWYDDwxZFzRB+cdXmKAyJH/g4VRYH5dtny5PIUOa/ZYBp+bCHKsVh30qrhyYCNya
         eA/HltK9Rfm/5/iG7Kw1Q4tOSniy+j3GZp91ZoECpVhLgrdjQxgptGzD5gzLLdlEzRle
         wArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530313; x=1795135113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LgSlrMVwLd8foBqyEbXINOm3lQXBanGSAr9ob4I3Tg=;
        b=u/p3rAEb6dVuBj6hgcy+sDTg5uvwqpjDAdZNLgvfsRga9rlx3yljKwSjMg1zl9RRSY
         AMcrtGwUVLlI2N3j8W211len5FIHOk369QgLqUpYzTXJBNOByWJaEB+mzd9LU3CKGn69
         FREDiaT6v0sF8CzmoIA2KbjLF5WYtb//2cBK2v5KvrNN4UAutQztMNUXZFY2//GopuuO
         ZvVmQXXuVzyw3/bRLi0rIeKk1GPAxaxhC/LwouMGBU21Kl+cNbdzUTuna/PjngXmitxy
         tI27GXF3IHr4fBZ9/sIfZk+2PcNv5dTxL4hWaU+8HTwocsXZuKXCIrPyxx+FlghGupAk
         QSqg==
X-Forwarded-Encrypted: i=1; AL+hErHVFXVqUQTT5rTEupoW7+F5UX/Wa6s+/YIFfVDtIjyuyX4yXgP9calS9Sy5EtMFd2TQfE4XqdGDTDlX2PE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AadyxS2NW8KX8NVuOHuGgRYLmAouAjjW0hp4ZStskM4/N2CQM
	nHf67ehf69vcWw0KeZmvs0TpT42yWWtS9v4E2Iamo66kmZwhrhOQV9f8
X-Gm-Gg: AYBFou0KAyYf7ygCgjWf96GyuHmFjz5lajQO3JT+SYdDOnzyAYXQM1HA5rPR3CyHdjK
	aeyQuKmi51HZOqfGwaN9IeorpRqUHQ3dCJHHqYcZuB+hni6wM0jK0EvXmjRd4CauIy8DCGpgQIW
	FeHx6mBvM3CW0J6gCWEoeAIDeVWAJV1499ASU9FBElistW9G9x74syY54vehcqn+IkW8jNnFSgt
	728srHAXhKDbRzfEbfnFHGh6td1pEwOi2Nw0QYeQs4o+l41kgaLdthgRoYWyKKEntov11qMHFVK
	XiN+mVyJ+ieg2gTnZLIbUmk9e2XFykbi73fLks+bvB6y+nHt0O6KmFxN5RmvqOiaxrovQ+uaE6B
	SztSI3E+qPJbSuMGsFd742971T0lEAZSqMJK+Uza/aOE8WRAt0oV0pBqocbvgyM3u2gChHyZQHU
	WvaxEdW6rmJ0t4ARM5V6NF+DAQqR5/i9BSGKOHgHrl5EiFyYVxscHUJJxIropWABfKGyRcAuCN8
	u2M+NJf0izIOhD5yhECQii4fGtpIGAoy6a9Z99i3oM4B41uzSkTbIbXshIXiQ/OYFX09133UI9n
	J9W1ARodvwmxY2Zz9eTaum2GLfYou8EKqs2yGpiac6V9ph30PrFtfWmT11HYFdmPZ5Wi7vg9gnM
	vnb8coz+Rtq3HhaCMbw+CeL5lQH2whDwPnjJoxdL0q0LMgyLD2WrhWoFJBTYjh1XWi85yEofcnF
	fzrq+YvR6/URX6ulK8
X-Received: by 2002:a05:600d:82e8:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4bb55a4496fmr16979925e9.9.1794530313034;
        Thu, 12 Nov 2026 16:38:33 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55afb6absm20185505e9.15.2026.11.12.16.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:32 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 22/24] usb: dwc3: generic-plat: Add ZTE ZX279128S
Date: Fri, 13 Nov 2026 00:38:31 +0000
Message-ID: <20261113003831.3671192-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <aup_2nJhE243HVAN@vbox>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-23-ghahramani.navid@gmail.com> <aup_2nJhE243HVAN@vbox>
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

Hi Thinh,

Thinh Nguyen wrote:
> This driver now supports many different platforms, not just SpacemiT and
> ZTE. If you change the description here, please keep it generic.
> Otherwise, drop this.

Thanks, I will drop the Kconfig change. The USB patches will come later
as their own series, after the base support for this SoC is merged.

Best regards,
Navid
