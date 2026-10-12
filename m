Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6332931EE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812944; cv=none; b=rkmm+QOBwqp5bN/v/mssfl1pTl3Ozwa6bNr98h2RuUcx3CVOrLwV1YJMcfcMRDYbDzs98qWhzXwxnCKorpqZAps/GqQCPLzYyd3QNmitowkWUiMCP85caY2hF87nFEY28r0lQV41HwC2ztwoBN9qFN7FWM4SzcyYkDrZgHfx/SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812944; c=relaxed/simple;
	bh=rGWBxA5Leg7jRIZfZqhjk4LTRA/0KXbi4AqEB9RQjHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQO+Dtd1HiiZksKIqESp94qhMaf4vHTJe/zLF7NI5bnCHJ3TWr3zPvQsspopcRYM1FgCKSp890QoRxbOEyhNn5j0qFMLtQ4ctAh220kJBYcXOfQd/JM87Y6OM9GrpZM/9ODAZsFzqMncSFXZ/01QJIDODfTLwLcaXEEyhL/M3dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LU9eFgS+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fY1z1iBQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LU9eFgS+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fY1z1iBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791812942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsrdtBORkwTwhqxArtXou9zZU6guyDnY+FE3EhTpPw8=;
	b=LU9eFgS+xPI+bPpKVvmQlyBb+Hs9h8qO7lPNNRsoxpmRgC6XCM6w87De1YNHbgYEUpLlHM
	u/86/5LlbcM13qJvnrFpVqzT1Q20XkvSQmpbLsW1W8v+X6vBvTs1uJGN2moTwPx+T7VnGQ
	cONzkvKX18DM5f6n9u5WiDUFtzCm+FQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-NIMa5gWhOyCHTcoidfzBhg-1; Mon, 12 Oct 2026 13:49:01 +0000
X-MC-Unique: NIMa5gWhOyCHTcoidfzBhg-1
X-Mimecast-MFC-AGG-ID: NIMa5gWhOyCHTcoidfzBhg_1791812940
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a021b1b561so15377555e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791812940; x=1792417740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jsrdtBORkwTwhqxArtXou9zZU6guyDnY+FE3EhTpPw8=;
        b=fY1z1iBQVyeWuK0tpzTMsipqRnXMoR8HUA/YN5L4I1GuUWrx2ThwCUZdWcN9dgcPeb
         vEU2m8BLoxsFw5omnYtnFqEeSq5KKQIXtPtRDOC1VyGjhAve4dKe7UA7CbOsC1wWRgQ1
         Il0MulZ/oPfK1FP4pqIuc5LKV+UaB7iANk6Of2/Kid7ap/0l9+FIgNp3fhrX3xkArYjY
         doMchNb6HxEsOeEY67XjalRWucSydFksHb14UOHkI06xjfHdCSkuz8HA6/2XqRIDxd5y
         888WQTQcnCOphn8rmu9dyYKP3CEPHvX/OSJWwZsWog61I0Zf748U4Dv/x9tl8wBcDBxj
         z+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812940; x=1792417740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsrdtBORkwTwhqxArtXou9zZU6guyDnY+FE3EhTpPw8=;
        b=DVUdM6AF9aTJiHYcOIBuaKxF7a/rniO2hjoSdxAKV7tRFVoYtm00/yaHRO5yFK9PI6
         eXheKloQHPjdMqH+kWc0enEZehpMHPyjFuvh04PlWrTJwhwfb1vbDZY4rtPJeq3tCFJo
         iqWCyQPlxTQCJkyOTnvovrpISblCwK1KY963qlikXn8eztqPEhgA981bdHHJgUcajTbI
         JOk53w1c9Z3KMd819T+uV2IQ/w3ynVR+3Dmhobixg/fNm6Z34buuBTix5QCKQqdEM622
         GE1/q6dpL9G1ouXWftv7+ZDBzKLOHSpKODJ5SlTC1hGRp+m1G1C+B7WpVRTzE0T4UkXv
         gphA==
X-Forwarded-Encrypted: i=1; AKwUvBwGICy1TcGn8a/c/6aCuwtJwt2Tbe6l6NIudUVEgGmMUgN29081N3EaaEozQJH1b9wq6kR35z56r2PBdcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3ZOoQZ9JxAQRFyvCEb0NPmDCoLg+YyjwUMFcstumWGZkVzkbB
	AUFfbLXUFz2TAHUnoJ2KN+jlvn59xETzcPgWl++4qegQ+U02UhtWOJ0H95tlEPVqVIVgup+Yhzc
	LSa7e2Ah5x/NFKLKUb3nS37KRiRdlh3bMJAgaf2GiK6CIZjaU5f1i+yqhe1V1mBm7Yw==
X-Gm-Gg: AYBFou2zKJwGegHFWeYa66ZLv16c2AKkUcKRGz9/Pu+ngQocSnD12CB7deHEjt6dQlk
	lAnuoIHA7SDkYPpfWQLZlQMonVs1CQZNL9A38I5xY81XBH/FdsW4D5PqNxoAvIq7gXGJPUH6eck
	YNvmF+ODYbjl5u1/bbMF1S2o+aWlueiTriLwd4PveXRrQGq4qmc8CqVQ50De650P2TBZxZxecbg
	gsNEA6R+du36q7S6x6zJDFASSpR9jfx/Sj8BPkpGV1tdq7EXZVUCzFtwSfkd0MTJ929dK7O1F8o
	rOvfu0QDvoxpnsEZ8TMvqjiYK1X9MjjRmBLkutfN/sDnK+zh3yLn8FtQtpJRHkfIdRBfEMY6RdZ
	spZOt8/yUY8DlQYW/3gJK8lxzY2WRWya9v2GJCahGgLmSBTqIw/dmxRYSemA=
X-Received: by 2002:a05:600d:8488:10b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4a190780997mr116146195e9.31.1791812939707;
        Mon, 12 Oct 2026 06:48:59 -0700 (PDT)
X-Received: by 2002:a05:600d:8488:10b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4a190780997mr116145785e9.31.1791812939169;
        Mon, 12 Oct 2026 06:48:59 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm399106975e9.0.2026.10.12.06.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:48:58 -0700 (PDT)
Message-ID: <833b5ef9-eda9-4c15-85cd-29202e0f87ca@redhat.com>
Date: Mon, 12 Oct 2026 15:48:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: devmem: check uid and netns in
 net_devmem_get_binding()
To: Kaifeng Wang <kaifengw@google.com>, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, almasrymina@google.com, edumazet@google.com,
 willemb@google.com, davem@davemloft.net, kuba@kernel.org, horms@kernel.org,
 sdf@fomichev.me, bobbyeshleman@meta.com, kaiyuanz@google.com,
 linux-kernel@vger.kernel.org
References: <20261005210403.3206872-1-kaifengw@google.com>
 <179141784973.434549.3492874220530662715@kernel.org>
 <CAKkY-qOKHkuPfMk+1vhQjRymPKcG5P69CWFLYv46Xp6BiTXO5g@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAKkY-qOKHkuPfMk+1vhQjRymPKcG5P69CWFLYv46Xp6BiTXO5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 23:40, Kaifeng Wang wrote:
>> Could this break existing devmem TX users whose TCP socket and netlink
>> socket have different owners?
> 
> This restriction is intentional. NETDEV_CMD_BIND_TX was made
> unprivileged specifically so that an application can bind its own
> dmabuf directly and transmit on its own sockets without needing a
> separate privileged helper process. As noted in the comment above
> netdev_nl_bind_tx_doit(), bind-tx is meant for the caller to transmit
> "on their own sockets". We are not aware of any userspace workloads
> that split bind-tx and TCP socket creation across different UIDs or
> network namespaces.
Still there is slight possibility of breaking some weird setup, so
I'm going to apply this one to net-next.

/P

