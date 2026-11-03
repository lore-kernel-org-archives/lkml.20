Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793677343;
	b=txfp067hFBQONMDZc1YFLkn1sm3E8xfqKvO+IqDLeYpJ4NNDbT+6pygpHUd3p5I3j/Av
	 zfCITeKotIsElUla7F2ALh7DPA2VDMfZfRhyT4o8M1OVUXQEtfU5yaEeP8741F4oGNfHE
	 OOCBsvTYKIDao1cQ6DqQLCaokhtqNPRdHIgHA/di+Uf9sa8lp+lmwNQ2LkBClJUESS5o+
	 am0zPm1Vk3jz5coa+7l1zHkElZAdw3xNsmX+goT6iu90vOwHgyYD0Ho1hJLWA6YJG5G2Z
	 C1f3niS5W1SURLit8hcIOgH+UzS+NG/MIOX2qGtYh4L0Y2u2ebhSb+WWM+snAjIaKUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793677343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=9nkGRrHXD/BoXl+3MQj+4Zo1U2lVyFqfiYCzSdzJCpo=;
	b=JCeaFECpLmuzdEVHNS0Y9pswNu3pxDjkBqKMwNxvcoB+AcFY9yNQq7TjbDk/J139JelA
	 8wAUxpcUnnN3BvYfPUHWg3hfreCd2XWMVxUDBOqax1jA5GuCjCzwbRuRF01PulpQJDWnM
	 gz5tEGH2OEQeuz2HrdZ3T5oowitXuqEw0lH/Wg5H1pfZL2IPNhIz5DpAvXMn3eMkWYGtQ
	 Crr3A5kdskjyGf1reAEpKxnsGKwcihhvZw+UZyYoR57vHSCwm6ADF3FmRzS5PAThDgxBB
	 E1IG175J+RyKFRPZka1EVOAVCyXHaIKfK1+sY4J1HK/1VbKH12vCxmtFylNM/jqSXcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pmyHqbB4;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB7606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4CB7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pmyHqbB4
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so4832501c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793677342; x=1794282142; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nkGRrHXD/BoXl+3MQj+4Zo1U2lVyFqfiYCzSdzJCpo=;
        b=pmyHqbB4phFEM9rB6LTdXiyDtOxPEHXzN9nbN0SL5w5gfwAmVa69eam3dUz1uGh46r
         SCRGXzRfQOnSI6+2tVlOLnUHs6B4GN653gnoy0OOvJmRAfFU2bWR2AuIFEYJYaxGOfPw
         F5pes3mhc0UJH9nfteaIEYhLBXTXrS+Im1ony2LGmlSo6PbEC5Lh1a3Ik1aSXTfBcFE3
         cz8S9m10aMTORCCIb+oBofUfywqEk6tDTeDPhd1Igi1ESzW00MqAW4W027zXnig06Vbe
         5JgceV7h4RlzAsZMplZHgztrlwyOahhI5GaefTixttCD9ThWiuX9iFF3h2mSxWog6zZg
         bGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793677342; x=1794282142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9nkGRrHXD/BoXl+3MQj+4Zo1U2lVyFqfiYCzSdzJCpo=;
        b=TQxDYyJW4EM/gjrusejzB0hUiZGdkADuZSF3w6ShxBwq7LbGsMuZvAcCsMqkoADpxX
         76GRXMh3XhR1DFuiCph+mOyaeAUeyQAiU4l15V5C/wOIPTL8rtrJL1U88RZWikuWvggF
         uQB/f5meEvzvzbqFiTVgtns/4uVtDO9ZNBTFDBITCtKQqE6SyJpZxXo6ayO6ZZ97jao2
         NX1UjsrKvMFgjSq6yyQNwMYoxEfsECiZ+K1t80eJTQrzke9nJmyx3GrCv0TI7z805z+D
         htLed8U6REfdWXDBfNbx2+syNWAxp6fZf3PMfpO0wjdFHtFx+Vc5Dcg8QjbJ7IdKq2jC
         rmmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxr6A1u2bVZ3h2stFI6v53P6UFjvLuMufsIYjFEz0PpaaMzENKg2IMyjz3Zv1qi7RvuTw1VdTkSQuaXkUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9XlfodjabSUjDvmb9fAOQw1xR1aAyYgYYII1NlpfYfjYrYGIO
	aoYS2y8P3YD2HxqHNGIjP9NoDq/9QKIivXqrbohFd6MLBFVYH88e7Z8O
X-Gm-Gg: AYBFou3ALHdBlq8Szqh04bQJDeNpdARrDo7M7KVYSsNQK0tvsWTLneNrbSv6zAG25Yn
	9EugLL2xXJe7Z1fTMraOWcNn1MyjIX0OrtblxDKHf/5xMvQ4bNKEG4NVa+OAkYUdEy3pkMLyrDp
	N7u/Jpot4U6fFuEKKAq8bF01tVBjIkDNs2h9MaELQbSlzKRz5b2xNzu2h0rYkZGzty1Qu0p/zJ9
	YRpHQtUpHOi5PyrgWwkWz7xNNYbH5aHwSy8EppvQf4XDdUU4QK8OWzF6SRvPk4ej9iUemLhU6qc
	qsiSR7ao6HwD6T+ibxuyEz5H3GqocQ94mugLKMQcNdFo1+dzxqwlBdh0fYCSX9BC6NYeRhJwfQU
	ujulPqW3ngr3r3CIhJz7Ko06y70wZ3QfmrsK12sBzoatri6qxLNg3ht7oQ8iEOV1m/fRV25002k
	626OKXz5r4+V+8yWISI8YpZvsm7G3CljvxaOlfDdjsY+RBgip7JBNC3ZtlW7nUNA3+hwY2PPSas
	Aqwb5JnfQUvFm4hpSg8GZ7TQvTpgxeIBDeanhnlPwZGGWimsDcsVBBe1XwHTdKERNIuauYmK02G
	dEopVMXDXEOa19phpr5uGiHXgUnJaqyaw04ugkIHQIMp8OvfmDXB6QUE4oIyXNkuk0B6OQcwY2O
	c18NK7hOGS89S1g==
X-Received: by 2002:a05:7022:7f0f:b0:1a7:d426:6dd2 with SMTP id a92af1059eb24-1ac5e31fb9dmr16576074c88.26.1793677341918;
        Mon, 02 Nov 2026 19:42:21 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm44418457c88.16.2026.11.02.19.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:42:21 -0800 (PST)
Date: Mon, 2 Nov 2026 19:42:18 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kornel =?utf-8?Q?Dul=C4=99ba?= <korneld@google.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] input: evdev: Read clock directly in
 __evdev_queue_syn_dropped()
Message-ID: <aulWqwWvx1Q1DAeL@google.com>
References: <20261022-evdev_syndropped_fix-v1-0-b5400740e1f7@google.com>
 <20261022-evdev_syndropped_fix-v1-2-b5400740e1f7@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261022-evdev_syndropped_fix-v1-2-b5400740e1f7@google.com>

Hi Kornel,

On Thu, Oct 22, 2026 at 01:39:13PM +0000, Kornel Dulęba wrote:
> Currently, __evdev_queue_syn_dropped() calls input_get_timestamp() on
> the underlying input_dev to obtain the event timestamp. If no timestamp
> is set, input_get_timestamp() caches the current time and returns it;
> otherwise, it returns the cached value.
> 
> There are two problems with this approach:
> 
> 1. Locking. The timestamp is obtained in the same way in
>    evdev_events(), which is called with dev->event_lock held. Calls to
>    __evdev_queue_syn_dropped() are only serialized with
>    client->buffer_lock. This makes both accesses likely racy.

handler->events() is called under dev->event_lock. I'd love to stop
doing this, this is how it is now.

> 2. If no timestamp is cached yet, the subsequent hardware event
>    generated after __evdev_queue_syn_dropped() is called will receive
>    the stale cached timestamp.
> 
> Fix this by reading the current time directly based on the value of
> client->clk_type. Open-coding this is not the prettiest solution, but I
> couldn't figure out anything better.
> 
> I initially thought about fixing this by resetting the input timestamp
> in this function instead, similarly to how INPUT_FLUSH handles it.
> However, I decided against it, as that would require non-trivial
> locking changes.

I wonder if we care about timing on the SYN_DROPPED events? Can we just
grab the dev->timestamp and if it is 0 that's fine. Or not even set the
timestamp at all on SYN_DROPPED and have it always at 0.

What do you think?

Thanks.

-- 
Dmitry
