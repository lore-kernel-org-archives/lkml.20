Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663225;
	b=Y8B+ezVNaY+C/KUuomrUFW/eSkafe13FIR++iD06vli0mVip3JZPGTf95babC85pcDZV
	 xa9WrSiZh+pSd+alDZap9g7laviooqXp1LzWNEgwJKlv1kzPi9MawwlGCJFzyBUHt5gzE
	 ZxSLb6fzcNDAHWaQtj5txxP7EKaR5aRqzkbI9Ull1OXNVsWovhTDxIakBAwfo2lIYopTf
	 2DqXXSumwQYVx25fSL8C+EnMj7QlMdfotrADeDRepOWnKetct3luxR8qlJaZ2o7zSaWqW
	 YGK6+ShQtgaiwZ+ACbew2zndz8NH7w4s5heBFLeIvLUwGvrpNzoX1laXUdasNKmNzpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663225;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xUUKB3dN+DcD4bi7XLmaUTdpOWOpoWsyGlGpTHaPhoQ=;
	b=y+pvBps+H4p1/819TVmdNzKCSub59LUc4xSagYNCbRE7U6YQ4oAKUqCcrM6wrklWvJkX
	 j3ZdBpI8F+ddxWrQXKecJN96EUpMamqxVhWL8vjNs/BBawvWhh68SYY/2WP5whhP8+cK0
	 dDdZZ0lspzHfdJy6S6dU967F71uBm6k9Ao+7LwewIEZnbtuyAJ1MKlSIl/Il8jBXvLXI6
	 PatwnqEnbV+liKCbpYbPTt8d2xcVcM+KzGPFz5ycKeKxqRTTXFX+HOJRievw/asvzLTKk
	 s7LOJiDtqDy1hdofYLLIT9ui/J7lyITsFJJN/IoNmg0LgTDVW9fp2yxZ1prBlLbIHcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BFB606A324;
	Mon,  2 Nov 2026 23:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C35C1F00A1E;
	Mon,  2 Nov 2026 23:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793663219;
	bh=xUUKB3dN+DcD4bi7XLmaUTdpOWOpoWsyGlGpTHaPhoQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kU2nRNlid4KU7wLrelnWxdd7c0r4wqEYroQBqsOZYMI65h+v+O/2mb3y0KhWEatzO
	 stALIuVsFV5znade7G7PymtnR1BzMmVQN8lBm8fkCLB+Dp0YA4XVjyBgeJ6oI4/g34
	 B9Kf8J+BH9sUvzW+Gd0HhWN8zmmiW5WTYaCVsPRWZubt9ZtMhuN5GJ/eIustVbmvVa
	 qZMxsxJDMrQiGeHeOBDdVhX6TsbxG6XZa8UqVw45ZE9SI66lEW/q+R5MyjiL/EL/rK
	 I0IwyOKfCmq74LSBb6ZFQG7xvxU6gx6AadKpGLESDzLl71EuyUaNjJNa6qK0NMxkg8
	 v70Jn/tUBaicA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id B4C512539370;
	Mon, 02 Nov 2026 23:46:56 +0000 (GMT)
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
Subject: Re: [PATCH 4/5] ASoC: sdw_utils: honor empty DisCo port lists when
 creating DAI links
From: Mark Brown <broonie@kernel.org>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: broonie@kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016232416.2628603-5-matthew.schwartz@linux.dev>
References: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
 <20261016232416.2628603-5-matthew.schwartz@linux.dev>
Date: Mon, 02 Nov 2026 23:46:54 +0000
Message-Id: <179366321499.2186205.4801577738150056288.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1903; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6YlooZfjzu+1oa+7B8k1+oMHoakogK8/1f9MxQ6BSaM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeKnz4ZOIocyZ48fPc5e0Wcyer6q6Xfu/vt+1NnHrSx
 GqWGeb+HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjI+VmMDNuFda4eZKrb8WZq
 3OmIQ/L/ZOsv5BZ21z27Z3x7f1+392aGf1a/XDb898lYKHlqberUr38We3PYPpH4uH+7h8SFi7y
 OF5gA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The codec_info tables give each DAI a fixed direction, so a TAS2783
> always gets an amp feedback capture link. The ASUS ROG Xbox Ally X20
> BIOS declares mipi-sdw-source-port-list as 0 for both of its TAS2783s,
> so the capture port has no DisCo properties and every open of the
> SmartAmp capture PCM fails in sdw_program_slave_port_params() with
> -EINVAL. The PCM is probed at session start, which logs a burst of
> transport errors on every boot, and the same failure is reported on the
> ASUS ProArt PX13.
> 
> Store the effective direction in each endpoint and drop a direction
> when the peripheral declares an empty port list for it. A missing port
> list keeps the table direction, so platforms that do not describe their
> ports are unaffected.

> +/* A DisCo port list that is present but empty means the stream cannot run */
> +static bool asoc_sdw_has_ports(struct device *dev,
> +			       const struct snd_soc_acpi_link_adr *adr_link,
> +			       int adr_index, int stream)
> +{
> +	const char *prop = stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +			   "mipi-sdw-sink-port-list" : "mipi-sdw-source-port-list";
> +	const char *sdw_codec_name;
> +	struct device *sdw_dev;
> +	u32 ports;
> +	int ret;
> +
> +	sdw_codec_name = _asoc_sdw_get_codec_name(dev, adr_link, adr_index);
> +	if (!sdw_codec_name)
> +		return true;
> +
> +	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, sdw_codec_name);
> +	if (!sdw_dev)
> +		return true;
> +
> +	ret = device_property_read_u32(sdw_dev, prop, &ports);
> +	put_device(sdw_dev);
> +
> +	return ret || ports;

A lot of CODEC drivers use fixed values here so would ignore the actual
value from the firmware, it's possible there's firmwares out there just
treating the property as a boolean.

There's also some Sashiko stuff on this patch that seems worth a look.

-- 
Mark Brown <broonie@kernel.org>
