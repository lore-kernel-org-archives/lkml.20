Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487395;
	b=5FT1IIGn2TyvNVh791389WQLN99xG4bxdBBanJbdUX7wCjOpNJLPBaWrlLOqbB2OfXU3
	 JRh8rGOssB9NSaneXaxEx143k+d7RXITp2a+BkjRC6YYhEdeO1x648DjOj1MpQFBQ0mt0
	 nHKWUsTT+gU82VWr4h/HRomGADrDlB2bIIWGnytGkeCYfAIgVEhobDVHgGrHGZvW7N04p
	 y7YRYYmNLEHgHgYKPudqIBq/QLg15UhsMpH69MVOL62WvL19gfeY/xpAZ9TxbI5uLF0P6
	 gNhbJfO7rQF/QRWULQ06Kd0zUCDG/9xvYaF6qGrSWE3F5IZAa4xLweiZjsDwGf69r+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487395;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ADASvMr0ewQg4jG+yxGsHqbqUreW2oMoEC40mk7HqTA=;
	b=srCZeQ+zVf8b8Hbl70yBinFGtlH+qB6MqdRvGVSvjUeuBJcd9wRXoJ3WEh2ThZwkSG3W
	 4BMDLOF8BW55V8KMHVC8PYxHiZvi44PFN6YLg9iBX3RSlLZ2PgXto60+O8Hh4a9GHEE9J
	 D75ewLhd+2IXBKbTNFLHIcqi/tK980z4Wfj4aArssOPGdfGmTg0Glg7vGuk4U3+pEJxqI
	 B1cQ8D623Smh7HDOnEGa3e5ydVOog9ZXpc9OsKAxvBhA1AXq9zGsHuJWq3pX5FSvX72iC
	 HbBRngEFVBOgEXZaUABs0DZ4aj3YTb4cY6LJZUYCIrHvzfEU+9NYm1MoQMSqi6SRP8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KoZVwmzZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27983606A327;
	Thu, 12 Nov 2026 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KoZVwmzZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6E11F00A05;
	Thu, 12 Nov 2026 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794487394;
	bh=ADASvMr0ewQg4jG+yxGsHqbqUreW2oMoEC40mk7HqTA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=KoZVwmzZj0xJxI5HCehP7AWM7Vx5hGMex4NSS9nw1Gfai7xft4UeR96HvNus1a1Eg
	 GW53vB6RPEAvPg558EUOCcjiFyG5Pf065MbPn0vb/RI/3NsYpTuoXOEW9IW5xbvUOh
	 MZj5Fo/Jwwzr1EwQwRNnFRAyGtj+hQruNqxNZlm0MlMQMKnsQlWnVrjDAXj4FKaU35
	 nBLHcPsJnchGGqlLFFnQ1vdf+49Xw/t2mw4pcGIytqwHV66t9Y+0lo+hOQ2qa6gQXw
	 VsY9UmFhiHhLUBMblc+u47WTonMFEvmwCaOT+gpVxgJUog/6bXjzVNlxpXZ5PXwUJ9
	 8zu3RFvl84ZgQ==
Message-ID: <3066a335-12b9-4031-84bf-af851c8e03c0@kernel.org>
Date: Thu, 12 Nov 2026 13:43:10 +0100
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
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <xhkdby0boob5n.fsf@mkorpers-koolstof.csb>
 <685c60fb-f209-42e8-8d75-7e65ca5353c9@kernel.org> <avMM6a6xcDHT-zCR@houat>
 <5bb26065-d876-4ed9-bb80-a9567a369b5c@kernel.org> <avMgJ7MFks0sKD7T@houat>
 <eb8ac54c-a357-4378-8d85-d14855a094e8@kernel.org>
 <avWd9y7c1FVbUB7E@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <avWd9y7c1FVbUB7E@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/11/2026 12:07, Sakari Ailus wrote:
> Hi Hans, others,
> 
> On Tue, Nov 10, 2026 at 03:43:59PM +0100, Hans Verkuil wrote:
>> On 10/11/2026 15:17, Maxime Ripard wrote:
>>> On Tue, Nov 10, 2026 at 02:30:51PM +0100, Hans Verkuil wrote:
>>>> On 10/11/2026 13:33, Maxime Ripard wrote:
>>>>> Hi Hans,
>>>>>
>>>>> On Tue, Nov 10, 2026 at 01:08:05PM +0100, Hans Verkuil wrote:
>>>>>> On 23/10/2026 14:26, Mattijs Korpershoek wrote:
>>>>>>> Hi everyone,
>>>>>>>
>>>>>>> On Thu, Oct 01, 2026 at 14:55, Mattijs Korpershoek <mkorpershoek@kernel.org> wrote:
>>>>>>>
>>>>>>>> On media-centric camera pipelines, every entity is known at boot time
>>>>>>>> and described statically (for example via device-tree).
>>>>>>>>
>>>>>>>> The V4L2 framework assumes that every entity of the camera
>>>>>>>> pipeline is always present. This is a reasonable assumption for
>>>>>>>> integrated cameras in laptops or phones. However, in automotive systems,
>>>>>>>> cameras (e.g. rear-view or surround-view) can be damaged or disconnected.
>>>>>>>> When the framework assumes all sensors are present, a single missing
>>>>>>>> camera can prevent the entire pipeline from operating.
>>>>>>>
>>>>>>> This series has been discussed at the Camera & ISP "unconference" in
>>>>>>> Pragues (during Linux Plumbers)
>>>>>>>
>>>>>>> The notes can be found here:
>>>>>>> https://lore.kernel.org/linux-media/20261021224119.GA383235@killaraus.ideasonboard.com/T/#u
>>>>>>
>>>>>> What is missing in this discussion is how userspace can indicate that it
>>>>>> actually can handle partially instantiated pipelines.
>>>>>>
>>>>>> Today if one or more parts do not come up, the devices nodes are also not
>>>>>> created. This is typically exactly what you want.
>>>>>
>>>>> That's very arguable? We have plenty of other examples where we allow to
>>>>> show a software representation of something that isn't available in
>>>>> hardware, starting with virtually any memory buffer allocation, but also
>>>>> disabled CPUs, swapped pages, etc.
>>>>>
>>>>> For things a bit more related to drivers, things like USB root hubs are
>>>>> also pretty analogous. The "root" device will always be created, even if
>>>>> devices connected to it are non-functional, missing or whatever. It's
>>>>> the primary interface that these devices might or might not attach to.
>>>>>
>>>>> So it's a bit hard to understand why the device nodes not showing up is
>>>>> exactly what we always want.
>>>>
>>>> It's simply how V4L2 works today: video devices do not appear until
>>>> all components are instantiated.
> 
> I think I've mentioned this before, but I do it once more: there's no
> concept of creating device nodes at the same time. It may happen roughly
> around the same time, but not atomically. There's always a chance that
> accessing device nodes of a device exposing multiple nodes fails for a
> reason or another. It may also be udev rules used different permissions for
> different set of nodes so the application can only access some of them.

That's why the media device should ideally be the last device that is
registered. I think that is usually the case.

But even then, when e.g. em28xx creates the video device for video capture,
it can be used right away. Everything it depends on is there.

> 
>>>
>>> Sure but that's exactly what we're trying to change.
>>>
>>>> Most video devices consist of multiple devices (bridges, i2c devices,
>>>> etc.) and unless all are found and initialized, you can't capture. So
>>>> bridge drivers postpone creating the video/media devices until
>>>> everything is there.
> 
> That's not the case obviously. If you have, say, three different cameras
> and one of them happens to be missing a driver in Kconfig, there's nothing
> that would technically prevent streaming video from the two others: it's a
> policy.

But in that case you wouldn't create the third video device for the missing
driver. It's up to the bridge driver to decide whether to bail out if that
driver can't be found, or continue with the others and just skip that video
device.

> 
> And supposedly, there could be an application that *needs* all these three
> cameras to function, but does it then matter how that application is going
> to fail, is it because it lacks access to all of the hardware or just one
> piece of it?

That's up to the application. That's not relevant for this discussion.
What is relevant is that today, if a video device is registered, then it is
functional. The application can assume that everything it depends on is there.

And applications really do this: the video device appears and they start
streaming at once.

> 
> I'm in favour for making this reasonably easy for the user space to figure
> out, but we currently have no APIs that cover this (and so could be used by
> existing applications) so it's new behaviour that we're introducing. If we
> can't do better, then I'd introduce a Kconfig option, but I'd select that
> by default. I've seen tonnes of issues because of the current behaviour but
> no evidence creating device nodes proactively could be actually harmful.
> 
> So what I'd concentrate on is to provide information to the userspace on
> the device readiness status, so the userspace can figure out all devices in
> a Media device complex have been registered.
> 
> Functional safety adds the requirement of detecting failures and how that
> is being done is probably fairly implementation specific. New APIs will
> very probably be needed for that as well (and they indeed should be behind
> a specific Kconfig option).

Remember that there are more devices than just ISPs that use the MC: codecs,
various video capture drivers. Typically the MC is there primarily to help
understand the hardware, and the topology is usually (but not always) fixed.

Applications usually ignore the MC and just open a video device to start
streaming.

> 
>>>>
>>>> That also means that applications can safely assume that if a video device appears,
>>>> it is functioning.
>>>
>>> Ish. The only safe assumption you can make about this is that it was
>>> functional at probe time. Anything after that is very much up in the
>>> air. If the device broken after probe for example, or if we have no way
>>> to tell if it's functional to begin with, that assumption is no longer
>>> true. So sure, that's what applications have been doing so far because
>>> there was no better way to do it, but I wouldn't qualify it as a "safe"
>>> assumption.
>>>
>>>> If we add fault tolerance, and you allow video devices to appear even if they are
>>>> not functioning (or partially functioning), then that contract breaks.
>>>>
>>>>>
>>>>>> But here you allow partial instantiation, and how does userspace
>>>>>> signal that? It must be an 'opt-in' mechanism, but how is that done?
>>>>>> There are no devices yet, so that can't be used, so what alternatives
>>>>>> are there?
>>>>>>
>>>>>> We've been discussion Fault Tolerant V4L2 for many years now, and every time
>>>>>> I raise this issue, but I never received any proposals.
>>>>>>
>>>>>> This must be solved.
>>>>>
>>>>> Is there any way to? You're saying at the same time that we must not
>>>>> create the device, but that an application would need to signal to that
>>>>> device that it can indeed be created. It's a circular dependency that
>>>>> cannot be solved on a per-device basis.
>>>>>
>>>>> During the meeting, we had a discussion that the media device should be
>>>>> created as a "skeleton", and then as other devices probe they would fill
>>>>> in the blanks. How would that not work? Also what is your main concern
>>>>> exactly that makes you ask to not do that in the first place (or make it
>>>>> opt-in)?
>>>>
>>>> Applications today assume that everything works when the device nodes appear.
>>>>
>>>> If you change the behavior, then they just see a skeleton driver and how
>>>> would they know that they need to wait until all components are found and
>>>> it is ready for use? Or what to do if some parts are faulty?
>>>
>>> I really think that this discussion is not solely about probe. It's
>>> something we discussed during the meeting, but I think we should try to
>>> handle "my device was broken at probe" and "my device became broken
>>> while the system was up" exactly the same way.
>>
>> If the HW breaks after probe, then you get EIO etc. errors. It's very rare and
>> the only requirement in that case is that you return an error and don't crash
>> the kernel. It's accepted that if the HW breaks, the application breaks as well.
>> And you have to replace your hardware.
>>
>> It's been working like that for >23 years (that's when I started working with
>> V4L). This also means that for >23 years applications have exactly this expectation
>> of how video devices behave. It's really part of the uAPI even though I don't
>> think it is ever explicitly stated.
> 
> Do you mean things like VBI with this? MC was introduced around 15 years
> ago.

No, it's a general design: when a video/vbi/radio/media/whatever device appears in /dev,
then it is available for use.

With Fault Tolerance you change that: it comes up, but some components are not available
and userspace has to figure out what to do next: wait, continue without that specific
component/feature, or bail out.

That doesn't exist in current applications.

> 
>>
>> To be clear: I really want to see Fault Tolerant V4L2 happening. It's clearly
>> very useful for a specific type of use-case.
>>
>> But first we need a solution for this specific uAPI issue. Note that this is
>> now to opt-in to Fault Tolerance, but in the future we might have other opt-ins
>> as well that modify the behavior.
> 
> I'd try to separate the early registration of devices from fault tolerance.
> The former probably is still a hard requirement for latter.
> 

All I want to see is an RFC for this that we can shoot at.

Regards,

	Hans
