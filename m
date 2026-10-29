Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284106;
	b=bZabqf2bevKHDVswT33w/3eQrmu56VLybFRSV9DjjYkjrp4++QD9HxwX0qMOeZ/MDN0Q
	 63CiWougYW+0hqm+VfK8BI898svju19hKDsR92kjHHWc9TbsTFqloXX65fZ4HAqVFoqNy
	 hGr1fOu1/ZEsxsV+NKwSwk0feB6W94s3EBa2c34Djg/VeBYN82VGWhItW4x4T0xWTSBOZ
	 h/8stTA6ylrI/RPgXGpQdeymJEWFSCdnswFNZKp8FriBR75Xbd53XD+hgT3kGaL8LSDPU
	 Nnpmq/4zzK4Z3HuDOw7pD5KGp1dXfW/sUO2bOhD1bfa+jdr8tBoecbY4RYIOOX+j68A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bpV5gcaWSkWHUEBL8Okr5cQ7G/7G2sdwutpL6bB3z4g=;
	b=Fl0KoDpz+YpfZPRwwuhRcrhA7fWg4wNr0IvdD8fZsVmstbLtrDMECbvKWIPq/eXz86tf
	 aztdKZbgWdA9EYjzyKPHLrfLL79Jxw9ywi+v8qOp9QKpK/zi1k7tIoEI+uwdR7WwhB8Vi
	 z+4QIu8Xmbx0RcjAbicRWfbJ8i/spRam3SnzTlSonf1nrQ0wmA7fviU73ataNN3BgKr8+
	 amG9NBOAl0bHE6+vX+T+hYhjsW6GLaZW1c3wqOAj2FPTy9BHRJuiS84c8StCT880bapU5
	 /AqfiUpzl91VgdrQb+OHv4J1aicmLbabgBlDeL4R/XrnN4L30MXLissiSBWocdQhrvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1D6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C1D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso4077808eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793284096; x=1793888896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpV5gcaWSkWHUEBL8Okr5cQ7G/7G2sdwutpL6bB3z4g=;
        b=YTQt+RsKeGeqRm58rExDSoJf1LlAzH2oCnoB6dsZh2p3RdPDyv9eA+0gM0Q85L5gGY
         ASaci6PrkVxZ3D/x7UoZwLVV28Ezj2rrRKeMUzCK0JLVJEyzFG6MowICYMIDIVMf9V7n
         ga+WGghQpE4yEid7EUHieMjIWXqyp9DoCi9XVTo6S8/ztLQoEiYRbcvjC1rEATl/+4PS
         C7cdu01VIPpXC/ii8r5aGm1fQfw4TP452dLvUx8P74DYmM0ELrjlITCYY6OL90tSKQEB
         Lji+omTSPYgsxilVbQb/RXl/wWRGfMoW+KASWpqnxwyrcKJxhvG+bquhbw0KgCuR5KZN
         B8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284096; x=1793888896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpV5gcaWSkWHUEBL8Okr5cQ7G/7G2sdwutpL6bB3z4g=;
        b=hwt7sEQeUWI3cefn+w/J2EIkN5t1fYr62cl751Z+pMopO+3dduARFG8yYgI8WokdvC
         bLwiR+9QH9Qp9C1VpVXdR6FUObbZ3eWX7YrjbAuDQqYGEYyUfBFwnTSXRUKapI4w+/lR
         qRFaOopmMM6EvvWbTheetN7TFkufonPG4cdASZWb3oACwZl/TiR9luQyLa0NubAyMSse
         uN6J5euKyqJew6/pgnMG0u6UxiQC+N/L7hgW16KA0ld8+1iCaUnQwqilc80xWJHhZwlH
         g69hB8m5i9g/K25LrnmnMsumdvrdrdtMmzs/qoCYbTtDZV6DIik+417Alk0RSytEwu/Z
         mgew==
X-Forwarded-Encrypted: i=1; AKwUvBz6/GaGC+nRfhvJatsojStWKoEey09J72evDKAhlX1v11xaQapmxiISt64m6/tb9mL3JMctu1eu9sguWuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL89Rv9ziduhGyGpM6CAK+Opu77Vq2PVTeY6Csuey/TKg84WS5C
	SoV8uROhRr05uwC1XnnLFwoeG4YBr8joSMiKKVzKblJNSW3WbPidVw2vbaBQZQ06Vy4=
X-Gm-Gg: AYBFou0vRIf8ZnpwRTblnq+VmAfQdnJBaYOR3N3HxGSMlotgDIGdMptJCeMlADfqK/p
	kiIMa886rq8ZRv00J9MLBhw/ajPWcV6KDCUxIpFlYL7WpMRxwX+7+5E+bO547IKvoWAxjo/NIVg
	hy6zfstKnDpkrOBsAOTDXqhvdAImcI8+6aLZ62e1sOIlu/Z3GT+bSyjk2/sjSp+EQ7uoAk8PnKP
	tON3LMekdBcxZLPYZW0HcoFwqWn/EDFCzc3bfx4K5AJGEx3fkRiMyJYvUJob/mL2kUVe9n4pquN
	fcxlOp0HQ46bQqddV79PWR5XgY70rYwJTEvk8ry2MXh4tI4tAQrZitjFBWUG4FDie3g2/umo3t0
	ShE48BebKV33EzHHL9m6MIzYtk1jhroxMgpKHUDaC+NU5t1ZLb4bwxL4gWiXMNYePztXJn+tBdu
	DdAFwGJYRj5TqNwSAVlmg1IWGgyz+bVNPHg2u7CKP1PE+85l7eKJjg79lLt+dF2Uo+alCsdyQ3B
	6Fv8tS5Riy+ozBN4IqT4NrLWV9JqetYpXmxiKnq5EmTBJI0rGfLi2e3ZSXq6Dm1TZhORjZW+Z1j
	VpFcMZj0zJLDmOsaB0+ge6hLI4mBvymRTWgB8gmPhyYqfERPOTs8NXr8y6ASxsltTjICn2oTYZq
	A68hPqJIDSmeC
X-Received: by 2002:a05:693c:62d2:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-36a1ffc5574mr8656318eec.2.1793284096076;
        Thu, 29 Oct 2026 07:28:16 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23951e00sm22271573eec.20.2026.10.29.07.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 07:28:14 -0700 (PDT)
Message-ID: <3fa26fac-5317-4c09-a181-c9c15e124972@kernel.dk>
Date: Thu, 29 Oct 2026 08:28:13 -0600
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
Subject: Re: [PATCH] io_uring/napi: fix list use-after-free on PREEMPT_RT
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Anvik Loitongbam <permissiontogallop@gmail.com>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Olivier Langlois <olivier@trillion01.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 stable@vger.kernel.org
References: <20261029102244.141621-1-permissiontogallop@gmail.com>
 <502f31ed-dd70-469c-b433-577ccee36c3f@kernel.dk>
 <20261029094842.58dc252d@gandalf.local.home>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261029094842.58dc252d@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 7:48 AM, Steven Rostedt wrote:
> On Thu, 29 Oct 2026 07:42:09 -0600
> Jens Axboe <axboe@kernel.dk> wrote:
> 
>> I don't think your analysis is fully correct. On PREEMPT_RT, spin_lock()
>> should still be an RCU read side critical section. __rt_spin_lock()
>> calls rcu_read_lock() after taking the rtmutex, and then
>> rt_spin_unlock() drops it at the end. There's even a comment on
>> kfree_rcu() callbacks in there too, it should not be able to run until
>> napi_lock is released, which is post the loop.
> 
> Good point.

If even the preempt rt people can't get this right, that's a little
worrying :)

>> IOW, I think this patch is unnecessary - there's no bug there. The list
>> safe change could be done as a cleanup, but it's not a fix.
> 
> I agree, it should still be applied, but as a clean up and not a fix.

Sure, like I said, as a cleanup. But would need a resend as the
analysis in the commit message is entirely wrong.

-- 
Jens Axboe

