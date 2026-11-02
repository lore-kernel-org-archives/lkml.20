Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647885;
	b=oAGvVQG3K5L7CcMfra5i2AS/1JoexxWaLuUIoOmi2q+GFtcx8kM9nv/7nU3YEVtz/27V
	 MLgUrQsr79Xfw3G07G2iLyRb/gVbvK/LF49+xdTte0agA39OxHGEuWYSlCKbIjCqdL5KC
	 FNfjZeo9AduUplGJJQfpfeBExbOfrB7jw1DTJep8COybOIrxNlt3AHwXUVEaKBGEhQaub
	 ak9g5ETaJJheuURc5Ri6JdB90NRil0VWFvAZwSbK0PV7ac035WjHPDUIlxV8JINMN9ZPg
	 q3o0XlCF19i8Tf1R9At6ee3CypXRBbDTvYnc/1m/xhHNpM7f2aQovIaCOpeaNHSo5+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OHQyuYjFQW3W/4xcSdN8/cZTkkVuQVsRMgUqWbu+rsk=;
	b=1sxYjLsWlSH7DaHz6nFypeFyLQujkarkjMlqzSvRtJhoRUA9sCTxBHuGxnM839baZUdW
	 JwR9/+pqfKPFo7ZMshqIRlgtH8w3e+kb1FcmZD5zSJBwber5xsDlWv09a93oK6+s5VFoU
	 FbAItXcJYBH5xv5sVyh5MmSNhOZk2kBdJUYpQzPAcRUzfoRcsNnCMaVm07X3XNUS0mdqx
	 kvBTKbf5dSYPdWS8u2xRT7T8LH3JpGSECVBvBRvCdnalhlfCB62DoSP7V2rQQd2OAh4/K
	 S8WTj03CshJK7dq3h/o5VxPW99Q+K2TTCp6LQg0xknHXIPMwogkmLJoLUkS+j5mQVvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l73LkrQv;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3279C606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3279C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l73LkrQv
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so22110825e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793647883; x=1794252683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHQyuYjFQW3W/4xcSdN8/cZTkkVuQVsRMgUqWbu+rsk=;
        b=l73LkrQvuZciKzRpKr1DfT+CyrRl3sJ4ez5tHIOziCKKoB/NIWjlFJVqceOemEeFiP
         9SZFYkIhtEQg6AQWUQiCd4HhIzPr6VFPJ+5Vbr01oA7qHVtw0gzlRhch5jJkngznqgv8
         Innt0EQ5E4l41nWAGtL3GUUDl0QU0hdckMOYKnucV/07iQswTt6jNpTLvLjxUQxSXrbh
         zYXtDsW1Q2yBmCnUClnpBVLX9t4yeOpGJzwi2YkOZPxnRlK+4t/ju8kpdbOKLVbooiul
         yi8Ys8kz8IYBi/UvG7xllQbO+R2I006wPSIzT6PGGxF8IEz4JS8+g+mktXlAP4+K8h3v
         ldFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647883; x=1794252683;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHQyuYjFQW3W/4xcSdN8/cZTkkVuQVsRMgUqWbu+rsk=;
        b=whYG19HN64PLM9XgISXg1dozX/FGffugmRlPePLmvJc8tHWWRJzy7aLvN5YYyFI8CZ
         OpzoV8JB0fT0dnsOktaZsNOze31HNJMoqi09pKTOKMXiymJtwxVpUf5ST/9vmJNmD8Cj
         v5sKZT1ndh5v0gkl2fSs6hyRMYU9RRaSDIDwiPDj58HZsnkQlnCKsKUNPCLpQNqEZrAp
         +dSfWT3DcvymIRZN8ln6cMG046VIctcO49gZGKs2DBnhGlovW+d8vBGpEpwvXfow7J5P
         LhTiZ5v2IGJO1UqlIC83HflbocMSdJ9e4Mb/LSr0U4wsZUbtJrKGzHP7xbaYaZVUYw4s
         OOSg==
X-Forwarded-Encrypted: i=1; AKwUvByFO9aPZZT5FMmNI6x3c0ouc+w+YMXVF4VBtYcl3+R20yQ/nd4fioJgkcTU/5WVYuiVIpOmn61qyq80Mpg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSVLET8jjp9saJEnW2rLz20nQvcjXPVFEqFtbrHelLXX6wAcAZ
	DxEwRQTM0uyPf3pNJ7BJp6C2Q3HiuRxWGmB4FgpYEyszPocLn5CXEkOI
X-Gm-Gg: AYBFou1KUpEpVYLxcxL6lvsx13xwk2UH1EsmuetKANznYLkUpi9N1TwX7OzP+ez41G1
	HHiPNgAL0RXnj2YcLccs6HTtvLsI/mHN/JwDvqcBSGtW1DV0aqVanK+cBATTq2qNL8CxeXH+Jrg
	gF3OBmCJ1d0BytEhsC5EVxriKxQ7eqa0HXAOcnAEkCdVhuXlwiAbL12eNnz0JjH9e7HNtHqXaSR
	xlkltZNH+9mynqAQ3NIsgWou5SdZ7UxsyeIRavItMe3Wx5o1USPiZoNgM6R1jUX+EiqghWmxhUj
	VFKFKLOU4919a8AFcRzf5SQeZd6eod2V0cBF3KQm0K3+0i/r4YleVYaBOWV3cZUZw0NaS7XxNyJ
	afudRdr4GgwiSPJOk77JYcpP44QpJyjtnvUh2LALZEW8PaDlCIl1fOrFINHfS6rClhR0vLV8VG+
	i36WoXdodjkNUSxnNSfxeu09xxiz0H7/Bc9nbsHdWrE200Uzkw7d91By/6cKX41DyVru9RL5clk
	Nm6YWTD49kW4e9iIdomiQP3KLMgAmHftCCI56Wc3sIwAHSvOJrB0/WJP7eW/Z3cyNVcA/0wOFPA
	SoxIxoQKvybUoGTaygVH4xc1NnDrDDS7Xbusm8CC0xKKepK1X3Cvv4BdVNdhXzcks/xLykV3EAj
	Y3yDcrEVsHA==
X-Received: by 2002:a05:600c:e555:10b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b261e5b38bmr21493425e9.11.1793647883361;
        Mon, 02 Nov 2026 11:31:23 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a5372d8bsm9940525e9.0.2026.11.02.11.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:31:22 -0800 (PST)
Date: Mon, 2 Nov 2026 19:31:20 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Corbet
 <corbet@lwn.net>, "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Joe
 Perches <joe@perches.com>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa
 <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh
 <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr Pavlu
 <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102193120.4c88f066@pumpkin>
In-Reply-To: <20261102-affable-undetectable-beluga-eded3e@meerkat>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
	<20261102093206.50b6c9ad@pumpkin>
	<20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
	<CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
	<87a4nrfgjm.fsf@trenco.lwn.net>
	<20261102150535.6c5689f6@pumpkin>
	<CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
	<20261102-affable-undetectable-beluga-eded3e@meerkat>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 12:56:28 -0500
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> On Mon, Nov 02, 2026 at 05:24:51PM +0100, Geert Uytterhoeven wrote:
> > > I certainly scan it.
> > > It is also useful to have an archived local copy that can be searched.  
> > 
> > Indeed. Sorry to say that, but Gmail web interface search is still
> > much more effective than lore web interface search.  
> 
> Folks, I don't want this to turn into another thread of "me too" responses.
> 
> Yes, I know that some people still use it for a number of legitimate reasons
> -- but these are few-and-far-between exceptions. I need this change because
> the current status quo is NOT TENABLE. *Everyone's* quality of life is
> affected because Gmail's throttling results in (looks) ~350,000 mails in the
> queue, most of them waiting for Google to graciously allow us to talk to them.

They are actually waiting for gmail to reject them so often they get deleted.
If you try subscribing a gmail address to lkml it really doesn't work very well.
Maybe you get 70% of the emails (hard to say) but they all arrive out of order
and sometimes days late - makes a real mess of patch sets.

More interesting would be not sending any patch emails (and replies to) to
gmail addresses.
That isn't as harsh as unsubscribing gmail addresses and still leaves the
gmail addresses getting any 'admin' messages.

> 
> So, we either unsubscribe all gmail addresses from LKML and prevent them from
> resubscribing, or we do something less drastic and revert it to how it was
> supposed to work in the first place -- only patches without a dedicated list
> end up on LKML.

Then those of us who want to see most emails (or use local filters) will have
to subscribe to all the lists we can think of, and then handle the fact that
we receive multiple copies of emails that get sent to multiple lists.

David

> 
> -K

