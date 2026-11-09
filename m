Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248960;
	b=fZz+a1I3TObLTKqZ2lNIEtfFuwjnnFiI9NkJDq8lLc2vGalUJ3WUqVr5jRIJVu9GQ0wR
	 5wLJUxjHAKiGuHMvBdAmUnxzmWtQD/tgfr4pIsad2dRkkuHDKyouNVuqTricvg3u9ERcB
	 XBBvgjeWsUjjW4bficnC8kcfugkv3d3hBdzBTNefYgvYhjAP0dk08KR6GaXGe8Cl2E66Q
	 pX3RNQE3wnEa1r5AnInN+jsyrwermr10+ytdecJRQ8Qkqghel1J3ljvs6FTMDV4DWjtTy
	 gNCe17q5KtwWCOq7cYIvoNa1nQ77ohI7hT7q29mASQtt8J03d5QsgXVoci/MOIvZ2fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=U9tBWhRBh3Q/NIaZ7pvcEWgchBntJxEwV8o5plMJv5s=;
	b=KUKzK1uA0XV02m2SQGafhn7/zI/vllKMfZWBjVYtll/5S2tM4hbo0F7Vf4G7oVfJK/I+
	 URoGEjbhL6Y+eDACu/YiIYbnWueCLnLHZjJXqgWi5EAgqELYZHE+TWopStX5oyh9smte2
	 5+RjaNLAHA75PgVT+HwmezqENJ3DwXWuOQa8Ioh2+C8GNvoWywRY4RyVoV1Tyik4SHo7v
	 N6T/z1gJlcqyKo5GALFjmQNHGEfs+8n72MHKa7wJ6A/gmGim0WkGtQGmORx+eCgW3prD4
	 bzV1rvCb+kahpt7ydPoa5EG+bug4J68NJ//L7DdvqJT91pJNaik+vfwZfE/zGKhMxLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+g8qHTx;
	arc=none smtp.remote-ip=74.125.82.67
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB676070EC6
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB676070EC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+g8qHTx
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1021713c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248959; x=1794853759; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U9tBWhRBh3Q/NIaZ7pvcEWgchBntJxEwV8o5plMJv5s=;
        b=H+g8qHTx/1ABTl/J0fYJk8LmReb6tQX8eqOlhMogAupx8Y2+3vIn0oTm0tGGP3USEg
         MA79rIdUVkkQHJXzuMLCwiNGH03XRFTZ+Whl3gw4xKlMuZlAPwQyFzIPepp20O/9tdOB
         KO1p8a+HMsYkPSqgOKZWOdnuvMyJ5CNaLDPKYW+7pUscM02XbPSQKdNsKpo6G4voGoqO
         etYxNNkqRu2JxRmdlye1zTQpLJ1Ky7NmprSAuY1Qi2sxsYn6G2QgweRAAZUTpwEioysx
         9qNKmpiIRCgofwmFJkA6ZJe1qLLExTiwsj9Q1sIOpWgHuBNztIMr7nT6sdM6W+8SSeQb
         bF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248959; x=1794853759;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9tBWhRBh3Q/NIaZ7pvcEWgchBntJxEwV8o5plMJv5s=;
        b=Z+JAjIndOTu3NmCnNykMtskIxwYL72km5iCuembd6PwlR6Xes12qRTEG97ZAs9tL+H
         sU5PdYW1zzod+w4DlgJiO0B2wf/c0rgPmPv8xe5/Zdi4MIyYFupa85FY/Jyhj8AT9AeW
         pz6IUHPRHItr/AyYn3HM9X2D8m3CAnhBL3nxMtnv/k6T50qxfVHaED9RtszIfVFq5GWM
         FMceOphoQRBRjK976vAJEzbkBrSesLfQBuhS7NxMN7dLGmg33DGB4eSYpw62f4Uh75Rs
         s0um+LPA7jTFnDaccue8ZlikG/WKK0vRy3UDKfPw4WGQDFq+GVAu4/2qESld00fbCW59
         0oEQ==
X-Forwarded-Encrypted: i=1; AL+hErGqD3sOUxNWVkau/NU7R+DlyBuf8M2PwN9E1dEvSJVfuF4hj2oxMhoUnYWQuG0U4/6x84IUA5XYRVanPFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oG/W2EOEP5E6nXEwh+3FQVKadKwF7c0RDnGIWh6KWKa528+uE
	h0iT31m5aBdmII76PdK3Qw+Yy7VdVYO3LCpmqtqZt/XFtyA3bFRxf6Bn
X-Gm-Gg: AYBFou0CeRivImAXmvCQ6GDQ3CxLEYLH3Dh834wZ0yEQwtyVs4u/gBpCJscAM5Rc5ZH
	CdC5kPain8ojOHY4f/J8QQdMyIyCJcR1YqIhNnCEQWj66Bdk09T5LAUyroffv71sZUHAJg8W0q7
	/f4akgZVaRvlf9mEE0gzj9fLmbNeS5vh7r/SohuoIGJEdgPW0ZY3izscVRl+FUMOQjRgW5MP9bj
	Ngaqg3SXz6nEVuQbXoQDUJYRj1FbV/8WbzC7xxxrwmwnIorr5Gym+IBn/J6NKyhHYUYLsltOqJ7
	H1My6/juDHNoxLOcTOpu17ptU1EqwwmfoYhnQKEMXGWQV5qAQTJG2tY82HI9BFtBgoLtzgo1f+5
	bp0ywnOwstC71Hj/61GRrXJzRV9Q6KmPRgLvktztBDYVbPfHb/L8TUIRIkaH3g3bHHzdFeT6wdV
	wYWMITxb63M5ARlnD2WaVqBCWkZViC+CZQJaemA3L+EFvAOA9Qh6TpuMYpvNZo4sUkbaFFWFh+k
	wD9PtiEfTwaSqIRwdDj4ARQiULev9Ft8ucw/getUUxVK5/1NFnMwav+YhW84G1Z7lMZEn0Lap5T
	yf27iK+M2RL8pwYooK1mpdOt8K35iSzFlmBDdDcRN7gB
X-Received: by 2002:a05:7022:5f0d:b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b3b5e27137mr363920c88.14.1794248958814;
        Mon, 09 Nov 2026 10:29:18 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:67::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm684335c88.9.2026.11.09.10.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:18 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:17 -0800
Message-ID: <08dc804d3ce9bf9b8a1c0193ee7443c5@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
 sdf@fomichev.me, dimitri.daskalakis1@gmail.com, almasrymina@google.com,
 dtatulea@nvidia.com, bobbyeshleman@meta.com, asml.silence@gmail.com,
 daniel@iogearbox.net, razor@blackwall.org, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, leon@kernel.org
In-Reply-To: <179418737922.994134.6838913010792422653@kernel.org>
Subject: Re: [PATCH net-next v3 5/9] bnxt_en: set the netmem TX frag size
 limit to 32KB
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

> [Severity: Low]
> The commit message says:
> 
>   With 64K pages it lowers it, 64KB frags would otherwise wrap the BD
>   length to 0 with BIG TCP.
> 
> Isn't this a bug that already exists on 64K-page kernels, rather than a
> side effect of the new limit?

[..]

> Without the tags and a note about the dependency, stable kernels on 64K-page
> systems (arm64 64K, ppc64) would keep the wrap. Would a separate minimal fix
> for the net tree work better?

I'd rather keep both in net-next unless there is clear evidence that net
is buggy.

> [Severity: High]
> This isn't a bug introduced by this patch, but the same 16-bit wrap still
> looks reachable for frags that are not netmem. bnxt_start_xmit() writes
> every frag length straight into the TX BD:

[..]

> BIG TCP has been enabled in bnxt since commit b6488b161ab2.

Ignoring pre-existing..
