Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976476;
	b=IW4ihNQSVs+tIOZSEvYvKzQcodfmz1wXZXPCxq3v56YHVtzxl0UEvjkTIV3FaecfHFh5
	 hkrEvo3aiUjs5wNQxtzacqf585UIJtE7osAz/GcdOPBgu0aKBtCihPRjfCXvbaItwLLZh
	 nNuMzm37B/zNDCwKGRzm/de/gRkwu2/2VPEKbSEM98rPiXVcqKlft3qqOzGoH3Vh/cHA7
	 MAk+HdwDFwQEAAOcxiYO+PZ+I1E3xyN87C2R4ySfT8GrMGlvt4YaKhpFF2Q5uio1qrY+A
	 afRVMskW24rhZY1YYun33IJsFL3uJ/qH+UsKA/kp9//uIk5g10mgf6qfCEo3bNTY1Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ETaVg+JKCksv0hVScE41Vy/yxIUDCk9MA46Sf7uJaxg=;
	b=Ii4WklyvCQfILZStyr5H4GlSvykOLA6f62LJln12mj2t9dt0uxr7BM01LMv1JiX1Kzm7
	 R3LIiM2Myob4HVxpzayfNkmbMrJjCPKbss+Re9QTdYILn8qpxMOk6NMI/pP8aekXKCgvF
	 XEiHF5osTKog3iWnBaDC0MsGQwZGfnnEPLksWwzlQyWcvpxvIUn6EcPLN52iydoet3VVf
	 OtZMXAOpFZZKMvAKAxcRlmBS6l26QVr/j2nSndEgeWfiTgsbPO2vznvyJAqFTKBoP0zoh
	 Wka+XzAxkanKKNw2ImAPsZbr2QxB/6qI3wonIi5d5yu/PFq/APc0w3NjUBJq/KzrbFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JYGUz59G;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71154606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71154606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JYGUz59G
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a264b6a06bso924314b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792976476; x=1793581276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETaVg+JKCksv0hVScE41Vy/yxIUDCk9MA46Sf7uJaxg=;
        b=JYGUz59GR2IAGXxoiB3QNf8GkVf2fBELbswt2zzkZVtrkjTvYiwIr7neW8rK0w64G1
         8hozvQJCQ5Db+2Xqp/s5exrlojlPWTyKhBZAUnbPObs/GnRAVj+Xc3FvY8WPLXC7oD+q
         Rr2tGDWh/Pg2JjMVkUoj1cO5UxM8/RyJDOQZTr/BzBphFyM0hrXwkhGDudYHB3b2Ztgy
         vlWbUCpgDH3E2r4uLPIKK5rX+yF0PSS1hlGRIy/LMfGsFn9dL5gLVhAXGPuH2+vrZcin
         D3a9jItxfGcZElYsTBjaDBnr8U/qLYkKsdQchoqyDV8ULFwC3gfPNVll6kwcRZ59syb6
         2Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976476; x=1793581276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETaVg+JKCksv0hVScE41Vy/yxIUDCk9MA46Sf7uJaxg=;
        b=f9zC/+lUwTrsmhVLnzTeR8eJvtMrmHJXuKjjABb0M1Ncmz9yLtHun9cH6kf7IABJLx
         rXq4LXEEl8DgjLLKMk5K+FsFTXYJuysC+jKlk2mugyLKPFq7MAndfE1jpiXUxDHOqXHl
         zO6b7PX5DgcEYlYUWZPwL6EfxmK9ScpFCFBJgY2C2yhQDbKxy7PAcktWbR3uCUg1Sp5H
         8vFm0LEPwgjzS8yXxeq4Pv0fqHLlOmtQC6yNfGposS1w2I6eeAsD4alYfAzVlCwEZP4y
         nAAfm33Jk0baGbh+Azb354k/9WOI+7eqv2UD4vKzFLDdHtxi7G+1StnU+RwfWRHSjGE3
         mn3w==
X-Forwarded-Encrypted: i=1; AKwUvByPdvJjfZ7HKeKMUzwqu52X/TuAQV58OBNYHvtx1pxAEdZ+foExfJU++syd84oNcm3QRb38PZ5qnaoorvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJVaLwwhts8sfMxwN6Xj2YMw/xLtNKO8oFUxd5rjOdaEawnElf
	q0/CEtV4D+hd8z5dlxbr6dKReI/HwLFnwlYPiYwouZljjk4DjklorBX3
X-Gm-Gg: AYBFou35lKaljgXqmEBG8hE7Pxx9B/Onjp0MDvDW8DbuaKx5jCJ17wvBpaLxBC3WrlG
	UQJHqs77qjGwru4gntFcbJkUA0pLDgj9ptukROhYwejQPXW8bWjC+QvhCz28lQMHiwNxi2UAi7N
	NCIbYenLF/bFXT/INgqfjjHUEZGwdsW9025K8TyTLgu0vN0RKo2+nD3vvreAAED5ullGQYdqJ1m
	Fu4fL+YtMEsnfkt3HPnL7gPKHtb6rvqRVGDrR9rTMxcgwBFVr3JFSiQedza2zNcTjzilV7/H3FF
	sxo1Zfo47aqINVi7YW03YFGDA7dgnGLaAXm9OOJJz6oNDEnG8lXbGuU696r2iqtxqNhZl3qNdhg
	aYRIAVMVoswf4M7Cz93CawhliJpkr5hYpW5O363+DnjmZtWvh4zTEwm2vaaOhCF9o1XnYpe+dqB
	vs8iohtm+MVPSgUHFVlocmzYWwR13IO27tphZ3dHb/GJzjAU+CihyIx4pS6Mg4VUk8YJnv/wy/c
	sDMAjp1n79Niy/9ilF+SXqGCeLeoa+1L4IHZ0OmeYCrdKCSBhdznwiHmDiLR86L4Sj+Eg==
X-Received: by 2002:a17:90b:4488:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3adead4c649mr4370525a91.44.1792976475605;
        Sun, 25 Oct 2026 18:01:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32f70sm5974385a91.1.2026.10.25.18.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:01:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 18:01:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Eduardo Valentin <eduval@amazon.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus/core) Register the thermal sensors
 with a 0-based index
Message-ID: <f29d1bb0-27c1-4218-a022-9905f1af62bf@roeck-us.net>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-0-bfafba9fcc95@free.fr>
 <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-1-bfafba9fcc95@free.fr>
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
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v3-1-bfafba9fcc95@free.fr>

On Thu, Oct 01, 2026 at 11:47:39PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Since commit
>   3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
> pmbus_core registers each temperature input with the thermal core using
> its hwmon index as the sensor id. That index starts at 1, so temp1 is
> registered as sensor 1.
> 
> The thermal core expects a 0-based id, which is what the hwmon core
> passes for the drivers that set HWMON_C_REGISTER_TZ:
> thermal_of matches a thermal-sensors phandle without cells as id 0, so a
> PMBus device with a single temperature input cannot
> use #thermal-sensor-cells = <0>.
> 
> Cc: stable+noautosel@kernel.org # changes the DT-visible sensor id, no in-tree user
> Fixes: 3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied.

Thanks,
Guenter
