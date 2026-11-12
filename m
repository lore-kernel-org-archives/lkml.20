Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524689;
	b=4hwY8jodfBG4acoxcbACQZspBs9Vc9akzBGDo1m7N0u16lV4b7YsdsHiAjadAXXvqQso
	 3l+SUY6NMek1HAByt1qerF+onR73uvDBy37HbhHXZjycedX/lN9p+oyBaWn4cPj2gJQDs
	 E5NpwdW61GMSbEKHCdD1pia166Xb3j3PhhCAebxyhXOcJUTleeyGbkk91HH6nBssDq6QK
	 LRl1x7AoGbEEWo0WeN42UiteGJOqcLjVgKCKxR4Ij6VZRicRn/ruJLEgPwjFQghY6Osz9
	 1AvcvAjbbAS0bEqXnrz65tZze39QEsxvYp/niTjqWdcBO19WHTjHTK8G+D1/lV8A4Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=h/4ZmNZSkN5127BfeP/7xUQIBc4JFqpmLA7VTI9WLuY=;
	b=tqdvPx46diSsaPYN4KozKwKHm2A+11q//6VzXfhHiWUtYZ8CMcbUHE4859qg/dTyULMh
	 NIjO08WCR6urvhgos29DghuT6KaHW6AMATMFgBJvEN+oyPagHdixyVma0b2quPZeEJpo+
	 ADl3GWt/FJs8bxOiY0ahjlOmGWxNlqlFt5kXBmjCxwiSWEs2AtNQ1ab8G9ibxO+WtmWht
	 stQoXUrhPfhHXF9kz4bwFr8ltPxPHaurBamAW4FuMhZ0bK8pzTsy9rmQ45AczWkV4FcIc
	 u4fDFV0T7FauAf7ntQsuKHJhhFf6jdG4Jn1U0ojhR3EaUKd1HBxW89WNhPYF0Hger/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Mb2ivvgT;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFE6606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CFE6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Mb2ivvgT
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so136394f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524687; x=1795129487; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/4ZmNZSkN5127BfeP/7xUQIBc4JFqpmLA7VTI9WLuY=;
        b=Mb2ivvgTppyP3nAClglSWQCbWWMnQjTtNeXuNs4mrRbelqrDAWjj8dppjqwM5YMgn8
         7W+IvH80Y/or3GCnJWf2ThO5KW5Ud9/6uVhkiiUOqUZmQMg0/Ey1m7TZ6a3QYwreNvpa
         rc3bHBOc6UxcJ5RAYakB/QMYox1bsaRfMCbmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524687; x=1795129487;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/4ZmNZSkN5127BfeP/7xUQIBc4JFqpmLA7VTI9WLuY=;
        b=Eht4uAVxKRUey5f/qfuTCtcm9i32irhdEm+Nj/N+UnjPTyOMZK9EOh0clK+n1KlUJ1
         CgSS9jSHkrm5/U/yhScxqmCpQ3oA7enfQbIb41AWX52vF5cBWCQQDI0QLJr/pA9xH3Hr
         oLBEAX7e6ZfRk53Tic8AnYXGcZ8a1cz3thF6vAEtzP1lpBO0RI/6TF/g5d5jP5OfZb1P
         zroDpzKUwerl+wNnBwXYbnAQTE+BZUPgM/vj2CkRfWEzB4B91hsHNGb67cmL4Zp769Hj
         5Uq4ulWs2Pzqj8FvLY/v7lFVpksJuoi9aDfLSd17hEvbta3DMq2YjN7lPBOzY3FZ4sf7
         ya5A==
X-Forwarded-Encrypted: i=1; AL+hErHe2ws8rNIdXujazNHbpXDn+WoHR4WvRPzUsxqEdraPLbGdRVV8EyLVcZeNkrdGhnTZbwTHCZ5YGw5CheM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pLoIw7LghP1VciggZEzZaTezW9G9hi2uV22lVo5uQBIS3yZHH
	3oVohTLNIlu8GHy751jHocCK7vNgsklGcOoYw94lduBQAVZ12Wd3IwV8Wfy6T7IxKTo=
X-Gm-Gg: AYBFou2Gf7/oE3BGGQpVYfDd1snfX0YQqGZKQa5Kx0olcvfSXXO4cMZXfHASE4MnL45
	Dm3TEeyB4GBn47WRtVk+7qkSjv5fXoOfdHE/Zs2Ozu8BAfA44rKMFxNg6WXtREygiG89PdvqvML
	5xAWlZV2uHbgF7qBBQqqCyRqWS0gApMaUvdYJ/bbG8gMmWeOnTnsTrIluoT1jwzdA1vBL4nFHMv
	jXIgGXH49iP56azXqIEJ8BmrBvUOwkKdmzz+DDE5yq8NgRi2p5Ti8ukLuNJ2np3DFpICIulIuuK
	0kzKT1k1yphr2PwiXyeL2fNRy4eWcSzjlCAhkltJGve8AQU5g6GU/UiwxYj5eKUdxK8nSx8IqkL
	PfsFVQwKfLosvWGD/OfNf7wFPYuh07GAf4Xc+DhIP9U8fN9K81lVLWaLsADb30MJ4lpPmxIubOh
	XIPxbKadY17SZMNgE5+vAqjWsd2GOir/i5nbe0CRoY+pQzowXvDHPLvDGi+Tgs8RRlhUa4jZ4LE
	hJXTOlYSioswMIVbbQMWRBZb6TZ5sET/qGmWlMhVgEhhr4weZ7uSjgfufOVViMXcX9449+d2j81
	bDedBOFESJH2J7iuYzi4At0d04jkPSqqWQPcIn+iAo6iePkXfPEx+6A/pIoLXK4ZbXhBF1Ywrsp
	gvg+xoyPTXM2sQTMqZ22Lt/E5KEC9a9XJtwF00aLLhKah7mqz3Ird8IvfYLZHfb4y705Ddb/1DP
	qKdjwfcKYkFPMMP2VV3SEIr+Z0DQaoObkYxokq02IXGjxqs6REbP6EakYf7Q==
X-Received: by 2002:a05:6000:3102:b0:48e:4300:c6d4 with SMTP id ffacd0b85a97d-49c747700e5mr1949772f8f.53.1794524686961;
        Thu, 12 Nov 2026 15:04:46 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm1356260f8f.53.2026.11.12.15.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:04:46 -0800 (PST)
Date: Thu, 12 Nov 2026 15:04:41 -0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 07/17] printk: Check that index is not defined when a console is preferred via devname
In-Reply-To: <20261111154816.71103-8-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com> <20261111154816.71103-8-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261112150441.4fbbb20509665746@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Petr,

Petr Mladek writes:
>- *   2. Either @name OR @devname are allowed. [*]
>+ *   2. Either @name and valid @idx OR @devname and @idx=-1 are allowed. [*]

The check below now rejects only idx >= 0 for @devname, so this could say
"negative @idx" instead of "@idx=-1" to match it.

With that (fine to do when applying):

Reviewed-by: Chris Down <chris@chrisdown.name>

Chris
