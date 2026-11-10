Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312489;
	b=4GTmbEqMqEFCry3Y9H0+jLh3GzIvqCD/TrGy0NG28EP+u1rjKTGeQxrwdRUvkeT5N3Tu
	 AH6+gHBza132wGMxLFOVvaLhM39Eg1eP7ROVYHtKsehVHM87F7L7r01+ry49wMXkUu3JJ
	 I0sAmrqWPL7owMU9hbgaTg+tA0swj5kpcfzyx0ciOi8MKYSobAVDtYPCNJAM3Y2oJA9Z+
	 mXdnDa4sL1N3CjiPqVdh7N57exbZ8r3mNq7nBmsCZWMi/8c3/m2XaZkTS+hPSecPWBzih
	 S6QqK/RBSkqzqtr0eQB1i1rFuo9yiRfJagfeBtdTs/v3C5Dvwm8pm8mabVSvUM5UJLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312489;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=P8/heUieETMGb69SCBfFmn3mVLIEZOk6McxUDGUu/Hc=;
	b=HWhFJWqu30Pknl/fKOzMhIsil6hexJLontQhOK41PQSLJADgEcEetzZ9lx0lO8P+eV9m
	 mmFn0lfNbHdzUkE5cv8OvDZ8HcSb9TiuvuXGHPu7+FDIYgXVOBGtk6J2Ek3Y6Db1Hbpl0
	 eYZqwKnz7A8ElUcp/YSM/z+tNVZ0JYqeqLpPCQgcus40iGEHz0g7itvRdbHq5jZ/jmV7P
	 llW6FLI/akq4eoiKkzgh3bbb8zsEoOubJ2nMi7pcq4tMMJ/nhKRetIh9+eKDIrcNV4mhR
	 KO7inFkBiOoRR8RlLhB95NiaOCawy07OpGUrrF/XE1R34dlGACkqXfPsZC9d3YFPWdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzTxeCqd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF58606A335;
	Tue, 10 Nov 2026 12:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzTxeCqd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FF21F008A3;
	Tue, 10 Nov 2026 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312488;
	bh=P8/heUieETMGb69SCBfFmn3mVLIEZOk6McxUDGUu/Hc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=WzTxeCqd3wC1uQMrpFJSIL3pB6ktt9lIlookmz8twFXwIy7+UCraXQWjHD4lJ+xmw
	 cmBf2Hyd8uKI5w7VlLlmJIkiLejTmimtw5v/wyVNz5uIBxhhX3tBnfxpc+CqFC2219
	 FT0S93pFDxIeyiRAFTjQ+9CnutVrRBl1zWcQT5pS9uHuFOUPiHSHaP9pXFwabUmpDi
	 AxwvIkgHOIw6FPmR1RM8M/JWSQ9w+tnzvjNO50x+Nhzfq9CsqlrqQTz45EnE7VRWoP
	 4Hr1WV2f8vLiFxSEuoERl+rZ+DLd7PxiZT6ell8XQrrZanum7/slOk9uQjUNA0Ryt5
	 QAPE6/fw/blyw==
Message-ID: <685c60fb-f209-42e8-8d75-7e65ca5353c9@kernel.org>
Date: Tue, 10 Nov 2026 13:08:05 +0100
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
To: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <xhkdby0boob5n.fsf@mkorpers-koolstof.csb>
Content-Language: en-US, nl
In-Reply-To: <xhkdby0boob5n.fsf@mkorpers-koolstof.csb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/2026 14:26, Mattijs Korpershoek wrote:
> Hi everyone,
> 
> On Thu, Oct 01, 2026 at 14:55, Mattijs Korpershoek <mkorpershoek@kernel.org> wrote:
> 
>> On media-centric camera pipelines, every entity is known at boot time
>> and described statically (for example via device-tree).
>>
>> The V4L2 framework assumes that every entity of the camera
>> pipeline is always present. This is a reasonable assumption for
>> integrated cameras in laptops or phones. However, in automotive systems,
>> cameras (e.g. rear-view or surround-view) can be damaged or disconnected.
>> When the framework assumes all sensors are present, a single missing
>> camera can prevent the entire pipeline from operating.
> 
> This series has been discussed at the Camera & ISP "unconference" in
> Pragues (during Linux Plumbers)
> 
> The notes can be found here:
> https://lore.kernel.org/linux-media/20261021224119.GA383235@killaraus.ideasonboard.com/T/#u

What is missing in this discussion is how userspace can indicate that it
actually can handle partially instantiated pipelines.

Today if one or more parts do not come up, the devices nodes are also not
created. This is typically exactly what you want. But here you allow partial
instantiation, and how does userspace signal that? It must be an 'opt-in'
mechanism, but how is that done? There are no devices yet, so that can't
be used, so what alternatives are there?

We've been discussion Fault Tolerant V4L2 for many years now, and every time
I raise this issue, but I never received any proposals.

This must be solved.

Regards,

	Hans

> 
> I intend to rework V2 based on the feedback I've received on the list
> and at the "unconference".
> 
> I'll try to reuse Sakari's work on media graph events from:
> https://git.linuxtv.org/sailus/media_tree.git/log/?h=partial-reg
> 
> Thanks again for the feedback I've received so far.


