Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402048;
	b=qodOglWu1y4dSqIJElvaNTbV/OjmC9WQYs2tbF1IsM3FVuoJKeBa9D+PPMPU4a0v5t7i
	 zBTQPQ4gM+fcAtUZ9uidtg+IOOeEv/kynjf0ys5C8QjquLlhxJdUWjykmHbViHVA9M13F
	 YS6PEiVC1tBih+d4TyBa9UJCOSBhayrO5hwFGjkD0XRlIJBwL1o9QQBq05arhBCm15zPX
	 KQptwwmgW+tAvuBINuvPDYKJXfI0fjg0opmXZJEKIUAJurr7PNVOyz2dEdppCNgZoJPCy
	 G2x1Y+rPNYYG0c05c27Rrm2fTRoag7jw+mYsycmtdKILuwbHiQiLLhYyMCiQvtzoaAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=SFIoqBjnlbvZCjChyTyM5qELmMy/lkQiq2ftUIfNk10=;
	b=BbFNKaOnYNcX1denXKBvj99FlqWhNVAPC1HHUICe2iQ7d8x1ROdON+T+qQvpQZleELmV
	 K+4wjmseEprfxzDftf91ghR0eLj8ZGlWLhymjjyoNadiU+qhbRXwTai0LpAEKwOteXhPa
	 Jogk2d5Xm5vfTd3NE4BhvRhMkgvHT0JfaBWTAgDlRFpxEIRX2iIYyJL0p9mzbSF9D+4Gd
	 L95/d/QwkbuH8S52mPpI3r/DegAFrAUlOug10p3No2VYeuMNVfJOptROBkIPl8xRrqj8s
	 IFSg5cDNL2wbu+jo2wfDkjHaheGGK3KQt+PUWVZka4JiJiJJ04c0IyPIWtM2f1sI1kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1hUS8nb;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A539606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A539606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1hUS8nb
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so3196318eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402047; x=1795006847; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SFIoqBjnlbvZCjChyTyM5qELmMy/lkQiq2ftUIfNk10=;
        b=F1hUS8nbidigRDtk3g9zoOUgSLYoMzz6HryUwGNGS+lBAGwSJOGzaSojl7uTLjwvtw
         NeFW5pu2nI/QBnnMTkr6sEgyTv1vebsrPnX3Pb+uc75ElQZ9fAuLfwo1ACD2wM16TOQq
         tzD6LAtOdWAJEvUKSEb5HstfDY99nYy/K9JWOI11P2UmSWCFkZUprnLqPhRra42GzDOO
         XbDHb6GWUbum3ccG3UCvUNfxQlYCp+jtqqErvRU2o5LvEtZ0P52SvwRgIgRaqMYnJAfl
         qaysFZJ8EvDuecbSl6TRYLfqXHTjAxwBiHt2lkmaogGFNDqdZUKNz3o7mk8NP/NCSOo5
         UWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402047; x=1795006847;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFIoqBjnlbvZCjChyTyM5qELmMy/lkQiq2ftUIfNk10=;
        b=Z6gsC+dx0/FMmutcGiawBq+cUD9ROqDHwKNy22t9Jzvs76+p+oxYOqtp+F3QOlZANr
         DM8iRR5xJBXnofvdvzIXRy37mpBDcrqcIeySyMOWXQX4HNQeWOiBXtAzuF8SGITy2sza
         ueVUdtCzcqXJ1B0IRBs3T3AolzM+DhbqqQyyW9QJyjqNLEhwTrR7tGDMYQ8CFhuVMDrq
         fE6tZ+cirD69RF3SgmoXDe6y7ZmNw7WIokbdbewpRRenn8LMyYEPYuRK18f2ZzsiqH5g
         hkdNyiNG+tEGOp2a6+sZqOId3//0OOBRf1zTEpAlbJaCxDf0HdEr0dWT1QB1aJ9z7qP4
         Sbig==
X-Forwarded-Encrypted: i=1; AL+hErElWBsVOsllnGaAemu6P5Vru/Qj2iTV7bSf23NZgu0uF8KSx6pISftruBIeDgwKZlQsq56DK5Li3do6uXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f1Dhpx1A6kTqNXm2bjwk3P84z4IwZRfS4wCpw++fbeJgxduaf
	bjSKj7FzUw3twOIhv4czB01ty9buB8eGMYClwOp7RQxATcYzv1foy1mM
X-Gm-Gg: AYBFou0iJuYTfEAB0PJ7u9c91d/9TIeistyiUMIaSLZv8slNgFpW0iBdfrViheB7XZt
	TjDnnC3KP5oylsfk+aC50VmsQTvJfosbitNWOoHiZmcwlv9BmmIv0VJNzaMi8APtLn3xf8qcqBw
	826CooG2fb0Ucjw1HtlsWJpW/Aqgs4r+xwld5TG/3O5F3WfXki9iwOeoWXLB1eTQN+N29P51tKM
	XkRn6X+aVY5B0BnZmdtS64IsEc36X5OgDg3ivjaRhQarYLt1y1qfU2Vhzuyd+me7jAMXSTclayx
	fVPnfq+4IXMHjy37Mn4othbweIKzMUAKsUVH4uyZgJe79giDr5TjSboqa7ohep30hKWvxmnbFZQ
	Wpa4Z2gUnvlC+ZYb+y501ulebLlLZpU4zjm7pDkzT+5YSekK0TP/IMN6QBBsqUIPDD23R4gV74Z
	5tHxAcZXa2/4eYXJN7lpWiWTWfZbgOnYiT4DOgyXoOv9xVJ4y66mZLFI89Zb3aBobTgjws5fhzL
	mzLcXGapy714rTw0KLmRGSgdo0/9Untiar2z8kIMyW2lq+ikJmw6pf0ZjMk/5nym0VPMzikRXsH
	RhWxu0Yj5g4UiSsokjuArHQRwnQwISNuMcGyeg==
X-Received: by 2002:a05:693c:83dc:20b0:36a:437a:4c00 with SMTP id 5a478bee46e88-37685e6ae71mr3149122eec.24.1794402046818;
        Wed, 11 Nov 2026 05:00:46 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:a1ca:3ffe:3076:4525])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm26438801eec.22.2026.11.11.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:00:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] USB: legousbtower: use stream_open for stream
 semantics
From: mdshahid03@gmail.com
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mdshahid03@gmail.com, starblue@users.sourceforge.net, 
 legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <2026111054-reversing-gurgling-94fd@gregkh>
References: <20261028182802.25212-1-mdshahid03@gmail.com>
 <179433189678.152716.11457478975708955224.b4-reply@b4>
 <2026111054-reversing-gurgling-94fd@gregkh>
Date: Wed, 11 Nov 2026 18:30:21 +0530
Message-Id: <179440202172.231301.13877269286726215478.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi Greg,

I did basic sanity ,I build driver and ran smatch after changes.

I don't have Lego USB HW to test it ,but there is similar changes
in Xyllibus ,that was sent by me and Eli(maintainer)has tested in HW.
According to Eli ,There is no regressions with stream_open().

Here is discussion:
https://lore.kernel.org/all/24af6daf-dbf3-5c47-beb7-077c4473ea7e@outbound.gmail.com/

Thanks
Shahid.

On 2026-11-10 13:21 -0500, Greg KH wrote:
> On Tue, Nov 10, 2026 at 11:01:36PM +0530, mdshahid03@gmail.com wrote:
> > Hi,
> > 
> > Could you please review patch and give your feedback,when time permits.
> > 
> > Thanks
> > Shahid.
> > 
> > On 2026-10-28 23:58 +0530, mdshahid03@gmail.com wrote:
> > > From: Mohammad Shahid <mdshahid03@gmail.com>
> > > 
> > > The LEGO USB Tower driver uses nonseekable_open() in tower_open()
> > > However, its read and write have stream semantics.
> > > 
> > > Use stream_open instead to mark the file as a stream and disable
> > > unnecessary file position handling.
> > > 
> > > The issue is reported by stream_open.cocci script as potential
> > > deadlock between read and write operation.
> > > 
> > > Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> > > ---
> > >  drivers/usb/misc/legousbtower.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> How was this tested?
> 
> 


