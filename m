Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271784;
	b=zxHVL7Aa8G/GMfsy+JSPnaK+BHRixml3LQn7sVZVyIUKMuJUZRuacfsGBxWZJrDVYJv3
	 IXYdLW4xYnxg0hWBwRwXd1mkuVlPBRb8BzXQZOspcdtk0Hryoa9gyVgv0cM9rCSQSWJo+
	 6E+aHO59EPzI63v/o2s2U0AFs5TyeHeQJx0u5GM/lRkC+dkcpU7aRrciu6PL/BRAY9iyN
	 uP7QxtPg2b7BbyiRFxWYwM8VgAF7y84Q4LxM3VKzS4OCB0quR4O7/GOVlOIp8CEYxSIt5
	 zMmLCu5bu/kPsmBvPN3e6uwih9UN5VWVKPx+R9kqYvqColTTG9v0rPFzyKP6SOKjqyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271784;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lqdjZkQwVXgTMSk1QocnJZhAE2sMU/4Mo4N5OcDK2FQ=;
	b=buOaXeXFr43SqTDJaB6Ys343YRlLjrmAIL29jTAEB1NS6FyGAXRF0Cs0+5GS6E+0GOxO
	 WeWjsNJSeD9q09oenVMTUwXWFZQnlqnh+fYnUdfY8KopCZRygtTBNQ9hAyH52J2tLu32L
	 TutvQ1WmhTUoEWxfDI5e94R4vKA61QrujiJKBO9Gmg/blt70hEpXXvk9gUz7eGdlz4jEX
	 2mddW3H+U3qqMeYuBiqNMbEl2PqEpFOxn+/r5RF6Q4BC86zLYvIfs/Z69vVHI5mE9w8LQ
	 /5G+eVc9seZ1ws0ivnPe9WsA1ygL6UoWmzPerS/G+SXsXI7UrE54V3Oxq4brzhmiJXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MdlFVKzu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6676F606A31C;
	Thu, 29 Oct 2026 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MdlFVKzu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6951F01828;
	Thu, 29 Oct 2026 11:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793271784;
	bh=lqdjZkQwVXgTMSk1QocnJZhAE2sMU/4Mo4N5OcDK2FQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MdlFVKzuWxOxSjNjAhnFHwPZSKwPu5DlnspZZDlB0/cJmbVUI+7dUAXHJcsUW2pPb
	 3wLgn9zUorPGJNR4YgijvuBCkqfz0wmaR1NLHrTH+50fiHo9vx5iT1682o0qKET4J+
	 5PLKVBtfJJnwdtRit0dsHNmfyBzPkvN/VPmirZM5R9NfuC8ppWwrYM5xQPuSEzu0l1
	 +xZhdpSEbo8k3dgPtmHi35AzoOXVtHjLAjruYIiQl/1fya5kQKNoIvPs5a2evjEHoV
	 rv6b2t6D/WWkoxy7tA0MkFAFM4dJJUT54FMBICT5N3KKpMqy/1y1+GNCO0AjfVoDGU
	 /lz+sftOX6tjQ==
Message-ID: <8a675e45-eed1-406c-a503-e1490d10b638@kernel.org>
Date: Thu, 29 Oct 2026 11:03:00 +0000
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
Subject: Re: [PATCH 01/14] media: qcom: camss: Introduce CPU latency QoS
 during streaming
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-1-d37992559c58@kernel.org>
 <C5h3n3GoAvX7tdfEig7r4z8hDirrcGnY7QGp0x-H3DZbiSXQh2wMHxeydOkYcYOIARD07F7-bhic3uHlUpkgxQ==@protonmail.internalid>
 <CAFEp6-0H=9=KM8eiJ690GEgpCqPKe3034gGLJbz4RrVxHP28bg@mail.gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <CAFEp6-0H=9=KM8eiJ690GEgpCqPKe3034gGLJbz4RrVxHP28bg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 10:10, Loic Poulain wrote:
>> +
>> +void camss_cpu_latency_get(struct camss *camss)
>> +{
>> +       mutex_lock(&camss->cpu_latency_lock);
>> +
>> +       if (camss->cpu_latency_users++ == 0)
>> +               cpu_latency_qos_add_request(&camss->cpu_latency,
>> +                                           CAMSS_CPU_LATENCY_US);
>> +
>> +       mutex_unlock(&camss->cpu_latency_lock);
> I agree that we need such a latency request mechanism, but the current
> approach requires additional logic and locking.
> 
> What about one of the following alternatives instead?
> - Move the latency request handling to the suspend/resume paths. The
> request lifecycle would then be naturally serialized and balanced, and
> in practice there are very few cases where the device is resumed but
> not actively streaming.
> - Alternatively, add a dedicated latency request instance to each VFE
> and let each VFE manage its own request during start/stop. That would
> keep the ownership local to the VFE and avoid the need for extra
> locking altogether.
> 
> Regards,
> Loic

yeah both of those would work.

I'll have a think about that, thx

---
bod
