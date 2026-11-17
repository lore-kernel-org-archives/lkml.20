Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925636;
	b=wKDTGCAwiWZPfUMvbqIHaVNbV2SekrGQhYvLEENPL+TBADQVYQMpRtPNrquDH4jUdB8X
	 ylTC6TKrikkIrQ9S7MxVmHsFOngrUwBfdSjrEvXUTypRN4wQuf9Sj2VnDSH5dw+Fq0Qho
	 HRGywFJZeaT3IewVLE/YjmghWJQ6lyLMtQ5di1ckBNuhYWNl0pDRKk6Fz6WO0wjdRKlL7
	 HOYv0tQ8tyPKAEDy3ElW2+k0rlC+ZRAUKb2FzlnxYSt1WOsQ1w0kwvd7/jrF70O3YqKlx
	 wKoHS1JXQgTgWE42eMGSLAkIbdjnzg6RVXM72ydpS9MuxGhKkSiwynqavn+q9ytNQtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wnAbz7Gl1f6zlRr2NWm/XchokgiwNgSv132i/6lKWwU=;
	b=bKNgVvJQX/nmhft4HyzZVu8LAtxTUF8n1+Y/pIvdL9PyqwFoy2Aei+qoP/fe93Rnbj0L
	 WA5lCj72f7Yusmx9V4hOas1SyVQjPyWDgnJKwxKH3/zjI+fe8L73xXEn/9ZbQX6AUZvx3
	 f8Chl6UEyzaHmdpz+Jyxd4QevKl93j8fk5Rdu7hEutKbmBbcyyi7etPxwisLjzWZGi/Yi
	 x4sAWP8SmiM05l0B44/3YZ+3F4O8ojnj2iFtnlX6yys33M8k3a3WnY32CWsg15osaH3b3
	 qOG+wEUc6Vjibl0Nmqc+vO7rjH7IGLdmYDjxBqDLPgw0qlaCgbxP1tcAEbrFDfznW6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="nKdZk5/3";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82888606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82888606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nKdZk5/3
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2436939f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794925634; x=1795530434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnAbz7Gl1f6zlRr2NWm/XchokgiwNgSv132i/6lKWwU=;
        b=nKdZk5/3s6uR6yRzxd2ICXAs5GtNn1Hewc2+nPqJt0XpqsyXOpmQS4HFm3OBNrABSj
         ROM3xjOVXYXN2cRZ7PqdTkc9vPv6W+6Chu9o86A4iHu8P1v3YugRy8wF3Ob6pbDkl2wf
         30BsFBqH+aashr7C5NXq3auXuVkfVQNHr32unbU3XrnxLWNVxUYYglnOf6QtZsGNmcbF
         mPFwmsSjl6JtF/Zh6i+RbJTkgJwPWx507fdeqUwfR1WTtNd14hXBpBBWdgXjk2W1vRgs
         HRR00UUmyxUs93FnxhZX8naZKerEG/W/T3Nbrg6Ox15QlH4OnEL6b3gFge/sPod5zBzs
         1MAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925634; x=1795530434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wnAbz7Gl1f6zlRr2NWm/XchokgiwNgSv132i/6lKWwU=;
        b=SmKv6x4RiIxOvIWN/Bv688g8HamW+h1jk2lZS6QzbMnyTzUu2v9e6HUK4Za+63wd6I
         7fo3/KgRLVgmk+pYKsHqYyc3lx7YR+8VKxYcdl9FEJPlhR4EMW5sTWkkJ2sGLW7lNqG8
         aSZSCrm1LoBcXANfqjtr89jmn8nWzJS3CHbjdzjmTmDrWtGUUIJddmc4baF/rrnzY+O8
         kIZ5+vv4tCI2TUpiH+O11m3JabnGXPJlivXACA6TfB9lQLQruU2NC1TqpxsyLbXkTGm5
         kv8W1qoOw18jj1gktQuwcydyrgh67NqWTEw4LupM4zbyQNjyIwFEHV/2WoRFuhFfhmXG
         Rx1w==
X-Forwarded-Encrypted: i=1; AL+hErGCwAhjcmbdMPpBmQ/Nz12kjz2xRf5W8ZzMOgnrac2f/hTwgDrPkMaLdMivGxJzS06Zg1pG3Ovgdl+JMJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iCayI0iza0lonqoXGfK/8vJ4+E7Bxq2W4xjTUEOEobNrMHk7M
	lEfcTEON5Er8BDFY1Czmh6IMaZkQby4R7pH6VTZriHhGxuubcnHSkfs30ToYAIlvDQ0=
X-Gm-Gg: AZFdTZezPKIMqBX1d0cpVeJpfbgFx+yWRcogI2wYs0hClQhob/3UaaEp++6E3+tLywl
	d12ffr4cTgu+vbbVrB8gwEAPxACU2mbXCjZNUSzubVPnFSpoh5ncxXqA+gWi2KgR1HsUs6elwqQ
	UDJ3OW7Hq8jSbEQ+PJB5ZFOLnP4lL6GLXl5ra6wOZRH56ek5R5BzhCp3+5DzcKb6dtHnfZbGPtN
	ua6tgWZomAubptEM4waNEoG6xYbf6R11ZlHew9J34WADkcMg/aYa/0uB9m1cqlXO+MswSey1bhg
	yNvgJtflQI5rR9IwsUuMtIoCh96Rp/M3/spLDELKtsyVRJw8w5Ow9ev4+X9Uaz8Q22X5VBvvNGU
	6e3F44HuT8DyiDDbH+E9K9rFFg/1SmtHKx+5RXadeiBym7sRqe1wJWrsgHLbTsPSbT3vDp3XaWD
	oJguvz58DK8X3URyo4icjiBcN04bhDjfPrG10cqpy+iGaTx7WbQcve2sgBWacBaUi5njPmBveqP
	d3Ee0JN3vA6w4OeqCIlpHW40YZTtqQDBSbAfm93pP3t8Sj33gkMrd47qmmc1LhtFloXRYDOIdzz
	QPpf7rmO9dsRfaAbOKTemEP58dkkeIKYZgXYvQ97SRfz7HCZ4cVu2vDmn10QVvGwvp9Db5Asaus
	3gw==
X-Received: by 2002:a05:6000:25c3:b0:491:4e13:fde5 with SMTP id ffacd0b85a97d-49c6fc9e61bmr33439745f8f.8.1794925633802;
        Tue, 17 Nov 2026 06:27:13 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f77fc47sm28559146f8f.22.2026.11.17.06.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:27:13 -0800 (PST)
Message-ID: <c000f684-0989-4ac7-bd40-e6d224fe070b@baylibre.com>
Date: Tue, 17 Nov 2026 14:27:12 +0000
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
Subject: Re: [PATCH] accel/rocket: fix ignored return value in
 rocket_ioctl_submit
To: Kartik Nair <contact.kartikn@gmail.com>, tomeu@tomeuvizoso.net,
 ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260510200047.6117-1-contact.kartikn@gmail.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <20260510200047.6117-1-contact.kartikn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/05/2026 21:00, Kartik Nair wrote:
> rocket_ioctl_submit() calls rocket_ioctl_submit_job() in a loop but
> ignores its return value. If any job submission fails, the error is
> silently dropped and the function returns 0 (success) to userspace,
> leaving subsequent jobs potentially in an inconsistent state.
> 
> Fix this by propagating the error and breaking out of the loop on
> the first failure.

There's definitely a bug in there, but this approach is just replacing 
one incorrect behaviour with another.

After your change if there is an -EINTR generated from within the job 
submission, this will cause drmIoctl to retry the exact same job 
sequence, likely causing parts of the sequence to be repeated, possibly 
with negative consequences.

And on other error paths that would be bubbled up by your change, 
userspace won't be able to know which parts of the sequence ran vs failed.

I think we need a deeper change here. Is it possible to fully prepare 
and arm the whole job list first, without executing yet, returning an 
error code if anything goes wrong in the process?

Then the execution of the job list could happen as a second stage, 
hopefully without any possibility of failure.

Daniel

