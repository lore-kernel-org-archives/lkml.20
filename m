Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448606;
	b=zEN2wTPlnQ/ZkKkP4OPTeZsaYImEYGZu3X4hBlX8qvLWFrZKYOKJOu5FkeRVDeg0FwxD
	 fUYt8PP9y42GCAdBXRcVBIPzhfig1RFU3pBvupO36/lHBUrllGq6FEH+E+XYv68FSxZ5+
	 3T0QURamOfz4amrqVzmsZ0R/eqnLofDONay6wig7eXzjVVqZhN7xqYCto6SaS9S0MXVNU
	 FDXpcP7dOSiu+wPJGd/i0WvOMvrD/6ESVHIdDb3W4I59mGE3StBu7J2xf6PWFtK9c0Ywe
	 ZUcdjiORGkKHPS64IIs8fW34+y4mXfj9yKjrqjXARCQmutZ2WUMY2VpfdZkyJ0+jlgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=6oWK0y1tjnQoCAjbYtBhPA366Lo1NXdpT+rZkHBkVw4=;
	b=aWWHND5hBjToxJFcicBfn4/sRji/PM18PkVjDugFPzEmSkteMmhIyoCTxWHBwkUGoArI
	 4oJNSIfZWOxkmv+Gjac0raS+d6RHfUZq78L9jzoL7ipSuPh967txmLIhDgo1OmoFrmIV1
	 6p27C4FGUQA+LrhVydSOzZHnF9J1ZrJt1I9LybF0+nEyJtCrRRt46nJi5Yy1kr2LS/TUQ
	 l0MXEn41pbLdI0bGZrG4hzJP31D1n5J31LriLfq3JCrlv/8iIbnxQVAda9M5tOEcNayeA
	 yO5FPyHobhUmpMOxhVVwc8bk00jc/1I3xTnkRm6/u32HVWchKoIx+U5OcWTNlyAWpsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ythwGUP2;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3358A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3358A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ythwGUP2
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2754513eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794448605; x=1795053405; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6oWK0y1tjnQoCAjbYtBhPA366Lo1NXdpT+rZkHBkVw4=;
        b=ythwGUP2tHC4I3Bh81T+Uay+Mb2Vz4InI8ORw3NkFem4O7+BbPrCRN/sG/oqNhdXpn
         aIJbJ40t+8DUO4GE2CoCuOIId1nma9qmodDjDC6HEfp/nEDLftXm4IHhgqqjlV0nhSE0
         QVH7oD9S7zFY4E91haRClRrrOM1xWueTKXjFtha4hwpBS0PzW71xaLugp/wkHNjhX5Zi
         9s+gwvhgZmhIbLPjNKFS12ULSbIW6UawtY5YGCK9NqHuOZ3qaDviVIZmJS9aR4BpPzhe
         QwnGO5qvc9gtdm1aqAuiF+mdElpn0HKM6tGu4SmYF7C1ZGuU7KIxBdZ8PfbV4eH5TNxj
         h0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448605; x=1795053405;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6oWK0y1tjnQoCAjbYtBhPA366Lo1NXdpT+rZkHBkVw4=;
        b=Jyi8t46xttrFiXVSiAxmfp8WVcs7ON7DWUKgjKwhQmvjlsU46v36bGIo8uEyjuV+Jg
         pUx5MlLroGYhnodSeAL/w7enZH/D7wGwHi1iPgg6xaBfynaFc1Ths+I9BeGoUE4Ah0GP
         /2n0QMI1Sc10g3jcrg+ID5Bx5sKtfI7xERUqttDfuqGcrj0e3EC8yj0iRiWATtPQPc7+
         Z0sR5h0ZLXZfuCFkz1XJepL5fWf29rXR5Ps6Nm6XT2zdocZR7tmB5zAPBmLQwaIcNmFc
         0SE7oMo2Ek1LXjWRQPvvOcE3AJ135u3JtChDdYvfDB+wMHlr34WkHaPd8VXi/IFw+Gfe
         fMCw==
X-Forwarded-Encrypted: i=1; AL+hErGlB2wA6EoVpaDjtgTw7mB6icWfGGqDvLbi3MUjvcqcXM/eSquAd6ZIOTNRF9XnO77z63ka7Rdb0UvwaKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z83mvWMaXuM5Ox/LGNsCT9TClxF7ee8Sc2h8WCvMs/IC5kXyIT6
	T0X3SFP57rAcwJA+4fdpiu+8c/dBhuhBHF04XzzrRP+UjVPC4GJXTBwE
X-Gm-Gg: AYBFou26G5MPGqvCkPsDjFJHeME0WDd8onwrUaeX4h3PNn6wPn/pIvGUHdN0hgetBqA
	ZU6f4cZfN6Qq1yepHfGQjovaFHdAeQ76l7EFlvMifzOikclGZINlKCV+3v9QgvJvXt5OAu85oLH
	bFLiL0EVv39usgRlIlkIsxKK4OKj2QqERoUmOGnmcK3ywut+4R37HLeX8j3m2p7XkokUkxpkSAQ
	PjlvkgPSEn7V+xaeWUe9kQolhVTpZwJooAI476aNG3REgGVg7R3LQwCcGD1LCh0+zxrWYmwWUhA
	0lSheFVbyJIiyv5fQeFR1zISuSLJ7EoucKNMCQARyNqxVB3uajfp4cm2/WC0ilerc4lDgs+b+g8
	rSOXGm28levDBVxsNzXwGchCZCWfD9QDLvANjZjUFbQZI3CX7LgCoME7nGpfF3F56KYu+KUT4BI
	qpC1lOtXnPV0EFVyw+iKFbN1BIP4fPWRee+cxOzvofq+PDOpNzzdj4vwzUiMtf+yPumSe9kWwY/
	A9LMpZuKWmL7PphZxIqsD7uJYabmQMsdr+eghTR2Ng542AGJH9kMSkNzUIzKLX76GgQUNWNmYJA
	3TKHU8Wv6zzTra8nh9sazSO6ObNxGuMSPZN+pVKQ606sqVkAkIAvG41HKYOns2KI+NgCEz9iuAm
	ctafCPLcDFDPJj9PxX4KkYqvg
X-Received: by 2002:a05:701b:465f:20b0:152:3812:496a with SMTP id a92af1059eb24-1b3c0875263mr3989905c88.43.1794448604886;
        Wed, 11 Nov 2026 17:56:44 -0800 (PST)
Received: from [127.0.1.1] ([2602:feda:30:cafe:ec49:29ac:0:1866])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm21032435c88.9.2026.11.11.17.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:56:44 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: xu.yang_2@oss.nxp.com
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpci: quiesce the IRQ before
 unregistering the TCPM port
Date: Thu, 12 Nov 2026 09:56:38 +0800
Message-ID: <20261112020000.1001.yaohan@gmail.com>
In-Reply-To: <tiszwydkunhgdxmu2lucgxntzbcosncxxzrzgggudhtnvubkcs@lcllktxpuwrc>
References: <tiszwydkunhgdxmu2lucgxntzbcosncxxzrzgggudhtnvubkcs@lcllktxpuwrc>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Xu,

Thanks for taking another look. I'll shorten the commit message.

I checked the IRQ path again. tcpci_irq() reads TCPC_ALERT and handles the st=
atus bits directly. The alert_mask field is used for the IRQ return value and=
 the loop condition, but it doesn't filter those initial TCPM callbacks.

My concern is the case where an alert is still latched, or the mask write fai=
ls during removal. Since the IRQ is shared, another device could cause _tcpci=
_irq() to run after synchronize_irq() has returned. Without the stopping chec=
k, that handler could still reach TCPM after the port has been unregistered.

Does the TCPCI specification guarantee that TCPC_ALERT reads as zero once its=
 mask is cleared, including for previously latched alerts? If so, I've missed=
 that guarantee and can simplify the patch. Otherwise, I think the stopping c=
heck is still needed for that last window.

Thanks,
Yaohan
