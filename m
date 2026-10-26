Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055593;
	b=gHz1qF1qvHuGhp9h2HnLXERAFyYEbx/ic7OVHHztGD8aX+5EZW68dvDwI5ATan6Pqvfx
	 8MVk7+4DVbkTDc9H1WT8wbfZALvz0YCaGT12LfjdNAmtWXv6fAX5ufRHM65ATz4Y/X+7u
	 LghKjXMTkDNbHcLlloH+WeEsQm2+GBvY1fleKoubJsrD3tcAqhomnyY0AQZ5qzC6sla87
	 c9iviB+/YpmINEXRZAqRCAR0UN8/UKUvf6zZgSXy7gF/4NJvE6Q3uQTQ4/MD6tW/w8/0R
	 lloK+ZV+8u114mEoxGhSRxx0Fvs1bLcUPsbiDghMd73+hV45GNTcjt6WkyNU5W14ERA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=xYFlSdYSBy4efBRscq6PIWjy+kL+seLzZByRLeIBFMw=;
	b=dkPipy5z2WSFOy9HpnNwrJvaFb98Vusn+bA8S265OULzTg6NCU1qlH6BY759yyeTOnKo
	 t6Tm1SxxjkyvGKVw4ysCQF+9n5tBZoNlg70m976AXu+034YJ/ygYZUq2galRgF+l/M21f
	 6z5bPELkGhyQRbkbgTMldzQY646CfZueUIye61O6SbGXPcm5bGJ16Q5O06CHhuruIbk1S
	 eBPzst5rg0noGHpSmsjVX5eclqJDmuMApllqWHOKJAagL34qPRNhO2HOSqPHOaVSIzzjY
	 r4Xw0sgEJIB4wBklU+9gDEuKhOyTlHkPwoquE8egYeqcCjMO9eyVGlacd2BAvco+SQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=JtgX6t4H;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C20A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C20A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=JtgX6t4H
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53394bffe0fso3905921cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793055592; x=1793660392; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xYFlSdYSBy4efBRscq6PIWjy+kL+seLzZByRLeIBFMw=;
        b=JtgX6t4HkHHesY7n2JQPJyp+pm6/msV+LFkLCJeK62zQwbPs2o0eO3GuMpiwLyNqUP
         WdbCdxG4OXTrmFVlJcvkBmXQ9YK0s18xT86CS06J9aePaF02lGMjkyV+i9+s8AUyZYEo
         sVBYaHLO/lJaW0Nf3fxwP9S6DP4jpS3e3B7HPfWGx8noGECoZeSPzRqN8XrpE4+O7Hd6
         nE+g5KgftytnmNVxGTrNW812PMJZKe7xsMJRVS1IsYJ+7VcaMIV2Aq2Mx2fYBPvmFlNB
         KVI3wubDsUSR0XMK4VovCsCi/Ayb1GFD6RmHsKOHAd50F1EKGy7VTJQkptwcIKutBLP3
         4sVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793055592; x=1793660392;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xYFlSdYSBy4efBRscq6PIWjy+kL+seLzZByRLeIBFMw=;
        b=KFuLkz5C/xcglBobe/0Y9+jcY142QBCUnng4dJpPIU9QDxlzEJ+m7VFE6lXSPowBkE
         vEACitANf3cK0Ggtrg2HkWWf17IjXLtGcNuWbtw/+JmXID37Aj3YLXH5BLml7RQ//8OS
         Ki03212mfZ2HVnBJnF8ocBXsBu1QvhuKMsQs0+Ks9IwWTFvf29/w7BQbtb9lGYyNJAHd
         X5eADcxI8TdsxO6VuK1AoAVBG4ByvbjSyzqDasKrUbtINM3GO27rlH7LqhmXNcsxoBOc
         iG7iUu3eQc1Kbe5K9aDAFICydbWkxrF8e88XvE+j1IXWOFK7c25lDrCPf/ZxN1CdKQ9/
         0LSw==
X-Forwarded-Encrypted: i=1; AKwUvByUHtoe8iwGWHDoUjdaaEuHmtjSJ+Lps5EPtZRPUJr/XdQDPN05YrmMDI/F9DUlzyXaN6DyA4K4i4sm2Qs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMtdH3oZXRgxbV1rtxwFQHT8HwS7lLToz5QRzFZk/yXxw0uSUl
	3vl6vpBW76qg5oWoBKiDLp1/gQcx2wlgisnERljri8rlg7Vt+/I6Y7Q9PgqYqHoCp5U=
X-Gm-Gg: AYBFou24I+JxAlcRr29UW+qWx3OGj9PVuf3XJnsmBDkwYJcC3DrdUZ/nkCnOHBensNh
	uUB0NXk7e9FUw+aKvfQcwvQTjoh1yaY9ABGp9qHbi8MxFhZVWAvsES0VBzdIKKIgiWZOWTrOjM1
	TZ9SL0zk7Aavbo9ZgJtIBR7Bm3Nv0MkO7ZSBNz9s1bI3jJ4NYijWpME1+9TNsZmdY0hkTYunFI6
	CMW1JD7wZz1lV0YdgOxoEYRFElNTdNAZnN0IakYFCCmKx8Faq8eBmaTF7J1A964jH8WGRp09SzP
	XK4mWaIO4RcetcdFJWHhc7jnqwOCvYBrOWrGLg/ODFoWLe3mWhco1whlYQxBwc2n0HpCvbaHxFw
	O0gTUDVZ5emtZ9cEEZQNQy7Iw+qI5qRXP6c2nTiJK6o22wAWxJ9ln146tmGpshwqfkVE7JaMnIr
	hWD6IDc2DkkMKfzcw/M7RAGgiYm/nP3e6ESGtkpRY/3d7IdupjbPwQw1cHnYR/NriV0+aqWBPay
	Aiki4LIbv2kstgCy7R6Q0ZhmZaMo3n0vqt1ukXUA3lvhGUsLj+BRq/Q6XVexDl44AY/kRvESVEa
	InW/bmSyRBbFE/J++Ghd+M9Y+td0jqd4DuxXJQ==
X-Received: by 2002:a05:622a:5c06:b0:536:60a0:5515 with SMTP id d75a77b69052e-53e3f95510fmr21198101cf.17.1793055592065;
        Mon, 26 Oct 2026 15:59:52 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ac84sm65824991cf.20.2026.10.26.15.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:59:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLTfS-000000089Kh-2dEv;
	Mon, 26 Oct 2026 19:59:50 -0300
Date: Mon, 26 Oct 2026 19:59:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Williamson <alex@shazbot.org>, Armin Wolf <W_Armin@gmx.de>,
	David Lechner <dlechner@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Bradley Morgan <brads@mainlining.org>,
	Aleksandr Nogikh <nogikh@google.com>, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20261026225950.GD1685504@ziepe.ca>
References: <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <2026102437-vista-unsoiled-b089@gregkh>
 <at34UOuYv3NtX36R@monoceros>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <at34UOuYv3NtX36R@monoceros>

On Sun, Oct 25, 2026 at 01:48:04PM +0100, Uwe Kleine-König wrote:

> The more I think about this taint, the more I believe the commit should
> be reverted and replaced by a some stop gaps for driver_override. (Be it
> a taint or better yet
> https://lore.kernel.org/all/0f7446324f6a0c8f0153d6532d92a6eeecd6a308.1790612298.git.u.kleine-koenig@baylibre.com/
> .)

I also think this patch is way too broad and should be reverted until
something better is designed.

To me this is very similar to the filesystem issue with syzkaller
fuzzing the block device and crashing filesystems. They said
filesystems touching untrusted block devices is out of scope.

Same here, kernel drivers touching untrusted HW are out of scope, we
have never supported that.

I think a taint from force binding outside a match entry and using
new_id are probably about as far as this idea should go.

Even this would still regress most common VFIO instructions though, so
some kind of disable for VFIO would be needed. I don't agree with the
assertion 'servers are already always tainted' that doesn't match my
experience at all.

unbind should not taint, we support hotplug, and manually binding an
authentic match'd driver should not taint.

Jason
