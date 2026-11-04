Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823200;
	b=0SIqnRc85oxMqH9B0tU6mqetlkJ0QCpJ9OEHUnoDxcZlKRGVzrE7Xy8R8xAEOkv1VJAM
	 qg/mFCFLGzJggvNhWJnm3NkznM6M0bbI1M/pY4/15xw01iDk6MIbIdqf7WbiU9valFrjK
	 z9oIy6JrMzaLevQiC2hwvDYlALUAVkF3EoWxeOfRLK4ynC7U81e8qAP9jQmuuPv8m4haH
	 qcK4G0FapeSSyAwcMgurB3k//9tHu5+Ev0FS0X4Kbo3q68bYIoI8F9remoO9KbBG5wcRz
	 vpHKLtgUlBNnuU1yjM5tM8LEW02Z1IMgpeC5mu1Nrq6N5dkdl3wTTzcBLzi6Ta8BKlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823200;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=l6+UtPh7s91Oq/9lrFIlkEl/nlvsv6XRnee6JehK5lI=;
	b=VAMZRP9UAk8HtY7sexaEQZHlwuWQlRfX218KKiSyB6VpJbVb+F7VA/wjgCTrzhQmdIja
	 oPgEveorM22T1p71qLw26kYQk9mH6Ol9bi9j4MQR7UEPLIZzDkRG6puvhGYzBeFan4bTe
	 8CCULgpgX+hZG2CvnOZacLdVQzPyPhcQUomeGYyZgpXHNps8b99GCyMzXLLYmMUMMBthq
	 gb70+nfvzB/fk4+AbByT/G1vBG/chgt3fRoyKWea8Cl9CFcsiTU8b9YbotNKqu0h43cr5
	 wWFBtBXO11w6hmaJ6dZS7gAnVGXFvoqoJmHmgc+br6NOhZPuBqC+OqOPLL28R4F5Q3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=W4XoIwFe;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBF5606D836;
	Wed,  4 Nov 2026 20:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BBF5606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=W4XoIwFe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793823198;
	bh=VkmYakpqpnhkFxx0QURjLD3tnwFfJeC8t9xnwmwTycw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W4XoIwFepNaamhG5xYF0/u5N0OJgK0G+K/mAqwutqLaqz31z66kfhH5OujEswMwHh
	 ynluuDIORHxCS86AXtgBwaoGfEoggXDdSwCt8G8Tr7lfUYhHgAnzEuBu31HCU5fkYe
	 kW5ci2WohN3UZc4c2y2+ZRrKj0aynczuqEk0vkQ7Ugpbi0rWVVgt4xvy7zS9RwO9RX
	 Aj0eQi5qzyZMvkyeX85Kdfq1QIEf/ISVrQl3fScd9/Uru7pighLN8AFdDqBqTgYdQY
	 FydSS+GSvof9VqvZ6LHhGiyTPMXxpK6ABv2+87tWJek9PMzDOrXOKELMrm5aRBihSM
	 GtTIquTMYWyew==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 169C017E0564;
	Wed, 04 Nov 2026 21:13:17 +0100 (CET)
Message-ID: <cd6321bf-9737-4949-9906-c0206e54bab6@collabora.com>
Date: Wed, 4 Nov 2026 22:13:16 +0200
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
Subject: Re: [PATCH v5 04/15] drm/rockchip: vop2: Send pending event when
 atomic_enable() fails
To: Daniel Stone <daniel@fooishbar.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Stone <daniels@collabora.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com,
 Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
 <20261014-dw-hdmi-qp-yuv-v5-4-6fab0fe43a9b@collabora.com>
 <CAPj87rN1rzjDMPvVJytwmvHGipCCuYOyX3abTRqYp4Vq5PyrYQ@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAPj87rN1rzjDMPvVJytwmvHGipCCuYOyX3abTRqYp4Vq5PyrYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Daniel,

Thanks for reviewing the series!

On 10/30/26 1:21 PM, Daniel Stone wrote:
> Hi Cristian,
> 
> On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>> vop2_crtc_atomic_flush() stashes the CRTC completion event in vp->event
>> and relies on the frame start interrupt (VP_INT_FS_FIELD) to deliver it
>> later via drm_crtc_send_vblank_event().  Since atomic_enable() runs
>> before atomic_flush(), bailing on an error path makes it skip
>> drm_crtc_vblank_on() and leave the video port disabled.  atomic_flush()
>> still traps the event in vp->event, but since the port never scans out,
>> the frame start interrupt does not fire and the event is not delivered.
>> Userspace waiting for the flip completion then blocks indefinitely.
>>
>> Note the event cannot be flushed from atomic_disable(), as userspace
>> waits for the completion before committing the next state, so the
>> disable does not arrive and draining it there would deadlock.
>>
>> Use the newly added vp->enabled flag to detect this in atomic_flush()
>> and send the event immediately when the port did not come up, rather
>> than deferring it to an interrupt that will never occur.  This also
>> avoids the spurious drm_crtc_vblank_get() WARN previously hit on the
>> failed enable path, where the vblank is not on.
> 
> I really don't know how I feel about this one.
> 
> atomic_enable() is not supposed to fail at all, hence returning void.
> (Obviously, there are scenarios where it will fail, which Sashiko
> keeps 'helpfully' pointing out ...)
> 
> I don't like how this just papers over the issue. It turns an eventual
> WARN on vblank timeout - which surfaces the issue - into a silent
> false-success. Userspace just sees commit completion requests arrive
> as soon as it's posted the commit, so it keeps on going on and
> everyone's happy. Having the flips time out is a messy splat of WARNs,
> but at least that messy splat points at the exact issues, rather than
> the screen just going black and userspace blithely trying to continue
> on.

Ack. Let's drop the patch.

Cristian
