Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317455;
	b=4OwmweSg5a5Y7ER+nP3h0sUbMTJKK2F7CnRX7eo3C0D0WZ4lXDn/6mYNEeW5ILL/9ot4
	 XRIqn8nzGddqZO3YEw/C0hGFhdrWvTjrdjK6JZPJ70ajw1P3RIZH0xVaNSD8XdhOyhJXE
	 zJTL+NY7f1pTWaM6nYuLBj7IyKGMoVlgwUHxmA/PeCoVRRtVzuSqSFasxydA2ayo8OJS7
	 DYcEFjZRbzhpTk3Ijj4gdqCeUDJGT2JxJugMZ05ORqEzJcarANo057aPeuGkuzWJa2NaV
	 HQXloXMAgQTqVnuPbp7+RUZwT9UYEUg9Nz/HoC55CQbfwi0PblzuhpbW3f0NuwHv01A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317455;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SY5c0gY3hP74V7jRM01ScvNFPqsuwWzfpS3pFf8E/N0=;
	b=QIpXRyJX74GbYHy+yWvlshPeud0KKIvoZYDIq4q1/0CjVzGJ0Qz8UPUIetmz64WRsGfo
	 3THajpyBzi65lIDnu/XadDFeWL6b+VyRJ5PwcUUppAMouprVzOlSeowQ9OU7iqV738Ls2
	 if/p3eygkXjWjVXeYQUkVjTG5T1gd5DZdUXlcW4sFZ/hZ+ZzwCLKbIo+0uxSLU+Vp8Hkc
	 HTJyLniomiFXvTwfr5ylr6r6rd4mGoD6Y1aitYC4Sj3wVNOZB5bhLcun+KeI8pwyG5o2T
	 eo2Cb64eiGdU+lmeI9P2jmUXwq1GggjAKhq2gyqbkTmnywlHLPKzs1UDo7J79mHySwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ISMXptHu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFF2606A7E5;
	Tue, 10 Nov 2026 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ISMXptHu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A211F0089F;
	Tue, 10 Nov 2026 13:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794317454;
	bh=SY5c0gY3hP74V7jRM01ScvNFPqsuwWzfpS3pFf8E/N0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=ISMXptHubCg4IbFF4dkwvJ/vioGq7FP6sYlZFbC0LmlasricAOZ5fHZFAFuHobY8b
	 wEQXXynUsu2t4W3B4t3RE2rgQDH1A4OzRvOGTNOMOr1zl2Df/q3FHH38lKBm3Ik8ix
	 sjEgjEm+/mvb89Y6L+kdAw3nNjM12YDNJ6YvryGlu3p0ROXXzCI2Iri+hxP8/bbwLM
	 GvxgmGFory9l1hp1jQmrkkGLIBOWdupXUCqp+bFvXpj3IAEOc2IJa/836s8WEw/EFG
	 vbgHwXHrtoddShoSY3MKXOLTmCSjg2hSqJwvd670MNOy/pkcXf/9XrBbx8kx+KjYsG
	 V+FLTdNrBlqEQ==
Message-ID: <5bb26065-d876-4ed9-bb80-a9567a369b5c@kernel.org>
Date: Tue, 10 Nov 2026 14:30:51 +0100
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
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH RFC 0/5] media: Fault-Tolerant V4L2
To: Maxime Ripard <mripard@kernel.org>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <xhkdby0boob5n.fsf@mkorpers-koolstof.csb>
 <685c60fb-f209-42e8-8d75-7e65ca5353c9@kernel.org> <avMM6a6xcDHT-zCR@houat>
Content-Language: en-US, nl
In-Reply-To: <avMM6a6xcDHT-zCR@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2026 13:33, Maxime Ripard wrote:
> Hi Hans,
> 
> On Tue, Nov 10, 2026 at 01:08:05PM +0100, Hans Verkuil wrote:
>> On 23/10/2026 14:26, Mattijs Korpershoek wrote:
>>> Hi everyone,
>>>
>>> On Thu, Oct 01, 2026 at 14:55, Mattijs Korpershoek <mkorpershoek@kernel.org> wrote:
>>>
>>>> On media-centric camera pipelines, every entity is known at boot time
>>>> and described statically (for example via device-tree).
>>>>
>>>> The V4L2 framework assumes that every entity of the camera
>>>> pipeline is always present. This is a reasonable assumption for
>>>> integrated cameras in laptops or phones. However, in automotive systems,
>>>> cameras (e.g. rear-view or surround-view) can be damaged or disconnected.
>>>> When the framework assumes all sensors are present, a single missing
>>>> camera can prevent the entire pipeline from operating.
>>>
>>> This series has been discussed at the Camera & ISP "unconference" in
>>> Pragues (during Linux Plumbers)
>>>
>>> The notes can be found here:
>>> https://lore.kernel.org/linux-media/20261021224119.GA383235@killaraus.ideasonboard.com/T/#u
>>
>> What is missing in this discussion is how userspace can indicate that it
>> actually can handle partially instantiated pipelines.
>>
>> Today if one or more parts do not come up, the devices nodes are also not
>> created. This is typically exactly what you want.
> 
> That's very arguable? We have plenty of other examples where we allow to
> show a software representation of something that isn't available in
> hardware, starting with virtually any memory buffer allocation, but also
> disabled CPUs, swapped pages, etc.
> 
> For things a bit more related to drivers, things like USB root hubs are
> also pretty analogous. The "root" device will always be created, even if
> devices connected to it are non-functional, missing or whatever. It's
> the primary interface that these devices might or might not attach to.
> 
> So it's a bit hard to understand why the device nodes not showing up is
> exactly what we always want.

It's simply how V4L2 works today: video devices do not appear until all components
are instantiated. Most video devices consist of multiple devices (bridges, i2c
devices, etc.) and unless all are found and initialized, you can't capture. So
bridge drivers postpone creating the video/media devices until everything is there.

That also means that applications can safely assume that if a video device appears,
it is functioning.

If we add fault tolerance, and you allow video devices to appear even if they are
not functioning (or partially functioning), then that contract breaks.

> 
>> But here you allow partial instantiation, and how does userspace
>> signal that? It must be an 'opt-in' mechanism, but how is that done?
>> There are no devices yet, so that can't be used, so what alternatives
>> are there?
>>
>> We've been discussion Fault Tolerant V4L2 for many years now, and every time
>> I raise this issue, but I never received any proposals.
>>
>> This must be solved.
> 
> Is there any way to? You're saying at the same time that we must not
> create the device, but that an application would need to signal to that
> device that it can indeed be created. It's a circular dependency that
> cannot be solved on a per-device basis.
> 
> During the meeting, we had a discussion that the media device should be
> created as a "skeleton", and then as other devices probe they would fill
> in the blanks. How would that not work? Also what is your main concern
> exactly that makes you ask to not do that in the first place (or make it
> opt-in)?

Applications today assume that everything works when the device nodes appear.

If you change the behavior, then they just see a skeleton driver and how
would they know that they need to wait until all components are found and
it is ready for use? Or what to do if some parts are faulty?

One solution might be that bridge drivers capable of fault tolerant behavior would
create a /sys entry called 'v4l-fault-tolerance' (just an example) somewhere.

Applications that can handle this can find that entry and write '1' to it.
After that the driver will start creating devices even if not everything is
available. Without it it will just block (the current behavior).

It's also tied to your use-case: for the same hardware your use-case might be
fine with the current situation (non-fault-tolerant), or you want to enable it.

There might be other ways to implement this: e.g. a module option or a Kconfig
option.

Also note that systemd opens video nodes as they are created. It used to use
v4lctl for that, but that might be integrated now.

So that should keep working. I think it just calls QUERYCAP, so that is likely
to just work.

Regardless, I want to see an RFC for this, demonstrating that someone has
thought about it. If you think this can be done safely without an opt-in mechanism,
then explain so in the RFC.

Regards,

	Hans

> 
> Maxime

