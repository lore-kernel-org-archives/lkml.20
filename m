Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794659960;
	b=CqS/sq/ytKJ8lyvP5/sLeBQeaivVQ0v6LpQAv/5OZPQ5+5avmpxJRBAxzKO8dZWvAQIE
	 J/X2UvEptclcqPyTjIDsBw/CkbcuOdapByakPMd2kEqQa8hc27pR8Z9Pq3OKPOjUaFuOZ
	 mpBJeG33CUx/5pptN9yG3rf609NKIz4gJPCnnCoKkWBWO+achHDYYN9lk88aBuhwu7zUM
	 on1WL3YGXVkQcQKs3SJZJtLmhCIijZRhJMP6j6YNf6bNikkP+MaDTFIEcUswMNol3DnfX
	 mnqTqmxeX8We71iA04Q5Sfn9SiGtGG75ZhrnREBXeu6b1Q6LRLdQzMiiTdwoifDoxCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794659960;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8XEVAu3Q5YY9NrcU+7w8i+il8Oym5dFfsCVlgd1WOiw=;
	b=eGnLtbkB0gRc0yE8HYQp10191W2hpeNqI3Jhz4Pvq83X1Y3ecgBIYz+mhyd0fJ/ZkvGz
	 kNqwQu4yAEc7UbYXJrZ3YXM9ODEaS3iyi03UUWOuBXP8xu7cDwyljJOWn0ePOlhgzr8Rs
	 nLqc2uJAicga4SpAux1a1yyh+LZBUyyJmRWXdXd7TW5wl8VyMIsZklPhq7waOf9qZZxTp
	 Y1g6obJT3L8/e68nmRhXW+Cs+JzoHhIYow49992JiUxZWzv62IQdqMr0EHd+uJsToWte0
	 YeWkuUr6Hg2gWDGdI7Kz5oK+LPEp/IGlnXSS95Qa+ImZHickjS09Ey0zAO/3UYFv7rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AydWBabv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0813606A327;
	Sat, 14 Nov 2026 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AydWBabv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0634B1F000C4;
	Sat, 14 Nov 2026 12:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794659960;
	bh=8XEVAu3Q5YY9NrcU+7w8i+il8Oym5dFfsCVlgd1WOiw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AydWBabveP5xFhdWkdfaeXTnAtgjiCu0X9WX8UPy/EvYU1+m+EU8ZIogcTv8BV7hj
	 JuseC9/ssVWillY0oNyjtvMNfKa1bukl4aHKnEgmg2Clb1/5rmTuMy3LxIsx+9NQgB
	 fofxyPuHYP3ZHfesbcq09M7ZgNGXKzaoodl8m14paU4YTqVE0Yyh8dbjiroGzlow/K
	 eVdJSevs8bA2CP5ICJQD34S+epcziXqei9C7llN1nYM5VkyKhPU4WBC7uz67S2XP4e
	 F2/2scif2N9/aW113A7VidcxnDwbRGXmdvhch9f8P5YNRcAWNIl4OteOC9FDo1TId/
	 lAEnarg2W9Rgw==
Message-ID: <3a3f5721-dc37-41d1-8ef5-9a5fdbecc446@kernel.org>
Date: Sat, 14 Nov 2026 13:39:17 +0100
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
Subject: Re: [PATCH v2] usb: typec: tipd: cd321x: replay the plug on resume
To: Jacob Procee <sn125164@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
References: <20261112122825.7730-1-sn125164@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261112122825.7730-1-sn125164@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/26 13:28, Jacob Procee wrote:
> On Apple Silicon the Type-C PHY and the dwc3 controller behind a CD321x
> port lose their state during s2idle while the plug stays connected, and
> the CD321x does not raise an interrupt on resume. xhci notices the lost
> state and re-initializes the host controller:
>
>    xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
>    usb usb1: root hub lost power or was reset
>    usb 1-1: USB disconnect, device number 2
>
> but the PHY is only ever programmed from typec_mux_set(), so a device
> left plugged in (here a FIDO2 security key) never comes back until it is
> unplugged and plugged in again.
>
> Re-initializing only dwc3 after resume does not work: tearing dwc3 down
> also powers off the PHY, and nothing turns it back on, so xhci then
> times out ("Host halt failed, -110", "can't setup: -110").
>
> Instead, make cd321x replay the plug on resume when a partner was
> connected: mark the plug as changed and queue the update work, which
> then goes through the same sequence as a real replug (role none, mux
> safe, mux back to the partner's mode, role back on). Queue the update
> work on system_freezable_wq, from the interrupt path as well, so that no
> update runs before all devices have resumed and the work item is only
> ever queued on one workqueue.
>
> Tested on a 14" MacBook Pro (M1 Pro, j314s) with a backport of this
> change to the Asahi 7.3.3 kernel: a USB-C security key left plugged in
> re-enumerates right after "PM: suspend exit", where it previously stayed
> gone until replugged. Unplugging the device while the system is asleep
> also works: after resume the role goes to none, nothing is brought back
> up, and replugging it later enumerates normally. Booting with the key
> plugged in and replugging it while awake also still work. This mainline
> version was build-tested only (W=1, checkpatch --strict clean).
>
> Fixes: 82432bbfb9e8 ("usb: typec: tipd: Handle mode transitions for CD321x")
> Assisted-by: LLM
> Signed-off-by: Jacob Procee <sn125164@gmail.com>
> ---


Nah, making suspend/resume work isn't the job of the type-c controller.
