Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676497;
	b=VCwkq73jyC8DDBF8UXwQz9fP25KzIohii/gzLgMaD2UFzwkERJRb5+t/BTUrJF8xh1EP
	 ZDWNZ505eX3ED00tESFKEyMhUbUeEGeci8n7T2uVuxS7Th37/9AizT6lx3cy+doMm8RMK
	 dY1wRlqoLKIAP/2AJhJADOzH4SyzyVFi26CZHms41Ytsszox/baMjB7ZAEOm6lIHUj4sC
	 k5P6FKyxgsN5jNEPIjglNJjJFdypR6eqwtL9p/UyBCHOHGCrr2v4jGx9ZHjutjAqoG87Z
	 bVGYKYa6aqaGFj8NgYGWkt9ISnQ9e8R1FHxrOq0YcnzoyaHv4HwNxZVDDh8/2u87rWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676497;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:User-Agent:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=KieO/cUIAjxhrfiEXimiRoy/ejkQDz3J+h9ldk1OAZU=;
	b=Agk7AHsn76pF20tBnSOqg0BBOfgGvHHPNlACzctyzcIg3RbxRIEGcjQetsoeD6mWImnb
	 psuV7/tEqLajvduZcI98SiUF0K91iQI+An42scAzLok8AGgAPG4fAe/dU/5ovmr7VAaXB
	 P6ng4mHNoHrEmg1dxvw85Yc0NRKIsh7bsuLzym0+KSCiSEx7NOPe0ckhg2/Z1/X8l0kjN
	 csd7rR+r/sE8eY/7O6turZZXoQwIEANOtU8KojpaZYgN3CR8BkouLVp5vrigkfvXK85v0
	 iCm9jRJcC0e0/n3v1EKa9DyBh9NRN/LbeN66Oi1R5NchKrqRRt24Ywb8NrUWy8PQcsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chenxiaosong.com;
	spf=pass smtp.mailfrom=chenxiaosong.com;
	arc=none smtp.remote-ip=95.215.58.15
Received: from mta1.migadu.com (out-15.mta1.migadu.com [95.215.58.15])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C89606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C89606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chenxiaosong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chenxiaosong.com
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KieO/cUIAjxhrfiEXimiRoy/ejkQDz3J+h9ldk1OAZU=;
 c=simple/simple; d=chenxiaosong.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793676494; v=1; x=1794281294;
 b=CbrwygyvtLC6tzycEhi/EiD0pQyUWTI2WpLSEKwEr+ek0tYTBdghqf6HM313lubOhQXvk0Pc
 0pRn2GTd0Lp2lOcToA7q1m2qpwTGxa6aF6JxbhcnCj7RjP+BzBNTbIx4BFxyrfVjisQVaAWnoAm
 /CT3qSqG1AXfTSsMOHW6BZqTdMq4xkMfCeQUbSgJZNF8D3eZZDNT+UVtOV/LUEj7F5EMA/1E7Cu
 +GTDWp/6H8qjJQTIDCw8prsa2QaF/xyAwWdxEkAoqi1NbzvQRL1MpKQIsevy8R4go1SPFL6WF2s
 Ld7Tuq//M5Xy4K6IrXAAciP3KlNa4Ot9pc4IkqDuypCdA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aec3a21a1cec08f1;
	Tue, 03 Nov 2026 03:28:12 +0000
X-Mizu-Trace-ID: aec3a21a1cec08f1
X-Migadu-Flow: FLOW_OUT
Date: Tue, 03 Nov 2026 11:28:06 +0800
From: ChenXiaoSong <chenxiaosong@chenxiaosong.com>
To: Yifan Zhang <yfzhang23@stu.pku.edu.cn>
CC: Namjae Jeon <linkinjeon@kernel.org>, linux-cifs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Hyunchul Lee <hyc.lee@gmail.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] ksmbd: require NUL-terminated EA names
User-Agent: Thunderbird for Android
In-Reply-To: <179367599474.14819.859478551395391125@stu.pku.edu.cn>
References: <179367391951.8187.2063761250230294066@stu.pku.edu.cn> <c02b4586-522d-49bb-87d6-69277b45add3@chenxiaosong.com> <179367599474.14819.859478551395391125@stu.pku.edu.cn>
Message-ID: <B21FE1B0-FF69-4AD5-9B9B-3D0AA4208A10@chenxiaosong.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

No need to send v3=2E v2 looks lood=2E When Namjae applies the patch using =
b4, this tag will be included automatically=2E


On November 3, 2026 11:19:54 AM GMT+08:00, Yifan Zhang <yfzhang23@stu=2Epk=
u=2Eedu=2Ecn> wrote:
>Thanks=2E I will add:
>
>Suggested-by: Namjae Jeon <linkinjeon@kernel=2Eorg>
>
>in the next revision=2E
>
>Regards,
>Yifan

ChenXiaoSong <chenxiaosong@chenxiaosong=2Ecom>
Chinese Homepage: https://chenxiaosong=2Ecom
English Homepage: https://chenxiaosong=2Ecom/en
