Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641940;
	b=wEFwPZNYU+7F4wHPwT76b8xcBbGZyGwLJ6uqV07q90YlR1Bvrl0tgQXR21CqAGqfIzcA
	 zgE+IoUzGCtdZJaeIlMLJN79HOwP7+Qwdky2kyp53O+wb6ghJoJv29I+N2ysIfXMT3fZH
	 jRUZJ8BpeGrioPDWmc+njUppMKJoS2IkQI2UeQpz2nvRXlSDaLZmNE6fd9jU4gTnFHvjD
	 TJOmQCx28Urgj+q0Vyk8slVxbyNpP1mIpDVo5zBtp1weKEwmynkpzLCpzwZ0/nL+pPJlV
	 EQ755WVemf8nFNrt1Glsx40Cdlla5V+RWNt99o4IOB5W48IyeWAnKBu42wUjBYxSfNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641940;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=MdHGsjPh/MNPsqhqozEDhkuZaojExdx2lHXEaEZxsDI=;
	b=Kaiuz/Hrn6EBlqEQJ8nlOLwT3fqGCABySJ5RctQ2M7hldPlP3d2rkbMO+f8VKLlrRFwO
	 A0+jNSFr+PX4ANjKQHJ7BILIeTf4CMMX3Ny1tNqGoHbdTJOTNUvyIT/tc4BUQgtfDboGn
	 swVK6Drv5ugxDKjPkV7phlHMqYXC4clywuXUv0OZTFfsWzndwjVORXdWZbCAzBUiRtvk6
	 Ui0rbjitW6RDTEjanFxRx601Qb8Wx63wrolsGx+WJb6snhNREBSSBhCy6sT0ydVr/neyj
	 cuIcziPH1z8rrGSQ/Z49+MCRXJQAvCgrfB/g3f3k6mfBTPQoq6wq4N1kmZl0RxdHPnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OrjqbeLp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6InlJuWn;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B920606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B920606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OrjqbeLp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6InlJuWn
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794641937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=MdHGsjPh/MNPsqhqozEDhkuZaojExdx2lHXEaEZxsDI=;
	b=OrjqbeLpeWxhXuXdBGINwOME3+iamaq7qBVZBUm4VKn4yjOKDloXj4qD/UN9tIvYyXSNh8
	tL1meXnT/m40MG1pZE9gS5b8uB5Ow10352+7BD4OWIbEXKneTCOmzT0TDzuX8K0CDaRyg4
	KN1EbIpmMPOlxLhdeOLP57tXK3bPScSreYX4f8pkIKBAqLsSf09FCE98eHejrWJziQxinU
	AfGZAntxGDHmdUgLfeaSytpnUS1f2x7A8P+f046m73lmZ5srL/0Gj52HY5QrKOFbHiIoTy
	5edKWxRGQ6WjnbsAE/BsOJ4nwAs9UAIygw7aRJKq91qdAM4rsDWNtXYsaUFLzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794641937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=MdHGsjPh/MNPsqhqozEDhkuZaojExdx2lHXEaEZxsDI=;
	b=6InlJuWn/1TnJKdafzyMF2gKfpijYBQhpWJ/AHYjd2+eNquZ3ik837kK+6VBKjrD1+azNi
	JElvy1v+j0iDhNAQ==
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
    Nicholas Piggin <npiggin@gmail.com>,
    "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
    "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
    Shrikanth Hegde <sshegde@linux.ibm.com>,
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
    linuxppc-dev@lists.ozlabs.org,
    linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/smp: parse_thread_groups() return error on missing
 property
Date: Sat, 14 Nov 2026 08:44:57 +0106
Message-ID: <87mrrbrhf2.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

parse_thread_groups() is supposed to return -EINVAL if the property
does not exist and -ENODATA if property does not have a value.
However, it is currently assuming it exists and blindly calling
kzalloc_objs() with whatever of_property_count_u32_elems() returns.

Since of_property_count_u32_elems() returns exactly these same error
values in those cases, simply return with the returned error value.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 arch/powerpc/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 7a25eaa59e626..58824f5f4c800 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -824,6 +824,8 @@ static int parse_thread_groups(struct device_node *dn,
 	int i = 0;
 
 	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
+	if (count < 0)
+		return count;
 	thread_group_array = kzalloc_objs(u32, count);
 	if (!thread_group_array)
 		return -ENOMEM;
-- 
2.47.3
