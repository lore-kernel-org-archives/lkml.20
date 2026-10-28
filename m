Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168178;
	b=UP7yqmA12BQPWQIMrc7+3mz6bCY3OzU0AVc2L27XE5RgkxIKo1I61yQRWNv93PRBE6HZ
	 c8k/Lt5mpeD/Cy48bNr0se3pLtWbSI0bQ+WFWs+WMaWjNuSl/EgqzHTXTEp17SrzWZOa5
	 WrXYH9Bl3gxF/CfGriJ7IKBAGuZy6pq0wsyT2jaoGxnBlCDVUuegV78M+Gm4Hyt75h1Ji
	 2U84Dwq/mfknLLs1v/CII0dxOtUTuDWyNaSYDo0mKKWu2eCrPBhTauni/OdUmZrCBIdMm
	 yqs6cB4o6aUyC2nXhButK4thmqjgYx3HMXsUeVq09WgVY3aNnut4qpDIyRqupTYGxPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=;
	b=c2rlo1xFrQ9P24Bw8IHnNWdLdVcuGToWxBSbTV3aSIDG5ss+UjkH9oH5Lq7J5xkxmSfx
	 2/1NsP847fmTrFM0xEoPkZCVbjnrnwx295LOFJB30UmXHVf2AqnaMFIzzBeW2EDt0kYTZ
	 T3hPMmhqbVvE/a5hHh/Lx6gg8eS8irk8ESpsxFkHZV52R+CZeWL5zbjEz3eRaFz/pFyeR
	 F/xIoJJpBhodz+5mbfALRa2FGL9zXTLYZ5J/7wW4gxBXLuGz26uRAL2h2ymA3bbGSyUwQ
	 G4itVRCIgWZz0Qusqg3omxWkVBnmI7Yt6AjnyAbznlX2CU4LPHpv2JRcAbLJweB4X+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xVrrS+rA;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7D6606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC7D6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xVrrS+rA
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4d648aacso594031e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793168176; x=1793772976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=;
        b=xVrrS+rA48dR++IWDoeT0yzgI8xGj6gmsCuXugY9JkQg8WgACbfDsXwKUBfsfE+oO4
         xWeUg+T12a7Bbfsb5wCcdiLCdoMQu5a5u77uLDQJ2AYHQiH8zXrGn9/9sXY008GV+gQR
         Rvf6zK1RU7ithcxnnEsZgKBC8J6OXzVYOYbWHsEVuUJS3FGX4oFYxfsqQyMBoUUaIJzn
         p5Gg4diO74fqYRoEQqGKbXmrpJGDvWGUg+MQpMwxlvGGVncK5E6Z9c3jw3DJOAi9sncu
         baKYmGIraPwobQ9M63jnTuEVNUa+cPVrVO+L33aJu2tm42cwY6MIQ2pZE5R883rrFRCg
         qSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168176; x=1793772976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=;
        b=RyA/ZeQPubRnYu1KO1w3m4pHSQlCm2rwf9jXDFYUIwlRMENYP0HKJQYkYO6NHgX7vF
         uaS7O3Yvpuz78lBzQ6bGE89P2u/JvSB3iAob0ZbvR4y/GWkub/0rvKZdbmwbZsp+cHSC
         0YJx3eF0BnNlRVxmdvm9RuARe66e1Q4NOhXc1Z2+IHrGXj59O9Xuk15pHE83eQyF+OCI
         YCkJ11qXxXZTdl5cJy9Qt6q5h3A0NupaQqyWCHW1Xf+CcwnEcVR7IS5lbuuLi9MIf4ao
         ZrNBWW/bDKlzYF7RemJG7HwaJMCQB6AnWA6sFCU7Juq0y1TnfcZa28MeMhC35wpbeB6Y
         XXBQ==
X-Forwarded-Encrypted: i=1; AKwUvByNjUZPoTp6ujAxSVZ9hVHFZXNW02ZhIzvvtbm8zCaf6QDg45FPcnFiDUlP/TN+gMCp1ohfIl2/8mM3zsc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkRMYhaes7kSJEfReOoR6Dd4Y2VTsl3l+OTfOFtBXVWcXB1dfJ
	E0rhT1Im1z3DvN5l3uvmch+T6T0TC299TSD2h7wIv35eYztx/2/c15mO
X-Gm-Gg: AYBFou1MhXGj+J14H/BPK4V+P5RN9hE9+hcrUqMEdgBDXR9BtnXIt55knIGH0tMdyeF
	kwbyBzpKXkM1b+X0zv6XDK4H3kwVgnhYfGQ3QP4uk/IwP5QzPWde8/0cTRsZgfktJ0yWnZ43gqa
	mxc4rDcheOxLhHnDH33iciEzvveWz4uzPArfZvWFPcn4JuxFkCUS6jm3gSsg3Txbv+q4dFJpYZF
	mOU47SVbu1TdoXv8uJMPkmpGR6qG/nP3EnByBYuqlNwihe0Nu2YDETUIfg/8XE5XTWvJezufCDF
	3Hsw5E14jRmjlCbA9PBztXIb4TpcstI+gEcwizrHTe/lXHdms4x7dx2Wbe5DUKa7VPSBLMyoppt
	KripPOReSk2Vss8S+8lzAcKSQzmpDGci/cU8jWWXrlqeWiypQz1xXY8NDhiE/YQcweFkTU8Pk5f
	ZfEmtJbxsju5eEkNUJs0Uf3rnVGMCtpFO0s5SwQ5S6VM08a1OcpG+3NXHDu6wifuvAATqE3ZPgj
	cm6Pg+O6nJ/KW9uTP6NSKOukoz/J7xlDbNhy1puBk7QMUfVByGKERTbj/3e3XfV4j4xjvhx+tBV
	J0PD3NZbjHfFJDRGEYBl3BcUUnrUm0MNjR6b2ER2AjsUjyIp4kS5BWtlhU6IzVTyDZZEPXLh/9n
	hcBz6yJakcA==
X-Received: by 2002:a05:6512:3a82:b0:5be:4be3:bb8f with SMTP id 2adb3069b0e04-5bfcad787eamr578392e87.19.1793168175751;
        Tue, 27 Oct 2026 23:16:15 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca47f9f2sm400912e87.8.2026.10.27.23.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 23:16:14 -0700 (PDT)
Message-ID: <9e9a2f4b-b6d6-4faf-95f2-e227b41d27eb@gmail.com>
Date: Wed, 28 Oct 2026 08:16:11 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] iio: accel: kionix-kx022a: annotate the lock
 helpers
To: Rupesh Majhi <zoone.rupert@gmail.com>,
 Alex Lanzano <lanzano.alex@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Benson Leung <bleung@chromium.org>, David Lechner <dlechner@baylibre.com>,
 Guenter Roeck <groeck@chromium.org>, Jagath Jog J <jagathjog1996@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jinseob Kim <kimjinseob88@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marco Elver <elver@google.com>, Bart Van Assche <bvanassche@acm.org>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-5-zoone.rupert@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261027124954.110697-5-zoone.rupert@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2026 14:49, Rupesh Majhi wrote:
> kx022a_turn_off_lock() returns with data->mutex held when it succeeds,
> and kx022a_turn_on_unlock() releases it. Annotate both so context
> analysis follows the lock into the callers.
> 
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks.

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
