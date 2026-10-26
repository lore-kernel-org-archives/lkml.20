Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008653;
	b=A2UqhFTZNrk1PsE1+ipzdVE/6R4rQyIu6AOfNxbQht7Zp9JdVJfqZdMjW6Kso4yXczw8
	 w3hh23Zr7XZqfY0H9wNUrX0mBJ18QiBQT+7Tir7v/+nM+/fsHAIorKPQwbgKfPbkUDJCj
	 P68zsA9Z6z+Gz+O3mtl4Z920V9HP5kf630J6KDldIJq7BuckBee1Er/+n1BX1eJPWt2Jl
	 YjKz0LdC7oTnVG/vl66VauRLLFTluNRWnsfe3W6Yh89HgPOfvTzJ1A5+uf7T02e5J3rpO
	 LWcqXWVEZ4wKdotn8im7iKeSHIXf5J5Bd+Ac3cW+qrN6EDEs6WCj+P4BZeMv2rT272w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:To:Cc:Subject:
	 Message-ID:Date:In-Reply-To:References:From;
	bh=fnwqLbC7jM7fNZjmHLWNEoPNB0R2v/+U/waAYsuTLjY=;
	b=LdAa2LLtcWaufXqR1DaRAodcQRTKhu9/SbPYPDfaILquhl0Gi7AYpPPBmn+SSPQnENhO
	 yGYMJ7/UTjYtfASUMYsdeEYFXuHwu5zbOWWwGr2Mdeq0oZGuYQTfA2opdx/lDDeBzycVv
	 XNLvzg/9GcDyO9YGnEh0RLt9/505rhPp2BLFCts1XwVwOomV95io8bDhKc4pNXs2TM6Pv
	 Peo4arKwA1jcm1efKdTQjfj3ZOpgNHBamzM/BAIlkyAQr1Qxm9FXAqqyF+lQ5dcT7gkVR
	 b4p+yjR9qfSp6+RgoYy35TMeeeuPln0TvPHt3qnKjPFFtc4YspDWBCMZbVxucv2MgtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CszcIJS6;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0B5606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC0B5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CszcIJS6
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917bab38b14so33494756d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008652; x=1793613452; darn=vger.kernel.org;
        h=from:references:in-reply-to:date:message-id:subject:cc:to:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fnwqLbC7jM7fNZjmHLWNEoPNB0R2v/+U/waAYsuTLjY=;
        b=CszcIJS6O/KCIK7WpNqpAHpNanBJp3TkxSHpIi9YbipF74abmLbVLhX19ynNXPMj6s
         HxwW/Z1upLc7BYWvrCylBRiimZv6NZgY1Margqt8YpDneBtLvn8Wu7po8KNvu4YZcKff
         rwBhca18w5jSnXvExmvQwdktwOPKfXy2vyESPG2WVEBFHXsn0SRmm4lGJw9TwqZep2OB
         oWEHUmMcQqDnzSRYt4QuhpOVlFKimzZBB4w9EkHhmsQgR1YLtrK8ASqSPqNhESYXEVey
         qulzTVpoex6Qapis4TsWXSldi5f3pzfOfHaNRKh3yxqKyCTOU+o2vJMoWnUdUamgegGA
         P7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008652; x=1793613452;
        h=from:references:in-reply-to:date:message-id:subject:cc:to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnwqLbC7jM7fNZjmHLWNEoPNB0R2v/+U/waAYsuTLjY=;
        b=OrTP8d9O86wrtaIg5lhRJDL2r9vMgEJc20e7kMGfgElSQpRUXIAo95ZIGa6Hufa2Lg
         zA6RY6UlWLETeDepgt3xacRQNicDtPdaCfxx5duwlCoLu0NW4jAemUd+MN/rFvIsMKdk
         LY0wYoCDkglrwPSAMPaY4TFCXDFjAUa/pg0p1LDB4HDuaZCs0H5rjWLgehrzLsBLO/ku
         /e2c9HF2HMxUg4U8NOL81yCsRT3G+OcWK/YsTMd5iOPRkOJXAXq894PLRODxFbxLkTsM
         heMF+/gXzqbawDAo8+sV/grFG2NRVDm4B0mazyrs74Rgfiuk+BIhZqj8oeNd8wE3XgYE
         caoQ==
X-Gm-Message-State: AFq9FYItnTzCSn17bfTCYLvFFUOo2hlNcmgpldMFkk/BJWXtzuHBs0BT
	yeJli1SHg+mZOvNV2xzNaKkX+vQGeyJTsoZJ7M+kLhTP3NEtUG6B+eXO
X-Gm-Gg: AYBFou1vxTcuncfxwSXiaZF6Hav4EgXZhRfLxcxzOpGlJoPmdG+UfnV+LCRWCRujKxb
	PgY6XU9kYw3YeC4XHcq7lRVRBwkEQDX7sgHwk7iYPOhKtqttmN9KQPS+e+c8Kfg/+rJxgpSDZqa
	IfFM9OFuuotR52b0yIO7hWOVAiLIGBIw4KwapmdE7AmhYibeq0VSOq2tH/JGYbecmLUtirBcedD
	tX4bZ40juAvvV005MhxEzgzJ1mMwiZF48CfolMovrrV21aUOLoUDv0sIZLkyrdaCWIQTiLJUsoV
	eugMZxGzb2wlge5sq/2R2/bp4eK5Jt8XRm49OVrmZvqJPr6aZ9fWInn/eaqnycXIKiDMUtIgIyj
	VWsoXiun9VwQQykaK+hgwVynp59TuhE1CQBrbkqWA9HWhb7JGlVpUnN0L9CsW7iLz4NgW/eU6LP
	7MbIvWTxdizsVDYSj81elNfMONEqpn/e7Sgkm9Lrcic3FLk86HgLIFHrcYgwFnN7yYuWFLcyIGM
	8oNx3i5DVfMHcCiV6u4ta2bqN6W2/o12D/PWTvOqQ+riia9vcyS/aCMYmD+BD6P+/dpsmVwTTKH
	+J1NUQ1bwoag0bvxa5uq4HYcKNAt5cFZ7H/cFQ==
X-Received: by 2002:a05:6214:48e:b0:914:459d:d3c5 with SMTP id 6a1803df08f44-91c48e37d47mr113810816d6.38.1793008651916;
        Mon, 26 Oct 2026 02:57:31 -0700 (PDT)
Received: from localhost ([217.150.74.224])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c54cbdsm67853376d6.26.2026.10.26.02.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:31 -0700 (PDT)
To: Hillf Danton <hdanton@sina.com>
Cc: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, syzkaller-bugs@googlegroups.com, rds-devel@oss.oracle.com
Subject: Re: [syzbot] [rdma?] possible deadlock in rds_trans_get_preferred
Message-ID: <179300864774.19661.11942156119304654192@gmail.com>
Date: Mon, 26 Oct 2026 09:57:27 +0000
In-Reply-To: <20261019015139.806-1-hdanton@sina.com>
References: <6ad51a9c.a6d1a155.34a93f.00bb.GAE@google.com> <20261019015139.806-1-hdanton@sina.com>
From: Eduard Zateev <hackerowskiy@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Hillf,

I tested your asynchronous CMA ID destruction patch from the #syz test
reply on the current upstream checkout at 21a7f44fd076 (Linux 7.3.0).

The kernel was built with KASAN, lockdep, RDMA_RXE and RDS enabled. I ran
the syzbot C reproducer in QEMU with four vCPUs. On the unpatched kernel it
reproduced the reported circular locking dependency between rds_trans_sem
and the RDMA CMA handler_mutex. With your patch applied, the same
reproducer completed successfully, established both active and passive RDS
connections, and produced no possible circular locking, possible recursive
locking, WARNING, Oops, or BUG output.

The build completed successfully and checkpatch.pl --strict reported no
errors or warnings. The complete test logs and the applied diff are
available on request.

Tested-by: Eduard Zateev <hackerowskiy@gmail.com>
