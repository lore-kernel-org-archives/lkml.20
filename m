Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77064D37B7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644425; cv=none; b=IkzjLp4OvdmacYBqjKjKZyQWhQnlWiDqVxJ6YfZpL1zN7QVtcSNg00CWk7kYhKzPmBXw6tyL7V/OkiTUFjjn4Av/vBsUnuvZuXcWlCdedT6SojVtRr0jyIHtnmoiMU9p5qNl8/joRT1dBDjHzOEWAWXhrFo58eXnFcsk7YP/MH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644425; c=relaxed/simple;
	bh=j1yYjfdvtN71lnQb1RuDzx0cffgVcRVRBV6mc2dIWJE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=L+qUvGv+syDcyrFUeZIPGaEHM07mwsv6laL432DLgeNv/2utrYXGjbKouJQ/LpVRDr+cQCMfc+dymD868Z+1LoMawB+7z8ZUUr8y/fATcCmHGPSaInSPU7GAj/6d48tVnAUoZwXBtdXLpq6koRTMIt1L4Ow1OJ92VmuMetz+O5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p4a1R3/a; arc=none smtp.client-ip=74.125.225.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4a1R3/a"
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-485850cf4deso269458f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789644422; x=1790249222; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j1yYjfdvtN71lnQb1RuDzx0cffgVcRVRBV6mc2dIWJE=;
        b=p4a1R3/a44085P/wLAXM889aehNxu6Q6YHRFlbV82l3cEMA0Rrcz1bsHcDAGQPhyxl
         ol99zdBsbGdghXYBnsjW1jQrVFhB8UX53Ai0qcfvO2iW8C4vVWE+20Fcx567hMT9DVVJ
         RfSD9oHjJvKlSznmkMKIGllovBfWEbEWQpwW7rp2NwWqpMNpCa4sv6wiaVBFi+z+9tCu
         DaJCJVWljQlAEcE1R3vzB1pLI07qD4pNtMyrC1ZYslHsRiVCuIZ9oWL8WTKsujCO1MRw
         uJcC1btV3ekp1KWbHMMNmhHrKNxIQ41PT9COLXpF1nllk/VAXbIF6qi5pZiUhf2dI9+n
         oZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789644422; x=1790249222;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1yYjfdvtN71lnQb1RuDzx0cffgVcRVRBV6mc2dIWJE=;
        b=fgyKEH/tjyY3sEjL8OH6MTy4cw5+KLcXu/nC6NmaSl/afJdYBsqLXWFOHxyfGJjmI7
         dnV8szYqdd2QGuy7KEV4zJ62U8DWA7e4PmTeaNW6JxG8cZEFSCw43YvVCpKOi6UICMQp
         UkADBAkfxmXnBQjAPgYCGpjG1LIS8rXuku8kXsxrlC6GH7MNyU2kJvJ5KYn7xOC9eJHh
         IqNU6UsTJMSL6CcQZy4sDO25KuB1/aB5t5+EHj4e+5nzKaRz8rwoKXdUBLBG5H084WF2
         tk5kBVTx14HD58PuNse5+5DAgokqE67S1y/J+rYyW6j/TK9bfCDv6IRRXDD2RPgAPldF
         aspg==
X-Forwarded-Encrypted: i=1; AKwUvBwCXYPixEa2kAUxE7tfbwYsI+4ItYKnYF87W6Me/4G/Vm1CoBxP7eUCrGOZ0hkXQnK6ad0l2SngLLz8KRg=@vger.kernel.org
X-Gm-Message-State: AFuF++njL6JaAMx5mrliCaJxi3h/3fLBDXnvZiN6FASzQE24WErwm2J4
	vLdyohGf0rhiN3PoAQeMFclRoEzzCZLA77cY48EwUMJK1Kx7GSjrvvao
X-Gm-Gg: AYBFou1XimH8fd0Ohs5sN8iMaJeJfoEwDfI4shWcA9jTBl1kGBf7QvSXd7VUhZ4l4me
	PJcODJEdJgUpki3c+kGkZZjGqnyP5Zpj9zQu9ud45R1UwQ+o0dx7IsTEVncT3LLmEuG1X8iu5cp
	7k+LIsIBRYHOra4T9UIH7keCZm/30OB2ljV2X5FOIwbtNlpM/eVXZX0pO2HX33ERxckvZVXR3pu
	YvhPPi6XnsVTb5Wpt/AUCH9dpK5rUAc6Wyn3/IT/9/5/yl3ySJxR9O6YO11kD4VwevxnQSYz6St
	koK6gpg6SekbfSryrkWm/KFjhROtK/OZRiD1xPyQRA2AekpYHRgJsh3EReRf7hxs0bTlgTqjhEp
	UCcPlVvVBsDJ9hPOCYZnxLnVqtEJbTsO6TXDVjqLMym7XYpTa4xz7kUYOh/M0hsLSVlVefsJmaI
	GOieWkFuDNwS+RBK0prwo6j/PKiVE0JvCQ0IixRx5QvD45bhwWIRFBwxIdbK8NGMhmNXouGaQi8
	5gx1Nq5j1tuZ+LbSAXDoiQsgbiofV266pHRn2nedxTSjFvF4WKMOhCk73Kcym3iqOeIFMPwdq14
	/05i0wjkvC6CQYbmr777j9b2WwRFu9PXtQHV6g==
X-Received: by 2002:a05:6000:27cd:b0:487:d8f:27a0 with SMTP id ffacd0b85a97d-4870d8f282amr5317777f8f.32.1789644421948;
        Thu, 17 Sep 2026 04:27:01 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fe7esm15118417f8f.6.2026.09.17.04.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:27:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 13:27:01 +0200
Message-Id: <DLHK013DCY3J.19Y8X3Z0RTWCI@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "bpf"
 <bpf@vger.kernel.org>, "Networking" <netdev@vger.kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the bpf tree
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.21.0
References: <aqvBPVcN__UX8P85@sirena.org.uk>
 <DLHJEZ0K0FV1.SCQLJJQNS1ES@gmail.com>
 <66d3f5cd-12df-4000-8459-360ba57cea12@sirena.org.uk>
 <DLHJUSTDSQ05.28VUGOV7YPS6V@gmail.com>
 <ec2acd16-40e3-46b7-b120-ce9eec70e942@sirena.org.uk>
In-Reply-To: <ec2acd16-40e3-46b7-b120-ce9eec70e942@sirena.org.uk>

On Thu Sep 17, 2026 at 1:23 PM CEST, Mark Brown wrote:
> On Thu, Sep 17, 2026 at 01:20:11PM +0200, Kumar Kartikeya Dwivedi wrote:
>> On Thu Sep 17, 2026 at 1:09 PM CEST, Mark Brown wrote:
>
>> > Does the contacts list for the BPF trees need to be updated?
>
>> Well, he's the committer, so makes sense to put him in the recipients as=
 well :).
>> Once he gets to this he can probably force push to correct it, I guess.
>
> Do you have a full list of the current committers, I guess there's been
> more bitrot than just this?

It's me and Eduard, apart from Alexei, Daniel, and Andrii.
