Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946078;
	b=w9cMcXIk5aE7xJzATaNxWdVPGpVbM7V/a5v80yr7Y4BOnLQYjOROAOVTvXvb16ULeE69
	 hVy+/95NlKZIO9GbU9SXa4Ul3FwJsjReb9ZFED9+127ZzCFO9I2aGnFg1tJg8lM7gcD9A
	 WSNicCZIhSxEf35Bjo5Z7Zgbc72Bf6tKe61d06fxsm9+mQEgqaVUJNxAuec5V+e95hwmD
	 b7vYJ1bw2IVr2jS39n1rKEIm1CEl0E9JmbQJP/Z+yHGMWHI2J7DOLfF8kzH0/7XZECqRY
	 Xv1KQruguvMsrXribM36u02sIeBzg/jRmqskFCdblTR04pS9YBALEq6b+5hL+F9E8BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YvrHetLWEaprA/YnNV90q7vlMXrIcclPCKoaaWze1Ho=;
	b=Ka9+nkmYTP6/kmbHxZbcU1UJbG+e+alIVqJdEr5WEYX30wKQdVKWOsHsxzo5EGAECDSk
	 2OdOQkHAlgZFOZOGaNTFOO1+N1YXcNECcXrILBAy1gaX/C/Lgn4zzASTWk7gezMsBiU2s
	 tsnJedpdRJKQGdWdDejj6ntOHbdsb/w/par1O3SLEdof/T0eS8UwpMP+U8ftIaHcf0fa8
	 i1jN7+mSeee+54mf3/nK5hP3Ws2t0zvPjNBNEu92unbTgMohd+hL9iazFNbq8Z7gQOr2/
	 ZBTnQmK39vZWQyX4mc0Ro+ayikznawjT+FFZ46n8UNc62ZqP4jYJIYlHqkazvvzRMtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ztXfG5sF;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D86606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D86606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ztXfG5sF
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso822076c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946077; x=1794550877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YvrHetLWEaprA/YnNV90q7vlMXrIcclPCKoaaWze1Ho=;
        b=ztXfG5sFYa1gDCb5MK7O5ODxZx8Ot7aqD6aVXhfrBu1YthxQeyeDTOngXQIekaFBk2
         ud2CFY8feYyphEMjTtSfr5ChFcnFoKwKgJOJ9IoHUMUu5y+fD4XMihHQPZARom98ADxw
         zof0ZO5DASe8RYakHHC0FZ99P7i8m23AzoMze8ud9Vc0QIt+kn3ovw/5/C0fovLF0BzX
         PWvrTGTy3oX+hw5ty9SNeDqCsElSTc80bTsnvR5gmjbCfYHPOKkrLBzQe4wh/3ThKtNr
         qd6oDnC6A1XwFDS5/i/eo5CZLm/rM8ORB3ZPnpnl7UbIEEgHhAqUb1rRy66BlXXkxbSZ
         BhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946077; x=1794550877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YvrHetLWEaprA/YnNV90q7vlMXrIcclPCKoaaWze1Ho=;
        b=sL2ea0/xbEoKJPVW65QYysZkjuIMUH2aLgkrRwcKaU/JkpkXQDd/YFFFyK4moMEsGF
         mw54MruOJPTzqCzXaw7GBlRnmvrsCBqVhJHPTQkgHBBAP+2P9UiV37AJ7Ep2KDxZAx71
         T8OidmTgfaa826ztGQbAolzSL1THVLVcNrJ/Ri848JPV6Yq5wXJE+3jBSmPA52bR01fG
         MNaqb161h5Dt4FepW0OHwHaJ6fe4cYUhcht2+xv7XNNq35a+gokWFojLb5FzSQsgi+8y
         XmPvRyuzGIpR4SNJr3nC/Ix4xfWhHbsxVfYa4mpHKrJwxsup60KnJYlbwlVFx036b0LC
         h1vA==
X-Forwarded-Encrypted: i=1; AKwUvBzI5IRU1IvW6P+IA4BsG9YNRGUognyVNohORLwaAiI8C+tzJB8UIrS/UsjXfWZDl2AHMMGsVIUqUezJafQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EJRQ8kqP2J4o+Hm6vxJcG+PVhYAEzTxREFe+PkX+4KunC6Dt0
	DB5XqcPzjVxqw5ofPZysr6LkFUaXt6/HYSn5E1+mUXrZwCqnW+VqWJfflCHcFQ==
X-Gm-Gg: AYBFou1T65ubVkJ64bpV6Smfde1H9FM5w24cXUvUJCnham8pgFoggmpBc53Uwv7UMuv
	IVzk8AtakONz/grq3ArbrhEE1jiPYFBz11tNzGQm1J8/miybHpmT409Te4umPE0goJG3UmnFCAu
	zviBvg5uG75fK1hror6vxMBn/cG3An20x3AfFPuwSticrXemHEf7ZUNNQZy8d9HuuBMyNfxKuOv
	V+qpzrzYAq0VaQ/VCG5p1OM+WxKUkWz+2c4/BUfV+9gB7YJ6ojX6wAPd/LWs+gxCTiecmL1r/JB
	kzbUvvDA2RC8pfxcTXzhc0rb/YrftRpX6U029kunuBbFX4BaRfAA+9QrXEWGwmMKTEJj4nKSG4X
	lSyNZdHz86MLTiH8XOKOZqoa41W4lz5h1WsuWb5voP/eZU4RPATfKGyDFqJ4nUclSPTlNHEGrX9
	N8RwVb+/s8T+LDm2f+lm1rUhoOcBqL0z98oypOR6LCBOocYKDBg1lSdPtxDF/OMY1Q0K2jlpkbm
	NoX3st+KJrj2j9dHVM5WgdlmcdTdAlhE2YmK55pq2ar1i0PM7C7xgkupyYAnECMzeMmCsvhxa3Z
	HkXr7TAUycFy3qQ1uuN1JMLuabJK4PqpJtVjMusvuGd0UDUW0kikIhk40C6VTwt8tw9N
X-Received: by 2002:a05:7022:1582:b0:19b:1202:77f8 with SMTP id a92af1059eb24-1b25d3497e3mr2346370c88.32.1793946077182;
        Thu, 05 Nov 2026 22:21:17 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4df114sm2890595c88.18.2026.11.05.22.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:21:16 -0800 (PST)
Date: Thu, 5 Nov 2026 22:21:13 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guo Zihao <guozh23@xiaopeng.com>
Cc: Markus Armbruster <armbru@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] Input: xen-kbdfront - bound the backend-supplied
 keycode
Message-ID: <au1xwKh4LVxHyUMW@google.com>
References: <20261106014957.4130059-1-guozh23@xiaopeng.com>
 <20261106020217.48481-1-guozh23@xiaopeng.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106020217.48481-1-guozh23@xiaopeng.com>

On Fri, Nov 06, 2026 at 10:02:17AM +0800, Guo Zihao wrote:
> Keycodes arrive from the shared ring the backend writes:
> 
> 	if (test_bit(key->keycode, info->ptr->keybit)) {
> 		dev = info->ptr;
> 	} else if (test_bit(key->keycode, info->kbd->keybit)) {
> 		...
> 	} else {
> 		pr_warn("unhandled keycode 0x%x\n", key->keycode);
> 		return;
> 	}
> 
> The keycode is a plain u32 from the ring page, while the keybit
> bitmaps it is tested against are sized for the KEY_CNT keycode bits
> declared to the input core. A backend that sends a keycode at or
> above KEY_CNT makes test_bit() read past the bitmap to decide which
> device gets the event, and no keycode at or above KEY_MAX is a valid
> EV_KEY code in the first place.
> 
> Since the event sits in memory the backend keeps writing access to,
> the keycode must also be fetched exactly once: re-reading key->keycode
> after the bounds check would let a concurrent backend write feed an
> unchecked value to test_bit() and input_event(). Snapshot the keycode
> into a local variable with READ_ONCE() before validating it, and use
> the snapshot (as well as the already snapshotted pressed value)
> throughout.
> 
> Ignore keycodes the bitmaps cannot hold.
> 
> Fixes: 4ee36dc08e5c ("xen pvfb: Para-virtual framebuffer, keyboard and pointer driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>

Please explain your threat model.

Thanks.

-- 
Dmitry
