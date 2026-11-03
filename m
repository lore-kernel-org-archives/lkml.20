Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715234;
	b=Igx34S6gZpfwrMq5lNVs1k3G8va7kXriwTFk1ufOXlasLdS4iqxvsbt+7XDJUJ0Ci9ad
	 WnN4atgiK2TGlwqD8PRQ+yAIxXzLL11/dkQq1mraDm1li59VIsvcNdQDtr6qViwAzTRNv
	 d9D5eoVCwa+vPM8jxyS481/CqF3kyCvNRF8+ImRIPDJ6CVAjT1SAUjuqmdBGKB6XQEq3M
	 a5E1qmx+us0NrIL3Q3Qx8FuL2RgT4vZLTuzAf4Ra7AbKuFpwsPDlhNRgsLBV9/w1ZhIPq
	 kt0fh/2P+Hq3iEqIUle5s/21bel34CVu9pBRecg3cok5eF9U2/+oCzqDH5GcoaLziuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715234;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XVx1I1BAZHH28iV5zivj82AtwmqyL72xeO8t00SbIII=;
	b=gSjKFxnYOj/QNkusfzJ0IeOX3Ld1cHTRKkU9PjHGMzcBjNXaB5tnhMnj10Co+iQ5NGtK
	 AL6BClSgroN+JOSZhO/1iS22qsTEAZOoH78KFHf1s2W5YCFV56saPN1U8aDQFswLbEfCo
	 k4Yoct7qouTOPClm5PelK0h4eAA59vRRoiFV8y9hDUJhs796rozd6k3iv7C7m18bs7fet
	 NhJYNViC0JxSGo6jn7EEa3RbYSIcs2UUz+/iJ2KrwYkK5dZtqbVjYkqzpMxfZAP0A9v3F
	 7uptnlaqekU7ubDYQZMztZE/kmPNCnE6fBiD0kRG8GO3fKcY6Z702fEnJI7GYXaeJQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TtqHjydb;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AVQjKBA1;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344F8606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 344F8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TtqHjydb;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AVQjKBA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793715230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XVx1I1BAZHH28iV5zivj82AtwmqyL72xeO8t00SbIII=;
	b=TtqHjydbmamDVjJ1zrJuz99NaZtZkIBTnf+TLS5dwN1ZVqQCN3iUiq+2jYgSt82kZC214e
	xrvI7XnR3Jc/wb6lSWrSYGjNGwH5F8YuGNf+Rij7jmpW0PzMEsV3X3nSlKt9C15auluPSw
	2AJlM2NZkpurOqM6hVyKNQug4zA2tRs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-_MbJWeaOORq_HbJyDHfDHQ-1; Tue, 03 Nov 2026 09:13:49 -0500
X-MC-Unique: _MbJWeaOORq_HbJyDHfDHQ-1
X-Mimecast-MFC-AGG-ID: _MbJWeaOORq_HbJyDHfDHQ_1793715228
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0c896d05so3599542f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793715228; x=1794320028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVx1I1BAZHH28iV5zivj82AtwmqyL72xeO8t00SbIII=;
        b=AVQjKBA169gUofMYoGO/GaCNAEe/QzKNwVBrNO7GBtMqBtvImftjx1cbGwTyNvWBql
         mWUaMvK/O4H7J1Kn85BnLrXYLiElLeqT1dxNj/YacPyiyOXBoDdEqIcRcuiclkPuvKG3
         P9IfR0q9rCuY355Hi9vQPeXpQpxm1tkk6YnrYM+H4KdvYXvt8E9Cw3Et2B1CzojdR4DT
         /B2AvFQE0MW0GZpgIdrFLe0qagDY4wAz6GULGhwcFRJkJ1KAOwuv+Mbf+ggscTj3hEk/
         hH2W6ZbT1nhrZkdS1C2vW2SES4pLxjBSMfZ8h7amydZvPJs6WijkAgO5LMqpjmQZFfKF
         u8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715228; x=1794320028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVx1I1BAZHH28iV5zivj82AtwmqyL72xeO8t00SbIII=;
        b=xGD1yfCo4f113TYlbtSJKLrX8sCQ/yDqlwWojSWPXwc6R+QlyeDDSg75whsKmUp5BJ
         noeAvKMvyozkLotg5ovYkAccBvjFaLf6odvvVPORGrCsTBTqDYxJxMgW457IA/Y1s71Y
         PtmCcqOL3iVE+k5098XtWcbqp1lVNwLEF/9ucROc7qcvd177GthnkZMvVaqV1wCjEO/C
         jqGOnzZn1w8nFdZNXCdZzMQIDyrGNrqqldRF6sdVPSFBJsnrHR4oFhOMAaLmRkh2hBLR
         wRiaysOakdjLFqZgkBkepHxxRGyDNG7X+/KG/ocNUJKDVCHmCYbmNP8AImLXVjQurhfZ
         djPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWvMr/paidCiaUpW0DTsdhRjTWtZFBCxUecn2x5WAwSq7kMXTjprpBTHDuP/bMfvLgrDs50y33fnHsBJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qu2sIp0l6dMxmgu/eeqe2MmEtDp6LX5kAzIQDc0f8BunaYJMp
	YoMf3e/+zvGelbpk9C6kYJEoMfcD1aFt4P9KAiH6rLF8FEj97G4iYa4/0Mvtr59pecTjUlleVol
	SZyWZpXKHPrlQUP1+iR5tZae0kv0xwf+xAaoAo2UFDTWXzWBv0HkubwhztkODRGgmdQ==
X-Gm-Gg: AYBFou07d7GO3mnJPZIy6oWvi2nof5bve8PYFwHKpdzmGyVZ34nsVOe8ary3mROuNcT
	JevoK4nOFp05ICTt650TnqCtj+fW8NgHot6CuTHmG4E/EqyshXrk238eXUSaF578VTjQd42Bupl
	ya6JIGwLtjSCjACbZhrkrdoV+uGUloXI4mfjD0JUE9ES4LrbgY5yQmeTMja7nHSmAQ3btDDLV2P
	Znyy34G3wOup62bdCMzfl1CBfxLwe+m6bcN5vymXgCE83/3fY8C6l08stBDlvXVeISL7/zgfHZY
	6FBUp3Q3GruZFC2llDCa/oEe+xosdgf0+2HgepP7rHMJvZHV9fvhVKxHLjgYRuRJGGBTB6HNBe0
	5WQUlSVzjPwuFMKHItU/m9McjKvR1V0EdIk68aEwRQmB8NstNoni/whFFS02YCUa7DhgstGala5
	WEucOJrc+Xfq/zg80YHFGExOanxPRuLvhzjON7vTWkwNw=
X-Received: by 2002:a05:6000:40c7:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48e6e5016f1mr30505647f8f.25.1793715227755;
        Tue, 03 Nov 2026 06:13:47 -0800 (PST)
X-Received: by 2002:a05:6000:40c7:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48e6e5016f1mr30505585f8f.25.1793715227337;
        Tue, 03 Nov 2026 06:13:47 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9a3b1sm27222574f8f.44.2026.11.03.06.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:13:46 -0800 (PST)
Message-ID: <d0b6c2ba-34f2-4750-92c3-fb65c82cbc9e@redhat.com>
Date: Tue, 3 Nov 2026 15:13:45 +0100
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
Subject: Re: [PATCH] vsock: reject negative tv_usec in
 SO_VM_SOCKETS_CONNECT_TIMEOUT
To: Stefano Garzarella <sgarzare@redhat.com>, phind.uet@gmail.com
Cc: Bobby Eshleman <bobbyeshleman@meta.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 George Zhang <georgezhang@vmware.com>, Andy King <acking@vmware.com>,
 Dmitry Torokhov <dtor@vmware.com>, virtualization@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030064428.73930-1-phind.uet@gmail.com>
 <auSIGIZctLp1oOhf@sgarzare-redhat>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <auSIGIZctLp1oOhf@sgarzare-redhat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 13:09, Stefano Garzarella wrote:
> On Fri, Oct 30, 2026 at 02:43:50PM +0800, phind.uet@gmail.com wrote:
>> From: Nguyen Dinh Phi <phind.uet@gmail.com>
>>
>> The timeval validation checks tv_usec < USEC_PER_SEC but not
>> tv_usec >= 0, so a negative tv_usec makes the timeout computation
>> wrap into a bogus value, later tripping "schedule_timeout: wrong
>> timeout value" instead of being rejected.
>>
>> Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")
>>
> 
> This blank line shouldn't be there, maybe it can be fixed when the net
 > maintainers apply this patch, so please wait their comments before sending a v2.

No need to repost: I fixed it while applying the patch.

/P

