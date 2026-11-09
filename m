Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246024;
	b=QcMSRjK+S2V2iFBllauWCxroQJxY5ZfQepxvspiMnAcUA264eZc6dehA17uin0sTyAhL
	 7Fe1sFDFO0RvN1nRqaSWfFaOSULCKk6KithQVc4paZEKr7lI7DihSQNdtIKb4eno9oNSw
	 EVMAy1xacaNg4DGZlBqJEEWP6KgrBAdNoH82hRiZ3lty12VpRf36RvfH895VtMu6a0DNq
	 tPXdkxBzBsS+lvaSBp1SLaTG5DzMxik1om5uUnBLJ04IfTU3NjJqxUsb52nLdHeKwj6l/
	 Bkim+0JoUMadiUjiPuZX5O/Jqn48lRiE5h/fG67H9HSB4bg7TawgoQECfGsfYJizXjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=RTN7GJRGxjj0prh56qCTTHNAOwYTCgOl6J/IwT1bHGo=;
	b=KzYiHtgrh9byUIjgyX/hhper4C6GbCaKoaFNaLckJRzO9R3meJtrFiiGpeCff5wr2X/l
	 XrPLLZEDNjD+/G3ckH85yIjmymzL5EWbpsJGNCMJal2kNLtuEViEpF6GUUBtpnUSdv4Vz
	 nYANi4QMTmsHlb55Xie9Waz9xp125AT84o3eNjD33Shj/UsnT9WP38Yg9nWmbqP7+zx9i
	 ZUpBEyUsPeZN5DsazEWNg8w+iMsOg2Y2c22bY2oPOJJBuGxMDBzwE76z/Vo9xb4fc9r1R
	 3JkPV2zYFtWai0PfAqBNscrQhV1aHv5YZc3ugsS29sD3qZNcTLO2J1hDwJYvUvqT1Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TKz+LF0C;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C555606A333
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C555606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TKz+LF0C
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a315ed211so1311108eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794246021; x=1794850821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTN7GJRGxjj0prh56qCTTHNAOwYTCgOl6J/IwT1bHGo=;
        b=TKz+LF0CU9ykvW24qHkHBmZANsrDxSE+YQKhzk9llLhgvgZCWOa6B2astRojinp2fl
         If3NI517QkeButaIP8z57vpRuErzEsGplyoOkGJg87a8FPDVnoh6Dxaf5WTkCSo1jtae
         Zhte+uncYMMhTW7SH8CdvesLtgDulYzRj8y+sPxw+YB1WM2aGI9quKEl4XdJAw8wli4P
         sPsQuYdTOltOGTZcg+eciOobSTr2qjTCEzL3oN0lv1YbQnRyxSp7YwhWRP3/6n1sk6MI
         tImcZetcy08pofmpnlRjZFvdWs6WX7tca0QYPnl+2LqvLV0Ur0/iq21VjvIUERffzpmj
         PtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246021; x=1794850821;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTN7GJRGxjj0prh56qCTTHNAOwYTCgOl6J/IwT1bHGo=;
        b=VuvTnEifQYwaTBXqSNWAFFZ1nV2Ke9Ofa5oxaXJmBabWdnRbUZPzNHTiXr9Fj6jVNP
         TVhA1Mn9R50BJgYGEt45XAKt5qEKqT8HH3ge5lsg6vIae4yoCTXC95UbvhKRNh430bCL
         yd1t+iPvada09miNViEa9DtopnDUVs7bGgchoZ2rDx2bAjeecW2JvNYA+Rrmlrxsmheu
         dOqUC+uUrqTrx27oS5SXgicoFu6zV5VeFZCMKtNH/oyqt2WwueTWQ/xdG/KOGMTLUQWY
         B9WznXNSZu81EHMRn+7W8nGki4H07eObi9NBUnuw99tMlTO0s5Y4KLbRPlXIcCoyZJfW
         HyOg==
X-Forwarded-Encrypted: i=1; AL+hErGXUv9OcwnmLzUgLUZxuEw16Sow9STdS2D5p+Qfh69Jw+tqDUHWas+QXNutMvllrnija7JGexOFSDLgkRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QErdQMI6iwqx/GWjhjOAZqsgqT1BGhr/sES4vdT8dbONKZXII
	Hl3y34Q2uzI4Hetodb7ncx1pzJzny5TD7ffcakV+y0j7WNL5AE+8C+tmuyY0PflKUVoCmEURaIy
	TvHjF0us=
X-Gm-Gg: AYBFou1NaB8qRwBRu5cRKXqxhh3MAYXdiypOoS/RxKv4ic+AT49sNrB/Zi5sU/1Ic73
	YlvDLaOmzG6tUu8tNnXWHYwDQTeSBR0fK0FfTx2/hX9wmMzvfR3QNZQDHGvVP1uKv+cKpIEDi/t
	/LAvdeOHbkiGF+aYv9/Vjdg27+HOZv/PbgXC218JFhp5Dnl+FSuVHU1VWmzP8bqVPbVjdOUcWkQ
	RD+DA4U0ICMRaiMEqTNlbyHQnaqW1db98kDwKIf3pmqSn9nlGLw6JpSIh+qG/x0CcVYVci8uHsp
	p/F9q169yiX0umaEBmSedMPZ8ev+nOOMW5nbxl2HfbpB4yP3a5iUvlAl1lrkfw7to5Tr/MfMBTg
	OQUpwoIQ+hHucs11MhB+LpFfI+0NdwAioi9aJX5qHQJRRGgBSEVfcL3WTbAK3JBnptv+r886It7
	JujqANluM+sDrSsg+vdV522mYe6+eJa4C356uQv0+s0xTQkU+DknOXF2o7o6UWEOTgyM0/zzP52
	MVSS5l4l2qxGo7AfLayznOQJRoFDV5mIhiifJ66MuaMJAWOwpYN4bABYxID73YsHBOhFz9Nbx2R
	tXt2PcCXIoh6vM7mwADYV/Gehetou4qiMLMrl860P9mPhyVbiWhkm3QajkbNY8MN/reANy8prJZ
	i1/hTtFzy9e7e
X-Received: by 2002:a05:7300:e9d9:20b0:36a:2f6c:490e with SMTP id 5a478bee46e88-37508f421a2mr245104eec.6.1794246021164;
        Mon, 09 Nov 2026 09:40:21 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372656187f8sm13250129eec.5.2026.11.09.09.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:40:20 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, 
 Lars Ellenberg <lars@linbit.com>, drbd-dev@lists.linux.dev, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lars Ellenberg <lars.ellenberg@linbit.com>
In-Reply-To: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>
References: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH 0/7] drbd: preparation for DRBD 9
Message-Id: <179424602031.19772.15096346833030118942.b4-ty@b4>
Date: Mon, 09 Nov 2026 10:40:20 -0700
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Wed, 23 Sep 2026 16:06:01 +0200, Christoph Böhmwalder wrote:
> This series contains preparatory changes for bringing DRBD 9 upstream.
> Each patch moves a piece of the in-tree DRBD 8.4 code to the form it
> has in the out-of-tree DRBD 9 code. Doing these steps separately and
> up front keeps them out of the much larger rework that follows, so
> that rework shows only what DRBD 9 actually changes.
> 
> The patches are a file rename, comment and internal cleanups, and two
> higher configuration maximums. Defaults are unchanged, all existing
> configurations remain valid, and apart from those limits only the
> wording of some log messages is visible to userspace.
> 
> [...]

Applied, thanks!

[1/7] drbd: rename drbd_worker.c to drbd_sender.c
      commit: 40059d1813d8834cf4779b8c9c2faa80b4a6a0a5
[2/7] drbd: modernize the file header comments
      commit: 4df3cf912f90dedfeee025b1fb34b6ecead7c8bf
[3/7] drbd: raise the socket buffer size limits to 128 MiB
      commit: 80869ca32c8969eeb857f4d1a3f959dba952109a
[4/7] drbd: raise the maximum resync rate to 8 GiB/s
      commit: ebf0023b636ad47afeb13ece37123507d27e131e
[5/7] drbd: replace the drbd_interval bitfields with a type and flags
      commit: 6826d3b194b1e01128fca6e0925a8afe72b7cca9
[6/7] drbd: move the packet name table to drbd_strings.c
      commit: b87ef682279fd67600b92eb83d10e70b01eccda5
[7/7] drbd: rate limit log messages per object
      commit: dc2ec1327db41fb8c7c0ae5a5e29654b6ca3fe17

Best regards,
-- 
Jens Axboe



