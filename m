Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794669139;
	b=E/u+9Al10CUZxSlgsbpBeEmO4W5vprWrRzelome6xxjvkGjyVVGZURl1puqrq9HLL7Y9
	 Inye6TsDnOV8uRw8Uwj/d82mUW6WqcWvfgx2V0Mcf82SizU0PQsfykfIvPnAulwZKxIB2
	 KDHHVwdHIAnscthjmHcw8KUy7AFxvlm7H5DoW6eM3MhXQB/spg49ifxryQUiIhHp7shHE
	 Ti41+woyW6QpcmB01mqVWmlFxMYFBUURGs7G9mdYvfJvX71dxw5kwKDcZ46xIQNgAAmD7
	 6yTRTKA+Ed5sceBRz4rrBLggslBhhf5TgbgsypRx4yza4M+dy+McEZCjmAprnup9EBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794669139;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=J4Mh59wCBbOdLONJLLP5gXzR4HnlAAyuG+DA6rar8+I=;
	b=MWHbzBsMIV6nORX+o0FmH3gC/yT1pqBjfmlL3q4FFshclpIUemsctFeBZEejGdHbWw5o
	 D271D0+j0+ccT778RaVSQvsfbPRQpJS0Yfz6lKRxAdK1CX2qI2eQ7T/ivfxYyfx+mN2Rn
	 zN2alqC63HRRj8TUuAol3nt7u9NRs1j8of8eJtAnVD3TH1Hmg1/L0eJATJKPbOZvtIcXG
	 nFvFBbgjp1max07eLUdwlOEb1R3egOs0Gj7aO0bE16W0qAhOeXPw6JRr9yhBg0vh2pB8A
	 VRkIp0dQVAIQatgUUhIf8zR+aOX1Ny/ZfWXt1/SBzVNN6GWNgx/ySp9gUtU17sBPx7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oNnF/5G0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651F2606A323;
	Sat, 14 Nov 2026 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNnF/5G0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF9D1F000C4;
	Sat, 14 Nov 2026 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794669139;
	bh=J4Mh59wCBbOdLONJLLP5gXzR4HnlAAyuG+DA6rar8+I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oNnF/5G0f8ZVmTDowRyOuysiZs4ERqw7jikpwQNByWSMk1FfbaLA+rGgxkpwgYJlj
	 I/UeK+QoOgMgFh5hMKMuooohguD6RHM3Cf4XQf6Ztqvdsb523ZvJBLOBpPnvAfF9a5
	 zhd5c6luJLjsU9LFef0wnT/ZJFq3JV40a51x2oVHuT8tWzQT/K0f0l7PO5pIX66I79
	 GQhHgVyK/oVsFc7zuDYsQy+7VC7qPU8JYuK4Xm0GPYbeOJPxB/i+elgbivkHARFqeq
	 Du9dMKYejZ6oF9RWoIoVmL7YksATraSw+NrzQ/pEchkQMHJ2dmkyYuyfLqubkinEoq
	 sCH2BIrzs47TQ==
Message-ID: <a8130750-0bac-483b-aae2-d1a3df20991b@kernel.org>
Date: Sat, 14 Nov 2026 16:12:16 +0100
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
To: Jacob Procee <sn125164@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
References: <20261112122825.7730-1-sn125164@gmail.com>
 <3a3f5721-dc37-41d1-8ef5-9a5fdbecc446@kernel.org>
 <20261114140053.0ad11276@nixos-macbook>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261114140053.0ad11276@nixos-macbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/14/26 14:00, Jacob Procee wrote:
> On Sat, 14 Nov 2026 13:39:17 +0100
> Sven Peter <sven@kernel.org> wrote:
>   
>> Nah, making suspend/resume work isn't the job of the type-c
>> controller.
> Thanks. Would you rather have this handled in dwc3-apple
> (dev_pm_ops doing exit/init on resume) with atcphy remembering the last
> mux state and restoring it in its own resume callback


no, the devices shouldn't be disconnected during suspend and you should 
be able to e.g. wake the machine back up by pressing keys on a connected 
keyboard.


Sven

