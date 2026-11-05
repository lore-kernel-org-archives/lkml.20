Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862855;
	b=zJByFBKVL3gl1f/kjTfQeS62KCFdaVh6HBmcaB1gwFoUMfqrIrwwc9FWh7UBhQTYGtWf
	 dD1+iwZFUwcT984DkowKjf+DxfGObTUL9CL8WwZjBzjJhsx57j3pE5lnNEymVM7LVy+XY
	 ZOqNTKM6XeaVGRlL5T84NsZcZclVU0Ric8GVBroLHu45yn40gyC2CzBt/j2+MJhjS7stB
	 5KJjUfBkpSTOEsIANH0TuCi95HxhLY+US+anrWipEOGpfwevs4fKrVdqq2i3L+COVAqNf
	 HabVnl8wKDLbI7ZWyXKW4/jAIna3oEf+Agb9F1l+ThrokpsS1fWFH8vE4YTfOeNHR/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J1v8pdYNRUM0gZGGjmkBVmbbvzgTfWcGoYiulTdSvFE=;
	b=p4CjlgNU2fer97AuuQTlvuhWoRtrpyGCYti5gSk8kQdX7cj2VR9YXzyCV4pzGltrPsQ9
	 pxsfQKqk9REEh4vjJKxaFcq4EkYI2x8nIvFwRT7fgp7Bqy4wlxtNBnUkPmDyVv2luaJaH
	 VofWMlGIv6xqroMwtPP5SOKffG7HT45yr7h803KYQFOFoDjO4jcJ5S+17DkaA7YFrEkKG
	 SUaomvrjFTsFjri3q4Cp27Njh1OnjgetQPijn7ZPFmfMOFhM+LxdgOp7SOfwtj0xSG5r5
	 DLmC/V/yiqK2RG/WYG/frRS+oVdmKkBb/N1+ojktVCHyGrt2eRMNEpWIoqyiuD+8DMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UMbn8LkX;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FDC606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7FDC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UMbn8LkX
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso151277f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862853; x=1794467653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1v8pdYNRUM0gZGGjmkBVmbbvzgTfWcGoYiulTdSvFE=;
        b=UMbn8LkX48TkVV/CDTShDi7prBVUOSb728TYzmNyGUoCZqYQNYFu4D1ob7tL0CVIZ7
         jbwDx45YApvsu6u35QgOfYx2YAjnw6fy/LzfHanucf0mVD86VnQgHU0CeACTPUygoVT/
         vE0epIDdPpTzA6dL83WY3VVlcJpqe+tc+s0onuFazBLFa7ylBHIEIba7Fe5rLD8c+GMq
         Q1sHAzKJV7cNO4Il6kN/jXFh0/MohQ6gVMFlE1K9bQnCtXhsh1muRNM00Pky1pWyuwwB
         6UbNL9swVS4Ho+RGBRsNTpajc/GnqTAEJNLnQnG8JIB9qVicZFudARuin5NLZ+vxKW4M
         1g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862853; x=1794467653;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1v8pdYNRUM0gZGGjmkBVmbbvzgTfWcGoYiulTdSvFE=;
        b=p8HX4d831IMrUTX5hiVsJcrYMZDncDkc3b5bfsi0rMtQtCaA3zQOo+n5jDW8MnO974
         cF2njxhpZA0UPsFPCUyy+ZEl0H6ZPS1Lkwnv6I1mvK/vxTiGrma7h531EDIjleuMubtb
         yEy9AiN5xLtlcOHpCy5jCwGFlDPUxTcNQKs7u9A0AaOPy3yfHBc4hiAgNtci7iSIuy16
         y3UPgRZf0l91Uuynxigxa8ThmRsodnAm61NcydtLO0ispbpGp381zI6tMPGUuFDdYOEY
         K8r1bAmZNV1WDJlmszo+q8yrDpczzJbDyhO9qk/ulluR9zb2nvCciqLAdFGSNTttHYYE
         8e0g==
X-Forwarded-Encrypted: i=1; AKwUvBws7L8gsRDPgtQthKeAn+wznXoZfmZu6UzCn3u1KvN2ikOLOI31qiKzfRdXQfYl2Xi7sJ2XCFr4LGM7WTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a9LuQOvqXHAmcu3VDt4ZdIiz1W10Nwd1gKGUY2w+vj/XapaQT
	CSTXPZxz/EYiaVfiG3cjRCwIDc83xbDj317iRh6vDkcxOR9Zr3cMXAXP
X-Gm-Gg: AYBFou19x0QhVfONtD8r1IJ8PcihSlOiNlDUup5PRn55pkfc50+6vhcDFZ9Q84QsHoR
	gO17+Vmf/4WKljMLKQcERNnrsVX0Wk34lL6jWKWPF25P1kt4YFwcxKTm+cHJZ9vuXZrBUYQimO7
	bVYG65kbh2DXfv6FUauHPcQjMKLBZdYq67HRFF0JtN/RFxEV6nJdDxoeEl2it+N+ek20uDg4AJ4
	lI77GY0LKiUiyqGEXUN/rMV5T/4Mcf5t4fHNGHYodVvC7h3vH0j25YZwiPn9lKtSZN+Z6RHpCzr
	Pz8vT0fBXLj/cx5j8B+SuoIyDK7UJaKL+CG30JfdXVhuJKKz0p17tL9Xa2QNgNdTdt0WWLIz3yn
	JvZUU7Fi86EUi4sl4uM9/Qb7a/gj+LfTLHUQJUaO/+Ae2cYemxrUlh1ARsQ2mwGgDtinaPEOWwp
	nq5ieygKrKcros+u0SbXFQBCsCsa6o/QOwJkp7zLHaPAegLVmTMO9hRUm0IHsRyhGImZybfnNZY
	jQLo6VGTS6GRmu1J70jV6K+GCVZRQHKbs0jxU7cZlVUKmfZ4yd99BTeb1c9XBKl9ZQIRcntRWuK
	M83QQs8TCvBDvNib9yJ8no5x1FuBWsSvVqQwAO0LBLiDtdkrGXD+xj4XpFVrapqtgGRxGjZ8+f5
	fvp9+yOgTkbgOf8VoXJYwBJdfzVl+UPzD6kkROeAQYN0sJdNjh9/41dYV+O8FKC+eNj0=
X-Received: by 2002:a05:6000:2284:b0:48e:678d:396e with SMTP id ffacd0b85a97d-4911906d313mr2976092f8f.9.1793862852953;
        Wed, 04 Nov 2026 23:14:12 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1f100sm8347693f8f.46.2026.11.04.23.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:14:12 -0800 (PST)
Date: Thu, 5 Nov 2026 10:14:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Laurian Iacob <laurian.iacob@yahoo.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: use guard(mutex) and simplify retry
 loop in buttress
Message-ID: <auwswLdxTSjA5BTL@stanley.mountain>
References: <20261104222832.32471-1-laurian.iacob.ref@yahoo.com>
 <20261104222832.32471-1-laurian.iacob@yahoo.com>
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
In-Reply-To: <20261104222832.32471-1-laurian.iacob@yahoo.com>

On Thu, Nov 05, 2026 at 12:28:32AM +0200, Laurian Iacob wrote:
> Use scope-based guard(mutex) from linux/cleanup.h in
> ipu_buttress_ipc_send_msg() and ipu_buttress_authenticate() to simplify
> error handling and remove redundant goto unlock paths.

Unfortunately, you didn't remove them all.

> 
> Additionally, replace the backward goto retry label in
> ipu_buttress_ipc_send_msg() with a standard for (;;) loop to improve
> control flow readability.

I don't like that you got rid of the try: label.  How is that related
to locking.

regards,
dan carpenter

