Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E6149DBB6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143108; cv=none; b=SgXrsg5ZQbIr/5jyPYAY0HfxEhLrXMxsFvRK7djrhWJdeON9meabghkLXHQmSkyvzG4JCXUVkpIK4VMUAbdN1O0GEOAfwCjS5iPLdZFteo5kWG5IcXFapv/qRmsehmIazlRjMxx+uwnAX0xYV1NIJeeEdveVX7EhcSqgwL4HQQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143108; c=relaxed/simple;
	bh=9KC+h19QeQ0ZAIjwroejZmCB0hItZuK8z4JXahZWHzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4LRp76kBYwuPj58sNkoldgTLVgFrHlajNziIKjz3m75xIBqCxhf+CtA6VuCB3wO08x/pYxhScHMT9Ioc1/eg/8f4nPZGkeDZcuUiNW02gyo0sAC3Ows4Tr5Kh+UCKbFbdP3IfK4Omfy5Lz/NkKPQ6MMexHyFpU2+W6KDPMdpJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WuWkToDm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WuWkToDm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso12620705e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789143104; x=1789747904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9KC+h19QeQ0ZAIjwroejZmCB0hItZuK8z4JXahZWHzE=;
        b=WuWkToDm+Tgtab3HmqyL+TuySviu3lJ2ykp/qRvVUOtqFHW4CebAqQT4V1hSa6u2LY
         5CreKmfv9iv9xPaWFnH0siWe77SEisvOO7oLGTNpwiWw81mfRQkdPAeRiq7LVKS2Ml07
         3aM/E0MvLtuhE0fgE6Yb7ondVR83+QLgHqUzbFFcVIyJiBSRP6Ky5Jc6fEOzQQ+0FsbQ
         JW4/P33Cp02I32IRRHuTNPqy24pcHkLmF3KtlTwRL1whTwc5vaQ+9m1Kgldox2aEzMNH
         dIVP36VA4Q7bowUDCuXVLeSw5f6qiBtvGWdrEpFFL+SvCeoj4q4gVaH5Q2+WQx4gcywV
         VgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143104; x=1789747904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KC+h19QeQ0ZAIjwroejZmCB0hItZuK8z4JXahZWHzE=;
        b=U/ALlOIVfASbnHsHCPD0K1n9Vkq/l0HcVpqsRV3Pdi8L5kMPyTNWzMNzjr6jNvPg8l
         M5uZm8S6q4y0CDxHq9XUaEPzcpSHAt7S89byPjXFuvCpo1E6P9LLthfE8J81tbhYlq/d
         8eGJpKVwxHnQKNf4Z9Cqb5U1sKOi0DhS11vIJxGNzcf077UJEwfasf7euDSlUZUEUDSV
         Enza2dc550CNx3uE279hdQMI+EzvzcpvQtfkbCjjKN6TeCTNY4unAWCGFceXX2cR2kp8
         DjwNfH792V779fujcqlthq0vg817aQCnIinXtGHyuBcYIhOC6nnaiq16vO2TK8+YfR6X
         ni0w==
X-Forwarded-Encrypted: i=1; AKwUvBy9hiMvxOi6fsaDymROEXaydJGR63oSyTOT5W4WlNvpiABlkFcKsksiBy6r+natN+wMniGkD19n1exH570=@vger.kernel.org
X-Gm-Message-State: AFuF++lGLsVYpMOXFm6Qcrj/KdIlpqOZlKg30QBoKbfB/f9jYPDic/IX
	PT0OkkZd94oxT+nbSxD3VF7klA0b/8UQmvy55xaLkrGXRhfmlK63NJvPOW7ZLYggUeM=
X-Gm-Gg: AYBFou3oSd9oHD1C1ZfaR0pYG17KnvnOGaIERYj17OQKw9Y5XbRFZ23RlmrISeuA8TI
	//+nGOmaiqtT5vnvo2XByUrSng1JS/SKCVSZhho/0m3j3+anM2p/lMAN3I+xY+iurx9r8EPkBNm
	xsrUIg2PtlEFyK3mxElrXWgxNIWy3B9kQ4PfunqKaDrU5YXtGG454cEhsPVXOIUZLpM1YNP5BLM
	6CzaqT5//BS7z4DBDo5VDOt7S4b0AoK8QV81hKS/L2rCr7wXYk1LnKI+iB92rhp+gbe51HJYWWW
	/VkQ3ZeWNib8s+o10iGlr+VyK9b0JmrnJITkYLlO9qjT9QyRHiABRUB1lb/ZCoqNt/h31hBkmx2
	u+f99Av1FXeXjGdhyBDD8o+9NXEWDPDow2QTUsRqyWxAaYLqoC7W2oxsE8bCfJvGy+pFlWbfrek
	rk9lNN8tPrPmvML7h1Rrr2rL0Zyr6amY1odU4TlNmcvk0HkP/8fcBFYyvUNIUWSdKGvLpBaL/WT
	w==
X-Received: by 2002:a05:600c:45d5:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49e619c18c1mr59656705e9.19.1789143104418;
        Fri, 11 Sep 2026 09:11:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bc5fsm159143865e9.3.2026.09.11.09.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:11:44 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:11:42 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Noah Feldt <noah@feldt.systems>
Cc: Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, N.Feldt@mittwald.de, carnil@debian.org, dschatzberg@meta.com, 
	hannes@cmpxchg.org, peterz@infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] cgroup: Avoid iteration of dying tasks with zero
 refcount
Message-ID: <aqQlowpkYrTaVmid@localhost.localdomain>
References: <20260907192723.72167-1-noah@feldt.systems>
 <aqAtv3WVn51LN3E8@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vqaqn3dazvpkwhgu"
Content-Disposition: inline
In-Reply-To: <aqAtv3WVn51LN3E8@localhost.localdomain>


--vqaqn3dazvpkwhgu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] cgroup: Avoid iteration of dying tasks with zero
 refcount
MIME-Version: 1.0

On Tue, Sep 08, 2026 at 05:55:45PM +0200, Michal Koutn=FD <mkoutny@suse.com=
> wrote:
> Though, the fix loses a bit of elegance. Hm, thinking...

So, it occurs to me that the ->live based predicate from v2 might break
CSS_TASK_ITER_WITH_DEAD callers (zombies they asked for would be
skipped).
We need to distinguish between (both on dying_tasks list):
- regular zombies waiting to be reaped and
- RCU remnant tasks that are going to be free'd.
IIUC these two are split on the ->usage count. (Correct me if I'm
wrong.)

I'm starting to like the tryget_task_struct() approach from v1 again.

Michal

--vqaqn3dazvpkwhgu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaqQoOhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ai4DQEAgpiBFl5EmgRYQ2x8tv4Y
gyHzyg0fU1nthPmlt+skLTkA/0HFH/C6Bws9kXraWbS2BO4rZ6+N2FJFygphH/o9
QkYI
=7ubW
-----END PGP SIGNATURE-----

--vqaqn3dazvpkwhgu--
