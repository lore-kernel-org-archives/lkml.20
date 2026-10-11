Received: from mta1.migadu.com (out-227.mta1.migadu.com [95.215.58.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542AD23817E
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791751408; cv=none; b=JwyEz3DJ8AiqRsam3k+0LRLEcJfA8XmjtoIQ4khsPvYnmeuUgUGTySXl4lwPoare/JGBOEcjA9UBk9irFwoynTvBGH3zIoDYReWc5CI/fXpJf026q0mgSYarZZky4UAHuO8qWMu4Eb4mD7dpc3SBdbibPh//9U+gOTILPuYrNOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791751408; c=relaxed/simple;
	bh=rqaA0XuWiDskP9yuqwcegfvbvYXBfuaFoAbZjxFS4is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwka9BYvD+DVJStAeIW1fSC+03+X9lgs1QQaNZBW7dMqfNla8D87ElIyTtW6XTPWC0BhGZcWo6p3qDJA2aUR2vjl3YkRG50Mp0yIkj9jcQ6QbfstqeqbrNfw9Ek2HAq6n2fW0xqFOOsErr0RlFC+TKXJ4eMyJfmSghVztulHw2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=F/+0Zmhj; arc=none smtp.client-ip=95.215.58.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="F/+0Zmhj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rqaA0XuWiDskP9yuqwcegfvbvYXBfuaFoAbZjxFS4is=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791751403; v=1; x=1792356203;
 b=F/+0Zmhj1z1Nxe891pHNxIFQxl6ZLKuxQjJ/S1GeoYNI04cReDkv29E2IZhawz95sRDUsrWY
 ji1Cw/u6zD969atYB+7KQHu24XEUuITa6E48MXGEsKFMyp6kiSrinZisukW2wyMDZ6BtlY3Xjs+
 zfAcBfHTGvTHo5JRHAr2kk0pbg9v3sb5J6+uODWdQq27JmJj1pczZCgcLPn7aNrTbKiWiOy71zi
 S6qg5un16aS1Qku6Lwsny8svrporRTgB6NYZukWFv4J9UfjYv+ySOgrlEXGg8pkbP5HFQ6ON9oR
 1mGCw1q4Mhrb5eMifNlNnrx+qOd8k5Yl2Dyzz9LxU6wBg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e9d61ac877c13462;
	Sun, 11 Oct 2026 20:43:22 +0000
X-Mizu-Trace-ID: e9d61ac877c13462
X-Migadu-Flow: FLOW_OUT
Message-ID: <c5051b9d-2657-4852-809e-37ce2839e728@packett.cool>
Date: Sun, 11 Oct 2026 17:43:11 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/9] drm/panel: add atomic state
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20261008-panel-atomic-state-v1-0-b157fddb8de1@oss.qualcomm.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261008-panel-atomic-state-v1-0-b157fddb8de1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/8/26 10:14 AM, Dmitry Baryshkov wrote:
> Panel drivers don't have an atomic state and so they can't handle
> additional data to be stored at the atomic_check time or to be retrieved
> at the enable/disable time. For example, it prevents panel drivers from
> supporting multiple display modes or making DSC being optional in a
> clean way. Drivers like panel-novatek-nt35950, save the connector
> pointer in get_modes() and later dereference
> connector->state->crtc->state from prepare() without holding any locks.
> The panels also have no way to reject the configuration they cann't
> handle, as it doesn't take part in the atomic check.
>
> The panel already embeds a drm_bridge, and the bridge has an atomic
> state which is property handled. Subclass it to provide atomic state for
> the panels. The callbacks can find the state of the other related
> objects (e.g. CRTC state to get the display mode).
>
> The atomic state is opt-in. A panel that doesn't implement the state
> callbacks keeps working exactly as before, with the plain bridge state,
> so there is no need to touch the existing drivers. The panels which do
> implement them can only be driven through the embedded bridge, since
> there is no commit to hand over when the host calls drm_panel_prepare()
> and friends directly. Those entry points warn and refuse to handle such
> panels. There are still a dozen of display drivers calling these
> functions, and the panels used with them can not be converted until the
> hosts are switched to the panel bridge.
>
> The previous attempt by Val Packett <val@packett.cool> ([1]), but it had
> issues with the API design, passing NULL for the state. This approach
> follows closer the path that was chosen for drm_bridge conversion.
>
> The series is marked as RFC as it is only compiled-tested only.
>
> [1] https://lore.kernel.org/r/20260425001130.233935-1-val@packett.cool/

Tested-by: Val Packett <val@packett.cool>

Converted my nt37701 WIP to this, temporarily at:

https://github.com/valpackett/linux-qclaptops/commit/a0a3a25e1ce484ffe072e4399014ced605c78852

Everything works as it did with my initial hacky attempt. :)

~val

