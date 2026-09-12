Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4883F9F50
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 17:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789234898; cv=none; b=YGrWpj4EIHL9Nm11F9HAIGytHJJO25jHIFP/5xoEXJBdXikoXhosRSjsAQ4p1NeUQ8VmxvVS9eQSzgznRw2vdSVtxTHVV5Kuwehl6K/5qQ+cafkUujErpCYMxICV0osmFZVX4hmaN73hr1Hkil0xrdI+sG6Zs65SKqxdkx4C6KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789234898; c=relaxed/simple;
	bh=WwdB+ukEtegGwsv+CHfPaA5VNrMqODmWH1XFSPC8TsU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=FfY95uhMBl4EemHN2MoT7dFUXmE5WQ5ctglKzTFc3xMTDjRwYMBlh5ThGmbWllkhdxZSn3hvs+Tp66tYsI9kaB0iaT+tCqenOamFO4ZFu/jBL/Fr+LXRyDx98QDSGyHw4YGiAiF3sGuSiQeFCymjz1a2fuvt1PzRvy2KuLnUWzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=INz7LgxS; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="INz7LgxS"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6bc7a8b4802so2268732eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789234896; x=1789839696;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rf6X63a3owflg9x45ncqhPfrFvxaABmj6y0D/zWTVkY=;
        b=c/iwvQj52SLf1lu7+KEGTxSL7jnwSCTyxtcNvfk7LmTaVKWHuIbXp52uO23cu96Vk/
         eOkkZaD2mjuKdS78ReuTFkCEaQNWCMkHmkM89+0d/C9GU5Y4O3d092o6/Ng5CNLZj5MT
         JO7uDG3QqxCVOwPEl2YOPm78ZqszG6O9OZ29rCOF08oJNNO+4Ffur9TU6Hbi3upidnSa
         2qWeE2B9EbaBWyCV1VFKdxBkHn4muoG1qc+WMewEpv14F4s4sUZAtjejXiVWV7ENV//d
         j+pEhMnpulm+YsnvNRA+Y2hCuJRIZPOu9tsbT32SB0e9VNA5vbLHAWrkflX4B15O1/20
         qiPA==
X-Forwarded-Encrypted: i=1; AKwUvBw2oNP2oT/Kdw1nlqN1EoW2yoqWNUlDJXVmN6NFvLKhd3+hQ+PhgxEMjTsg+l++mWnqCFdm6hEvchyk/68=@vger.kernel.org
X-Gm-Message-State: AFuF++kz5MbiwQpKGSvNGH/E5h5HgMjgsjil14SoXFOYmJtCXM2jSaD9
	1nMgcJYMmtyrhYEpHA/jZplvl/U6m+A39JSXhOrfd1yHcC7n5eARru8h
X-Gm-Gg: AYBFou3ddhcOeM58fZfbFny0PmFAXXzPKZH1NyHdprfuReUhse3wVlxC50kWIZQRrk+
	+JNAStbpITQ9v6YsnzOnESjFYaACU25XEbMIwfOLfM3fsEALajTZu1nFbTRgU12TDfUreseykkF
	FHxM7JvnWTrS+OAEPTBSrZJ6oJVCaGNS0Z8KlSHZf3ntFPG7MRSXqJ8jTQ0NTn/EqjVVNzXr2sa
	4CnAHBssfDoZBs6fzYVC/LcLKJlMRsrwxypb5ucHUMOsJifabpnna6p+xhtzn2MQdlGfi6WS+jC
	y4QlG0Ygr+P02PQfhTlWY82HHfiPco/Ahro4gJ3G5jm/PpoDg6Yah4QzMHPJF/qC5yGNpzw5ptv
	T+nn1fHaXIQ7cXZDqpSYI5mrqqxF6XPD/ZvD72UuGhU6LLzmtGQqvfZ4cPOYaEGfnTKFH1QkIvy
	o75OsUeS0LGyXVMqI8xzoH4ZzneeJ0KUidi427EsTmCX4Gs9IJN12J2Db96uh4dozqwJcLxR3wZ
	RGg6kUarZs5VXyRG4i1oq7NvwkSVVwx/nx8jCkvJ9SZSGMFgFdEt9u++6XR0NvkkhqltFd+M/0A
X-Received: by 2002:a05:6820:5604:20b0:6b7:83c5:fde5 with SMTP id 006d021491bc7-6c0bb1f3cedmr4855066eaf.38.1789234895896;
        Sat, 12 Sep 2026 10:41:35 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c0996dc5a6sm6063572eaf.6.2026.09.12.10.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 10:41:35 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 181FF614C0;
	Sat, 12 Sep 2026 17:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1789234892;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rf6X63a3owflg9x45ncqhPfrFvxaABmj6y0D/zWTVkY=;
	b=INz7LgxSl5imgrkvj+dGIF2TkBK5hTdU1+riBZTI1WABNWSP3oVx1rqL9aNE//Ce6V0jMs
	54U/ObBDcHvQq8EkwcUSZ/L2JOqGh7Mseu03lj6sa/HCQhPXi9uzpInQjZEywRe6ps6M4G
	9SSOY9kOVVxu1OFSya8tYfOwCivhh1oeKfr2+zqqIllXGK3O8CccLrYMZe87sZbDQOPLEP
	G8ZhhxrFuTzaizjRYvAPA6zCfLeJT+oUR0/8iR4CAPmU7A5q8Wm7bFL//IKucf/ta8GhEG
	rUUwt2S9uUJfctL2l62UOQqC6FOq+u+M5VMXYZ2D1mp+LW1HbU+JAGbGYlgkzg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 14:41:28 -0300
Message-Id: <DLDIU0FHU2UY.2SR6QH3U7PYB1@marliere.net>
To: "Jakub Kicinski" <kuba@kernel.org>,
 =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
Subject: Re: [PATCH net v2] selftests/net: Fix icmp.sh race between ping and
 tcpdump startup
Cc: "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@google.com>, "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman"
 <horms@kernel.org>, "Shuah Khan" <shuah@kernel.org>, "David Ahern"
 <dsahern@kernel.org>, =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?=
 <toke@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-16-ge144528849ba
References: <20260911-selftests-net-icmp_race-v2-1-c7458dec9d0b@marliere.net> <20260911174045.76579e91@kernel.org>
In-Reply-To: <20260911174045.76579e91@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Sep 11, 2026 at 9:40 PM -03, Jakub Kicinski wrote:
> On Fri, 11 Sep 2026 15:41:33 -0300 Ricardo B. Marli=C3=A8re (SUSE) wrote:
>> icmp.sh backgrounds ping and then starts tcpdump, with no synchronizatio=
n
>> between the two. If tcpdump is not capturing yet by the time the ICMP
>> unreachable replies come back, the test fails even though the kernel
>> behaved correctly:
>>=20
>>   FAIL - got ICMP response from , should be 192.0.0.8
>>=20
>> The empty address is misleading: it means the capture matched nothing
>> before its 10s timeout, not that the reply had a wrong source address.
>> NS1's Icmp InDestUnreachs counter still increments across such a failure=
,
>> so the replies were generated and did reach NS1. Ping sends several prob=
es
>> over its 3s deadline, so losing every one of them takes a multi-second
>> stall in tcpdump startup, which does happen on loaded CI hosts [1].
>>=20
>> Fix it by starting tcpdump first and waiting for its "listening" banner
>> via slowwait() before sending traffic. Run ping synchronously, then kill
>> and reap tcpdump if it did not already exit on -c 1.
>
> It used to pass in NIPA CI and now it fails:
> https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-dbg/results/819341/86-=
icmp-sh/stdout

Thanks for the pointer, I'll prepare v3

>
>> Fixes: 7e9838b7915e ("selftests/net: Add icmp.sh for testing ICMP dummy =
address responses")
>
> Please don't add Fixes tags to selftest improvements.

Wouldn't this mean that the commit would not be picked up by stable,
creating a gap there?

>
>> Link: https://openqa.opensuse.org/tests/5907626/logfile?filename=3Dicmp_=
sh.tap.txt#line-2 [1]
>> Signed-off-by: Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>


