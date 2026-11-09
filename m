Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234517;
	b=Xcqec8+WbUxIn+/ZRzcXuvbCqrpQObRDtD0r09QCotrTOtnbNW/raS8QExOd0dKDndV3
	 K7HYh55KxEEqWUIw+WDe+LynxoAeshVh7jqJkzh6CvYazO60zARnOxqNFL3FdAaBBW4pk
	 muWe+VCqTCRt0IlJPwKMm02UBPYU5w0cpFPdejdV86kOw983aACyxmaL9b1nbnPgS8Hjj
	 0fR90rafHQK7A6b2D0lurIfE29JxYRCiesPmqQs3kzDVlxIAVwVb6Lr6xgW/uM8WlhKJA
	 A9g0lu4j/7aLs6ZIjWaXgq86bYSn/4r4ip5aivWDk0iTa8/HFcaioglP3b0tVLYdjBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4mPPXH3aJnZxVYx37Wxl7Lr/b+DLAle+zs+cy9uzIU4=;
	b=U/nJbn1y7M3f8Q2F2iXvTSx0SDqELDUMniYEYwIXPGut/AwFgyKgnwm64kUo9LqB5gxP
	 8uPfpQqVpnBwyX0+sVW5UApfNU+mrNrsGIKyy56pUWR/UV2KMmvlO5+2vbcMNpZQSN3gj
	 yzMrPCS5hJ7r90JDy+nPviTKTR6Foh08x0Ukp5OkW3BNbZxY91066npANOqbE7nnfe1X1
	 P6W8DmldB7v4hlMCUXiGOiFMkK45C7soqhWn6unWonoLUKd/LLzO8fxfUNHRjyYWqHN1K
	 bP+Wf7+e7ygGtYKRxh4JnvNCjqqSoyBgPWP5AsbVHbp9JpiTVHg3GHFHbsqrt0C4gUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=QToSrRLd;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA80B606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA80B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=QToSrRLd
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so533882b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794234515; x=1794839315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mPPXH3aJnZxVYx37Wxl7Lr/b+DLAle+zs+cy9uzIU4=;
        b=QToSrRLd4t7HkK/8/o4zJPpEAuQS72r5AsdEqGxsfs3VQep2BS+ODfK/0F7W3Z1rc/
         tBbwNxS+IXjBBrpvsaLMbhTj+SAFf8+iPVMYOibtHJhgTg9dnW3tuVGfbA6BgqcFUscx
         84KtGfnFSdWbppCe9hBZzzxNj7c/tdZTvLFdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234515; x=1794839315;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mPPXH3aJnZxVYx37Wxl7Lr/b+DLAle+zs+cy9uzIU4=;
        b=lKNpllsNwPcx2+oCIeax1XAx2EpuC2Nk48FkeCIYumW6qTQAHm4uASgBXz5I/VA5dF
         h+20I6j0bVFnHRUSWQH0AWQ8+lhSsep2aMX4X+zDAlectuZnXTEEfRvVQfqMzAEPnbXo
         kdcxePKWl9CTDFcC9ehJBCT3r4fl940fDSt0nxR5BcQSvUPL6ymtS8NjaKdkwHlAPhyM
         tm0hS1wAOBbjNt82JBJ/4riJEJ9Kgqif3HSDtmFWwuTNzAaRYvQn/COvxqd9/lc0ngHL
         vXEB/eaPT7o2zmv356E9YX0DjvGR1QAkSCJnDGlHawthUoGKkrz/1V65gi7fcZYABUWr
         BePA==
X-Forwarded-Encrypted: i=1; AL+hErH5HaQA9gOvVnn48PZxdCOwEB9qa2zTQTuqffH/5NzH+x8Pxbhds1XuLvRFdeqDWeBgvL3xxU4cZTLAtvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wlF4z7fmz5S2oJ3RMUPiQnNuztmM0wp+ei55Si5MzCyeDLAcZ
	e1XBlz2Ok5494RQJK9a6AhIIlYA13xoUz30rGmiirfHjDDkspPB7RnE0TYeNDIZbbw==
X-Gm-Gg: AYBFou22OkJ1LJhgMvdHhi2RRzvuV+T1m8pGWleoR5SuMkan2Or+dDsAiyNEBKbxMXg
	JEO+EtWFIpqtV2Ma9ngWDyRHcoy36e2E0JFgs0EfNOPDSTvPcTrxZN+1zeVCj5m+m2LXYw5W771
	FQQqsncjnj9eDSnOUAu7c2Oak8bK3e/FZ8p2A+B85qIjargp/+RTrwADU8Wk/6qbgy6qusM0dip
	OXVWBxQvzZAcYhKJdF0w/axzZAvUx99KHAHdBoijc5i5SCFFGlG05B9ZmK3rmBqsexMqIpD/Cuy
	fRbzzCWtUTCTXf4atoXsH7LVOKJwSA0iceOTnckI7MNVgPfFu6Xz8Zp81mKWQUm9j+YIIff/9Pm
	qC9Ihw0pU94BTzHrXFQVl6M39MplfDbCZ3lSElOzEn/SbsP711WcSpFgnUxhnqZoyxrsQXE5gTe
	BaC6uGT0v2eNDIvyFj194tWyxzX2oUP9TTRVGQMvXjrR8GYSu+nHrJnK+R4z/UN6UWno7BROxUL
	384hwNBIfwN3WmKATLRHpNNbGGkx0iCr56TXnnj57yUVR6KD5vOOT/hVNhidBOG+q2LSElHtGzu
	cfiDJRAEvxqJuatnrvwJ8H96OAtGiCdd0vweBfOnrpOF
X-Received: by 2002:a05:6808:1495:b0:4fc:3dc7:66af with SMTP id 5614622812f47-5681432edb1mr2821350b6e.10.1794234514790;
        Mon, 09 Nov 2026 06:28:34 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-56813e56700sm4463564b6e.17.2026.11.09.06.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:28:32 -0800 (PST)
Message-ID: <5a2b5e08-c33b-4513-8457-b8ac21563121@ieee.org>
Date: Mon, 9 Nov 2026 08:28:31 -0600
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
Subject: Re: [syzbot] [greybus?] [usb?] KASAN: slab-out-of-bounds Read in
 gb_svc_request_handler
To: Chandradhar Kumar <chandradhar.2003@gmail.com>
Cc: syzbot <syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com>,
 elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <6aec63fd.5f5735a5.290c1c.0002.GAE@google.com>
 <46a139a9-198c-45c1-b41c-521def10a0df@ieee.org> <au8s1_tIBa0mpTSL@TheRealOne>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <au8s1_tIBa0mpTSL@TheRealOne>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 8:17 AM, Chandradhar Kumar wrote:
> On Thu, Nov 05, 2026 at 08:08:01AM -0600, Alex Elder wrote:
>> Here is what I see happening at the beginning of gb_connection_recv():
>> - If the connection is disabled or offloaded, return immediately
>> - If the size of the buffer (passed in as the "size" argument) is less
>>    than the size of an operation message header, return
>> - If the 16-bit size embedded in the message header is less than the
>>    size of the buffer, return
>>
>> In other words, after these checks, we know:
>>
>>    sizeof(header) <= buffer size (size)       AND
>>    buffer size (size) <= size encoded in the header (msg_size)
> No, it does not verify this, it verify:
> 	size encoded in the header <= size (buffer size)

You're right, I misread this.

We don't read the header unless size tells us the entire
message ("buffer size") is at least the size of the header.

And then we ensure the buffer contains the entire message
(whose msg_size is decoded from the header).

But if the size encoded in the message header is bogus
(and in particular, smaller than the header size) we
have a problem.

>> Therefore (transitive property), this is true:
>>
>>    sizeof(header) <= size encoded in the header (msg_size)
> So, the transitive property is not true.

Agreed.  Thanks for explaining where I was wrong.

> I have sent a patch for this bug which verify the msg_size and header
> separately, which fixes the out of bounds read.
> patch link: https://lore.kernel.org/all/20261106094303.55158-1-chandradhar.2003@gmail.com/

					-Alex
> Hey please review the patch if there is something wrong or there are any
> other way to fix the bug.
> 
> Thanks.
>>
>> And it's not possible after these checks for this to be true:
>>
>>      header.size < sizeof(struct gb_operation_msg_hdr)
>>
>> or put another way:
>>
>>      msg_size < sizeof(header)        cannot hold
>>
>>
>> It surprises me this would be missed in the AI summary--and I
>> fear I'm mistaken.  If I'm missing something or wrong about this,
>> please feel free to say so.
>>
>> 					-Alex

