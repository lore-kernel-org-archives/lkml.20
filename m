Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576522;
	b=rYmqDhjM7xcsntw800QnNOiZRWkf4AEfYNeITm65LvxNgXiFAPzd5kES+2Egz2q0UInR
	 vqy7Plj9WaEoLB5hhrKdEqEWK/M+b6bsAwsCWM0wEjql+VElTTkXG5Cg68bxTzWMTl/kQ
	 Yt4HPmH7kpKKicJvhpl6eA0Pr0zAS+Q6jXd/cwoDNqKJT5dWUE/fiHL9KNMhYn4f2u04m
	 lw8vlYLSO/bx+6j4JCTKAk+4XZt/8jZyWtfWRyMxDChHG/X5Vx0KWvOsuVcXaPQ6OJiZD
	 oziGGMdBbTslFthkVeZH1og+Q3popdK9KTq9IY1c0b3GTdKNBnZJFjzfttNT3TeyIyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=C1+SIWfzCXJB1MpMylXxaOBo3TNVuyiUO/P1v/2SLdM=;
	b=SpNL3RyU3Es3V6iGmN6RHO2pGSs7ylESp8373hOPsZ46uIK/ipwYaH2vPjgeVaFHRaaG
	 0xyNj49UTpTCZ55lnCtiXsyddRBJiy7/xbz4DCDJkLlJvlvyLoFwtPtrxjw6z+x7HjX8d
	 T92vZlI+5bhJ8ezf9iPQ54P06uNzowANzBUrk5KDKO1KBfXtQEPoOMjukiZh2O6S4JjM+
	 K1qg/KHWZ1KF9NTIrRmZPjtGzpnvao42GRLfiXCNd7ssIvLRqACppH1zQGUz8Eqt1VcXp
	 ZyhoT8Z6s6vVXanJZ+7X5Fqf+pFlrs+6Mo/Ja+Q9puFC8IOyiiwH2XuQnltS+ONK3kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q3H9j9je;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB208606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB208606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q3H9j9je
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so18074615e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793576520; x=1794181320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1+SIWfzCXJB1MpMylXxaOBo3TNVuyiUO/P1v/2SLdM=;
        b=Q3H9j9je1yPbLIVWbR880iwsnG0sVK+LP+AG+6AcdXeCy/kNy93HvwQGA8xsO8q8PT
         6PfQ7fV4r4qvnOmvAVYI4T3uKape+t24nLMcZYhDg8MiRnQYChDoD2Q2B+ibs7ydle6g
         DhP0OET5DSiNBHJgx6ngNZ/XGMgi6QqMfXis3hccLK7sOMAn4UalF9Oi06pBAekIUyF8
         gEX0dUCS/KwiRu6LurM++zqZ2fN4mDu4IzD0ThtWxtPsm08QzLB74Cy4s8f27fb9omoh
         KB0mgahtcjhoUMbgR7cjcWwZK9KMv1b4G1OELNKhGYpfSfmqiKYoW8psMo6RM1r6CntK
         0ArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793576520; x=1794181320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C1+SIWfzCXJB1MpMylXxaOBo3TNVuyiUO/P1v/2SLdM=;
        b=1RVvSHtze+O2xj89lnXVekCYj6L4eNa2RZQ0MJs4m+QwCRF9TLhRFlUuDT15iIDZV6
         riR5csT56rAeIoeRe+0un/6ZVTucevCcR9giHhVXJ40Mlikn6+aHkobacZBay4luQ2Jh
         xzTdP4UakKUkytiKIRGcu4F9c+oLzHbqgkKMM/7ajKQVSM12gcVGknVXz8iE0F4OhV71
         cQ/i9FnS/odXOGfpjxrJrYCLdzPfAMpmqpu91dpKTOonWZ9CgkmRbAUWt4QSHy6dWNSs
         OKK8aNd9mQZvBUA6eoDQvId4ZrXZQ9NCIjebCzjzzqVLPb0lxoRGpvxqsjxMpqlmn2c8
         owmA==
X-Forwarded-Encrypted: i=1; AKwUvBwrN4gY46WEsRbMT9WUZEOWfjTT0riEckGyyDs0/FmJN6ANZt7eHP/K2CfjVpqBhMJhCmo/Qf9lRESO3SU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgi9GXpP3qQgjsUZIkeRGm6YqaQFuYiT+BOvfO8SWTmKfu/PtQ
	BXoSDthp9JF5W5e1EF7MGORAVsThwTJJVqazjvuKJ9MgUTI3lLM3zRz/AIS6hZn/pIAc5fGjzap
	o9HGvoiM=
X-Gm-Gg: AYBFou1jkh5yuRI92gNoJyzVHwzKtW8JYCZpFcqxlK64FY2i4fhooRGEfAoCor8Fr6y
	MhX4b1VwQBNfHqVaWugOmqXZfyVhXth87YDGuFXGueSJHEtMKHuyoiO9z6sDirFUCy2II3N8dEz
	kfEVL8aUXHM5eVVmihLYtQCjvUHXguC0jnWbcqDM7mVzHtVBfgz6OcFDALuRqAXfM7wy16GWW1f
	9spRNWq7C+2EGLQIfHsYL7OjfRrA4LyOP2gaNwEgcBPFAE1aZ75v9ZcDv7xXn5fQvP9+XFIJX0e
	GKDZMoBD9lNdSIP0dyn1ENINgEQzcsZDQxjv/qbG7yaY4TMcyeCWgh7Vg+pJPDGrjREzShCalMq
	eOQKjAJRa5qbjDhXeEmYvhkZsNRpSXL1390lvJ24uzmFSGarMHbNxqJ1p9uwgcKTojkLx3mCY85
	qBIgQGpWvqDxEYCRKf0G+cGXnmOCxmjRjk1VhZtiHcmy+Q1PjJ/h4EAf2C/b6hcj2txkLSedrB5
	EijTP3SG7o8MHifuTFyzFFRKV8tAkdP4GQyN8wHdrn7EqP3WR7zBOgm010N4qO/vvygzANkU3Z0
	zwOU5bMuXUNCymTvq0BCA5XQ/+zXwuWHjZBSC5BVa9YlR3LjO8BrawGp/YjKvw3MDzsbVg7Y7vO
	dJyIl6gGgu5/Wjql9ko8uBIrLA4WCEoPJX8I=
X-Received: by 2002:a05:600c:c171:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4ad739eb30fmr119552675e9.20.1793576520276;
        Sun, 01 Nov 2026 15:42:00 -0800 (PST)
Received: from [192.168.0.219] (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm193425745e9.4.2026.11.01.15.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 15:41:59 -0800 (PST)
Message-ID: <67c159d6-5e19-4873-aadd-e536a12ec3c4@layalina.io>
Date: Sun, 1 Nov 2026 23:41:58 +0000
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
Subject: Re: [PATCH v4 2/2] sched/uclamp: Use wrappers instead of open coding
 UCLAMP_FLAG_IDLE
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org
References: <20261029131354.11030-1-qyousef@layalina.io>
 <20261029131354.11030-3-qyousef@layalina.io>
 <auSuIMloNE_R2T8z@scheduler.schedules>
Content-Language: en-US
From: Qais Yousef <qyousef@layalina.io>
In-Reply-To: <auSuIMloNE_R2T8z@scheduler.schedules>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 14:57, Kayra Cizmeci wrote:

> Looks good to me.
> 
> 
> Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Thanks for taking a look!
