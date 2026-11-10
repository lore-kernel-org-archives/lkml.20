Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321843;
	b=JMwIb+ms/EOXW0i562Ykklou3UUHcPyfz7a0ABFTvregh5D3xEgU9hFFWm36MD5pIzzA
	 NgYy3+ni2AI+RNlnPIZizyyYRhB/xDlRUsdfnSxQjuve8uoojR9d9yCrVmWwY53HHYYV8
	 x/S8chdqPF3nicuwF7OlyE7tr1QNVz0S8eW3wa1sUJxNS3LybpTQ7gVSzDT0CyR+7l8FH
	 D7NO6/ygdvPodn6JuSe6B+yjp0V3SAZu0J3dHnMUgsKA0LAseTn+Vh2ACWxjjluZQo/yQ
	 DDY4LcxCWJS0dAbPIc4mC/t5wErBZFfYldqLA/w6g6qIzoqCX4tANXLwZzE9fSM2NPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321843;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gia8LhdESnYkbXhIwY1Vosv087dRAttescO8GIO7vx4=;
	b=hddP7JA6glZ8GzNtDT7ednRmDbIp1zeHen7IRyj5YQKgJrNM7HoVx91GYI6kGWGGZD+Y
	 Dv/oy6BOGRK6ldyjgZBI0ODW5EkRdFFpc1OXjzk2BGFYVc44Fz2E9+6TshTB12SKMOKSB
	 Km11TTNYEfeHiuVmImfjHheFY8pJW8L4RGKTxdnJ+yV2lAayrswcSk0wjCd/KMtTtNq6o
	 A/2WAhBnqvP0N3H8ej/N0lu9qitiD136Wo4IYiRTmaJNvAhD3WetFpA1A7QrWPgikre4K
	 jbjNJHJ1gGn/wwCUX9bDLlIiRS549Xc9U09OH740nKJxlhchQukCtLsiTIwxNM4jtmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1AHjRT6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998C4606A31C;
	Tue, 10 Nov 2026 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1AHjRT6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47ECF1F0089F;
	Tue, 10 Nov 2026 14:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321843;
	bh=gia8LhdESnYkbXhIwY1Vosv087dRAttescO8GIO7vx4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=b1AHjRT67qZpelhp9AkITROdM7TrDbd50xCsls1gixEEU601eqCIEVh/K8An+gLJi
	 irdCs5NPnV8sCAS36C3t1ngEn+sLxsbK1WkfTH4NqZd65VtfZ1LpPD7QUuZQjyeSjm
	 d5KM1TfX8ZdAs/J9GzGG5BQeP7dpRe+maWF+aV8yBxzVS+hnLgUsQYHsI6qOt6+loy
	 k6UhEm2iO/6UKzqFAAvcgaQq4Hnn+u7bzoZtvOwVLR+wY/oVjOJ2yNzf0rVTrPkNlj
	 ehs8iXKxjmBYJIwC9Oy/gHb5X9UW13HwcCl1fntQEBL7v39aPAFp8MKkyZ8Hz9sI46
	 hFsdlPkzUZLSg==
Message-ID: <eb8ac54c-a357-4378-8d85-d14855a094e8@kernel.org>
Date: Tue, 10 Nov 2026 15:43:59 +0100
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
 <5bb26065-d876-4ed9-bb80-a9567a369b5c@kernel.org> <avMgJ7MFks0sKD7T@houat>
Content-Language: en-US, nl
In-Reply-To: <avMgJ7MFks0sKD7T@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2026 15:17, Maxime Ripard wrote:
> On Tue, Nov 10, 2026 at 02:30:51PM +0100, Hans Verkuil wrote:
>> On 10/11/2026 13:33, Maxime Ripard wrote:
>>> Hi Hans,
>>>
>>> On Tue, Nov 10, 2026 at 01:08:05PM +0100, Hans Verkuil wrote:
>>>> On 23/10/2026 14:26, Mattijs Korpershoek wrote:
>>>>> Hi everyone,
>>>>>
>>>>> On Thu, Oct 01, 2026 at 14:55, Mattijs Korpershoek <mkorpershoek@kernel.org> wrote:
>>>>>
>>>>>> On media-centric camera pipelines, every entity is known at boot time
>>>>>> and described statically (for example via device-tree).
>>>>>>
>>>>>> The V4L2 framework assumes that every entity of the camera
>>>>>> pipeline is always present. This is a reasonable assumption for
>>>>>> integrated cameras in laptops or phones. However, in automotive systems,
>>>>>> cameras (e.g. rear-view or surround-view) can be damaged or disconnected.
>>>>>> When the framework assumes all sensors are present, a single missing
>>>>>> camera can prevent the entire pipeline from operating.
>>>>>
>>>>> This series has been discussed at the Camera & ISP "unconference" in
>>>>> Pragues (during Linux Plumbers)
>>>>>
>>>>> The notes can be found here:
>>>>> https://lore.kernel.org/linux-media/20261021224119.GA383235@killaraus.ideasonboard.com/T/#u
>>>>
>>>> What is missing in this discussion is how userspace can indicate that it
>>>> actually can handle partially instantiated pipelines.
>>>>
>>>> Today if one or more parts do not come up, the devices nodes are also not
>>>> created. This is typically exactly what you want.
>>>
>>> That's very arguable? We have plenty of other examples where we allow to
>>> show a software representation of something that isn't available in
>>> hardware, starting with virtually any memory buffer allocation, but also
>>> disabled CPUs, swapped pages, etc.
>>>
>>> For things a bit more related to drivers, things like USB root hubs are
>>> also pretty analogous. The "root" device will always be created, even if
>>> devices connected to it are non-functional, missing or whatever. It's
>>> the primary interface that these devices might or might not attach to.
>>>
>>> So it's a bit hard to understand why the device nodes not showing up is
>>> exactly what we always want.
>>
>> It's simply how V4L2 works today: video devices do not appear until
>> all components are instantiated.
> 
> Sure but that's exactly what we're trying to change.
> 
>> Most video devices consist of multiple devices (bridges, i2c devices,
>> etc.) and unless all are found and initialized, you can't capture. So
>> bridge drivers postpone creating the video/media devices until
>> everything is there.
>>
>> That also means that applications can safely assume that if a video device appears,
>> it is functioning.
> 
> Ish. The only safe assumption you can make about this is that it was
> functional at probe time. Anything after that is very much up in the
> air. If the device broken after probe for example, or if we have no way
> to tell if it's functional to begin with, that assumption is no longer
> true. So sure, that's what applications have been doing so far because
> there was no better way to do it, but I wouldn't qualify it as a "safe"
> assumption.
> 
>> If we add fault tolerance, and you allow video devices to appear even if they are
>> not functioning (or partially functioning), then that contract breaks.
>>
>>>
>>>> But here you allow partial instantiation, and how does userspace
>>>> signal that? It must be an 'opt-in' mechanism, but how is that done?
>>>> There are no devices yet, so that can't be used, so what alternatives
>>>> are there?
>>>>
>>>> We've been discussion Fault Tolerant V4L2 for many years now, and every time
>>>> I raise this issue, but I never received any proposals.
>>>>
>>>> This must be solved.
>>>
>>> Is there any way to? You're saying at the same time that we must not
>>> create the device, but that an application would need to signal to that
>>> device that it can indeed be created. It's a circular dependency that
>>> cannot be solved on a per-device basis.
>>>
>>> During the meeting, we had a discussion that the media device should be
>>> created as a "skeleton", and then as other devices probe they would fill
>>> in the blanks. How would that not work? Also what is your main concern
>>> exactly that makes you ask to not do that in the first place (or make it
>>> opt-in)?
>>
>> Applications today assume that everything works when the device nodes appear.
>>
>> If you change the behavior, then they just see a skeleton driver and how
>> would they know that they need to wait until all components are found and
>> it is ready for use? Or what to do if some parts are faulty?
> 
> I really think that this discussion is not solely about probe. It's
> something we discussed during the meeting, but I think we should try to
> handle "my device was broken at probe" and "my device became broken
> while the system was up" exactly the same way.

If the HW breaks after probe, then you get EIO etc. errors. It's very rare and
the only requirement in that case is that you return an error and don't crash
the kernel. It's accepted that if the HW breaks, the application breaks as well.
And you have to replace your hardware.

It's been working like that for >23 years (that's when I started working with
V4L). This also means that for >23 years applications have exactly this expectation
of how video devices behave. It's really part of the uAPI even though I don't
think it is ever explicitly stated.

To be clear: I really want to see Fault Tolerant V4L2 happening. It's clearly
very useful for a specific type of use-case.

But first we need a solution for this specific uAPI issue. Note that this is
now to opt-in to Fault Tolerance, but in the future we might have other opt-ins
as well that modify the behavior.

Regards,

	Hans

> 
> And while it's true that our assumptions currently deal with the former
> fine, we just don't deal at all with the second, and everything you're
> saying here could still happen.
> 
> So, to answer your questions, I think it's entirely application
> specific. A video-conferencing application would error out or might want
> to wait forever for its only relevant sensor to show up. A multi-stream
> dashboard in a car would just show a blank screen and show the other
> streams. I'm not sure we should (or can) come up with a policy at the
> kernel level.
> 
>> One solution might be that bridge drivers capable of fault tolerant behavior would
>> create a /sys entry called 'v4l-fault-tolerance' (just an example) somewhere.
>>
>> Applications that can handle this can find that entry and write '1' to it.
>> After that the driver will start creating devices even if not everything is
>> available. Without it it will just block (the current behavior).
>>
>> It's also tied to your use-case: for the same hardware your use-case might be
>> fine with the current situation (non-fault-tolerant), or you want to enable it.
>>
>> There might be other ways to implement this: e.g. a module option or a Kconfig
>> option.
> 
> Yeah, I guess that could work
> 
>> Also note that systemd opens video nodes as they are created. It used to use
>> v4lctl for that, but that might be integrated now.
>>
>> So that should keep working. I think it just calls QUERYCAP, so that is likely
>> to just work.
>>
>> Regardless, I want to see an RFC for this, demonstrating that someone has
>> thought about it. If you think this can be done safely without an opt-in mechanism,
>> then explain so in the RFC.
> 
> ACK. Thanks!
> Maxime

