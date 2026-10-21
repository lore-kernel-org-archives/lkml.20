Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792567466;
	b=ZMFX+YQhxUpHCsiVjLZRZjptzFSqJIX9gQHtXtJTic3jL2mvpUfD2Dlx8UnrmFf5hj0M
	 EXTYoFYh+LKPTwJLGpyrpGq13bRqeKMLZlRjqWq50chY+DfIf2quPG9/WcW8YiO5TVHV/
	 6uSGTZ5SgEqTc4vg2v4Xmuf5tq4GGnUY+Svbll033tKMfWYRJGZoJruXO92l1OS1a47bx
	 ltyijZVqRKyH0C6q54NTpLiYPmkTCLklGGUnHpGzy1NoWmM+yzJXBgqJnpKSW/zD1EHyd
	 zJ2bxOb6Zd8Dw5C8nWSODTh6rWiP3kPPxp5vyFGwEAn4R8FEZ+spbvQu81ChaDeUd8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DfpMKp5SVl95BmunPA3+9Zd5WUKrXPlkJ5zT+lTuasw=;
	b=oArviHogVo0QMU6CTTqRmFyKpJwbFKLEcFoQET05DUvgt2If5DfYN9H6OlQjBl/v/yFR
	 dqzWVIM0P7GH+BCEVGyh5jpRVM6jeSx06DLi7NUJSVpsjiiF4Oed8Ik7EHcXrW+dnhgab
	 3/v9pkXjr01K8Z49DyvY7mk1pqA85v1hv1QegcxtjwlV2uC3JXQvyxP/y8GTw2JFID25r
	 tPyfp0P7JIkjY5GhqTvPN2DJrOY894xqRCYyd/KrrH0r8Ebu/wyX85cytcYDonB7UXvzK
	 JJUmK+9DkebFaSZCU7msMJO11xz4lk2X4F0XFzgNNLzOTwRrCQDHJd3//aXl/OlBQJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N0EN+m+U;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED29606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED29606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N0EN+m+U
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df54150dfso212716f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792567464; x=1793172264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfpMKp5SVl95BmunPA3+9Zd5WUKrXPlkJ5zT+lTuasw=;
        b=N0EN+m+Ug4+56UzGDul5oSi9w3tJ3rrroIcexOwfn4C4foBx7DZkOLmXYt8zL48D40
         FERKbM4L8aY4l2IrIRpfhoUUdsLtYMVJo7b0XssQykAEIXjQoYPzPvVTFJ4lIc9N3x2m
         JY2tCRtXPXfgq5qRr/w7M/VqsLKrWoi7let/egIeed7wVWJgWdGVsGV3F/GWzScwSQzx
         31PN9RxZS8XW68zslWFbSRV1PpJ8nC/Osl9I7Kl05SROynybG47tYYw0/OYMuGr3OYFA
         tocXwMER93nadiUfbUjOvUol1rNpvJ53DcCN6wQKBtj8tfD3S6cCFgw2cx/pRDTZ0PkX
         4Trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792567464; x=1793172264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfpMKp5SVl95BmunPA3+9Zd5WUKrXPlkJ5zT+lTuasw=;
        b=IARXDTft9g9816UviFBakMzQjrBCqmmYe9zPqEfLNmWybJk4wWeH4qbU0x5DAIyj6N
         9toUCT//jErGeQ9LZkv/NIkBZ0lHFKiQIpmLTxWaKoab3PnxN33cf3d3Dy0tPeWTXiZ6
         dQRQX/PScHx+fQaBhFc4K1KE/dlgdVJd5XnV+VlSpfUScMI6Rrs8i313it5zZMAyUTvr
         hSKIhdxNCb9f5Fn48GgC4K9+kM66guNsqq1cBS4xRs1WznFaU17hRH3lVvWGgkzrwk6g
         YlWoqE6ilC6FjcYQeV8pA8htY7O1R2PDR9cYgh0HNpXQgakU3IJCI0uanWG40xAJXYQz
         1p/g==
X-Forwarded-Encrypted: i=1; AKwUvByj/S/arBae9KGKqQcMVNC1guo/1ygoK8v6D5ACfMGD/Prj2MI+sI3DD4wAEEVeoAMdlgDs4OUVzrLDQHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFzgO9ImxciINGxHmwy5ue9xyWjS6fKiFVBcfPahe9Y9Qj3Nm2
	ag6dAvZ6welGRRLJgW4tFuV7S77x5/5hclo8dq5S26hGrvZo8IXopT/w
X-Gm-Gg: AYBFou0KUJ9+ajc6jbYhUIER+d+fk3cf1aeQaKqc+cE0UndwyxQUN2HGtjMwunnFo2I
	tlkLdOf8kpO8MS9re2EsDYXR5xzE8klYNQJo1uT3KRCYmcwxIxKwrzjAlcbCp+i+SbC7U8if83b
	DEEemoFRNB7UYTnYh3YtFbRiHXYSiRoHi91dyCqmMtW/wDiShjgQQReiHfT2iOYsTsMXke8bGmZ
	RFzu3ugyZ0q8KT590ptXI9gnC2RAfAT935oWHtZUgQQa9o+QPGS/N9g318REqL8JbN4umWQFyHK
	THjx4z9aNMWVTclxzK8EQnXhDVEt5nKetMoSrvATRqeR0q13MBRSH2FAEPStYox2eEdkDooafZ5
	VQeIbqsbtNtT8pUOjw6c31VFmlxI4zza9z++QL18SUlfMv7mfllJHhlEOW1Qu0FFo1VnZlIVO8e
	o7m/FwVlKxgYCJWZj9DsAOTG2wo7+JwwRqfHB3tIuDdpgzDfKLxzHkNBghvHlFgNm9OuTGo7dpt
	3scrIJgdlsPmET7WMrAm5BcaWZrQsfii9vp4PUiJR+5HjN8bS/HCEDYQWRWfkM=
X-Received: by 2002:a5d:584e:0:b0:48e:f07:160e with SMTP id ffacd0b85a97d-48e264f32edmr1993337f8f.38.1792567464375;
        Wed, 21 Oct 2026 00:24:24 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25827087sm3687052f8f.21.2026.10.21.00.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:24:23 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v7 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Wed, 21 Oct 2026 09:24:23 +0200
Message-ID: <20261021072423.4006833-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f61cfbcd59cd441da59a16db52512897@realtek.com>
References: 
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

Hi Ping-Ke,

On 2026-10-21, Ping-Ke Shih wrote:
> +/* the beaconing interface is always on port 0 */
>
> Move into function? Or just mention this in commit message.

The commit message says it already, so v8 drops the comment.

> How about setting a retry limit? Consider if hardware goes wrong
> suddenly returning random number, I'm afraid it becomes infinite
> loop. As my thought, at most it needs one time retry.

Agreed. v8 reads the high word once more and, if it changed, the low
word again; no loop.

> an empty line

Will do, all three.

> The csa_tbtt is just read from register and adjusted to what you want,
> but in rtw_fw_csa_queue() it reads again and adjust. Can you reduce it?
> How about adding an argument to tell rtw_fw_csa_queue() that this is first
> time to initialize csa_tbtt (like the restart case)?

Yes. In v8 rtw_fw_csa_queue() takes a start argument and reads the TSF
once: on start it takes the next TBTT, or the one just passed within
the margin, and the countdown work adds an interval as before.

Regards,
Mehmet
