Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333597;
	b=NeWfUBl6XTi4e7HhoB739Kl4XmrI6P6KgAEjDNYp+4cDN+uPvgO8VJPt+vK9STeH/FF+
	 I8HsI4w048bvgSwFiGR+okHn3jSrW9FyLA6sUylTCrTBvlnq4hq2T9JjeXP5iRkL3rnob
	 KzOTK/iWuL2Pf+44sf4ASyMmRoKH5CzpKjv/3IKpusDaTfCjRxvxKKjRYETzWNAsiFjEy
	 aqA8q6xAOv6hJ+v+RnfVAy+jEYIvj4VTXFmmZg2DJuLNdQmFGWhJuo1EJg7f3Cec5pcJQ
	 6yLLW/9/kql8dlnlYFYsRVNXkiN6y3t0fsu6U6eSQmmMXtPtvZ3HuH5wqZpUzdW8QIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=vZIj0qtAo3zOj8y7KXbp/VG5XhsaPL++DTW9L+8H6eQ=;
	b=nzBoLmxVf/slW++zFGU1i5GwTf7QPCUH/YAA0MTDd9Zq6YRarwDU7xWjuLEzaHBwJnjG
	 be6+MdIp94/H1coyLn0CsUwFxMWhD29VfE71g8LBNBd0z/ve0lX+h3qE6wNQGofGnClhl
	 sH8Rt9GxM9GVFKZycEz5b0QPFC+o6xcmnj2f3nY+oKdmbfNX9DLc15lXNNQ0vJiPWi1e+
	 /nyVdEJRvKVNFrduA37zV3mWzXsnjGXOnoljsOMUmlxB8xJ8/TllGRY1VebHbJKgZq9xp
	 A4HUQZgboTtFPd+ZYvck5EuxmtUAzu5cNx7wRe3hVIU5tVoA9yhm1IBGHFJ103jhx8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmHh9eFo;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA31606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA31606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmHh9eFo
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso709566eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333596; x=1793938396; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vZIj0qtAo3zOj8y7KXbp/VG5XhsaPL++DTW9L+8H6eQ=;
        b=XmHh9eFoWPFqTU9vbQvOWVzcpX5iba8DyCTBSR91YajmNq0io085Yjff0op3KyMSMI
         MLv8Is/WMWaehxO0rIAXSp1tuBUWB6rfuxiGXqfaDrT7mD8D6jKj292iOe/MYLSzMaWo
         c922BxY6FzLGMX1D91vk68pJzxmsZAPsJw+HTZwha7F2b3vTpqMjjT+Gw8o/oplJLmLG
         1Zeyq4Aso5992NVL2hYM1pp66gd5fancKUq17us2BhiDO4PP78qr+95O5txPzMeqvml+
         hbJYi1PFHhAWztGidgYBFQgyD4X16O0abY3TbIAUWdXOXWxlgoKSthJdTSZhtRgh7bgm
         fmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333596; x=1793938396;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZIj0qtAo3zOj8y7KXbp/VG5XhsaPL++DTW9L+8H6eQ=;
        b=x9V+bYVGiawJrddgiconTZbjjCe8jt5J0uleOYqBl97SZZBCKTnhih//I5H4CKMVPn
         3Soz2UoNOXfkWxB7i0rMDKnofIm3WHnj85seRTFofxDoyJzHnGMFY3iswoucY5UiG6rS
         EI5IEH9SMhCm4FDrg/HU9/CapfvuMFQKyPt7uNQE6sl4DAOc9sOap471Ag/R2z5fZPBz
         0gZPZJpCkb6yTPeRwdzbmvKuuSuWEnoGwRRGNY97ZPxbuwUHHtv/Q96+aTpgjNtUnmDO
         VT9sLq1qN8p6DPScuIzl/I7/JR39AU8ZO2WMXT7I11Aa6aTKfWHrv861RQoopJ3R1aHt
         EACw==
X-Forwarded-Encrypted: i=1; AKwUvBxq4JoJ8AYiMVp4wOs89R/QuPKmswZor0LYYMxL/GTWSiAl/yhZ9B2Fh4KyQ8f4N5/Qyz4bl+FtrEgZMUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXfolAZy85+TlG8H37V43KpnS3Vyam8G3vLJ7JeFAYUwvwcaWx
	oGFOvO2Hoo/bAlkySkLehSkJtx/QSVLE0fVFBg7hLyOYZnHevrebYOji
X-Gm-Gg: AYBFou1GM7UWUhoK01KO6wl352dNAAJ4xO5MeuekdrHxor4BDyWC70dcEUm+HH1Mf6x
	f6ID8B0mXN9u3CQvkMIxLPmRX7mNioSlkX2qWBXLVzNo+hEMvtcqMBfIfN2L3PZXaFElZcIcYp0
	XvN6hUUeZm6wlUyt3trxgC7B7KfW1grU+scibbkz2xCKA5e998diCzNgYcSMmf4A+hvvvMiKTI8
	XRE6M5BeS8+hor5SgVbKOyKdDnEcAMdOOimEzuQMfLZbPVMFv0zVMAHhTvoX8IqdBaZ7lRi+yCr
	/RLWbFtPX8c0kgGhmtmWaEkQh3oNZcPqGB9M+gBvlTYjI3c+WS5ssens5PxV8CsISyGkO9byWg+
	fk2hRKK7IDjp/Jp9+KTyzkGjj4r2F1JTE1R6Ba4RZMclqkOVJvhOBlWry+h5Nbb7pJK23I17AaT
	KbgYVJqRnM/DBQP/IS5y01mWedW2V6Gl6Gplf9xJB/CxBNYGR4nL27sUEEqW6tHw6LLdb8ELhUp
	Pg4lnTdePo0V9b3xJUJswejsG5+anlcUwmftVVfVvJdEyjV85IMeF0d3k+vj+A+Xnmoz8WPd24j
	D9zX1/KRrKLxQXJ/fWKNGV85rmVJGwSjNVvpQGuh+9Hexxx16ESTkw==
X-Received: by 2002:a05:701b:454f:20b0:152:3812:496a with SMTP id a92af1059eb24-1ac5eea0720mr1479963c88.43.1793333596187;
        Thu, 29 Oct 2026 21:13:16 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcf67csm3248156c88.21.2026.10.29.21.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:13:15 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usbip: clear actual_length after a failed receive
Date: Thu, 29 Oct 2026 21:13:06 -0700
Message-ID: <179333358668.2111112.12827497703998022783@gmail.com>
In-Reply-To: <a0772d9b-83e8-4502-9e02-f61345e406bb@linuxfoundation.org>
References: <179328314073.648427.8311262845412746237@gmail.com>
 <179328314074.648427.388274461758949120@gmail.com>
 <a0772d9b-83e8-4502-9e02-f61345e406bb@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Shuah,

Without this change the URB is still completed to usbfs, with status
-EPROTO but with the peer-supplied actual_length intact:

  vhci_recv_ret_submit()
    usbip_pack_pdu() -> usbip_pack_ret_submit():
        urb->actual_length = rpdu->actual_length;   (usbip_common.c:471)
    usbip_recv_xbuff():
        size = urb->actual_length;                  (usbip_common.c:849)
        if (size > urb->transfer_buffer_length)     (usbip_common.c:856)
                goto error;  /* rejects the packet, returns < 0 */
    urb->status = -EPROTO; goto error;
  error:
    usb_hcd_giveback_urb(hcd, urb, urb->status);    (vhci_rx.c:107)
      -> urb->complete(urb)                         (hcd.c:1657)
      -> usbfs async_completed()                    (devio.c:1911)

usbfs copies data on reap whenever actual_length is non-zero, and does
not look at the URB status:

  processcompl():
    if (as->userbuffer && urb->actual_length)       (devio.c:2050)
        copy_urb_data_to_user(as->userbuffer, urb);
  copy_urb_data_to_user():
    len = urb->actual_length;  /* non-isochronous */ (devio.c:563)

That is deliberate: a legitimate HCD can complete with a short read and
a non-zero status, and userspace still gets the partial data.  But here
the length came from the peer and was already rejected as invalid, so it
must not reach usbfs.  -EPROTO alone does not stop the copy; zeroing
actual_length makes the copy condition false and userspace observes a
failed, zero-length transfer.

I'll fold this into the commit message for the next version.

Thanks,
Cheng Yongkang
