Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.76.212.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736686;
	b=XdfyjHE3KvfQk2PKRGHD+hVW/0/O0OaE4zdcHyi5SLhtBibKB8iHMwdkHIgmvPczQI6T
	 Vq2ImOAhOcKzXo1El7T2CAksWCiotg4oyS35QVgf6sGgdS/tomdLFuFW0qDiuET2YvvVM
	 hqI9V98yCZaTMGUUtNN1X4DI2QetYGWlxwA+OGYh+Lw2Buu+eBtVW/j+c8B8lJgU7Ka0S
	 lIAY2/ZnGd9ZgHO+KuRADmEPIReOqifdseJZ6X7InpqvlhIygN6on/AZ78x6DOyBB4EZD
	 p/kyHQzXjfiKA9WUtiIktqSUwf0sW6ukWM3bGTS0xDJJMAX1IhdP72HyW5sATqjrysg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736686;
	h=Received:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:User-Agent:MIME-Version:Content-Type;
	bh=lQYCx8yD2h4b58o53kLuuw9nJvL6DUfUOAKn9zbbkfg=;
	b=smZuFRH5EMbre0NHULYEumdNpssxtYrJibbp6047JudlEJeywtHCGi8Cn+Nuu7G0VDZG
	 xNc0FV7qo6okifJR9uJ/UzNOrowtxcTPIC0rWq9aNyFD846W9BUMDoG1/PKuBUHPJRM3V
	 aaTuVdTSRUgGPOVieE2ibg0E/pvCbzWSg1bF1Pg/221LvTCOfUozfbeoJB7JB6J8stPYr
	 GI8ls1UG46pEaPqUfqPq4cjBxs0edDO8bYTdrTu2Zb0g3ZngmStktboO90gVdAV6jTO77
	 unJzRZLkFxHTDVD1Lve1dkXkfY6dPd4aY5XyF1U2GZT0WBygBxIbEpKwI1eRRnLC/Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=inai.de;
	spf=pass smtp.mailfrom=inai.de;
	arc=none smtp.remote-ip=144.76.212.145
Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4BD606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 25121)
	id A36361003E8D87; Tue, 03 Nov 2026 21:11:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id A0E4B1100638B4;
	Tue, 03 Nov 2026 21:11:17 +0100 (CET)
Date: Tue, 3 Nov 2026 21:11:17 +0100 (CET)
From: Jan Engelhardt <ej@inai.de>
To: "Paul E. McKenney" <paulmck@kernel.org>
cc: David Laight <david.laight.linux@gmail.com>, torvalds@linux-foundation.org, 
    linux-kernel@vger.kernel.org, kernel-team@meta.com, 
    Bradley Morgan <brads@mainlining.org>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
In-Reply-To: <ad8358f4-483c-41d3-8fae-e7032c4a5bd7@paulmck-laptop>
Message-ID: <so31o447-8o91-0pop-06qq-92q0o584q8n5@vanv.qr>
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop> <4p5316or-75o2-s068-74s3-6q5011o75672@vanv.qr> <6f24126a-7f84-40f8-a297-095b470beb8b@paulmck-laptop> <qnrr9sr7-19rq-6rp9-0oq9-5939r07no828@vanv.qr> <20261102163448.3956dde3@pumpkin>
 <s2530278-793s-8r51-s5q8-349s35q8159r@vanv.qr> <ad8358f4-483c-41d3-8fae-e7032c4a5bd7@paulmck-laptop>
User-Agent: Alpine 2.26 (LSU 649 2022-06-02)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Tuesday 2026-11-03 19:19, Paul E. McKenney wrote:
>> >> 
>> >> I can get gcc-17.0.0-20261102 with no further command line options
>> >> to turn `atomic_compare_exchange_strong`+uint16 into some object code
>> >> that does not contain a call to libatomic, for sh2, sh3, sh4. Haven't 
>> >> tried xtensa or the others.
>> >> Thus, is the patch really needed?
>> >
>> >Won't that need a big jump in the minimum supported compiler version?
>> 
>> 12.0.0-20210420 behaves the same. I just chose 17 because that was
>> convenient to try first.
>
>Are you also advocating ditching the single-byte cmpxchg() emulation?

There is more?

Please note, I have not looked at the code at all. The patch
description _alone_ was enough to make me ask, such conflicting
rationale it had when presented to me.

I had not planned to go on an expedition to see what gcc would
produce, and was hoping the patch author had done that initially,
to provide a good case for his patch rather than against it.
