Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5573142E414
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236034; cv=none; b=LujENlVM3UAxvp+VGhKvjqAWQYA1NW4nPiCeW6mrhcMv21Y0S9/Cqe3d30meiH6A9V1vgRVZ9FiRiSTs3aQsBvryCzARALgfqFFeLbDXRiZCSC1NQczMU6Z7jEHBkj1Giqeeq3oT80J3h7c5sNQfRPDS8ZxEPi7Ca7RwmuUsu1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236034; c=relaxed/simple;
	bh=6JRnYhQrVlmkOa4QLW2kD2+um9Bmw+qcOswsZZ867Is=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rThj66eP2lYf5Z2pA9mh4eC6ylMbALiLYQvN5eMT2pCkV6AuWPU+6pjG5K+iBdbbedOzZ56S2DRFjLwWGpbwJGrVtYeZaJRh10YuF7mpv1CrBbe6V6k3RD7WbfsmEPwgaUAQ4uziYWpQT9CwYkaAOu92/p0gbghikuz7qwSAqIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WSrjXKvX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GSNrswCe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WSrjXKvX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GSNrswCe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790236032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=agiy+hW/o2gOf7mZzT9kupJMq+eEEiW/AQJ0CIw0nXM=;
	b=WSrjXKvXQj9rKE0QACaD6TgWwIzQ0OtPieU8BxSgqUMJHhZIx/JwG5gADcmsymKUxmcKh/
	zJiLzbuShrwXEoSfyme4ZWOO1/yxElbfq+xgJ2PJy1yssmDHJB21G/UWrkuDpBXk7sfZWP
	TVeEqslXTKPH4gKfMSrSF4bNi1jAP8U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-O9BIg-8cN4yCFJM0xSmTEQ-1; Thu, 24 Sep 2026 03:47:10 -0400
X-MC-Unique: O9BIg-8cN4yCFJM0xSmTEQ-1
X-Mimecast-MFC-AGG-ID: O9BIg-8cN4yCFJM0xSmTEQ_1790236029
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4843227cfcfso404168f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790236029; x=1790840829; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=agiy+hW/o2gOf7mZzT9kupJMq+eEEiW/AQJ0CIw0nXM=;
        b=GSNrswCecW2OCKqaARxa+ZkWBhm9TYc8lBoss0UCxrslivZSRTZZErBSDRRv1DoOuZ
         ucQTeoWl42E6oPmAMphnt3tSIAR5C4L2CJJgfR8EwXF2dwYX/XvagxjKqSYa99p+Z36d
         w6F3+yfxZJeR9GsSolrZnbFTaPLvujuL+iS9MQfU45em3uxWUm37+d08CfkuX/5zhCIp
         Q0HVnFVN3gU4CHnRyNardpjBFHbSnOPTOvjZYYXQG4M1Y0ZZBz6wNnaOFTuwm5oljcIk
         bQe2rzGEpBc/815pnsDJiXRwYo2Fe5HWLccfL4vE8Y5xT3GYONAwaLsv5x69BTbP3Uz4
         C4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236029; x=1790840829;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=agiy+hW/o2gOf7mZzT9kupJMq+eEEiW/AQJ0CIw0nXM=;
        b=Sj4Nzj2jf2KiS0vMstUnfMww4DFAzlCt953ZQkW4SHom1yGptaXKysLeFwbvhpwZk+
         dfwvZNP+DgK5xY0gtjU2NAbGme++ZPs3P3lcj6buVyaDpCCXTdwmNxFxSVw456J1yUJv
         ssaZFkah5M6torJrhXOBeDm7VizNJz/hy8XVP4cU2SKs8zqiAG53rv9gueXxt85EFyqs
         tm/NfAfIGqWIAl1ZREBBHHsfZh72CTQmxayUXImP1lXYw/UxOqWxJj+xpiJ51Fop5frC
         vVKjP4qWkAfeoaIS99rHakQX+1AFRRupg9E6lK5rPboZS2OVTGTDzsUwde7ysdbNHWju
         vsmg==
X-Forwarded-Encrypted: i=1; AKwUvByRcbeBSnlkz2MQNec7mp48Dr6bMdjydlbKbIf5fShQnl6lMENP9HJrJnAg52tu67yuKT2B3XhdLpJ0IFE=@vger.kernel.org
X-Gm-Message-State: AFuF++nwZpDt+9Q1BjTu2x4XvXsWSNspdqOt/hiEh2SY16N1a9okwGwe
	71KDYw5XuW5T+g5PH/T2AM9Cmgt8aanqaXvDrVHcnqN6g+66ZrZx5wRmN5d9E9TSyznqfCuYMyy
	pjg4diszQtsvNjXCKAqiJhYj1Y6LXV0gyYWqYveYyPPWJli6xxc63z3Pu40zK5+v4FA==
X-Gm-Gg: AYBFou3xUZ4D+sGe3bfoOeqSHTyRGpmdb/ciSmVw1hW2bVQ44N8B5zSv+yPaLai1408
	AzENESCCSbR2OdPuNsRkQg0TH68WTc7zdvBtCIt1mcxadPS0LYJFB1dT6jDUMDoh7ajGYgCBqs3
	/tqXFOwwIOfsk2FpMWxBWTRj/Hd1EkHJ2hgVZ1pSmzhZTt6foBNBkuWvOsuN5wCEVnE4r9Q5G88
	DXLNI6lECO/f24sn+qvgE4g+IOEXuZHIeSM3zUsH0za3Pc4hed6SPKbdLcZRXVj9MCs4LfOjy0e
	14mvF+jthES1ewgGWIMtCObOjXjnJeV8x3J/j+nO0B2/6DUGv/ewD+e11pf3cMcCnd7PbO8WPpn
	TGdkU6eKjOru/Nh36gAustbxG8vOl
X-Received: by 2002:a05:600c:1d04:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-49fe66d0606mr23324345e9.6.1790236029325;
        Thu, 24 Sep 2026 00:47:09 -0700 (PDT)
X-Received: by 2002:a05:600c:1d04:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-49fe66d0606mr23324145e9.6.1790236028968;
        Thu, 24 Sep 2026 00:47:08 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cbd134sm49784545e9.9.2026.09.24.00.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:47:08 -0700 (PDT)
Message-ID: <78b8930b8de0ccbf8279637efd9c148395a8a4cc.camel@redhat.com>
Subject: Re: [PATCH v2 2/3] rv: add per-monitor edge-stat facility and stats
 file
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 rpm@xenomai.org, 	jan.kiszka@siemens.com
Date: Thu, 24 Sep 2026 09:47:06 +0200
In-Reply-To: <20260911123439.463052-3-tobias.schaffner@siemens.com>
References: <20260911123439.463052-1-tobias.schaffner@siemens.com>
	 <20260911123439.463052-3-tobias.schaffner@siemens.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-11 at 14:34 +0200, Tobias Schaffner wrote:
> +static int rv_edge_stats_create(struct dentry *parent)
> +{
> +	rv_edge_stats_reset();
> +	/* RV_MODE_READ is private to kernel/trace/rv/. */
> +	rv_this_stats_file =3D tracefs_create_file("stats", 0440, parent,
> +						 NULL, &rv_edge_stats_fops);
> +	return rv_this_stats_file ? 0 : -ENOMEM;
> +}
> +
> +static void rv_edge_stats_remove(void)
> +{
> +	tracefs_remove(rv_this_stats_file);
> +	rv_this_stats_file =3D NULL;
> +}

Very minor nit, just for consistency you may want to use the macros
rv_create_file() / rv_remove(). You also probably don't need to include
tracefs.
You can also just include "rv.h" instead of <linux/rv.h> and
<linux/tracefs.h>.

> +
> +/* A zero timestamp marks resets, which can run on a different CPU. */
> +#define da_state_entered(s)	da_state_pack((s), local_clock() &
> RV_TS_MASK)

Isn't this masking already happening in da_state_pack() ?

Thanks,
Gabriele

