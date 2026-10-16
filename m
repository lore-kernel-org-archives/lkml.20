Received: from mail-106104.protonmail.ch (mail-106104.protonmail.ch [79.135.106.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CBE3E7BCC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144516; cv=none; b=L6NQGQfKShf5t8baHmubJyZTqIxxgbp1t5TsJumFjWXptnfXb828abf9ajwbN+AptOHL6ySzSAYmXm+1MKtS/6/MbHO4HKuZHPCyibLFPsC1QAAdEMMY3C8HMkDQrDHnQakDmFWWTc6+NJOl/j6nQNdIRSDq4Fb7Ac/f9Np+Ypg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144516; c=relaxed/simple;
	bh=LXz8/yILUqlXO8gHp3Bh+MclfC8vx8p4mcsNhKeHMKQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hjhcHvdf0xRoGxUOy9Lg75ideNJT8tQiH/Bd5UByIPOZJ/rw8LZJqPQ+PA8uQYz63gp0/gegF/iQ34WHig0eBt01PmwT9hjNXrym23aKP67uET2VdNEQLwfyKZtc98hs6j+TeRRQnjMI4AYLN1CxpI38faqr+7Jt+MIvTLQrrFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=FBzB2iVo; arc=none smtp.client-ip=79.135.106.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="FBzB2iVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792144506; x=1792403706;
	bh=LXz8/yILUqlXO8gHp3Bh+MclfC8vx8p4mcsNhKeHMKQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FBzB2iVoLRoDviePImk0ROKx0QHdvhTC/JviAlDU7Y6iFYDk75XoxyNnBzSRgvZmv
	 vZl68M2tKZRclDFfl8FGwd3E44ZVKg3cHYqP2m20NGwDZWZqEmhXqBEUUql0lu0+Lx
	 8ph/Dy9ixee7+FUQO0SgIgBRtVxqLePL9VKCvp3qH60Nmp2xATgMsTCcl4VMan9sXr
	 JvrGpypuO8Qg4hAJ8IJz39I7+25p5TuZmpHtPN3om+9K4wt0DygsUo7CwCUizEJNRT
	 5pMelUVmoe7LJFBRww1aYHh4fFjQiiyMYaOOVyAxxzOHNqOLMPbDLS6Nilv04wGeuv
	 8QxS6KQ8s16HQ==
Date: Fri, 16 Oct 2026 09:55:01 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Critical PwnEscape Linux Kernel Vulnerability Lets Guest VMs Read Host Memory
Message-ID: <rxO2C01vBaWRrehdvSujYcBvec3oFHeVR2wqy3KyQ_2arVAGmbE-UPcVmBPKAOicRDjS9sy22KWQZ__Z3RrcqzH87VEzLOqwZ9bF8JI8o90=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 7f397198dc3c66e4ddffc0bb740839e447f7a648
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Critical PwnEscape Linux Kernel Vulnerability Lets Guest VMs Read =
Host Memory

Good day from Singapore,

Here is an article which I would like to share.

Article: Critical PwnEscape Linux Kernel Vulnerability Lets Guest VMs Read =
Host Memory
Link: https://thehackernews.com/2026/10/critical-pwnescape-linux-kernel.htm=
l?m=3D1
Date of article: 15 Oct 2026

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
Government-Induced Schizophrenia, Government-Induced Health and Medical Pro=
blems, and Government-Induced Extreme Poverty for the Past 20 Years (Govern=
ment Persecution)
Why is the Government SOOO ADAMANT, INSISTENT AND PERSISTENT about maintain=
ing Absolute and Total CONTROL over all of my Android (Linux) phones for th=
e past 20 years???
16 Oct 2026 Friday 5.55 pm Singapore Time






