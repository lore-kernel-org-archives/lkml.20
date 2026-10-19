Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90B04E8E15
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415082; cv=none; b=n/cG5GVJMuIQmG10y7+teGHNE6SqP5buWFsVzidAZRaoQqa9aVLjRYo3Vic+/B26ppALIjju2zCM3Z7WQIYvKHJIMhq6JwnLidxPPMqVG2rDwaqYvbQqcXOUK/oIBDX7vp1jY+dvpquhoDglzQsYwHEa8qSQihz2ylVfU+t28c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415082; c=relaxed/simple;
	bh=ypi3osWI8gP8xyKWXAity7kWnhHwA/VpXlB9i/wvPi4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=PwB1MAFMSrWZOeisqkWEsB/dR2WMHMq2nTdrYHEdmdjV5Po/+03V1BHxbSEv8T9T18faIO6sJEQFFOiglq9kFtQaufYNSoj4B0g0g1InCl584a+vJmhQgYTUx5MFWVj+7f6YU6Q7/hMip5hMyhdwD9de11TWrMyk67RM92sUO0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zw2Ro5NT; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zw2Ro5NT"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91b8b456dbeso28723976d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792415080; x=1793019880; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ypi3osWI8gP8xyKWXAity7kWnhHwA/VpXlB9i/wvPi4=;
        b=Zw2Ro5NTFeqeRpPaUDiAoqDBBEVA4vrR/egIYDXbODNDfzxRKXaLD1RJK11z0W2Nfo
         v4ChuE6+1Sfi4K+VMqUl/ZYJB0btqAXli5pJHKqFcJ5+/uVwztEMPyj+J7yGeSc02FBk
         C6CLlRLhQJl0jM8HTwn917o5vL1wfF9ZSDi+dhXi+InmnwfjUMcBIiA70sapE8VxKTcE
         fF9GSx6VUK6IsUY0dHiKY4mYq2w+na9GwH3Hpjy1mWZGcO69wec5JKb27RNOnTs3sqsM
         01rhQF+lRKg5rrHh7r063fn0ukbU+Iv3/sufzKGp/PEF1gaM6y90GfQ/oOuPO+W+XT/y
         jCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415080; x=1793019880;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypi3osWI8gP8xyKWXAity7kWnhHwA/VpXlB9i/wvPi4=;
        b=QW8SpIaSCVi2gml9xLRS/mCVqU1hftmmnAJdzjOorM+s8lHBuiMpUaGRCCCfhAqwN4
         FYNpj7OteSZojgcG41dzV4m3E2FdRQk5QmkZ2wXwTTJpJht9TEgGDEKbpbH8OkmXcmoH
         884IoYNi0uJ1AhB/5CkWFGUH+tzsRu9ETYxA1H7rvPs+aJNTs9E8a4sb8b6HYGKyTkIa
         qXq7N9C/Gqp3c4JEUUQHIDeE6e4eFpXQAleazZ+wxaQAWPt2SuVbKuQ+f7UC6ocDDbJu
         hBOEz1d98/K8nZmuOqYUf+fzhj0GVx9mvSQfdVs9euJgTxwG/KTvS/6TNS+XAU+ggk7g
         PPDQ==
X-Forwarded-Encrypted: i=1; AKwUvByXR++Exxle3MzuGODd/0oi14G+U5aWEGshKTaIPhoeRdW6j5WT5lBRitK3NB6HX+mHj5ZAsvqCzMecybM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQzL6P6FCbnWIGkI0LZlIdVkNccewXbT11dERBi2wsySmKKq7s
	+koZ3fe8KnvsrohUKLqXKZtknSoq2m2NzMn1H+OOGvvpyv5owIM5YX3S
X-Gm-Gg: AYBFou2GyVg+Pry6VicUfqhhOZDzIAKW+aF+7DvDBJl0hotqvUn5ute/lzz27l6hfiD
	qz2rzN7/YcI2G2RsjCgdfn/zvRUyr8buCRDqu5/8amdjcSqNwynIo2QM1GKafDLNrqmE/BeXdsZ
	WBpPLCGCss4U8FAiqRHg0qfA86e41kjJFozJPwXhgw+e/aevw4Y1MHz1Lr9lmkOmDOxZ87XWGMM
	mnsy/+0HXhr/xFdR0nIBoG3vfOESrw6Y4GH2hyxn5mlEMcDm1GM54Y4Pw52dOBjKX4QpI6RxLo4
	nsPppN1xR5lDr5Sa3eJCK0VLAG0ihEFPAw7hDS+cKM53ruL0scZGPMKgpg3DUt607ETBM5UCggX
	p1nDaMjAWFzmxbkM4Znz3XhlvtU+jyyuqpUX6XTaAUvqJJiGapBs61YxHYdvYyxkk0/BuaQJ/68
	FAWYYdUyVWhC37n7y/GayJ/QjdKgu0MuG+NkB5WOZ0TcZTUkExkorEee7Y1F0a+LPAn7rzeRwjH
	kM=
X-Received: by 2002:a05:620a:7119:b0:93e:fc4e:c490 with SMTP id af79cd13be357-93f29cf1c9bmr1378673385a.15.1792415079619;
        Mon, 19 Oct 2026 06:04:39 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f3cb855a0sm328418385a.4.2026.10.19.06.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 09:04:38 -0400
Message-Id: <DM8U47F4MNK3.2V54CCQ9YTNBY@gmail.com>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>, "Daniel Zahka"
 <daniel.zahka@gmail.com>
Cc: "Alexander Duyck" <alexanderduyck@fb.com>, "Jakub Kicinski"
 <kuba@kernel.org>, <kernel-team@meta.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Paolo
 Abeni" <pabeni@redhat.com>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Jesper Dangaard Brouer"
 <hawk@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>, "Stanislav
 Fomichev" <sdf@fomichev.me>, "Eric Dumazet" <edumazet@kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next v2 1/4] eth: mpnic: count packets, bytes, and
 drops per ring
From: "Daniel Zahka" <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261012-mpnic-counters3-v2-0-8afba81c2d5a@gmail.com>
 <20261012-mpnic-counters3-v2-1-8afba81c2d5a@gmail.com>
 <20261016220930.i32JEcqe@linutronix.de>
In-Reply-To: <20261016220930.i32JEcqe@linutronix.de>

On Fri Oct 16, 2026 at 6:09 PM EDT, Sebastian Andrzej Siewior wrote:
> On 2026-10-12 05:04:34 [-0700], Daniel Zahka wrote:
>> Keep packet, byte and drop counters on each Tx work, Tx completion, and
>> Rx completion queue. Report them to the core via the rtnl_link_stats64
>> interface.
>>=20
>> Rx completion queues also count errors. Frames the device marked with an
>> uncorrectable error are counted as errors, and frames that fail for any
>> other reason are counted as drops.
>>=20
>> All packets cleaned from the TWQ during mpnic_flush() are counted as
>> drops, though completions for some of them may have been DMA'd into
>> the completion ring between the time mpnic_poll() last ran and before
>> mpnic_wait_all_queues_idle() returns. This is done for code simplicity.
>>=20
>> An RCU approach is used because ndo_get_stats64 is not called with the
>> instance lock.
>
> Why do you have the two mpnic_base_stats and fold the stats into into
> it? My guess would be that on stop the counters are reset and you want
> to preserve the stats.
>

Not sure I understand. I think you are asking about two things:

1. Why have two mpnic_base_stats?

To avoid a separate heap allocation that can fail. Handling an
allocation failure in the ndo_stop path when doing the aggregation into
the base stats is tricky.

2. Why split stats into base stats and per queue stats, and why reset
the per queue counts when the device transitions down?

This is the way the stats in netdev.yaml are exposed depending on the
'scope' request attribute. My reading of the relevant kernel docs is
that the per queue counters are counting events for the current live
queue, so it makes sense to reset them and fold those counts into the
base stats when the interface is transitioned down.

>> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
>
> Sebastian

