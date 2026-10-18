Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A654B04BF
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339617; cv=none; b=cJ0q0S9hSPGs5hA7dOz0u5DSTVQ5SNzS7vTtDbgzElCYqZjKYgZ/L8/iTuqFLtA5oEyA0zDWog4XUkv3yyLyIYwzNtEL34T/pqug2bXSWiQPoKW1rBfUv7dRRokcuGFofh5V2gcXBXPhqli6VCGzJ5wxrJY5qwCbsuCXCtkZTKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339617; c=relaxed/simple;
	bh=KpS1mvfrzPVq+RJ1AUg0YioB5wJtbGxvYJVW8/sEbLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2rbZ6NzLoM9fBTACwRjP/Pay3JzmiWWSbOTAizr2+QiRa990j7/rATEOiL/fMr+fCW/pFyYHKiF/byPMidpYo2WpmQvKt6gZiY+/9fb3nDKABF3wYRNIeYchv3HAcgMoI9260JrefRT8ZtLYaENekIatGW+XXttI8hfwjzVRUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfJWBeDg; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfJWBeDg"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535a54bed9so1839499eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792339613; x=1792944413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B3VIzdAotImucJ/CUyeIQ/bHJawLqtZx+sVJj8zJnmQ=;
        b=cfJWBeDgkw3BS0eoZk6Isbg6AtT8CYAIS2CrCwKAEbWZ5JdW8Cb7KhEYeav1bceNk/
         YzNUwS52+sWOT9gwl7IOKQP7OxzvLNYDjxR/lYEXl43b5kB/fM3FjhgbM1piAqWZLqFp
         nwVG8XYY5YozKi221qgBE5EDYvHgzsdng3rUVQZsia2taxh7+MCE1L27U0PHsJcEDTE3
         pf9RICJf7Y4OvFdfFFZRcfowfufOLrJvCmM6Qy2BRjWhWAcBUC+B/ZAw6T9Uv8HgbEMW
         sjhj1FRC7F/ojZMgcaCwkM2wuHYuzdsc3OLEufoXbPPTEhgFidVJj8vKXuMMvaEsc88V
         EtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792339613; x=1792944413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3VIzdAotImucJ/CUyeIQ/bHJawLqtZx+sVJj8zJnmQ=;
        b=sAdmk/4VUTn+vmCNbraKcIzv+mBy50cut0LZQj4Id5TzN9vyKcgb9IDyms9uY2E245
         KsOIlmRE7LFMU6PoYR4cmbeUTKrd4gOpBe7ucNqdzbqnkGCbJxrw58MqhhUtScJxo1OO
         7qT+w2k54/dayRjaV1S9/E54bufDcu4K0VceRfGon5f3jfHIBd6dOr+2ocyvb7NQhK0C
         kwmqNnk7nSCevb8Pt6HwDHvAgj0MZu/SaG1hD99jYjQrn2Wu5xJ3kJIHrKBMjmz8GjoT
         GMclSs+1pzLkOAN4WMnUHKbvmriS6DxnN/4JUTv31UnvDDhD6YbRVPvT6jCVPfnmnIAS
         vLug==
X-Forwarded-Encrypted: i=1; AKwUvBxqRB8gwReLgswOjdi+44xXAxXKF6hF3KF1dveIpgqOhPhoXyxpb2ZyWZMQozKk0PAbblAdzGju5TDJut8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA1bCuDMZtZRhRXnOyiK8e7I5vsCzpzUaL7OiLvpJBci6zr10W
	QnFzPjd/sEr82JZe9Re+eMWKpgJqkRIk5vJaCwA/JSq1vG7ogHwiW/m7
X-Gm-Gg: AYBFou2XeI6uCEhkPBEs+0CvB8ekWobYCWOduZnYib9A9THDpcnWdar527x5G55oJsX
	fvI/rj607yyjhKT5PSQxuyZ/QfWY2llgYUvZR0/EvbEozQqmeWz4KEkixxkY6c5jRjdoIymbgeA
	d4l3PLOvBw+7xWHQ/FngTEGRWpXu1Sr++9XrgCFKPBdNilkXFcxlBn3e2t5UqBwQ0S/8OE7MlnZ
	JFZeulghof9V14FX/KHwJXEDWofRbbr41YsiwD8KvtrD0iTET1zXaR/pTez7eg8gMhtcVPDJUbF
	s7FGiRvHaOTexhvDwCvO+xYMqJaSElF09/xNW1An478hapfAJiBfx+nDIOUkLiU3Ozr34tIUPS/
	xEtyLZ+/4fbtZLLyfbCiMTjBHWIAt/4YvZp/CbhvFQlaU0/PtkqTv3sI8lKRLz2VqrZI7TkmZKR
	gAtwvqdDOVKWeFDk/nepVwBIFY32Nar6+7Xi2/89wmi73QtR+duTjTuytZcC8dILWdaY+KNgRFk
	aEpiFOUz1OA
X-Received: by 2002:a05:693c:6311:b0:361:308f:55eb with SMTP id 5a478bee46e88-361a264b569mr7771322eec.30.1792339612707;
        Sun, 18 Oct 2026 09:06:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm23948470eec.29.2026.10.18.09.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:06:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:06:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jihong Min <hurryman2212@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] docs: hwmon: Document the uhwmon userspace interface
Message-ID: <e77719ee-c813-400e-b49a-9f8a3b0e2e91@roeck-us.net>
References: <cover.1791531025.git.hurryman2212@gmail.com>
 <c02aeee5b7e7a5d159d4df5baabe925e16814e94.1791559095.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c02aeee5b7e7a5d159d4df5baabe925e16814e94.1791559095.git.hurryman2212@gmail.com>

On Sat, Oct 10, 2026 at 12:38:44AM +0900, Jihong Min wrote:
> Document the uhwmon UAPI for developers implementing userspace hwmon
> drivers. Cover device registration, request handling, notifications
> and device lifetime.
> 
> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>

I am not going to review, much less apply, this series.
Exposing subsystem internals to userspace is a bad idea and would limit
future improvements of the hardware monitoring subsystem. User space file
systems are bad enough and cause all kinds of trouble. I don't want to have
to deal with the same kind of issues in the hardware monitoring subsystem.

Interested parties should implement kernel hardware monitoring
drivers instead.

Guenter
