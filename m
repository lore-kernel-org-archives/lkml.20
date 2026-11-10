Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332694;
	b=CP+R6rNWxB7OlljkN/RP+jtO1xLPxFbfqb6wlb4Hyimwqti68GJNqiVuMNCcUaoynBLo
	 i8AzQX/fl+P/T/idb+4MDUKuTpzKWoMFJkbcyq9d9ngjyAlK1ONmjVCTMYrPOBjbKWyO4
	 O9dgtQpheo2rytrdrXEgG4BzaKno4e6ej58WQrkUY2mHb+dwXn3aFsAy/qZwSCPVxGHjx
	 o4cp0pOghfh5OvEkmsJmjJnyxHm/S+524OiVvwJGNz78x7kFeJKgBSXQCOHLlNf9plH3t
	 nF7GfLIMwBF4a9Q0/1RLzrxeDcQk9EaZcC84Av109shl7yKVZEc+bK93a6u7BVJ+QHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=3b10iqj9NgJm3ESQWec+Z0XHiKgw63wK+Jzo5Ml+tdc=;
	b=PX/lJE8QCM8+5G0HzpzGh2m1K/KSKZ1h2cq0kMwrEeaD0F35i4GpuuvSLAkiPfefOzV+
	 c5bxB8YNkx5215a2gkwIaZbrduxpjnYOTYMoruT5TMAdHH+aNpkxIslio5ynmz/huc2r4
	 fITRX/Hdb5Mzs+7n5uqdo1JpcGOpEFf/Ylj8B+HmQW/myl7osYnyHymEZQM3wabf3SFCj
	 eoNxBq5WTqFijmhV5Fp+JpcJ7HmRDRoIoGbH8yFj/DlZF99xXFxf6s/k73jjCo+ns8ARS
	 Ymo9yEw+sLuZdcM3auqYnIR7UFhsUej5laaZWTMxzuD+zKtbgC8hToHEgGRSbOffyaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QY21QHR3;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FE3606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54FE3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QY21QHR3
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so1382206eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332693; x=1794937493; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3b10iqj9NgJm3ESQWec+Z0XHiKgw63wK+Jzo5Ml+tdc=;
        b=QY21QHR3pDY5puOY/RAbgM75JOeHua8ZTcuC7FM9/JfJ6UebYXCI2E7rq8XBKyXXuJ
         mo540OclIQJ3jdhTXhbmB5qIMj+xuqdC2TOriS7w/S8d+S6/mQwRqX9bYVEopcEae7cp
         8ItD/fflYcoB1j0azPfU60Cq1J1HUYazpHDTNxOKH8X+NAtsdX9jDOcrVqsOcp1/6OgK
         VpipNZGlR3BptxupgyO/tl1PD1guiw6iO2xxeDlfQxHd4iTiLkd9JqPXFN2jgfa+rgui
         XdisXp6oN+mpiffEcDSZQ3j3+hOKBfPO0VsaDdjwmQt9ZIikq2DXO/a8wowEB4yZLqZf
         Rl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332693; x=1794937493;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3b10iqj9NgJm3ESQWec+Z0XHiKgw63wK+Jzo5Ml+tdc=;
        b=gGXUkY0sbGeB6D1ITmomt1LUicsEvfnnczUFI+BRh/mbL5o8l+xjnONtc0Kc0tFlwN
         VNGcz5YhBZUF+Gwhbp3nlbYcC3upqv6/P3o5Phopw8E6LF9Yl4OJfv+IAIwPD0MRRbby
         wA+MHTMt9NL9KAEi/gJaKbSicUMDP+8DDLKkX5DEdZ6XvufS/1EkE5lYm6/2GM2Q5yL/
         0dE1l1MFzUc73/iMtTr6vl2WGjZDONMF2zWow4FcbFFEJaodis/MLTpRXnrqAgB1GCHg
         3P3vBgqTtlWSx8pl+64+obsfFod4hmL8MqDr+K51Oh8KG9kPoTlOymw/0RmQsMIzqWsH
         VIQw==
X-Forwarded-Encrypted: i=1; AL+hErHXu6xaZOjef4pICOdU+hp9fmm0ou7R0PI2fF8d0aUKHNoh0WYzz83pON3kx7EHy2zH/Y8aWw3CmNFBdno=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IiiQoRMWXfRjBBVOXSgRcvOM51JaRXu7J3mYzcoU4ptMWGqGb
	rTmMQT6pwCUM9heG5umYLReH7J7vl9FWJzUWO+zLMKoLKnf/4h66gHK4qDV49h1u
X-Gm-Gg: AYBFou1M9pXMFq0Qfk11N1NWwifACnabqxjyXdYjrWr1xamJZ+fRMCfNXxw1do7casz
	mt4syzahVDYgYzNMpuo8RhUAP731MH361c6rDpxJeCvQIdDudVbc9pbghflWxFK5GZh3nSuJh9j
	jPoU16eLjBzeohFH5+6Mv6if+/raikAaB8qGgTmuJRawlaJvGHOzXtHKkgIB47jtSmsrp3Df+C6
	8oBr2o9ETJRuaOc89xUmtUigbj2xNBXgTFEEiNj3waS9Q8Iyyfca1G0bs06rL15wuppooAG+CmX
	OO0PJqmXQE+7iUPRUHBs0y8yRppTQg3ubkw1xgBLOOSQZyY+i8gg73MuHc2U+HWFGD9n0zgLeA0
	039bgs/9mtJ4J0vTAVcBBltCRHFNRuVRjEv6C3vFP6DhqpHcs1eEmzqO+Vc/85P2ajkIOyoIYlW
	71K3xvvKPTKPOBvxWhALXPxXeyjie/QX82lyc9A6CAOfUI+hpOPx/lQmR/xyVjVKXVsGrGIkIZn
	s5smzMOdkh7B+o3zQskSxWsbYpcQnKIBVfPXXjcL2+x9x1tEucoUlje6iGRb80bXi7sko4xIXqh
	3b5jdnnHlTUy9aVR/mqV1vaNGsEGlKTC1K85Hu4qRcDr+4vW3OBQnNmVynA=
X-Received: by 2002:a05:7300:d211:b0:372:eab:d700 with SMTP id 5a478bee46e88-376831886c3mr29671eec.1.1794332693343;
        Tue, 10 Nov 2026 09:44:53 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:7392:6aad:f285:27fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm7305349eec.0.2026.11.10.09.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:44:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] char: xillybus: use stream_open for stream semantics
From: mdshahid03@gmail.com
To: Eli Billauer <eli.billauer@gmail.com>
Cc: mdshahid03@gmail.com, arnd@arndb.de, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <24af6daf-dbf3-5c47-beb7-077c4473ea7e@outbound.gmail.com>
References: <20261031083610.87160-1-mdshahid03@gmail.com>
 <24af6daf-dbf3-5c47-beb7-077c4473ea7e@outbound.gmail.com>
Date: Tue, 10 Nov 2026 23:14:34 +0530
Message-Id: <179433267498.153154.14194819686748523311.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi Eli,

Thanks for the detailed explanation and testing in HW.

I think, if this doesn not break anything and using stream_open()
for these channels more logical ,then ,it make sense to use it.

Thanks
Shahid.

On 2026-11-02 12:23 +0100, Eli Billauer wrote:
> Hello Mohammad,
> 
> On 31/10/2026 9:36, mdshahid03@gmail.com wrote:
> > Use stream_open() to mark these channels as streams and
> > disable unnecessary file position handling,
> 
> The difference between stream_open() and nonseekable_open() is that the 
> former sets FMODE_STREAM and clears FMODE_ATOMIC_POS. I made a quick 
> test run, and FMODE_ATOMIC_POS isn't set in either case. As 
> FMODE_ATOMIC_POS is clear, no lock is taken while updating fpos either way.
> 
> So in effect, the only difference is that FMODE_STREAM is set. Frankly 
> speaking, I'm not sure in what way this matters, if at all.
> 
> > allowing read
> > and write operations to run concurrently.
> 
> I checked that with hardware. There's no problem running read() and 
> write() concurrently even before this patch. And I don't see why there 
> would be a problem.
> 
> It seems like FMODE_STREAM was supposed to replace FMODE_ATOMIC_POS 
> somewhere back in 2019 with Linus' commit 0be0ee71816b ("vfs: properly 
> and reliably lock f_pos in fdget_pos()"). That is where he urged the 
> move towards stream_open(). But then he reverted it with commit 
> 2be7d348fe92 soon afterwards.
> 
> All in all, I don't know what to say about this. Calling stream_open() 
> does sound more correct, and nothing broke with this patch. But I'm 
> generally unhappy fiddling with code unless it fixes something.
> 
> Regards,
>     Eli
> 
> 


