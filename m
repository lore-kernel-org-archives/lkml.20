Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043238;
	b=aH8B4JUq/sOPtKnTq+p8yJ/8tdc2ysCRDE1wWfWlCns5DvS0x9vsQ++V0hjiRoslb1mC
	 BcHzJMNIIRA3Ds3jxyFyg4FRJxI9yB7RhZAR/HBXojBusIBoFeJwueTP2NabGtVrvHcWa
	 a4ucKru2uGdfjB9dRtwKG1tS4vtiFG2u/iXtNf6TIbZd0TSsT9LUtmrH4PeYjTRxX4ZNJ
	 aTrfUAII3Xi7ns4mU9NqWJ9G8eUK5EXI0tFqeFE65+MrMAdsYH2bZstgGW1exViKYeWIk
	 x53VFbO5ttmEIh4UG0aHj/LACCWvRABnos7dQQ5a+f8NLEDfWnANPMHsCR7Di106DdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=omRFy0cHyVLNWnAUCIu2kHA+eYvWta9ISAt1zEqsNXU=;
	b=iETzKKNEcaSLClCoOkcJPCOkTx6FnzK+QgIshvj6hdPaciY3pjgt/oiyWvbEck4sC782
	 vKny02i0BDyS1gq/xQpJR4cljnxpkxEFYkdlRqCxTbeIfts+ySginiziS/u5WOEemluoX
	 7ujKZuF+ZIZZOmPoS2uI4jr+FViyUWYYh7IUmAZ4Yfcodvtx4tqQTvvCe6Q3Bck0No7cQ
	 qcXP99dJbomuNjKUKQRCiFj7axils9BcUR20QpF1snVcNvtvJT+agqlpQ3SKQpEM/0TNx
	 ft47vj+ePPLzZXBT/eoKgNcMyXs4cCw7UwSYnJJdOdmNtBoFPeiOX/f1XBCy5nQK96w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P+zg+FTZ;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5D5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F5D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P+zg+FTZ
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-369f33df08eso3682183eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793043237; x=1793648037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=omRFy0cHyVLNWnAUCIu2kHA+eYvWta9ISAt1zEqsNXU=;
        b=P+zg+FTZaPnoLv3sNo3Rbrq7MdxQMEVlG4sFYf65DZsur9eCwQNFm5khndSy6mesI5
         vskp7JWhmWSdXu3gbApqryLbJFOioha7qtwWilDIkY7409gVpaFofUaAtcpXpnoOzOt2
         N5GOI+HL/QJCkiw6Quy34+PL7Hsoo+RKYsGV1JnXNr5W0DWXuMtVlJmTkGkO9BpychpK
         Zjzt9++Gtj1IlwNRP/demXiZN2n58CGFdCNg/xdeRqcSyz8L3MUfc7Bus54MuuxVfru5
         PxXIpegtD0koifEN0dhnGv/3kdisRxax7+ytQd7hfb28hOR7nfCLH9BVEei4X3yhWA3+
         ZG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793043237; x=1793648037;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=omRFy0cHyVLNWnAUCIu2kHA+eYvWta9ISAt1zEqsNXU=;
        b=OeNEQ4JV9PhexQxpu+Z9dclCZg1jAr2fszokaKH4rQvIy0GEjR2lkviVyOyC/Nk/L9
         79neNbJDe88ECeQz8Im3SCSWwpkVwc/nbzMsmOQ3XXKq9kQT+rbvYlSyntAZZhmji06B
         9ZkEiFRUEwRCFRWhvKHHybiri6hF9ImBqIrVFCy/2+EVKu0W+h9okXLqAFi07hbCRIsb
         zdbydfjjtYmPos5v/AVagLjPEiwX1WSOFj8dEw8bYGovjZqzFivCtKdGuNFjY8KSWWoq
         WdBEhShzxHZm/xR/BLZV88/lH4xJ+gY9h0SSjP34aBhY99mgJKUDabTtQHJviboPF2Fz
         hmgw==
X-Forwarded-Encrypted: i=1; AKwUvBy0LK0I2MNIBAOQjoNk+UI4TniOJLFPvN4wl3njhAnqd9GcxEEp70xHWCzjSPw1umuVvx605ZP+lhjexlQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/JiuNQJTB2457MJBpn5hg8FBkh+d9uPFGVK+X3oNrM8oLh0Et
	2eWZMVTKWsMZAJ53WKUK0bjUt/CQdhQI0uxe+5Hj5EE1pXqsPTiQVrvtHx7blQ==
X-Gm-Gg: AYBFou034RB5rMqTz9u+8r/i+zNNHU8Ylrv5h+W3F+F+8UAB04N8cEXYknHjXjINbwU
	WYg14wWBJ1NyQsPq+5k1XQCSagmHPBbhLO7y10S/hJQiUwCn/v4PIDIHvNEL0bxjMTdndHAhAsh
	+94NcQ/B3NuRK1C5hJGhTOLGZZw+kxWgms7EKSksK9rmVMysZYzQ/KC/nMncuoj5PvEacKmq++b
	90g3cZtU6rhToqzjEpq4PepbG26QB6VPznpP1GnfZGzrdAVMRBX3W2eQaFPygOlLBjsedqy+YVf
	aFbKvBwJ9yyq1oXsWhkFlkDmudNkMe/7vJv0OefPEyve/P41FFzOHJlNzEDLygFQbC+sPhCS7hp
	3gpbPg20fzgezHYCcFgZNsc1SO/DcC3OSoTLlsSMNC428RsdYV5UQgfihbqaVTP5m+W81FVOrnE
	lw8cgDUKJeP2cxMuqM6bKCH+uL9UPXyF80rLcvkl1aEpGd3WWHk57IPpf9MjgFe/NDlSj5TwTuI
	5jQ13awUJIoO+PA80yDF1gzan+MtLgeBTaJdofiI0mROXDyivti5KP/8l1WfKv1YFgsRXkMnDW9
	gXUmN3CHC+p/D3PXZnTwA7BtBH0omYgGGYQBX4Fv7qo=
X-Received: by 2002:a05:693c:60c9:b0:369:f72d:1010 with SMTP id 5a478bee46e88-369f72d12e9mr8594937eec.18.1793043237086;
        Mon, 26 Oct 2026 12:33:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm31461352eec.13.2026.10.26.12.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:33:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 12:33:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Remy Demangeot <remy@demangeot.net>
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (asus-ec-sensors) add fan extension card fans
 for MAXIMUS IX EXTREME
Message-ID: <98ee6ef3-5e5d-46eb-9a51-e732ebee540b@roeck-us.net>
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
 <20261026-b4-m9e-ext-sensors-v1-2-644d389b2de1@demangeot.net>
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
In-Reply-To: <20261026-b4-m9e-ext-sensors-v1-2-644d389b2de1@demangeot.net>

On Mon, Oct 26, 2026 at 09:57:36AM +0100, Remy Demangeot wrote:
> From: Remy Demangeot <remy@demangeot.net>
> 
> On the MAXIMUS IX EXTREME, the speeds of the three fans on the
> optional ASUS fan extension card (EXT_FAN1-3) are not at fixed EC
> addresses. Bank 0 register 0x43 selects which fan a group of registers
> describes: after writing 0x0a, 0x0b or 0x0c to it, registers 0x57:0x58
> hold the RPM of EXT_FAN1, EXT_FAN2 or EXT_FAN3 (big-endian).
> 
> Allow a sensor definition to carry a selector value, using the unused
> byte of sensor_address. When reading such a register, the driver
> writes the selector first and restores the previous selector value
> once the bank has been read. Sensors without a selector are read as
> before.
> 
> Readings match HWiNFO 8.54 on the same machine, and follow the fan
> speed when the fan duty is changed.
> 
> Signed-off-by: Remy Demangeot <remy@demangeot.net>

Applied.

Thanks,
Guenter
