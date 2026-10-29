Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793273670;
	b=qhrNOo3/zP9uzdSVeipObqJ8dR5r1mgRUHGOeAgrAPZTMuZauvfeyPFlipHsSNPTzen3
	 V3e4WWSS58oW0XlWDcuxSBwLVPDEelD3IwP0W9ocpd1U3Ebsa2EW8bVBT3WC84sw8HWn9
	 LczU0KxU+f9FmdLxdl0nmBCs1E0MqvMn0yIpNcnWb3+3E3EqCtXnTHYpusH2xMK8xVV1u
	 CLCCPrKUhd8bszIlhtQcQR78GOLKGgSQUZIXJ0Ro3ZaENXCLbAGWZDRmbQ2HTNoctY4oq
	 9yQgIvtBhaNwVn2cr5C63bfH7tz9CsH/LS5q+b40MN8pprwyYJ8eAnov07kDzfHbRyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793273670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Fxs2p2vZjp5Ja+55tP7VAzUi3885HhPUvSbaP3WtHOs=;
	b=WCZqb+ACJ0TNpEwpnF8zb8UXvdCFjlv9bW2+jc9PZvJ4NAPlNtkc2son8+EB0FnM3+RE
	 iOaRqL7fRxWqM18JE13W5m19T6e8TOhMe5PWiJzSHy4qkWrdlcg/PAoGKHLC9xv9o3ZBE
	 tdI3wh0/bmkxohIz5CI+FXjcYCB9zVFV2FqmhWe9RoIHPBxDgnE0yehcREIIK8w5sG9/G
	 EqNNIwZAEcSoe0NkTbq4eqwiEy+RkPClYme2BB6fGi67UFydDrAj84hb3m2oz/chsxBxe
	 +jHUtZ5H/mA853KrvWd5DNFQTHx64zgAvv6lNDRs5G/rnHGcCzcn2Y7igBBz+j6moZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bq1l9Kk2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EF8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0EF8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bq1l9Kk2
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so2559306a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793273668; cv=none;
        d=google.com; s=arc-20260327;
        b=bXxHkI7QRZ1GtivyCOGou3YvInQgJoxX0yXdkPJtG8so1CVU8SGxYatlNt3eq0DbBT
         vFnkHzIHpTF4LszBgiM4WjNHb0XxZdeeqwMqSw+nZFX60AV3WfkAYHHxc2/gjXwlQ03k
         FcIHIvSSmLpS7NXzQW9mx1a8BwcLXiah/djhGfyNJ2s21oNBtyPp7P74JC3D+NRZ6D+o
         XnOt6tDGKu1h1K/10kJ+zuhOSnOaauW9IKAPa7IUFjODZy8acOSEn/PrHoGqqYQe41h3
         472MqwO8SDED/aP1hL+JvKAqNdQpd9+MqEMg1a6bSdpLEGm1Oridm72E0cgEZouBDck8
         AfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Fxs2p2vZjp5Ja+55tP7VAzUi3885HhPUvSbaP3WtHOs=;
        fh=7aWva6OBneFAY9aIO2vQqJMixUjGUfacBG5nv0D9s44=;
        b=rubJYW/IxTwagdSYWKqMBg/SA4+rWOHiJGeeB4s5J+z5UgdrNH1KUxgfJLC7FMutsb
         n5Jvn3rFmBWDhhdkA3ZH0Q3Fe4qjNNLlTbD5wMq8wYTjK+m6VC+F/g8FEs64hB2rPVMo
         F3lh7QOswIWyjDS/bGnxCLdR45+MeNqijIg9HAg7pSOughUnT6O7H+hde7QkjTIzAUyp
         FJYcNks0PwHhZd4S7+As/KzSvGf2ksjChpwW4M1u21CWAq2N8FMQ4ffv7bjRAF4uUfj/
         aRtnzQ7Sj6vDLtWoTSao3dhhHZl/Db2mn5er92GDMbZzR+Ini7rHkeUDtg7AHFIQQ8KT
         j77w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793273668; x=1793878468; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fxs2p2vZjp5Ja+55tP7VAzUi3885HhPUvSbaP3WtHOs=;
        b=Bq1l9Kk2klWw/DsfkHAK7wvtuf8i5DHvjE2Tdz0Pe7ATvS1JG/hCA8ilHYdAPSfWAr
         5yLtVeUXNgGFhjweQA5S8tZ5/vpSFmb+fdjcp077kbitGh/5lcgE3mvyu5QWpl4eP9Qg
         xfwA5fJeDwpLzXcY3qdyiYb/sRdPeUWiTkw0O1g9QZRU8hxSU/nS9Z+vzGY4eP7lf+GW
         CGOBBDbvFHoRrZ1orA3A74hz604qMy+6PhVlML99l9fiOIXfmf2euwDE39OUHMAAu/gk
         vuq+tUuT53zWBzmHhvuljEiPJRHQ0oUM93ciamz5y0+jOSEqVU4EB3s2RH1ZxdFDEgfv
         BOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793273668; x=1793878468;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fxs2p2vZjp5Ja+55tP7VAzUi3885HhPUvSbaP3WtHOs=;
        b=do/IlWU5rxPxlriLojnHvOjyIdGO8mBDgc550ygN6WJEEDzblMhyX6GRTUNj+sH1FM
         OPGgxxwNuKYDZOJtDNIJS/AdHSE+yLvfYQIQ+CKUb/ppBR5GxWrel6qXPWS1M4Dq1igL
         pyMKceLj3+1/wei0oIss/a2mAyOzsnGzHHWRU9rZWH3+MJbms6wMl/TqQV7ShbIhRHKv
         8cTzvE5ULz0zV1wRh7qtlIS3cQ0/t5Tp2XSsj+su0jFTe+sTHJME0qgEh7JxK8VKlpFH
         j7JsQU8IiMlAFvpHGAIn7SkaXb7aqOFLXjstRXg/0zcItHg0S/t4GeP6kznQb1SS4iY2
         pF5A==
X-Forwarded-Encrypted: i=1; AKwUvBzITYaLGcK3FJDxGMJ8mSQ79u4hN+tfU71FGZ+ynvPngrOmXAyZA0dd0FKrQuNZrdloQ3lYqs/Q+ElXBjk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwVsbiE9WXqq4JWsl2alX1BOTaazUIYvVn516/Zln88C9kuxUb
	oMZBUMlswZsVY5iHFUTFMk76DjV5k4HWGBGfJWmRfy2j+tQ5HtVehBDs2tMZPUiP6ZrvF+Go+cZ
	v2laZNXvbCr5KB41r7blrJ+f2o3lHMA==
X-Gm-Gg: AYBFou3g4Ho8BIrRz4a4X+1xXsZ4khe96k9ukQcPCPqoGMyyyA8gl33AKHGz6tdt+zt
	W/ZPz50ydUZQhktQvNhpkbV/f0hR7av2rXeOMltC3WkvBlvFEpW+cp2FB2ZnlEHGuP4JKTRy0TZ
	UJDeDhUe/6o5Ck470guwxrBmErEATWSlu1VFj8UjAb/TeHqUgH1/ZzDArwtu0bWeLDdFrtjLgwt
	IItJDztPjIX9hqYJG9pBKbKzAz6NhhDOav9Gg8mK5vdioxVZoeQvqUa0DbsaoX0weYkDpAFTpZW
	HJwRvsrKdL0R2F7xBGmEcxpjPucVZaNR8DQAW84LrVPEGI/o/wJOW3uJlqa9hvMOoW/X10iB5Ux
	mG6QEnTXeVwVRnl4scJOtaUh+UWDCGG1YDOvBbiARtNs9XMNiSayZQr2yUTq6Hjbj5J63KOn6WI
	eEc10+NaTgz0es7oS++SVFFrLg5cczr/JxIPchLvSV+sDm
X-Received: by 2002:aa7:d386:0:b0:6b1:bcb9:15a with SMTP id
 4fb4d7f45d1cf-6b49cbe4f13mr2485749a12.20.1793273668033; Thu, 29 Oct 2026
 04:34:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028181412.1919506-1-kbader@redhat.com>
In-Reply-To: <20261028181412.1919506-1-kbader@redhat.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Thu, 29 Oct 2026 17:03:48 +0530
X-Gm-Features: AclHuK80QgKYucRyIWXZZ12A-Bk4L1d3Sa54QPpy49ElFlJWi5EmglCzjpxKLqk
Message-ID: <CACzX3At39QvtmM=sGh13+uCaU9RWhKW8e8r1hPLMJ3LdFAsetg@mail.gmail.com>
Subject: Re: [PATCH] block: only fail dma-buf bios that need block layer PI
To: Kyle Bader <kbader@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, Kyle Bader <kbader@ibm.com>, 
	Anuj Gupta <anuj20.g@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, 
	Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Tushar Gohad <tushar.gohad@intel.com>, 
	linux-block@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Looks ok to me
Reviewed-by: Anuj Gupta <anuj20.g@samsung.com>
