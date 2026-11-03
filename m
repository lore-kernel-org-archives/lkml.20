Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.76.212.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671430;
	b=5F/yTh5psOU0+AFF6KgKSPrRgwtsu2vHZi+5ra81U7k0zJRabhvN6iiCjs0K/FBFtyxb
	 JwP80eBWcCrr6LJT0MdfjwVEDBnCttYCR8fWFMgr0opLquiRnsudF6pUVY9xVWC7xo3fl
	 1NDn2c5f20KqWh60FUXVMnRsocZLQFuSWSdY2hxVcYXXfNCfr7BafWEQbHVnLELpyak7+
	 /i41C0FKxGzo9i0P5ESSxMH8WksN9p0rgsXX7lXryGWKRiAFfSfT0PAN8pVzfNgdfEtnB
	 QZRd+1vdqIDdo7IC4x1Wj01xAwJ+bE1LLO16HZnDK/Ww7an+4DOjuLjl7jp72Fp+t3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671430;
	h=Received:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:User-Agent:MIME-Version:Content-Type;
	bh=O+RhHEljv2BPiMQxKLBYGsUSVyhObf/DA3n0OJGfp1Y=;
	b=vo6R0P20rWzwVO6hXTsa0zNmoOIhYynlUK1DvdFhNooZgZaNifp1mbusJla3+b/JrrLs
	 FUB0cCiTxCV8Y7QHwNrpHd/ClGbmlquP+D1PhO2WCM6hNgMc4bgEsf2BREwsU0z/FLYvI
	 9pmq/7y60qmvjn2ufWHkL+QkQVb3YDxrOCT4jcv2V5MsBWacB5/ynbbojv7dWsERXBRv8
	 d1NlcLPBQXv3LLX4r8We7QfSg4QhXtfqHaWw+wky77KqxgGRG5VNflF/aagB7wkzvxqwX
	 L9kqU1fQODTglI62A2xlvGi7HNo8W70w+/1JCHuTdpeB/jbtw1+B6JuDUe9xvb7IgAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=inai.de;
	spf=pass smtp.mailfrom=inai.de;
	arc=none smtp.remote-ip=144.76.212.145
Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF7C606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 25121)
	id 8AE591003FB013; Tue, 03 Nov 2026 03:03:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id 88D0F11003ABD1;
	Tue, 03 Nov 2026 03:03:47 +0100 (CET)
Date: Tue, 3 Nov 2026 03:03:47 +0100 (CET)
From: Jan Engelhardt <ej@inai.de>
To: David Laight <david.laight.linux@gmail.com>
cc: "Paul E. McKenney" <paulmck@kernel.org>, torvalds@linux-foundation.org, 
    linux-kernel@vger.kernel.org, kernel-team@meta.com, 
    Bradley Morgan <brads@mainlining.org>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
In-Reply-To: <20261102163448.3956dde3@pumpkin>
Message-ID: <s2530278-793s-8r51-s5q8-349s35q8159r@vanv.qr>
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop> <4p5316or-75o2-s068-74s3-6q5011o75672@vanv.qr> <6f24126a-7f84-40f8-a297-095b470beb8b@paulmck-laptop> <qnrr9sr7-19rq-6rp9-0oq9-5939r07no828@vanv.qr> <20261102163448.3956dde3@pumpkin>
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


On Monday 2026-11-02 17:34, David Laight wrote:
>> 
>> I can get gcc-17.0.0-20261102 with no further command line options
>> to turn `atomic_compare_exchange_strong`+uint16 into some object code
>> that does not contain a call to libatomic, for sh2, sh3, sh4. Haven't 
>> tried xtensa or the others.
>> Thus, is the patch really needed?
>
>Won't that need a big jump in the minimum supported compiler version?

12.0.0-20210420 behaves the same. I just chose 17 because that was
convenient to try first.
